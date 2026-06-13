import 'dart:ui';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../theme/app_color_scheme.dart';

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    this.cornerRadius = 12,
    this.reinforced = false,
    required this.fallbackColor,
    this.padding,
    this.child,
  });

  final double cornerRadius;
  final bool reinforced;
  final Color fallbackColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(cornerRadius);
    final content =
        padding == null ? child : Padding(padding: padding!, child: child);

    if (!AppColorScheme.isGlass) {
      return DecoratedBox(
        decoration: BoxDecoration(color: fallbackColor, borderRadius: radius),
        child: content,
      );
    }

    final veil = kIsWeb ? const Color(0x40FFFFFF) : const Color(0x1FFFFFFF);

    Widget frost = ColoredBox(color: veil);
    if (!kIsWeb) {
      frost = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: frost,
      );
    }

    final surface = Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned.fill(child: frost),
        if (reinforced)
          const Positioned.fill(child: ColoredBox(color: Color(0x73000000))),
        ?content,
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _GlassHairlinePainter(radius: cornerRadius),
            ),
          ),
        ),
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: const [
          BoxShadow(
            color: Color(0x59000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(borderRadius: radius, child: surface),
    );
  }
}

class _GlassHairlinePainter extends CustomPainter {
  const _GlassHairlinePainter({required this.radius});

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.5),
      Radius.circular(radius),
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x59FFFFFF), Color(0x0FFFFFFF)],
      ).createShader(rect);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_GlassHairlinePainter oldDelegate) =>
      oldDelegate.radius != radius;
}
