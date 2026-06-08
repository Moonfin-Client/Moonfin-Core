import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:video_player_avplay/video_player.dart';
import 'package:video_player_avplay/video_player_platform_interface.dart'
    show DisplayMode;
import 'package:playback_core/playback_core.dart';

import '../data/services/log_service.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import 'tizen_device_profile.dart';

/// Playback backend for Tizen (Samsung TV).
///
/// libmpv (media_kit) and ExoPlayer (Media3) are unavailable on Tizen, so this
/// backend drives `video_player_avplay`, backed by Samsung's native AVPlay /
/// PlusPlayer engine. AVPlay hardware-decodes and renders through a hardware
/// video overlay (hole-punching) instead of copying frames through a Flutter
/// texture, which is what keeps 4K/HDR playback smooth on TV-class SoCs.
///
/// Track selection:
///   * Audio switches natively via AVPlay ([supportsRuntimeTrackSelection] is
///     true): instant, no server-side re-transcode.
///   * Subtitles stay on the server-side re-resolve path
///     ([supportsRuntimeSubtitleSelection] is false). video_player_avplay can
///     select a text track but exposes no API to turn subtitles off, which would
///     strand the "Subtitles Off" action.
class TizenPlayerBackend implements PlayerBackend {
  TizenPlayerBackend(this._prefs);

  static const Duration _prepareTimeout = Duration(seconds: 30);

  final UserPreferences _prefs;

  VideoPlayerController? _controller;

  /// Exposed so the player UI can render `VideoPlayer(controller)` for the
  /// active Tizen surface.
  VideoPlayerController? get controller => _controller;

  final StreamController<Duration> _positionCtl =
      StreamController<Duration>.broadcast();
  final StreamController<Duration> _durationCtl =
      StreamController<Duration>.broadcast();
  final StreamController<Duration> _bufferCtl =
      StreamController<Duration>.broadcast();
  final StreamController<bool> _playingCtl = StreamController<bool>.broadcast();
  final StreamController<bool> _bufferingCtl =
      StreamController<bool>.broadcast();
  final StreamController<bool> _completedCtl =
      StreamController<bool>.broadcast();
  final StreamController<Map<String, dynamic>> _errorCtl =
      StreamController<Map<String, dynamic>>.broadcast();

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  double _speed = 1.0;
  bool _completedEmitted = false;
  bool _isDisposed = false;

  void _onValue() {
    final controller = _controller;
    if (controller == null) return;
    final value = controller.value;

    if (value.position != _position) {
      _position = value.position;
      _positionCtl.add(_position);
    }
    // avplay models duration as a DurationRange (start..end) to support live
    // windows; the app wants the end as a single duration.
    final duration = value.duration.end;
    if (duration != _duration) {
      _duration = duration;
      _durationCtl.add(_duration);
    }
    // avplay reports buffering as a 0..100 percent, not a time range, so map it
    // onto the known duration to get a buffered-ahead position for the seek bar.
    final buffered = _duration * (value.buffered / 100.0).clamp(0.0, 1.0);
    if (buffered != _buffer) {
      _buffer = buffered;
      _bufferCtl.add(_buffer);
    }
    if (value.isPlaying != _isPlaying) {
      _isPlaying = value.isPlaying;
      _playingCtl.add(_isPlaying);
    }
    if (value.isBuffering != _isBuffering) {
      _isBuffering = value.isBuffering;
      _bufferingCtl.add(_isBuffering);
    }

    final reachedEnd = value.isCompleted ||
        (duration > Duration.zero &&
            value.position >= duration &&
            !value.isPlaying);
    if (reachedEnd) {
      if (!_completedEmitted) {
        _completedEmitted = true;
        _completedCtl.add(true);
      }
    } else {
      _completedEmitted = false;
    }

    if (value.hasError) {
      _errorCtl.add(<String, dynamic>{
        'message': value.errorDescription ?? 'Tizen playback error',
      });
    }
  }

  void _log(String message, {LogLevel level = LogLevel.debug, Object? error}) {
    if (GetIt.I.isRegistered<LogService>()) {
      GetIt.I<LogService>()
          .playback('[Tizen] $message', level: level, error: error);
    }
  }

  Future<void> _disposeController() async {
    final controller = _controller;
    _controller = null;
    if (controller == null) return;
    controller.removeListener(_onValue);
    try {
      await controller.dispose();
    } catch (_) {}
  }

  @override
  Future<void> play(
    dynamic mediaItem,
    {Duration startPosition = Duration.zero}) async {
    final url = mediaItem is String
        ? mediaItem
        : (mediaItem is Map ? mediaItem['url']?.toString() ?? '' : '');
    if (url.isEmpty) {
      _log('play() aborted: empty url', level: LogLevel.warning);
      return;
    }
    _log('play() url=$url');

    await _disposeController();
    if (_isDisposed) return;

    final controller = VideoPlayerController.network(url);
    _controller = controller;
    _completedEmitted = false;
    _position = Duration.zero;
    _duration = Duration.zero;
    _buffer = Duration.zero;
    controller.addListener(_onValue);

    _log('AVPlay prepare starting (timeout ${_prepareTimeout.inSeconds}s)');
    try {
      await controller.initialize().timeout(_prepareTimeout);
    } catch (e) {
      _log('AVPlay prepare FAILED/timed out', level: LogLevel.error, error: e);
      await _disposeController();
      rethrow;
    }
    if (_isDisposed) {
      await _disposeController();
      return;
    }
    _log('AVPlay prepared: duration=${controller.value.duration.end}, '
        'size=${controller.value.size}');
    if (startPosition > Duration.zero) {
      await controller.seekTo(startPosition);
    }
    await controller.setPlaybackSpeed(_speed);
    await controller.play();
    await syncZoomMode();
    _onValue();
    _log('play() started (isPlaying=${controller.value.isPlaying})');
  }

  /// Applies the user's zoom preference to AVPlay's hardware scaler. The overlay
  /// fills the screen and AVPlay handles aspect, so the Flutter surface stays a
  /// plain full-bleed hole (see the player screen's Tizen surface builder).
  Future<void> syncZoomMode() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    final mode = switch (_prefs.get(UserPreferences.playerZoomMode)) {
      ZoomMode.fit => DisplayMode.letterBox,
      ZoomMode.stretch => DisplayMode.fullScreen,
      ZoomMode.autoCrop => DisplayMode.croppedFull,
    };
    try {
      await controller.setDisplayMode(mode);
    } catch (_) {}
  }

  @override
  Future<void> resume() async => _controller?.play();

  @override
  Future<void> pause() async => _controller?.pause();

  @override
  Future<void> stop() async {
    await _controller?.pause();
    await _disposeController();
  }

  @override
  Future<void> seekTo(Duration position) async =>
      _controller?.seekTo(position);

  @override
  Duration get position => _controller?.value.position ?? _position;

  @override
  Duration get duration => _controller?.value.duration.end ?? _duration;

  @override
  Duration get buffer => _buffer;

  @override
  bool get isPlaying => _controller?.value.isPlaying ?? _isPlaying;

  @override
  bool get isBuffering => _controller?.value.isBuffering ?? _isBuffering;

  @override
  double get playbackSpeed => _speed;

  @override
  Stream<Duration> get positionStream => _positionCtl.stream;

  @override
  Stream<Duration> get durationStream => _durationCtl.stream;

  @override
  Stream<Duration> get bufferStream => _bufferCtl.stream;

  @override
  Stream<bool> get playingStream => _playingCtl.stream;

  @override
  Stream<bool> get bufferingStream => _bufferingCtl.stream;

  @override
  Stream<bool> get completedStream => _completedCtl.stream;

  @override
  Stream<Map<String, dynamic>>? get errorStream => _errorCtl.stream;

  @override
  Map<String, dynamic> getDeviceProfile({bool useProgressiveTranscode = false}) {
    _log('deviceProfile ${TizenDeviceProfile.debugSummary}');
    return TizenDeviceProfile.build(
      maxBitrateMbps: int.tryParse(_prefs.get(UserPreferences.maxBitrate)),
      maxResolution: _prefs.get(UserPreferences.maxVideoResolution),
    );
  }

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    _speed = speed;
    await _controller?.setPlaybackSpeed(speed);
  }

  /// Switches the active audio track natively via AVPlay.
  ///
  /// [PlaybackManager] passes a 1-based ordinal within the audio streams (see
  /// `_mpvTrackIdForStream`), which lines up with AVPlay's per-type track list,
  /// so ordinal N maps to `audioTracks[N - 1]`.
  @override
  Future<void> setAudioTrack(int index) async {
    final controller = _controller;
    if (controller == null || index < 1) return;
    try {
      final tracks = await controller.audioTracks;
      if (tracks == null || tracks.isEmpty) return;
      final pos = index - 1;
      if (pos < 0 || pos >= tracks.length) return;
      await controller.setTrackSelection(tracks[pos]);
    } catch (_) {
      // Track list not ready or selection rejected; keep the current track.
    }
  }

  // Subtitles route server-side, so these stay no-ops on Tizen.
  @override
  Future<void> setSubtitleTrack(
    int index, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {}

  @override
  Future<void> disableSubtitleTrack() async {}

  @override
  Future<void> waitForTracksReady() async {
    final controller = _controller;
    if (controller != null && !controller.value.isInitialized) {
      await controller.initialize();
    }
  }

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {}

  @override
  Future<void> setVolume(double volume) async {
    // The app uses a 0..100 scale; video_player expects 0..1.
    await _controller?.setVolume((volume / 100.0).clamp(0.0, 1.0));
  }

  // The Tizen backend plays through the `video_player` plugin, which exposes no
  // Dart-level audio/subtitle delay API (AVPlay's setSubtitlePosition and audio
  // sync are not surfaced). Both remain no-ops and `supportsAudioDelay`/
  // `supportsSubtitleDelay` stay false, so the in-player delay control is hidden.
  @override
  Future<void> setAudioDelay(double seconds) async {}

  @override
  Future<void> setSubtitleDelay(double seconds) async {}

  @override
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  }) async {}

  @override
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
  }) async {}

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  bool get supportsRuntimeTrackSelection => true;

  @override
  bool get supportsRuntimeSubtitleSelection => false;

  @override
  bool get requiresStartupMediaReadyCheck => true;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  bool get canRenderBitmapSubtitles => false;

  @override
  bool get supportsAudioDelay => false;

  @override
  bool get supportsSubtitleDelay => false;

  @override
  void dispose() {
    _isDisposed = true;
    unawaited(_disposeController());
    _positionCtl.close();
    _durationCtl.close();
    _bufferCtl.close();
    _playingCtl.close();
    _bufferingCtl.close();
    _completedCtl.close();
    _errorCtl.close();
  }
}
