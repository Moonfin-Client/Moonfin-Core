import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'glass_focus_halo.dart';

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

  /// A focused row filled solid in the theme's text color, with the theme's
  /// focus border and glow on top.
  static BoxDecoration solidFocusDecoration({
    required bool active,
    double radius = 10,
  }) {
    final borders = ThemeRegistry.active.borders;
    return BoxDecoration(
      color: active ? AppColorScheme.onSurface : null,
      borderRadius: AppRadius.circular(radius),
      // The border is always there so the content doesn't shift by a pixel
      // when focus arrives.
      border: Border.fromBorderSide(
        active
            ? borders.focusBorder.copyWith(width: 1)
            : const BorderSide(color: Colors.transparent, width: 1),
      ),
      boxShadow: active ? borders.focusGlow : null,
    );
  }

  /// Text and icon color on a [solidFocusDecoration] fill.
  static Color get solidFocusForeground =>
      ThemeData.estimateBrightnessForColor(AppColorScheme.onSurface) ==
          Brightness.light
      ? AppColors.black.withValues(alpha: 0.87)
      : AppColors.white;

  static Color resolveColor(BuildContext context, Color? override) =>
      override ??
      (GlassFocusHalo.appleStyleActive
          ? Colors.white
          : Theme.of(context).colorScheme.primary);
}
