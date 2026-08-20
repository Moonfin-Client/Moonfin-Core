import 'package:flutter/material.dart';

import 'package:moonfin_design/moonfin_design.dart';

import '../media_card.dart';

/// The genre name across the middle of its artwork, the way Seerr shows it, in
/// the same lettering and size as the Jellyfin genre row.
class SeerrGenreLabel extends StatelessWidget {
  const SeerrGenreLabel({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fontSize = MediaCard.genreLabelFontSize(constraints.maxWidth);
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
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
