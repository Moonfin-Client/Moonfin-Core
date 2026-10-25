import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum PlanchetteLanding { card, below, right }

/// Decorative state stepped by Home's existing seasonal animation clock.
class HalloweenPlanchette {
  Offset? position;
  double angle = 0;
  double opacity = 0;

  Offset _velocity = Offset.zero;
  double _turnVelocity = 0;
  double _phase = 0;
  ui.Image? _image;
  bool _disposed = false;

  Future<void> load() async {
    try {
      final data = await rootBundle.load(
        'assets/images/halloween_planchette.png',
      );
      final codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        targetWidth: 240,
      );
      try {
        final frame = await codec.getNextFrame();
        if (_disposed) {
          frame.image.dispose();
        } else {
          _image = frame.image;
        }
      } finally {
        codec.dispose();
      }
    } catch (error, stack) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
          context: ErrorDescription('loading the Halloween decoration'),
        ),
      );
    }
  }

  void dispose() {
    _disposed = true;
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

    // The sprite's tip is about 34px ahead of its center when it faces left.
    final edge = navigationBounds ?? focus;
    final desiredTarget = switch (landing) {
      PlanchetteLanding.card => focus.center + const Offset(34, 0),
      PlanchetteLanding.below => Offset(focus.center.dx, edge.bottom + 48),
      PlanchetteLanding.right => Offset(edge.right + 48, focus.center.dy),
    };
    final target = Offset(
      desiredTarget.dx.clamp(46.0, size.width - 46),
      desiredTarget.dy.clamp(46.0, size.height - 46),
    );
    position ??= target;
    final delta = target - position!;
    _velocity += (delta * 9 - _velocity * 6) * elapsed;
    final before = position!;
    final next = before + _velocity * elapsed;
    position = Offset(
      next.dx.clamp(46.0, size.width - 46),
      next.dy.clamp(46.0, size.height - 46),
    );
    _velocity = (position! - before) / elapsed;
    final restingDirection = focus.center - target;
    final restingHeading = restingDirection.distance > 0.01
        ? math.atan2(restingDirection.dy, restingDirection.dx) + math.pi / 2
        : angle;
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
      const Rect.fromLTWH(-30, -38, 60, 76),
      Paint()
        ..color = Color.fromRGBO(255, 255, 255, opacity)
        ..filterQuality = FilterQuality.medium,
    );
    canvas.restore();
  }
}
