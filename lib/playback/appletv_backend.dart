import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/services/log_service.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

import 'device_profile_builder.dart';
import 'known_defects.dart';
import 'server_transcode_capabilities.dart';

class AppleTvBackend implements PlayerBackend {
  AppleTvBackend(this._prefs) {
    _eventSub = _events.receiveBroadcastStream().listen(
      _handleEvent,
      onError: (_) {},
    );
    _prefs.addListener(_syncNativePreferences);
    _syncNativePreferences();
  }

  static const _control = MethodChannel('moonfin/appletv_video_control');
  static const _events = EventChannel('moonfin/appletv_video_events');

  final UserPreferences _prefs;

  StreamSubscription<dynamic>? _eventSub;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  double _playbackSpeed = 1.0;
  double _volume = 100.0;
  double _audioDelaySeconds = 0.0;
  double _subtitleDelaySeconds = 0.0;
  bool _completed = false;
  SubtitleRendererMode _requestedSubtitleRendererMode =
      SubtitleRendererMode.native;

  int _textTrackCount = 0;
  bool _tracksKnown = false;
  int? _activeSubtitleTrackIndex;
  Completer<void>? _tracksReadyCompleter;
  List<EmbeddedCaptionTrack> _embeddedCaptionTracks = const [];
  final _tracksChangedController = StreamController<void>.broadcast();

  bool _disposed = false;
  bool? _engineLogForwarding;
  bool? _allowUntrustedTls;
  bool _playerPresented = false;
  Timer? _audioDelayDebounce;

  final _positionStream = StreamController<Duration>.broadcast();
  final _durationStream = StreamController<Duration>.broadcast();
  final _bufferStream = StreamController<Duration>.broadcast();
  final _playingStream = StreamController<bool>.broadcast();
  final _bufferingStream = StreamController<bool>.broadcast();
  final _completedStream = StreamController<bool>.broadcast();
  final _errorStream = StreamController<Map<String, dynamic>>.broadcast();
  final _userExitStream = StreamController<void>.broadcast();
  final _uiActionStream = StreamController<Map<String, dynamic>>.broadcast();

  @override
  Stream<Map<String, dynamic>> get errorStream => _errorStream.stream;

  Stream<void> get userExitStream => _userExitStream.stream;

  Stream<Map<String, dynamic>> get uiActionStream => _uiActionStream.stream;

  Future<T?> _invoke<T>(String method, [dynamic arguments]) async {
    if (_disposed) return null;
    try {
      return await _control.invokeMethod<T>(method, arguments);
    } on PlatformException catch (error) {
      _log(
        'Channel call $method failed code=${error.code}',
        level: LogLevel.error,
        error: error.message,
      );
      return null;
    } catch (error) {
      _log('Channel call $method failed', level: LogLevel.error, error: error);
      return null;
    }
  }

  void _log(String message, {LogLevel level = LogLevel.debug, Object? error}) {
    if (!GetIt.instance.isRegistered<LogService>()) return;
    GetIt.instance<LogService>().playback(message, level: level, error: error);
  }

  /// The query carries the server token, so only the origin and path go in a
  /// report a user uploads.
  String _describeUrl(String url) {
    final parsed = Uri.tryParse(url);
    if (parsed == null) return 'unparsable url';
    final port = parsed.hasPort ? ':${parsed.port}' : '';
    return '${parsed.scheme}://${parsed.host}$port${parsed.path}';
  }

  Future<void> _ensurePlayerPresented({bool audioOnly = false}) async {
    if (_disposed || _playerPresented) return;
    _playerPresented = true;
    await _invoke<void>('present', {'audioOnly': audioOnly});
  }

  Future<void> _dismissPlayer() async {
    if (!_playerPresented) return;
    _playerPresented = false;
    await _invoke<void>('dismiss');
  }

  Future<void> dismissPlayer() => _dismissPlayer();

  void _handleEvent(dynamic event) {
    if (_disposed || event is! Map) return;
    final map = event.map((k, v) => MapEntry(k.toString(), v));
    final eventType = map['event']?.toString();

    switch (eventType) {
      case 'state':
        _position = Duration(milliseconds: _toInt(map['positionMs']));
        _duration = Duration(milliseconds: _toInt(map['durationMs']));
        _buffer = Duration(milliseconds: _toInt(map['bufferedMs']));
        _isPlaying = _toBool(map['isPlaying']);
        _isBuffering = _toBool(map['isBuffering']);

        final completedNow =
            _duration > Duration.zero && _position >= _duration && !_isPlaying;
        if (completedNow != _completed) {
          _completed = completedNow;
          _completedStream.add(_completed);
        }

        _positionStream.add(_position);
        _durationStream.add(_duration);
        _bufferStream.add(_buffer);
        _playingStream.add(_isPlaying);
        _bufferingStream.add(_isBuffering);
      case 'presented':
        _playerPresented = true;
      case 'dismissed':
        _playerPresented = false;
        _isPlaying = false;
        _isBuffering = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
      case 'userExited':
        _userExitStream.add(null);
      case 'play':
      case 'pause':
      case 'seek':
      case 'next':
      case 'previous':
      case 'selectAudio':
      case 'selectSubtitle':
      case 'setSpeed':
      case 'setBitrate':
      case 'selectChannel':
      case 'openGuide':
      case 'toggleFavorite':
      case 'stillWatchingContinue':
      case 'stillWatchingStop':
      case 'nextUpPlay':
      case 'nextUpCancel':
      case 'nextUpDismiss':
      case 'skipSegment':
      case 'userSeeked':
      case 'searchSubtitles':
      case 'downloadSubtitle':
      case 'syncplayLeave':
      case 'syncplayIgnoreWait':
        _uiActionStream.add(map.cast<String, dynamic>());
      case 'tracksChanged':
        _tracksKnown = true;
        _textTrackCount = _toInt(map['textTrackCount']);
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
        _completed = _toBool(map['completed']);
        _completedStream.add(_completed);
      case 'syncDelays':
        _audioDelaySeconds = _toInt(map['audioDelayMs']) / 1000.0;
        _subtitleDelaySeconds = _toInt(map['subtitleDelayMs']) / 1000.0;
      case 'engineLog':
        _logEngineLine(map['line']);
      case 'playerError':
      case 'error':
        _logPlaybackError(map);
        _errorStream.add(map.cast<String, dynamic>());
        _isPlaying = false;
        _isBuffering = false;
        _completed = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
        _completedStream.add(false);
    }
  }

  /// The preferences notify on every change, so each sync below guards its
  /// own flag and only a real change reaches the channel.
  void _syncNativePreferences() {
    _syncEngineLogForwarding();
    _syncAllowUntrustedTls();
  }

  void _syncEngineLogForwarding() {
    final enabled = _prefs.get(UserPreferences.diagnosticLoggingEnabled);
    if (enabled == _engineLogForwarding) return;
    _engineLogForwarding = enabled;
    _invoke<void>('setEngineLogForwarding', {'enabled': enabled});
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
  /// every playback.
  void _syncAllowUntrustedTls() {
    final enabled = _prefs.get(UserPreferences.allowSelfSignedCerts);
    if (enabled == _allowUntrustedTls) return;
    _allowUntrustedTls = enabled;
    _invoke<void>('setAllowUntrustedTls', {'enabled': enabled});
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

  String? _normalizeTrackLanguagePref(String? value) {
    final normalized = (value ?? '').trim().toLowerCase();
    if (normalized.isEmpty || normalized == 'auto' || normalized == 'none') {
      return null;
    }
    return normalized;
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

    final headers = payload['headers'] is Map
        ? (payload['headers'] as Map).map(
            (key, value) => MapEntry(key.toString(), value.toString()),
          )
        : <String, String>{};

    _completed = false;
    _tracksKnown = false;
    _textTrackCount = 0;
    _activeSubtitleTrackIndex = null;
    _tracksReadyCompleter = null;
    _embeddedCaptionTracks = const [];

    final audioOnly =
        (payload['mediaType']?.toString() ?? 'video') == 'audio';
    _log(
      'play ${_describeUrl(url)} live=${payload['isLive'] == true} '
      'audioOnly=$audioOnly startMs=${startPosition.inMilliseconds} '
      'headers=${(headers.keys.toList()..sort()).join(',')}',
    );
    await _ensurePlayerPresented(audioOnly: audioOnly);

    await _invoke<void>('setSource', {
      'url': url,
      'headers': headers,
      'autoPlay': true,
      'startPositionMs': startPosition.inMilliseconds,
      'container': payload['container']?.toString(),
      'videoRangeType': payload['videoRangeType']?.toString(),
      'videoCodec': payload['videoCodec']?.toString(),
      'videoDvProfile': payload['videoDvProfile'],
      'videoFrameRate': payload['videoFrameRate'],
      'videoWidth': payload['videoWidth'],
      'videoHeight': payload['videoHeight'],
      'audioCodec': payload['audioCodec']?.toString(),
      'audioProfile': payload['audioProfile']?.toString(),
      'audioChannels': payload['audioChannels'],
      'audioStreamIndex': (payload['audioStreamIndex'] as num?)?.toInt() ?? -1,
      'isLive': payload['isLive'] == true,
      'mediaType': payload['mediaType']?.toString() ?? 'video',
      'normalizationGainDb': (payload['normalizationGainDb'] as num?)?.toDouble(),
      'dolbyVisionFallbackBehavior':
          _prefs.get(UserPreferences.dolbyVisionFallbackBehavior).name,
      'preferredAudioLanguage': _normalizeTrackLanguagePref(
        payload['preferredAudioLanguage']?.toString() ??
            _prefs.get(UserPreferences.defaultAudioLanguage),
      ),
      'preferredTextLanguage': _normalizeTrackLanguagePref(
        payload['preferredTextLanguage']?.toString() ??
            _prefs.get(UserPreferences.defaultSubtitleLanguage),
      ),
      'speed': _playbackSpeed,
      'volume': _volume,
      'audioDelayMs': (_audioDelaySeconds * 1000).round(),
      'subtitleDelayMs': (_subtitleDelaySeconds * 1000).round(),
      'subtitleRendererMode': _modeToWire(_requestedSubtitleRendererMode),
      'forceSubtitlesDisabledOnStart':
          !audioOnly && _prefs.get(UserPreferences.subtitleMode) == SubtitleMode.none,
    });
  }

  @override
  Future<void> resume() async {
    await _ensurePlayerPresented();
    await _invoke<void>('play');
  }

  @override
  Future<void> pause() async {
    await _invoke<void>('pause');
  }

  @override
  Future<void> stop() async {
    await _invoke<void>('stop');
    if (_isPlaying) {
      _isPlaying = false;
      _playingStream.add(false);
    }
  }

  @override
  Future<void> seekTo(Duration position) async {
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
    final audioCapabilityProfile = _prefs.detectedAudioCapabilities;

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      audioCapabilityProfile: audioCapabilityProfile,
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
      // AetherEngine plays every advertised audio codec: AAC/AC3/EAC3(+JOC
      // Atmos)/FLAC/ALAC are stream-copied intact, and TrueHD/DTS/MP3/Opus/
      // Vorbis/PCM are bridged to EAC3 or FLAC on-device, so stereo routes
      // never need a server-side audio transcode.
      universalAudioDecode: true,
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay),
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: PlatformDetection.supportsAvc,
      supportsAvcHigh10: PlatformDetection.supportsAvcHigh10,
      avcMainLevel: PlatformDetection.avcMainLevel,
      avcHigh10Level: PlatformDetection.avcHigh10Level,
      supportsHevc: PlatformDetection.supportsHevc,
      supportsHevcMain10: PlatformDetection.supportsHevcMain10,
      transcodeHevcAllowed: serverAllowsHevcTranscode(),
      hevcRequiresFmp4Hls: true,
      hlsAudioExcludesDts: true,
      hevcMainLevel: PlatformDetection.hevcMainLevel,
      supportsHevcDolbyVision: PlatformDetection.supportsHevcDolbyVision,
      supportsHevcDolbyVisionEl: PlatformDetection.supportsHevcDolbyVisionEl,
      supportsHevcHdr10: PlatformDetection.supportsHevcHdr10,
      supportsHevcHdr10Plus: PlatformDetection.supportsHevcHdr10Plus,
      supportsAv1: PlatformDetection.supportsAv1,
      supportsAv1Main10: PlatformDetection.supportsAv1Main10,
      supportsAv1DolbyVision: PlatformDetection.supportsAv1DolbyVision,
      supportsAv1Hdr10: PlatformDetection.supportsAv1Hdr10,
      supportsAv1Hdr10Plus: PlatformDetection.supportsAv1Hdr10Plus,
      supportsVc1: PlatformDetection.supportsVc1,
      maxResolutionAvcWidth: PlatformDetection.maxResolutionAvcWidth,
      maxResolutionAvcHeight: PlatformDetection.maxResolutionAvcHeight,
      maxResolutionHevcWidth: PlatformDetection.maxResolutionHevcWidth,
      maxResolutionHevcHeight: PlatformDetection.maxResolutionHevcHeight,
      maxResolutionAv1Width: PlatformDetection.maxResolutionAv1Width,
      maxResolutionAv1Height: PlatformDetection.maxResolutionAv1Height,
      maxResolutionVc1Width: PlatformDetection.maxResolutionVc1Width,
      maxResolutionVc1Height: PlatformDetection.maxResolutionVc1Height,
      supportsDvProfile5: PlatformDetection.supportsDoViProfile5,
      // AetherEngine converts P7 (dual-layer) to P8.1 per-packet via libdovi,
      // so P7 direct play no longer depends on a native-decode preference.
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

  Future<void> setUiMetadata({
    required String topTitle,
    required String topSubtitle,
    required List<Map<String, dynamic>> chapters,
    required bool hasPrevious,
    required bool hasNext,
    required int skipForwardMs,
    required int skipBackMs,
    required List<Map<String, dynamic>> audioTracks,
    required List<Map<String, dynamic>> subtitleTracks,
    String logoUrl = '',
    List<Map<String, dynamic>> streamInfoSections = const [],
    Map<String, dynamic>? trickplay,
    bool hasCast = false,
    List<Map<String, dynamic>> castPeople = const [],
    Map<String, dynamic>? pauseMeta,
    int selectedBitrateMbps = -1,
    bool canFavorite = false,
    bool isFavorite = false,
    bool canDownloadSubtitles = false,
    Map<String, dynamic>? syncPlay,
    bool isLive = false,
    Map<String, dynamic>? liveProgram,
    String liveChannelNumber = '',
    List<Map<String, dynamic>> channelList = const [],
    List<Map<String, dynamic>> streamStats = const [],
    List<String>? osdButtons,
  }) async {
    await _invoke<void>('setUiMetadata', {
      'topTitle': topTitle,
      'topSubtitle': topSubtitle,
      'chapters': chapters,
      'hasPrevious': hasPrevious,
      'hasNext': hasNext,
      'skipForwardMs': skipForwardMs,
      'skipBackMs': skipBackMs,
      'audioTracks': audioTracks,
      'subtitleTracks': subtitleTracks,
      'logoUrl': logoUrl,
      'streamInfoSections': streamInfoSections,
      'trickplay': ?trickplay,
      'hasCast': hasCast,
      'castPeople': castPeople,
      'pauseMeta': ?pauseMeta,
      'selectedBitrateMbps': selectedBitrateMbps,
      'canFavorite': canFavorite,
      'isFavorite': isFavorite,
      'canDownloadSubtitles': canDownloadSubtitles,
      'syncPlay': ?syncPlay,
      'isLive': isLive,
      'liveProgram': ?liveProgram,
      'liveChannelNumber': liveChannelNumber,
      'channelList': channelList,
      'streamStats': streamStats,
      // The buttons the user left switched on, in their order. A caller with
      // no row to arrange leaves this out, which reads as no opinion rather
      // than as everything switched off.
      'osdButtons': ?osdButtons,
    });
  }

  Future<void> showNextUp({
    required String title,
    required String episodeInfo,
    required String imageUrl,
    required bool isMinimal,
    required String countdownStyle,
    required int timeoutMs,
  }) async {
    await _invoke<void>('showNextUp', {
      'title': title,
      'episodeInfo': episodeInfo,
      'imageUrl': imageUrl,
      'isMinimal': isMinimal,
      'countdownStyle': countdownStyle,
      'timeoutMs': timeoutMs,
    });
  }

  Future<void> hideNextUp() async {
    await _invoke<void>('hideNextUp');
  }

  /// Returns whether the native modal actually presented so the caller can
  /// fail open instead of waiting on a prompt that never appeared.
  Future<bool> showStillWatching() async {
    final presented = await _invoke<bool>('showStillWatching');
    return presented ?? false;
  }

  Future<void> showSkipSegment(
    String label, {
    required String countdownStyle,
    required int segmentStartMs,
    required int segmentEndMs,
  }) async {
    await _invoke<void>('showSkipSegment', {
      'label': label,
      'countdownStyle': countdownStyle,
      'segmentStartMs': segmentStartMs,
      'segmentEndMs': segmentEndMs,
    });
  }

  Future<void> hideSkipSegment() async {
    await _invoke<void>('hideSkipSegment');
  }

  Future<void> showRemoteSubtitles(List<Map<String, dynamic>> results) async {
    await _invoke<void>('showRemoteSubtitles', {'results': results});
  }

  Future<void> setThemeConfig({
    required bool isGlass,
    required int accentARGB,
    required int surfaceARGB,
    required int onSurfaceARGB,
    required int rangeProgressARGB,
    required int rangeTrackARGB,
  }) async {
    await _invoke<void>('setThemeConfig', {
      'isGlass': isGlass,
      'accent': accentARGB,
      'surface': surfaceARGB,
      'onSurface': onSurfaceARGB,
      'rangeProgress': rangeProgressARGB,
      'rangeTrack': rangeTrackARGB,
    });
  }

  Future<void> setPromptStrings(Map<String, String> strings) async {
    await _invoke<void>('setPromptStrings', strings);
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
    _activeSubtitleTrackIndex = index;
    await _invoke<void>('setSubtitleTrack', {
      'index': index,
      'isBitmapSubtitle': isBitmapSubtitle,
      'codec': subtitleCodec,
      'isExternalSubtitle': isExternalSubtitle,
      'externalSubtitleUrl': externalSubtitleUrl,
    });
  }

  @override
  Future<void> disableSubtitleTrack() async {
    _activeSubtitleTrackIndex = -1;
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
    final deadline = DateTime.now().add(const Duration(seconds: 6));
    while (DateTime.now().isBefore(deadline)) {
      if (_textTrackCount >= count) {
        return;
      }
      await waitForTracksReady();
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
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
    _subtitleDelaySeconds = seconds;
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
  }) async {
    await _invoke<void>('configureSubtitleStyle', {
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'strokeColor': strokeColor,
      'fontSize': fontSize,
      'fontWeight': fontWeight,
      'verticalOffset': verticalOffset,
    });
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {
    _requestedSubtitleRendererMode = mode;
    await _invoke<void>('setSubtitleRendererMode', {'mode': _modeToWire(mode)});
  }

  String _modeToWire(SubtitleRendererMode mode) {
    return switch (mode) {
      SubtitleRendererMode.native => 'native',
      SubtitleRendererMode.assOverlay => 'assOverlay',
    };
  }

  @override
  bool get supportsRuntimeTrackSelection => true;

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
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks =>
      _embeddedCaptionTracks;

  @override
  Future<void> setEmbeddedCaptionTrack(int id) async {
    await _invoke<void>('setClosedCaptionTrack', {'id': id});
  }

  @override
  Stream<void> get tracksChangedStream => _tracksChangedController.stream;

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _prefs.removeListener(_syncNativePreferences);
    _audioDelayDebounce?.cancel();
    _audioDelayDebounce = null;
    unawaited(_dismissPlayer());
    unawaited(_eventSub?.cancel());
    _positionStream.close();
    _durationStream.close();
    _bufferStream.close();
    _playingStream.close();
    _bufferingStream.close();
    _completedStream.close();
    _errorStream.close();
    _userExitStream.close();
    _uiActionStream.close();
    _tracksChangedController.close();
  }
}
