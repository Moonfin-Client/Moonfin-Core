import 'package:flutter/material.dart';

import 'package:moonfin_design/moonfin_design.dart';

/// The genre name across the middle of its artwork, the way Seerr shows it, in
/// the same lettering as the Jellyfin genre row so the two rows match. It darkens
/// the image behind the text: some duotone backdrops come out light enough that
/// white text would be hard to read on them.
class SeerrGenreLabel extends StatelessWidget {
  const SeerrGenreLabel({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorScheme.scrim.withValues(alpha: 0.3),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          name.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            color: AppColorScheme.onSurface.withValues(alpha: 0.9),
            shadows: [Shadow(blurRadius: 4, color: AppColorScheme.scrim)],
          ),
        ),
      ),
    );
  }
}
