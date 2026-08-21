import 'package:flutter/material.dart';

import 'package:moonfin_design/moonfin_design.dart';

import '../media_card.dart';

/// The genre name across the middle of its artwork, the way Seerr shows it, in
/// the same lettering and size as the Jellyfin genre row.
class SeerrGenreLabel extends StatelessWidget {
  const SeerrGenreLabel({super.key, required this.name});

  /// Darkens the artwork behind the name. Several duotone pairs, the yellow
  /// and the light green among them, come out bright enough that white
  /// lettering is hard to read straight on top of them. Lighter than the
  /// Jellyfin genre row's veil, since the point of the duotone is its colour.
  static const scrimOpacity = 0.3;

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fontSize = MediaCard.genreLabelFontSize(constraints.maxWidth);
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          color: AppColorScheme.scrim.withValues(alpha: scrimOpacity),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: MediaCard.genreLabelLetterSpacing(fontSize),
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
          ),
        );
      },
    );
  }
}
