import 'package:flutter/material.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../media_card.dart';
import 'book_format_badge.dart';

/// Library card with the book/audiobook format identity: books render as
/// 2:3 covers with a reading-progress bar, audiobooks as square covers with
/// a remaining-time chip. Thin wrapper over [MediaCard] so focus visuals,
/// theming, and touch behavior stay identical to the rest of the app.
class BookCard extends StatelessWidget {
  final AggregatedItem item;
  final bool isAudiobook;
  final bool isComic;
  final String? subtitle;
  final String? imageUrl;
  final double width;

  /// Time left (or total runtime when unstarted) shown on audiobook cards.
  final Duration? remaining;
  final bool remainingIsTotal;

  /// Show the format glyph; enable in mixed rows, skip in single-format rows.
  final bool showFormatBadge;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool? externalIsFocused;

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
