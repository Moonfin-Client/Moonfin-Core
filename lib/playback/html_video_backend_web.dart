import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:playback_core/playback_core.dart';
import 'package:web/web.dart' as web;

import '../preference/user_preferences.dart';
import 'html_video_backend_profile.dart';
import 'web_subtitle_overlay_web.dart';

extension type _MoonfinHlsBridge._(JSObject _) implements JSObject {
  external JSBoolean canUseHlsJs(
    web.HTMLVideoElement video,
    JSString url,
    JSBoolean forceHls,
  );

  external JSAny? attach(
    web.HTMLVideoElement video,
    JSString url,
    JSBoolean forceHls,
  );

  external void destroy(JSAny? controller);
}

class HtmlVideoBackend extends PlayerBackend {
  HtmlVideoBackend(this._prefs)
    : _viewType = 'moonfin-html-video-${_nextViewId++}' {
    _videoElement = _createVideoElement();
    _registerViewFactory();
  }

  static int _nextViewId = 1;
  static final Set<String> _registeredViewTypes = <String>{};

  final UserPreferences _prefs;
  final String _viewType;

  late final web.HTMLVideoElement _videoElement;
  final List<web.HTMLTrackElement> _externalTracks = <web.HTMLTrackElement>[];
  JSAny? _hlsController;

  WebSubtitleOverlay? _subtitleOverlay;
  WebSubtitleOverlay get _overlay =>
      _subtitleOverlay ??= WebSubtitleOverlay(_videoElement);

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _completed = false;
  double _playbackSpeed = 1.0;
  double _volume = 100.0;
  bool _disposed = false;
  bool _tracksKnown = false;

  Timer? _statePollTimer;
  Completer<void>? _tracksReadyCompleter;

  final _positionStream = StreamController<Duration>.broadcast();
  final _durationStream = StreamController<Duration>.broadcast();
  final _bufferStream = StreamController<Duration>.broadcast();
  final _playingStream = StreamController<bool>.broadcast();
  final _bufferingStream = StreamController<bool>.broadcast();
  final _completedStream = StreamController<bool>.broadcast();
  final _errorStream = StreamController<Map<String, dynamic>>.broadcast();

  web.HTMLVideoElement _createVideoElement() {
    final element = web.HTMLVideoElement()
      ..autoplay = false
      ..controls = false
      ..preload = 'auto'
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain'
      ..style.pointerEvents = 'none'
      ..style.backgroundColor = 'black';
    element.setAttribute('playsinline', '');
    return element;
  }

  void _registerViewFactory() {
    if (_registeredViewTypes.add(_viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(
        _viewType,
        (int _) => _videoElement,
      );
    }
  }

  void _startStatePolling() {
    _statePollTimer ??= Timer.periodic(
      const Duration(milliseconds: 250),
      (_) => _pollState(),
    );
  }

  void _stopStatePolling() {
    _statePollTimer?.cancel();
    _statePollTimer = null;
  }

  void _pollState() {
    if (_disposed) return;

    final positionMs = (_videoElement.currentTime * 1000).round();
    final position = Duration(milliseconds: positionMs.clamp(0, 1 << 31));
    _setPosition(position);

    final rawDuration = _videoElement.duration;
    if (rawDuration.isFinite && rawDuration >= 0) {
      final durationMs = (rawDuration * 1000).round();
      final duration = Duration(milliseconds: durationMs.clamp(0, 1 << 31));
      _setDuration(duration);
    }

    final buffered = _readBufferedDuration();
    _setBuffer(buffered);

    final ended = _videoElement.ended;
    if (ended != _completed) {
      _completed = ended;
      _completedStream.add(_completed);
    }

    final currentlyPlaying = !_videoElement.paused && !ended;
    _setPlaying(currentlyPlaying);

    final bufferingNow =
        currentlyPlaying &&
        (_videoElement.readyState < web.HTMLMediaElement.HAVE_FUTURE_DATA);
    _setBuffering(bufferingNow);

    if (!_tracksKnown &&
        _videoElement.readyState > web.HTMLMediaElement.HAVE_NOTHING) {
      _tracksKnown = true;
      _tracksReadyCompleter?.complete();
      _tracksReadyCompleter = null;
    }
  }

  Duration _readBufferedDuration() {
    try {
      final ranges = _videoElement.buffered;
      final rangeCount = ranges.length;
      if (rangeCount <= 0) return Duration.zero;
      final end = ranges.end(rangeCount - 1);
      final bufferedMs = (end * 1000).round();
      return Duration(milliseconds: bufferedMs.clamp(0, 1 << 31));
    } catch (_) {
      return Duration.zero;
    }
  }

  void _setPosition(Duration value) {
    if (_position == value) return;
    _position = value;
    _positionStream.add(value);
  }

  void _setDuration(Duration value) {
    if (_duration == value) return;
    _duration = value;
    _durationStream.add(value);
  }

  void _setBuffer(Duration value) {
    if (_buffer == value) return;
    _buffer = value;
    _bufferStream.add(value);
  }

  void _setPlaying(bool value) {
    if (_isPlaying == value) return;
    _isPlaying = value;
    _playingStream.add(value);
  }

  void _setBuffering(bool value) {
    if (_isBuffering == value) return;
    _isBuffering = value;
    _bufferingStream.add(value);
  }

  _MoonfinHlsBridge? _resolveHlsBridge() {
    if (!web.window.has('MoonfinHlsBridge')) {
      return null;
    }

    final bridgeAny = web.window.getProperty('MoonfinHlsBridge'.toJS);
    return _MoonfinHlsBridge._(bridgeAny as JSObject);
  }

  bool _isLikelyHlsContainer(String? container) {
    if (container == null || container.isEmpty) {
      return false;
    }
    final normalized = container.toLowerCase();
    return normalized.contains('hls') || normalized.contains('m3u8');
  }

  bool _canUseHlsJs(String url, {required bool forceHls}) {
    final bridge = _resolveHlsBridge();
    if (bridge == null) {
      return false;
    }

    try {
      return bridge.canUseHlsJs(_videoElement, url.toJS, forceHls.toJS).toDart;
    } catch (_) {
      return false;
    }
  }

  bool _attachHlsJsSource(String url, {required bool forceHls}) {
    final bridge = _resolveHlsBridge();
    if (bridge == null) {
      return false;
    }

    try {
      _hlsController = bridge.attach(_videoElement, url.toJS, forceHls.toJS);
      return _hlsController != null;
    } catch (_) {
      _hlsController = null;
      return false;
    }
  }

  void _detachHlsJsSource() {
    final controller = _hlsController;
    _hlsController = null;
    if (controller == null) {
      return;
    }

    final bridge = _resolveHlsBridge();
    if (bridge == null) {
      return;
    }

    try {
      bridge.destroy(controller);
    } catch (_) {}
  }

  static bool _isCrossOrigin(String url) {
    final target = Uri.tryParse(url);
    if (target == null || !target.hasAuthority) return false;
    final page = Uri.base;
    return target.scheme != page.scheme ||
        target.host != page.host ||
        target.port != page.port;
  }

  void _applyNativeSource(String url) {
    // Subtitle tracks are fetched in whatever CORS mode the video element is
    // in, so a remote server needs this. Asking for CORS on a same origin
    // stream only gives playback another way to fail, and the element outlives
    // the source, so it comes back off again.
    if (_isCrossOrigin(url)) {
      _videoElement.crossOrigin = 'anonymous';
    } else {
      _videoElement.removeAttribute('crossorigin');
    }
    _videoElement.src = url;
    _videoElement.load();
  }

  Future<void> _applySource(
    String url, {
    String? container,
    required Duration startPosition,
  }) async {
    _clearExternalTracks();

    final forceHls = _isLikelyHlsContainer(container);
    _detachHlsJsSource();
    final attachedWithHlsJs = _canUseHlsJs(url, forceHls: forceHls)
        ? _attachHlsJsSource(url, forceHls: forceHls)
        : false;

    if (!attachedWithHlsJs) {
      _applyNativeSource(url);
    }

    if (startPosition > Duration.zero) {
      _videoElement.currentTime = startPosition.inMilliseconds / 1000;
    }

    _videoElement.playbackRate = _playbackSpeed;
    _videoElement.volume = (_volume / 100).clamp(0.0, 1.0);
  }

  void _clearExternalTracks() {
    for (final track in _externalTracks) {
      track.remove();
    }
    _externalTracks.clear();
    _subtitleOverlay?.clear();
  }

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    if (_disposed) return;

    final payload = mediaItem is Map ? mediaItem : const <String, dynamic>{};
    final url = mediaItem is String
        ? mediaItem
        : payload['url']?.toString() ?? '';
    final container = payload['container']?.toString();
    if (url.isEmpty) return;

    _tracksKnown = false;
    _tracksReadyCompleter = null;
    _completed = false;
    _completedStream.add(false);

    await _applySource(url, container: container, startPosition: startPosition);

    _setBuffering(true);
    try {
      await _videoElement.play().toDart;
      _setPlaying(true);
    } catch (error) {
      _setPlaying(false);
      _errorStream.add(<String, dynamic>{
        'event': 'playerError',
        'message': error.toString(),
      });
    } finally {
      _setBuffering(false);
    }

    _startStatePolling();
  }

  @override
  Future<void> resume() async {
    if (_disposed) return;
    try {
      await _videoElement.play().toDart;
      _setPlaying(true);
    } catch (error) {
      _errorStream.add(<String, dynamic>{
        'event': 'playerError',
        'message': error.toString(),
      });
      _setPlaying(false);
    }
    _startStatePolling();
  }

  @override
  Future<void> pause() async {
    if (_disposed) return;
    _videoElement.pause();
    _setPlaying(false);
    _setBuffering(false);
  }

  @override
  Future<void> stop() async {
    if (_disposed) return;
    _videoElement.pause();
    _detachHlsJsSource();
    _videoElement.removeAttribute('src');
    _videoElement.load();
    _clearExternalTracks();
    _tracksKnown = false;
    _tracksReadyCompleter = null;
    _setPlaying(false);
    _setBuffering(false);
    _setPosition(Duration.zero);
    _setBuffer(Duration.zero);
    _setDuration(Duration.zero);
    if (_completed) {
      _completed = false;
      _completedStream.add(false);
    }
    _stopStatePolling();
  }

  @override
  Future<void> seekTo(Duration position) async {
    if (_disposed) return;
    final seconds = position.inMilliseconds / 1000;
    _videoElement.currentTime = seconds;
    _setPosition(position);
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
  Stream<Map<String, dynamic>> get errorStream => _errorStream.stream;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) {
    return buildHtmlVideoBackendDeviceProfile(
      _prefs,
      useProgressiveTranscode: useProgressiveTranscode,
    );
  }

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    _playbackSpeed = speed;
    if (_disposed) return;
    _videoElement.playbackRate = speed;
  }

  @override
  Future<void> setAudioTrack(int index) async {
  }


  @override
  Future<void> setSubtitleTrack(
    int index, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {
    if (_disposed) return;

    if (isExternalSubtitle &&
        externalSubtitleUrl != null &&
        externalSubtitleUrl.isNotEmpty) {
      await addExternalSubtitle(externalSubtitleUrl, codec: subtitleCodec);
      return;
    }

    _subtitleOverlay?.clear();

    try {
      final dynamic tracks = (_videoElement as dynamic).textTracks;
      final length = (tracks.length as num?)?.toInt() ?? 0;

      dynamic targetTrackObj;
      if (index >= 0 && index < _externalTracks.length) {
        targetTrackObj = (_externalTracks[index] as dynamic).track;
      } else {
        targetTrackObj = index >= 0 && index < length ? tracks[index] : null;
      }

      for (var i = 0; i < length; i++) {
        final dynamic track = tracks[i];
        track.mode = 'disabled';
      }

      if (targetTrackObj != null) {
        targetTrackObj.mode = 'showing';
      }
    } catch (_) {}
  }

  @override
  Future<void> disableSubtitleTrack() async {
    if (_disposed) return;
    _subtitleOverlay?.clear();
    try {
      final dynamic tracks = (_videoElement as dynamic).textTracks;
      final length = (tracks.length as num?)?.toInt() ?? 0;
      for (var i = 0; i < length; i++) {
        final dynamic track = tracks[i];
        track.mode = 'disabled';
      }
    } catch (_) {}
  }

  @override
  Future<void> waitForTracksReady() async {
    if (_tracksKnown) {
      return;
    }

    _tracksReadyCompleter ??= Completer<void>();
    try {
      await _tracksReadyCompleter!.future.timeout(const Duration(seconds: 2));
    } catch (_) {}
  }

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {
    await waitForTracksReady();
  }

  @override
  Future<void> setVolume(double volume) async {
    _volume = volume.clamp(0.0, 100.0);
    if (_disposed) return;
    _videoElement.volume = (_volume / 100).clamp(0.0, 1.0);
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
  }) async {
    if (_disposed || url.isEmpty) return;

    if (WebSubtitleOverlay.isOverlayCodec(codec)) {
      await _overlay.show(url, codec);
      return;
    }

    final track = web.HTMLTrackElement()
      ..kind = 'subtitles'
      ..src = url
      ..label = title ?? language ?? 'External Subtitle'
      ..srclang = language ?? 'en';

    if (codec != null && codec.isNotEmpty) {
      track.setAttribute('data-codec', codec);
    }

    _videoElement.appendChild(track);
    _externalTracks.add(track);

    await setSubtitleTrack(_externalTracks.length - 1);
  }

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
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {
  }

  @override
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  bool get canRenderBitmapSubtitles => true;

  Widget buildView({BoxFit fit = BoxFit.contain}) {
    _videoElement.style.objectFit = _cssObjectFit(fit);
    return HtmlElementView(viewType: _viewType);
  }

  String _cssObjectFit(BoxFit fit) {
    switch (fit) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitWidth:
        return 'scale-down';
      case BoxFit.fitHeight:
        return 'scale-down';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scale-down';
    }
  }

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _stopStatePolling();
    _clearExternalTracks();
    _subtitleOverlay?.dispose();
    _subtitleOverlay = null;
    _detachHlsJsSource();
    _videoElement.pause();
    _videoElement.removeAttribute('src');
    _videoElement.load();

    _positionStream.close();
    _durationStream.close();
    _bufferStream.close();
    _playingStream.close();
    _bufferingStream.close();
    _completedStream.close();
    _errorStream.close();
  }
}
