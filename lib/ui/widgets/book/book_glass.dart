import 'dart:ui';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

import '../../../util/platform_detection.dart';

bool get bookGlassEligible => PlatformDetection.isApple && !kIsWeb;

Widget bookGlassOrSolid({
  required Widget child,
  required Color fallbackColor,
  double cornerRadius = 16,
  double blur = 16,
  Color? tint,
}) {
  final radius = AppRadius.circular(cornerRadius);

  if (!bookGlassEligible) {
    return DecoratedBox(
      decoration: BoxDecoration(color: fallbackColor, borderRadius: radius),
      child: child,
    );
  }

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
            Positioned.fill(child: ColoredBox(color: veil)),
            if (tint != null) Positioned.fill(child: ColoredBox(color: tint)),
            child,
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _BookGlassHairlinePainter(radius: cornerRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _BookGlassHairlinePainter extends CustomPainter {
  const _BookGlassHairlinePainter({required this.radius});

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
  bool shouldRepaint(_BookGlassHairlinePainter oldDelegate) =>
      oldDelegate.radius != radius;
}
