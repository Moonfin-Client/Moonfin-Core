import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

enum PlanchetteLanding { card, below, right }

/// Decorative state stepped by Home's existing seasonal animation clock.
class HalloweenPlanchette {
  static const _extent = 48.0;

  /// From the sprite's center to its tip.
  static const _reach = _extent / 2;

  /// How far the tip reaches into the artwork's left edge.
  static const _tipInset = 4.0;
  static const _margin = _reach + 8;

  /// Room around the drawing for its soft shadow.
  static const _shadowPad = 4.0;
  static const _side = _extent + _shadowPad * 2;

  Offset? position;
  double angle = 0;
  double opacity = 0;

  Offset _velocity = Offset.zero;
  double _turnVelocity = 0;
  double _phase = 0;
  ui.Image? _image;

  /// Draws the planchette once at [devicePixelRatio], so each frame only
  /// copies it.
  void rasterize(double devicePixelRatio) {
    final pixels = (_side * devicePixelRatio).ceil();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..scale(pixels / _side)
      ..translate(_shadowPad, _shadowPad)
      ..scale(_extent / 100);
    _paintWood(canvas);
    final picture = recorder.endRecording();
    _image?.dispose();
    _image = picture.toImageSync(pixels, pixels);
    picture.dispose();
  }

  /// A carved wooden planchette on a 100 unit square, pointing up, lit from
  /// the top left.
  static void _paintWood(Canvas canvas) {
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

    canvas.drawPath(
      body.shift(const Offset(0, 1.5)),
      Paint()
        ..color = const Color(0x8C000000)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5),
    );

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

  void dispose() {
    _image?.dispose();
    _image = null;
  }

  void step(
    double dt,
    Rect? focus,
    Size size, {
    PlanchetteLanding landing = PlanchetteLanding.card,
    Rect? navigationBounds,
  }) {
    final elapsed = dt.clamp(0.0, 0.05);
    _phase = (_phase + elapsed) % (math.pi * 20);
    final bounds = Offset.zero & size;
    final valid =
        size.shortestSide >= 100 &&
        focus != null &&
        focus.isFinite &&
        focus.width > 0 &&
        focus.height > 0 &&
        (landing != PlanchetteLanding.card || focus.width < size.width * 0.9) &&
        bounds.overlaps(focus);
    opacity = (opacity + (valid ? elapsed * 2 : -elapsed * 3)).clamp(0.0, 1.0);
    if (!valid || elapsed == 0) return;

    final desiredTarget = switch (landing) {
      // Home parks the focused card at the start of its row, under the row
      // title, so the free space is the margin to its left.
      PlanchetteLanding.card => Offset(
        focus.left + _tipInset - _reach,
        focus.center.dy,
      ),
      // The top bar's box reaches well below its buttons, so this measures
      // from the focused button and keeps the tip just under it.
      PlanchetteLanding.below => Offset(
        focus.center.dx,
        focus.bottom + 6 + _reach,
      ),
      PlanchetteLanding.right => Offset(
        (navigationBounds ?? focus).right + 48,
        focus.center.dy,
      ),
    };
    final target = Offset(
      desiredTarget.dx.clamp(_margin, size.width - _margin),
      desiredTarget.dy.clamp(_margin, size.height - _margin),
    );
    final appearing = position == null;
    position ??= target;
    final delta = target - position!;
    _velocity += (delta * 9 - _velocity * 6) * elapsed;
    final before = position!;
    final next = before + _velocity * elapsed;
    position = Offset(
      next.dx.clamp(_margin, size.width - _margin),
      next.dy.clamp(_margin, size.height - _margin),
    );
    _velocity = (position! - before) / elapsed;
    final restingDirection = focus.center - target;
    final restingHeading = restingDirection.distance > 0.01
        ? math.atan2(restingDirection.dy, restingDirection.dx) + math.pi / 2
        : angle;
    // It fades in already pointing at its card rather than turning into place.
    if (appearing) angle = restingHeading;
    final travelHeading = _velocity.distance > 0.01
        ? math.atan2(_velocity.dy, _velocity.dx) + math.pi / 2
        : restingHeading;
    final proximity = (1 - (target - position!).distance / 120).clamp(0.0, 1.0);
    final arrivalBlend = proximity * proximity * (3 - 2 * proximity);
    final arrivalTurn = math.atan2(
      math.sin(restingHeading - travelHeading),
      math.cos(restingHeading - travelHeading),
    );
    final desired = travelHeading + arrivalTurn * arrivalBlend;
    final turn = math.atan2(
      math.sin(desired - angle),
      math.cos(desired - angle),
    );
    _turnVelocity += (turn * 16 - _turnVelocity * 8) * elapsed;
    angle += _turnVelocity * elapsed;
  }

  void paint(Canvas canvas) {
    final center = position;
    final image = _image;
    if (center == null || image == null || opacity <= 0) return;
    canvas.save();
    canvas.translate(
      center.dx + math.sin(_phase * 17) * 0.25,
      center.dy + math.sin(_phase * 23) * 0.2,
    );
    canvas.rotate(angle + math.sin(_phase * 19) * 0.006);
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromCenter(center: Offset.zero, width: _side, height: _side),
      Paint()
        ..color = Color.fromRGBO(255, 255, 255, opacity)
        ..filterQuality = FilterQuality.medium,
    );
    canvas.restore();
  }
}
