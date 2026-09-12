import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
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
    // Apple idioms get continuous-corner squircles instead of round-rects.
    final pixel = spec.isPixel;
    final apple = AppUiIdiomResolver.current != AppUiIdiom.material;
    final OutlinedBorder buttonShape = pixel
        ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        : apple
            ? AppShapes.squircle(AppShapes.small)
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
        error: c.error ?? JellyfinTokens.colors.error,
        errorContainer: (c.error ?? JellyfinTokens.colors.error).withValues(alpha: 0.2),
        onErrorContainer: c.error ?? JellyfinTokens.colors.error,
        onPrimary: c.onAccent,
        onSurface: c.onSurface,
        scrim: c.scrim,
      ),
      scaffoldBackgroundColor: c.background,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: c.accent.withValues(alpha: 0.40),
        selectionHandleColor: c.accent,
        cursorColor: c.accent,
      ),
      cardTheme: CardThemeData(
        // From the spec so OLED Mode reaches Cards instead of leaving them as
        // grey slabs on a black scaffold.
        color: c.card,
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
    final speed = GetIt.I.isRegistered<UserPreferences>()
        ? GetIt.I<UserPreferences>().get(UserPreferences.pageTransitionSpeed)
        : PageTransitionSpeed.medium;

    // The route owns this controller and there is no public way to retime it,
    // so without this a speed change would only take hold on the next route.
    // No Fade comes through here too. Handing back the child early would skip
    // the fade but leave the route running for Flutter's 450ms default.
    // ignore: invalid_use_of_protected_member
    final controller = route.controller;
    if (controller != null && controller.duration != speed.duration) {
      controller.duration = speed.duration;
      controller.reverseDuration = speed.duration;
      if (controller.isAnimating) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (controller.isAnimating) {
            final remaining = (1.0 - controller.value).clamp(0.0, 1.0);
            if (animation.status == AnimationStatus.forward) {
              controller.animateTo(
                1.0,
                duration: speed.duration * remaining,
                curve: Curves.linear,
              );
            } else if (animation.status == AnimationStatus.reverse) {
              controller.animateBack(
                0.0,
                duration: speed.duration * controller.value,
                curve: Curves.linear,
              );
            }
          }
        });
      }
    }

    final Animation<double> curved;
    final Tween<double> scaleTween;

    switch (speed) {
      case PageTransitionSpeed.off:
        return child;
      case PageTransitionSpeed.fast:
        // Snappy fade (150ms feel) with subtle scale
        curved = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 0.7, curve: Curves.easeOutQuad),
          reverseCurve: const Interval(0.3, 1.0, curve: Curves.easeInQuad),
        );
        scaleTween = Tween<double>(begin: 0.97, end: 1.0);
      case PageTransitionSpeed.medium:
        // Balanced fade (300ms) with moderate scale
        curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        scaleTween = Tween<double>(begin: 0.94, end: 1.0);
      case PageTransitionSpeed.slow:
        // Deliberate cinematic long fade (450ms) with more depth
        curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutSine,
          reverseCurve: Curves.easeInOutSine,
        );
        scaleTween = Tween<double>(begin: 0.90, end: 1.0);
    }

    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: scaleTween.animate(curved),
        child: child,
      ),
    );
  }
}
