import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

class ServerTypeIcon extends StatelessWidget {
  final ServerType serverType;
  final double size;
  final Color? color;

  const ServerTypeIcon({
    super.key,
    required this.serverType,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColorScheme.onSurface;
    return CustomPaint(
      size: Size.square(size),
      painter: switch (serverType) {
        ServerType.jellyfin => _JellyfinLogoPainter(effectiveColor),
        ServerType.emby => _EmbyLogoPainter(effectiveColor),
        ServerType.silo => _SiloGlyphPainter(effectiveColor),
      },
    );
  }
}

class _JellyfinLogoPainter extends CustomPainter {
  final Color color;
  _JellyfinLogoPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 256;
    canvas.scale(scale);

    final path = Path()
      ..moveTo(127.998, 39.598)
      ..cubicTo(104.6, 39.598, 29.281, 176.145, 40.766, 199.206)
      ..cubicTo(52.251, 222.267, 203.874, 222.0, 215.233, 199.206)
      ..cubicTo(226.592, 176.412, 151.395, 39.598, 127.998, 39.598)
      ..close()
      ..moveTo(128.009, 74.617)
      ..cubicTo(143.338, 74.617, 192.609, 164.251, 185.166, 179.198)
      ..cubicTo(177.724, 194.14, 78.384, 194.307, 70.854, 179.198)
      ..cubicTo(63.324, 164.089, 112.681, 74.617, 128.009, 74.617)
      ..close()
      ..moveTo(127.998, 107.341)
      ..cubicTo(120.233, 107.341, 95.235, 152.658, 99.05, 160.31)
      ..cubicTo(102.865, 167.962, 153.178, 167.878, 156.948, 160.31)
      ..cubicTo(160.718, 152.742, 136.763, 107.344, 127.998, 107.341)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_JellyfinLogoPainter old) => old.color != color;
}

class _EmbyLogoPainter extends CustomPainter {
  final Color color;
  _EmbyLogoPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 712.601;
    canvas.scale(scale);
    canvas.translate(64, 64);
    canvas.scale(0.82);

    final path = Path()
      ..moveTo(327.065, 642.186)
      ..cubicTo(281.668, 596.326, 244.327, 558.818, 244.085, 558.834)
      ..cubicTo(243.842, 558.851, 236.852, 565.494, 228.55, 573.596)
      ..lineTo(213.456, 588.328)
      ..lineTo(173.32, 547.94)
      ..cubicTo(151.245, 525.727, 108.736, 482.865, 78.854, 452.692)
      ..lineTo(24.525, 397.831)
      ..lineTo(108.245, 314.923)
      ..lineTo(191.965, 232.015)
      ..lineTo(176.772, 216.811)
      ..lineTo(161.579, 201.607)
      ..lineTo(256.759, 107.314)
      ..cubicTo(309.108, 55.453, 352.117, 13.021, 352.336, 13.021)
      ..cubicTo(352.554, 13.021, 389.731, 50.379, 434.952, 96.038)
      ..cubicTo(480.173, 141.697, 517.49, 179.17, 517.879, 179.311)
      ..cubicTo(518.268, 179.452, 525.342, 172.816, 533.6, 164.565)
      ..lineTo(548.613, 149.563)
      ..lineTo(555.759, 156.762)
      ..cubicTo(629.711, 231.264, 737.265, 340.326, 737.126, 340.673)
      ..cubicTo(737.025, 340.924, 699.585, 378.114, 653.926, 423.318)
      ..cubicTo(608.267, 468.522, 570.818, 505.732, 570.707, 506.007)
      ..cubicTo(570.596, 506.282, 577.212, 513.355, 585.41, 521.725)
      ..lineTo(600.315, 536.944)
      ..lineTo(584.926, 552.233)
      ..cubicTo(563.83, 573.192, 421.974, 713.503, 415.13, 720.18)
      ..lineTo(409.605, 725.57)
      ..close()
      ..moveTo(416.917, 438.029)
      ..cubicTo(481.765, 400.495, 534.736, 369.481, 534.63, 369.108)
      ..cubicTo(534.471, 368.549, 301.08, 232.859, 298.359, 231.743)
      ..cubicTo(297.675, 231.462, 297.501, 259.199, 297.501, 369.083)
      ..cubicTo(297.501, 468.919, 297.708, 506.705, 298.256, 506.523)
      ..cubicTo(298.671, 506.385, 352.068, 475.562, 416.917, 438.029)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_EmbyLogoPainter old) => old.color != color;
}

/// A generic grain-silo glyph (domed cylinder with bands). Deliberately not
/// the Silo project's logo, which is a trademark of its own.
class _SiloGlyphPainter extends CustomPainter {
  final Color color;
  _SiloGlyphPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24;
    canvas.scale(scale);

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final cut = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..blendMode = BlendMode.clear;

    canvas.saveLayer(Offset.zero & const Size(24, 24), Paint());
    final body = Path()
      ..moveTo(6, 9)
      ..arcToPoint(const Offset(18, 9), radius: const Radius.circular(6))
      ..lineTo(18, 21)
      ..lineTo(6, 21)
      ..close();
    canvas.drawPath(body, fill);
    for (final y in const [11.5, 15.0, 18.5]) {
      canvas.drawLine(Offset(6, y), Offset(18, y), cut);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_SiloGlyphPainter old) => old.color != color;
}
