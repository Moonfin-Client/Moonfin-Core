import 'package:flutter/material.dart';

/// How hard OLED Mode pushes chrome toward pure black and artwork toward
/// saturation. Layered over whichever theme is active rather than baked into
/// each one, so downloaded and plugin themes get it too.
///
/// The presets are `const`, so Dart canonicalizes them and [identical] is a
/// valid equality check wherever these are compared.
@immutable
class OledTuning {
  /// 0..1 lerp of chrome colours toward `#000000`.
  final double surfaceCrush;

  /// Saturation multiplier for artwork. 1.0 leaves images untouched.
  ///
  /// Capped at 1.25 by the presets: [ColorFilter.matrix] is linear, so values
  /// beyond that clip already-saturated posters and drift skin tones orange.
  /// Real (non-linear) vibrance would need a fragment shader.
  final double imageSaturation;

  /// Contrast multiplier for artwork, pivoting around mid grey.
  final double imageContrast;

  const OledTuning(
    this.surfaceCrush,
    this.imageSaturation,
    this.imageContrast,
  );

  static const off = OledTuning(0.0, 1.00, 1.00);

  /// Stops short of a full crush so near-black gradation survives on panels
  /// with poor low-end response.
  static const subtle = OledTuning(0.80, 1.10, 1.03);

  static const vivid = OledTuning(1.00, 1.25, 1.08);

  bool get isOff => identical(this, off);
}
