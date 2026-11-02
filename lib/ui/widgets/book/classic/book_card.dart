import 'package:flutter/material.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../l10n/app_localizations.dart';
import '../../media_card.dart';
import '../book_format_badge.dart' show formatBookDuration;
import 'book_format_badge.dart';

/// A title on a Classic shelf. Books are 2:3 covers with a progress bar and
/// audiobooks are square covers with the time left. Built on [MediaCard] for
/// its focus, theming and touch handling.
class BookCard extends StatelessWidget {
  final AggregatedItem item;
  final bool isAudiobook;
  final bool isComic;
  final String? subtitle;
  final String? imageUrl;
  final double width;

  /// Time left on an audiobook, or its whole runtime before it's started.
  final Duration? remaining;
  final bool remainingIsTotal;

  /// Shows the format glyph, for rows that mix formats.
  final bool showFormatBadge;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool? externalIsFocused;
  final bool cardFocusExpansion;

  const BookCard({
    super.key,
    required this.item,
    required this.isAudiobook,
    this.isComic = false,
    this.subtitle,
    this.imageUrl,
    this.width = 132,
    this.remaining,
    this.remainingIsTotal = false,
    this.showFormatBadge = true,
    this.onTap,
    this.onLongPress,
    this.externalIsFocused,
    this.cardFocusExpansion = true,
  });

  bool get _isPoster => !isAudiobook;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final type = item.type;
    final isPerson = type == 'MusicArtist' || type == 'Person';

    String? chipLabel;
    if (isAudiobook && remaining != null) {
      final label = formatBookDuration(remaining!);
      chipLabel = remainingIsTotal ? label : l10n.bookTimeLeft(label);
    }

    return MediaCard(
      width: width,
      aspectRatio: isPerson ? 1 : (_isPoster ? 2 / 3 : 1),
      title: item.name,
      subtitle: subtitle,
      imageUrl: imageUrl,
      itemType: type,
      isFavorite: item.isFavorite,
      isPlayed: item.isPlayed,
      playedPercentage: _isPoster ? item.playedPercentage : null,
      externalIsFocused: externalIsFocused,
      cardFocusExpansion: cardFocusExpansion,
      onTap: onTap,
      onLongPress: onLongPress,
      overlayOccupiesTopLeft: showFormatBadge && !isPerson,
      imageOverlays: [
        if (showFormatBadge && !isPerson)
          Positioned(
            top: 6,
            left: 6,
            child: BookFormatBadge(
              isAudiobook: isAudiobook,
              isComic: isComic,
            ),
          ),
        if (chipLabel != null)
          Positioned(
            right: 6,
            bottom: 6,
            child: BookProgressChip(label: chipLabel),
          ),
      ],
    );
  }
}
