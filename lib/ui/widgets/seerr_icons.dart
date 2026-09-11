import 'package:flutter/widgets.dart';

/// Moon/crescent icon for the Seerr variant.
class SeerrIcon extends StatelessWidget {
  final double size;
  final Color color;
  final bool solid;

  const SeerrIcon({
    super.key,
    this.size = 24,
    required this.color,
    this.solid = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _SeerrPainter(color, solid: solid)),
    );
  }
}

/// Seerr's indigo, as its own UI paints it.
const seerrBrandColor = Color(0xFF6366F1);

/// Circular corner badge marking a title that stands in from Seerr rather
/// than the library. Sized to sit where a card's favourite mark would.
class SeerrBadge extends StatelessWidget {
  final double size;
  final Color? backgroundColor;

  const SeerrBadge({
    super.key,
    this.size = 18,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? seerrBrandColor,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: SeerrIcon(
          size: size * 0.82,
          color: const Color(0xFFFFFFFF),
          solid: true,
        ),
      ),
    );
  }
}

class _SeerrPainter extends CustomPainter {
  static final _outerCircle = _parsePath('M48,96C74.51,96,96,74.51,96,48C96,21.49,74.51,0,48,0C21.49,0,0,21.49,0,48C0,74.51,21.49,96,48,96Z');
  static final _crescent = _parsePath(
    'M80,52C80,67.46,67.46,80,52,80C36.54,80,24,67.46,24,52C24,49.13,24.43,46.36,25.23,43.75'
    'C27.43,48.62,32.32,52,38,52C45.73,52,52,45.73,52,38C52,32.32,48.62,27.43,43.76,25.23'
    'C46.36,24.43,49.13,24,52,24C67.46,24,80,36.54,80,52Z',
  );
  static final _topLeftArc = _parsePath(
    'M48,12C28.12,12,12,28.12,12,48C12,50.21,10.21,52,8,52C5.79,52,4,50.21,4,48'
    'C4,23.7,23.7,4,48,4C50.21,4,52,5.79,52,8C52,10.21,50.21,12,48,12Z',
  );
  static final _shadowRing = _parsePath(
    'M80,52C80,67.46,67.46,80,52,80C36.86,80,24.53,67.99,24.02,52.98'
    'C24.01,53.32,24,53.66,24,54C24,70.57,37.43,84,54,84C70.57,84,84,70.57,84,54'
    'C84,37.43,70.57,24,54,24C53.66,24,53.32,24.01,52.98,24.02'
    'C67.99,24.53,80,36.87,80,52Z',
  );

  final Color color;
  final bool solid;
  _SeerrPainter(this.color, {this.solid = false});

  @override
  void paint(Canvas canvas, Size size) {
    const scale = 0.833;
    final s = size.width * scale / 96;
    final offset = size.width * (1 - scale) / 2;
    canvas.save();
    canvas.translate(offset, offset);
    canvas.scale(s, s);
    final paint = Paint()..style = PaintingStyle.fill;

    if (solid) {
      paint.color = color;
      canvas.drawPath(_crescent, paint);
      canvas.drawPath(_topLeftArc, paint);
    } else {
      paint.color = color.withValues(alpha: 0.15);
      canvas.drawPath(_outerCircle, paint);

      paint.color = color.withValues(alpha: 0.35);
      canvas.drawCircle(const Offset(52, 52), 28, paint);

      paint.color = color.withValues(alpha: 0.55);
      canvas.drawPath(_crescent, paint);

      paint.color = color.withValues(alpha: 0.25);
      canvas.drawPath(_topLeftArc, paint);

      paint.color = color.withValues(alpha: 0.12);
      canvas.drawPath(_shadowRing, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_SeerrPainter old) =>
      old.color != color || old.solid != solid;
}

Path _parsePath(String d) {
  final path = Path();
  final re = RegExp(r'([MLCZ])|(-?\d+\.?\d*)');
  final matches = re.allMatches(d).toList();
  var i = 0;

  double next() => double.parse(matches[i++].group(0)!);

  while (i < matches.length) {
    final token = matches[i].group(0)!;
    if (token == 'M') {
      i++;
      path.moveTo(next(), next());
    } else if (token == 'L') {
      i++;
      path.lineTo(next(), next());
    } else if (token == 'C') {
      i++;
      path.cubicTo(next(), next(), next(), next(), next(), next());
    } else if (token == 'Z') {
      i++;
      path.close();
    } else {
      path.lineTo(next(), next());
    }
  }
  return path;
}
