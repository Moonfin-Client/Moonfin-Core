import 'dart:async';

import 'package:video_player/video_player.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import 'audio_capability_profile.dart';
import 'device_profile_builder.dart';
import 'known_defects.dart';

/// Playback backend for Tizen (Samsung TV).
///
/// libmpv (media_kit) and ExoPlayer (Media3) are unavailable on Tizen, so this
/// backend drives the standard `video_player` plugin, whose Tizen
/// implementation (`video_player_tizen`) is backed by the native Tizen AVPlay
/// player. AVPlay hardware-decodes the TV's supported codecs.
///
/// Known limitations vs. the libmpv backend (the app compensates by letting the
/// media server transcode / select tracks server-side):
///   * No runtime audio/subtitle track switching ([supportsRuntimeTrackSelection]
///     is false) — the `video_player` API does not expose track lists.
///   * No bitmap (PGS/VOBSUB) subtitle rendering, no ASS styling, no audio/
///     subtitle delay, and no external subtitle sideloading.
class TizenPlayerBackend extends PlayerBackend {
  TizenPlayerBackend(this._prefs);

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
    if (value.duration != _duration) {
      _duration = value.duration;
      _durationCtl.add(_duration);
    }
    final buffered =
        value.buffered.isNotEmpty ? value.buffered.last.end : Duration.zero;
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

    final reachedEnd = value.duration > Duration.zero &&
        value.position >= value.duration &&
        !value.isPlaying;
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
    if (url.isEmpty) return;

    await _disposeController();
    if (_isDisposed) return;

    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    _controller = controller;
    _completedEmitted = false;
    _position = Duration.zero;
    _duration = Duration.zero;
    _buffer = Duration.zero;
    controller.addListener(_onValue);

    await controller.initialize();
    if (_isDisposed) {
      await _disposeController();
      return;
    }
    if (startPosition > Duration.zero) {
      await controller.seekTo(startPosition);
    }
    await controller.setPlaybackSpeed(_speed);
    await controller.play();
    _onValue();
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
  Duration get duration => _controller?.value.duration ?? _duration;

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
    final maxBitrate = int.tryParse(_prefs.get(UserPreferences.maxBitrate));
    final maxResolution = _prefs.get(UserPreferences.maxVideoResolution);
    final allowDolbyVisionProfile7DirectPlay =
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
      behavior: _prefs.get(
        UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
      ),
    );
    final audioCapabilityProfile = const AudioCapabilityProfile.optimistic();

    // Conservative Samsung-TV capability set: H.264 + HEVC (incl. Main10/HDR10)
    // direct-play up to 4K; everything else (AV1, VC1, Dolby Vision) is left to
    // server transcoding. Per-model capability detection over the C# runner is a
    // future improvement (mirroring the Android TV platform channel).
    const uhdWidth = 3840;
    const uhdHeight = 2160;
    const h264Level52 = 52;
    const hevcLevel62 = 183;

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
      trueHdAtmosPassthroughEnabled:
          _prefs.resolveTrueHdAtmosPassthroughEnabled(),
      maxAudioChannels: _prefs.resolveMaxAudioChannels(),
      maxResolution: maxResolution,
      pgsDirectPlay: false,
      assDirectPlay: false,
      supportsAvc: true,
      supportsAvcHigh10: true,
      avcMainLevel: h264Level52,
      avcHigh10Level: h264Level52,
      supportsHevc: true,
      supportsHevcMain10: true,
      hevcMainLevel: hevcLevel62,
      supportsHevcDolbyVision: false,
      supportsHevcDolbyVisionEl: false,
      supportsHevcHdr10: true,
      supportsHevcHdr10Plus: true,
      supportsAv1: false,
      supportsAv1Main10: false,
      supportsAv1DolbyVision: false,
      supportsAv1Hdr10: false,
      supportsAv1Hdr10Plus: false,
      supportsVc1: false,
      maxResolutionAvcWidth: uhdWidth,
      maxResolutionAvcHeight: uhdHeight,
      maxResolutionHevcWidth: uhdWidth,
      maxResolutionHevcHeight: uhdHeight,
      maxResolutionAv1Width: 0,
      maxResolutionAv1Height: 0,
      maxResolutionVc1Width: 0,
      maxResolutionVc1Height: 0,
      supportsDvProfile5: false,
      supportsDvProfile7: false,
      supportsDvProfile8: false,
      knownHevcDoviHdr10PlusBug: false,
      allowDolbyVisionProfile7ElDirectPlay: allowDolbyVisionProfile7DirectPlay,
    );
  }

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    _speed = speed;
    await _controller?.setPlaybackSpeed(speed);
  }


  // The standard video_player API exposes no runtime track selection; tracks are
  // selected server-side via the device profile / transcoding instead.
  @override
  Future<void> setAudioTrack(int index) async {}

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
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get requiresStartupMediaReadyCheck => true;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  bool get canRenderBitmapSubtitles => false;

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
