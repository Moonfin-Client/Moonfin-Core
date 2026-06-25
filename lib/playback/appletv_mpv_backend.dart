import 'dart:async';

import 'package:flutter/services.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'audio_capability_profile.dart';

import 'device_profile_builder.dart';
import 'known_defects.dart';

class AppleTvMpvBackend implements PlayerBackend {
  AppleTvMpvBackend(this._prefs) {
    _eventSub = _events.receiveBroadcastStream().listen(
      _handleEvent,
      onError: (_) {},
    );
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

  bool _disposed = false;
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
    } catch (_) {
      return null;
    }
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
      case 'searchSubtitles':
      case 'downloadSubtitle':
      case 'syncplayLeave':
      case 'syncplayIgnoreWait':
        _uiActionStream.add(map.cast<String, dynamic>());
      case 'tracksChanged':
        _tracksKnown = true;
        _textTrackCount = _toInt(map['textTrackCount']);
        if (_tracksReadyCompleter != null &&
            !_tracksReadyCompleter!.isCompleted) {
          _tracksReadyCompleter!.complete();
        }
      case 'completed':
        _completed = _toBool(map['completed']);
        _completedStream.add(_completed);
      case 'syncDelays':
        _audioDelaySeconds = _toInt(map['audioDelayMs']) / 1000.0;
        _subtitleDelaySeconds = _toInt(map['subtitleDelayMs']) / 1000.0;
      case 'playerError':
      case 'error':
        _errorStream.add(map.cast<String, dynamic>());
        _isPlaying = false;
        _isBuffering = false;
        _completed = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
        _completedStream.add(false);
    }
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

    final audioOnly =
        (payload['mediaType']?.toString() ?? 'video') == 'audio';
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
      'audioChannelsMode': _resolveAudioChannelsMode(
        (payload['audioChannels'] as num?)?.toInt() ?? 0,
      ),
      'hybridAudioUrl': ?_resolveHybridAudioUrl(payload),
      'hybridAudioStreamIndex': (payload['audioStreamIndex'] as num?)?.toInt() ?? -1,
      'audioPassthrough': _audioPassthroughEligible(payload),
      'nativeDvEnabled': _nativeDvDecodeEnabled,
      'atmosPassthrough':
          _prefs.resolveEac3JocPassthroughEnabled() ||
          _prefs.resolveTrueHdAtmosPassthroughEnabled(),
      'mediaType': payload['mediaType']?.toString() ?? 'video',
      'normalizationGainDb': (payload['normalizationGainDb'] as num?)?.toDouble(),
      'dolbyVisionFallbackBehavior':
          _prefs.get(UserPreferences.dolbyVisionFallbackBehavior).name,
      'preferredAudioLanguage': _normalizeTrackLanguagePref(
        _prefs.get(UserPreferences.defaultAudioLanguage),
      ),
      'preferredTextLanguage': _normalizeTrackLanguagePref(
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

  bool get _nativeDvDecodeEnabled =>
      _prefs.get(UserPreferences.dolbyVisionProfile7DirectPlayBehavior) !=
      DolbyVisionProfile7DirectPlayBehavior.disabled;

  String _resolveAudioChannelsMode(int contentChannels) {
    if (_prefs.resolveAudioOutputMode() == AudioOutputMode.forceStereo) {
      return 'stereo';
    }
    final profile = _prefs.detectedAudioCapabilities;
    if (profile.maxPcmChannels <= 2) {
      return 'stereo';
    }
    if (profile.activeRouteType == AudioRouteType.hdmi &&
        profile.maxPcmChannels == 8 &&
        contentChannels > 0 &&
        contentChannels < 8) {
      return '7.1';
    }
    return 'auto-safe';
  }

  static final bool _hybridAtmosPathEnabled = false;

  bool _hybridAtmosEligible(Map<dynamic, dynamic> payload) {
    if (!_hybridAtmosPathEnabled) return false;
    if (!_prefs.get(UserPreferences.appleTvHybridAtmosEnabled)) return false;
    final codec = (payload['audioCodec']?.toString() ?? '').toLowerCase();
    if (codec != 'eac3') return false;
    final channels = (payload['audioChannels'] as num?)?.toInt() ?? 0;
    return channels > 2;
  }

  String? _resolveHybridAudioUrl(Map<dynamic, dynamic> payload) {
    if (!_hybridAtmosEligible(payload)) return null;
    final url = payload['hybridAudioUrl']?.toString();
    if (url == null || url.isEmpty) return null;
    return url;
  }

  static final bool _audioPassthroughPathEnabled = false;

  bool _audioPassthroughEligible(Map<dynamic, dynamic> payload) {
    if (!_audioPassthroughPathEnabled) return false;
    if (!_prefs.get(UserPreferences.appleTvAudioPassthroughEnabled)) return false;
    final codec = (payload['audioCodec']?.toString() ?? '').toLowerCase();
    if (codec != 'eac3' && codec != 'ac3') return false;
    final channels = (payload['audioChannels'] as num?)?.toInt() ?? 0;
    return channels > 2;
  }

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
      audioOutputMode: _prefs.resolveAudioOutputMode(),
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      eac3JocPassthroughEnabled: _prefs.resolveEac3JocPassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      dtsHdPassthroughEnabled: _prefs.resolveDtsHdPassthroughEnabled(),
      dtsXPassthroughEnabled: _prefs.resolveDtsXPassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      trueHdAtmosPassthroughEnabled: _prefs
          .resolveTrueHdAtmosPassthroughEnabled(),
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay),
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: PlatformDetection.supportsAvc,
      supportsAvcHigh10: PlatformDetection.supportsAvcHigh10,
      avcMainLevel: PlatformDetection.avcMainLevel,
      avcHigh10Level: PlatformDetection.avcHigh10Level,
      supportsHevc: PlatformDetection.supportsHevc,
      supportsHevcMain10: PlatformDetection.supportsHevcMain10,
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
      supportsDvProfile7:
          PlatformDetection.supportsDoViProfile7 && _nativeDvDecodeEnabled,
      supportsDvProfile8: PlatformDetection.supportsDoViProfile8,
      knownHevcDoviHdr10PlusBug: PlatformDetection.knownHevcDoviHdr10PlusBug,
      allowDolbyVisionProfile7ElDirectPlay:
          KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
            behavior: _prefs.get(
              UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
            ),
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
    Map<String, dynamic>? nextUp,
    int nextUpThresholdMs = 0,
    Map<String, dynamic>? pauseMeta,
    int selectedBitrateMbps = -1,
    List<Map<String, dynamic>> mediaSegments = const [],
    bool canFavorite = false,
    bool isFavorite = false,
    bool showStillWatching = false,
    bool canDownloadSubtitles = false,
    Map<String, dynamic>? syncPlay,
    bool isLive = false,
    Map<String, dynamic>? liveProgram,
    String liveChannelNumber = '',
    List<Map<String, dynamic>> channelList = const [],
    List<Map<String, dynamic>> streamStats = const [],
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
      'nextUp': ?nextUp,
      'nextUpThresholdMs': nextUpThresholdMs,
      'pauseMeta': ?pauseMeta,
      'selectedBitrateMbps': selectedBitrateMbps,
      'mediaSegments': mediaSegments,
      'canFavorite': canFavorite,
      'isFavorite': isFavorite,
      'showStillWatching': showStillWatching,
      'canDownloadSubtitles': canDownloadSubtitles,
      'syncPlay': ?syncPlay,
      'isLive': isLive,
      'liveProgram': ?liveProgram,
      'liveChannelNumber': liveChannelNumber,
      'channelList': channelList,
      'streamStats': streamStats,
    });
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
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  bool get canRenderBitmapSubtitles => true;

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
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
  }
}
