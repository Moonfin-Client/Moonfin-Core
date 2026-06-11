import 'dart:async';

import 'package:flutter/services.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'audio_capability_profile.dart';
import 'device_profile_builder.dart';
import 'known_defects.dart';

class Media3PlayerBackend implements PlayerBackend {
  static const _discontinuityWindowMs = 15000;
  static const _discontinuityThreshold = 3;

  Media3PlayerBackend(this._prefs) {
    _eventSub = _events.receiveBroadcastStream().listen(
      _handleEvent,
      onError: (_) {},
    );
  }

  static const _control = MethodChannel('moonfin/media3_video_control');
  static const _events = EventChannel('moonfin/media3_video_events');
  static final _activityActionController =
      StreamController<Map<String, dynamic>>.broadcast();

  static Stream<Map<String, dynamic>> get activityActionStream =>
      _activityActionController.stream;

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
  int _volumeBoostLevel = 0;
  bool _skipSilenceEnabled = false;
  RepeatMode _repeatMode = RepeatMode.none;
  bool _completed = false;
  SubtitleRendererMode _requestedSubtitleRendererMode =
      SubtitleRendererMode.native;

  int _textTrackCount = 0;
  bool _tracksKnown = false;
  Completer<void>? _tracksReadyCompleter;

  bool _disposed = false;
  bool _activityStarted = false;
  bool _sessionTunnelingDisabled = false;
  final List<int> _discontinuityTimestamps = <int>[];
  Timer? _audioDelayDebounce;

  final _positionStream = StreamController<Duration>.broadcast();
  final _durationStream = StreamController<Duration>.broadcast();
  final _bufferStream = StreamController<Duration>.broadcast();
  final _playingStream = StreamController<bool>.broadcast();
  final _bufferingStream = StreamController<bool>.broadcast();
  final _completedStream = StreamController<bool>.broadcast();
  final _errorStream = StreamController<Map<String, dynamic>>.broadcast();

  int get volumeBoostLevel => _volumeBoostLevel;

  @override
  Stream<Map<String, dynamic>> get errorStream => _errorStream.stream;

  Future<T?> _invoke<T>(String method, [dynamic arguments]) async {
    if (_disposed) return null;
    try {
      return await _control.invokeMethod<T>(method, arguments);
    } catch (_) {
      return null;
    }
  }

  Future<void> _ensureActivityStarted() async {
    if (_disposed || _activityStarted) return;
    _activityStarted = true;
  }

  Future<void> _stopActivity() async {
    if (!_activityStarted) return;
    _activityStarted = false;
  }

  Future<void> stopNativeActivity() async {
    await _stopActivity();
  }

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
      case 'activityStarted':
        _activityStarted = true;
      case 'activityFinished':
        _activityStarted = false;
      case 'tracksChanged':
        _tracksKnown = true;
        _textTrackCount = _toInt(map['textTrackCount']);
        _requestedSubtitleRendererMode = _modeFromWire(
          map['subtitleRendererModeRequested'],
        );
        if (_tracksReadyCompleter != null &&
            !_tracksReadyCompleter!.isCompleted) {
          _tracksReadyCompleter!.complete();
        }
      case 'completed':
        _completed = _toBool(map['completed']);
        _completedStream.add(_completed);
      case 'subtitleRendererModeChanged':
        _requestedSubtitleRendererMode = _modeFromWire(map['requestedMode']);
      case 'viewReady':
        if (_tracksReadyCompleter != null &&
            !_tracksReadyCompleter!.isCompleted &&
            _tracksKnown) {
          _tracksReadyCompleter!.complete();
        }
      case 'viewDisposed':
        _activityStarted = false;
        _isPlaying = false;
        _isBuffering = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
      case 'activityAction':
        _activityActionController.add(map.cast<String, dynamic>());
      case 'playerError':
        _errorStream.add(map.cast<String, dynamic>());
      case 'error':
        _errorStream.add(map.cast<String, dynamic>());
        _isPlaying = false;
        _isBuffering = false;
        _completed = false;
        _playingStream.add(false);
        _bufferingStream.add(false);
        _completedStream.add(false);
      case 'syncDelays':
        _audioDelaySeconds = _toInt(map['audioDelayMs']) / 1000.0;
        _subtitleDelaySeconds = _toInt(map['subtitleDelayMs']) / 1000.0;
      case 'volumeBoost':
        _volumeBoostLevel = (_toInt(map['level']).clamp(0, 10)).toInt();
      case 'repeatModeChanged':
        _repeatMode = _repeatModeFromWire(map['repeatMode']?.toString());
      case 'tunnelingDiscontinuity':
        _onTunnelingDiscontinuity();
    }
  }

  void _onTunnelingDiscontinuity() {
    if (_sessionTunnelingDisabled) {
      return;
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    _discontinuityTimestamps.removeWhere(
      (timestamp) => nowMs - timestamp > _discontinuityWindowMs,
    );
    _discontinuityTimestamps.add(nowMs);

    if (_discontinuityTimestamps.length < _discontinuityThreshold) {
      return;
    }

    _discontinuityTimestamps.clear();
    unawaited(disableTunnelingFallback());
  }

  Future<void> disableTunnelingFallback({bool persist = true}) async {
    if (_sessionTunnelingDisabled) {
      return;
    }

    _sessionTunnelingDisabled = true;
    await _invoke<void>('disableTunnelingForSession');
    if (persist) {
      await _prefs.set(UserPreferences.tunnelingFallbackDisabled, true);
    }
  }

  int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return 0;
  }

  bool _toBool(dynamic value) {
    if (value is bool) return value;
    return false;
  }

  SubtitleRendererMode _modeFromWire(dynamic value) {
    final normalized = value?.toString();
    return switch (normalized) {
      'assOverlay' => SubtitleRendererMode.assOverlay,
      _ => SubtitleRendererMode.native,
    };
  }

  RepeatMode _repeatModeFromWire(String? value) {
    switch ((value ?? '').trim().toLowerCase()) {
      case 'one':
      case 'repeatone':
        return RepeatMode.repeatOne;
      case 'all':
      case 'repeatall':
        return RepeatMode.repeatAll;
      default:
        return RepeatMode.none;
    }
  }

  String _repeatModeToWire(RepeatMode mode) {
    return switch (mode) {
      RepeatMode.none => 'off',
      RepeatMode.repeatOne => 'one',
      RepeatMode.repeatAll => 'all',
    };
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

    final mediaType = payload['mediaType']?.toString() ?? 'video';
    final container = payload['container']?.toString();
    final videoRangeType = payload['videoRangeType']?.toString();
    final normalizationGainDb = (payload['normalizationGainDb'] as num?)
        ?.toDouble();
    final headers = payload['headers'] is Map
        ? (payload['headers'] as Map).map(
            (key, value) => MapEntry(key.toString(), value.toString()),
          )
        : <String, String>{};

    _completed = false;
    _tracksKnown = false;
    _textTrackCount = 0;
    _tracksReadyCompleter = null;
    _discontinuityTimestamps.clear();
    _skipSilenceEnabled = _prefs.get(UserPreferences.media3SkipSilence);
    _volumeBoostLevel = 0;
    final preferredAudioLanguage = _normalizeTrackLanguagePref(
      _prefs.get(UserPreferences.defaultAudioLanguage),
    );
    final preferredSubtitleLanguage = _normalizeTrackLanguagePref(
      _prefs.get(UserPreferences.defaultSubtitleLanguage),
    );
    final tunnelingDisabledByUser = _prefs.get(
      UserPreferences.media3TunnelingDisabled,
    );
    final dvFallbackBehavior = _prefs.get(
      UserPreferences.dolbyVisionFallbackBehavior,
    );
    final mapDolbyVisionProfile7ToHevc =
        _prefs.get(UserPreferences.media3MapDolbyVisionProfile7ToHevc) ||
        (!PlatformDetection.supportsDoViProfile7 &&
            dvFallbackBehavior != DolbyVisionFallbackBehavior.transcode);
    _sessionTunnelingDisabled =
        _prefs.get(UserPreferences.tunnelingFallbackDisabled) ||
        tunnelingDisabledByUser;

    await _ensureActivityStarted();

    await _invoke<void>('setDecoderPreferences', {
      'preferFfmpeg': _prefs.get(UserPreferences.preferExoPlayerFfmpeg),
      'tunnelingDisabled': _sessionTunnelingDisabled,
      'mapDolbyVisionProfile7ToHevc': mapDolbyVisionProfile7ToHevc,
      'allowExternalAudioEffects': _prefs.get(
        UserPreferences.media3AllowExternalAudioEffects,
      ),
      'frameRateSwitchingBehavior': _prefs
          .get(UserPreferences.refreshRateSwitchingBehavior)
          .name,
    });
    await _invoke<void>('setSource', {
      'url': url,
      'headers': headers,
      'autoPlay': true,
      'startPositionMs': startPosition.inMilliseconds,
      'container': container,
      'videoRangeType': videoRangeType,
      'mediaType': mediaType,
      'normalizationGainDb': normalizationGainDb,
      'skipSilenceEnabled': _skipSilenceEnabled,
      'preferredAudioLanguage': preferredAudioLanguage,
      'preferredTextLanguage': preferredSubtitleLanguage,
      'selectUndeterminedTextLanguage': false,
      'audioDelayMs': (_audioDelaySeconds * 1000).round(),
      'subtitleDelayMs': (_subtitleDelaySeconds * 1000).round(),
      'volumeBoostLevel': _volumeBoostLevel,
    });
    await _invoke<void>('setRepeatMode', {
      'mode': _repeatModeToWire(_repeatMode),
    });
    await _invoke<void>('setSpeed', {'speed': _playbackSpeed});
    await _invoke<void>('setVolume', {'volume': _volume});
    await _invoke<void>('setSkipSilence', {'enabled': _skipSilenceEnabled});
    await _invoke<void>('setVolumeBoost', {'level': _volumeBoostLevel});
    await _invoke<void>('setAudioDelay', {
      'seconds': _audioDelaySeconds,
      'delayMs': (_audioDelaySeconds * 1000).round(),
    });
    await _invoke<void>('setSubtitleDelay', {
      'seconds': _subtitleDelaySeconds,
      'delayMs': (_subtitleDelaySeconds * 1000).round(),
    });
    await _invoke<void>('setSubtitleRendererMode', {
      'mode': _modeToWire(_requestedSubtitleRendererMode),
    });
    await _invoke<void>('play');
  }

  @override
  Future<void> resume() async {
    await _ensureActivityStarted();
    await _invoke<void>('play');
  }

  @override
  Future<void> pause() async {
    await _invoke<void>('pause');
  }

  @override
  Future<void> stop() => _teardown('stop');

  Future<void> release() => _teardown('release');

  Future<void> _teardown(String command) async {
    await _invoke<void>(command);
    if (_isPlaying) {
      _isPlaying = false;
      _playingStream.add(false);
    }
    await _stopActivity();
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
    final audioCapabilityProfile = PlatformDetection.hasAudioCapabilities
        ? AudioCapabilityProfile.fromMap(
            PlatformDetection.audioCapabilitiesSnapshot,
          )
        : const AudioCapabilityProfile.optimistic();

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
      downMixAudio:
          _prefs.resolveAudioOutputMode() == AudioOutputMode.forceStereo,
      audioFallbackToStereoAac:
          _prefs.resolveAudioFallbackCodec() == AudioFallbackCodec.aacStereo,
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay) && canRenderBitmapSubtitles,
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
      supportsDvProfile7: PlatformDetection.supportsDoViProfile7,
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

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    _playbackSpeed = speed;
    await _invoke<void>('setSpeed', {'speed': speed});
  }

  Future<void> setUiMetadata({
    required bool hasPrevious,
    required bool hasNext,
    required List<Map<String, dynamic>> chapters,
    required int skipBackMs,
    required int skipForwardMs,
    required String topTitle,
    required String topSubtitle,
    String artworkUrl = '',
    required bool showClock,
    required String zoomModeLabel,
    List<Map<String, dynamic>> streamInfoSections = const [],
    bool hasCastCrew = false,
    List<Map<String, dynamic>> castPeople = const [],
    bool canCastControl = false,
    String castKindLabel = '',
    String castStateLabel = '',
    int castPositionMs = 0,
    double? castVolume,
    int? selectedBitrateMbps,
  }) async {
    await _invoke<void>('setUiMetadata', {
      'hasPrevious': hasPrevious,
      'hasNext': hasNext,
      'selectedBitrateMbps': selectedBitrateMbps,
      'skipBackMs': skipBackMs,
      'skipForwardMs': skipForwardMs,
      'topTitle': topTitle,
      'topSubtitle': topSubtitle,
      'artworkUrl': artworkUrl,
      'showClock': showClock,
      'zoomModeLabel': zoomModeLabel,
      'streamInfoSections': streamInfoSections,
      'hasCastCrew': hasCastCrew,
      'castPeople': castPeople,
      'canCastControl': canCastControl,
      'castKindLabel': castKindLabel,
      'castStateLabel': castStateLabel,
      'castPositionMs': castPositionMs,
      'castVolume': castVolume,
      'chapters': chapters,
    });
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
    await _invoke<void>('disableSubtitleTrack');
  }

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

  void resetVolumeState() {
    _volume = 100.0;
  }

  @override
  Future<void> setAudioDelay(double seconds) async {
    _audioDelaySeconds = seconds;
    // The engine applies audio delay via a buffer flush (seek), so debounce
    // rapid button taps into a single call to avoid audio stuttering.
    _audioDelayDebounce?.cancel();
    _audioDelayDebounce = Timer(const Duration(milliseconds: 350), () {
      _audioDelayDebounce = null;
      if (_disposed) return;
      unawaited(_invoke<void>('setAudioDelay', {
        'seconds': _audioDelaySeconds,
        'delayMs': (_audioDelaySeconds * 1000).round(),
      }));
    });
  }

  @override
  Future<void> setSubtitleDelay(double seconds) async {
    _subtitleDelaySeconds = seconds;
    await _invoke<void>('setSubtitleDelay', {
      'seconds': seconds,
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
    bool? applyEmbeddedStyles,
    bool? applyEmbeddedFontSizes,
  }) async {
    await _invoke<void>('configureSubtitleStyle', {
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'strokeColor': strokeColor,
      'fontSize': fontSize,
      'fontWeight': fontWeight,
      'verticalOffset': verticalOffset,
      'applyEmbeddedStyles': applyEmbeddedStyles,
      'applyEmbeddedFontSizes': applyEmbeddedFontSizes,
    });
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {
    _requestedSubtitleRendererMode = mode;
    await _invoke<void>('setSubtitleRendererMode', {'mode': _modeToWire(mode)});
  }

  Future<void> setZoomMode(String mode) async {
    await _invoke<void>('setZoomMode', {'mode': mode});
  }

  Future<void> setRepeatMode(RepeatMode mode) async {
    _repeatMode = mode;
    await _invoke<void>('setRepeatMode', {'mode': _repeatModeToWire(mode)});
  }

  Future<void> setSkipSilence(bool enabled) async {
    _skipSilenceEnabled = enabled;
    await _invoke<void>('setSkipSilence', {'enabled': enabled});
  }

  Future<void> setVolumeBoostLevel(int level) async {
    _volumeBoostLevel = (level.clamp(0, 10)).toInt();
    await _invoke<void>('setVolumeBoost', {'level': _volumeBoostLevel});
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
    unawaited(_stopActivity());
    unawaited(_eventSub?.cancel());
    _positionStream.close();
    _durationStream.close();
    _bufferStream.close();
    _playingStream.close();
    _bufferingStream.close();
    _completedStream.close();
    _errorStream.close();
  }
}
