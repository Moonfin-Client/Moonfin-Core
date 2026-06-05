import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart'
  show TargetPlatform, defaultTargetPlatform;
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

enum _EmbeddedPlayerMode {
  youtubeIframe,
  desktopManualIframe,
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
  static const _desktopJsChannelName = 'MoonfinYt';
  static const _desktopBridgeName = '__moonfinYtBridge';
  static const _desktopOrigin = 'https://www.youtube-nocookie.com';
  static const _desktopPlayerElementId = 'moonfin-player';
  static const _startupChromeMaskDuration = Duration(milliseconds: 700);

  YoutubePlayerController? _youtubeController;
  StreamSubscription<YoutubePlayerValue>? _youtubeValueSubscription;
  WebViewController? _desktopController;
  Timer? _autoplayTimer;
  Timer? _startupChromeMaskTimer;

  bool _playbackStarted = false;
  bool _autoplayFailureReported = false;
  bool _embeddedUnavailableReported = false;
  bool _autoplayWatchArmed = false;
  bool _startupChromeMaskVisible = false;
  YoutubeError _lastYoutubeError = YoutubeError.none;

  _EmbeddedPlayerMode get _playerMode {
    if (WebViewPlatform.instance == null) {
      return _EmbeddedPlayerMode.unsupported;
    }

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => _EmbeddedPlayerMode.youtubeIframe,
      TargetPlatform.iOS => _EmbeddedPlayerMode.youtubeIframe,
      TargetPlatform.macOS => _EmbeddedPlayerMode.youtubeIframe,
      TargetPlatform.windows => _EmbeddedPlayerMode.desktopManualIframe,
      TargetPlatform.linux => _EmbeddedPlayerMode.desktopManualIframe,
      _ => _EmbeddedPlayerMode.unsupported,
    };
  }

  YoutubePlayerParams get _youtubeParams => YoutubePlayerParams(
        mute: widget.muted,
        showControls: widget.showControls,
        enableCaption: false,
        enableKeyboard: false,
      pointerEvents: widget.ignorePointer
        ? PointerEvents.none
        : PointerEvents.initial,
        loop: widget.loop,
        playsInline: true,
        showVideoAnnotations: false,
        strictRelatedVideos: true,
        privacyEnhancedMode: true,
        showFullscreenButton: false,
        origin: _desktopOrigin,
      );

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void didUpdateWidget(covariant WebYouTubeTrailer oldWidget) {
    super.didUpdateWidget(oldWidget);

    final playerMode = _playerMode;
    if (playerMode == _EmbeddedPlayerMode.unsupported) {
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

    switch (playerMode) {
      case _EmbeddedPlayerMode.youtubeIframe:
        if (controlsChanged || loopChanged) {
          unawaited(_initializeYoutubeController());
          return;
        }

        final controller = _youtubeController;
        if (controller == null) {
          unawaited(_initializeYoutubeController());
          return;
        }

        if (videoChanged) {
          unawaited(controller.loadVideoById(videoId: widget.videoId));
        }

        if (mutedChanged) {
          unawaited(widget.muted ? controller.mute() : controller.unMute());
        }
        return;

      case _EmbeddedPlayerMode.desktopManualIframe:
        final controller = _desktopController;
        if (controller == null) {
          unawaited(_initializeDesktopController());
          return;
        }

        if (controlsChanged || loopChanged) {
          unawaited(_loadDesktopHtml(controller));
          return;
        }

        if (videoChanged) {
          unawaited(_loadDesktopVideoById(controller, widget.videoId));
        }

        if (mutedChanged) {
          unawaited(_setDesktopMuted(controller, widget.muted));
        }
        return;

      case _EmbeddedPlayerMode.unsupported:
        return;
    }
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _startupChromeMaskTimer?.cancel();

    final subscription = _youtubeValueSubscription;
    if (subscription != null) {
      unawaited(subscription.cancel());
    }

    final controller = _youtubeController;
    if (controller != null) {
      unawaited(controller.close());
    }

    super.dispose();
  }

  void _initializePlayer() {
    switch (_playerMode) {
      case _EmbeddedPlayerMode.youtubeIframe:
        unawaited(_initializeYoutubeController());
        return;

      case _EmbeddedPlayerMode.desktopManualIframe:
        unawaited(_initializeDesktopController());
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
    _autoplayWatchArmed = false;
    _startupChromeMaskVisible = false;
    _lastYoutubeError = YoutubeError.none;
    _autoplayTimer?.cancel();
    _startupChromeMaskTimer?.cancel();
  }

  Future<void> _disposeYoutubeController() async {
    final subscription = _youtubeValueSubscription;
    _youtubeValueSubscription = null;
    if (subscription != null) {
      await subscription.cancel();
    }

    final controller = _youtubeController;
    _youtubeController = null;
    if (controller != null) {
      await controller.close();
    }
  }

  Future<void> _initializeYoutubeController() async {
    try {
      await _disposeYoutubeController();

      final controller = YoutubePlayerController.fromVideoId(
        videoId: widget.videoId,
        params: _youtubeParams,
        autoPlay: true,
      );

      _youtubeController = controller;
      _youtubeValueSubscription = controller.stream.listen(
        _onYoutubeValue,
        onError: (error) {
          _reportEmbeddedUnavailable();
        },
      );
      await (controller as dynamic).init() as Future<void>;
      _autoplayWatchArmed = true;
      _restartAutoplayTimer();

      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (error) {
      _reportEmbeddedUnavailable();
    }
  }

  void _onYoutubeValue(YoutubePlayerValue value) {
    if (!_autoplayWatchArmed) {
      _autoplayWatchArmed = true;
      _restartAutoplayTimer();
    }

    if (value.playerState == PlayerState.playing) {
      _reportPlaybackStarted();
    }

    final error = value.error;
    if (error == YoutubeError.none) {
      _lastYoutubeError = YoutubeError.none;
      return;
    }

    if (error == _lastYoutubeError) {
      return;
    }

    _lastYoutubeError = error;
    _handleYouTubeError(error.code);
  }

  Future<void> _initializeDesktopController() async {
    try {
      final controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams(),
      );

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..addJavaScriptChannel(
          _desktopJsChannelName,
          onMessageReceived: _onDesktopJavaScriptMessage,
        );

      await controller.setBackgroundColor(const Color(0x00000000));
      _desktopController = controller;

      await _loadDesktopHtml(controller);

      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (error) {
      _reportEmbeddedUnavailable();
    }
  }

  Future<void> _loadDesktopHtml(WebViewController controller) async {
    await controller.loadHtmlString(_desktopPlayerHtml, baseUrl: _desktopOrigin);
    _restartAutoplayTimer();
  }

  Future<void> _loadDesktopVideoById(
    WebViewController controller,
    String videoId,
  ) async {
    try {
      final encodedVideoId = jsonEncode(videoId);
      await controller.runJavaScript(
        'window.$_desktopBridgeName?.loadVideoById($encodedVideoId);',
      );
      _restartAutoplayTimer();
    } catch (error) {
      await _loadDesktopHtml(controller);
    }
  }

  Future<void> _setDesktopMuted(WebViewController controller, bool muted) async {
    final encodedMuted = muted ? 'true' : 'false';
    try {
      await controller.runJavaScript(
        'window.$_desktopBridgeName?.setMuted($encodedMuted);',
      );
    } catch (error) {
      await _loadDesktopHtml(controller);
    }
  }

  void _onDesktopJavaScriptMessage(JavaScriptMessage message) {
    final payload = _decodeDesktopMessage(message.message);
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
        final stateCode = _parseInt(data);
        if (stateCode == PlayerState.playing.code) {
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

  Map<String, dynamic>? _decodeDesktopMessage(String rawMessage) {
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
    if (_playerMode != _EmbeddedPlayerMode.youtubeIframe ||
        widget.ignorePointer) {
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

  String get _desktopPlayerHtml {
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
      'origin': _desktopOrigin,
      'widget_referrer': _desktopOrigin,
      'playsinline': 1,
      'rel': 0,
      if (widget.loop) 'playlist': widget.videoId,
    };

    final channelName = jsonEncode(_desktopJsChannelName);
    final bridgeName = jsonEncode(_desktopBridgeName);
    final playerElementId = jsonEncode(_desktopPlayerElementId);
    final host = jsonEncode(_desktopOrigin);
    final initialVideoId = jsonEncode(widget.videoId);
    final pointerEventsJson = jsonEncode(pointerEvents);
    final playerVarsJson = jsonEncode(playerVars);

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
  const host = $host;
  const pointerEvents = $pointerEventsJson;
  const playerVars = $playerVarsJson;

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

  const playerRoot = document.createElement('div');
  playerRoot.id = playerElementId;
  playerRoot.style.width = '100%';
  playerRoot.style.height = '100%';
  document.body.appendChild(playerRoot);

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

    if (player) {
      player.setSize(window.innerWidth, window.innerHeight);
    }
  };

  window.addEventListener('resize', () => {
    if (player) {
      player.setSize(window.innerWidth, window.innerHeight);
    }
  });
})();
    </script>
  </body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    switch (_playerMode) {
      case _EmbeddedPlayerMode.youtubeIframe:
        final controller = _youtubeController;
        if (controller == null) {
          return const SizedBox.shrink();
        }

        return IgnorePointer(
          ignoring: widget.ignorePointer,
          child: _buildWithStartupChromeMask(
            WebViewWidget(
              controller: (controller as dynamic).webViewController
                  as WebViewController,
            ),
          ),
        );

      case _EmbeddedPlayerMode.desktopManualIframe:
        final controller = _desktopController;
        if (controller == null) {
          return const SizedBox.shrink();
        }

        return IgnorePointer(
          ignoring: widget.ignorePointer,
          child: WebViewWidget(controller: controller),
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
