import 'offline_aware_image.dart';
import 'package:flutter/widgets.dart';

class FullscreenBackdropSwitcher extends StatefulWidget {
  final String? imageUrl;
  final Duration duration;
  final Alignment alignment;
  final Duration fadeInDuration;
  final Widget Function(String imageUrl)? imageBuilder;

  const FullscreenBackdropSwitcher({
    super.key,
    required this.imageUrl,
    required this.duration,
    this.alignment = Alignment.topCenter,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.imageBuilder,
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _currentUrl = widget.imageUrl;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() {
          _currentUrl = _incomingUrl;
          _incomingUrl = null;
        });
      }
    });
  }

  @override
  void didUpdateWidget(FullscreenBackdropSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = widget.imageUrl;
    final shown = _incomingUrl ?? _currentUrl;
    if (next == shown) return;

    if (next == null) {
      // Cleared: drop both layers immediately.
      _controller.stop();
      setState(() {
        _currentUrl = null;
        _incomingUrl = null;
      });
      return;
    }

    setState(() => _incomingUrl = next);
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
