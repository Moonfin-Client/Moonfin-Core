import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../bounded_network_image.dart';
import '../media_card.dart';
import 'book_format_badge.dart';

/// A title in the book library grid. Thin wrapper over [MediaCard] so focus
/// visuals, theming, and touch behavior stay identical to the rest of the app.
/// Books and comics are 2:3 covers with a reading-progress bar. Audiobooks
/// keep the same frame, the square art on top and the time under it, so a
/// grid mixing the two keeps its rows even.
class BookCard extends StatelessWidget {
  final AggregatedItem item;
  final bool isAudiobook;
  final String? subtitle;
  final String? imageUrl;

  /// Time left in an audiobook, or its whole runtime when unstarted.
  final Duration? remaining;
  final bool showComicBadge;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final VoidCallback? onFocus;
  final KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent;
  final bool cardFocusExpansion;

  const BookCard({
    super.key,
    required this.item,
    required this.isAudiobook,
    this.subtitle,
    this.imageUrl,
    this.remaining,
    this.showComicBadge = false,
    this.onTap,
    this.onLongPress,
    this.focusNode,
    this.onFocus,
    this.onKeyEvent,
    this.cardFocusExpansion = true,
  });

  @override
  Widget build(BuildContext context) {
    return MediaCard(
      width: double.infinity,
      aspectRatio: 2 / 3,
      title: item.name,
      subtitle: subtitle,
      // A square audiobook cover cropped to 2:3 would lose its edges, so it's
      // drawn as an overlay instead.
      imageUrl: isAudiobook ? null : imageUrl,
      itemType: item.type,
      isFavorite: item.isFavorite,
      isPlayed: item.isPlayed,
      playedPercentage: isAudiobook ? null : item.playedPercentage,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: focusNode,
      onFocus: onFocus,
      onKeyEvent: onKeyEvent,
      onTap: onTap,
      onLongPress: onLongPress,
      overlayOccupiesTopLeft: showComicBadge,
      imageOverlays: [
        if (isAudiobook)
          Positioned.fill(
            child: _audiobookArt(
              bookProgressMeta(
                AppLocalizations.of(context),
                isAudiobook: true,
                playedPercentage: item.playedPercentage ?? 0,
                remaining: remaining,
              ),
            ),
          ),
        if (showComicBadge)
          const Positioned(top: 6, left: 6, child: BookComicBadge()),
      ],
    );
  }

  Widget _audiobookArt(String? timeLabel) {
    final onSurface = AppColorScheme.onSurface;
    final url = imageUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: url == null
              ? ColoredBox(
                  color: AppColorScheme.surfaceVariant,
                  child: Icon(
                    Icons.headphones_rounded,
                    color: onSurface.withValues(alpha: 0.4),
                  ),
                )
              : BoundedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration.zero,
                  maxWidth: MediaCard.decodeMaxWidthFor(1),
                  errorBuilder: (_, _, _) =>
                      ColoredBox(color: AppColorScheme.surfaceVariant),
                ),
        ),
        Expanded(
          child: ColoredBox(
            color: AppColorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  Icon(
                    Icons.headphones_rounded,
                    size: 14,
                    color: onSurface.withValues(alpha: 0.78),
                  ),
                  if (timeLabel != null) ...[
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        timeLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: onSurface.withValues(alpha: 0.78),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
