import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The artwork half of OLED Mode, a saturation and contrast filter applied
/// wherever posters and backdrops are painted.
///
/// The filter lives in a [ValueNotifier] because the image widgets depend on
/// nothing that changes when the preference flips. Without a listenable, const
/// images inside already-built routes would keep painting the old filter until
/// something else rebuilt them.
class Vibrance {
  const Vibrance._();

  static final ValueNotifier<ColorFilter?> filter =
      ValueNotifier<ColorFilter?>(null);

  static void apply(OledTuning tuning) {
    filter.value = tuning.isOff
        ? null
        : ColorFilter.matrix(saturationContrastMatrix(tuning));
  }

  /// Wraps [child] in the active filter, or returns it untouched when OLED
  /// Mode is off.
  ///
  /// [ColorFiltered] forces a saveLayer, so the off path returns the child
  /// directly rather than installing an identity filter. Users who never
  /// enable the mode pay for one extra element and nothing more.
  static Widget wrap(Widget child) {
    return ValueListenableBuilder<ColorFilter?>(
      valueListenable: filter,
      builder: (context, value, builtChild) {
        if (value == null) return builtChild!;
        return ColorFiltered(colorFilter: value, child: builtChild);
      },
      child: child,
    );
  }

  // Rec.709 luma weights, so saturating leaves perceived brightness alone.
  static const double _rCoeff = 0.2126;
  static const double _gCoeff = 0.7152;
  static const double _bCoeff = 0.0722;

  /// A luminance-preserving saturation matrix scaled by contrast, as the flat
  /// 5x4 row-major list [ColorFilter.matrix] takes.
  ///
  /// Saturation alone is `lerp(luma(px), px, s)`. Contrast pivots around mid
  /// grey: `out = c * (in - 0.5) + 0.5`. Because contrast is a uniform scale
  /// plus an offset, the two compose by multiplying the saturation 3x3 by `c`
  /// and putting `(0.5 - 0.5 * c)` in the translation column, which
  /// [ColorFilter.matrix] expects in 0-255 space rather than 0-1.
  ///
  /// Exposed because a built [ColorFilter] won't hand its matrix back, and the
  /// maths is worth asserting.
  @visibleForTesting
  static List<double> saturationContrastMatrix(OledTuning t) {
    final s = t.imageSaturation;
    final c = t.imageContrast;
    final inv = 1 - s;

    final rr = (_rCoeff * inv + s) * c;
    final rg = (_gCoeff * inv) * c;
    final rb = (_bCoeff * inv) * c;
    final gr = (_rCoeff * inv) * c;
    final gg = (_gCoeff * inv + s) * c;
    final gb = (_bCoeff * inv) * c;
    final br = (_rCoeff * inv) * c;
    final bg = (_gCoeff * inv) * c;
    final bb = (_bCoeff * inv + s) * c;
    final t0 = (0.5 - 0.5 * c) * 255.0;

    return <double>[
      rr, rg, rb, 0, t0, //
      gr, gg, gb, 0, t0, //
      br, bg, bb, 0, t0, //
      0, 0, 0, 1, 0, //
    ];
  }
}
