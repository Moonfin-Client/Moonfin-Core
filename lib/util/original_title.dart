import 'package:flutter/widgets.dart';

import '../data/models/aggregated_item.dart';
import '../preference/preference_constants.dart';
import 'accent_folding.dart';

/// Returns [item.originalTitle] for item types that can display an original
/// title on detail screens (excluding episodes and seasons, whose headers
/// already stack show + episode/season lines).
String? eligibleOriginalTitle(AggregatedItem item) =>
    (item.type == 'Episode' || item.type == 'Season')
        ? null
        : item.originalTitle;

/// Returns [originalTitle] trimmed when it is non-empty and differs from
/// [title] (ignoring case and diacritics), or `null` otherwise.
String? distinctOriginalTitle(String title, String? originalTitle) {
  final trimmedOriginal = originalTitle?.trim();
  if (trimmedOriginal == null || trimmedOriginal.isEmpty) return null;
  if (foldForSearch(trimmedOriginal) == foldForSearch(title.trim())) {
    return null;
  }
  return trimmedOriginal;
}

/// Formats an inline title (library cards, HUD, and text-only detail headers)
/// according to [mode].
String formatInlineTitle(
  String title,
  String? originalTitle,
  OriginalTitleDisplay mode,
) {
  final distinct = distinctOriginalTitle(title, originalTitle);
  if (distinct == null) return title;
  return switch (mode) {
    OriginalTitleDisplay.off || OriginalTitleDisplay.subtitle => title,
    OriginalTitleDisplay.replace => distinct,
    OriginalTitleDisplay.parentheses => '$title ($distinct)',
  };
}

/// Returns the secondary original-title line to show beneath a detail screen's
/// primary title or logo, or `null` when no secondary line should be shown.
///
/// When [hasLogo] is true, the logo is preserved and the original title is
/// shown underneath (wrapped in parentheses for [OriginalTitleDisplay.parentheses]).
String? detailOriginalTitleSubtitle(
  String title,
  String? originalTitle,
  OriginalTitleDisplay mode, {
  required bool hasLogo,
}) {
  if (mode == OriginalTitleDisplay.off) return null;
  final distinct = distinctOriginalTitle(title, originalTitle);
  if (distinct == null) return null;
  if (hasLogo) {
    return mode == OriginalTitleDisplay.parentheses ? '($distinct)' : distinct;
  }
  return mode == OriginalTitleDisplay.subtitle ? distinct : null;
}

/// Compact single-line subtitle widget for displaying an item's original title
/// underneath a detail screen's title or logo.
class OriginalTitleSubtitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;

  const OriginalTitleSubtitle({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 16,
    this.textAlign,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        height: 1.2,
        shadows: shadows,
      ),
    );
  }
}
