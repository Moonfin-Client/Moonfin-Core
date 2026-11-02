import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import 'seasonal_follower_art.dart';
import 'seasonal_simulation.dart';

enum FollowerLanding { card, below, right }

/// What follows focus on TV Home for an effect, or takes the mouse pointer's place in
/// the desktop layout. [extent] is the drawing's size, and
/// [anchor] is the point in it, as a fraction of [extent], that sits on its spot and that
/// it turns about.
enum FollowerStyle {
  planchette(48, Offset(0.5, 0.5)),
  cupidArrow(60, Offset(0.5, 0.5)),
  sparkler(40, Offset(0.5, 0.5)),
  sleigh(64, Offset(0.5, 0.55)),
  bunnyEars(40, Offset(0.5, 1)),
  lantern(46, Offset(0.5, 0)),
  diya(44, Offset(0.5, 0.94)),
  rainbow(0, Offset.zero),
  easterEgg(34, Offset(0.5, 0.96));

  const FollowerStyle(this.extent, this.anchor);

  final double extent;
  final Offset anchor;

  /// The top bar leaves no room above its buttons for ears, so Easter brings a second
  /// follower for the nav and hands over between the two.
  static List<FollowerStyle> forEffect(SeasonalEffect effect) => switch (effect) {
    SeasonalEffect.halloween => const [planchette],
    SeasonalEffect.valentines => const [cupidArrow],
    SeasonalEffect.fireworks => const [sparkler],
    SeasonalEffect.christmas => const [sleigh],
    SeasonalEffect.easter => const [bunnyEars, easterEgg],
    SeasonalEffect.lunar => const [lantern],
    SeasonalEffect.diwali => const [diya],
    SeasonalEffect.pride => const [rainbow],
    _ => const [],
  };

  bool get points => this == planchette || this == cupidArrow || this == sparkler;

  bool get onlyOnCards => this == bunnyEars;

  bool get onlyOnNav => this == easterEgg;
}

/// Decorative state stepped by Home's seasonal animation clock.
class SeasonalFollower {
  SeasonalFollower(this.style);

  final FollowerStyle style;

  /// How far a pointer's tip reaches into the artwork's left edge.
  static const _tipInset = 4.0;

  /// Room around the drawing for its soft shadow.
  static const _shadowPad = 4.0;

  static const _pointerTilt = -0.45;
  static const _pointerRainbowWidth = 32.0;

  static const _prideColors = <Color>[
    Color(0xFFE40303),
    Color(0xFFFF8C00),
    Color(0xFFFFED00),
    Color(0xFF008026),
    Color(0xFF004DFF),
    Color(0xFF750787),
  ];

  Offset? position;
  double angle = 0;
  double opacity = 0;

  /// The rainbow's width, which follows what it underlines.
  double width = 0;

  Offset _velocity = Offset.zero;
  Offset? _lastPointer;
  double _turnVelocity = 0;
  double _sway = 0;
  double _swayVelocity = 0;

  /// Which way the sleigh faces, from 1 for right to -1 for left. It passes through
  /// zero as it turns around.
  double _facing = 1;

  /// Where the sleigh has just been, for its trail of sparkles.
  final _trail = <Offset>[];
  double _phase = 0;
  ui.Image? _image;

  /// From a pointer's center to its tip.
  double get _reach => style.extent / 2;
  double get _side => style.extent + _shadowPad * 2;

  /// Draws the follower once at [devicePixelRatio], so each frame only copies it.
  void rasterize(double devicePixelRatio) {
    if (style == FollowerStyle.rainbow) return;
    final pixels = (_side * devicePixelRatio).ceil();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..scale(pixels / _side)
      ..translate(_shadowPad, _shadowPad)
      ..scale(style.extent / 100);
    switch (style) {
      case FollowerStyle.planchette:
        FollowerArt.planchette(canvas);
      case FollowerStyle.cupidArrow:
        FollowerArt.cupidArrow(canvas);
      case FollowerStyle.sparkler:
        FollowerArt.sparkler(canvas);
      case FollowerStyle.sleigh:
        FollowerArt.sleigh(canvas);
      case FollowerStyle.bunnyEars:
        FollowerArt.bunnyEars(canvas);
      case FollowerStyle.lantern:
        FollowerArt.lantern(canvas);
      case FollowerStyle.diya:
        FollowerArt.diya(canvas);
      case FollowerStyle.easterEgg:
        FollowerArt.easterEgg(canvas);
      case FollowerStyle.rainbow:
        break;
    }
    final picture = recorder.endRecording();
    _image?.dispose();
    _image = picture.toImageSync(pixels, pixels);
    picture.dispose();
  }

  void dispose() {
    _image?.dispose();
    _image = null;
  }

  void step(
    double dt,
    Rect? focus,
    Size size, {
    FollowerLanding landing = FollowerLanding.card,
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
        (landing != FollowerLanding.card || focus.width < size.width * 0.9) &&
        (landing == FollowerLanding.card ? !style.onlyOnNav : !style.onlyOnCards) &&
        bounds.overlaps(focus);
    opacity = (opacity + (valid ? elapsed * 2 : -elapsed * 3)).clamp(0.0, 1.0);
    if (!valid || elapsed == 0) return;

    final target = _clamp(_spotFor(focus, landing, navigationBounds), size);
    final appearing = position == null;
    position ??= target;
    if (appearing) width = focus.width;
    final delta = target - position!;
    _velocity += (delta * 9 - _velocity * 6) * elapsed;
    final before = position!;
    position = _clamp(before + _velocity * elapsed, size);
    _velocity = (position! - before) / elapsed;
    width += (focus.width - width) * math.min(1.0, elapsed * 9);

    if (style.points) {
      _turn(focus, target, appearing, elapsed);
    } else if (style == FollowerStyle.sleigh) {
      _fly(landing, appearing, elapsed);
    } else {
      _swing(elapsed);
    }
  }

  /// Takes the mouse pointer's place in the desktop layout. It sits right on
  /// [pointer] with no glide, since a pointer that lags is hard to aim, and
  /// fades out once the pointer leaves.
  void stepPointer(double dt, Offset? pointer) {
    final elapsed = dt.clamp(0.0, 0.05);
    _phase = (_phase + elapsed) % (math.pi * 20);
    if (pointer == null) {
      opacity = (opacity - elapsed * 6).clamp(0.0, 1.0);
      _lastPointer = null;
      return;
    }
    final appearing = opacity == 0;
    opacity = 1;
    final last = _lastPointer;
    if (appearing || last == null) {
      _velocity = Offset.zero;
    } else if (elapsed > 0) {
      _velocity += ((pointer - last) / elapsed - _velocity) *
          math.min(1.0, elapsed * 12);
    }
    _lastPointer = pointer;

    if (style.points) {
      // Tilted like a desktop arrow. The tip sits about 4% in from the top of
      // the drawing, so that's the point that lands on the hotspot.
      angle = _pointerTilt;
      position =
          pointer +
          Offset(-math.sin(angle), math.cos(angle)) * (style.extent * 0.46);
    } else {
      position = pointer;
      width = _pointerRainbowWidth;
      if (style == FollowerStyle.sleigh) {
        _fly(FollowerLanding.below, appearing, elapsed);
      } else {
        _swing(elapsed);
      }
    }
  }

  Offset _spotFor(Rect focus, FollowerLanding landing, Rect? navigationBounds) {
    final side = (navigationBounds ?? focus).right;
    if (style.points) {
      return switch (landing) {
        // Home parks the focused card at the start of its row, under the row
        // title, so the free space is the margin to its left.
        FollowerLanding.card => Offset(
          focus.left + _tipInset - _reach,
          focus.center.dy,
        ),
        // The top bar's box reaches well below its buttons, so this measures
        // from the focused button and keeps the tip just under it.
        FollowerLanding.below => Offset(
          focus.center.dx,
          focus.bottom + 6 + _reach,
        ),
        FollowerLanding.right => Offset(side + 48, focus.center.dy),
      };
    }
    return switch (style) {
      FollowerStyle.sleigh => switch (landing) {
        FollowerLanding.card => Offset(
          focus.left + 6 - style.extent / 2,
          focus.center.dy,
        ),
        FollowerLanding.below => Offset(
          focus.center.dx,
          focus.bottom + 6 + style.extent * 0.3,
        ),
        FollowerLanding.right => Offset(
          side + 8 + style.extent / 2,
          focus.center.dy,
        ),
      },
      FollowerStyle.bunnyEars => Offset(
        focus.right - math.min(focus.width * 0.3, 40),
        focus.top,
      ),
      FollowerStyle.lantern => switch (landing) {
        FollowerLanding.card => Offset(focus.left - 24, focus.top + 2),
        FollowerLanding.below => Offset(focus.center.dx, focus.bottom + 2),
        FollowerLanding.right => Offset(side + 40, focus.top),
      },
      FollowerStyle.diya || FollowerStyle.easterEgg => switch (landing) {
        FollowerLanding.card => Offset(focus.left - 26, focus.bottom),
        FollowerLanding.below => Offset(
          focus.center.dx,
          focus.bottom + 6 + style.extent,
        ),
        FollowerLanding.right => Offset(side + 40, focus.center.dy + 20),
      },
      _ => Offset(focus.center.dx, focus.bottom + 6),
    };
  }

  /// Keeps the whole drawing on screen, measured from its anchor.
  Offset _clamp(Offset point, Size size) {
    final extent = style.extent;
    final above = extent * style.anchor.dy;
    return Offset(
      point.dx.clamp(extent / 2 + 4, size.width - extent / 2 - 4),
      point.dy.clamp(above + 4, size.height - (extent - above) - 4),
    );
  }

  void _turn(Rect focus, Offset target, bool appearing, double elapsed) {
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

  /// Leans back against the way it moves and swings upright again once it
  /// stops. A lantern on its cord swings the longest.
  void _swing(double elapsed) {
    final (stiffness, damping, lean) = switch (style) {
      FollowerStyle.lantern => (14.0, 1.6, 0.0016),
      FollowerStyle.easterEgg => (40.0, 2.5, 0.001),
      FollowerStyle.bunnyEars => (90.0, 6.0, 0.0006),
      _ => (120.0, 12.0, 0.0003),
    };
    _swayVelocity +=
        ((-_velocity.dx * lean - _sway) * stiffness - _swayVelocity * damping) *
        elapsed;
    _sway = (_sway + _swayVelocity * elapsed).clamp(-0.6, 0.6);
    angle = _sway;
  }

  /// The sleigh flies level, facing the way it travels and then the card or item it
  /// stops by, and tips its nose with the climb.
  void _fly(FollowerLanding landing, bool appearing, double elapsed) {
    final resting = switch (landing) {
      FollowerLanding.card => 1.0,
      FollowerLanding.right => -1.0,
      FollowerLanding.below => _facing < 0 ? -1.0 : 1.0,
    };
    final heading = _velocity.dx.abs() > 40 ? _velocity.dx.sign : resting;
    _facing = appearing
        ? resting
        : _facing + (heading - _facing) * math.min(1.0, elapsed * 6);
    final pitch = (_velocity.dy * 0.0015 * _facing).clamp(-0.35, 0.35);
    angle += (pitch - angle) * math.min(1.0, elapsed * 8);
    _trail.insert(0, position!);
    if (_trail.length > 14) _trail.removeLast();
  }

  void paint(Canvas canvas) {
    final at = position;
    if (at == null || opacity <= 0) return;
    if (style == FollowerStyle.rainbow) {
      _paintRainbow(canvas, at);
      return;
    }
    final image = _image;
    if (image == null) return;
    if (style == FollowerStyle.sleigh) _paintTrail(canvas);
    // The planchette trembles a little, like hands are resting on it.
    final tremble = style == FollowerStyle.planchette ? 1.0 : 0.0;
    canvas.save();
    canvas.translate(
      at.dx + math.sin(_phase * 17) * 0.25 * tremble,
      at.dy + math.sin(_phase * 23) * 0.2 * tremble,
    );
    canvas.rotate(angle + math.sin(_phase * 19) * 0.006 * tremble);
    if (style == FollowerStyle.sleigh) canvas.scale(_facing, 1);
    canvas.translate(
      -style.anchor.dx * style.extent,
      -style.anchor.dy * style.extent,
    );
    if (style == FollowerStyle.lantern) {
      _paintLive(canvas, FollowerArt.lanternGlow);
    }
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(-_shadowPad, -_shadowPad, _side, _side),
      Paint()
        ..color = Color.fromRGBO(255, 255, 255, opacity)
        ..filterQuality = FilterQuality.medium,
    );
    if (style == FollowerStyle.sparkler) _paintLive(canvas, FollowerArt.sparks);
    if (style == FollowerStyle.diya) _paintLive(canvas, FollowerArt.flame);
    canvas.restore();
  }

  void _paintLive(
    Canvas canvas,
    void Function(Canvas canvas, double time, double opacity) part,
  ) {
    canvas.save();
    canvas.scale(style.extent / 100);
    part(canvas, _phase, opacity);
    canvas.restore();
  }

  /// Gold sparkles left behind while the sleigh is flying, gone once it stops.
  void _paintTrail(Canvas canvas) {
    final speed = (_velocity.distance / 400).clamp(0.0, 1.0);
    if (speed == 0) return;
    final sparkle = Paint();
    for (var k = 2; k < _trail.length; k++) {
      final fade = 1 - k / _trail.length;
      final twinkle = 0.6 + 0.4 * math.sin(_phase * 20 + k * 1.7);
      sparkle.color = Color.fromRGBO(255, 214, 110, opacity * speed * fade * twinkle);
      canvas.drawCircle(_trail[k], 1 + 2 * fade, sparkle);
    }
  }

  void _paintRainbow(Canvas canvas, Offset center) {
    final bar = Rect.fromCenter(center: center, width: width, height: 6);
    final colors = <Color>[];
    final stops = <double>[];
    for (var k = 0; k < _prideColors.length; k++) {
      final color = _prideColors[k].withValues(alpha: opacity);
      colors
        ..add(color)
        ..add(color);
      stops
        ..add(k / _prideColors.length)
        ..add((k + 1) / _prideColors.length);
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(bar, const Radius.circular(3)),
      Paint()
        ..shader = ui.Gradient.linear(
          bar.centerLeft,
          bar.centerRight,
          colors,
          stops,
        ),
    );
    canvas.drawLine(
      bar.topLeft + const Offset(3, 1.2),
      bar.topRight + const Offset(-3, 1.2),
      Paint()
        ..color = Color.fromRGBO(255, 255, 255, 0.3 * opacity)
        ..strokeWidth = 1,
    );
  }
}
