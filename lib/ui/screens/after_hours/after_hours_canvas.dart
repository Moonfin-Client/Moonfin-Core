import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

import '../../widgets/playback/loading_animation_widget.dart'
    show RunnerPainter;

/// The games draw on a 480 x 270 virtual screen that each layout scales.
const double arcadeW = 480;
const double arcadeH = 270;
const double tau = math.pi * 2;

const String arcadeMonoFont = 'monospace';
const String arcadeDisplayFont = 'Jersey10';

/// The After Hours palette.
abstract final class K {
  static const night = Color(0xFF0C0A1F);
  static const blue = Color(0xFF00A4DC);
  static const purple = Color(0xFFAA5CC3);
  static const gold = Color(0xFFFFC94A);
  static const coral = Color(0xFFFF6B85);
  static const mint = Color(0xFF5EF2C0);
  static const ink = Color(0xFFECE8FF);
  static const muted = Color(0xFFA8A2CF);
  static const panel = Color(0xFF151231);
  static const panel2 = Color(0xFF1C1840);
  static const line = Color(0xFF2C2756);
}

/// A fill or stroke made from a linear gradient, built once and reused.
class CtxGradient {
  CtxGradient(this.from, this.to, this.colors, this.stops);

  final Offset from;
  final Offset to;
  final List<Color> colors;
  final List<double> stops;
  late final ui.Shader shader = ui.Gradient.linear(from, to, colors, stops);
}

class _CtxState {
  _CtxState(Ctx c)
    : fillStyle = c.fillStyle,
      strokeStyle = c.strokeStyle,
      lineWidth = c.lineWidth,
      lineCap = c.lineCap,
      lineJoin = c.lineJoin,
      globalAlpha = c.globalAlpha,
      dash = c._dash,
      fontSize = c.fontSize,
      fontWeight = c.fontWeight,
      fontFamily = c.fontFamily,
      textAlign = c.textAlign,
      textMiddle = c.textMiddle;

  final Object fillStyle;
  final Object strokeStyle;
  final double lineWidth;
  final StrokeCap lineCap;
  final StrokeJoin lineJoin;
  final double globalAlpha;
  final List<double>? dash;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final bool textMiddle;

  void applyTo(Ctx c) {
    c
      ..fillStyle = fillStyle
      ..strokeStyle = strokeStyle
      ..lineWidth = lineWidth
      ..lineCap = lineCap
      ..lineJoin = lineJoin
      ..globalAlpha = globalAlpha
      .._dash = dash
      ..fontSize = fontSize
      ..fontWeight = fontWeight
      ..fontFamily = fontFamily
      ..textAlign = textAlign
      ..textMiddle = textMiddle;
  }
}

/// Just enough of the browser's 2D canvas over a Flutter [Canvas] for the
/// games to draw the way a web canvas does, with the same state rules: alpha
/// is absolute, a path lives until the next beginPath, and save and restore
/// carry the style along with the transform.
class Ctx {
  Ctx(this.canvas);

  final Canvas canvas;

  Object fillStyle = const Color(0xFF000000);
  Object strokeStyle = const Color(0xFF000000);
  double lineWidth = 1;
  StrokeCap lineCap = StrokeCap.butt;
  StrokeJoin lineJoin = StrokeJoin.miter;
  double globalAlpha = 1;
  List<double>? _dash;
  double fontSize = 10;
  FontWeight fontWeight = FontWeight.w400;
  String fontFamily = arcadeMonoFont;
  TextAlign textAlign = TextAlign.left;

  /// The browser's textBaseline 'middle'. Off means 'alphabetic'.
  bool textMiddle = false;

  final List<_CtxState> _stack = [];
  final Path _path = Path();
  bool _hasPoint = false;
  final Paint _fill = Paint()..isAntiAlias = true;
  final Paint _stroke = Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  void save() {
    _stack.add(_CtxState(this));
    canvas.save();
  }

  void restore() {
    if (_stack.isEmpty) return;
    _stack.removeLast().applyTo(this);
    canvas.restore();
  }

  void translate(double x, double y) => canvas.translate(x, y);
  void rotate(double a) => canvas.rotate(a);
  void scale(double x, double y) => canvas.scale(x, y);
  void setLineDash(List<double> dash) => _dash = dash.isEmpty ? null : dash;

  void font(double size, {bool bold = false, String family = arcadeMonoFont}) {
    fontSize = size;
    fontWeight = bold ? FontWeight.w700 : FontWeight.w400;
    fontFamily = family;
  }

  void beginPath() {
    _path.reset();
    _hasPoint = false;
  }

  void moveTo(double x, double y) {
    _path.moveTo(x, y);
    _hasPoint = true;
  }

  void lineTo(double x, double y) {
    // A lineTo on an empty path starts it, as in the browser.
    if (_hasPoint) {
      _path.lineTo(x, y);
    } else {
      _path.moveTo(x, y);
      _hasPoint = true;
    }
  }

  void closePath() => _path.close();

  void quadraticCurveTo(double cx, double cy, double x, double y) {
    if (!_hasPoint) moveTo(cx, cy);
    _path.quadraticBezierTo(cx, cy, x, y);
  }

  void rect(double x, double y, double w, double h) {
    _path.addRect(Rect.fromLTWH(x, y, w, h));
    _hasPoint = true;
  }

  void roundRect(double x, double y, double w, double h, double r) {
    _path.addRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(x, y, w, h), Radius.circular(r)),
    );
    _hasPoint = true;
  }

  void arc(double x, double y, double r, double a0, double a1) {
    final rect = Rect.fromCircle(center: Offset(x, y), radius: r);
    final sweep = a1 - a0;
    if (sweep.abs() >= tau - 1e-9) {
      _path.addOval(rect);
    } else {
      _path.arcTo(rect, a0, sweep, !_hasPoint);
    }
    _hasPoint = true;
  }

  void ellipse(
    double x,
    double y,
    double rx,
    double ry,
    double rot,
    double a0,
    double a1,
  ) {
    final sweep = a1 - a0;
    final full = sweep.abs() >= tau - 1e-9;
    if (rot == 0) {
      final rect = Rect.fromCenter(
        center: Offset(x, y),
        width: rx * 2,
        height: ry * 2,
      );
      if (full) {
        _path.addOval(rect);
      } else {
        _path.arcTo(rect, a0, sweep, !_hasPoint);
      }
    } else {
      final local = Path();
      final rect = Rect.fromCenter(
        center: Offset.zero,
        width: rx * 2,
        height: ry * 2,
      );
      if (full) {
        local.addOval(rect);
      } else {
        local.arcTo(rect, a0, sweep, true);
      }
      final c = math.cos(rot), s = math.sin(rot);
      final m = Float64List.fromList([
        c, s, 0, 0, //
        -s, c, 0, 0, //
        0, 0, 1, 0, //
        x, y, 0, 1, //
      ]);
      _path.addPath(local, Offset.zero, matrix4: m);
    }
    _hasPoint = true;
  }

  Color _alpha(Color c) =>
      globalAlpha >= 1 ? c : c.withValues(alpha: c.a * globalAlpha);

  Paint _style(Paint p, Object style) {
    if (style is CtxGradient) {
      p.shader = style.shader;
      p.color = Color.fromRGBO(0, 0, 0, globalAlpha.clamp(0.0, 1.0));
    } else {
      p.shader = null;
      p.color = _alpha(style as Color);
    }
    return p;
  }

  Paint get _fillPaint => _style(_fill, fillStyle);

  Paint get _strokePaint {
    final p = _style(_stroke, strokeStyle);
    p
      ..strokeWidth = lineWidth
      ..strokeCap = lineCap
      ..strokeJoin = lineJoin;
    return p;
  }

  void fill() => canvas.drawPath(_path, _fillPaint);

  void stroke() {
    final dash = _dash;
    canvas.drawPath(dash == null ? _path : _dashed(_path, dash), _strokePaint);
  }

  void clip() => canvas.clipPath(_path);

  void fillRect(double x, double y, double w, double h) =>
      canvas.drawRect(Rect.fromLTWH(x, y, w, h), _fillPaint);

  void strokeRect(double x, double y, double w, double h) =>
      canvas.drawRect(Rect.fromLTWH(x, y, w, h), _strokePaint);

  TextPainter _text(String text) {
    final color = fillStyle is Color ? _alpha(fillStyle as Color) : K.ink;
    final key =
        '$text|$fontSize|${fontWeight.value}|$fontFamily|${color.toARGB32()}';
    final cached = _textCache[key];
    if (cached != null) return cached;
    if (_textCache.length > 400) {
      for (final old in _textCache.values) {
        old.dispose();
      }
      _textCache.clear();
    }
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    return _textCache[key] = tp;
  }

  void fillText(String text, double x, double y) {
    final tp = _text(text);
    final dx = switch (textAlign) {
      TextAlign.center => x - tp.width / 2,
      _ => x,
    };
    final dy = textMiddle
        ? y - tp.height / 2
        : y - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic);
    tp.paint(canvas, Offset(dx, dy));
  }

  static final Map<String, TextPainter> _textCache = {};

  static Path _dashed(Path source, List<double> dash) {
    final out = Path();
    for (final metric in source.computeMetrics()) {
      var d = 0.0;
      var i = 0;
      var on = true;
      while (d < metric.length) {
        final len = dash[i % dash.length];
        if (on) out.addPath(metric.extractPath(d, d + len), Offset.zero);
        d += len;
        on = !on;
        i++;
      }
    }
    return out;
  }
}

void circle(Ctx c, double x, double y, double r, Object fill) {
  c.beginPath();
  c.arc(x, y, r, 0, tau);
  c.fillStyle = fill;
  c.fill();
}

void ring(Ctx c, double x, double y, double r, Object col, double w) {
  c.beginPath();
  c.arc(x, y, r, 0, tau);
  c.strokeStyle = col;
  c.lineWidth = w;
  c.stroke();
}

void rr(Ctx c, double x, double y, double w, double h, double r, Object fill) {
  c.beginPath();
  c.roundRect(x, y, w, h, r);
  c.fillStyle = fill;
  c.fill();
}

typedef Sprite = void Function(Ctx c, double t);

void put(
  Ctx c,
  String k,
  double x,
  double y,
  double t, [
  double s = 1,
  double rot = 0,
]) {
  c.save();
  c.translate(x, y);
  if (rot != 0) c.rotate(rot);
  if (s != 1) c.scale(s, s);
  sprites[k]!(c, t);
  c.restore();
}

void _poly(Ctx c, List<double> xy) {
  c.beginPath();
  for (var i = 0; i < xy.length; i += 2) {
    c.lineTo(xy[i], xy[i + 1]);
  }
  c.closePath();
  c.fill();
}

final _steel = CtxGradient(
  const Offset(-9, -12),
  const Offset(9, 12),
  const [Color(0xFFEEF0FA), Color(0xFF9AA1BD), Color(0xFFD9DCEF)],
  const [0, .5, 1],
);

/// The HDMI plug that leads Cable Crawl, also drawn faded inside Ghost.
void _plug(Ctx c, double t) {
  c.fillStyle = const Color(0xFF1B1838);
  _poly(c, [-10, -2.5, -7, -5, -7, 5, -10, 2.5]);
  rr(c, -7, -5.5, 9, 11, 2, const Color(0xFF2B2456));
  c.fillStyle = K.blue;
  c.fillRect(-5, -5.5, 1.6, 11);
  c.fillStyle = const Color.fromRGBO(255, 255, 255, .2);
  c.fillRect(-1.5, -4.5, .9, 9);
  c.fillRect(.3, -4.5, .9, 9);
  c.fillStyle = const Color(0xFFD9DCEF);
  _poly(c, [2, -4.5, 7.5, -4.5, 9, -3, 9, 3, 7.5, 4.5, 2, 4.5]);
  c.strokeStyle = const Color(0xFF9AA1BD);
  c.lineWidth = .8;
  c.stroke();
  c.fillStyle = K.night;
  c.fillRect(3.5, -2, 5, 4);
  c.fillStyle = K.gold;
  for (final x in const [4.2, 5.6, 7.0]) {
    c.fillRect(x, -1.2, .8, 2.4);
  }
}

final Map<String, Sprite> sprites = {
  'lagBat': (c, t) {
    final f = math.sin(t * 14) * 5;
    c.fillStyle = K.purple;
    for (final s in const [-1.0, 1.0]) {
      _poly(c, [3 * s, 0, 13 * s, -5 - f, 10 * s, 2, 6 * s, 1]);
    }
    circle(c, 0, 0, 5.5, const Color(0xFF7D3F97));
    circle(c, -2, -1, 1.3, K.gold);
    circle(c, 2, -1, 1.3, K.gold);
    c.fillStyle = const Color.fromRGBO(0, 164, 220, .7);
    c.fillRect(-9 + ((t * 24).floor() % 6), 4, 7, 1.5);
  },
  'gremlin': (c, t) {
    final n = (t * 12).floor();
    for (var i = 0; i < 26; i++) {
      final a = i * 2.39, r = 2 + (i * 7 % 8);
      c.fillStyle = ((i + n) % 3) != 0
          ? const Color(0xFF8B86A8)
          : const Color(0xFFE6E2F7);
      c.fillRect(math.cos(a) * r - 1.5, math.sin(a) * r - 1.5, 3, 3);
    }
    c.fillStyle = K.coral;
    c.fillRect(-4.5, -3, 3, 3);
    c.fillRect(1.5, -3, 3, 3);
  },
  'cable': (c, t) {
    c.lineWidth = 3;
    c.strokeStyle = const Color(0xFF5D559A);
    for (var i = 0; i < 3; i++) {
      c.beginPath();
      c.ellipse(0, 5 - i * 4.5, 12, 4.5, 0, 0, tau);
      c.stroke();
    }
    c.strokeStyle = K.blue;
    c.lineWidth = 1.2;
    c.beginPath();
    c.ellipse(0, -4, 12, 4.5, 0, math.pi, tau);
    c.stroke();
    rr(c, 9, -12, 8, 5, 1.5, const Color(0xFFD9DCEF));
  },
  'banner': (c, t) {
    c.fillStyle = const Color(0xFF4B4380);
    c.fillRect(-1.5, -32, 3, 20);
    rr(c, -17, -13, 34, 26, 5, const Color(0xFF1D1840));
    c.strokeStyle = K.coral;
    c.lineWidth = 1.5;
    c.beginPath();
    c.roundRect(-16.25, -12.25, 32.5, 24.5, 4.5);
    c.stroke();
    c.lineCap = StrokeCap.round;
    c.strokeStyle = K.ink;
    c.lineWidth = 3;
    c.beginPath();
    c.arc(0, 0, 6.5, t * 7, t * 7 + 4.4);
    c.stroke();
  },
  'directPlay': (c, t) {
    c.globalAlpha = .22 + .08 * math.sin(t * 4);
    circle(c, 0, 0, 11, K.mint);
    c.globalAlpha = 1;
    ring(c, 0, 0, 9.5, K.mint, 2);
    c.fillStyle = K.mint;
    _poly(c, [-3, -5.5, 5.5, 0, -3, 5.5]);
  },
  'skipIntro': (c, t) {
    rr(c, -13, -7.5, 26, 15, 7.5, K.gold);
    c.fillStyle = K.night;
    for (final x in const [-6.0, 1.0]) {
      _poly(c, [x, -4.5, x + 5.5, 0, x, 4.5]);
    }
  },
  'popcorn': (c, t) {
    c.fillStyle = const Color(0xFFFFFFFF);
    _poly(c, [-5, -1, 5, -1, 3.8, 7, -3.8, 7]);
    c.fillStyle = K.coral;
    c.fillRect(-2.8, -1, 1.8, 8);
    c.fillRect(1, -1, 1.8, 8);
    circle(c, -3, -3, 2.7, const Color(0xFFFFF3C9));
    circle(c, 1, -4.5, 3, const Color(0xFFFFF3C9));
    circle(c, 4, -2.5, 2.4, const Color(0xFFFFF3C9));
    circle(c, -.5, -2, 1.6, K.gold);
  },
  'plug': _plug,
  'signal': (c, t) {
    c.fillStyle = K.gold;
    c.globalAlpha = .75 + .25 * math.sin(t * 6);
    c.fillRect(-6, 1, 3, 4.5);
    c.fillRect(-1.5, -2.5, 3, 8);
    c.fillRect(3, -6, 3, 11.5);
    c.globalAlpha = 1;
  },
  'staticBlock': (c, t) {
    c.fillStyle = const Color(0xFF262145);
    c.fillRect(-7, -7, 14, 14);
    final n = (t * 20).floor();
    for (var i = 0; i < 14; i++) {
      final h = (i * 73 + n * 31) % 144;
      c.fillStyle = (i + n) % 2 != 0
          ? const Color(0xFF8B86A8)
          : const Color(0xFFE6E2F7);
      c.fillRect(-7 + (h % 12), -7 + ((h ~/ 12) % 12), 2, 2);
    }
  },
  'brick': (c, t) {
    rr(c, -14, -14, 28, 28, 4, const Color(0xFF2F2A55));
    c.strokeStyle = const Color(0xFF4D4688);
    c.lineWidth = 1.5;
    c.strokeRect(-10.5, -10.5, 21, 21);
    c.fillStyle = const Color(0xFF4D4688);
    c.fillRect(-7, 2, 14, 2);
    c.fillRect(-7, 6, 14, 2);
    circle(c, 6.5, -6.5, 2, K.mint);
  },
  'bug': (c, t) {
    c.strokeStyle = K.coral;
    c.lineWidth = 1.2;
    for (var i = -1; i <= 1; i++) {
      final l = math.sin(t * 20 + i) * 1.5;
      c.beginPath();
      c.moveTo(-6.5, i * 3 + l);
      c.lineTo(6.5, i * 3 - l);
      c.stroke();
    }
    circle(c, 0, .5, 4.5, const Color(0xFFD23F5C));
    circle(c, 0, -4, 2.6, const Color(0xFFFF9FB1));
    c.beginPath();
    c.moveTo(-1, -6);
    c.lineTo(-3, -8.5);
    c.moveTo(1, -6);
    c.lineTo(3, -8.5);
    c.stroke();
  },
  'tangle': (c, t) {
    c.strokeStyle = const Color(0xFF9A78E6);
    c.lineWidth = 1.8;
    for (var i = 0; i < 4; i++) {
      final a = t * 3 + i * 1.6;
      c.beginPath();
      c.ellipse(math.cos(a) * 2, math.sin(a) * 2, 6.5, 3, a, 0, tau);
      c.stroke();
    }
    circle(c, -2, -1, 1.4, K.gold);
    circle(c, 2, -1, 1.4, K.gold);
  },
  'ghost': (c, t) {
    c.setLineDash(const [3, 2]);
    ring(c, 0, 0, 8.5, K.mint, 1.5);
    c.setLineDash(const []);
    c.globalAlpha = .55;
    c.save();
    c.scale(.75, .75);
    _plug(c, t);
    c.restore();
    c.globalAlpha = 1;
  },
  'snip': (c, t) {
    c.strokeStyle = K.gold;
    c.lineWidth = 1.8;
    c.beginPath();
    c.arc(-3.5, 4.5, 2.6, 0, tau);
    c.stroke();
    c.beginPath();
    c.arc(3.5, 4.5, 2.6, 0, tau);
    c.stroke();
    c.beginPath();
    c.moveTo(-2, 2.2);
    c.lineTo(4, -8);
    c.moveTo(2, 2.2);
    c.lineTo(-4, -8);
    c.stroke();
  },
  'ticket': (c, t) {
    c.save();
    c.rotate(-.2);
    rr(c, -8, -5, 16, 10, 2, K.gold);
    circle(c, -8, 0, 2.2, K.night);
    circle(c, 8, 0, 2.2, K.night);
    c.fillStyle = const Color.fromRGBO(12, 10, 31, .5);
    c.fillRect(-2, -4, 1, 8);
    c.restore();
  },
  'velvetRope': (c, t) {
    c.strokeStyle = const Color(0xFFD23F5C);
    c.lineWidth = 3;
    c.beginPath();
    c.moveTo(-12, -6);
    c.quadraticCurveTo(0, 4, 12, -6);
    c.stroke();
    for (final x in const [-12.0, 12.0]) {
      c.fillStyle = K.gold;
      c.fillRect(x - 1.5, -8, 3, 17);
      circle(c, x, -9, 2.5, K.gold);
      rr(c, x - 4, 8, 8, 3, 1, K.gold);
    }
  },
  'popcornCart': (c, t) {
    rr(c, -14, -4, 28, 20, 3, K.coral);
    c.fillStyle = const Color(0xFFFFFFFF);
    c.fillRect(-14, 2, 28, 3);
    c.fillStyle = const Color.fromRGBO(191, 230, 255, .25);
    c.fillRect(-12, -22, 24, 18);
    c.strokeStyle = const Color(0xFFD9DCEF);
    c.lineWidth = 1.5;
    c.strokeRect(-12, -22, 24, 18);
    for (var i = 0; i < 9; i++) {
      circle(
        c,
        -9 + (i % 5) * 4.5,
        -8 - (i ~/ 5) * 4 - (i % 2) * 1.5,
        2.4,
        const Color(0xFFFFF3C9),
      );
    }
    rr(c, -15, -26, 30, 5, 2, K.coral);
    circle(c, -8, 19, 3.5, const Color(0xFF2C2756));
    circle(c, 8, 19, 3.5, const Color(0xFF2C2756));
  },
  'rollingReel': (c, t) {
    c.save();
    c.rotate(-t * 10);
    circle(c, 0, 0, 11, const Color(0xFF8A83B5));
    circle(c, 0, 0, 3, const Color(0xFF1D1840));
    for (var i = 0; i < 5; i++) {
      final a = i * tau / 5;
      circle(
        c,
        math.cos(a) * 6.5,
        math.sin(a) * 6.5,
        2.4,
        const Color(0xFF2C2756),
      );
    }
    c.restore();
    ring(c, 0, 0, 11, const Color(0xFFCFD3E6), 1);
  },
  'usher': (c, t) {
    c.globalAlpha = .25 + .1 * math.sin(t * 7);
    c.fillStyle = K.gold;
    _poly(c, [-8, -5, -24, -13, -24, 3]);
    c.globalAlpha = 1;
    rr(c, -6, -10, 12, 20, 3, const Color(0xFF7D3F97));
    c.fillStyle = K.gold;
    c.fillRect(-6, -4, 12, 1.5);
    circle(c, 0, -15, 5, const Color(0xFFE8C9A8));
    rr(c, -6, -21, 12, 4, 1.5, const Color(0xFF7D3F97));
    c.fillStyle = const Color(0xFF2C2756);
    c.fillRect(-5, 10, 4, 9);
    c.fillRect(1, 10, 4, 9);
    rr(c, -10, -7, 5, 4, 1, const Color(0xFFCFD3E6));
  },
  'magnet': (c, t) {
    c.lineWidth = 5;
    c.strokeStyle = K.coral;
    c.beginPath();
    c.moveTo(-6.5, 6);
    c.lineTo(-6.5, 0);
    c.arc(0, 0, 6.5, math.pi, tau);
    c.lineTo(6.5, 6);
    c.stroke();
    c.fillStyle = const Color(0xFFD9DCEF);
    c.fillRect(-9, 5, 5, 4);
    c.fillRect(4, 5, 5, 4);
  },
  'frontRowPass': (c, t) {
    c.strokeStyle = K.purple;
    c.lineWidth = 1.5;
    c.beginPath();
    c.moveTo(-5, -12);
    c.lineTo(0, -5);
    c.lineTo(5, -12);
    c.stroke();
    rr(c, -8, -6, 16, 18, 2.5, K.mint);
    c.fillStyle = K.night;
    c.fillRect(-5, -2, 10, 2);
    c.fillRect(-5, 2, 7, 1.5);
    c.fillRect(-5, 5, 8, 1.5);
  },
  'shelfCat': (c, t) {
    final e = math.sin(t * 3) > .9 ? .5 : 2.0;
    c.fillStyle = const Color(0xFF43367A);
    _poly(c, [-10, -3, -8, -13, -3, -7, 3, -7, 8, -13, 10, -3]);
    c.beginPath();
    c.ellipse(0, 1, 10.5, 9, 0, 0, tau);
    c.fill();
    c.fillStyle = K.gold;
    c.beginPath();
    c.ellipse(-4, 0, 2, e, 0, 0, tau);
    c.moveTo(6, 0);
    c.ellipse(4, 0, 2, e, 0, 0, tau);
    c.fill();
    c.fillStyle = K.coral;
    _poly(c, [-1.5, 4, 1.5, 4, 0, 5.5]);
  },
  'perfect': (c, t) {
    c.save();
    c.rotate(t * .8);
    c.fillStyle = K.gold;
    c.beginPath();
    for (var i = 0; i < 8; i++) {
      final r = i.isOdd ? 4.0 : 12.0, a = i * tau / 8;
      c.lineTo(math.cos(a) * r, math.sin(a) * r);
    }
    c.closePath();
    c.fill();
    c.restore();
    circle(c, 0, 0, 3, const Color(0xFFFFF6D8));
  },
  'deadPixel': (c, t) {
    c.globalAlpha = .3 + .2 * math.sin(t * 8);
    c.fillStyle = K.coral;
    c.fillRect(-8, -8, 16, 16);
    c.globalAlpha = 1;
    c.fillStyle = const Color(0xFF000000);
    c.fillRect(-5, -5, 10, 10);
    c.fillStyle = K.coral;
    c.fillRect(-5, -5, 3, 3);
    c.fillRect(2, 2, 3, 3);
  },
  'hdr': (c, t) {
    rr(c, -14, -8, 28, 16, 4, K.gold);
    c.fillStyle = K.night;
    c.font(9, bold: true);
    c.textAlign = TextAlign.center;
    c.textMiddle = true;
    c.fillText('HDR', 0, .5);
  },
  'bluCase': (c, t) {
    rr(c, -9, -12, 18, 24, 2, K.blue);
    c.fillStyle = const Color(0xFF0B6F96);
    c.fillRect(-9, -12, 3, 24);
    rr(c, -4, -8, 10, 3, 1, const Color.fromRGBO(255, 255, 255, .75));
    c.fillStyle = const Color.fromRGBO(255, 255, 255, .3);
    c.fillRect(-4, -2, 10, 9);
  },
  'steelbook': (c, t) {
    rr(c, -9, -12, 18, 24, 2, _steel);
    c.fillStyle = const Color(0xFF6D7090);
    c.fillRect(-9, -12, 3, 24);
    c.strokeStyle = const Color(0xFF6D7090);
    c.lineWidth = 1;
    c.strokeRect(-3.5, -6.5, 9, 13);
  },
  'boxSet': (c, t) {
    for (final (x, col) in const [
      (-9.0, K.purple),
      (-3.0, K.blue),
      (3.0, K.coral),
    ]) {
      rr(c, x, -11, 6, 22, 1.5, col);
      c.fillStyle = const Color.fromRGBO(255, 255, 255, .5);
      c.fillRect(x + 1.5, -7, 3, 2);
    }
    rr(c, -11, 11, 22, 3, 1, const Color(0xFF3A2F6B));
  },
  'macroblock': (c, t) {
    const k = [K.blue, K.purple, K.coral, Color(0xFF5D559A)];
    for (var i = 0; i < 4; i++) {
      c.fillStyle = k[i];
      c.fillRect(-12 + (i % 2) * 12, -12 + (i ~/ 2) * 12, 12, 12);
    }
    c.fillStyle = const Color.fromRGBO(255, 255, 255, .22);
    c.fillRect(-12, -12, 6, 6);
    c.fillRect(6, 0, 6, 6);
    c.fillStyle = const Color.fromRGBO(0, 0, 0, .2);
    c.fillRect(0, -6, 6, 6);
    c.fillRect(-6, 6, 6, 6);
  },
  'keyframe': (c, t) {
    rr(c, -12, -9, 24, 18, 2, const Color(0xFF2A2152));
    c.strokeStyle = K.gold;
    c.lineWidth = 2;
    c.strokeRect(-11, -8, 22, 16);
    c.fillStyle = K.gold;
    _poly(c, [0, -5, 5, 0, 0, 5, -5, 0]);
  },
  'bufferNet': (c, t) {
    c.strokeStyle = K.mint;
    c.lineWidth = 2;
    c.setLineDash(const [3, 2.5]);
    c.beginPath();
    c.moveTo(-13, 3);
    c.quadraticCurveTo(0, 12, 13, 3);
    c.stroke();
    c.setLineDash(const []);
    rr(c, -7, -8, 14, 5, 2.5, K.ink);
    circle(c, 0, -12, 2.6, const Color(0xFFFFFFFF));
  },
};

/// The score box and the active powerup icons every game draws on top.
void hud(Ctx c, int score, List<String?> icons, double t) {
  c.save();
  c.fillStyle = const Color.fromRGBO(8, 6, 22, .6);
  c.beginPath();
  c.roundRect(8, 7, 92, 21, 6);
  c.fill();
  c.font(13, bold: true);
  c.fillStyle = K.ink;
  c.textMiddle = true;
  c.fillText(score.toString().padLeft(7, '0'), 15, 18);
  var i = 0;
  for (final k in icons) {
    if (k == null) continue;
    put(c, k, arcadeW - 20 - i * 28, 18, t, .85);
    i++;
  }
  c.restore();
}

/// The loading screen's runner standing on [y] at [x]. Frame [f] is one of
/// the 24 steps of a stride.
void runner(
  Ctx c,
  double x,
  double y,
  int f, {
  bool slide = false,
  bool flip = false,
  double s = 1,
  double t = 0,
}) {
  c.save();
  c.translate(x, y);
  c.scale(s, flip ? -s : s);
  // The runner fills a 54 px frame whose ground line sits 47 px down.
  c.translate(-27, -47);
  RunnerPainter(
    strideProgress: (f % 24) / 24,
    slide: slide,
    time: t,
  ).paint(c.canvas, const Size(54, 54));
  c.restore();
}

/// Steps the 24 frame stride from game time and speed, so the legs keep up
/// with the ground.
class StrideClock {
  double? _st;
  double _ph = 0;

  int frame(double t, double speed) {
    final dt = math.max(0.0, t - (_st ?? t));
    _st = t;
    _ph = (_ph + dt * 24 * (1.2 + speed / 650)) % 24;
    return _ph.floor();
  }
}
