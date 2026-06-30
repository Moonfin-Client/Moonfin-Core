import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

enum _EmbeddedPlayerMode {
  manualIframe,
  unsupported,
}

class WebYouTubeTrailer extends StatefulWidget {
  final String videoId;
  final bool muted;
  final bool showControls;
  final bool loop;
  final bool ignorePointer;
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
  static const _jsChannelName = 'MoonfinYt';
  static const _bridgeName = '__moonfinYtBridge';
  static const _origin = 'https://www.youtube-nocookie.com';
  static const _playerElementId = 'moonfin-player';
  static const _stageElementId = 'moonfin-stage';
  // Rendered at this fixed size and CSS-scaled to the box; YouTube picks quality
  // from the player's pixel size, so a 1080p stage yields 1080p trailers.
  static const _stageWidth = 1920;
  static const _stageHeight = 1080;
  static const _startupChromeMaskDuration = Duration(milliseconds: 700);

  WebViewController? _controller;
  Timer? _autoplayTimer;
  Timer? _startupChromeMaskTimer;

  bool _playbackStarted = false;
  bool _autoplayFailureReported = false;
  bool _embeddedUnavailableReported = false;
  bool _startupChromeMaskVisible = false;

  _EmbeddedPlayerMode get _playerMode {
    // Any platform with a system WebView renders through our own HTML; those
    // without one (e.g. tvOS) report unsupported so the caller falls back.
    if (WebViewPlatform.instance == null) {
      return _EmbeddedPlayerMode.unsupported;
    }
    return _EmbeddedPlayerMode.manualIframe;
  }

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void didUpdateWidget(covariant WebYouTubeTrailer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_playerMode == _EmbeddedPlayerMode.unsupported) {
      _reportEmbeddedUnavailable();
      return;
    }

    final videoChanged = oldWidget.videoId != widget.videoId;
    final mutedChanged = oldWidget.muted != widget.muted;
    final controlsChanged = oldWidget.showControls != widget.showControls;
    final loopChanged = oldWidget.loop != widget.loop;

    if (!videoChanged && !mutedChanged && !controlsChanged && !loopChanged) {
      return;
    }

    _resetPlaybackTracking();

    final controller = _controller;
    if (controller == null) {
      unawaited(_initializeController());
      return;
    }

    if (controlsChanged || loopChanged) {
      unawaited(_loadHtml(controller));
      return;
    }

    if (videoChanged) {
      unawaited(_loadVideoById(controller, widget.videoId));
    }

    if (mutedChanged) {
      unawaited(_setMuted(controller, widget.muted));
    }
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _startupChromeMaskTimer?.cancel();

    final controller = _controller;
    if (controller != null) {
      _controller = null;
      // Otherwise the WebView keeps playing after the widget is gone.
      unawaited(controller.loadRequest(Uri.parse('about:blank')));
    }

    super.dispose();
  }

  void _initializePlayer() {
    switch (_playerMode) {
      case _EmbeddedPlayerMode.manualIframe:
        unawaited(_initializeController());
        return;

      case _EmbeddedPlayerMode.unsupported:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          _reportEmbeddedUnavailable();
        });
        return;
    }
  }

  void _resetPlaybackTracking() {
    _playbackStarted = false;
    _autoplayFailureReported = false;
    _embeddedUnavailableReported = false;
    _startupChromeMaskVisible = false;
    _autoplayTimer?.cancel();
    _startupChromeMaskTimer?.cancel();
  }

  Future<void> _initializeController() async {
    try {
      // iOS/macOS need inline playback with no user-gesture gate for muted
      // autoplay; otherwise the WebView blocks it and the caller falls back.
      final PlatformWebViewControllerCreationParams params =
          WebViewPlatform.instance is WebKitWebViewPlatform
              ? WebKitWebViewControllerCreationParams(
                  allowsInlineMediaPlayback: true,
                  mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
                )
              : const PlatformWebViewControllerCreationParams();

      final controller = WebViewController.fromPlatformCreationParams(params);

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..addJavaScriptChannel(
          _jsChannelName,
          onMessageReceived: _onJavaScriptMessage,
        );

      // Android blocks autoplay until a user gesture unless disabled here.
      final platform = controller.platform;
      if (platform is AndroidWebViewController) {
        await platform.setMediaPlaybackRequiresUserGesture(false);
      }

      await controller.setBackgroundColor(const Color(0x00000000));
      _controller = controller;

      await _loadHtml(controller);

      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (_) {
      _reportEmbeddedUnavailable();
    }
  }

  Future<void> _loadHtml(WebViewController controller) async {
    await controller.loadHtmlString(_playerHtml, baseUrl: _origin);
    _restartAutoplayTimer();
  }

  Future<void> _loadVideoById(
    WebViewController controller,
    String videoId,
  ) async {
    try {
      final encodedVideoId = jsonEncode(videoId);
      await controller.runJavaScript(
        'window.$_bridgeName?.loadVideoById($encodedVideoId);',
      );
      _restartAutoplayTimer();
    } catch (_) {
      await _loadHtml(controller);
    }
  }

  Future<void> _setMuted(WebViewController controller, bool muted) async {
    final encodedMuted = muted ? 'true' : 'false';
    try {
      await controller.runJavaScript(
        'window.$_bridgeName?.setMuted($encodedMuted);',
      );
    } catch (_) {
      await _loadHtml(controller);
    }
  }

  void _onJavaScriptMessage(JavaScriptMessage message) {
    final payload = _decodeMessage(message.message);
    if (payload == null) {
      return;
    }

    final eventName = payload['event']?.toString();
    final data = payload['data'];

    switch (eventName) {
      case 'Ready':
        _restartAutoplayTimer();
        return;

      case 'StateChange':
        // 1 == YT.PlayerState.PLAYING
        if (_parseInt(data) == 1) {
          _reportPlaybackStarted();
        }
        return;

      case 'PlayerError':
        _handleYouTubeError(_parseInt(data));
        return;

      case 'AutoplayBlocked':
        _reportAutoplayFailed();
        return;

      default:
        return;
    }
  }

  Map<String, dynamic>? _decodeMessage(String rawMessage) {
    try {
      final decoded = jsonDecode(rawMessage);
      if (decoded is! Map) {
        return null;
      }

      return decoded.map<String, dynamic>((key, value) {
        return MapEntry(key.toString(), value);
      });
    } catch (_) {
      return null;
    }
  }

  int _parseInt(Object? value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return int.tryParse(value?.toString() ?? '') ?? -1;
  }

  void _handleYouTubeError(int errorCode) {
    switch (errorCode) {
      case 100:
      case 101:
      case 105:
      case 150:
      case 152:
        _reportEmbeddedUnavailable();
        return;

      case 2:
      case 5:
      default:
        _reportAutoplayFailed();
        return;
    }
  }

  void _restartAutoplayTimer() {
    _autoplayTimer?.cancel();
    if (widget.onAutoplayFailed == null ||
        widget.autoplayTimeout <= Duration.zero) {
      return;
    }

    _autoplayTimer = Timer(widget.autoplayTimeout, () {
      if (_playbackStarted || _autoplayFailureReported) {
        return;
      }
      _reportAutoplayFailed();
    });
  }

  void _reportPlaybackStarted() {
    if (_playbackStarted) {
      return;
    }

    _playbackStarted = true;
    _autoplayTimer?.cancel();
    _showStartupChromeMask();
    widget.onPlaybackStarted?.call();
  }

  void _showStartupChromeMask() {
    if (_playerMode != _EmbeddedPlayerMode.manualIframe || widget.ignorePointer) {
      return;
    }

    _startupChromeMaskTimer?.cancel();
    if (!_startupChromeMaskVisible && mounted) {
      setState(() {
        _startupChromeMaskVisible = true;
      });
    } else {
      _startupChromeMaskVisible = true;
    }

    _startupChromeMaskTimer = Timer(_startupChromeMaskDuration, () {
      if (!mounted) {
        return;
      }

      setState(() {
        _startupChromeMaskVisible = false;
      });
    });
  }

  void _reportAutoplayFailed() {
    if (_playbackStarted ||
        _autoplayFailureReported ||
        _embeddedUnavailableReported) {
      return;
    }

    _autoplayFailureReported = true;
    _autoplayTimer?.cancel();
    widget.onAutoplayFailed?.call();
  }

  void _reportEmbeddedUnavailable() {
    if (_embeddedUnavailableReported) {
      return;
    }

    _embeddedUnavailableReported = true;
    _autoplayTimer?.cancel();
    widget.onEmbeddedUnavailable?.call();
  }

  String get _playerHtml {
    final pointerEvents = widget.ignorePointer ? 'none' : 'auto';
    final playerVars = <String, dynamic>{
      'autoplay': 1,
      'cc_load_policy': 0,
      'controls': widget.showControls ? 1 : 0,
      'disablekb': 1,
      'enablejsapi': 1,
      'fs': 0,
      'iv_load_policy': 3,
      'loop': widget.loop ? 1 : 0,
      'modestbranding': 1,
      'mute': widget.muted ? 1 : 0,
      'origin': _origin,
      'widget_referrer': _origin,
      'playsinline': 1,
      'rel': 0,
      if (widget.loop) 'playlist': widget.videoId,
    };

    final channelName = jsonEncode(_jsChannelName);
    final bridgeName = jsonEncode(_bridgeName);
    final playerElementId = jsonEncode(_playerElementId);
    final stageElementId = jsonEncode(_stageElementId);
    final host = jsonEncode(_origin);
    final initialVideoId = jsonEncode(widget.videoId);
    final pointerEventsJson = jsonEncode(pointerEvents);
    final playerVarsJson = jsonEncode(playerVars);
    final stageWidth = _stageWidth;
    final stageHeight = _stageHeight;

    return '''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <style>
      html,
      body {
        margin: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: #000000;
      }
      #$_stageElementId {
        position: absolute;
        top: 0;
        left: 0;
        width: ${stageWidth}px;
        height: ${stageHeight}px;
        transform-origin: top left;
      }
      #$_playerElementId {
        width: 100%;
        height: 100%;
      }
    </style>
    <title>Moonfin YouTube Player</title>
  </head>
  <body>
    <script>
(() => {
  const channelName = $channelName;
  const bridgeName = $bridgeName;
  const playerElementId = $playerElementId;
  const stageElementId = $stageElementId;
  const host = $host;
  const pointerEvents = $pointerEventsJson;
  const playerVars = $playerVarsJson;
  const stageWidth = $stageWidth;
  const stageHeight = $stageHeight;

  let player = null;
  let currentVideoId = $initialVideoId;

  const postMessage = (event, data) => {
    const payload = JSON.stringify({ event: event, data: data });

    const channel = window[channelName];
    if (channel && typeof channel.postMessage === 'function') {
      channel.postMessage(payload);
      return;
    }

    const handler = window.webkit &&
        window.webkit.messageHandlers &&
        window.webkit.messageHandlers[channelName];
    if (handler && typeof handler.postMessage === 'function') {
      handler.postMessage(payload);
    }
  };

  const applyMute = () => {
    if (!player) {
      return;
    }

    if (playerVars.mute === 1) {
      player.mute();
    } else {
      player.unMute();
    }
  };

  const loadCurrentVideo = () => {
    if (!player || !currentVideoId) {
      return;
    }

    player.loadVideoById({ videoId: currentVideoId });
    applyMute();
  };

  // Cover the box with the fixed-size stage (16:9), centered.
  const applyScale = () => {
    const stage = document.getElementById(stageElementId);
    if (!stage) {
      return;
    }
    const scale = Math.max(
      window.innerWidth / stageWidth,
      window.innerHeight / stageHeight
    );
    const tx = (window.innerWidth - stageWidth * scale) / 2;
    const ty = (window.innerHeight - stageHeight * scale) / 2;
    stage.style.transform =
        'translate(' + tx + 'px, ' + ty + 'px) scale(' + scale + ')';
  };

  window[bridgeName] = {
    loadVideoById: function(videoId) {
      if (!videoId) {
        return;
      }

      currentVideoId = videoId;
      if (player) {
        loadCurrentVideo();
      }
    },
    setMuted: function(muted) {
      playerVars.mute = muted ? 1 : 0;
      applyMute();
    }
  };

  document.documentElement.style.pointerEvents = pointerEvents;
  document.body.style.pointerEvents = pointerEvents;
  document.body.style.margin = '0';
  document.body.style.width = '100%';
  document.body.style.height = '100%';

  const stageRoot = document.createElement('div');
  stageRoot.id = stageElementId;
  const playerRoot = document.createElement('div');
  playerRoot.id = playerElementId;
  stageRoot.appendChild(playerRoot);
  document.body.appendChild(stageRoot);
  applyScale();

  const scriptTag = document.createElement('script');
  scriptTag.src = 'https://www.youtube.com/iframe_api';
  document.head.appendChild(scriptTag);

  const previousOnReady = window.onYouTubeIframeAPIReady;
  window.onYouTubeIframeAPIReady = () => {
    if (typeof previousOnReady === 'function') {
      try {
        previousOnReady();
      } catch (_) {}
    }

    player = new YT.Player(playerElementId, {
      host: host,
      width: stageWidth,
      height: stageHeight,
      videoId: currentVideoId,
      playerVars: playerVars,
      events: {
        onReady: function() {
          postMessage('Ready', null);
          if (playerVars.autoplay === 1) {
            loadCurrentVideo();
          } else {
            applyMute();
          }
        },
        onStateChange: function(event) {
          postMessage('StateChange', event.data);

          if (event.data === 0 && playerVars.loop === 1) {
            loadCurrentVideo();
          }
        },
        onError: function(event) {
          postMessage('PlayerError', event.data);
        },
        onAutoplayBlocked: function() {
          postMessage('AutoplayBlocked', null);
        }
      }
    });
  };

  window.addEventListener('resize', applyScale);
})();
    </script>
  </body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    switch (_playerMode) {
      case _EmbeddedPlayerMode.manualIframe:
        final controller = _controller;
        if (controller == null) {
          return const SizedBox.shrink();
        }

        // The chrome mask only ever shows when the player is interactive, so
        // skip the wrapping Stack for the muted background preview.
        final view = WebViewWidget(controller: controller);
        return IgnorePointer(
          ignoring: widget.ignorePointer,
          child:
              widget.ignorePointer ? view : _buildWithStartupChromeMask(view),
        );

      case _EmbeddedPlayerMode.unsupported:
        return const SizedBox.shrink();
    }
  }

  Widget _buildWithStartupChromeMask(Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        IgnorePointer(
          child: AnimatedOpacity(
            opacity: _startupChromeMaskVisible ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: const ColoredBox(color: Color(0xFF000000)),
          ),
        ),
      ],
    );
  }
}
