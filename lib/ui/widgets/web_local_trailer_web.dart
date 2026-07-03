import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

/// hls.js bridge injected on the web host (also used by HtmlVideoBackend). Lets
/// Jellyfin/Emby HLS transcode streams play in browsers without native HLS.
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

/// A muted, auto-playing HTML5 `<video>` preview for a negotiated local-trailer
/// stream URL, reusing the same hls.js bridge as the full web player.
class WebLocalTrailer extends StatefulWidget {
  final String url;
  final bool muted;
  final bool ignorePointer;
  final VoidCallback? onCompleted;
  final VoidCallback? onError;

  const WebLocalTrailer({
    super.key,
    required this.url,
    this.muted = true,
    this.ignorePointer = true,
    this.onCompleted,
    this.onError,
  });

  @override
  State<WebLocalTrailer> createState() => _WebLocalTrailerState();
}

class _WebLocalTrailerState extends State<WebLocalTrailer> {
  static final Set<String> _registeredViewTypes = <String>{};
  static final Map<String, _WebLocalTrailerState> _owners =
      <String, _WebLocalTrailerState>{};
  static int _instanceCounter = 0;

  late final String _viewType;
  late final web.HTMLVideoElement _video;

  late final JSFunction _onEndedJs;
  late final JSFunction _onErrorJs;

  JSAny? _hlsController;
  bool _disposed = false;
  bool _completedReported = false;
  bool _errorReported = false;

  @override
  void initState() {
    super.initState();
    final id = ++_instanceCounter;
    _viewType = 'moonfin-local-trailer-$id';
    _owners[_viewType] = this;

    _video = _createVideoElement();
    _onEndedJs = ((web.Event _) => _reportCompleted()).toJS;
    _onErrorJs = ((web.Event _) => _reportError()).toJS;
    _video.addEventListener('ended', _onEndedJs);
    _video.addEventListener('error', _onErrorJs);

    if (_registeredViewTypes.add(_viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(
        _viewType,
        (int _) => (_owners[_viewType] ?? this)._video,
      );
    }

    _applySource();
  }

  web.HTMLVideoElement _createVideoElement() {
    final element = web.HTMLVideoElement()
      ..autoplay = true
      ..controls = false
      ..muted = widget.muted
      ..preload = 'auto'
      ..loop = false
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'cover'
      ..style.backgroundColor = 'black'
      ..style.pointerEvents = widget.ignorePointer ? 'none' : 'auto';
    element.setAttribute('playsinline', '');
    return element;
  }

  _MoonfinHlsBridge? _resolveHlsBridge() {
    if (!web.window.has('MoonfinHlsBridge')) return null;
    final bridgeAny = web.window.getProperty('MoonfinHlsBridge'.toJS);
    return _MoonfinHlsBridge._(bridgeAny as JSObject);
  }

  void _applySource() {
    final url = widget.url;
    final forceHls = url.toLowerCase().contains('m3u8');
    final bridge = _resolveHlsBridge();
    var attached = false;
    if (bridge != null) {
      try {
        if (bridge.canUseHlsJs(_video, url.toJS, forceHls.toJS).toDart) {
          _hlsController = bridge.attach(_video, url.toJS, forceHls.toJS);
          attached = _hlsController != null;
        }
      } catch (_) {
        _hlsController = null;
        attached = false;
      }
    }

    if (!attached) {
      _video.src = url;
      _video.load();
    }

    // Autoplay is only permitted while muted, and play() may still reject.
    _video.muted = widget.muted;
    _video.play().toDart.catchError((Object _) {
      if (!_disposed) _reportError();
      return null;
    });
  }

  void _reportCompleted() {
    if (_completedReported || _disposed) return;
    _completedReported = true;
    widget.onCompleted?.call();
  }

  void _reportError() {
    if (_errorReported || _disposed) return;
    _errorReported = true;
    widget.onError?.call();
  }

  @override
  void dispose() {
    _disposed = true;
    _video.removeEventListener('ended', _onEndedJs);
    _video.removeEventListener('error', _onErrorJs);
    try {
      _video.pause();
      _video.removeAttribute('src');
      _video.load();
    } catch (_) {}
    final controller = _hlsController;
    _hlsController = null;
    if (controller != null) {
      try {
        _resolveHlsBridge()?.destroy(controller);
      } catch (_) {}
    }
    if (identical(_owners[_viewType], this)) {
      _owners.remove(_viewType);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
