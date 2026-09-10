import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/glass_capability.dart';
import '../../../util/platform_detection.dart';
import 'glass_press_scale.dart';

/// tvOS-style focus and hover treatment: a gentle scale pop plus a white
/// hairline ring and soft glow, and a grow while a pointer is down. It only
/// uses borders and BoxShadows, never blur filters, so it's safe on every
/// tier including Android TV sheen.
///
/// Under non-glass looks the ring falls back to the accent color so existing
/// themes keep their identity.
class GlassFocusHalo extends StatelessWidget {
  const GlassFocusHalo({
    super.key,
    required this.focused,
    required this.child,
    this.borderRadius,
    this.scale = 1.05,
    this.pressGrowth = 17.0,
    this.padding,
    this.ringColor,
    this.backgroundColor,
    this.duration = const Duration(milliseconds: 120),
  });

  final bool focused;
  final Widget child;
  final BorderRadius? borderRadius;

  /// Scale applied while focused. 1.0 disables the pop, for toolbar icons and
  /// anything else that shouldn't grow.
  final double scale;

  /// Logical pixels the longest side gains while a pointer is down. 0
  /// disables it, for surfaces that carry their own press response.
  final double pressGrowth;
  final EdgeInsetsGeometry? padding;
  final Color? ringColor;
  final Color? backgroundColor;
  final Duration duration;

  /// Whether the tvOS white-halo language applies right now: the glass look
  /// is active and the UI is focus/hover driven (any TV, or desktop).
  static bool get appleStyleActive =>
      GlassCapability.glassLookActive && !PlatformDetection.useMobileUi;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);
    final apple = appleStyleActive;
    final ring = ringColor ?? (apple ? Colors.white : AppColorScheme.accent);
    final bg = backgroundColor ??
        (apple
            ? Colors.white.withValues(alpha: 0.10)
            : AppColorScheme.accent.withValues(alpha: 0.18));

    final content = AnimatedContainer(
      duration: duration,
      curve: Curves.easeOut,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: focused ? ring : Colors.transparent,
          width: 2,
        ),
        color: focused ? bg : Colors.transparent,
        boxShadow: focused && apple
            ? const [
                BoxShadow(
                  color: Color(0x40FFFFFF),
                  blurRadius: 14,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0x59000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: child,
    );

    final pressed = GlassPressScale(growth: pressGrowth, child: content);
    if (scale == 1.0) return pressed;
    return AnimatedScale(
      scale: focused ? scale : 1.0,
      duration: duration,
      curve: Curves.easeOutCubic,
      child: pressed,
    );
  }
}
