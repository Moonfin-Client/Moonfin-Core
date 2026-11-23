import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/preference_constants.dart';

/// The Atlas panel's fill, which an open tab shares to read as joined to it.
const kAtlasPanelColor = Color(0xFF1B1F26);

/// Tells the toolbar buttons under it which top bar style draws them.
class NavButtonStyle extends InheritedWidget {
  const NavButtonStyle({super.key, required this.style, required super.child});

  final TopNavbarStyle style;

  static TopNavbarStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavButtonStyle>()?.style ??
      TopNavbarStyle.classic;

  @override
  bool updateShouldNotify(NavButtonStyle oldWidget) => oldWidget.style != style;
}

/// A Tabline tab: a bare label with an underline. The page on screen gets an
/// accent underline, focus a white one and a brighter, larger label.
class TablineTabLabel extends StatelessWidget {
  const TablineTabLabel({
    super.key,
    required this.label,
    required this.focused,
    this.selected = false,
    this.hovered = false,
    this.badgeCount = 0,
    required this.fontSize,
  });

  final String label;
  final bool focused;
  final bool selected;
  final bool hovered;
  final int badgeCount;
  final double fontSize;

  static const _duration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (focused || selected) {
      color = Colors.white;
    } else if (hovered) {
      color = Colors.white.withValues(alpha: 0.9);
    } else {
      color = Colors.white.withValues(alpha: 0.68);
    }
    final underline = focused
        ? Colors.white
        : selected
        ? AppColorScheme.accent
        : hovered
        ? Colors.white.withValues(alpha: 0.35)
        : Colors.transparent;
    return Center(
      child: AnimatedScale(
        scale: focused ? 1.12 : 1.0,
        duration: _duration,
        curve: Curves.easeOut,
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 7),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: focused
                          ? FontWeight.w700
                          : selected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      shadows: [
                        const Shadow(color: Color(0x99000000), blurRadius: 6),
                        if (focused)
                          const Shadow(
                            color: Color(0x73FFFFFF),
                            blurRadius: 18,
                          ),
                      ],
                    ),
                  ),
                  if (badgeCount > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE53935),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: _duration,
                height: 3,
                decoration: BoxDecoration(
                  color: underline,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The Tabline label size, which follows the classic labels' platform split.
double tablineFontSize({required bool isMobile, required bool isTV}) =>
    isMobile ? 15.0 : (isTV ? 17.0 : 18.0);
