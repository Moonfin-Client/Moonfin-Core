import 'package:flutter/material.dart';

class GlassBackdrop extends StatefulWidget {
  const GlassBackdrop({super.key, this.animated = true});

  final bool animated;

  @override
  State<GlassBackdrop> createState() => _GlassBackdropState();
}

class _GlassBackdropState extends State<GlassBackdrop>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _t;

  @override
  void initState() {
    super.initState();
    if (widget.animated) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 16),
      )..repeat(reverse: true);
      _controller = controller;
      _t = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shortest = constraints.biggest.shortestSide;
          final r1 = shortest > 0 ? 1100 / shortest : 1.0;
          final r2 = shortest > 0 ? 1000 / shortest : 1.0;
          final r3 = shortest > 0 ? 900 / shortest : 1.0;
          final drift = constraints.maxWidth * 0.06;

          final bloomField = RepaintBoundary(
            child: Stack(
              fit: StackFit.expand,
              children: [
                const ColoredBox(color: Color(0xFF05080F)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topRight,
                      radius: r1,
                      colors: const [Color(0x8C0A85FF), Color(0x000A85FF)],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: r2,
                      colors: const [Color(0x6B7D59F2), Color(0x007D59F2)],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: r3,
                      colors: const [Color(0x4700C7C7), Color(0x0000C7C7)],
                    ),
                  ),
                ),
              ],
            ),
          );

          final animation = _t;
          final Widget blooms = animation == null
              ? bloomField
              : AnimatedBuilder(
                  animation: animation,
                  child: Transform.scale(scale: 1.12, child: bloomField),
                  builder: (context, child) {
                    final dx = drift * (animation.value - 0.5);
                    return Transform.translate(
                      offset: Offset(dx, 0),
                      child: child,
                    );
                  },
                );

          return Stack(
            fit: StackFit.expand,
            children: [
              blooms,
              const Positioned.fill(
                child: ColoredBox(color: Color(0x33FFFFFF)),
              ),
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x38000000), Color(0x80000000)],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
