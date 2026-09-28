import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/idiom/glass_capability.dart';
import '../../../util/overlay_color_palette.dart';
import '../adaptive/adaptive_glass.dart';

/// Colours and surface treatment for the bottom navbar, taken from the active
/// theme so custom and store themes work without knowing about the bar.
class BottomNavTheme {
  /// Opaque fill for the flat treatment, and the fallback under glass.
  final Color surface;

  /// Foreground for labels and icons, checked for contrast against [surface].
  final Color onBar;
  final Color accent;
  final bool glass;
  final bool pixel;

  /// Border and glow for themes that ask for a see-through navbar (Neon
  /// Pulse). Drawn over whichever surface was picked.
  final Color? neonEdge;

  /// The theme's own nav border, or a faint line where it has none.
  final BorderSide hairline;
  final TextStyle labelStyle;

  const BottomNavTheme({
    required this.surface,
    required this.onBar,
    required this.accent,
    required this.glass,
    required this.pixel,
    required this.neonEdge,
    required this.hairline,
    required this.labelStyle,
  });

  /// [preview] keeps backdrop blurs out of the setup wizard's scaled cards.
  factory BottomNavTheme.resolve(BuildContext context, {bool preview = false}) {
    final spec = ThemeRegistry.active;
    final accent = AppColorScheme.accent;
    final pixel = AppColorScheme.isPixel;
    final glass = !pixel && !preview && GlassCapability.glassLookActive;
    final transparent = spec.transparentNavbarSurface;

    final Color surface;
    if (transparent) {
      // A see-through bar over artwork can't be read, so it keeps the theme's
      // own background and lets the edge carry the look.
      surface = Color.alphaBlend(
        AppColorScheme.background.withValues(alpha: 0.82),
        AppColorScheme.surface,
      );
    } else {
      final prefs = GetIt.instance<UserPreferences>();
      final opacity =
          (prefs.get(UserPreferences.navbarOpacity) / 100.0).clamp(0.0, 1.0);
      // The navbar colour and opacity still count, with a floor so the bar
      // never fades into the posters under it.
      surface = Color.alphaBlend(
        OverlayColorPalette.resolveColor(prefs.get(UserPreferences.navbarColor))
            .withValues(alpha: 0.78 + 0.19 * opacity),
        AppColorScheme.surface,
      );
    }

    final onBar = _readableOn(surface, AppColorScheme.onSurface);
    final base = Theme.of(context).textTheme.labelSmall ?? const TextStyle();

    return BottomNavTheme(
      surface: surface,
      onBar: onBar,
      accent: accent,
      glass: glass,
      pixel: pixel,
      neonEdge: transparent && !AppColorScheme.isGlass ? accent : null,
      hairline: spec.borders.navBorder ??
          BorderSide(color: onBar.withValues(alpha: 0.08)),
      labelStyle: base.copyWith(
        fontSize: 11,
        height: 1.0,
        letterSpacing: 0.1,
        decoration: TextDecoration.none,
      ),
    );
  }

  // A custom light theme can hand over an onSurface that disappears on the
  // navbar colour the user picked. Fall back to plain black or white then.
  static Color _readableOn(Color background, Color preferred) {
    if (_contrast(preferred, background) >= 3) return preferred;
    return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  static double _contrast(Color a, Color b) {
    final la = a.computeLuminance();
    final lb = b.computeLuminance();
    final hi = la > lb ? la : lb;
    final lo = la > lb ? lb : la;
    return (hi + 0.05) / (lo + 0.05);
  }

  Color? _slotColor(int slot) => AppColorScheme.navColorForSlot(slot);

  /// Colour of the indicator and Strip's tick.
  Color indicatorColor(int slot) => _slotColor(slot) ?? accent;

  /// [accentTinted] lifts the active tab toward the accent, as the floating
  /// styles do. Strip keeps it neutral and lets the tick carry the accent.
  Color activeColor(int slot, {bool accentTinted = true}) {
    final cycled = _slotColor(slot);
    if (cycled != null) return Color.lerp(cycled, onBar, 0.3)!;
    return accentTinted ? Color.lerp(accent, onBar, 0.35)! : onBar;
  }

  Color inactiveColor(int slot, {double alpha = 0.62}) =>
      _slotColor(slot)?.withValues(alpha: 0.75) ??
      onBar.withValues(alpha: alpha);

  TextStyle label({required bool active, required Color color}) =>
      labelStyle.copyWith(
        color: color,
        fontWeight: active ? FontWeight.w700 : FontWeight.w600,
      );
}

/// The pane every bar piece sits on: pixel border, glass or a flat fill,
/// with the neon edge and a drop shadow on top.
class BottomNavSurface extends StatelessWidget {
  final BottomNavTheme theme;
  final double radius;
  final Widget child;

  /// Only the top corners round, for panes attached to the bottom edge.
  final bool topOnly;
  final bool shadow;

  const BottomNavSurface({
    super.key,
    required this.theme,
    required this.radius,
    required this.child,
    this.topOnly = false,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final r = Radius.circular(radius);
    final borderRadius = theme.pixel
        ? BorderRadius.zero
        : (topOnly
            ? BorderRadius.only(topLeft: r, topRight: r)
            : BorderRadius.all(r));

    // Tabs and sheet rows paint their ink on the nearest Material, which has
    // to be above the pane or the pane hides it.
    final inked = Material(type: MaterialType.transparency, child: child);
    final Widget pane;
    if (theme.pixel) {
      pane = GlassSurface(
        cornerRadius: 0,
        fallbackColor: theme.surface,
        child: inked,
      );
    } else if (theme.glass) {
      final glass = adaptiveGlass(
        context: context,
        cornerRadius: topOnly ? 0 : radius,
        blur: 28,
        tint: theme.accent.withValues(alpha: 0.05),
        fallbackColor: theme.surface,
        child: inked,
      );
      // Glass only rounds all four corners, so a pane on the bottom edge is
      // clipped to round just the top two.
      pane = topOnly
          ? ClipRRect(borderRadius: borderRadius, child: glass)
          : glass;
    } else {
      pane = Material(
        color: theme.surface,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: child,
      );
    }

    final edge = theme.neonEdge;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          if (shadow && !theme.pixel)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 24,
              spreadRadius: -8,
              offset: const Offset(0, 10),
            ),
          if (edge != null)
            BoxShadow(color: edge.withValues(alpha: 0.25), blurRadius: 18),
        ],
      ),
      position: DecorationPosition.background,
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: theme.pixel
              ? null
              : Border.fromBorderSide(
                  edge == null
                      ? theme.hairline
                      : BorderSide(color: edge.withValues(alpha: 0.55)),
                ),
        ),
        child: pane,
      ),
    );
  }
}
