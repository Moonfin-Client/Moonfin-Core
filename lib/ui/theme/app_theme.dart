import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/idiom/app_ui_idiom.dart';

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
    // Pixel themes use blocky zero-radius chrome; other themes stay rounded.
    final pixel = spec.isPixel;
    final buttonShape = pixel
        ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        : JellyfinTokens.shapes.smallShape;
    final inputRadius =
        pixel ? BorderRadius.zero : JellyfinTokens.shapes.smallRadius;
    return ThemeData(
      useMaterial3: true,
      platform: switch (AppUiIdiomResolver.current) {
        AppUiIdiom.iosMobile => TargetPlatform.iOS,
        AppUiIdiom.macDesktop => TargetPlatform.macOS,
        AppUiIdiom.material => TargetPlatform.android,
        AppUiIdiom.tvosLeanback => null,
      },
      brightness: Brightness.dark,
      fontFamily: spec.fontFamily,
      // The pixel font (Press Start 2P) is Latin-only; fall back to NotoSans so
      // CJK/Arabic/etc. glyphs still render.
      fontFamilyFallback: pixel ? const ['NotoSans'] : null,
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
        shape: buttonShape,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        elevation: 0,
      ),
      pageTransitionsTheme: AppUiIdiomResolver.current == AppUiIdiom.iosMobile
          ? _cupertinoTransitions
          : _fadeScaleTransitions,
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
          shape: buttonShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.onSurface,
          side: BorderSide(color: c.inputBorder),
          shape: buttonShape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.inputBackground,
        border: OutlineInputBorder(
          borderRadius: inputRadius,
          borderSide: BorderSide(color: c.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: inputRadius,
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
        shape: pixel ? buttonShape : JellyfinTokens.shapes.extraLargeShape,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: spec.isGlass ? const Color(0xD90E1117) : c.surface,
        surfaceTintColor: spec.isGlass ? Colors.transparent : null,
        shape: spec.isGlass
            ? RoundedRectangleBorder(
                borderRadius: AppRadius.circular(20),
                side: const BorderSide(color: Color(0x33FFFFFF), width: 1),
              )
            : pixel
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: c.surfaceVariant, width: 2),
                  )
                : JellyfinTokens.shapes.largeShape,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return c.onAccent;
          }
          return null;
        }),
      ),
    );
  }

  static final darkTheme = buildTheme(ThemeRegistry.resolveById(ThemeRegistry.moonfinId));

  static const _fadeScaleTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: _FadeScalePageTransitionsBuilder(),
      TargetPlatform.fuchsia: _FadeScalePageTransitionsBuilder(),
      TargetPlatform.linux: _FadeScalePageTransitionsBuilder(),
      TargetPlatform.macOS: _FadeScalePageTransitionsBuilder(),
      TargetPlatform.windows: _FadeScalePageTransitionsBuilder(),
      TargetPlatform.iOS: _FadeScalePageTransitionsBuilder(),
    },
  );

  static const _cupertinoTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
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
