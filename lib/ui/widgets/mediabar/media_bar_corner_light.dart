import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Shade from the top left corner, where the logo and the new release label
/// sit, for layouts that have no overlay of their own. Logo and label share
/// one light, so a white logo on snow still reads and nothing looks like a
/// box. A plain gradient: no blur, no layer, cheap on a TV box.
class MediaBarCornerLight extends StatelessWidget {
  const MediaBarCornerLight({super.key});

  // Darkest at the corner, then eased out so there's no edge to spot.
  static const _darkness = 0.3;
  static const _reach = 1.5;

  @override
  Widget build(BuildContext context) {
    Color shade(double share) =>
        AppColorScheme.scrim.withValues(alpha: _darkness * share);
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: _reach,
            colors: [shade(1), shade(0.8), shade(0.45), shade(0.15), shade(0)],
            stops: const [0, 0.25, 0.5, 0.75, 1],
          ),
        ),
      ),
    );
  }
}
