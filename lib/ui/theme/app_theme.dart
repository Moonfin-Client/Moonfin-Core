import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

class AppTheme {
  const AppTheme._();

  static TextTheme _buildTextTheme(ThemeSpec spec) {
    final c = spec.colors;
    final base = ThemeData(
      brightness: Brightness.dark,
      fontFamily: spec.fontFamily,
    ).textTheme;
    if (spec.textGlow.isEmpty) {
      return base;
    }

    final themedShadows = spec.textGlow;

    TextStyle? neonDisplay(TextStyle? style) {
      if (style == null) return null;
      return style.copyWith(
        color: c.accent,
        shadows: themedShadows,
        letterSpacing: (style.letterSpacing ?? 0) + 0.4,
        fontWeight: FontWeight.bold,
      );
    }

    TextStyle? neonBody(TextStyle? style) {
      if (style == null) return null;
      return style.copyWith(
        fontFamily: 'NeonPulseBody',
        color: c.onSurface,
        letterSpacing: 0.6,
      );
    }

    return base.copyWith(
      displayLarge: neonDisplay(base.displayLarge),
      displayMedium: neonDisplay(base.displayMedium),
      displaySmall: neonDisplay(base.displaySmall),
      headlineLarge: neonDisplay(base.headlineLarge),
      headlineMedium: neonDisplay(base.headlineMedium),
      headlineSmall: neonDisplay(base.headlineSmall),
      titleLarge: neonDisplay(base.titleLarge),
      titleMedium: neonDisplay(base.titleMedium),
      titleSmall: neonDisplay(base.titleSmall),
      bodyLarge: neonBody(base.bodyLarge),
      bodyMedium: neonBody(base.bodyMedium),
      bodySmall: neonBody(base.bodySmall),
      labelLarge: neonBody(base.labelLarge)?.copyWith(color: c.accent),
      labelMedium: neonBody(base.labelMedium),
      labelSmall: neonBody(base.labelSmall),
    );
  }

  static ThemeData buildTheme(ThemeSpec spec) {
    final c = spec.colors;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: spec.fontFamily,
      colorScheme: ColorScheme.dark(
        primary: c.accent,
        secondary: JellyfinTokens.colors.secondary,
        surface: c.surface,
        surfaceContainerHighest: c.surfaceVariant,
        error: JellyfinTokens.colors.error,
        onPrimary: c.onAccent,
        onSurface: c.onSurface,
        scrim: c.scrim,
      ),
      scaffoldBackgroundColor: c.background,
      cardTheme: CardThemeData(
        color: JellyfinTokens.colors.card,
        shape: JellyfinTokens.shapes.smallShape,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        elevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: _FadeScalePageTransitionsBuilder(),
          TargetPlatform.fuchsia: _FadeScalePageTransitionsBuilder(),
          TargetPlatform.linux: _FadeScalePageTransitionsBuilder(),
          TargetPlatform.macOS: _FadeScalePageTransitionsBuilder(),
          TargetPlatform.windows: _FadeScalePageTransitionsBuilder(),
          TargetPlatform.iOS: _FadeScalePageTransitionsBuilder(),
        },
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.surface,
        selectedItemColor: c.accent,
        unselectedItemColor: JellyfinTokens.colors.textSecondary,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.buttonNormal,
          foregroundColor: c.onButtonNormal,
          disabledBackgroundColor: c.buttonDisabled,
          disabledForegroundColor: c.onButtonDisabled,
          shape: JellyfinTokens.shapes.smallShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.onSurface,
          side: BorderSide(color: c.inputBorder),
          shape: JellyfinTokens.shapes.smallShape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.inputBackground,
        border: OutlineInputBorder(
          borderRadius: JellyfinTokens.shapes.smallRadius,
          borderSide: BorderSide(color: c.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: JellyfinTokens.shapes.smallRadius,
          borderSide: BorderSide(color: c.inputBorderFocused, width: 2),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.rangeProgress,
        inactiveTrackColor: c.rangeTrack,
        thumbColor: c.rangeThumb,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.rangeProgress,
        linearTrackColor: c.rangeTrack,
      ),
      textTheme: _buildTextTheme(spec),
      chipTheme: ChipThemeData(
        backgroundColor: c.buttonNormal,
        shape: JellyfinTokens.shapes.extraLargeShape,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        shape: JellyfinTokens.shapes.largeShape,
      ),
    );
  }

  static final darkTheme = buildTheme(ThemeRegistry.resolveById(ThemeRegistry.moonfinId));
}

class _FadeScalePageTransitionsBuilder extends PageTransitionsBuilder {
  const _FadeScalePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.97, end: 1.0).animate(curved),
        child: child,
      ),
    );
  }
}
