import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';

/// The MOVIE / SERIES badge that sits on the corner of Seerr artwork.
///
/// Shared so the discover rows and the requests grid cannot drift apart on
/// wording or size.
class SeerrMediaTypeBadge extends StatelessWidget {
  /// Seerr's own media type string, `movie` or `tv`. Anything else reads as a
  /// series, matching what the API sends for shows.
  final String? mediaType;

  /// Appended after a separator, for the requests grid's `FILM · 4K`.
  final String? suffix;

  /// Multiplier for platforms that scale their chrome, 1.0 everywhere else.
  final double scale;

  const SeerrMediaTypeBadge({
    super.key,
    required this.mediaType,
    this.suffix,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isMovie = mediaType?.toLowerCase() == 'movie';
    final color = isMovie
        ? AppColorScheme.mediaTypeBadgeMovie
        : AppColorScheme.mediaTypeBadgeShow;
    final label = (isMovie ? l10n.movie : l10n.series).toUpperCase();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.85),
        borderRadius: AppRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 6 * scale,
          vertical: 2 * scale,
        ),
        child: Text(
          suffix != null ? '$label · $suffix' : label,
          style: TextStyle(
            color: AppColorScheme.onBadge,
            fontSize: 10 * scale,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}
