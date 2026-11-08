import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../after_hours_canvas.dart';
import '../after_hours_game.dart';

class BrThing {
  BrThing(
    this.k,
    this.x,
    this.y,
    this.w,
    this.h,
    this.side, {
    this.pick = false,
    this.y0 = 0,
    this.ph = 0,
    this.hop = 0,
  });

  final String k;
  double x, y, w, h;
  final double side;
  final bool pick;
  final double y0, ph;
  double vy = 0;
  double hop;
  bool dead = false;
}

class BrPlayer {
  double x = 72, y = _g - 20, vy = 0, grav = 1;
  bool ground = true, slideQ = false, wantFlip = false;
  int jumps = 0;
  double slide = 0, shield = 0, dash = 0;
}

const double _g = 232;
const double _c = arcadeH - _g;
const double _jump = 540;
const double _gravity = 1500;

/// Endless runner with a gravity flip. Things on the ceiling are built in
/// floor space and mirrored with H - y.
class BufferRun extends ArcadeGame {
  BufferRun(super.rng) : _stars = [], _blds = [] {
    for (var i = 0; i < 40; i++) {
      _stars.add((x: rand(0, arcadeW), y: rand(_c + 4, 170), s: rand(.5, 1.6)));
    }
    for (var i = 0; i < 9; i++) {
      _blds.add((w: rand(40, 68), h: rand(30, 84), off: i * 72.0));
    }
  }

  final List<({double x, double y, double s})> _stars;
  final List<({double w, double h, double off})> _blds;
  final _stride = StrideClock();
  static final _sky = CtxGradient(
    const Offset(0, _c),
    const Offset(0, _g),
    const [Color(0xFF0C0A1F), Color(0xFF2A1D4F)],
    const [0, 1],
  );

  double dist = 0, bonus = 0, speed = 170, next = 1.2, inv = 0, flipAt = 3;
  List<BrThing> things = [];
  BrPlayer p = BrPlayer();

  /// The runner's middle sits 20 px off its feet, so a flip turns it over in
  /// place.
  double _feet(BrPlayer p) => p.y + 20 * p.grav;

  Rect _box(BrPlayer p) {
    final f = _feet(p);
    final s = p.slide > 0;
    final w = s ? 26.0 : 18.0;
    final a = f - (s ? 20 : 40) * p.grav;
    final b = f - (s ? 0 : 2) * p.grav;
    return Rect.fromLTWH(p.x - w / 2, math.min(a, b), w, (b - a).abs());
  }

  @override
  void reset() {
    super.reset();
    dist = 0;
    bonus = 0;
    speed = 170;
    next = 1.2;
    things = [];
    inv = 0;
    flipAt = 3;
    p = BrPlayer();
  }

  double _spawn() {
    final r = rng.nextDouble(), x = arcadeW + 20.0;
    final side = rng.nextDouble() < .7 ? p.grav : -p.grav;
    if (t > 5 && rng.nextDouble() < .12) {
      things.add(
        BrThing(
          rng.nextDouble() < .55 ? 'directPlay' : 'skipIntro',
          x,
          _g - rand(58, 84),
          22,
          22,
          side,
          pick: true,
        ),
      );
      return 0;
    }
    if (r < .3) {
      things.add(BrThing('cable', x, _g - 18, 26, 18, side));
    } else if (r < .48 && t > 4) {
      things.add(
        BrThing(
          'banner',
          x,
          _c,
          34,
          _g - 30 - _c,
          rng.nextDouble() < .5 ? 1 : -1,
        ),
      );
    } else if (r < .64 && t > 8) {
      things.add(
        BrThing(
          'lagBat',
          x,
          0,
          22,
          14,
          side,
          y0: rand(150, 168),
          ph: rand(0, tau),
        ),
      );
    } else if (r < .8 && t > 12) {
      things.add(
        BrThing('gremlin', x, _g - 18, 18, 18, side, hop: rand(.3, .8)),
      );
    } else {
      return _popcornArc(x, side);
    }
    return 0;
  }

  /// The five pieces sit along 80 percent of a jump's path at the current
  /// speed, so one jump can take them all. Returns how long the arc takes to
  /// pass, so the next spawn waits for it.
  double _popcornArc(double x, double side) {
    const air = 2 * _jump / _gravity, span = .8 * air;
    for (var i = 0; i < 5; i++) {
      final at = air / 2 + (i - 2) * span / 4;
      final f = _jump * at - _gravity / 2 * at * at;
      things.add(
        BrThing(
          'popcorn',
          x + i * speed * span / 4,
          _g - 27 - f,
          12,
          12,
          side,
          pick: true,
        ),
      );
    }
    return span;
  }

  @override
  void update(double dt) {
    t += dt;
    speed = math.min(520, 170 + t * 4.5);
    final v = speed * (p.dash > 0 ? 1.5 : 1);
    dist += v * dt;
    score = (dist / 8).floor() + bonus.toInt();
    p.vy += _gravity * p.grav * dt;
    p.y += p.vy * dt;
    final rest = p.grav > 0 ? _g - 20 : _c + 20;
    if ((p.y - rest) * p.grav >= 0) {
      p.y = rest;
      p.vy = 0;
      p.jumps = 0;
      p.ground = true;
      if (p.slideQ) {
        p.slide = .6;
        p.slideQ = false;
        sound(ArcadeSound.swish);
      }
    }
    p.slide = math.max(0, p.slide - dt);
    p.dash -= dt;
    p.shield -= dt;
    inv -= dt;
    if ((next -= dt) <= 0) {
      final pass = _spawn();
      next = math.max(.45, rand(.8, 1.4) * 260 / speed) + pass;
    }
    final pb = _box(p);
    for (final o in things) {
      o.x -= v * dt;
      if (o.k == 'lagBat') {
        o.x -= 70 * dt;
        o.y = o.y0 + math.sin(t * 5 + o.ph) * 14;
      }
      if (o.k == 'gremlin') {
        o.x -= 40 * dt;
        o.vy += 1200 * dt;
        o.y += o.vy * dt;
        if (o.y >= _g - 18) {
          o.y = _g - 18;
          o.vy = 0;
          if ((o.hop -= dt) <= 0) {
            o.vy = -rand(260, 360);
            o.hop = rand(.5, 1.1);
          }
        }
      }
      if (o.dead) continue;
      final wy = o.side > 0 ? o.y : arcadeH - o.y - o.h;
      if (!pb.overlaps(Rect.fromLTWH(o.x, wy, o.w, o.h))) continue;
      if (o.pick) {
        o.dead = true;
        if (o.k == 'popcorn') {
          bonus += 25;
          sound(ArcadeSound.pickup);
        } else {
          if (o.k == 'directPlay') {
            p.shield = 10;
          } else {
            p.dash = 3;
          }
          sound(ArcadeSound.powerup);
        }
      } else if (p.dash > 0) {
        o.dead = true;
        bonus += 50;
        sound(ArcadeSound.breakSound);
      } else if (p.shield > 0) {
        o.dead = true;
        p.shield = 0;
        inv = 1;
        sound(ArcadeSound.breakSound);
      } else if (inv <= 0) {
        over = true;
      }
    }
    things = things.where((o) => !o.dead && o.x > -60).toList();
  }

  /// The first press jumps away from the surface, the second flips gravity
  /// toward the other side.
  void jump() {
    if (p.jumps == 0) {
      p.vy = -_jump * p.grav;
      p.jumps = 1;
      p.ground = false;
      p.slide = 0;
      sound(ArcadeSound.jump);
    } else if (p.jumps == 1) {
      p.grav *= -1;
      p.vy = 300 * p.grav;
      p.jumps = 2;
      sound(ArcadeSound.whoosh);
    }
  }

  void duck() {
    if (p.ground) {
      if (p.slide <= 0) sound(ArcadeSound.swish);
      p.slide = .6;
    } else {
      p.vy = p.grav * math.max(p.vy * p.grav, 650);
      p.slideQ = true;
    }
  }

  @override
  void press(ArcadeButton b) {
    // On the ceiling Up and Down swap, so the screen's directions still mean
    // away from the surface and toward it.
    final ceiling = p.grav < 0;
    switch (b) {
      case ArcadeButton.ok:
        jump();
      case ArcadeButton.up:
        ceiling ? duck() : jump();
      case ArcadeButton.down:
        ceiling ? jump() : duck();
      case ArcadeButton.left:
      case ArcadeButton.right:
        break;
    }
  }

  @override
  void ai() {
    if (p.wantFlip && p.jumps == 1 && p.vy * p.grav > -400) {
      p.wantFlip = false;
      jump();
      return;
    }
    if (!p.ground) return;
    final near = things
        .where(
          (o) =>
              !o.pick &&
              !o.dead &&
              o.x + o.w > p.x - 14 &&
              o.x - (p.x + 10) < speed * 1.1,
        )
        .toList();
    if (near.isEmpty && t > flipAt) {
      flipAt = t + rand(3, 6);
      p.wantFlip = true;
      jump();
      return;
    }
    // A flip takes about a third of a second, so cross to a banner's sign
    // side early.
    final wall = near
        .where(
          (o) =>
              o.k == 'banner' &&
              o.side != p.grav &&
              o.x - (p.x + 10) > speed * .5 &&
              !near.any(
                (b) => b.k == 'banner' && b.side == p.grav && b.x < o.x,
              ),
        )
        .firstOrNull;
    if (wall != null) {
      p.wantFlip = true;
      jump();
      return;
    }
    for (final o in near) {
      final d = o.x - (p.x + 10);
      if (d < -4) continue;
      if (o.side != p.grav || d > speed * .45) continue;
      if (o.k == 'lagBat' && o.y0 <= 154) continue;
      if (o.k == 'banner' || o.k == 'lagBat') {
        if (d < speed * .22 && p.slide < .15) duck();
      } else if (d < speed * .2 + 8) {
        jump();
      }
      return;
    }
  }

  @override
  void draw(Ctx c, double t) {
    c.fillStyle = _sky;
    c.fillRect(0, 0, arcadeW, arcadeH);
    c.fillStyle = K.ink;
    for (final s in _stars) {
      c.globalAlpha = .3 + .4 * s.s / 1.6;
      c.fillRect(
        ((s.x - dist * .02 * s.s) % arcadeW + arcadeW) % arcadeW,
        s.y,
        s.s,
        s.s,
      );
    }
    c.globalAlpha = .18;
    circle(c, 404, 84, 26, const Color(0xFFF3EECF));
    c.globalAlpha = 1;
    circle(c, 404, 84, 16, const Color(0xFFF3EECF));
    circle(c, 398, 80, 3, const Color(0xFFDDD6B4));
    circle(c, 410, 90, 2.2, const Color(0xFFDDD6B4));
    for (final b in _blds) {
      final x = ((b.off - dist * .25) % 648 + 648) % 648 - 80;
      c.fillStyle = const Color(0xFF1B1538);
      c.fillRect(x, _g - b.h, b.w, b.h);
      c.fillStyle = const Color.fromRGBO(255, 201, 74, .45);
      for (var j = 0; j < 3; j++) {
        if ((b.off / 72 + j) % 3 != 0) {
          c.fillRect(x + 8 + j * 14, _g - b.h + 10, 4, 5);
        }
      }
    }
    for (final (y0, y1, edge) in const [(0.0, _c, _c - 2), (_g, arcadeH, _g)]) {
      c.fillStyle = const Color(0xFF1D1840);
      c.fillRect(0, y0, arcadeW, y1 - y0);
      c.fillStyle = K.night;
      for (var x = -(dist % 24); x < arcadeW; x += 24) {
        c.fillRect(x + 4, y0 + 6, 12, 7);
        c.fillRect(x + 4, y1 - 13, 12, 7);
      }
      c.fillStyle = K.purple;
      c.fillRect(0, edge, arcadeW, 2);
    }
    for (final o in things) {
      final up = o.side < 0;
      if (o.k == 'banner') {
        c.save();
        if (up) {
          c.translate(0, arcadeH);
          c.scale(1, -1);
        }
        c.fillStyle = const Color(0xFF4B4380);
        c.fillRect(o.x + 15.5, o.y, 3, o.h - 24);
        put(c, 'banner', o.x + 17, o.y + o.h - 13, t);
        c.restore();
        continue;
      }
      final cy = up ? arcadeH - o.y - o.h / 2 : o.y + o.h / 2;
      if (up && !o.pick && o.k != 'lagBat') {
        c.save();
        c.translate(o.x + o.w / 2, cy);
        c.scale(1, -1);
        sprites[o.k]!(c, t);
        c.restore();
      } else {
        put(c, o.k, o.x + o.w / 2, cy, t);
      }
    }
    final fr = _stride.frame(this.t, speed);
    if (!(inv > 0 && (t * 16).floor().isOdd)) {
      final f = _feet(p);
      if (p.dash > 0) {
        c.fillStyle = const Color.fromRGBO(255, 201, 74, .55);
        for (var i = 0; i < 4; i++) {
          c.fillRect(p.x - 44 - i * 10, f - (38 - i * 9) * p.grav, 26, 2);
        }
      }
      runner(
        c,
        p.x,
        f,
        p.ground ? fr : 7,
        slide: p.slide > 0,
        flip: p.grav < 0,
        t: t,
      );
      if (p.shield > 0) {
        c.globalAlpha = .75;
        ring(c, p.x, p.y, 27, K.mint, 2);
        c.globalAlpha = 1;
      }
    }
    hud(c, score, [
      p.shield > 0 ? 'directPlay' : null,
      p.dash > 0 ? 'skipIntro' : null,
    ], t);
  }
}
