import 'offline_aware_image.dart';
import 'package:flutter/widgets.dart';

class FullscreenBackdropSwitcher extends StatefulWidget {
  final String? imageUrl;
  final Duration duration;
  final Alignment alignment;
  final Duration fadeInDuration;
  final Widget Function(String imageUrl)? imageBuilder;

  /// A full-screen backdrop is the one image the screen is about, so its
  /// fetch goes ahead of the cards built alongside it. Callers that supply
  /// [imageBuilder] set the lane on their own image.
  final ImageFetchPriority priority;

  const FullscreenBackdropSwitcher({
    super.key,
    required this.imageUrl,
    required this.duration,
    this.alignment = Alignment.topCenter,
    // The load fade. The crossfade between two backdrops is [duration].
    this.fadeInDuration = Duration.zero,
    this.imageBuilder,
    this.priority = ImageFetchPriority.high,
  });

  @override
  State<FullscreenBackdropSwitcher> createState() =>
      _FullscreenBackdropSwitcherState();
}

class _FullscreenBackdropSwitcherState extends State<FullscreenBackdropSwitcher>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  String? _currentUrl;
  String? _incomingUrl;
  String? _pendingUrl;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _currentUrl = widget.imageUrl;

    _controller.addStatusListener((status) {
      if (status != AnimationStatus.completed || !mounted) {
        return;
      }

      final pending = _pendingUrl;

      final shouldContinue = pending != null && pending != _incomingUrl;

      setState(() {
        _currentUrl = _incomingUrl;
        _incomingUrl = shouldContinue ? pending : null;
        _pendingUrl = null;
      });

      if (shouldContinue) {
        _controller.forward(from: 0);
      }
    });
  }

  @override
  void didUpdateWidget(FullscreenBackdropSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    final next = widget.imageUrl;
    final shown = _incomingUrl ?? _currentUrl;

    if (next == shown) {
      _pendingUrl = null;
      return;
    }

    if (next == _pendingUrl) {
      return;
    }

    if (next == null) {
      // Cleared: drop all backdrop state immediately.
      _controller.stop();

      setState(() {
        _currentUrl = null;
        _incomingUrl = null;
        _pendingUrl = null;
      });

      return;
    }

    if (_controller.isAnimating) {
      _pendingUrl = next;
      return;
    }

    setState(() {
      _incomingUrl = next;
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildImage(String imageUrl) {
    return widget.imageBuilder?.call(imageUrl) ??
        OfflineAwareImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          alignment: widget.alignment,
          fadeInDuration: widget.fadeInDuration,
          // A backdrop covers the whole screen, so on a portrait phone it
          // paints far wider than the screen. The aspect lets the decode
          // bound follow the painted width instead of the box width.
          sourceAspectRatio: 16 / 9,
          maxDecodeWidth: ArtworkDecode.maxSourceWidth,
          priority: widget.priority,
          errorWidget: (_, _, _) => const SizedBox.shrink(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (_currentUrl != null)
          KeyedSubtree(
            key: ValueKey(_currentUrl),
            child: _buildImage(_currentUrl!),
          ),
        if (_incomingUrl != null)
          FadeTransition(
            opacity: _controller,
            child: KeyedSubtree(
              key: ValueKey(_incomingUrl),
              child: _buildImage(_incomingUrl!),
            ),
          ),
      ],
    );
  }
}
