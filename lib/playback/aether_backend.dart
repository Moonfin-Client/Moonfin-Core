import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:playback_core/playback_core.dart';

import '../data/services/book_parts.dart';
import '../data/services/client_certificate_service.dart';
import '../data/services/log_service.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/loggable_url.dart';
import '../util/platform_detection.dart';

import 'aether_video_processing.dart';
import 'apple_display_cadence.dart';
import 'apple_secondary_subtitle_controls.dart';
import 'device_profile_builder.dart';
import 'dolby_vision_av1.dart';
import 'engine_trust.dart';
import 'known_defects.dart';
import 'letterbox_croppers.dart';
import 'lossless_audio_bridge.dart';
import 'playback_network_stats.dart';
import 'server_transcode_capabilities.dart';
import 'subtitle_fonts.dart';

/// Playback backend driving the native AetherEngine wrapper over a method
/// channel on iOS and macOS. Serves main playback there: video, live TV,
/// music, audiobooks and offline playback. Unlike the tvOS sibling there is
/// no native player UI: Flutter owns the OSD and the video arrives through
/// the `moonfin/aether_video` platform view.
class AetherBackend with SubtitleDelayState, AppleSecondarySubtitleControls
    implements
        PlayerBackend,
        SubtitleLoadingBackend,
        SecondarySubtitleBackend,
        PlaybackNetworkStatsSource {
  AetherBackend(this._prefs) {
    _eventSub = _events.receiveBroadcastStream().listen(
      _handleEvent,
      onError: (_) {},
    );
    _prefs.addListener(_syncAllowUntrustedTls);
    _syncAllowUntrustedTls();
    _prefs.addListener(_syncEngineLogForwarding);
    _syncEngineLogForwarding();
  }

  static const _control = MethodChannel('moonfin/ios_aether_control');
  static const _events = EventChannel('moonfin/ios_aether_events');

  final UserPreferences _prefs;
  bool? _engineLogForwarding;

  StreamSubscription<dynamic>? _eventSub;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  PlaybackNetworkStats? _networkStats;
  LiveSeekWindow? _liveSeekWindow;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _isSubtitleLoading = false;
  final _subtitleLoadingStream = StreamController<bool>.broadcast();
  double _playbackSpeed = 1.0;
  double _volume = 100.0;
  double _audioDelaySeconds = 0.0;
  bool _completed = false;

  int _textTrackCount = 0;
  bool _tracksKnown = false;
  int? _activeSubtitleTrackIndex;
  Map<String, dynamic>? _pendingEmbeddedSubtitle;
  Completer<void>? _tracksReadyCompleter;
  List<EmbeddedCaptionTrack> _embeddedCaptionTracks = const [];
  final _tracksChangedController = StreamController<void>.broadcast();

  // A book downloaded in several files plays one part at a time on one book
  // timeline. While a part opens, state from the part before can still
  // arrive. The engine can report playing after a seek while paused, so the
  // paused flag follows pause() and resume() instead.
  BookPartsTimeline? _book;
  int _bookPart = 0;
  Duration? _bookPartOpening;
  int _bookStaleStates = 0;
  bool _bookPaused = false;
  Map<dynamic, dynamic> _bookPayload = const {};

  Duration get _partStart => _book?.starts[_bookPart] ?? Duration.zero;

  bool _disposed = false;
  int _loadGeneration = 0;
  EngineTrust? _trust;
  Timer? _audioDelayDebounce;

  // A torn down session stops pushing state, so the last buffering value the
  // channel sent stays latched and the player keeps its loading overlay with
  // nothing left to clear it. This does not resume playback, it turns a silent
  // hang into a failure the manager can surface.
  static const _stallTimeoutMs = 30000;
  Timer? _stallTimer;
  bool _stallSawPlayback = false;
  int _stallSinceMs = 0;
  int _stallLastPositionMs = -1;

  final _positionStream = StreamController<Duration>.broadcast();
  final _durationStream = StreamController<Duration>.broadcast();
  final _bufferStream = StreamController<Duration>.broadcast();
  final _playingStream = StreamController<bool>.broadcast();
  final _bufferingStream = StreamController<bool>.broadcast();
  final _completedStream = StreamController<bool>.broadcast();
  final _errorStream = StreamController<Map<String, dynamic>>.broadcast();
  final _remoteCommandStream =
      StreamController<Map<String, dynamic>>.broadcast();
  final _systemVolumeStream = StreamController<double>.broadcast();

  @override
  Stream<Map<String, dynamic>> get errorStream => _errorStream.stream;

  /// Transport presses from the system controls while music plays on the
  /// engine's own Now Playing session, which audio_service never sees.
  Stream<Map<String, dynamic>> get remoteCommandStream =>
      _remoteCommandStream.stream;

  /// iOS device volume changes, read without touching the audio session.
  Stream<double> get systemVolumeStream => _systemVolumeStream.stream;

  /// Fills that session in. iOS shows it in place of the audio_service entry
  /// while music plays, so without this the card has no title or artwork.
  Future<void> setNowPlaying({
    required String title,
    required String artist,
    required String? artworkUrl,
    required bool hasNext,
  }) => _invoke<void>('setUiMetadata', {
    'topTitle': title,
    'topSubtitle': artist,
    'artworkUrl': artworkUrl ?? '',
    'hasNext': hasNext,
    'hasPrevious': true,
  });

  Future<T?> _invoke<T>(String method, [dynamic arguments]) async {
    if (_disposed) return null;
    try {
      return await _control.invokeMethod<T>(method, arguments);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<T?> invokeAppleSecondaryControl<T>(
    String method, [
    dynamic arguments,
  ]) =>
      _invoke<T>(method, arguments);

  @override
  bool get isSubtitleLoading => _isSubtitleLoading;

  @override
  Stream<bool> get subtitleLoadingStream => _subtitleLoadingStream.stream;

  void _setSubtitleLoading(bool loading) {
    if (_disposed || _isSubtitleLoading == loading) return;
    _isSubtitleLoading = loading;
    _subtitleLoadingStream.add(loading);
  }

  // The engine has no single read-ahead limit in seconds and no memory
  // budget for the buffer, so the ceiling and memory rows stay out.
  // `bufferedMs` is zero on live, which has no duration, so this reads the
  // engine's buffer frontier instead.
  PlaybackNetworkStats _networkStatsFrom(Map<String, dynamic> map) {
    final ahead = _toInt(map['bufferedPositionMs']) - _toInt(map['positionMs']);
    return PlaybackNetworkStats(
      bufferAhead: Duration(milliseconds: ahead < 0 ? 0 : ahead),
      activityBitsPerSecond: map['networkActivityBps'] == null
          ? null
          : _toInt(map['networkActivityBps']),
      rebuffers: _toInt(map['rebuffers']),
    );
  }

  void _handleEvent(dynamic event) {
    if (_disposed || event is! Map) return;
    final map = event.map((k, v) => MapEntry(k.toString(), v));
    final eventType = map['event']?.toString();

    switch (eventType) {
      case 'state':
        final local = Duration(milliseconds: _toInt(map['positionMs']));
        final opening = _bookPartOpening;
        if (opening != null) {
          // State far from where the part opened still belongs to the part
          // before, unless it keeps coming for seconds and the engine really
          // started somewhere else.
          if ((local - opening).abs() > const Duration(seconds: 2) &&
              ++_bookStaleStates < 20) {
            return;
          }
          _bookPartOpening = null;
        }
        _position = _partStart + local;
        _duration =
            _book?.length ?? Duration(milliseconds: _toInt(map['durationMs']));
        _buffer =
            _partStart + Duration(milliseconds: _toInt(map['bufferedMs']));
        _networkStats = _networkStatsFrom(map);
        _liveSeekWindow = map['liveEdgeMs'] == null
            ? null
            : LiveSeekWindow(
                start: Duration(milliseconds: _toInt(map['liveWindowStartMs'])),
                edge: Duration(milliseconds: _toInt(map['liveEdgeMs'])),
              );
        _isPlaying = _toBool(map['isPlaying']);
        _isBuffering = _toBool(map['isBuffering']);
        _setSubtitleLoading(_toBool(map['isSubtitleLoading']));
        if (_isPlaying) _stallSawPlayback = true;

        _positionStream.add(_position);
        _durationStream.add(_duration);
        _bufferStream.add(_buffer);
        _playingStream.add(_isPlaying);
        _bufferingStream.add(_isBuffering);
      case 'tracksChanged':
        _tracksKnown = true;
        _textTrackCount = _toInt(map['textTrackCount']);
        _applyPendingEmbeddedSubtitle();
        _embeddedCaptionTracks = EmbeddedCaptionTrack.listFromWire(
          map['closedCaptionTracks'],
        );
        if (_tracksReadyCompleter != null &&
            !_tracksReadyCompleter!.isCompleted) {
          _tracksReadyCompleter!.complete();
        }
        if (!_tracksChangedController.isClosed) {
          _tracksChangedController.add(null);
        }
      case 'completed':
        final book = _book;
        if (book != null && _toBool(map['completed'])) {
          if (_bookPartOpening != null) return;
          if (_bookPart < book.parts.length - 1) {
            unawaited(
              _openBookPart(_bookPart + 1, Duration.zero, !_bookPaused),
            );
            return;
          }
        }
        _completed = _toBool(map['completed']);
        _completedStream.add(_completed);
      case 'engineLog':
        _logEngineLine(map['line']);
      case 'play':
      case 'pause':
      case 'seek':
      case 'next':
      case 'previous':
        // The engine plays one part, so the system controls see its time.
        final ms = map['positionMs'];
        if (ms is num) {
          map['positionMs'] = _partStart.inMilliseconds + ms.toInt();
        }
        _remoteCommandStream.add(map.cast<String, dynamic>());
      case 'systemVolume':
        final volume = map['value'];
        if (volume is num) _systemVolumeStream.add(volume.toDouble());
      // The engine is holding the stream for new credentials, so playback
      // state stands.
      case 'credentialsRefused':
        _errorStream.add(map.cast<String, dynamic>());
      case 'playerError':
      case 'error':
        _bookPartOpening = null;
        _logPlaybackError(map);
        _errorStream.add(map.cast<String, dynamic>());
        _setSubtitleLoading(false);
        _isPlaying = false;
        _isBuffering = false;
        _completed = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
        _completedStream.add(false);
    }
  }

  /// Turns the engine's own logging on alongside diagnostic logging, so a
  /// report carries what the reader, demuxer and muxer saw rather than only
  /// the failure they ended on.
  void _syncEngineLogForwarding() {
    final enabled = _prefs.get(UserPreferences.diagnosticLoggingEnabled);
    if (enabled == _engineLogForwarding) return;
    _engineLogForwarding = enabled;
    _invoke<void>('setEngineLogForwarding', {'enabled': enabled});
  }

  void _log(String message, {LogLevel level = LogLevel.debug, Object? error}) {
    if (!GetIt.instance.isRegistered<LogService>()) return;
    GetIt.instance<LogService>().playback(message, level: level, error: error);
  }

  void _logEngineLine(dynamic line) {
    if (line is! String || line.isEmpty) return;
    _log(line);
  }

  /// A native failure never reaches the server, so without this the report
  /// from a user whose playback didn't start shows only browsing.
  void _logPlaybackError(Map<dynamic, dynamic> map) {
    _log(
      'Native player error kind=${map['kind'] ?? 'unknown'} '
      'recoverable=${map['recoverable']}',
      level: LogLevel.error,
      error: map['message'],
    );
  }

  /// The engine streams over URLSession, which enforces system certificate
  /// trust that the Dart client bypasses through its bad certificate
  /// callback, so without this a self signed server browses fine and fails
  /// every playback. The preference notifies on every change, so the guard
  /// keeps anything but a real change off the channel.
  void _syncAllowUntrustedTls() {
    final trust = EngineTrust.current(
      _prefs.get(UserPreferences.allowSelfSignedCerts),
    );
    if (trust.matches(_trust)) return;
    _trust = trust;
    _invoke<void>('setAllowUntrustedTls', trust.toChannelArguments());
  }

  int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  bool _toBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    return false;
  }

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    final payload = mediaItem is Map ? mediaItem : const <String, dynamic>{};
    final url = mediaItem is String
        ? mediaItem
        : payload['url']?.toString() ?? '';
    if (_disposed || url.isEmpty) return;
    final book = _book = _readBookParts(url);
    _bookPartOpening = null;
    if (book == null) return _open(payload, url, startPosition);
    _bookPayload = payload;
    _bookPaused = payload['autoPlay'] == false;
    final at = book.locate(startPosition);
    return _openBookPart(at.index, at.offset, !_bookPaused);
  }

  /// The parts of a downloaded book in several files, which the engine can't
  /// open as one, or null for anything else. An app update moves the app's
  /// folder, so each part is found next to the playlist rather than where it
  /// was saved.
  BookPartsTimeline? _readBookParts(String path) {
    if (!isBookPartsPlaylist(path)) return null;
    try {
      final parts = readBookPartsPlaylist(File(path).readAsBytesSync());
      if (parts == null) return null;
      final dir = '${p.withoutExtension(path)}.parts';
      return BookPartsTimeline([
        for (final part in parts)
          (path: p.join(dir, p.basename(part.path)), length: part.length),
      ]);
    } on FileSystemException {
      return null;
    }
  }

  Future<void> _openBookPart(int index, Duration offset, bool autoPlay) {
    _bookPart = index;
    _bookPartOpening = offset;
    _bookStaleStates = 0;
    _isBuffering = true;
    _bufferingStream.add(true);
    return _open(
      {..._bookPayload, 'autoPlay': autoPlay},
      _book!.parts[index].path,
      offset,
    );
  }

  Future<void> _open(
    Map<dynamic, dynamic> payload,
    String url,
    Duration startPosition,
  ) async {
    final autoPlay = payload['autoPlay'] != false;
    final generation = ++_loadGeneration;
    final videoProcessing = await aetherVideoProcessingArgs(_prefs);
    // A stop or a newer load that came in during the wait wins.
    if (_disposed || generation != _loadGeneration) return;
    updateSubtitleDelaySession(payload['subtitleDelaySessionId'] as int?);

    final headers = payload['headers'] is Map
        ? (payload['headers'] as Map).map(
            (key, value) => MapEntry(key.toString(), value.toString()),
          )
        : <String, String>{};

    _completed = false;
    // Until the new session ticks, the previous item's end would stand in
    // for this one's position, and a stop then reports it as watched.
    _position = _partStart + startPosition;
    _positionStream.add(_position);
    _setSubtitleLoading(false);
    _tracksKnown = false;
    _textTrackCount = 0;
    _activeSubtitleTrackIndex = null;
    _pendingEmbeddedSubtitle = null;
    _tracksReadyCompleter = null;
    _embeddedCaptionTracks = const [];
    _startStallWatchdog();

    await _invoke<void>('setClientCertificates', {
      'certificates': nativeClientCertificates(pkcs12: true),
    });

    _liveSeekWindow = null;
    _networkStats = null;
    await _invoke<void>('setSource', {
      'url': url,
      'headers': headers,
      'autoPlay': autoPlay,
      'startPositionMs': startPosition.inMilliseconds,
      'audioStreamIndex': (payload['audioStreamIndex'] as num?)?.toInt() ?? -1,
      'audioBridgeLossless': usesLosslessAudioBridge(
        _prefs.detectedAudioCapabilities,
        maxAudioChannels: _prefs.resolveMaxAudioChannels(),
        downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
      ),
      'isLive': payload['isLive'] == true,
      'mediaType': payload['mediaType']?.toString() ?? 'video',
      'normalizationGainDb':
          (payload['normalizationGainDb'] as num?)?.toDouble(),
      'speed': _playbackSpeed,
      'forceSubtitlesDisabledOnStart':
          payload['mediaType']?.toString() != 'audio' &&
          _prefs.get(UserPreferences.subtitleMode) == SubtitleMode.none,
      'dolbyVisionBaseLayerOnly': needsBaseLayerOnlyForDolbyVisionAv1(payload),
      'externalSubtitles': payload['externalSubtitles'] ?? const [],
      'secondarySubtitleTrackId': payload['secondarySubtitleTrackId'],
      'secondarySubtitleUrl': payload['secondarySubtitleUrl'],
      'subtitleDelayMs': (subtitleDelaySeconds * 1000).round(),
      'secondarySubtitleDelayMs': payload['secondarySubtitleDelayMs'] ?? 0,
      'secondarySubtitleOffset': PlaybackManager.clampSecondarySubtitleOffset(
        (payload['secondarySubtitleOffset'] as num?)?.toDouble() ??
            PlaybackManager.defaultSecondarySubtitleOffset,
      ),
      'secondarySubtitleFontSize': payload['secondarySubtitleFontSize'],
      'secondarySubtitleTextColor': payload['secondarySubtitleTextColor'],
      ...appleTvCadenceArgs(_prefs),
      ...videoProcessing,
      'nightMode': _prefs.get(UserPreferences.audioNightMode),
      'binaural': _prefs.get(UserPreferences.binauralHeadphones),
      'loudnessTargetLufs': int.tryParse(
        _prefs.get(UserPreferences.loudnessTargetLufs),
      ),
    });
  }

  @override
  Future<void> resume() async {
    _bookPaused = false;
    await _invoke<void>('play');
  }

  @override
  Future<void> pause() async {
    _bookPaused = true;
    await _invoke<void>('pause');
  }

  // Implements rather than extends, so the interface default is not inherited.
  @override
  bool? get playWhenReady => null;

  // No way to re-open a live source in place, so the manager escalates.
  @override
  Future<bool> resumeLiveEdge() async => false;

  // The engine replaces the open stream's request headers in place (a
  // route whose requests AVFoundation makes reloads at the playhead
  // instead). The server reads the headers before a token in the URL, so
  // the URL stays as it opened.
  @override
  Future<bool> updateStreamCredentials(StreamCredentials credentials) async {
    if (credentials.requestHeaders.isEmpty) return false;
    await _invoke<void>('updateRequestHeaders', {
      'headers': credentials.requestHeaders,
    });
    return true;
  }

  @override
  LiveSeekWindow? get liveSeekWindow => _liveSeekWindow;

  @override
  PlaybackNetworkStats? get networkStats => _networkStats;

  @override
  Future<void> stop() async {
    _loadGeneration++;
    _pendingEmbeddedSubtitle = null;
    await _invoke<void>('stop');
    _stopStallWatchdog();
    if (_isPlaying) {
      _isPlaying = false;
      _playingStream.add(false);
    }
    // The state timer dies with the session, so a stop taken while buffering
    // left this latched with nothing to push it back down.
    if (_isBuffering) {
      _isBuffering = false;
      _bufferingStream.add(false);
    }
    _setSubtitleLoading(false);
  }

  void _startStallWatchdog() {
    _stallSawPlayback = false;
    _stallSinceMs = 0;
    _stallLastPositionMs = -1;
    _stallTimer ??= Timer.periodic(
      const Duration(seconds: 2),
      (_) => _checkStall(),
    );
  }

  void _stopStallWatchdog() {
    _stallTimer?.cancel();
    _stallTimer = null;
  }

  void _checkStall() {
    // Only a session that reached playback can stall. A slow open is a slow
    // server, which this must not fail.
    if (_disposed || !_stallSawPlayback) return;
    // A backgrounded session is torn down deliberately and reloaded on return.
    if (!_isBuffering ||
        WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      _stallSinceMs = 0;
      return;
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final positionMs = _position.inMilliseconds;
    if (_stallSinceMs == 0 || positionMs != _stallLastPositionMs) {
      _stallSinceMs = nowMs;
      _stallLastPositionMs = positionMs;
      return;
    }
    if (nowMs - _stallSinceMs < _stallTimeoutMs) return;

    _stopStallWatchdog();
    _handleEvent(<String, dynamic>{
      'event': 'playerError',
      'kind': 'playback_stalled',
      'recoverable': false,
    });
  }

  @override
  Future<void> seekTo(Duration position) async {
    final book = _book;
    if (book != null) {
      final at = book.locate(position);
      if (at.index != _bookPart || _bookPartOpening != null) {
        return _openBookPart(at.index, at.offset, !_bookPaused);
      }
      position = at.offset;
    }
    await _invoke<void>('seek', {'positionMs': position.inMilliseconds});
  }

  @override
  Duration get position => _position;

  @override
  Duration get duration => _duration;

  @override
  Duration get buffer => _buffer;

  @override
  bool get isPlaying => _isPlaying;

  @override
  bool get isBuffering => _isBuffering;

  @override
  double get playbackSpeed => _playbackSpeed;

  @override
  Stream<Duration> get positionStream => _positionStream.stream;

  @override
  Stream<Duration> get durationStream => _durationStream.stream;

  @override
  Stream<Duration> get bufferStream => _bufferStream.stream;

  @override
  Stream<bool> get playingStream => _playingStream.stream;

  @override
  Stream<bool> get bufferingStream => _bufferingStream.stream;

  @override
  Stream<bool> get completedStream => _completedStream.stream;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) {
    final maxBitrate = int.tryParse(_prefs.get(UserPreferences.maxBitrate));
    final maxResolution = _prefs.get(UserPreferences.maxVideoResolution);
    final softwareAv1Uhd =
        PlatformDetection.offersAv1SoftwareUhd &&
        _prefs.get(UserPreferences.av1SoftwareUhdDirectPlay);
    final audioCapabilityProfile = _prefs.detectedAudioCapabilities;

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      audioCapabilityProfile: audioCapabilityProfile,
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      transcodeAudioCodecs: _prefs.resolveTranscodeAudioCodecs(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
      maxAudioChannels: _prefs.resolveMaxAudioChannels(),
      // AetherEngine plays every advertised audio codec: AAC/AC3/EAC3(+JOC
      // Atmos)/FLAC/ALAC are stream-copied intact, and TrueHD/DTS/MP3/Opus/
      // Vorbis/PCM are bridged to EAC3 or FLAC on-device.
      universalAudioDecode: true,
      appliesDownmixToStereo: false,
      bridgesAudioToEac3: true,
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay),
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: PlatformDetection.supportsAvc,
      supportsAvcHigh10: PlatformDetection.supportsAvcHigh10,
      avcMainLevel: PlatformDetection.avcMainLevel,
      avcHigh10Level: PlatformDetection.avcHigh10Level,
      capsAvcRefFrames: false,
      supportsHevc: PlatformDetection.supportsHevc,
      supportsHevcMain10: PlatformDetection.supportsHevcMain10,
      transcodeHevcAllowed: serverAllowsHevcTranscode(),
      hevcRequiresFmp4Hls: true,
      hlsAudioForAvFoundation: true,
      hevcMainLevel: PlatformDetection.hevcMainLevel,
      supportsHevcDolbyVision: PlatformDetection.supportsHevcDolbyVision,
      supportsHevcDolbyVisionEl: PlatformDetection.supportsHevcDolbyVisionEl,
      supportsHevcHdr10: PlatformDetection.supportsHevcHdr10,
      supportsHevcHdr10Plus: PlatformDetection.supportsHevcHdr10Plus,
      supportsAv1: PlatformDetection.supportsAv1,
      supportsAv1Main10: PlatformDetection.supportsAv1Main10,
      supportsAv1DolbyVision: PlatformDetection.supportsAv1DolbyVision,
      supportsAv1Hdr10:
          PlatformDetection.supportsAv1Hdr10 ||
          (softwareAv1Uhd && PlatformDetection.supportsHevcHdr10),
      supportsAv1Hdr10Plus: PlatformDetection.supportsAv1Hdr10Plus,
      rendersAv1DoviViaHdr10BaseLayer: true,
      supportsVc1: PlatformDetection.supportsVc1,
      // AetherEngine demuxes AVI and decodes MPEG-4 Part 2 in software.
      supportsMpeg4: true,
      directPlayVideoContainers:
          '${DeviceProfileBuilder.defaultDirectPlayVideoContainers},avi',
      maxResolutionAvcWidth: PlatformDetection.maxResolutionAvcWidth,
      maxResolutionAvcHeight: PlatformDetection.maxResolutionAvcHeight,
      maxResolutionHevcWidth: PlatformDetection.maxResolutionHevcWidth,
      maxResolutionHevcHeight: PlatformDetection.maxResolutionHevcHeight,
      maxResolutionAv1Width: softwareAv1Uhd
          ? 3840
          : PlatformDetection.maxResolutionAv1Width,
      maxResolutionAv1Height: softwareAv1Uhd
          ? 2160
          : PlatformDetection.maxResolutionAv1Height,
      maxResolutionVc1Width: PlatformDetection.maxResolutionVc1Width,
      maxResolutionVc1Height: PlatformDetection.maxResolutionVc1Height,
      supportsDvProfile5: PlatformDetection.supportsDoViProfile5,
      // AetherEngine converts P7 (dual-layer) to P8.1 per-packet via libdovi.
      supportsDvProfile7: PlatformDetection.supportsDoViProfile7,
      supportsDvProfile8: PlatformDetection.supportsDoViProfile8,
      knownHevcDoviHdr10PlusBug: PlatformDetection.knownHevcDoviHdr10PlusBug,
      allowDolbyVisionProfile7ElDirectPlay:
          KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
            behavior: _prefs.get(
              UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
            ),
            // Auto otherwise falls through to a model list that no Apple
            // device is on, so every P7 title transcodes on hardware that
            // can play it.
            hasHardwareDolbyVisionDecoder:
                PlatformDetection.supportsDoViProfile7,
          ),
    );
  }

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    _playbackSpeed = speed;
    await _invoke<void>('setSpeed', {'speed': speed});
  }

  @override
  Future<void> setAudioTrack(int index) async {
    await _invoke<void>('setAudioTrack', {'index': index});
  }

  @override
  Future<void> setSubtitleTrack(
    int index, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {
    _pendingEmbeddedSubtitle = null;
    _activeSubtitleTrackIndex = index;
    _log(
      'setSubtitleTrack index=$index external=$isExternalSubtitle '
      'bitmap=$isBitmapSubtitle codec=${subtitleCodec ?? 'none'} '
      'url=${externalSubtitleUrl == null ? 'none' : loggableUrl(externalSubtitleUrl)}',
    );
    final arguments = <String, dynamic>{
      'index': index,
      'isBitmapSubtitle': isBitmapSubtitle,
      'codec': subtitleCodec,
      'isExternalSubtitle': isExternalSubtitle,
      'externalSubtitleUrl': externalSubtitleUrl,
    };
    // Native track discovery can announce zero subtitles before demux ends.
    // Keep the choice until its ordinal exists instead of losing it in Swift.
    if (!isExternalSubtitle && index > _textTrackCount) {
      _pendingEmbeddedSubtitle = arguments;
      return;
    }
    await _invoke<void>('setSubtitleTrack', arguments);
  }

  void _applyPendingEmbeddedSubtitle() {
    final pending = _pendingEmbeddedSubtitle;
    if (_disposed ||
        pending == null ||
        (pending['index'] as int) > _textTrackCount) {
      return;
    }
    // Consume before dispatch so repeated track events cannot reselect it.
    _pendingEmbeddedSubtitle = null;
    unawaited(_invoke<void>('setSubtitleTrack', pending));
  }

  @override
  Future<void> disableSubtitleTrack() async {
    _pendingEmbeddedSubtitle = null;
    _activeSubtitleTrackIndex = -1;
    _log('disableSubtitleTrack');
    await _invoke<void>('disableSubtitleTrack');
  }

  @override
  int? get activeSubtitleTrackIndex => _activeSubtitleTrackIndex;

  @override
  Future<int?> getActiveSubtitleTrackIndexAsync() async =>
      _activeSubtitleTrackIndex;

  @override
  Future<void> waitForTracksReady() async {
    if (_tracksKnown) {
      return;
    }
    _tracksReadyCompleter ??= Completer<void>();
    await _tracksReadyCompleter!.future.timeout(
      const Duration(seconds: 6),
      onTimeout: () {},
    );
  }

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {
    final started = DateTime.now();
    final deadline = started.add(const Duration(seconds: 6));
    var satisfied = false;
    while (DateTime.now().isBefore(deadline)) {
      if (_textTrackCount >= count) {
        satisfied = true;
        break;
      }
      await waitForTracksReady();
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    _log(
      'waitForEmbeddedSubtitleCount want=$count have=$_textTrackCount '
      'satisfied=$satisfied '
      'waited=${DateTime.now().difference(started).inMilliseconds}ms',
    );
  }

  @override
  Future<void> setVolume(double volume) async {
    _volume = volume.clamp(0.0, 100.0);
    await _invoke<void>('setVolume', {'volume': _volume});
  }

  @override
  Future<void> setAudioDelay(double seconds) async {
    _audioDelaySeconds = seconds;
    _audioDelayDebounce?.cancel();
    _audioDelayDebounce = Timer(const Duration(milliseconds: 350), () {
      _audioDelayDebounce = null;
      if (_disposed) return;
      unawaited(_invoke<void>('setAudioDelay', {
        'delayMs': (_audioDelaySeconds * 1000).round(),
      }));
    });
  }

  @override
  Future<void> setSubtitleDelay(double seconds) async {
    subtitleDelaySeconds = seconds;
    await _invoke<void>('setSubtitleDelay', {
      'delayMs': (seconds * 1000).round(),
    });
  }

  @override
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  }) async {
    _log(
      'addExternalSubtitle ${loggableUrl(url)} title=${title ?? 'none'} '
      'language=${language ?? 'none'} codec=${codec ?? 'none'}',
    );
    await _invoke<void>('addExternalSubtitle', {
      'url': url,
      'title': title,
      'language': language,
      'codec': codec,
    });
  }

  @override
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
    double? strokeScale,
    int? shadowColor,
    double? shadowOffset,
    double? shadowBlur,
    String? fontFamily,
  }) async {
    await _invoke<void>('configureSubtitleStyle', {
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'strokeColor': strokeColor,
      'fontSize': fontSize,
      'fontWeight': fontWeight,
      'verticalOffset': verticalOffset,
      'strokeScale': strokeScale,
      'shadowColor': shadowColor,
      'shadowOffset': shadowOffset,
      'shadowBlur': shadowBlur,
      ...await subtitleFontPaths(fontFamily),
    });
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {
    // The native overlay is the only subtitle renderer on this backend.
  }

  @override
  bool get supportsRuntimeTrackSelection => true;

  @override
  LetterboxCropper get letterboxCropper => const AetherLetterboxCropper();

  @override
  bool get supportsLetterboxCrop => letterboxCropper.isSupported;

  @override
  bool get supportsDirectPlayAudioSwitch => false;

  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  bool get managesAudioFocus => false;

  @override
  bool get canRenderBitmapSubtitles => true;

  @override
  bool get demuxesEmbeddedSubtitles => true;

  @override
  bool get decodesHevcOnlyFromOriginalFile => false;

  // Same engine as the Apple TV backend, so a seek costs the same reopen.
  // Provisional pending a trace of its own.
  @override
  Duration get typicalSeekLatency => const Duration(seconds: 4);

  @override
  Duration get maxSeekLatency => const Duration(seconds: 20);

  // Same AVPlayer rate path as the Apple TV backend, with the same audio
  // reconfiguration on every write.
  @override
  bool get supportsSmoothRateChange => false;

  @override
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks =>
      _embeddedCaptionTracks;

  @override
  Future<void> setEmbeddedCaptionTrack(int id) async {
    _pendingEmbeddedSubtitle = null;
    await _invoke<void>('setClosedCaptionTrack', {'id': id});
  }

  @override
  Stream<void> get tracksChangedStream => _tracksChangedController.stream;

  @override
  void dispose() {
    _pendingEmbeddedSubtitle = null;
    _disposed = true;
    _prefs.removeListener(_syncAllowUntrustedTls);
    _prefs.removeListener(_syncEngineLogForwarding);
    _audioDelayDebounce?.cancel();
    _stopStallWatchdog();
    _eventSub?.cancel();
    _positionStream.close();
    _durationStream.close();
    _bufferStream.close();
    _playingStream.close();
    _bufferingStream.close();
    _completedStream.close();
    _errorStream.close();
    _remoteCommandStream.close();
    _systemVolumeStream.close();
    _tracksChangedController.close();
    _subtitleLoadingStream.close();
  }
}
