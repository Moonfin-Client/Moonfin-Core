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
  final List<({String url, web.HTMLTrackElement element})> _externalTracks = [];
  JSAny? _hlsController;

  WebSubtitleOverlay? _subtitleOverlay;
  WebSubtitleOverlay get _overlay =>
      _subtitleOverlay ??= WebSubtitleOverlay(_videoElement);

  /// Marks a track whose cues are already being placed, so a track seen twice
  /// does not collect a second listener.
  static const _cueHookProperty = 'moonfinCuePlacement';

  /// The size the cue percentage is measured against, so the setting at its
  /// default leaves the browser drawing cues at its own size.
  static final double _referenceTextSize =
      UserPreferences.subtitlesTextSize.defaultValue;

  web.HTMLStyleElement? _subtitleStyleElement;
  int? _subtitleTextColor;
  int? _subtitleBackgroundColor;
  int? _subtitleStrokeColor;
  double? _subtitleFontSize;
  int? _subtitleFontWeight;
  double _subtitleVerticalOffset = 0;

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
  final _tracksChangedStream = StreamController<void>.broadcast();

  int _knownTextTrackCount = 0;

  web.HTMLVideoElement _createVideoElement() {
    final element = web.HTMLVideoElement()
      // The id is what the cue stylesheet selects on, so a second player on
      // the page keeps its own look.
      ..id = _viewType
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

    // Captions carried inside the video only turn up once enough of the stream
    // has been read, which on a live channel can be well after playback began.
    final textTrackCount = _videoElement.textTracks.length;
    if (textTrackCount != _knownTextTrackCount) {
      _knownTextTrackCount = textTrackCount;
      _forEachTextTrack(_watchCuesFor);
      if (!_tracksChangedStream.isClosed) {
        _tracksChangedStream.add(null);
      }
    }
  }

  /// The caption tracks the browser found in the stream itself.
  ///
  /// Only Safari reports these, from the CEA-608 data an HLS live channel
  /// carries inside its video. Tracks this backend added are always kind
  /// `subtitles`, so the kind alone tells the two apart.
  List<web.TextTrack> _inBandCaptionTracks() {
    final found = <web.TextTrack>[];
    try {
      final tracks = _videoElement.textTracks;
      for (var i = 0; i < tracks.length; i++) {
        final track = tracks[i];
        if (track.kind != 'captions') continue;
        found.add(track);
      }
    } catch (_) {}
    return found;
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
    _videoElement.src = url;
    _videoElement.load();
  }

  Future<void> _applySource(
    String url, {
    String? container,
    required Duration startPosition,
  }) async {
    _clearExternalTracks();

    // Subtitle tracks are fetched in whatever CORS mode the video element is
    // in, so a remote server needs this, and hls.js never touches the src
    // attribute, so it has to be set here rather than on the native path.
    // Asking for CORS on a same origin stream only gives playback another way
    // to fail, and the element outlives the source, so it comes back off again.
    if (_isCrossOrigin(url)) {
      _videoElement.crossOrigin = 'anonymous';
    } else {
      _videoElement.removeAttribute('crossorigin');
    }

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
      track.element.remove();
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
    final autoPlay = payload['autoPlay'] != false;
    final url = mediaItem is String
        ? mediaItem
        : payload['url']?.toString() ?? '';
    final container = payload['container']?.toString();
    if (url.isEmpty) return;

    _tracksKnown = false;
    _tracksReadyCompleter = null;
    _knownTextTrackCount = 0;
    _completed = false;
    _completedStream.add(false);

    await _applySource(url, container: container, startPosition: startPosition);

    if (autoPlay) {
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
    } else {
      _setPlaying(false);
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
    _knownTextTrackCount = 0;
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

    // Track ordinals count from one over the tracks the player was handed, and
    // the only ones a browser is ever handed are the ones added here, so the
    // ordinal is a position in that list.
    _showTrackAt(index - 1);
  }

  /// Shows the track at [position] in add order and hides everything else. A
  /// position outside the list just clears the screen.
  void _showTrackAt(int position) {
    _subtitleOverlay?.clear();

    try {
      final tracks = _videoElement.textTracks;
      for (var i = 0; i < tracks.length; i++) {
        tracks[i].mode = 'disabled';
      }

      for (var i = 0; i < _externalTracks.length; i++) {
        final element = _externalTracks[i].element;
        // Safari only draws cues for a track that carries the default
        // attribute when the page supplies its own controls, as this one does.
        if (i == position) {
          element.setAttribute('default', '');
          element.track.mode = 'showing';
        } else {
          element.removeAttribute('default');
        }
      }
    } catch (_) {}
  }

  @override
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks {
    final tracks = _inBandCaptionTracks();
    return List.unmodifiable([
      for (var i = 0; i < tracks.length; i++)
        EmbeddedCaptionTrack(
          id: i + 1,
          label: tracks[i].label.isEmpty ? 'CC${i + 1}' : tracks[i].label,
          language: tracks[i].language.isEmpty ? null : tracks[i].language,
        ),
    ]);
  }

  @override
  Stream<void> get tracksChangedStream => _tracksChangedStream.stream;

  @override
  Future<void> setEmbeddedCaptionTrack(int id) async {
    if (_disposed) return;
    final tracks = _inBandCaptionTracks();
    if (id <= 0 || id > tracks.length) return;

    _showTrackAt(-1);
    tracks[id - 1].mode = 'showing';
  }

  @override
  Future<void> disableSubtitleTrack() async {
    if (_disposed) return;
    _showTrackAt(-1);
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

    // Selecting a subtitle asks for it by url, so a track already on the
    // element is the one being asked for rather than a second copy of it.
    final existing = _externalTracks.indexWhere((track) => track.url == url);
    if (existing >= 0) {
      _showTrackAt(existing);
      return;
    }

    final element = web.HTMLTrackElement()
      ..kind = 'subtitles'
      ..src = url
      ..label = title ?? language ?? 'External Subtitle'
      ..srclang = language ?? 'en';

    if (codec != null && codec.isNotEmpty) {
      element.setAttribute('data-codec', codec);
    }

    _videoElement.appendChild(element);
    _externalTracks.add((url: url, element: element));
    _watchCuesFor(element.track);

    _showTrackAt(_externalTracks.length - 1);
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
    if (_disposed) return;
    if (textColor != null) _subtitleTextColor = textColor;
    if (backgroundColor != null) _subtitleBackgroundColor = backgroundColor;
    if (strokeColor != null) _subtitleStrokeColor = strokeColor;
    if (fontSize != null && fontSize > 0) _subtitleFontSize = fontSize;
    if (fontWeight != null) _subtitleFontWeight = fontWeight;
    if (verticalOffset != null) {
      _subtitleVerticalOffset = verticalOffset.clamp(0.0, 1.0);
    }
    _applySubtitleAppearance();
    _forEachTextTrack(_positionCues);
  }

  /// Appearance goes through a stylesheet, since `::cue` is the only hook the
  /// browser gives for text it draws itself.
  void _applySubtitleAppearance() {
    final rules = <String>[];
    final text = _cssColor(_subtitleTextColor);
    if (text != null) rules.add('color: $text');
    // An unset or fully transparent background has to be written out, or the
    // browser keeps drawing its own black box behind every line.
    rules.add(
      'background-color: ${_cssColor(_subtitleBackgroundColor) ?? 'transparent'}',
    );
    final size = _subtitleFontSize;
    if (size != null) {
      final percent = size / _referenceTextSize * 100;
      rules.add('font-size: ${percent.round()}%');
    }
    final weight = _subtitleFontWeight;
    if (weight != null) {
      rules.add('font-weight: ${weight >= 600 ? 'bold' : 'normal'}');
    }
    final stroke = _cssColor(_subtitleStrokeColor);
    // Offsets in em so the outline keeps its weight as the text is resized.
    rules.add(
      stroke == null
          ? 'text-shadow: none'
          : 'text-shadow: -0.04em -0.04em 0 $stroke, 0.04em -0.04em 0 $stroke, '
                '-0.04em 0.04em 0 $stroke, 0.04em 0.04em 0 $stroke',
    );

    final style = _subtitleStyleElement ??= _createSubtitleStyleElement();
    style.textContent = '#$_viewType::cue { ${rules.join('; ')} }';
  }

  web.HTMLStyleElement _createSubtitleStyleElement() {
    final style = web.HTMLStyleElement();
    (web.document.head ?? web.document.documentElement)?.appendChild(style);
    return style;
  }

  void _forEachTextTrack(void Function(web.TextTrack track) action) {
    try {
      final tracks = _videoElement.textTracks;
      for (var i = 0; i < tracks.length; i++) {
        action(tracks[i]);
      }
    } catch (_) {}
  }

  /// `::cue` cannot move a cue, so the position comes from the cue's own line,
  /// read as a percentage of the video box with the cue's bottom edge on it.
  /// A zero offset therefore puts the line on the bottom edge itself.
  void _positionCues(web.TextTrack track) {
    final cues = track.activeCues;
    if (cues == null) return;
    final line = (1 - _subtitleVerticalOffset) * 100;
    for (var i = 0; i < cues.length; i++) {
      final cue = cues[i];
      if (!cue.isA<web.VTTCue>()) continue;
      final vtt = cue as web.VTTCue;
      // The alignment is what makes the line measure the cue's bottom edge.
      // An engine that drops it would measure the top instead and push the
      // lowest positions off the picture, so a cue that will not take it stays
      // where the browser put it.
      vtt.lineAlign = 'end';
      if (vtt.lineAlign != 'end') continue;
      vtt.snapToLines = false;
      vtt.line = line.toJS;
    }
  }

  /// A cue can only be placed once it exists, and the ones carried inside a
  /// stream turn up long after playback began, so the track is asked again
  /// every time its active set changes.
  void _watchCuesFor(web.TextTrack track) {
    if (track.has(_cueHookProperty)) return;
    track.setProperty(_cueHookProperty.toJS, true.toJS);
    track.addEventListener(
      'cuechange',
      ((web.Event _) => _positionCues(track)).toJS,
    );
  }

  static String? _cssColor(int? argb) {
    if (argb == null) return null;
    final alpha = (argb >> 24) & 0xFF;
    if (alpha == 0) return null;
    final red = (argb >> 16) & 0xFF;
    final green = (argb >> 8) & 0xFF;
    final blue = argb & 0xFF;
    if (alpha == 0xFF) return 'rgb($red, $green, $blue)';
    return 'rgba($red, $green, $blue, ${(alpha / 255).toStringAsFixed(3)})';
  }

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

  @override
  bool get demuxesEmbeddedSubtitles => false;

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
    _subtitleStyleElement?.remove();
    _subtitleStyleElement = null;
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
    _tracksChangedStream.close();
  }
}
