import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

class _ShimmerScope extends InheritedWidget {
  const _ShimmerScope({required super.child});

  @override
  bool updateShouldNotify(_ShimmerScope oldWidget) => false;
}

/// Shimmer / breathing opacity wrapper for skeleton placeholder UI elements.
///
/// A screen usually wraps its whole skeleton, and the pieces it is built from
/// wrap themselves so they still breathe when used alone. Nesting two of these
/// multiplies their opacities and lets the two animations drift apart, so the
/// inner one passes its child straight through.
class SkeletonShimmer extends StatelessWidget {
  final Widget child;

  const SkeletonShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (context.getInheritedWidgetOfExactType<_ShimmerScope>() != null) {
      return child;
    }
    return _ShimmerScope(child: _ShimmerAnimation(child: child));
  }
}

class _ShimmerAnimation extends StatefulWidget {
  final Widget child;

  const _ShimmerAnimation({required this.child});

  @override
  State<_ShimmerAnimation> createState() => _ShimmerAnimationState();
}

class _ShimmerAnimationState extends State<_ShimmerAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.45, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

/// A standard rounded placeholder box styled for skeleton loading layouts.
class SkeletonBox extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? BorderRadius.circular(8);
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final baseColor = color ??
        (ThemeRegistry.active.isGlass
            ? Colors.white.withValues(alpha: 0.16)
            : onSurface.withValues(alpha: 0.14));

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: effectiveRadius,
      ),
    );
  }
}
