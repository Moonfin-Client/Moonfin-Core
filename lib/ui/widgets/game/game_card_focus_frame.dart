import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../focus/focus_theme.dart';

/// Games-scoped focus border and glow matching Moonfin's [MediaCard] styling.
///
/// Keeping this helper within the games feature avoids coupling retro-game
/// navigation to the private implementation of the media library browser.
class GameCardFocusFrame extends StatelessWidget {
  const GameCardFocusFrame({
    super.key,
    required this.active,
    required this.child,
    this.focusColor,
    this.suppressFocusGlow = false,
  });

  final bool active;
  final Widget child;
  final Color? focusColor;
  final bool suppressFocusGlow;

  @override
  Widget build(BuildContext context) {
    final borders = ThemeRegistry.active.borders;
    final effectiveFocusColor = FocusTheme.resolveColor(context, focusColor);
    final showGlow =
        active && !suppressFocusGlow && borders.focusGlow.isNotEmpty;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        if (showGlow)
          Positioned(
            top: -3.5,
            bottom: -3.5,
            left: -3.5,
            right: -3.5,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: borders.cardRadius + AppRadius.circular(3.5),
                  boxShadow: borders.focusGlow,
                ),
              ),
            ),
          ),
        child,
        if (active)
          Positioned(
            top: -3.5,
            bottom: -3.5,
            left: -3.5,
            right: -3.5,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: borders.cardRadius + AppRadius.circular(3.5),
                  border: Border.fromBorderSide(
                    borders.focusBorder.copyWith(
                      color: effectiveFocusColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
