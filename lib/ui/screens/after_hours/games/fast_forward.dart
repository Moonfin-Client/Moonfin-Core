import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../after_hours_canvas.dart';
import '../after_hours_game.dart';

const _ly = [158.0, 198.0, 240.0];
const _foot = {
  'velvetRope': 11.0,
  'popcornCart': 22.0,
  'rollingReel': 11.0,
  'usher': 19.0,
  'ticket': 30.0,
  'magnet': 34.0,
  'frontRowPass': 34.0,
};

class FfThing {
  FfThing(
    this.k,
    this.x,
    this.lane,
    this.w, {
    this.pick = false,
    this.tall = false,
    this.sw = 0,
  });

  final String k;
  double x;
  int lane;
  final double w;
  final bool pick, tall;
  double sw;
  double? fy;
  bool dead = false;
}

class FfPlayer {
  double x = 90, ly = _ly[1], jy = 0, jv = 0, mag = 0;
  int lane = 1;
  bool pass = false;
}

/// Three-lane runner down the lobby aisles.
class FastForward extends ArcadeGame {
  FastForward(super.rng);

  double dist = 0, bonus = 0, speed = 230, next = 1, inv = 0;
  List<FfThing> things = [];
  FfPlayer p = FfPlayer();
  final _stride = StrideClock();

  static double _depth(double y) =>
      .78 + (y - _ly[0]) / (_ly[2] - _ly[0]) * .22;

  static int _nearest(double y) {
    var b = 0;
    for (var i = 0; i < _ly.length; i++) {
      if ((_ly[i] - y).abs() < (_ly[b] - y).abs()) b = i;
    }
    return b;
  }

  static int _laneOf(FfThing o) => _nearest(o.fy ?? _ly[o.lane]);

  @override
  void reset() {
    super.reset();
    dist = 0;
    bonus = 0;
    speed = 230;
    next = 1;
    things = [];
    inv = 0;
    p = FfPlayer();
  }

  void _spawn() {
    final x = arcadeW + 30.0, lane = randInt(0, 2), r = rng.nextDouble();
    if (t > 5 && rng.nextDouble() < .1) {
      things.add(
        FfThing(
          rng.nextDouble() < .5 ? 'magnet' : 'frontRowPass',
          x,
          lane,
          20,
          pick: true,
        ),
      );
      return;
    }
    String? k = r < .3
        ? 'popcornCart'
        : r < .5
        ? 'velvetRope'
        : r < .64 && t > 6
        ? 'rollingReel'
        : r < .76 && t > 10
        ? 'usher'
        : null;
    if (k == null) {
      for (var i = 0; i < 4; i++) {
        things.add(FfThing('ticket', x + i * 22, lane, 14, pick: true));
      }
      return;
    }
    // Never wall off all three lanes at once.
    if ((k == 'popcornCart' || k == 'usher') &&
        things
                .where((o) => o.tall && o.lane != lane && (o.x - x).abs() < 110)
                .map((o) => o.lane)
                .toSet()
                .length >=
            2) {
      k = 'velvetRope';
    }
    const widths = {
      'popcornCart': 30.0,
      'velvetRope': 30.0,
      'rollingReel': 22.0,
      'usher': 16.0,
    };
    things.add(
      FfThing(
        k,
        x,
        lane,
        widths[k]!,
        tall: k == 'popcornCart' || k == 'usher',
        sw: rand(.5, 1.3),
      ),
    );
  }

  @override
  void update(double dt) {
    t += dt;
    speed = math.min(500, 230 + t * 6);
    final v = speed;
    dist += v * dt;
    score = (dist / 8).floor() + bonus.toInt();
    p.ly += (_ly[p.lane] - p.ly).clamp(-420 * dt, 420 * dt);
    if (p.jy > 0 || p.jv > 0) {
      p.jv -= 1400 * dt;
      p.jy += p.jv * dt;
      if (p.jy <= 0) {
        p.jy = 0;
        p.jv = 0;
      }
    }
    p.mag -= dt;
    inv -= dt;
    if ((next -= dt) <= 0) {
      _spawn();
      next = math.max(.35, rand(.55, 1) * 260 / v);
    }
    final cl = _nearest(p.ly);
    for (final o in things) {
      o.x -= v * dt;
      if (o.k == 'rollingReel') o.x -= 120 * dt;
      if (o.k == 'usher') {
        o.x -= 30 * dt;
        if ((o.sw -= dt) <= 0) {
          o.lane = o.lane == 1 ? (rng.nextDouble() < .5 ? 0 : 2) : 1;
          o.sw = 99;
        }
      }
      final fy = o.fy;
      o.fy = fy == null
          ? _ly[o.lane]
          : fy + (_ly[o.lane] - fy).clamp(-160 * dt, 160 * dt);
      if (o.k == 'ticket' && p.mag > 0 && o.x - p.x < 150) {
        o.lane = cl;
        o.fy = p.ly;
        o.x -= 180 * dt;
      }
      if (o.dead || _laneOf(o) != cl || o.x > p.x + 9 || o.x + o.w < p.x - 9) {
        continue;
      }
      if (o.pick) {
        o.dead = true;
        if (o.k == 'ticket') {
          bonus += 25;
          sound(ArcadeSound.pickup);
        } else {
          if (o.k == 'magnet') {
            p.mag = 8;
          } else {
            p.pass = true;
          }
          sound(ArcadeSound.powerup);
        }
      } else if (!o.tall && p.jy > 16) {
      } else if (inv > 0) {
      } else if (p.pass) {
        p.pass = false;
        inv = 1.2;
        o.dead = true;
        sound(ArcadeSound.breakSound);
      } else {
        over = true;
      }
    }
    things = things.where((o) => !o.dead && o.x > -60).toList();
  }

  @override
  void press(ArcadeButton b) {
    final lane = p.lane;
    if (b == ArcadeButton.up) {
      p.lane = math.max(0, p.lane - 1);
    } else if (b == ArcadeButton.down) {
      p.lane = math.min(2, p.lane + 1);
    } else if (b == ArcadeButton.ok && p.jy == 0 && p.jv == 0) {
      p.jv = 420;
      sound(ArcadeSound.jump);
    }
    if (p.lane != lane) sound(ArcadeSound.swish);
  }

  @override
  void ai() {
    final v = speed;
    FfThing? h;
    for (final o in things) {
      if (o.pick || o.dead || _laneOf(o) != p.lane) continue;
      final d = o.x - p.x - 9;
      if (d < -o.w || d > v * .6) continue;
      if (h == null || o.x < h.x) h = o;
    }
    if (h == null) return;
    final d = h.x - p.x - 9;
    final cl = v + (h.k == 'rollingReel' ? 120 : (h.k == 'usher' ? 30 : 0));
    if (!h.tall) {
      if (d < cl * .16 && p.jy == 0) press(ArcadeButton.ok);
      return;
    }
    if (d < cl * .45) {
      bool free(int l) =>
          l >= 0 &&
          l <= 2 &&
          !things.any(
            (o) =>
                o.tall &&
                !o.dead &&
                _laneOf(o) == l &&
                o.x - p.x > -40 &&
                o.x - p.x < cl * .6,
          );
      if (free(p.lane - 1)) {
        press(ArcadeButton.up);
      } else if (free(p.lane + 1)) {
        press(ArcadeButton.down);
      }
    }
  }

  @override
  void draw(Ctx c, double t) {
    c.fillStyle = const Color(0xFF140F2E);
    c.fillRect(0, 0, arcadeW, 134);
    for (var i = 0; i < 6; i++) {
      final x = ((i * 110 - dist * .4) % 660 + 660) % 660 - 90;
      rr(c, x, 22, 62, 86, 4, const Color(0xFF2A2152));
      rr(c, x + 5, 27, 52, 76, 2, _posters[i % 3]);
      for (var j = 0; j < 6; j++) {
        circle(
          c,
          x + 6 + j * 10,
          16,
          1.6,
          (j + i + (t * 5).floor()) % 2 != 0 ? K.gold : const Color(0xFF6B4F1C),
        );
      }
    }
    c.fillStyle = const Color(0xFF211A45);
    c.fillRect(0, 134, arcadeW, arcadeH - 134);
    c.fillStyle = const Color(0xFF2A2152);
    c.fillRect(0, 134, arcadeW, 4);
    c.fillStyle = const Color.fromRGBO(255, 201, 74, .45);
    for (final y in const [178.0, 219.0]) {
      for (var x = -(dist % 28); x < arcadeW; x += 28) {
        c.fillRect(x, y, 14, 2);
      }
    }
    final items = <({double y, FfThing? o})>[
      for (final o in things) (y: o.fy ?? _ly[o.lane], o: o),
      (y: p.ly, o: null),
    ]..sort((a, b) => a.y.compareTo(b.y));
    for (final it in items) {
      final s = _depth(it.y);
      final o = it.o;
      c.fillStyle = const Color.fromRGBO(0, 0, 0, .3);
      c.beginPath();
      c.ellipse(
        o == null ? p.x : o.x + o.w / 2,
        it.y + 1,
        12 * s,
        3 * s,
        0,
        0,
        tau,
      );
      c.fill();
      if (o == null) {
        if (inv > 0 && (t * 16).floor().isOdd) continue;
        runner(
          c,
          p.x,
          p.ly - p.jy,
          p.jy > 0 ? 7 : _stride.frame(this.t, speed),
          s: s,
          t: t,
        );
        if (p.pass) {
          c.globalAlpha = .75;
          ring(c, p.x, p.ly - p.jy - 20 * s, 26 * s, K.mint, 2);
          c.globalAlpha = 1;
        }
        continue;
      }
      put(c, o.k, o.x + o.w / 2, it.y - _foot[o.k]! * s, t, s);
    }
    hud(c, score, [
      p.pass ? 'frontRowPass' : null,
      p.mag > 0 ? 'magnet' : null,
    ], t);
  }

  static final _posters = [
    for (final top in const [K.blue, K.purple, K.coral])
      CtxGradient(
        const Offset(0, 26),
        const Offset(0, 104),
        [top, const Color(0xFF1D1840)],
        const [0, 1],
      ),
  ];
}
