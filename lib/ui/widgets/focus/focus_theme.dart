import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

class FocusTheme {
  static const double scale = 1.02;
  static const double defaultBorderRadius = 8.0;
  static const Duration animationDuration = Duration(milliseconds: 150);

  static double get borderWidth => ThemeRegistry.active.borders.focusBorder.width;

  static BoxDecoration focusDecoration({
    required bool isFocused,
    double radius = defaultBorderRadius,
    Color? color,
    Color? backgroundColor,
    bool suppressFocusGlow = false,
  }) {
    final borders = ThemeRegistry.active.borders;
    final effectiveRadius = AppColorScheme.isPixel ? 0.0 : radius;
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: AppRadius.circular(effectiveRadius),
      border: isFocused && color != null
          ? Border.fromBorderSide(
              borders.focusBorder.copyWith(color: color),
            )
          : null,
      boxShadow: isFocused && !suppressFocusGlow && borders.focusGlow.isNotEmpty
          ? borders.focusGlow
          : null,
    );
  }

  static Color resolveColor(BuildContext context, Color? override) =>
      override ?? Theme.of(context).colorScheme.primary;
}
