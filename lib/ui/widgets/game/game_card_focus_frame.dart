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

    // The glow and border slots are always present, so [child] keeps the same
    // index in this Stack. Inserting the glow ahead of it only while active
    // would shift the child's slot on every focus change; Flutter cannot match
    // the unkeyed child across that shift, so it would tear down and rebuild
    // the card's whole subtree -- dropping already-decoded artwork and showing
    // the placeholder until it reloads, which reads as a flicker.
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        _FrameLayer(
          child: showGlow
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: borders.cardRadius + AppRadius.circular(3.5),
                    boxShadow: borders.focusGlow,
                  ),
                )
              : null,
        ),
        child,
        _FrameLayer(
          child: active
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: borders.cardRadius + AppRadius.circular(3.5),
                    border: Border.fromBorderSide(
                      borders.focusBorder.copyWith(
                        color: effectiveFocusColor,
                        width: 3,
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ],
    );
  }
}

/// A fixed Stack slot outset around the card; empty when [child] is null.
class _FrameLayer extends StatelessWidget {
  const _FrameLayer({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -3.5,
      bottom: -3.5,
      left: -3.5,
      right: -3.5,
      child: IgnorePointer(child: child ?? const SizedBox.shrink()),
    );
  }
}
