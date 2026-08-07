import 'package:flutter/material.dart';

import 'oled_tuning.dart';
import 'theme_spec.dart';

const Color _pureBlack = Color(0xFF000000);

/// Dividers and outlines are lerped toward this instead of toward black.
/// Hairlines that read fine over a dark grey vanish over pure black, so the
/// crush lifts them rather than pushing them down with everything else.
const Color _liftedBorder = Color(0xFF6A6A6A);

/// Returns [base] with its chrome pushed toward pure black by [t], or the
/// identical instance when [t] is [OledTuning.off].
ThemeSpec applyOled(ThemeSpec base, OledTuning t) {
  if (t.isOff) return base;

  // Liquid Glass is translucent panes over a drifting backdrop. Crushing the
  // panes to opaque black erases the effect, so glass themes get a darker
  // backdrop and keep their surfaces.
  final crush = base.isGlass ? t.surfaceCrush * 0.5 : t.surfaceCrush;
  Color k(Color c) => Color.lerp(c, _pureBlack, crush)!;

  final c = base.colors;
  return base.withColors(
    c.copyWith(
      // The background ignores the glass carve-out. Switching those pixels off
      // is the whole point of the mode.
      background: Color.lerp(c.background, _pureBlack, t.surfaceCrush)!,
      surface: base.isGlass ? c.surface : k(c.surface),
      surfaceVariant: k(c.surfaceVariant),
      card: k(c.card),
      inputBackground: k(c.inputBackground),
      buttonNormal: k(c.buttonNormal),
      buttonDisabled: k(c.buttonDisabled),
      inputBorder: Color.lerp(c.inputBorder, _liftedBorder, crush * 0.5)!,
    ),
  );
}
