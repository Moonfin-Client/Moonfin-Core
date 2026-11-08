import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../after_hours_canvas.dart';
import '../after_hours_game.dart';

const double _ch = 14, _base = 244, _full = 150;

/// Used when the media bar has nothing to lend. Format names need no
/// translating and say nothing about anyone's library.
const List<CaseTitle> neutralCaseTitles = [
  (title: 'BLU-RAY', color: K.blue),
  (title: '4K ULTRA HD', color: K.purple),
  (title: 'DVD', color: K.coral),
  (title: 'LASERDISC', color: K.gold),
  (title: 'VHS', color: K.mint),
  (title: 'HD DVD', color: Color(0xFF7D8BD6)),
  (title: 'VIDEO CD', color: K.blue),
  (title: 'BETAMAX', color: K.coral),
];

class CsSlab {
  CsSlab({
    required this.x,
    required this.tx,
    required this.w,
    required this.title,
    required this.col,
    this.steel = false,
  });

  double x;

  /// Where the case's own left edge was, so a trimmed piece keeps its part
  /// of the title.
  final double tx;
  double w;
  final String title;
  final Color col;
  final bool steel;
  double dir = 1, v = 0;
  double y = 0, vy = 0, rot = 0, vr = 0;
}

double _yOf(int i) => _base - (i + 1) * _ch;

/// One-button stacker of Blu-ray cases titled from the media bar.
class CaseStack extends ArcadeGame {
  CaseStack(
    super.rng,
    List<CaseTitle> titles, {
    required this.perfectLabel,
    required this.boxSetLabel,
  }) : shelf = titles.isEmpty ? neutralCaseTitles : titles;

  final List<CaseTitle> shelf;
  final String perfectLabel, boxSetLabel;
  int combo = 0, seed = 0;
  double bonus = 0, cam = 0, flash = 0, paw = 0, pawX = 0, aim = 0;
  List<CsSlab> stack = [];
  List<CsSlab> fx = [];
  CsSlab? cur;

  @override
  TouchMode get touchMode => TouchMode.tapOnDown;

  void _spawn() {
    final n = stack.length, top = stack[n - 1], steel = n % 10 == 9;
    final cat = n > 8 && !steel && rng.nextDouble() < .12;
    final left = rng.nextDouble() < .5;
    final s = shelf[(seed + n) % shelf.length];
    cur =
        CsSlab(
            x: left ? 12 : arcadeW - 12 - top.w,
            tx: 0,
            w: top.w,
            title: s.title,
            col: s.color,
            steel: steel,
          )
          ..dir = left ? 1 : -1
          ..v =
              math.min(330, 110 + n * 6) * (steel ? 1.6 : 1) * (cat ? 1.5 : 1);
    paw = cat ? .5 : 0;
    pawX = left ? 16 : arcadeW - 16;
    aim = rng.nextDouble() < .3 ? 0 : rand(-1, 1) * (4 + n * .15);
    if (cat) sound(ArcadeSound.whoosh);
  }

  @override
  void reset() {
    final start = randInt(0, shelf.length - 1);
    final s = shelf[start];
    super.reset();
    bonus = 0;
    combo = 0;
    cam = 0;
    flash = 0;
    fx = [];
    seed = start + 1;
    stack = [
      CsSlab(
        x: (arcadeW - _full) / 2,
        tx: (arcadeW - _full) / 2,
        w: _full,
        title: s.title,
        col: s.color,
      ),
    ];
    _spawn();
  }

  void drop() {
    final c = cur;
    if (c == null || over) return;
    final top = stack.last, y = _yOf(stack.length), dx = c.x - top.x;
    CsSlab piece(double x, double w, {double? tx}) => CsSlab(
      x: x,
      tx: tx ?? c.x,
      w: w,
      title: c.title,
      col: c.col,
      steel: c.steel,
    );
    if (dx.abs() < 3) {
      combo++;
      final w = math.min(_full, top.w + (combo % 3 != 0 ? 6 : 30));
      final x = top.x - (w - top.w) / 2;
      stack.add(piece(x, w, tx: x));
      bonus += combo * 5;
      flash = .6;
      sound(ArcadeSound.thud);
      sound(combo % 3 != 0 ? ArcadeSound.pickup : ArcadeSound.powerup);
    } else {
      combo = 0;
      final l = math.max(c.x, top.x), r = math.min(c.x + c.w, top.x + top.w);
      if (r <= l) {
        fx.add(
          piece(c.x, c.w)
            ..y = y
            ..vr = dx > 0 ? 2 : -2,
        );
        cur = null;
        over = true;
        return;
      }
      stack.add(piece(l, r - l));
      fx.add(
        piece(dx > 0 ? r : c.x, c.w - (r - l))
          ..y = y
          ..vr = dx > 0 ? 2.5 : -2.5,
      );
      sound(ArcadeSound.thud);
      sound(ArcadeSound.breakSound);
    }
    score = stack.length - 1 + bonus.toInt();
    _spawn();
  }

  @override
  void press(ArcadeButton b) {
    if (b == ArcadeButton.ok) drop();
  }

  @override
  void update(double dt) {
    t += dt;
    paw -= dt;
    flash -= dt;
    final c = cur;
    if (c != null) {
      c.x += c.dir * c.v * dt;
      if (c.x < 12) {
        c.x = 12;
        c.dir = 1;
      }
      if (c.x + c.w > arcadeW - 12) {
        c.x = arcadeW - 12 - c.w;
        c.dir = -1;
      }
    }
    for (final f in fx) {
      f.vy += 900 * dt;
      f.y += f.vy * dt;
      f.rot += f.vr * dt;
    }
    fx = fx.where((f) => f.y + cam < arcadeH + 40).toList();
    cam += (math.max(0, (stack.length - 9) * _ch) - cam) * math.min(1, dt * 5);
  }

  @override
  void ai() {
    final c = cur;
    if (c == null) return;
    final target = (stack.last.x + aim).clamp(12.0, arcadeW - 12 - c.w);
    final next = c.x + c.dir * c.v / 60;
    if ((c.x - target) * (next - target) <= 0) drop();
  }

  void _slab(Ctx c, double x, double y, double w, CsSlab s, [double off = 0]) {
    if (w <= 0) return;
    final col = s.steel ? const Color(0xFFB8BDD6) : s.col;
    rr(c, x, y + 1, w, _ch - 2, 2, col);
    if (off == 0) {
      c.fillStyle = const Color.fromRGBO(0, 0, 0, .25);
      c.fillRect(x, y + 1, math.min(4, w), _ch - 2);
    }
    c.save();
    c.beginPath();
    c.rect(x, y, w, _ch);
    c.clip();
    c.font(7.5, bold: true);
    c.textMiddle = true;
    c.fillStyle = s.steel || col.computeLuminance() > .4
        ? K.night
        : const Color(0xFFFFFFFF);
    c.fillText(s.title, x - off + 7, y + _ch / 2 + .5);
    c.restore();
  }

  static final _bg = CtxGradient(
    Offset.zero,
    const Offset(0, arcadeH),
    const [Color(0xFF120E2C), Color(0xFF241A4A)],
    const [0, 1],
  );

  @override
  void draw(Ctx c, double t) {
    c.fillStyle = _bg;
    c.fillRect(0, 0, arcadeW, arcadeH);
    c.fillStyle = const Color.fromRGBO(170, 92, 195, .1);
    for (var i = 0; i < 5; i++) {
      c.fillRect(0, ((i * 64 + cam * .4) % 320) - 20, arcadeW, 5);
    }
    c.save();
    c.translate(0, cam);
    c.fillStyle = const Color(0xFF3A2F6B);
    c.fillRect(70, _base, arcadeW - 140, 7);
    c.fillStyle = const Color(0xFF2A2152);
    c.fillRect(84, _base + 7, 9, 60);
    c.fillRect(arcadeW - 93, _base + 7, 9, 60);
    final n = stack.length;
    for (var i = math.max(0, n - 16); i < n; i++) {
      final s = stack[i];
      _slab(c, s.x, _yOf(i), s.w, s, s.x - s.tx);
    }
    final cr = cur;
    if (cr != null) _slab(c, cr.x, _yOf(n), cr.w, cr);
    for (final f in fx) {
      c.save();
      c.translate(f.x + f.w / 2, f.y + _ch / 2);
      c.rotate(f.rot);
      _slab(c, -f.w / 2, -_ch / 2, f.w, f, f.x - f.tx);
      c.restore();
    }
    c.restore();
    final y = _yOf(n) + cam;
    if (paw > 0) {
      c.globalAlpha = math.min(1, paw * 4);
      put(c, 'shelfCat', pawX, y + _ch / 2, t, .9);
      c.globalAlpha = 1;
    }
    if (flash > 0) {
      c.globalAlpha = math.min(1, flash * 3);
      c.font(26, family: arcadeDisplayFont);
      c.textAlign = TextAlign.center;
      c.fillStyle = K.gold;
      c.fillText(
        combo % 3 != 0 ? perfectLabel : boxSetLabel,
        arcadeW / 2,
        y - 10,
      );
      c.globalAlpha = 1;
      c.textAlign = TextAlign.left;
    }
    hud(c, score, [combo > 0 ? 'perfect' : null], t);
  }
}
