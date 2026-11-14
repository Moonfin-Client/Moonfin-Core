import 'dart:collection';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' show PointMode;

import 'package:flutter/painting.dart';

import '../after_hours_canvas.dart';
import '../after_hours_game.dart';

const int _cs = 15, _cols = 32, _rows = 16;
const double _oy = 30;
const _dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];

typedef Cell = ({int x, int y});

class CcBlock {
  CcBlock(this.x, this.y, this.s, this.k);
  final int x, y, s;
  final String k;
}

class CcFoe {
  CcFoe(this.x, this.y, this.k);
  int x, y;
  final String k;
}

class CcItem {
  CcItem(this.x, this.y, this.k, this.life);
  final int x, y;
  final String k;
  double life;
}

/// Grid crawler: an HDMI cable that moves one cell per step.
class CableCrawl extends ArcadeGame {
  CableCrawl(super.rng);

  int eaten = 0, n = 0, grow = 2;
  double tick = 0, step = .13, ghost = 0;
  (int, int) dir = (1, 0);
  List<(int, int)> queue = [];
  List<Cell> body = [];
  List<CcBlock> blocks = [];
  List<CcFoe> foes = [];
  List<CcItem> items = [];
  Cell food = (x: 0, y: 0);

  static int _key(int x, int y) => x * 64 + y;

  // One points call for the board's dots instead of a rect for each, since
  // this draws every frame.
  static final _dots = Float32List.fromList([
    for (var x = 0; x < _cols; x++)
      for (var y = 0; y < _rows; y++) ...[x * _cs + 7.75, _oy + y * _cs + 7.75],
  ]);
  static final _dotPaint = Paint()
    ..color = const Color(0xFF262050)
    ..strokeWidth = 1.5
    ..strokeCap = StrokeCap.square;

  bool blockedAt(int x, int y) =>
      blocks.any((b) => x >= b.x && x < b.x + b.s && y >= b.y && y < b.y + b.s);

  bool bodyAt(int x, int y, [int from = 0, bool skipTail = false]) {
    final end = body.length - (skipTail ? 1 : 0);
    for (var i = from; i < end; i++) {
      if (body[i].x == x && body[i].y == y) return true;
    }
    return false;
  }

  bool foeAt(int x, int y) => foes.any((f) => f.x == x && f.y == y);

  Cell free([int s = 1, bool hasFood = true]) {
    final h = body[0];
    for (var i = 0; i < 300; i++) {
      final x = randInt(0, _cols - s), y = randInt(0, _rows - s);
      var ok = (x - h.x).abs() + (y - h.y).abs() > 4;
      for (var dx = 0; dx < s && ok; dx++) {
        for (var dy = 0; dy < s && ok; dy++) {
          final cx = x + dx, cy = y + dy;
          if (bodyAt(cx, cy) ||
              blockedAt(cx, cy) ||
              foeAt(cx, cy) ||
              (hasFood && food.x == cx && food.y == cy) ||
              items.any((it) => it.x == cx && it.y == cy)) {
            ok = false;
          }
        }
      }
      if (ok) return (x: x, y: y);
    }
    return (x: 0, y: 0);
  }

  @override
  void reset() {
    super.reset();
    eaten = 0;
    tick = 0;
    n = 0;
    step = .13;
    dir = (1, 0);
    queue = [];
    grow = 2;
    ghost = 0;
    body = [(x: 8, y: 8), (x: 7, y: 8), (x: 6, y: 8)];
    blocks = [];
    foes = [];
    items = [];
    food = free(1, false);
  }

  @override
  void update(double dt) {
    t += dt;
    ghost -= dt;
    for (final it in items) {
      it.life -= dt;
    }
    items = items.where((it) => it.life > 0).toList();
    if ((tick += dt) < step) return;
    tick = 0;
    n++;
    if (queue.isNotEmpty) dir = queue.removeAt(0);
    final h = body[0];
    final nx = h.x + dir.$1, ny = h.y + dir.$2, ghosting = ghost > 0;
    if (nx < 0 || ny < 0 || nx >= _cols || ny >= _rows) {
      over = true;
      return;
    }
    if (!ghosting &&
        (bodyAt(nx, ny, 0, grow == 0) || blockedAt(nx, ny) || foeAt(nx, ny))) {
      over = true;
      return;
    }
    body.insert(0, (x: nx, y: ny));
    if (grow > 0) {
      grow--;
    } else {
      body.removeLast();
    }
    if (nx == food.x && ny == food.y) {
      eaten++;
      score += 10 + body.length;
      grow += 2;
      step = math.max(.065, .13 - eaten * .002);
      sound(ArcadeSound.pickup);
      if (eaten % 3 == 0) {
        final c = free();
        blocks.add(CcBlock(c.x, c.y, 1, 'staticBlock'));
      }
      if (eaten % 5 == 0) {
        final c = free(2);
        blocks.add(CcBlock(c.x, c.y, 2, 'brick'));
      }
      if (eaten == 4 || (eaten % 12 == 0 && foes.length < 3)) {
        final c = free();
        foes.add(CcFoe(c.x, c.y, 'bug'));
      }
      if (eaten == 8) {
        final c = free();
        foes.add(CcFoe(c.x, c.y, 'tangle'));
      }
      if (eaten % 6 == 0) {
        final c = free();
        items.add(
          CcItem(c.x, c.y, rng.nextDouble() < .5 ? 'ghost' : 'snip', 8),
        );
      }
      food = free();
    }
    final it = items.where((i) => i.x == nx && i.y == ny).firstOrNull;
    if (it != null) {
      it.life = 0;
      if (it.k == 'ghost') {
        ghost = 5;
        sound(ArcadeSound.powerup);
      } else {
        final keep = math.max(3, (body.length / 2).ceil());
        score += 5 * (body.length - keep);
        body = body.sublist(0, keep);
        grow = 0;
        sound(ArcadeSound.breakSound);
      }
    }
    final head = body[0];
    for (final f in foes) {
      if (f.k == 'bug' && n.isOdd) continue;
      if (f.k == 'tangle' && n % 3 != 0) continue;
      final opts = [for (final d in _dirs) (x: f.x + d.$1, y: f.y + d.$2)]
          .where(
            (q) =>
                q.x >= 0 &&
                q.y >= 0 &&
                q.x < _cols &&
                q.y < _rows &&
                !blockedAt(q.x, q.y) &&
                !bodyAt(q.x, q.y, 1) &&
                !foeAt(q.x, q.y) &&
                !(q.x == food.x && q.y == food.y),
          )
          .toList();
      if (opts.isEmpty) continue;
      int dist(Cell q) => (q.x - head.x).abs() + (q.y - head.y).abs();
      final Cell to;
      if (f.k == 'tangle') {
        opts.sort((a, b) => dist(a) - dist(b));
        to = opts[0];
      } else {
        to = opts[randInt(0, opts.length - 1)];
      }
      f.x = to.x;
      f.y = to.y;
      if (!ghosting && f.x == head.x && f.y == head.y) over = true;
    }
  }

  @override
  void press(ArcadeButton b) {
    final d = switch (b) {
      ArcadeButton.up => (0, -1),
      ArcadeButton.down => (0, 1),
      ArcadeButton.left => (-1, 0),
      ArcadeButton.right => (1, 0),
      ArcadeButton.ok => null,
    };
    if (d == null) return;
    final last = queue.isNotEmpty ? queue.last : dir;
    if ((d.$1 == -last.$1 && d.$2 == -last.$2) || d == last) return;
    if (queue.length < 2) queue.add(d);
  }

  @override
  void ai() {
    if (tick < step * .8) return;
    final h = body[0];
    bool blocked(int x, int y) =>
        x < 0 ||
        y < 0 ||
        x >= _cols ||
        y >= _rows ||
        bodyAt(x, y) ||
        blockedAt(x, y) ||
        foes.any((f) => (f.x - x).abs() + (f.y - y).abs() <= 1);
    final prev = <int, (int, int, (int, int))?>{_key(h.x, h.y): null};
    final q = Queue<(int, int)>()..add((h.x, h.y));
    final goals = {_key(food.x, food.y), for (final i in items) _key(i.x, i.y)};
    int? end;
    while (q.isNotEmpty) {
      final (x, y) = q.removeFirst();
      if (goals.contains(_key(x, y))) {
        end = _key(x, y);
        break;
      }
      for (final d in _dirs) {
        final nx = x + d.$1, ny = y + d.$2, k = _key(nx, ny);
        if (prev.containsKey(k) || blocked(nx, ny)) continue;
        prev[k] = (x, y, d);
        q.add((nx, ny));
      }
    }
    (int, int)? next;
    for (var k = end; k != null;) {
      final pv = prev[k];
      if (pv == null) break;
      if (pv.$1 == h.x && pv.$2 == h.y) {
        next = pv.$3;
        break;
      }
      k = _key(pv.$1, pv.$2);
    }
    if (next == null) {
      var most = -1;
      for (final d in _dirs) {
        final x = h.x + d.$1, y = h.y + d.$2;
        if (blocked(x, y)) continue;
        final open = _dirs.where((e) => !blocked(x + e.$1, y + e.$2)).length;
        if (open > most) {
          most = open;
          next = d;
        }
      }
    }
    if (next != null) queue = [next];
  }

  @override
  void draw(Ctx c, double t) {
    double cx(int x) => x * _cs + _cs / 2;
    double cy(int y) => _oy + y * _cs + _cs / 2;
    c.fillStyle = K.night;
    c.fillRect(0, 0, arcadeW, arcadeH);
    c.fillStyle = const Color(0xFF120F2B);
    c.fillRect(0, _oy, arcadeW, _rows * _cs.toDouble());
    c.canvas.drawRawPoints(PointMode.points, _dots, _dotPaint);
    c.strokeStyle = K.purple;
    c.lineWidth = 1;
    c.strokeRect(.5, _oy + .5, arcadeW - 1, _rows * _cs - 1);
    for (final b in blocks) {
      put(
        c,
        b.k,
        b.x * _cs + b.s * _cs / 2,
        _oy + b.y * _cs + b.s * _cs / 2,
        b.k == 'staticBlock' ? t : 0,
      );
    }
    put(c, 'signal', cx(food.x), cy(food.y), t);
    for (final it in items) {
      if (it.life > 2 || (t * 8).floor().isOdd) {
        put(c, it.k, cx(it.x), cy(it.y), t);
      }
    }
    for (final f in foes) {
      put(c, f.k, cx(f.x), cy(f.y), t);
    }
    if (ghost > 0) c.globalAlpha = .5;
    c.lineCap = StrokeCap.round;
    c.lineJoin = StrokeJoin.round;
    c.beginPath();
    for (final s in body) {
      c.lineTo(cx(s.x), cy(s.y));
    }
    c.strokeStyle = K.blue;
    c.lineWidth = 10;
    c.stroke();
    c.strokeStyle = K.purple;
    c.lineWidth = 2.5;
    c.stroke();
    final h = body[0];
    put(
      c,
      'plug',
      cx(h.x),
      cy(h.y),
      t,
      1,
      math.atan2(dir.$2 * 1.0, dir.$1 * 1.0),
    );
    c.globalAlpha = 1;
    c.lineCap = StrokeCap.butt;
    hud(c, score, [ghost > 0 ? 'ghost' : null], t);
  }
}
