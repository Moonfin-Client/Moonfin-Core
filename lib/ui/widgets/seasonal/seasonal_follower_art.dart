import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

/// The drawings behind each seasonal follower, on a 100 unit square and lit from the top
/// left. Each is drawn once into a picture, apart from the parts that move.
abstract final class FollowerArt {
  /// A carved wooden planchette, pointing up.
  static void planchette(Canvas canvas) {
    final outline = Path()
      ..moveTo(50, 4)
      ..cubicTo(57, 12, 86, 40, 88, 64)
      ..cubicTo(90, 84, 78, 97, 64, 96)
      ..cubicTo(57, 96, 53, 93, 50, 89)
      ..cubicTo(47, 93, 43, 96, 36, 96)
      ..cubicTo(22, 97, 10, 84, 12, 64)
      ..cubicTo(14, 40, 43, 12, 50, 4)
      ..close();
    const window = Offset(50, 46);
    final body = Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(outline, Offset.zero)
      ..addOval(Rect.fromCircle(center: window, radius: 10));
    const square = Rect.fromLTWH(0, 0, 100, 100);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _shadow(canvas, body);

    canvas.save();
    canvas.clipPath(body);
    // Darker toward the sides, so the board reads as rounded.
    canvas.drawRect(
      square,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(10, 0),
          const Offset(90, 0),
          const [
            Color(0xFF4A2A16),
            Color(0xFF73472A),
            Color(0xFF8C5A34),
            Color(0xFF73472A),
            Color(0xFF41251A),
          ],
          const [0, 0.3, 0.5, 0.72, 1],
        ),
    );
    // Flat sawn boards show nested arches rising along the grain.
    for (var k = 0; k < 7; k++) {
      canvas.drawArc(
        Rect.fromCenter(
          center: const Offset(46, 100),
          width: 14.0 + k * 13,
          height: 50.0 + k * 22,
        ),
        math.pi,
        math.pi,
        false,
        stroke
          ..strokeWidth = 1.2
          ..color = Color.fromARGB(60 - k * 6, 0x2A, 0x15, 0x09),
      );
    }
    // The lines share one gentle sway, the way real grain runs parallel.
    final random = math.Random(7);
    for (var i = 0; i < 40; i++) {
      if (random.nextDouble() < 0.25) continue;
      final x = 4 + i * 2.3 + random.nextDouble() * 1.5;
      final drift = random.nextDouble() * 0.6;
      final line = Path()..moveTo(x, 0);
      for (var y = 4.0; y <= 100; y += 4) {
        line.lineTo(
          x + math.sin(y / 16 + 1.3 + drift) * 2.4 + math.sin(y / 5 + i) * 0.3,
          y,
        );
      }
      final dark = random.nextDouble() < 0.7;
      canvas.drawPath(
        line,
        stroke
          ..strokeWidth = 0.4 + random.nextDouble() * 0.9
          ..color = dark
              ? Color.fromARGB(25 + random.nextInt(50), 0x26, 0x13, 0x08)
              : Color.fromARGB(15 + random.nextInt(25), 0xC9, 0x95, 0x60),
      );
    }
    canvas.drawRect(
      square,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(36, 34),
          46,
          const [Color(0x48FFF2DC), Color(0x00FFF2DC)],
        ),
    );
    // The rounded edge falls into shadow, and the lip facing the light
    // catches it. Shifting the highlight keeps it to the top left edges.
    canvas.drawPath(
      outline,
      stroke
        ..strokeWidth = 7
        ..color = const Color(0x66200F05),
    );
    canvas.drawPath(
      outline.shift(const Offset(1.2, 1.6)),
      stroke
        ..strokeWidth = 1.4
        ..color = const Color(0x55FFE2B0),
    );
    canvas.drawCircle(
      window,
      10,
      stroke
        ..strokeWidth = 6
        ..color = const Color(0x8C1E0E04),
    );
    canvas.drawArc(
      Rect.fromCircle(center: window, radius: 11.2),
      -0.3,
      1.9,
      false,
      stroke
        ..strokeWidth = 1.2
        ..color = const Color(0x50FFE2B0),
    );
    canvas.restore();

    canvas.drawPath(
      body,
      stroke
        ..strokeWidth = 1.1
        ..color = const Color(0xCC24120A),
    );
  }

  /// Cupid's arrow, its heart-shaped head pointing up.
  static void cupidArrow(Canvas canvas) {
    const shaft = RRect.fromLTRBXY(47.5, 20, 52.5, 92, 2, 2);
    final head = _heartHead();
    final fletching = _fletching();
    _shadow(
      canvas,
      Path()
        ..addRRect(shaft)
        ..addPath(head, Offset.zero)
        ..addPath(fletching, Offset.zero),
    );

    canvas.drawRRect(
      shaft,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(47.5, 0),
          const Offset(52.5, 0),
          const [Color(0xFF6B4423), Color(0xFFC79A6B), Color(0xFF7A4E2A)],
          const [0, 0.45, 1],
        ),
    );
    final grain = Paint()
      ..color = const Color(0x40301808)
      ..strokeWidth = 0.6;
    canvas.drawLine(const Offset(49, 24), const Offset(49.4, 88), grain);
    canvas.drawLine(const Offset(51.2, 30), const Offset(50.8, 90), grain);

    canvas.drawPath(
      fletching,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(50, 66),
          const Offset(50, 97),
          const [Color(0xFFFFFFFF), Color(0xFFF4BFCE)],
        ),
    );
    // The barbs of each feather run out and down from the shaft.
    final barb = Paint()
      ..color = const Color(0x55C2607A)
      ..strokeWidth = 0.7;
    for (final side in const [-1.0, 1.0]) {
      for (var k = 0; k < 7; k++) {
        final y = 70.0 + k * 3.6;
        canvas.drawLine(
          Offset(50 + side * 3, y),
          Offset(50 + side * (10 + k * 0.9), y + 6),
          barb,
        );
      }
    }
    final thread = Paint()
      ..color = const Color(0xFFC62828)
      ..strokeWidth = 1.4;
    canvas.drawLine(const Offset(47, 68), const Offset(53, 68), thread);
    canvas.drawLine(const Offset(47, 91), const Offset(53, 91), thread);

    canvas.drawPath(
      head,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(43, 16),
          24,
          const [Color(0xFFFF8A9A), Color(0xFFE0203A), Color(0xFF8E0B1E)],
          const [0, 0.5, 1],
        ),
    );
    canvas.drawPath(
      head,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = const Color(0xCC5A0612),
    );
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(42, 18), width: 7, height: 4),
      Paint()..color = const Color(0x88FFFFFF),
    );
  }

  /// An upside down heart, so its point is the arrow's tip.
  static Path _heartHead() => Path()
    ..moveTo(50, 2)
    ..cubicTo(56, 10, 70, 14, 70, 25)
    ..cubicTo(70, 32, 64, 36, 58.5, 33.5)
    ..cubicTo(55, 32, 52, 29, 50, 26)
    ..cubicTo(48, 29, 45, 32, 41.5, 33.5)
    ..cubicTo(36, 36, 30, 32, 30, 25)
    ..cubicTo(30, 14, 44, 10, 50, 2)
    ..close();

  static Path _fletching() {
    final path = Path();
    for (final side in const [-1.0, 1.0]) {
      path
        ..moveTo(50 + side * 2, 66)
        ..cubicTo(50 + side * 14, 70, 50 + side * 17, 80, 50 + side * 16, 96)
        ..lineTo(50 + side * 9, 92)
        ..lineTo(50 + side * 2, 94)
        ..close();
    }
    return path;
  }

  /// A sparkler with its coated end pointing up. The sparks are drawn live, see [sparks].
  static void sparkler(Canvas canvas) {
    const coat = RRect.fromLTRBXY(47, 6, 53, 64, 3, 3);
    _shadow(
      canvas,
      Path()
        ..addRRect(coat)
        ..addRect(const Rect.fromLTRB(48.9, 62, 51.1, 98)),
    );
    canvas.drawLine(
      const Offset(50, 62),
      const Offset(50, 97),
      Paint()
        ..color = const Color(0xFF8C8C8C)
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      const Offset(49.5, 64),
      const Offset(49.5, 96),
      Paint()
        ..color = const Color(0x80FFFFFF)
        ..strokeWidth = 0.6,
    );
    canvas.drawRRect(
      coat,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(47, 0),
          const Offset(53, 0),
          const [Color(0xFF4A4038), Color(0xFF8A7E70), Color(0xFF3E3630)],
          const [0, 0.4, 1],
        ),
    );
    final random = math.Random(3);
    for (var k = 0; k < 40; k++) {
      canvas.drawCircle(
        Offset(47.5 + random.nextDouble() * 5, 14 + random.nextDouble() * 48),
        0.4 + random.nextDouble() * 0.5,
        Paint()
          ..color = random.nextBool()
              ? const Color(0x50FFFFFF)
              : const Color(0x50000000),
      );
    }
    // The end that's burning glows hot.
    canvas.drawRRect(
      const RRect.fromLTRBXY(47, 6, 53, 13, 3, 3),
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(0, 6),
          const Offset(0, 13),
          const [Color(0xFFFFE6A8), Color(0xFFFF7A1A), Color(0xFF5E3420)],
          const [0, 0.4, 1],
        ),
    );
  }

  static const sparklerTip = Offset(50, 8);

  /// Sparks flying off the sparkler's tip. Each lives a quarter second on its own clock
  /// and takes a new direction every time it starts over.
  static void sparks(Canvas canvas, double time, double opacity) {
    canvas.drawCircle(
      sparklerTip,
      28,
      Paint()
        ..shader = ui.Gradient.radial(
          sparklerTip,
          28,
          [
            Color.fromRGBO(255, 244, 214, 0.95 * opacity),
            Color.fromRGBO(255, 176, 64, 0.35 * opacity),
            const Color.fromRGBO(255, 120, 0, 0),
          ],
          const [0, 0.35, 1],
        ),
    );
    final spark = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.2;
    for (var k = 0; k < 24; k++) {
      final clock = time * 4 + k * 0.618;
      final round = clock.floor();
      final u = clock - round;
      final seed = (k * 7919 + round * 104729) & 0xFFFFF;
      final angle = (seed % 628) / 100;
      final reach = 25.0 + seed % 38;
      final direction = Offset(math.cos(angle), math.sin(angle));
      spark.color = Color.fromRGBO(
        255,
        235 - (u * 90).round(),
        160 - (u * 140).round(),
        (1 - u) * opacity,
      );
      canvas.drawLine(
        sparklerTip + direction * (reach * math.max(0, u - 0.3)),
        sparklerTip + direction * (reach * u),
        spark,
      );
    }
  }

  /// Santa in his sleigh with a sack of presents, facing right.
  static void sleigh(Canvas canvas) {
    final runner = Path()
      ..moveTo(8, 84)
      ..lineTo(74, 84)
      ..quadraticBezierTo(90, 84, 94, 70)
      ..quadraticBezierTo(96, 62, 90, 62)
      ..quadraticBezierTo(86, 63, 88, 67);
    final body = Path()
      ..moveTo(10, 44)
      ..cubicTo(8, 60, 10, 70, 16, 76)
      ..lineTo(70, 76)
      ..cubicTo(80, 76, 86, 68, 88, 58)
      ..quadraticBezierTo(90, 50, 96, 50)
      ..quadraticBezierTo(90, 46, 84, 54)
      ..cubicTo(76, 60, 60, 61, 42, 60)
      ..cubicTo(30, 59, 22, 52, 18, 42)
      ..close();
    const sack = Rect.fromLTRB(14, 24, 38, 58);
    _shadow(
      canvas,
      Path()
        ..addPath(body, Offset.zero)
        ..addRect(const Rect.fromLTRB(8, 80, 94, 87))
        ..addOval(sack)
        ..addOval(const Rect.fromLTRB(40, 20, 68, 58)),
    );

    final gold = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 60),
        const Offset(0, 88),
        const [Color(0xFFF7D774), Color(0xFFC8962B), Color(0xFF7A5512)],
        const [0, 0.5, 1],
      );
    final goldStroke = Paint()
      ..shader = gold.shader
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(runner, goldStroke..strokeWidth = 3.5);
    for (final x in const [26.0, 62.0]) {
      canvas.drawLine(Offset(x, 74), Offset(x, 84), goldStroke..strokeWidth = 2.6);
    }

    // The sack and presents sit in the back, behind Santa.
    canvas.drawOval(
      sack,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(22, 34),
          24,
          const [Color(0xFFB08A5A), Color(0xFF7A5A34), Color(0xFF4E3820)],
          const [0, 0.6, 1],
        ),
    );
    _present(canvas, const Rect.fromLTRB(18, 16, 30, 28), const Color(0xFF2E7D32), const Color(0xFFE53935));
    _present(canvas, const Rect.fromLTRB(27, 20, 37, 29), const Color(0xFF1565C0), const Color(0xFFF2C94C));

    _santa(canvas);

    canvas.drawPath(
      body,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(20, 46),
          const Offset(70, 78),
          const [Color(0xFFEF5350), Color(0xFFC62828), Color(0xFF7F0000)],
          const [0, 0.45, 1],
        ),
    );
    canvas.drawPath(
      Path()
        ..moveTo(18, 42)
        ..cubicTo(22, 52, 30, 59, 42, 60)
        ..cubicTo(60, 61, 76, 60, 84, 54)
        ..quadraticBezierTo(90, 46, 96, 50),
      goldStroke..strokeWidth = 2.4,
    );
    // A gold scroll on the side, like a painted sleigh.
    canvas.drawPath(
      Path()
        ..moveTo(30, 70)
        ..cubicTo(36, 64, 48, 64, 54, 68)
        ..cubicTo(58, 71, 54, 74, 51, 71),
      goldStroke..strokeWidth = 1.6,
    );
    canvas.drawCircle(
      const Offset(24, 52),
      14,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(24, 52),
          14,
          const [Color(0x40FFFFFF), Color(0x00FFFFFF)],
        ),
    );
  }

  static void _present(Canvas canvas, Rect box, Color wrap, Color ribbon) {
    canvas.drawRect(
      box,
      Paint()
        ..shader = ui.Gradient.linear(
          box.topLeft,
          box.bottomRight,
          [wrap, Color.lerp(wrap, const Color(0xFF000000), 0.35)!],
        ),
    );
    final band = Paint()..color = ribbon;
    canvas.drawRect(Rect.fromCenter(center: box.center, width: 2, height: box.height), band);
    canvas.drawRect(Rect.fromCenter(center: box.center, width: box.width, height: 2), band);
  }

  /// Santa sitting in the sleigh, his hat drooping back.
  static void _santa(Canvas canvas) {
    final coat = Paint()
      ..shader = ui.Gradient.radial(
        const Offset(50, 42),
        18,
        const [Color(0xFFEF5350), Color(0xFFB71C1C)],
      );
    canvas.drawOval(const Rect.fromLTRB(42, 36, 66, 60), coat);
    canvas.drawPath(
      Path()
        ..moveTo(60, 44)
        ..quadraticBezierTo(70, 46, 74, 54)
        ..lineTo(70, 57)
        ..quadraticBezierTo(66, 51, 58, 51)
        ..close(),
      coat,
    );
    canvas.drawCircle(const Offset(74, 56), 3, Paint()..color = const Color(0xFF212121));
    canvas.drawRect(const Rect.fromLTRB(43, 50, 65, 54), Paint()..color = const Color(0xFF212121));
    canvas.drawRect(const Rect.fromLTRB(51, 50, 56, 54), Paint()..color = const Color(0xFFF2C94C));

    canvas.drawCircle(
      const Offset(55, 30),
      7,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(53, 28),
          8,
          const [Color(0xFFFFE0C4), Color(0xFFE8A882)],
        ),
    );
    final beard = Path()
      ..moveTo(48, 31)
      ..cubicTo(47, 42, 54, 46, 58, 45)
      ..cubicTo(63, 44, 63, 36, 62, 31)
      ..quadraticBezierTo(55, 36, 48, 31)
      ..close();
    _fur(canvas, beard, beard.getBounds(), 5);
    canvas.drawCircle(const Offset(60, 31), 1.6, Paint()..color = const Color(0xFFE57373));
    canvas.drawCircle(const Offset(58, 27.5), 0.9, Paint()..color = const Color(0xFF3E2723));

    final hat = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(48, 10),
        const Offset(62, 24),
        const [Color(0xFFE53935), Color(0xFF9E1414)],
      );
    canvas.drawPath(
      Path()
        ..moveTo(48, 24)
        ..cubicTo(49, 15, 54, 9, 58, 10)
        ..cubicTo(61, 11, 62, 17, 63, 24)
        ..close(),
      hat,
    );
    // The tip droops back over the brim to its pompom.
    canvas.drawPath(
      Path()
        ..moveTo(53, 12)
        ..quadraticBezierTo(45, 9, 40, 16)
        ..lineTo(42.5, 18)
        ..quadraticBezierTo(47, 14, 55, 16)
        ..close(),
      hat,
    );
    final brim = Path()..addRRect(const RRect.fromLTRBXY(46.5, 22, 64, 26, 2, 2));
    _fur(canvas, brim, brim.getBounds(), 6);
    final pompom = Path()..addOval(Rect.fromCircle(center: const Offset(40, 17), radius: 3));
    _fur(canvas, pompom, pompom.getBounds(), 7);
  }

  /// White fur: a soft fill under tufts that break up its edge.
  static void _fur(Canvas canvas, Path shape, Rect bounds, int seed) {
    canvas.drawPath(
      shape,
      Paint()
        ..shader = ui.Gradient.linear(
          bounds.topLeft,
          bounds.bottomRight,
          const [Color(0xFFFFFFFF), Color(0xFFD4D4D4)],
        ),
    );
    final random = math.Random(seed);
    final tuft = Paint();
    canvas.save();
    canvas.clipPath(shape);
    for (var k = 0; k < 70; k++) {
      final point = Offset(
        bounds.left + random.nextDouble() * bounds.width,
        bounds.top + random.nextDouble() * bounds.height,
      );
      final light = 215 + (random.nextDouble() * 40).round();
      tuft.color = Color.fromARGB(255, light, light, light);
      canvas.drawCircle(point, 0.6 + random.nextDouble() * 0.8, tuft);
    }
    canvas.restore();
  }

  /// Two bunny ears, cut flat at the bottom so they seem to peek from behind a card.
  static void bunnyEars(Canvas canvas) {
    final ears = <(Path, Path)>[];
    for (final (x, tilt) in const [(34.0, -0.2), (66.0, 0.16)]) {
      final turn = Matrix4.translationValues(x, 104, 0)..rotateZ(tilt);
      final outer = Path()
        ..moveTo(-13, 0)
        ..cubicTo(-16, -40, -14, -82, 0, -96)
        ..cubicTo(14, -82, 16, -40, 13, 0)
        ..close();
      final inner = Path()
        ..moveTo(-6.5, 0)
        ..cubicTo(-9, -36, -7, -70, 0, -84)
        ..cubicTo(7, -70, 9, -36, 6.5, 0)
        ..close();
      ears.add((outer.transform(turn.storage), inner.transform(turn.storage)));
    }

    canvas.save();
    canvas.clipRect(const Rect.fromLTRB(-20, -20, 120, 100));
    _shadow(
      canvas,
      Path()
        ..addPath(ears[0].$1, Offset.zero)
        ..addPath(ears[1].$1, Offset.zero),
    );
    for (final (outer, inner) in ears) {
      final bounds = outer.getBounds();
      canvas.drawPath(
        outer,
        Paint()
          ..shader = ui.Gradient.linear(
            bounds.centerLeft,
            bounds.centerRight,
            const [Color(0xFFD9D9D9), Color(0xFFFFFFFF), Color(0xFFCFCFCF)],
            const [0, 0.4, 1],
          ),
      );
      final innerBounds = inner.getBounds();
      canvas.drawPath(
        inner,
        Paint()
          ..shader = ui.Gradient.linear(
            innerBounds.topCenter,
            innerBounds.bottomCenter,
            const [Color(0xFFFFD3DC), Color(0xFFF48FB1)],
          ),
      );
      // Fine hairs along the outer edge soften it into fur.
      final metrics = outer.computeMetrics().first;
      final hair = Paint()
        ..color = const Color(0x55FFFFFF)
        ..strokeWidth = 0.6
        ..strokeCap = StrokeCap.round;
      for (var d = 0.0; d < metrics.length; d += 3) {
        final tangent = metrics.getTangentForOffset(d)!;
        final out = Offset(tangent.vector.dy, -tangent.vector.dx);
        canvas.drawLine(tangent.position, tangent.position + out * 1.2, hair);
      }
    }
    canvas.restore();
  }

  /// A red paper lantern hanging from its cord, with gold caps and a tassel.
  static void lantern(Canvas canvas) {
    const body = Rect.fromLTRB(16, 20, 84, 78);
    _shadow(canvas, Path()..addOval(body));
    canvas.drawLine(
      const Offset(50, 0),
      const Offset(50, 16),
      Paint()
        ..color = const Color(0xFFB8860B)
        ..strokeWidth = 1.6,
    );
    final gold = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(34, 0),
        const Offset(66, 0),
        const [Color(0xFF9C6B12), Color(0xFFF2C94C), Color(0xFF8A5A0C)],
        const [0, 0.45, 1],
      );
    canvas.drawRRect(const RRect.fromLTRBXY(34, 14, 66, 22, 2, 2), gold);
    canvas.drawOval(
      body,
      Paint()
        ..shader = ui.Gradient.radial(
          body.center,
          36,
          const [Color(0xFFFFC46B), Color(0xFFF0442C), Color(0xFFA3141C), Color(0xFF6E0A10)],
          const [0, 0.35, 0.8, 1],
        ),
    );
    final rib = Paint()
      ..color = const Color(0x55500808)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final width in const [22.0, 42.0, 58.0]) {
      canvas.drawOval(Rect.fromCenter(center: body.center, width: width, height: body.height), rib);
    }
    canvas.drawRRect(const RRect.fromLTRBXY(36, 76, 64, 83, 2, 2), gold);
    canvas.drawCircle(const Offset(50, 86), 2.6, gold);
    final tassel = Paint()
      ..color = const Color(0xFFD32F2F)
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    for (var k = 0; k < 7; k++) {
      canvas.drawLine(const Offset(50, 88), Offset(45 + k * 1.7, 99), tassel);
    }
  }

  /// The warm light a lantern throws around itself, breathing slowly.
  static void lanternGlow(Canvas canvas, double time, double opacity) {
    const center = Offset(50, 49);
    final pulse = 0.85 + 0.15 * math.sin(time * 2.2);
    canvas.drawCircle(
      center,
      56,
      Paint()
        ..shader = ui.Gradient.radial(center, 56, [
          Color.fromRGBO(255, 150, 60, 0.3 * pulse * opacity),
          const Color.fromRGBO(255, 120, 40, 0),
        ]),
    );
  }

  /// A clay diya with painted dots, its spout and wick to the right. The flame is drawn
  /// live, see [flame].
  static void diya(Canvas canvas) {
    final bowl = Path()
      ..moveTo(8, 66)
      ..cubicTo(10, 84, 30, 94, 50, 94)
      ..cubicTo(70, 94, 84, 86, 94, 62)
      ..cubicTo(84, 70, 66, 72, 50, 72)
      ..cubicTo(32, 72, 16, 70, 8, 66)
      ..close();
    final rim = Path()
      ..moveTo(8, 66)
      ..cubicTo(16, 60, 32, 58, 50, 58)
      ..cubicTo(70, 58, 84, 58, 94, 62)
      ..cubicTo(84, 70, 66, 72, 50, 72)
      ..cubicTo(32, 72, 16, 70, 8, 66)
      ..close();
    _shadow(
      canvas,
      Path()
        ..addPath(bowl, Offset.zero)
        ..addPath(rim, Offset.zero),
    );
    canvas.drawPath(
      bowl,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(0, 62),
          const Offset(0, 94),
          const [Color(0xFFD9733B), Color(0xFFB4532A), Color(0xFF7A3418)],
          const [0, 0.5, 1],
        ),
    );
    final dot = Paint();
    for (var k = 0; k < 9; k++) {
      final x = 20.0 + k * 7.5;
      final y = 80 + 4 * math.sin((x - 20) / 60 * math.pi);
      dot.color = k.isEven ? const Color(0xFFFFD54F) : const Color(0xFFFFF8E1);
      canvas.drawCircle(Offset(x, y), k.isEven ? 1.8 : 1.2, dot);
    }
    canvas.drawPath(
      rim,
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(0, 58),
          const Offset(0, 72),
          const [Color(0xFF5A2410), Color(0xFF8A3E1C)],
        ),
    );
    // Oil pooled in the bowl catches the flame's light.
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(56, 65), width: 46, height: 7),
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(66, 65),
          24,
          const [Color(0x88FFC060), Color(0x00FFC060)],
        ),
    );
    canvas.drawPath(
      rim,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = const Color(0x66FFD0A0),
    );
    canvas.drawLine(
      const Offset(88, 63),
      const Offset(90, 57),
      Paint()
        ..color = const Color(0xFF3A2A1A)
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round,
    );
  }

  static const _flameBase = Offset(90, 57);

  /// The diya's flame, flickering and leaning a little, with its glow.
  static void flame(Canvas canvas, double time, double opacity) {
    final flicker =
        1 + 0.08 * math.sin(time * 13) + 0.05 * math.sin(time * 29 + 1.3);
    final lean = 0.12 * math.sin(time * 5.3) + 0.05 * math.sin(time * 17);
    final height = 30 * flicker;
    final glow = _flameBase - const Offset(0, 9);
    canvas.drawCircle(
      glow,
      38,
      Paint()
        ..shader = ui.Gradient.radial(glow, 38, [
          Color.fromRGBO(255, 190, 90, 0.4 * opacity),
          const Color.fromRGBO(255, 150, 40, 0),
        ]),
    );
    canvas.save();
    canvas.translate(_flameBase.dx, _flameBase.dy);
    canvas.skew(lean, 0);
    final tongue = Path()
      ..moveTo(0, -height)
      ..cubicTo(7, -height * 0.55, 9, -5, 0, 2)
      ..cubicTo(-9, -5, -7, -height * 0.55, 0, -height)
      ..close();
    canvas.drawPath(
      tongue,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(0, -5),
          height * 0.8,
          [
            Color.fromRGBO(255, 255, 240, opacity),
            Color.fromRGBO(255, 220, 90, opacity),
            Color.fromRGBO(255, 140, 20, 0.9 * opacity),
            const Color.fromRGBO(255, 90, 0, 0),
          ],
          const [0, 0.25, 0.6, 1],
        ),
    );
    canvas.restore();
  }

  /// A painted Easter egg resting on a tuft of grass.
  static void easterEgg(Canvas canvas) {
    const egg = Rect.fromLTRB(24, 12, 76, 88);
    _shadow(canvas, Path()..addOval(egg));
    canvas.drawOval(
      egg,
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(40, 32),
          60,
          const [Color(0xFFF3E5F5), Color(0xFFCE93D8), Color(0xFF9575CD)],
          const [0, 0.55, 1],
        ),
    );
    canvas.save();
    canvas.clipPath(Path()..addOval(egg));
    final band = Path()..moveTo(20, 52);
    for (var k = 0; k <= 10; k++) {
      band.lineTo(20 + k * 6, k.isEven ? 47 : 57);
    }
    canvas.drawPath(
      band,
      Paint()
        ..color = const Color(0xFFFFF8E1)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeJoin = StrokeJoin.round,
    );
    final dot = Paint();
    for (var k = 0; k < 5; k++) {
      dot.color = k.isEven ? const Color(0xFFF48FB1) : const Color(0xFFFFF176);
      canvas.drawCircle(Offset(32 + k * 9, 34 + (k.isEven ? 0 : 3)), 2.6, dot);
      canvas.drawCircle(Offset(34 + k * 8, 70 + (k.isEven ? 3 : 0)), 2.4, dot);
    }
    canvas.restore();
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(40, 26), width: 12, height: 8),
      Paint()..color = const Color(0x66FFFFFF),
    );
    final blade = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final random = math.Random(4);
    for (var k = 0; k < 18; k++) {
      final x = 14 + k * 4.0;
      blade.color = random.nextBool() ? const Color(0xFF7CB342) : const Color(0xFF558B2F);
      canvas.drawLine(
        Offset(x, 98),
        Offset(x + (random.nextDouble() - 0.5) * 8, 84 - random.nextDouble() * 8),
        blade,
      );
    }
  }

  /// A soft shadow under [silhouette], a little below it.
  static void _shadow(Canvas canvas, Path silhouette) {
    canvas.drawPath(
      silhouette.shift(const Offset(0, 1.5)),
      Paint()
        ..color = const Color(0x8C000000)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5),
    );
  }
}
