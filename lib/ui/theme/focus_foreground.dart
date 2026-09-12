import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Text and icon colour that stays readable on top of a solid focus fill.
///
/// Read off the fill rather than taking a theme's own onButtonFocused, which
/// is picked to sit on the surface and not on this highlight. Moonfin pairs a
/// white fill with the accent and Neon Pulse pairs cyan with white, either of
/// which leaves the label barely there once the fill is behind it.
Color readableOnFocusFill(Color fill) =>
    ThemeData.estimateBrightnessForColor(fill) == Brightness.dark
    ? AppColorScheme.onSurface
    : AppColors.black;
