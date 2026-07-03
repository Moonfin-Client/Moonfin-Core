import 'dart:ui';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:flutter/widgets.dart';

import '../../../util/idiom/glass_capability.dart';

Widget adaptiveGlass({
  required Widget child,
  required Color fallbackColor,
  double cornerRadius = 16,
  double blur = 16,
  Color? tint,
}) {
  final radius = AppRadius.circular(cornerRadius);
  switch (GlassCapability.resolve()) {
    case GlassTier.solid:
      return DecoratedBox(
        decoration: BoxDecoration(color: fallbackColor, borderRadius: radius),
        child: child,
      );
    case GlassTier.liquid:
    case GlassTier.frost:
      return _frostGlass(
        cornerRadius: cornerRadius,
        blur: blur,
        tint: tint,
        child: child,
      );
  }
}

Widget _frostGlass({
  required double cornerRadius,
  required double blur,
  required Color? tint,
  required Widget child,
}) {
  final radius = AppRadius.circular(cornerRadius);
  const veil = Color(0x24FFFFFF);

  return DecoratedBox(
    decoration: BoxDecoration(borderRadius: radius),
    child: ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            const Positioned.fill(child: ColoredBox(color: veil)),
            if (tint != null) Positioned.fill(child: ColoredBox(color: tint)),
            child,
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _GlassHairlinePainter(radius: cornerRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
