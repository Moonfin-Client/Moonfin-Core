import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../after_hours_canvas.dart';
import '../after_hours_game.dart';

const double _bw = 36, _bh = 12, _gap = 3, _top = 34, _py = 248, _limit = 232;
const int _n = 12;
const double _ox = (arcadeW - _n * (_bw + _gap) + _gap) / 2;
const _tone = [K.blue, K.purple, K.coral];

class PpBlock {
  PpBlock(this.x, this.y, this.hp, this.c, this.seed) : max = hp;
  final double x;
  double y;
  int hp;
  final int max, c, seed;
  double flash = 0;
  bool dead = false;
}

class PpDrop {
  PpDrop(this.k, this.x, this.y);
  final String k;
  final double x;
  double y;
  bool got = false;
}

class PpBit {
  PpBit(this.x, this.y, this.vx, this.vy, this.l, this.col);
  double x, y, l;
  final double vx, vy;
  final Color col;
}

class PpScrubber {
  double x = arcadeW / 2, tx = arcadeW / 2, cw = 60, hdr = 0, shrink = 0;
  bool net = false;
}

class PpBall {
  double x = arcadeW / 2, y = _py - 12, vx = 110, vy = -200;
}

/// Paddle breaker against a bad encode that creeps down the screen.
class PixelPurge extends ArcadeGame {
  PixelPurge(super.rng);

  List<PpBlock> blocks = [];
  List<PpDrop> drops = [];
  List<PpBit> fx = [];
  double rowY = _top, aimOff = 0;
  PpScrubber p = PpScrubber();
  PpBall b = PpBall();
  ArcadeButton? _held;

  @override
  TouchMode get touchMode => TouchMode.drag;

  void _row(double y) {
    for (var i = 0; i < _n; i++) {
      if (rng.nextDouble() < .72) {
        final hp = rng.nextDouble() < .1 ? 3 : 1;
        blocks.add(
          PpBlock(_ox + i * (_bw + _gap), y, hp, randInt(0, 2), randInt(0, 7)),
        );
      }
    }
  }

  @override
  void reset() {
    super.reset();
    blocks = [];
    drops = [];
    fx = [];
    rowY = _top;
    aimOff = 0;
    p = PpScrubber();
    b = PpBall();
    _held = null;
    for (var r = 4; r >= 0; r--) {
      _row(_top + r * (_bh + _gap));
    }
  }

  void _smash(PpBlock k) {
    k.dead = true;
    score += k.max > 1 ? 30 : 10;
    for (var i = 0; i < 6; i++) {
      fx.add(
        PpBit(
          k.x + rand(0, _bw),
          k.y + rand(0, _bh),
          rand(-60, 60),
          rand(-40, 60),
          rand(.25, .5),
          k.max > 1 ? K.gold : _tone[k.c],
        ),
      );
    }
    if (k.max > 1) {
      drops.add(
        PpDrop(
          rng.nextDouble() < .5 ? 'hdr' : 'bufferNet',
          k.x + _bw / 2,
          k.y + _bh / 2,
        ),
      );
    } else if (rng.nextDouble() < .08) {
      drops.add(PpDrop('deadPixel', k.x + _bw / 2, k.y + _bh / 2));
    }
    sound(ArcadeSound.breakSound);
  }

  @override
  void update(double dt) {
    t += dt;
    p.hdr -= dt;
    p.shrink -= dt;
    final drift = 4 + t * .06;
    for (final k in blocks) {
      k.y += drift * dt;
      k.flash -= dt;
    }
    rowY += drift * dt;
    if (rowY >= _top + _bh + _gap) {
      rowY -= _bh + _gap;
      _row(rowY);
    }
    p.cw = 60 * (p.hdr > 0 ? 2 : 1) * (p.shrink > 0 ? .65 : 1);
    p.x += (p.tx - p.x).clamp(-330 * dt, 330 * dt);
    p.x = p.x.clamp(p.cw / 2, arcadeW - p.cw / 2);
    final spd = math.min(360.0, 220 + t * 2);
    final m = math.sqrt(b.vx * b.vx + b.vy * b.vy);
    b.vx *= spd / m;
    b.vy *= spd / m;
    // Two sub-steps keep a fast ball from skipping through a block.
    for (var s = 0; s < 2; s++) {
      b.x += b.vx * dt / 2;
      b.y += b.vy * dt / 2;
      if (b.x < 4) {
        b.x = 4;
        b.vx = b.vx.abs();
      } else if (b.x > arcadeW - 4) {
        b.x = arcadeW - 4;
        b.vx = -b.vx.abs();
      }
      if (b.y < _top) {
        b.y = _top;
        b.vy = b.vy.abs();
      }
      if (b.vy > 0 &&
          b.y >= _py - 4 &&
          b.y <= _py + 6 &&
          (b.x - p.x).abs() <= p.cw / 2 + 4) {
        final a = ((b.x - p.x) / (p.cw / 2)).clamp(-1.0, 1.0) * 1.05;
        b.vx = math.sin(a) * spd;
        b.vy = -math.cos(a) * spd;
        b.y = _py - 4;
        aimOff = rand(-.4, .4) * p.cw;
        sound(ArcadeSound.tick);
      }
      if (p.net && b.vy > 0 && b.y >= _py + 14) {
        b.vy = -b.vy.abs();
        b.y = _py + 14;
        p.net = false;
        sound(ArcadeSound.thud);
      }
      for (final k in blocks) {
        if (k.dead ||
            b.x + 4 < k.x ||
            b.x - 4 > k.x + _bw ||
            b.y + 4 < k.y ||
            b.y - 4 > k.y + _bh) {
          continue;
        }
        final ox = math.min(b.x + 4 - k.x, k.x + _bw - b.x + 4);
        final oy = math.min(b.y + 4 - k.y, k.y + _bh - b.y + 4);
        if (ox < oy) {
          b.vx = b.x < k.x + _bw / 2 ? -b.vx.abs() : b.vx.abs();
        } else {
          b.vy = b.y < k.y + _bh / 2 ? -b.vy.abs() : b.vy.abs();
        }
        if (--k.hp <= 0) {
          _smash(k);
        } else {
          k.flash = .1;
          sound(ArcadeSound.thud);
        }
        break;
      }
    }
    blocks = blocks.where((k) => !k.dead).toList();
    for (final d in drops) {
      d.y += 90 * dt;
      if (!d.got &&
          d.y >= _py - 6 &&
          d.y <= _py + 6 &&
          (d.x - p.x).abs() <= p.cw / 2 + 6) {
        d.got = true;
        if (d.k == 'hdr') {
          p.hdr = 8;
          sound(ArcadeSound.powerup);
        } else if (d.k == 'bufferNet') {
          p.net = true;
          sound(ArcadeSound.powerup);
        } else {
          p.shrink = 6;
          sound(ArcadeSound.back);
        }
      }
    }
    drops = drops.where((d) => !d.got && d.y < arcadeH + 10).toList();
    for (final f in fx) {
      f.x += f.vx * dt;
      f.y += f.vy * dt;
      f.l -= dt;
    }
    fx = fx.where((f) => f.l > 0).toList();
    if (b.y > arcadeH + 6 || blocks.any((k) => k.y + _bh > _limit)) {
      over = true;
    }
  }

  /// Left and Right steer while held, at the scrubber's top speed.
  @override
  void press(ArcadeButton b) {
    if (b == ArcadeButton.left) {
      _held = b;
      p.tx = 0;
    } else if (b == ArcadeButton.right) {
      _held = b;
      p.tx = arcadeW;
    }
  }

  @override
  void release(ArcadeButton b) {
    if (b != _held) return;
    _held = null;
    p.tx = p.x;
  }

  @override
  void drag(double x) => p.tx = x;

  /// Unfold the wall bounces to find where the ball will cross the bar, then
  /// aim off center for a new angle.
  @override
  void ai() {
    if (b.vy <= 0) {
      p.tx = b.x;
      return;
    }
    const span = arcadeW - 8;
    var x = b.x + b.vx * (_py - 4 - b.y) / b.vy - 4;
    x = ((x % (2 * span)) + 2 * span) % (2 * span);
    if (x > span) x = 2 * span - x;
    p.tx = x + 4 - aimOff;
  }

  /// A dashed line as one path of short strokes, since a dash pattern would
  /// cut a new path for every dash on every frame.
  void _dashes(Ctx c, double x0, double x1, double y, double dash) {
    c.beginPath();
    for (var x = x0; x < x1; x += dash * 2) {
      c.moveTo(x, y);
      c.lineTo(math.min(x + dash, x1), y);
    }
    c.stroke();
  }

  static final _bg = CtxGradient(
    Offset.zero,
    const Offset(arcadeW, arcadeH),
    const [Color(0xFF1A1238), Color(0xFF0B1F38)],
    const [0, 1],
  );

  @override
  void draw(Ctx c, double t) {
    c.fillStyle = _bg;
    c.fillRect(0, 0, arcadeW, arcadeH);
    c.strokeStyle = const Color.fromRGBO(255, 107, 133, .35);
    c.lineWidth = 1;
    _dashes(c, 0, arcadeW, _limit + .5, 4);
    for (final k in blocks) {
      if (k.max > 1) {
        rr(c, k.x, k.y, _bw, _bh, 2, const Color(0xFF2A2152));
        c.strokeStyle = K.gold;
        c.lineWidth = 1.5;
        c.strokeRect(k.x + .75, k.y + .75, _bw - 1.5, _bh - 1.5);
        for (var i = 0; i < k.hp; i++) {
          circle(c, k.x + _bw / 2 - 6 + i * 6, k.y + _bh / 2, 1.6, K.gold);
        }
      } else {
        c.fillStyle = _tone[k.c];
        c.fillRect(k.x, k.y, _bw, _bh);
        for (var i = 0; i < 6; i++) {
          c.fillStyle = (i + k.seed) % 3 != 0
              ? const Color.fromRGBO(255, 255, 255, .16)
              : const Color.fromRGBO(0, 0, 0, .22);
          c.fillRect(k.x + i * 6, k.y + ((i + k.seed) % 2) * 6, 6, 6);
        }
      }
      if (k.flash > 0) {
        c.fillStyle = const Color.fromRGBO(255, 255, 255, .6);
        c.fillRect(k.x, k.y, _bw, _bh);
      }
    }
    for (final d in drops) {
      put(c, d.k, d.x, d.y, t, .75);
    }
    for (final f in fx) {
      c.globalAlpha = math.min(1, f.l * 3);
      c.fillStyle = f.col;
      c.fillRect(f.x - 1.5, f.y - 1.5, 3, 3);
    }
    c.globalAlpha = 1;
    c.fillStyle = const Color(0xFF2C2756);
    c.fillRect(8, _py + 3, arcadeW - 16, 3);
    c.fillStyle = K.blue;
    c.fillRect(8, _py + 3, math.max(0, p.x - 8), 3);
    if (p.net) {
      c.strokeStyle = K.mint;
      c.lineWidth = 1.5;
      _dashes(c, 8, arcadeW - 8, _py + 15, 3);
    }
    rr(
      c,
      p.x - p.cw / 2,
      _py - 3,
      p.cw,
      9,
      4.5,
      p.hdr > 0 ? K.gold : (p.shrink > 0 ? K.coral : K.ink),
    );
    circle(c, b.x, b.y, 5, const Color(0xFFFFFFFF));
    c.fillStyle = K.night;
    c.beginPath();
    c.moveTo(b.x - 1.5, b.y - 2.5);
    c.lineTo(b.x + 2.5, b.y);
    c.lineTo(b.x - 1.5, b.y + 2.5);
    c.closePath();
    c.fill();
    hud(c, score, [p.hdr > 0 ? 'hdr' : null, p.net ? 'bufferNet' : null], t);
  }
}
