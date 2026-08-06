import 'dart:async';

import 'package:flutter/foundation.dart' show visibleForTesting;
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

class Media3PlayerBackend extends PlayerBackend {
  static const _discontinuityWindowMs = 15000;
  static const _discontinuityThreshold = 3;
  static const _audioSinkErrorThreshold = 2;

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

  /// One-shot FFmpeg audio-extension state reported by the native side at
  /// first player build. Read by the playback diagnostics so silent-TrueHD
  /// reports show whether the bundled decoder registered at all.
  static Map<String, dynamic>? ffmpegDecoderDiagnostics;

  /// The audio slice of the setDecoderPreferences payload. The native side
  /// constrains its audio sink and downmix from exactly these values, so this
  /// stays a pure function of the prefs for the wire-contract tests.
  @visibleForTesting
  static Map<String, dynamic> audioDecoderPreferencesPayload(
    UserPreferences prefs,
  ) {
    return <String, dynamic>{
      'passthroughMode': prefs.get(UserPreferences.audioPassthroughMode).name,
      'passthroughCodecs': prefs
          .resolvedPassthroughCodecs()
          .map((codec) => codec.wireName)
          .toList(growable: false),
      'downmixToStereo': prefs.get(UserPreferences.downmixToStereo),
    };
  }

  /// How the native side should treat a Dolby Vision profile 7 stream.
  @visibleForTesting
  static Media3DoviCompatMode doviCompatMode(
    UserPreferences prefs, {
    bool? supportsP7,
    bool? supportsP8,
    bool? displaySupportsDolbyVision,
  }) {
    final behavior = prefs.get(
      UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
    );
    if (behavior == DolbyVisionProfile7DirectPlayBehavior.disabled) {
      return Media3DoviCompatMode.off;
    }
    if (supportsP7 ?? PlatformDetection.supportsDoViProfile7) {
      return Media3DoviCompatMode.native;
    }
    if (prefs.get(UserPreferences.media3MapDolbyVisionProfile7ToHevc)) {
      return Media3DoviCompatMode.strip;
    }
    final canShowDolbyVision =
        (supportsP8 ?? PlatformDetection.supportsDoViProfile8) &&
        (displaySupportsDolbyVision ?? PlatformDetection.supportsDolbyVision);
    return canShowDolbyVision
        ? Media3DoviCompatMode.convert
        : Media3DoviCompatMode.strip;
  }

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
  List<EmbeddedCaptionTrack> _embeddedCaptionTracks = const [];
  final StreamController<void> _tracksChangedController =
      StreamController<void>.broadcast();

  bool _disposed = false;
  bool _activityStarted = false;
  bool _sessionTunnelingDisabled = false;
  final List<int> _discontinuityTimestamps = <int>[];
  final List<int> _audioSinkErrorTimestamps = <int>[];
  Timer? _audioDelayDebounce;

  // Freeze diagnostics: surface decode/render stalls into the in-app report so
  // a frozen-picture playback is visible without adb. See _checkPlaybackWatchdogs.
  static const _watchdogStallMs = 6000;
  Timer? _watchdogTimer;
  String _watchdogItemLabel = 'item';
  bool _sawFirstFrame = false;
  bool _firstFrameWarned = false;
  int _playStartedAtMs = 0;
  int _lastObservedPositionMs = -1;
  int _lastPositionAdvanceAtMs = 0;
  bool _stallWarned = false;
  int _loadRequestedAtMs = 0;
  bool _neverStartedWarned = false;

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

  /// Re-activates a persistent (still-mounted) platform view for control
  /// routing. Returns false when the native side does not know the view;
  /// callers then rely on the default attach semantics.
  Future<bool> activateView(int viewId) async =>
      await _invoke<bool>('activateView', {'viewId': viewId}) ?? false;

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
        final wasPlaying = _isPlaying;
        final wasBuffering = _isBuffering;
        _position = Duration(milliseconds: _toInt(map['positionMs']));
        _duration = Duration(milliseconds: _toInt(map['durationMs']));
        _buffer = Duration(milliseconds: _toInt(map['bufferedMs']));
        _isPlaying = _toBool(map['isPlaying']);
        _isBuffering = _toBool(map['isBuffering']);
        if (_isPlaying != wasPlaying || _isBuffering != wasBuffering) {
          _diag(
            'Media3 state: playing=$_isPlaying buffering=$_isBuffering '
            'pos=${_position.inMilliseconds}ms',
          );
        }

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
        _embeddedCaptionTracks = EmbeddedCaptionTrack.listFromWire(
          map['closedCaptionTracks'],
        );
        _requestedSubtitleRendererMode = _modeFromWire(
          map['subtitleRendererModeRequested'],
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
        _diag(
          'Media3 player error: ${map['errorCode'] ?? ''} ${map['message'] ?? ''}',
          level: LogLevel.error,
        );
        _errorStream.add(map.cast<String, dynamic>());
      case 'error':
        final cause = map['cause']?.toString();
        _diag(
          'Media3 error: ${map['errorCode'] ?? ''} '
          '${map['errorCodeName'] ?? ''} ${map['message'] ?? ''}'
          '${cause == null || cause.isEmpty ? '' : ' caused by $cause'}',
          level: LogLevel.error,
        );
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
      case 'firstFrameRendered':
        _sawFirstFrame = true;
        _diag('Media3: first frame rendered @ ${_toInt(map['positionMs'])}ms');
      case 'droppedFrames':
        _diag(
          'Media3: dropped ${_toInt(map['count'])} video frames in '
          '${_toInt(map['elapsedMs'])}ms',
          level: LogLevel.warning,
        );
      case 'audioUnderrun':
        _diag(
          'Media3: audio underrun (buffer ${_toInt(map['bufferSizeMs'])}ms, '
          '${_toInt(map['elapsedMs'])}ms since last feed)',
          level: LogLevel.warning,
        );
      case 'audioSinkError':
        _diag(
          'Media3: audio sink error: ${map['message'] ?? ''}',
          level: LogLevel.warning,
        );
        _onAudioSinkError();
      case 'tunnelingDisabledOnAudioTrackFailure':
        _sessionTunnelingDisabled = true;
        _diag(
          'Media3: AudioTrack init failed under tunneling, '
          'retried untunneled for this session',
          level: LogLevel.warning,
        );
      case 'stereoDownmixReset':
        _diag(
          'Media3: sticky stereo downmix cleared '
          '(${map['reason'] ?? 'route change'})',
        );
      case 'ffmpegDecoderDiagnostics':
        ffmpegDecoderDiagnostics = <String, dynamic>{
          'available': map['available'] == true,
          'version': map['version']?.toString() ?? '',
          'supportsTrueHd': map['supportsTrueHd'] == true,
        };
        _diag(
          'Media3: FFmpeg decoder available=${map['available']} '
          'version=${map['version']} supportsTrueHd=${map['supportsTrueHd']}',
          level: map['available'] == true ? LogLevel.info : LogLevel.warning,
        );
      case 'playerRebuilt':
        _diag(
          'Media3: player rebuilt for new source '
          '(${map['viewType'] ?? ''}, sdk ${_toInt(map['sdk'])})',
        );
      case 'videoDecoderInit':
        _diag('Media3: video decoder initialized (${map['decoder'] ?? ''})');
      case 'audioDecoderInit':
        _diag('Media3: audio decoder initialized (${map['decoder'] ?? ''})');
      case 'audioTrackInitialized':
        _onAudioTrackInitialized(map);
      case 'audioTrackMapping':
        _onAudioTrackMapping(map);
      case 'doviCompat':
        _onDoviCompat(map);
      case 'videoSizeChanged':
        _diag(
          'Media3: video size ${_toInt(map['width'])}x${_toInt(map['height'])}',
        );
    }
  }

  void _onAudioTrackInitialized(Map<String, dynamic> map) {
    final passthrough = map['passthrough'] == true;
    final encodingName = map['encodingName']?.toString() ?? '';
    final channels = _toInt(map['outputChannels']);

    _diag(
      'Media3: audio track opened $encodingName ${channels}ch '
      '@${_toInt(map['sampleRate'])}Hz '
      '(passthrough=$passthrough tunneling=${map['tunneling'] == true} '
      'offload=${map['offload'] == true} buffer=${_toInt(map['bufferSize'])}B)',
    );
  }

  void _onAudioTrackMapping(Map<String, dynamic> map) {
    final tracks = (map['tracks'] as List<dynamic>? ?? const [])
        .whereType<Map<dynamic, dynamic>>()
        .toList(growable: false);
    if (tracks.isEmpty) return;

    final rendered = tracks
        .map(
          (track) =>
              '#${track['position']} ${track['codec']} '
              '${track['channels']}ch ${track['language']} '
              'on ${track['renderer']}'
              '${track['selected'] == true ? ' [selected]' : ''}'
              '${track['supported'] == false ? ' [unsupported]' : ''}',
        )
        .join(', ');

    // Audio spanning more than one renderer is what makes the source ordering
    // matter, so a report should say when it happened.
    final split = map['splitAcrossRenderers'] == true;
    _diag(
      'Media3: audio tracks $rendered'
      '${split ? ' (split across renderers)' : ''}',
      level: split ? LogLevel.warning : LogLevel.info,
    );
  }

  /// Records what the Dolby Vision profile 7 chain did with a track. A P7
  /// stream that plays wrong is otherwise indistinguishable from a bad file,
  /// so the report carries the decision, where the RPU came from, and the
  /// running counts behind it.
  void _onDoviCompat(Map<String, dynamic> map) {
    final reason = map['reason']?.toString() ?? 'decided';
    final applied = map['mode']?.toString() ?? 'none';
    final requested = map['requestedMode']?.toString() ?? 'none';
    final detail = map['detail']?.toString();

    final headline = switch (reason) {
      'untouched' => 'DoVi P7 left untouched',
      'progress' => 'DoVi P7 still handled as $applied',
      'converterFailed' => 'DoVi P7 conversion stopped working',
      'disarmed' => 'DoVi P7 rewriting stood down',
      _ =>
        applied == requested
            ? 'DoVi P7 handled as $applied'
            : 'DoVi P7 asked for $requested, settled on $applied',
    };

    final counts =
        'samples ${_toInt(map['samplesFiltered'])}, '
        'RPUs seen ${_toInt(map['rpusSeen'])} '
        '(converted ${_toInt(map['rpusConverted'])}, '
        'dropped ${_toInt(map['rpusDropped'])}, '
        'failed ${_toInt(map['rpusFailed'])}), '
        'EL units dropped ${_toInt(map['enhancementUnitsDropped'])}, '
        'block additions ${_toInt(map['blockAdditionsRead'])}, '
        'bytes ${_toInt(map['bytesIn'])} in ${_toInt(map['bytesOut'])} out';

    _diag(
      'Media3: $headline${detail == null ? '' : ' ($detail)'}. '
      'Codecs ${map['codecs']}, RPU source ${map['rpuSource']}, '
      'converter ${map['converterStatus']}. $counts. '
      'NAL types ${map['nalCensus']}, layout ${map['sampleLayout']}. '
      'Format ${map['formatSummary']}',
      level: reason == 'converterFailed' || reason == 'disarmed'
          ? LogLevel.warning
          : LogLevel.info,
    );
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

  /// Tunneled sink failures don't always surface as discontinuity
  /// exceptions. Some chains fail with generic sink errors, so repeated
  /// bare sink errors while tunneling is active are treated as a tunneling
  /// problem and trigger the same fallback as discontinuities.
  void _onAudioSinkError() {
    if (_sessionTunnelingDisabled) {
      return;
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    _audioSinkErrorTimestamps.removeWhere(
      (timestamp) => nowMs - timestamp > _discontinuityWindowMs,
    );
    _audioSinkErrorTimestamps.add(nowMs);

    if (_audioSinkErrorTimestamps.length < _audioSinkErrorThreshold) {
      return;
    }

    _audioSinkErrorTimestamps.clear();
    _diag(
      'Media3: repeated audio sink errors under tunneling, '
      'disabling tunneling for this session',
      level: LogLevel.warning,
    );
    // Session-only fallback. Generic sink errors are a weaker tunneling
    // signal than discontinuity exceptions, so they don't persist the
    // tunneling-disabled preference the way _onTunnelingDiscontinuity does.
    unawaited(disableTunnelingFallback(persist: false));
  }

  void _diag(String message, {LogLevel level = LogLevel.debug}) {
    if (GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().media(message, level: level);
    }
  }

  void _resetPlaybackWatchdogs(String itemLabel) {
    _watchdogItemLabel = itemLabel;
    _sawFirstFrame = false;
    _firstFrameWarned = false;
    _stallWarned = false;
    _playStartedAtMs = 0;
    _lastObservedPositionMs = -1;
    _lastPositionAdvanceAtMs = 0;
    _loadRequestedAtMs = DateTime.now().millisecondsSinceEpoch;
    _neverStartedWarned = false;
    _watchdogTimer ??= Timer.periodic(
      const Duration(seconds: 2),
      (_) => _checkPlaybackWatchdogs(),
    );
  }

  void _checkPlaybackWatchdogs() {
    if (_disposed) return;
    final nowMs = DateTime.now().millisecondsSinceEpoch;

    // Mark when playback actually started so first-frame timing is measured
    // from "playing", not from the load call.
    if (_isPlaying && _playStartedAtMs == 0) {
      _playStartedAtMs = nowMs;
    }

    // Never-started watchdog: load was requested but the player never reached
    // "playing" and never drew a frame (the buffering-forever hang). Timed from
    // the load call since "playing" never arrives. _sawFirstFrame stays true
    // after a good item, so this stays quiet in the gap between items.
    if (_loadRequestedAtMs != 0 &&
        !_neverStartedWarned &&
        !_sawFirstFrame &&
        !_isPlaying &&
        nowMs - _loadRequestedAtMs > _watchdogStallMs) {
      _neverStartedWarned = true;
      _diag(
        'Media3 watchdog: "$_watchdogItemLabel" never started after '
        '${_watchdogStallMs ~/ 1000}s (stuck loading, buffering=$_isBuffering, '
        'pos=${_position.inMilliseconds}ms, suspected preroll-to-feature freeze)',
        level: LogLevel.warning,
      );
    }

    // First-frame watchdog: the player reports playing but the picture never
    // drew. This is the frozen-first-frame case (clock can still advance).
    if (_isPlaying &&
        !_sawFirstFrame &&
        !_firstFrameWarned &&
        _playStartedAtMs != 0 &&
        nowMs - _playStartedAtMs > _watchdogStallMs) {
      _firstFrameWarned = true;
      _diag(
        'Media3 watchdog: "$_watchdogItemLabel" playing but no first frame after '
        '${_watchdogStallMs ~/ 1000}s (suspected freeze; buffering=$_isBuffering, '
        'pos=${_position.inMilliseconds}ms)',
        level: LogLevel.warning,
      );
    }

    // Position-stall watchdog: playing and not buffering, but the position is
    // not advancing. Catches a hard hang where the clock stops too.
    if (_isPlaying && !_isBuffering) {
      final posMs = _position.inMilliseconds;
      if (posMs != _lastObservedPositionMs) {
        _lastObservedPositionMs = posMs;
        _lastPositionAdvanceAtMs = nowMs;
        _stallWarned = false;
      } else if (_lastPositionAdvanceAtMs != 0 &&
          !_stallWarned &&
          nowMs - _lastPositionAdvanceAtMs > _watchdogStallMs) {
        _stallWarned = true;
        _diag(
          'Media3 watchdog: "$_watchdogItemLabel" position stalled at ${posMs}ms '
          'for ${_watchdogStallMs ~/ 1000}s while playing (suspected freeze)',
          level: LogLevel.warning,
        );
      }
    } else {
      // Paused or buffering: keep the stall baseline fresh so it does not fire
      // a false positive when playback legitimately stops advancing.
      _lastObservedPositionMs = _position.inMilliseconds;
      _lastPositionAdvanceAtMs = nowMs;
    }
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

    final isPreview = payload['preview'] == true;

    _completed = false;
    _tracksKnown = false;
    _textTrackCount = 0;
    _embeddedCaptionTracks = const [];
    _tracksReadyCompleter = null;
    _discontinuityTimestamps.clear();
    _audioSinkErrorTimestamps.clear();
    if (isPreview) {
      // Muted previews/trailers are routinely canceled mid-load; disarm the
      // never-started watchdog instead of re-arming it and logging warnings.
      _loadRequestedAtMs = 0;
    } else {
      _resetPlaybackWatchdogs(
        payload['itemName']?.toString() ??
            payload['title']?.toString() ??
            'item',
      );
    }
    _skipSilenceEnabled = _prefs.get(UserPreferences.media3SkipSilence);
    _volumeBoostLevel = 0;
    final preferredAudioLanguage = _normalizeTrackLanguagePref(
      payload['preferredAudioLanguage']?.toString() ??
          _prefs.get(UserPreferences.defaultAudioLanguage),
    );
    final preferredSubtitleLanguage = _normalizeTrackLanguagePref(
      payload['preferredTextLanguage']?.toString() ??
          _prefs.get(UserPreferences.defaultSubtitleLanguage),
    );
    final tunnelingDisabledByUser = _prefs.get(
      UserPreferences.media3TunnelingDisabled,
    );
    _sessionTunnelingDisabled =
        _prefs.get(UserPreferences.tunnelingFallbackDisabled) ||
        tunnelingDisabledByUser;

    await _ensureActivityStarted();

    // The probes behind this only exist on the device, so a report has to say
    // what they resolved to or the handling of a P7 file can't be explained.
    final doviMode = doviCompatMode(_prefs);
    _diag(
      'Media3: DoVi P7 policy ${doviMode.name} '
      '(P7 decoder ${PlatformDetection.supportsDoViProfile7}, '
      'P8 decoder ${PlatformDetection.supportsDoViProfile8}, '
      'DoVi display ${PlatformDetection.supportsDolbyVision})',
    );

    await _invoke<void>('setDecoderPreferences', {
      'preferFfmpeg': _prefs.get(UserPreferences.preferExoPlayerFfmpeg),
      'tunnelingDisabled': _sessionTunnelingDisabled,
      'doviCompatMode': doviMode.name,
      'allowExternalAudioEffects': _prefs.get(
        UserPreferences.media3AllowExternalAudioEffects,
      ),
      'frameRateSwitchingBehavior': _prefs
          .get(UserPreferences.refreshRateSwitchingBehavior)
          .name,
      ...audioDecoderPreferencesPayload(_prefs),
    });
    await _invoke<void>('setSource', {
      'url': url,
      'headers': headers,
      'autoPlay': true,
      'startPositionMs': startPosition.inMilliseconds,
      'container': container,
      'videoRangeType': videoRangeType,
      'mediaType': mediaType,
      'isLive': payload['isLive'] == true,
      'normalizationGainDb': normalizationGainDb,
      'skipSilenceEnabled': _skipSilenceEnabled,
      'preferredAudioLanguage': preferredAudioLanguage,
      'preferredTextLanguage': preferredSubtitleLanguage,
      if (payload['audioTrackOrdinal'] is int)
        'audioTrackOrdinal': payload['audioTrackOrdinal'],
      'selectUndeterminedTextLanguage': false,
      'forceSubtitlesDisabledOnStart':
          _prefs.get(UserPreferences.subtitleMode) == SubtitleMode.none,
      'audioDelayMs': (_audioDelaySeconds * 1000).round(),
      'subtitleDelayMs': (_subtitleDelaySeconds * 1000).round(),
      'volumeBoostLevel': _volumeBoostLevel,
      'preview': isPreview,
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

  Future<void> appPaused() async {
    await _invoke<void>('appPaused');
  }

  Future<void> appResumed() async {
    await _invoke<void>('appResumed');
  }

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
    final audioCapabilityProfile = _prefs.detectedAudioCapabilities;

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      audioCapabilityProfile: audioCapabilityProfile,
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      maxAudioChannels: _prefs.resolveMaxAudioChannels(),
      downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
      // Media3 bundles the FFmpeg audio decoder extension, so every advertised
      // codec has a software decoder behind it.
      universalAudioDecode: true,
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay) && canRenderBitmapSubtitles,
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: PlatformDetection.supportsAvc,
      supportsAvcHigh10: PlatformDetection.supportsAvcHigh10,
      avcMainLevel: PlatformDetection.avcMainLevel,
      avcHigh10Level: PlatformDetection.avcHigh10Level,
      supportsHevc: PlatformDetection.supportsHevc,
      supportsHevcMain10: PlatformDetection.supportsHevcMain10,
      transcodeHevcAllowed: serverAllowsHevcTranscode(),
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
            hasHardwareDolbyVisionDecoder:
                PlatformDetection.supportsHevcDolbyVision,
            hasDoviCompat: true,
          ),
      directPlayVideoContainers: media3DirectPlayVideoContainers,
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
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks => _embeddedCaptionTracks;

  @override
  Stream<void> get tracksChangedStream => _tracksChangedController.stream;

  @override
  Future<void> setEmbeddedCaptionTrack(int id) async {
    await _invoke<void>('setClosedCaptionTrack', {'id': id});
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
  bool get supportsDirectPlayAudioSwitch => true;

  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  // ExoPlayer is built with setAudioAttributes(attrs, handleAudioFocus = true),
  // so the native player owns Android audio focus for this backend.
  @override
  bool get managesAudioFocus => true;

  @override
  bool get canRenderBitmapSubtitles => true;

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _audioDelayDebounce?.cancel();
    _audioDelayDebounce = null;
    _watchdogTimer?.cancel();
    _watchdogTimer = null;
    unawaited(_stopActivity());
    unawaited(_eventSub?.cancel());
    _positionStream.close();
    _durationStream.close();
    _bufferStream.close();
    _playingStream.close();
    _bufferingStream.close();
    _completedStream.close();
    _errorStream.close();
    _tracksChangedController.close();
  }
}

/// What the native side does with a Dolby Vision profile 7 stream. Names
/// travel over the wire and match the Kotlin enum.
enum Media3DoviCompatMode { native, convert, strip, off }

/// Containers media3 can actually demux. The shared default list carries
/// asf, wmv, ogm, and ogv for the mpv backends, none of which media3 reads
/// (its Ogg support is audio only), so those route to a server remux here.
/// AVI and FLV extractors exist in media3 and join in their place.
const String media3DirectPlayVideoContainers =
    'avi,dash,flv,hls,m4v,mkv,mov,mp4,ts,vob,webm,xvid';
