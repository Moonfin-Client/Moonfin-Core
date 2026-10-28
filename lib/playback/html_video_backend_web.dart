import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:playback_core/playback_core.dart';
import 'package:web/web.dart' as web;

import '../preference/user_preferences.dart';
import 'html_video_backend_profile.dart';
import 'letterbox_croppers.dart';
import 'secondary_subtitle_position.dart';
import 'web_subtitle_overlay_web.dart';
import 'web_secondary_subtitle_url.dart';
import 'web_subtitle_position.dart';
import 'web_subtitle_text.dart';

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

class HtmlVideoBackend extends PlayerBackend
    with SubtitleDelayState
    implements SecondarySubtitleBackend {
  HtmlVideoBackend(this._prefs)
    : _viewType = 'moonfin-html-video-${_nextViewId++}' {
    _videoElement = _createVideoElement();
    _videoElement.addEventListener(
      'seeked',
      ((web.Event _) {
        if (_disposed) return;
        // A seek starts a new placement context, unlike a dialogue gap.
        _primaryReferenceCues = const [];
        _positionSecondaryCues();
      }).toJS,
    );
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
  bool _primaryUsesOverlay = false;
  WebSubtitleOverlay get _overlay => _subtitleOverlay ??=
      (WebSubtitleOverlay(
        _videoElement,
        onError: (message) {
          if (!_disposed) {
            _errorStream.add({'event': 'subtitleError', 'message': message});
          }
        },
      )..setDelay(subtitleDelaySeconds));

  /// Marks a track whose cues are already being placed, so a track seen twice
  /// does not collect a second listener.
  static const _cueHookProperty = 'moonfinCuePlacement';
  static const _cueStartTime = 'moonfinCueStartTime';
  static const _cueEndTime = 'moonfinCueEndTime';
  static const _authoredSrtAlignment = 'moonfinAuthoredSrtAlignment';
  static const _autoPositionedCue = 'moonfinAutoPositionedCue';
  static const _authoredLine = 'moonfinAuthoredLine';
  static const _authoredSnapToLines = 'moonfinAuthoredSnapToLines';
  static const _authoredLineAlign = 'moonfinAuthoredLineAlign';
  static const _stackedMiddleLine = 'moonfinStackedMiddleLine';
  static const _stackedMiddleLineAlign = 'moonfinStackedMiddleLineAlign';
  static const _stackedMiddleSnapToLines = 'moonfinStackedMiddleSnapToLines';

  /// Scale the browser's usual caption size by the user's text-size setting.
  static final double _referenceTextSize =
      UserPreferences.subtitlesTextSize.defaultValue;

  web.HTMLStyleElement? _subtitleStyleElement;
  int? _subtitleTextColor;
  int? _subtitleBackgroundColor;
  int? _subtitleStrokeColor;
  double? _subtitleFontSize;
  int? _subtitleFontWeight;
  double _subtitleVerticalOffset = 0;
  // Check a fresh cue: assigning an unsupported property merely creates a JS field.
  static final _nativeLineAlignment = web.VTTCue(0, 1, '').has('lineAlign');
  static final _nativePositionAlignment = web.VTTCue(0, 1, '').has('positionAlign');
  final _cueLayouts =
      <String, ({double height, WebVttHorizontalPlacement horizontal})>{};
  (int, int)? _lastCueViewport;

  double get _cueCanvasHeight => _videoElement.clientHeight > 0
      ? _videoElement.clientHeight.toDouble()
      : 720;

  double _cueFontSize({bool secondary = false}) =>
      _cueCanvasHeight *
      0.05 *
      ((secondary ? _secondaryFontSize : null) ??
          _subtitleFontSize ??
          _referenceTextSize) /
      _referenceTextSize;

  void _setCueLine(
    web.VTTCue cue,
    double edge,
    String anchor, {
    bool secondary = false,
  }) {
    cue.snapToLines = false;
    if (_nativeLineAlignment) {
      cue.lineAlign = anchor;
      cue.line = (edge * 100).clamp(0.0, 100.0).toDouble().toJS;
    } else {
      // Older browsers place a percentage cue within the space left after its
      // own height. Convert our top/bottom edge into that coordinate system.
      final height = _primaryCueHeight(cue, secondary: secondary);
      final top =
          edge -
          (anchor == 'end'
              ? height
              : anchor == 'center'
              ? height / 2
              : 0);
      cue.line = (top / (1 - height).clamp(0.001, 1.0) * 100)
          .clamp(0.0, 100.0)
          .toDouble()
          .toJS;
    }
  }

  web.HTMLTrackElement? _secondaryTrack;
  web.AbortController? _secondaryRequest;
  String? _secondaryUrl;
  String _secondaryLanguage = 'und';
  String? _secondaryObjectUrl;
  int _secondaryGeneration = 0;
  final _secondaryCues = <({web.VTTCue cue, double start, double end})>[];
  double _secondaryDelay = 0;
  double _secondaryOffset = 0.0;
  // Retain authored cues across dialogue gaps, not bounds measured at an old
  // font size, offset or viewport. Their original coordinates are saved below.
  List<web.VTTCue> _primaryReferenceCues = const [];
  double? _secondaryFontSize;
  int? _secondaryTextColor;

  @override
  bool get supportsSecondarySubtitleDelay => true;
  @override
  bool get supportsSecondarySubtitlePosition => true;
  @override
  bool get supportsSecondarySubtitleStyle => true;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _completed = false;
  double _playbackSpeed = 1.0;
  double _volume = 100.0;
  bool _disposed = false;
  int _sourceGeneration = 0;
  int _playbackGeneration = 0;
  bool _tracksKnown = false;

  bool _isCurrentSource(int generation) =>
      !_disposed && generation == _sourceGeneration;

  bool _isCurrentPlaybackRequest(int generation) =>
      !_disposed && generation == _playbackGeneration;

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
    final viewport = (_videoElement.clientWidth, _videoElement.clientHeight);
    if (_lastCueViewport != viewport) {
      _lastCueViewport = viewport;
      _applySubtitleAppearance();
      _forEachTextTrack(_positionCues);
      _positionSecondaryCues();
    }

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
    // HLS and live caption tracks can receive new cues after their initial load.
    if (subtitleDelaySeconds != 0) _forEachTextTrack(_retimePrimaryCues);
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
    _clearSecondarySubtitle();
    _primaryReferenceCues = const [];
    _primaryUsesOverlay = false;
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
    final source = ++_sourceGeneration;
    final generation = ++_playbackGeneration;
    updateSubtitleDelaySession(payload['subtitleDelaySessionId'] as int?);

    _tracksKnown = false;
    _tracksReadyCompleter = null;
    _knownTextTrackCount = 0;
    _completed = false;
    _completedStream.add(false);

    await _applySource(url, container: container, startPosition: startPosition);
    if (!_isCurrentSource(source)) return;
    // Style the first cue even if it arrives before the initial viewport poll.
    _applySubtitleAppearance();
    await setSubtitleDelay(subtitleDelaySeconds);
    if (!_isCurrentSource(source)) return;
    await setSecondarySubtitleDelay(
      ((payload['secondarySubtitleDelayMs'] as num?) ?? 0) / 1000,
    );
    if (!_isCurrentSource(source)) return;
    await configureSecondarySubtitleStyle(
      fontSize: (payload['secondarySubtitleFontSize'] as num?)?.toDouble(),
      verticalOffset: (payload['secondarySubtitleOffset'] as num?)?.toDouble(),
      textColor: (payload['secondarySubtitleTextColor'] as num?)?.toInt(),
    );
    if (!_isCurrentSource(source)) return;
    await setSecondarySubtitle(
      url: payload['secondarySubtitleUrl'] as String?,
      codec: payload['secondarySubtitleCodec'] as String?,
      language: payload['secondarySubtitleLanguage'] as String?,
    );
    if (!_isCurrentSource(source)) return;

    // A pause or resume since this started has already settled whether it
    // plays, but the new source still needs polling either way.
    if (_isCurrentPlaybackRequest(generation)) {
      if (autoPlay) {
        _setBuffering(true);
        try {
          await _videoElement.play().toDart;
          if (_isCurrentPlaybackRequest(generation)) _setPlaying(true);
        } catch (error) {
          if (_isCurrentPlaybackRequest(generation)) {
            _setPlaying(false);
            _errorStream.add(<String, dynamic>{
              'event': 'playerError',
              'message': error.toString(),
            });
          }
        } finally {
          if (_isCurrentPlaybackRequest(generation)) _setBuffering(false);
        }
      } else {
        _setPlaying(false);
        _setBuffering(false);
      }
    }

    if (_isCurrentSource(source)) _startStatePolling();
  }

  @override
  Future<void> resume() async {
    if (_disposed) return;
    final generation = ++_playbackGeneration;
    try {
      await _videoElement.play().toDart;
      if (!_isCurrentPlaybackRequest(generation)) return;
      _setPlaying(true);
    } catch (error) {
      if (!_isCurrentPlaybackRequest(generation)) return;
      _errorStream.add(<String, dynamic>{
        'event': 'playerError',
        'message': error.toString(),
      });
      _setPlaying(false);
    }
    if (_isCurrentPlaybackRequest(generation)) _startStatePolling();
  }

  @override
  Future<void> pause() async {
    if (_disposed) return;
    ++_playbackGeneration;
    _videoElement.pause();
    _setPlaying(false);
    _setBuffering(false);
  }

  @override
  Future<void> stop() async {
    if (_disposed) return;
    ++_sourceGeneration;
    ++_playbackGeneration;
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
      await _showExternalSubtitle(externalSubtitleUrl, codec: subtitleCodec);
      return;
    }

    // Primary subtitle IDs are 1-based positions in _externalTracks.
    _showTrackAt(index - 1);
  }

  /// Shows the native primary track at [position] in add order. An out-of-range
  /// position hides native primary tracks. [primaryUsesOverlay] distinguishes an
  /// ASS/PGS primary from Off. The secondary track stays enabled.
  void _showTrackAt(int position, {bool primaryUsesOverlay = false}) {
    _subtitleOverlay?.clear();
    _primaryUsesOverlay = primaryUsesOverlay;
    _restorePrimaryMiddlePosition();
    _primaryReferenceCues = const [];

    try {
      final tracks = _videoElement.textTracks;
      for (var i = 0; i < tracks.length; i++) {
        if (tracks[i] == _secondaryTrack?.track) continue;
        tracks[i].mode = 'disabled';
      }

      for (var i = 0; i < _externalTracks.length; i++) {
        final element = _externalTracks[i].element;
        // Safari only draws cues for a track that carries the default
        // attribute when the page supplies its own controls, as this one does.
        if (i == position) {
          if (element.parentNode == null) {
            _videoElement.appendChild(element);
          }
          // Detached tracks keep their cues, including any earlier delay.
          element.track.mode = 'hidden';
          _retimePrimaryCues(element.track);
          element.setAttribute('default', '');
          element.track.mode = 'showing';
        } else {
          element.removeAttribute('default');
          // Remove unselected primary track elements to stop Chromium enabling them
          // automatically. Keep the selected primary and the separate secondary track
          // attached.
          element.remove();
        }
      }
    } catch (_) {}
    _positionSecondaryCues();
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
  Future<void> setSubtitleDelay(double seconds) async {
    if (_disposed) return;
    subtitleDelaySeconds = seconds;
    _forEachTextTrack(_retimePrimaryCues);
    _subtitleOverlay?.setDelay(seconds);
    _retimeSecondaryCues();
  }

  void _retimePrimaryCues(web.TextTrack track) {
    if (track == _secondaryTrack?.track) return;
    final cues = track.cues;
    if (cues == null) return;
    // Changing a start time can reorder the browser's live cue list.
    final snapshot = List.generate(cues.length, (i) => cues[i]);
    for (final cue in snapshot) {
      final savedStart = cue.getProperty<JSNumber?>(_cueStartTime.toJS);
      if (savedStart == null && subtitleDelaySeconds == 0) continue;
      final start = savedStart?.toDartDouble ?? cue.startTime;
      final end = cue.getProperty<JSNumber?>(_cueEndTime.toJS)?.toDartDouble ??
          cue.endTime;
      if (savedStart == null) {
        cue
          ..setProperty(_cueStartTime.toJS, start.toJS)
          ..setProperty(_cueEndTime.toJS, end.toJS);
      }
      final shiftedStart = start + subtitleDelaySeconds;
      final shiftedEnd = end + subtitleDelaySeconds;
      if (cue.startTime != shiftedStart) cue.startTime = shiftedStart;
      if (cue.endTime != shiftedEnd) cue.endTime = shiftedEnd;
    }
  }

  @override
  Future<void> setSecondarySubtitle({
    String? url,
    String? codec,
    String? language,
    int? embeddedTrackId,
  }) async {
    if (_disposed) return;
    final value = language?.trim();
    final srclang = value == null || value.isEmpty ? 'und' : value;
    if (url != null && url == _secondaryUrl) {
      _secondaryLanguage = srclang;
      _secondaryTrack?.srclang = srclang;
      return;
    }
    _clearSecondarySubtitle();
    if (url == null || url.isEmpty) return;
    _secondaryUrl = url;
    _secondaryLanguage = srclang;
    // This backend can't read subtitle tracks from the media container. Use the
    // server-provided subtitle URL, including for tracks embedded in MKV files.
    unawaited(_loadSecondarySubtitle(url, _secondaryGeneration));
  }

  Future<void> _loadSecondarySubtitle(String url, int generation) async {
    final abort = _secondaryRequest = web.AbortController();
    try {
      // Request server-converted WebVTT when the URL is a Jellyfin/Emby
      // subtitle endpoint. Other external SRT files are converted locally.
      final preferredUrl = preferServerWebVttSubtitleUrl(url);
      web.Response? response;
      try {
        response = await web.window
            .fetch(preferredUrl.toJS, web.RequestInit(signal: abort.signal))
            .toDart;
      } catch (_) {
        if (preferredUrl == url) rethrow;
      }
      if (preferredUrl != url && response?.ok != true) {
        if (_disposed || generation != _secondaryGeneration ||
            abort.signal.aborted) {
          return;
        }
        response = await web.window
            .fetch(url.toJS, web.RequestInit(signal: abort.signal))
            .toDart;
      }
      if (response == null) throw StateError('Subtitle request failed');
      if (!response.ok) throw StateError('HTTP ${response.status}');
      final content = (await response.text().toDart).toDart;
      if (_disposed || generation != _secondaryGeneration) return;
      // The HTML track element expects WebVTT. Convert SRT responses before attaching
      // the secondary track.
      final vtt = _asWebVtt(content);
      final objectUrl = _secondaryObjectUrl = web.URL.createObjectURL(
        web.Blob([vtt.toJS].toJS, web.BlobPropertyBag(type: 'text/vtt')),
      );
      final element = _secondaryTrack = web.HTMLTrackElement()
        ..kind = 'subtitles'
        ..label = 'Secondary'
        ..srclang = _secondaryLanguage
        ..src = objectUrl;
      element.addEventListener(
        'load',
        ((web.Event _) {
          if (_disposed || generation != _secondaryGeneration) return;
          final cues = element.track.cues;
          _secondaryCues.clear();
          if (cues != null) {
            for (var i = 0; i < cues.length; i++) {
              final cue = cues[i] as web.VTTCue;
              _secondaryCues.add((
                cue: cue,
                start: cue.startTime,
                end: cue.endTime,
              ));
              cue.text = secondaryWebVttCueText(cue.text);
            }
          }
          _retimeSecondaryCues();
          _positionSecondaryCues();
          element.track.mode = 'showing';
        }).toJS,
      );
      element.addEventListener(
        'error',
        ((web.Event _) {
          _secondaryLoadFailed(generation);
        }).toJS,
      );
      element.track.addEventListener('cuechange', ((web.Event _) {
        if (!_disposed && generation == _secondaryGeneration) _positionSecondaryCues();
      }).toJS);
      _videoElement.appendChild(element);
      // Load without briefly rendering at the primary track's position.
      element.track.mode = 'hidden';
    } catch (_) {
      _secondaryLoadFailed(generation);
    }
  }

  static String _asWebVtt(String content) {
    final text = content
        .replaceFirst(RegExp(r'^\uFEFF'), '')
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .trim();
    if (text.startsWith('WEBVTT')) return '$text\n\n';
    // Only replace decimal commas on timing lines, leaving dialogue intact.
    final timing = RegExp(
      r'^(\d{2,}:\d{2}:\d{2}),(\d{3})(\s+-->\s+\d{2,}:\d{2}:\d{2}),(\d{3})',
      multiLine: true,
    );
    return 'WEBVTT\n\n${text.replaceAllMapped(timing, (m) => '${m[1]}.${m[2]}${m[3]}.${m[4]}')}\n\n';
  }

  void _secondaryLoadFailed(int generation) {
    if (_disposed || generation != _secondaryGeneration) return;
    _clearSecondarySubtitle();
    _errorStream.add({
      'event': 'subtitleError',
      'message': 'Could not load secondary subtitle file',
    });
  }

  void _clearSecondarySubtitle() {
    _secondaryGeneration++;
    _secondaryRequest?.abort();
    _secondaryRequest = null;
    _secondaryTrack?.track.mode = 'disabled';
    _secondaryTrack?.remove();
    _secondaryTrack = null;
    _secondaryCues.clear();
    _restorePrimaryMiddlePosition();
    _secondaryUrl = null;
    final objectUrl = _secondaryObjectUrl;
    _secondaryObjectUrl = null;
    if (objectUrl != null) web.URL.revokeObjectURL(objectUrl);
  }

  @override
  Future<void> setSecondarySubtitleDelay(double seconds) async {
    if (_disposed) return;
    final delay = seconds.clamp(-5.0, 5.0);
    if (_secondaryDelay == delay) return;
    _secondaryDelay = delay;
    _retimeSecondaryCues();
  }

  @override
  Future<void> configureSecondarySubtitleStyle({
    double? fontSize,
    double? verticalOffset,
    int? textColor,
  }) async {
    if (_disposed) return;
    final size = fontSize?.clamp(6.0, 72.0);
    final sizeChanged = _secondaryFontSize != size;
    final styleChanged = sizeChanged ||
        _secondaryTextColor != textColor ||
        _subtitleStyleElement == null;
    if (styleChanged) {
      _secondaryFontSize = size;
      _secondaryTextColor = textColor;
      _applySubtitleAppearance();
    }
    final offset = PlaybackManager.clampSecondarySubtitleOffset(
      verticalOffset ?? PlaybackManager.defaultSecondarySubtitleOffset,
    );
    if (_secondaryOffset == offset && !sizeChanged) return;
    _secondaryOffset = offset;
    _positionSecondaryCues();
  }

  void _retimeSecondaryCues() {
    final delay = subtitleDelaySeconds + _secondaryDelay;
    for (final original in _secondaryCues) {
      original.cue
        ..startTime = original.start + delay
        ..endTime = original.end + delay;
    }
  }

  // Use the fallback if the browser doesn't expose the requested cue alignment
  // property or its getter fails.
  String _cueAlignment(web.VTTCue cue, String property, String fallback) {
    try {
      final value = cue.getProperty<JSAny?>(property.toJS)?.dartify();
      if (value is String) return value;
    } catch (_) {}
    return fallback;
  }

  // Remove the saved coordinates used to split a centered subtitle pair.
  void _clearPrimaryMiddleCueState(web.VTTCue cue) {
    cue
      ..delete(_stackedMiddleLine.toJS)
      ..delete(_stackedMiddleLineAlign.toJS)
      ..delete(_stackedMiddleSnapToLines.toJS);
  }

  void _restorePrimaryMiddlePosition() {
    _forEachTextTrack((track) {
      final cues = track.cues;
      if (cues == null) return;
      for (var i = 0; i < cues.length; i++) {
        if (!cues[i].isA<web.VTTCue>()) continue;
        final cue = cues[i] as web.VTTCue;
        final original = cue.getProperty<JSNumber?>(_stackedMiddleLine.toJS);
        if (original != null) {
          cue
            ..line = original
            ..snapToLines = cue.getProperty<JSBoolean?>(
              _stackedMiddleSnapToLines.toJS,
            )?.toDart ?? false;
          if (_nativeLineAlignment) cue.lineAlign = _cueAlignment(cue, _stackedMiddleLineAlign, 'center');
          _clearPrimaryMiddleCueState(cue);
        }
      }
    });
  }

  List<web.VTTCue> _activePrimaryCues() {
    final active = <web.VTTCue>[];
    final tracks = _videoElement.textTracks;
    for (var i = 0; i < tracks.length; i++) {
      final track = tracks[i];
      if (track == _secondaryTrack?.track || track.mode != 'showing') continue;
      final cues = track.activeCues;
      if (cues == null) continue;
      for (var j = 0; j < cues.length; j++) {
        if (cues[j].isA<web.VTTCue>()) active.add(cues[j] as web.VTTCue);
      }
    }
    return active;
  }

  int _primaryAlignment(web.VTTCue cue, double centre) {
    final authored = int.tryParse(
      cue.getProperty<JSString?>(_authoredSrtAlignment.toJS)?.toDart ?? '',
    );
    if (authored != null) return authored;
    // lineAlign identifies the cue edge attached to the line coordinate. Determine top,
    // middle or bottom placement from the original cue position, before applying the
    // user offset.
    final authoredCentre = cue.has(_autoPositionedCue)
        ? 1.0
        : cue.getProperty<JSNumber?>(_authoredLine.toJS) != null
        ? _primaryCueBounds(cue, authored: true).centre
        : centre;
    final row = authoredCentre < 1 / 3 ? 2 : authoredCentre > 2 / 3 ? 0 : 1;
    final column = switch (cue.align) {
      'left' || 'start' => 0,
      'right' || 'end' => 2,
      _ => 1,
    };
    return row * 3 + column + 1;
  }

  // Measure the same font and cue width used by the native renderer. Keep a small
  // cache so polling doesn't add DOM layout work for an unchanged subtitle.
  double _primaryCueHeight(web.VTTCue cue, {bool secondary = false}) =>
      _measureCue(cue, secondary: secondary).height;

  ({double height, WebVttHorizontalPlacement horizontal}) _measureCue(
    web.VTTCue cue, {
    bool secondary = false,
  }) {
    final canvasWidth = _videoElement.clientWidth > 0
        ? _videoElement.clientWidth
        : 1280;
    final rawPosition = cue.position.dartify();
    final positionAlign = _nativePositionAlignment
        ? _cueAlignment(cue, 'positionAlign', 'auto')
        : 'auto';
    final font = _cueFontSize(secondary: secondary);
    final key =
        '${cue.text}|$canvasWidth|$_cueCanvasHeight|${cue.size}|'
        '$rawPosition|${cue.align}|$positionAlign|$font|$_subtitleFontWeight';
    final cached = _cueLayouts[key];
    if (cached != null) return cached;
    final measure = web.HTMLDivElement()
      ..dir = 'auto'
      ..style.cssText =
          'position:fixed;visibility:hidden;left:-10000px;'
          'white-space:pre-line;overflow-wrap:break-word;box-sizing:border-box;'
          'font-family:sans-serif;font-size:${font}px;'
          'line-height:1.2;font-weight:${(_subtitleFontWeight ?? 400) >= 600 ? 700 : 400};';
    measure.appendChild(cue.getCueAsHTML());
    web.document.body?.appendChild(measure);
    final horizontal = webVttHorizontalPlacement(
      align: cue.align,
      position: rawPosition is num ? rawPosition.toDouble() : null,
      positionAlign: positionAlign,
      size: cue.size,
      rtl: (cue.align == 'start' || cue.align == 'end') &&
          web.window.getComputedStyle(measure).direction == 'rtl',
      supportsPositionAlign: _nativePositionAlignment,
    );
    measure.style.width = '${canvasWidth * horizontal.size / 100}px';
    final height = (measure.getBoundingClientRect().height / _cueCanvasHeight)
        .clamp(font * 1.2 / _cueCanvasHeight, 0.95)
        .toDouble();
    measure.remove();
    if (_cueLayouts.length >= 256) _cueLayouts.clear();
    return _cueLayouts[key] = (height: height, horizontal: horizontal);
  }

  ({double top, double bottom, double centre}) _primaryCueBounds(
    web.VTTCue cue, {
    bool authored = false,
  }) {
    final height = _primaryCueHeight(cue);
    final originalLine = cue.getProperty<JSNumber?>(
      (authored ? _authoredLine : _stackedMiddleLine).toJS,
    );
    final rawLine = originalLine?.toDartDouble ?? cue.line.dartify();
    final line = rawLine is num
        ? rawLine.toDouble()
        : (1 - _subtitleVerticalOffset) * 100;
    final snapped =
        cue
            .getProperty<JSBoolean?>(
              (authored ? _authoredSnapToLines : _stackedMiddleSnapToLines)
                  .toJS,
            )
            ?.toDart ??
        cue.snapToLines;
    final lineHeight = _cueFontSize() * 1.2 / _cueCanvasHeight;
    // Negative snapped lines anchor the bottom of the entire cue box.
    final top = snapped
        ? (line < 0
              ? 1 + (line + 1) * lineHeight - height
              : line * lineHeight)
        : !_nativeLineAlignment
        ? line / 100 * (1 - height)
        : switch (_cueAlignment(
            cue,
            authored ? _authoredLineAlign : _stackedMiddleLineAlign,
            _cueAlignment(cue, 'lineAlign', 'start'),
          )) {
            'start' => line / 100,
            'center' => line / 100 - height / 2,
            _ => line / 100 - height,
          };
    return (
      top: top.clamp(0.0, 1.0).toDouble(),
      bottom: (top + height).clamp(0.0, 1.0).toDouble(),
      centre: (top + height / 2).clamp(0.0, 1.0).toDouble(),
    );
  }

  Object _cuePlacement(web.VTTCue cue) => (
    cue.line.dartify(), cue.snapToLines, cue.position.dartify(), cue.size,
    cue.align, cue.vertical, cue.region,
    _nativeLineAlignment ? _cueAlignment(cue, 'lineAlign', 'start') : null,
    _nativePositionAlignment ? _cueAlignment(cue, 'positionAlign', 'auto') : null,
  );

  void _positionSecondaryCues() {
    if (_secondaryCues.isEmpty) return;
    final activePrimary = _activePrimaryCues();
    if (activePrimary.isNotEmpty) _primaryReferenceCues = activePrimary;
    _positionPrimaryCues(_primaryReferenceCues);
    final primary = _primaryReferenceCues.firstOrNull;
    final bounds = primary == null ? null : _primaryCueBounds(primary);
    final row = primary == null
        ? 0
        : (_primaryAlignment(primary, bounds!.centre) - 1) ~/ 3;
    final gap = middleSubtitleGap(0.015, _secondaryOffset);
    final occupied = _primaryReferenceCues.map((cue) {
      final measured = _primaryCueBounds(cue);
      return (top: measured.top, bottom: measured.bottom);
    }).toList();

    // Move a centered primary to make room for the secondary only if it won't overlap
    // another primary cue. Otherwise leave the primary cues in place and fit the secondary
    // around them.
    if (primary != null && row == 1) {
      final top = bounds!.centre + gap / 2;
      final bottom = top + _primaryCueHeight(primary);
      final canSplit =
          bottom <= 1 &&
          !occupied.skip(1).any(
            (other) => top < other.bottom && bottom > other.top,
          );
      if (canSplit) {
        final originalLine = primary.line.dartify();
        if (originalLine is num) {
          primary
            ..setProperty(_stackedMiddleLine.toJS, originalLine.toJS)
            ..setProperty(
              _stackedMiddleLineAlign.toJS,
              _cueAlignment(primary, 'lineAlign', 'start').toJS,
            )
            ..setProperty(
              _stackedMiddleSnapToLines.toJS,
              primary.snapToLines.toJS,
            );
        }
        _setCueLine(primary, top, 'start');
        occupied[0] = (top: top, bottom: bottom);
      }
    }

    // ASS/SSA and PGS overlays have no reliable VTTCue anchor. Keep the second
    // track in the same stable top lane used by the other playback engines.
    final fallbackToTop = primary == null && _primaryUsesOverlay;
    final below = row == 2 || fallbackToTop;
    final secondaryEdge = bounds == null
        ? (fallbackToTop
              ? webOverlaySecondaryTop(
                  _subtitleVerticalOffset,
                  _secondaryOffset,
                )
              : 1 - _subtitleVerticalOffset)
        : switch (row) {
            2 => bounds.bottom + gap,
            1 => bounds.centre - gap / 2,
            _ => bounds.top - gap,
          };
    final active = _secondaryCues
        .where(
          (item) =>
              _videoElement.currentTime >= item.cue.startTime &&
              _videoElement.currentTime < item.cue.endTime,
        )
        .toList();
    final horizontal = primary == null ? null : _measureCue(primary).horizontal;
    final secondary = <({web.VTTCue cue, double height, Object placement})>[];
    for (final original in active.isEmpty ? _secondaryCues.take(1) : active) {
      final cue = original.cue;
      final placement = _cuePlacement(cue);
      // Use the primary's physical box so opposite text directions keep the same
      // alignment. All active secondary cues share one group, in source order.
      cue
        ..region = null
        ..vertical = ''
        ..align = horizontal?.align ?? 'center'
        ..position = (horizontal?.position ?? 50.0).toJS
        ..size = horizontal?.size ?? 100;
      if (_nativePositionAlignment) {
        cue.positionAlign = horizontal?.positionAlign ?? 'center';
      }
      secondary.add((
        cue: cue,
        height: _primaryCueHeight(cue, secondary: true),
        placement: placement,
      ));
    }
    final height = secondary.fold(0.0, (sum, item) => sum + item.height);
    var top = fitWebSecondaryGroup(
      secondaryEdge - (below ? 0 : height),
      height,
      occupied,
      gap,
      preferBelow: below,
    );
    var placementChanged = false;
    for (final item in secondary) {
      _setCueLine(
        item.cue,
        below ? top : top + item.height,
        below ? 'start' : 'end',
        secondary: true,
      );
      placementChanged |= _cuePlacement(item.cue) != item.placement;
      top += item.height;
    }
    // Chromium can keep the old displayed box after a paused cue moves. Refresh
    // only a visible track whose placement changed, so cuechange can't loop.
    final track = _secondaryTrack?.track;
    if (placementChanged && track?.mode == 'showing') {
      track!.mode = 'hidden';
      track.mode = 'showing';
    }
  }

  /// Adds the subtitle without showing it, so tracks loaded at startup stay
  /// off until one is picked.
  @override
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  }) async {
    if (_disposed || url.isEmpty) return;
    // The overlay fetches its file when the subtitle is picked, so there is
    // nothing to add ahead of that.
    if (WebSubtitleOverlay.isOverlayCodec(codec)) return;
    _addTrack(url, title: title, language: language, codec: codec);
  }

  Future<void> _showExternalSubtitle(String url, {String? codec}) async {
    if (WebSubtitleOverlay.isOverlayCodec(codec)) {
      _showTrackAt(-1, primaryUsesOverlay: true);
      await _overlay.show(url, codec);
      return;
    }
    _showTrackAt(_addTrack(url, codec: codec));
  }

  /// Makes a track for [url], or finds the one already made, and returns its
  /// position in add order. The track only goes on the element once it is
  /// picked, which also keeps the browser from fetching a file nobody asked
  /// for.
  int _addTrack(String url, {String? title, String? language, String? codec}) {
    final existing = _externalTracks.indexWhere((track) => track.url == url);
    if (existing >= 0) return existing;

    final element = web.HTMLTrackElement()
      ..kind = 'subtitles'
      ..src = url
      ..label = title ?? language ?? 'External Subtitle'
      ..srclang = language ?? 'en';
    element.addEventListener(
      'load',
      ((web.Event _) => _retimePrimaryCues(element.track)).toJS,
    );

    if (codec != null && codec.isNotEmpty) {
      element.setAttribute('data-codec', codec);
    }

    _externalTracks.add((url: url, element: element));
    _watchCuesFor(element.track);
    return _externalTracks.length - 1;
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
    _positionSecondaryCues();
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
    rules.add('font-family: sans-serif');
    rules.add('font-size: ${_cueFontSize()}px');
    rules.add('line-height: 1.2');
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
    final secondaryColor = _cssColor(_secondaryTextColor);

    style.textContent =
        '#$_viewType::cue { ${rules.join('; ')} }\n'
        '#$_viewType::cue(.moonfin-secondary) { '
        'font-size: ${_cueFontSize(secondary: true)}px; '
        '${secondaryColor == null ? '' : 'color: $secondaryColor;'} }';
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
        if (tracks[i] == _secondaryTrack?.track) continue;
        action(tracks[i]);
      }
    } catch (_) {}
  }

  /// Positions primary cues by updating their WebVTT line coordinates. Apply the user
  /// offset from the original position, moving top cues down and bottom cues up while
  /// preserving middle placement. SRT alignment tags use the chosen edge margin.
  /// Automatically placed cues use a bottom anchor.
  void _positionCues(web.TextTrack track) {
    final cues = track.activeCues;
    if (cues != null) {
      _positionPrimaryCues([
        for (var i = 0; i < cues.length; i++)
          if (cues[i].isA<web.VTTCue>()) cues[i] as web.VTTCue,
      ]);
    }
    _positionSecondaryCues();
  }

  void _positionPrimaryCues(Iterable<web.VTTCue> cues) {
    final automatic = <web.VTTCue>[];
    for (final vtt in cues) {
      final tag = srtAlignmentTag.firstMatch(vtt.text);
      if (tag != null) {
        vtt.text = vtt.text.replaceFirst(srtAlignmentTag, '');
        vtt.setProperty(_authoredSrtAlignment.toJS, tag[1]!.toJS);
      }
      final alignment = int.tryParse(
        vtt.getProperty<JSString?>(_authoredSrtAlignment.toJS)?.toDart ?? '',
      );
      if (alignment != null) {
        final column = (alignment - 1) % 3;
        final row = (alignment - 1) ~/ 3;
        vtt
          ..align = column == 0 ? 'left' : column == 2 ? 'right' : 'center'
          ..position = (column == 0 ? 5 : column == 2 ? 95 : 50).toJS
          // Older browsers also translate a percentage cue horizontally. A full
          // width box keeps centered SRT captions centered without positionAlign.
          ..size = !_nativePositionAlignment && column == 1 ? 100 : 90;
        if (_nativePositionAlignment) {
          vtt.positionAlign = column == 0 ? 'line-left' : column == 2 ? 'line-right' : 'center';
        }
        _clearPrimaryMiddleCueState(vtt);
        _setCueLine(vtt, webSrtVerticalPosition(alignment, _subtitleVerticalOffset),
            row == 0 ? 'end' : row == 1 ? 'center' : 'start');
        continue;
      }
      // Read the original position, never a value shifted by a previous
      // slider change or cuechange event.
      if (vtt.has(_autoPositionedCue) || vtt.line.dartify() == 'auto') {
        vtt.setProperty(_autoPositionedCue.toJS, true.toJS);
        _clearPrimaryMiddleCueState(vtt);
        automatic.add(vtt);
        continue;
      }
      final saved = vtt.getProperty<JSNumber?>(_authoredLine.toJS);
      final authored = saved?.toDartDouble ??
          vtt.getProperty<JSNumber?>(_stackedMiddleLine.toJS)?.toDartDouble ??
          (vtt.line.dartify() as num).toDouble();
      if (saved == null) {
        vtt
          ..setProperty(_authoredLine.toJS, authored.toJS)
          ..setProperty(_authoredSnapToLines.toJS, vtt.snapToLines.toJS)
          ..setProperty(_authoredLineAlign.toJS,
              _cueAlignment(vtt, 'lineAlign', 'start').toJS);
      }
      final snap = vtt.getProperty<JSBoolean?>(
        _authoredSnapToLines.toJS,
      )?.toDart ?? false;
      final originalAlign = _cueAlignment(
        vtt, _authoredLineAlign, 'start',
      );
      final lineHeight = _cueFontSize() * 1.2 / _cueCanvasHeight;
      final authoredFraction = snap
          ? (authored < 0
              ? 1 + (authored + 1) * lineHeight
              : authored * lineHeight)
          : _nativeLineAlignment ? authored / 100
              : authored / 100 * (1 - _primaryCueHeight(vtt));
      final direction = authoredFraction < 1 / 3
          ? 1
          : authoredFraction > 2 / 3 ? -1 : 0;
      _clearPrimaryMiddleCueState(vtt);
      if (_subtitleVerticalOffset == 0 || direction == 0) {
        vtt
          ..line = authored.toJS
          ..snapToLines = snap;
        if (_nativeLineAlignment) vtt.lineAlign = originalAlign;
      } else {
        _setCueLine(vtt, authoredFraction + direction * _subtitleVerticalOffset,
            snap ? (authored < 0 ? 'end' : 'start')
                : _nativeLineAlignment ? originalAlign : 'start');
      }
    }
    if (automatic.isEmpty) return;
    // Absolute line coordinates disable native cue stacking. Recreate it for
    // automatic cues using their measured boxes, without moving authored cues.
    final occupied = cues.where((cue) => !automatic.contains(cue)).map((cue) {
      final bounds = _primaryCueBounds(cue);
      return (top: bounds.top, bottom: bounds.bottom, horizontal: _measureCue(cue).horizontal);
    }).toList();
    for (final cue in automatic) {
      final measured = _measureCue(cue);
      final top = fitWebAutomaticCue(1 - _subtitleVerticalOffset,
          measured.height, measured.horizontal, occupied,
          conservativeHorizontal: !_nativePositionAlignment);
      final bottom = top + measured.height;
      _setCueLine(cue, bottom, 'end');
      occupied.add((top: top, bottom: bottom, horizontal: measured.horizontal));
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
      ((web.Event _) {
        _retimePrimaryCues(track);
        _positionCues(track);
      }).toJS,
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
  LetterboxCropper get letterboxCropper => const HtmlLetterboxCropper();

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
