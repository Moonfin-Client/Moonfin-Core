import 'package:flutter/material.dart';

/// Paints a chamfered ("stair-step") box with a thick opaque border and a
/// hard, un-blurred offset drop-shadow: the 8-bit chrome used by the pixel
/// theme (`AppColorScheme.isPixel`).
///
/// The box sits top-left and the shadow peeks out bottom-right by
/// [shadowOffset], so nothing clips. Inset a child by [contentInsets] when
/// used as `CustomPaint(child: ...)`.
class PixelBorderPainter extends CustomPainter {
  const PixelBorderPainter({
    required this.fillColor,
    required this.borderColor,
    this.borderWidth = 2,
    this.shadowColor = const Color(0x99000000),
    this.shadowOffset = const Offset(4, 4),
    this.cornerCut = 4,
  });

  final Color fillColor;
  final Color borderColor;
  final double borderWidth;
  final Color shadowColor;
  final Offset shadowOffset;

  /// How many logical pixels each corner is chamfered by.
  final double cornerCut;

  /// Padding a child needs so it clears the border and the shadow gap.
  EdgeInsets get contentInsets => EdgeInsets.only(
        left: borderWidth + cornerCut,
        top: borderWidth + cornerCut,
        right: borderWidth + cornerCut + shadowOffset.dx,
        bottom: borderWidth + cornerCut + shadowOffset.dy,
      );

  Path _chamferedPath(Rect r, double cut) {
    final c = cut.clamp(0.0, r.shortestSide / 2).toDouble();
    return Path()
      ..moveTo(r.left + c, r.top)
      ..lineTo(r.right - c, r.top)
      ..lineTo(r.right, r.top + c)
      ..lineTo(r.right, r.bottom - c)
      ..lineTo(r.right - c, r.bottom)
      ..lineTo(r.left + c, r.bottom)
      ..lineTo(r.left, r.bottom - c)
      ..lineTo(r.left, r.top + c)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final sx = shadowOffset.dx;
    final sy = shadowOffset.dy;
    final boxRect = Rect.fromLTWH(
      borderWidth / 2,
      borderWidth / 2,
      size.width - sx - borderWidth,
      size.height - sy - borderWidth,
    );
    final shadowRect = boxRect.shift(shadowOffset);

    final shadowPaint = Paint()..color = shadowColor;
    canvas.drawPath(_chamferedPath(shadowRect, cornerCut), shadowPaint);

    final fillPaint = Paint()..color = fillColor;
    final boxPath = _chamferedPath(boxRect, cornerCut);
    canvas.drawPath(boxPath, fillPaint);

    if (borderWidth > 0) {
      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..strokeJoin = StrokeJoin.miter
        ..color = borderColor;
      canvas.drawPath(boxPath, borderPaint);
    }
  }

  @override
  bool shouldRepaint(PixelBorderPainter old) =>
      old.fillColor != fillColor ||
      old.borderColor != borderColor ||
      old.borderWidth != borderWidth ||
      old.shadowColor != shadowColor ||
      old.shadowOffset != shadowOffset ||
      old.cornerCut != cornerCut;
}
