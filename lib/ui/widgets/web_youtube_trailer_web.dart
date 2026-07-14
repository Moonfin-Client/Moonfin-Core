import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

@JS('YT.Player')
extension type _YTPlayer._(JSObject _) implements JSObject {
  external factory _YTPlayer(JSAny idOrElement, JSObject options);
  external void destroy();
  external void mute();
  external void unMute();
  external void playVideo();
  external void pauseVideo();
  external JSObject getIframe();
}

class WebYouTubeTrailer extends StatefulWidget {
  final String videoId;
  final bool muted;
  final bool showControls;
  final bool loop;
  final bool ignorePointer;

  /// Exists for API parity with the io implementation. The web widget is
  /// recreated per video, so suspension never applies here.
  final bool suspended;
  final VoidCallback? onPlaybackStarted;
  final VoidCallback? onCompleted;
  final VoidCallback? onAutoplayFailed;
  final VoidCallback? onEmbeddedUnavailable;
  final Duration autoplayTimeout;

  const WebYouTubeTrailer({
    super.key,
    required this.videoId,
    this.muted = true,
    this.showControls = false,
    this.loop = true,
    this.ignorePointer = false,
    this.suspended = false,
    this.onPlaybackStarted,
    this.onCompleted,
    this.onAutoplayFailed,
    this.onEmbeddedUnavailable,
    this.autoplayTimeout = const Duration(seconds: 3),
  });

  @override
  State<WebYouTubeTrailer> createState() => _WebYouTubeTrailerState();
}

class _WebYouTubeTrailerState extends State<WebYouTubeTrailer> {
  static const int _stateEnded = 0;
  static const int _statePlaying = 1;

  // Rendered at this fixed size and CSS-scaled to the box; YouTube picks quality
  // from the player's pixel size, so a 1080p stage yields 1080p trailers.
  static const int _stageWidth = 1920;
  static const int _stageHeight = 1080;

  static final Set<String> _registeredViewTypes = <String>{};
  static final Map<String, _WebYouTubeTrailerState> _owners =
      <String, _WebYouTubeTrailerState>{};
  static int _instanceCounter = 0;

  static Future<void>? _ytApiReady;

  late final String _viewType;

  web.HTMLDivElement? _host;
  web.HTMLDivElement? _container;
  web.ResizeObserver? _resizeObserver;
  _YTPlayer? _player;
  Timer? _autoplayTimer;

  late final JSFunction _onReadyJs;
  late final JSFunction _onStateChangeJs;
  late final JSFunction _onErrorJs;
  late final JSFunction _messageListener;

  bool _created = false;
  bool _disposed = false;
  bool _playbackStarted = false;
  bool _completedReported = false;
  bool _failureReported = false;
  bool _unavailableReported = false;

  @override
  void initState() {
    super.initState();
    final id = ++_instanceCounter;
    _viewType =
        'moonfin-yt-trailer-${widget.videoId}-${widget.muted ? 'm' : 'u'}-${widget.showControls ? 'c1' : 'c0'}-${widget.ignorePointer ? 'p0' : 'p1'}-$id';
    _owners[_viewType] = this;

    _onReadyJs = ((JSObject _) => _onReady()).toJS;
    _onStateChangeJs = ((JSObject event) => _onStateChange(event)).toJS;
    _onErrorJs = ((JSObject event) => _onError(event)).toJS;
    _messageListener = ((web.Event event) => _handleWindowMessage(event)).toJS;
    web.window.addEventListener('message', _messageListener);

    if (_registeredViewTypes.add(_viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(
        _viewType,
        (int _) => (_owners[_viewType] ?? this)._buildContainer(),
      );
    }

    _autoplayTimer = Timer(widget.autoplayTimeout, _reportAutoplayFailed);

    _ensureYtApi().then((_) {
      if (_disposed) return;
      _maybeCreatePlayer();
    }).catchError((Object _) {
      if (_disposed) return;
      _reportEmbeddedUnavailable();
    });
  }

  @override
  void didUpdateWidget(covariant WebYouTubeTrailer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.muted != widget.muted && _player != null) {
      try {
        widget.muted ? _player!.mute() : _player!.unMute();
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _autoplayTimer?.cancel();
    _resizeObserver?.disconnect();
    _resizeObserver = null;
    web.window.removeEventListener('message', _messageListener);
    final player = _player;
    _player = null;
    if (player != null) {
      // Pause before destroy so audio stops even if the iframe lingers.
      try {
        player.pauseVideo();
      } catch (_) {}
      try {
        player.destroy();
      } catch (_) {}
    }
    if (identical(_owners[_viewType], this)) {
      _owners.remove(_viewType);
    }
    super.dispose();
  }

  web.HTMLDivElement _buildContainer() {
    final container = web.HTMLDivElement()
      ..style.position = 'relative'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.overflow = 'hidden'
      ..style.pointerEvents = widget.ignorePointer ? 'none' : 'auto';

    // Fixed-size stage, CSS-scaled to cover the container (see _applyScale).
    final host = web.HTMLDivElement()
      ..id = '$_viewType-host'
      ..style.position = 'absolute'
      ..style.top = '0'
      ..style.left = '0'
      ..style.width = '${_stageWidth}px'
      ..style.height = '${_stageHeight}px'
      ..style.transformOrigin = 'top left';
    container.appendChild(host);

    _host = host;
    _container = container;

    final observer = web.ResizeObserver(
      ((JSAny _, JSAny _) => _applyScale()).toJS,
    );
    observer.observe(container);
    _resizeObserver = observer;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyScale();
      _maybeCreatePlayer();
    });
    return container;
  }

  // Cover the box with the fixed-size stage (16:9), centered.
  void _applyScale() {
    final container = _container;
    final host = _host;
    if (container == null || host == null) return;
    final boxWidth = container.clientWidth.toDouble();
    final boxHeight = container.clientHeight.toDouble();
    if (boxWidth <= 0 || boxHeight <= 0) return;
    final scale = math.max(boxWidth / _stageWidth, boxHeight / _stageHeight);
    final tx = (boxWidth - _stageWidth * scale) / 2;
    final ty = (boxHeight - _stageHeight * scale) / 2;
    host.style.transform = 'translate(${tx}px, ${ty}px) scale($scale)';
  }

  static Future<void> _ensureYtApi() {
    final existing = _ytApiReady;
    if (existing != null) return existing;

    final completer = Completer<void>();
    _ytApiReady = completer.future;

    if (_ytPlayerAvailable()) {
      completer.complete();
      return completer.future;
    }

    final script = web.HTMLScriptElement()
      ..src = 'https://www.youtube.com/iframe_api';
    (web.document.head ?? web.document.documentElement)?.appendChild(script);

    var elapsedMs = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_ytPlayerAvailable()) {
        timer.cancel();
        if (!completer.isCompleted) completer.complete();
        return;
      }
      elapsedMs += 100;
      if (elapsedMs >= 10000) {
        timer.cancel();
        if (!completer.isCompleted) {
          completer.completeError(StateError('YouTube IFrame API timeout'));
        }
      }
    });

    return completer.future;
  }

  static bool _ytPlayerAvailable() {
    if (!web.window.has('YT')) return false;
    final yt = web.window.getProperty('YT'.toJS);
    if (yt == null || !yt.isA<JSObject>()) return false;
    return (yt as JSObject).has('Player');
  }

  void _maybeCreatePlayer() {
    if (_created || _disposed || !mounted) return;
    final host = _host;
    if (host == null || !_ytPlayerAvailable()) return;
    _created = true;

    final playerVars = <String, Object>{
      'autoplay': 1,
      'mute': widget.muted ? 1 : 0,
      'controls': widget.showControls ? 1 : 0,
      'rel': 0,
      'modestbranding': 1,
      'playsinline': 1,
      'iv_load_policy': 3,
      'disablekb': 1,
      'fs': 0,
      'origin': web.window.location.origin,
    }.jsify()! as JSObject;

    final events = JSObject();
    events.setProperty('onReady'.toJS, _onReadyJs);
    events.setProperty('onStateChange'.toJS, _onStateChangeJs);
    events.setProperty('onError'.toJS, _onErrorJs);

    final options = JSObject();
    options.setProperty('videoId'.toJS, widget.videoId.toJS);
    options.setProperty('width'.toJS, '$_stageWidth'.toJS);
    options.setProperty('height'.toJS, '$_stageHeight'.toJS);
    options.setProperty('playerVars'.toJS, playerVars);
    options.setProperty('events'.toJS, events);

    try {
      _player = _YTPlayer(host as JSAny, options);
      _applyIframeStyle();
    } catch (_) {
      _reportEmbeddedUnavailable();
    }
  }

  void _applyIframeStyle() {
    try {
      final iframe = _player?.getIframe();
      if (iframe != null && iframe.isA<web.HTMLIFrameElement>()) {
        final el = iframe as web.HTMLIFrameElement;
        el.style
          ..width = '100%'
          ..height = '100%'
          ..border = '0'
          ..pointerEvents = widget.ignorePointer ? 'none' : 'auto';
      }
    } catch (_) {}
  }

  void _onReady() {
    if (_disposed) return;
    try {
      _player?.mute();
      _player?.playVideo();
      _applyIframeStyle();
    } catch (_) {}
  }

  void _onStateChange(JSObject event) {
    _handleState(_readInt(event, 'data'));
  }

  void _onError(JSObject event) {
    _handleErrorCode(_readInt(event, 'data'));
  }

  void _handleWindowMessage(web.Event event) {
    if (_disposed) return;
    final message = event as web.MessageEvent;
    if (!message.origin.contains('youtube')) return;

    final dataAny = message.data;
    if (dataAny == null || !dataAny.isA<JSString>()) return;
    final raw = (dataAny as JSString).toDart;
    if (!raw.contains('"event"')) return;

    Map<String, dynamic> decoded;
    try {
      final parsed = jsonDecode(raw);
      if (parsed is! Map<String, dynamic>) return;
      decoded = parsed;
    } catch (_) {
      return;
    }

    final eventName = decoded['event']?.toString();
    switch (eventName) {
      case 'onReady':
        try {
          _player?.playVideo();
        } catch (_) {}
        _applyIframeStyle();
        return;
      case 'onStateChange':
        _handleState(_asInt(decoded['info']));
        return;
      case 'infoDelivery':
        final info = decoded['info'];
        if (info is Map && info['playerState'] != null) {
          _handleState(_asInt(info['playerState']));
        }
        return;
      case 'onError':
        _handleErrorCode(_asInt(decoded['info']));
        return;
      default:
        return;
    }
  }

  void _handleState(int? state) {
    if (state == _statePlaying) {
      _reportPlaybackStarted();
    } else if (state == _stateEnded) {
      _reportCompleted();
    }
  }

  void _handleErrorCode(int? code) {
    switch (code) {
      case 100:
      case 101:
      case 105:
      case 150:
      case 152:
        _reportEmbeddedUnavailable();
        return;
      default:
        _reportAutoplayFailed();
        return;
    }
  }

  void _reportPlaybackStarted() {
    if (_playbackStarted || _disposed) return;
    _playbackStarted = true;
    _autoplayTimer?.cancel();
    if (!widget.muted) {
      try {
        _player?.unMute();
      } catch (_) {}
    }
    widget.onPlaybackStarted?.call();
  }

  void _reportCompleted() {
    if (_completedReported || _disposed) return;
    _completedReported = true;
    widget.onCompleted?.call();
  }

  void _reportAutoplayFailed() {
    if (_playbackStarted || _failureReported || _unavailableReported) return;
    _failureReported = true;
    widget.onAutoplayFailed?.call();
  }

  void _reportEmbeddedUnavailable() {
    if (_unavailableReported) return;
    _unavailableReported = true;
    _autoplayTimer?.cancel();
    widget.onEmbeddedUnavailable?.call();
  }

  int? _readInt(JSObject event, String key) {
    final value = event.getProperty(key.toJS);
    if (value == null) return null;
    if (value.isA<JSNumber>()) return (value as JSNumber).toDartInt;
    return int.tryParse(value.toString());
  }

  int? _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
