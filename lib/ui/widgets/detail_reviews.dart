import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/repositories/tmdb_repository.dart';
import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import 'adaptive/sf_symbol.dart';
import 'bounded_network_image.dart';
import 'focus/focusable_wrapper.dart';
import 'support_dialog.dart';
import 'server_messages_dialog.dart';
import 'track_selector_dialog.dart';

const double reviewCardHeight = 176;

double get _cardWidth => PlatformDetection.useMobileUi ? 260 : 320;

String _ratingText(double rating) => rating == rating.roundToDouble()
    ? rating.toInt().toString()
    : rating.toStringAsFixed(1);

/// The score and date under a reviewer's name, like "8 / 10 · Jun 9, 2018".
String reviewMeta(BuildContext context, TmdbReview review) => [
  if (review.rating case final rating?)
    AppLocalizations.of(context).personalRatingOutOfTen(_ratingText(rating)),
  if (review.createdAt case final date?)
    DateFormat.yMMMd(Localizations.localeOf(context).toString())
        .format(date.toLocal()),
].join(' · ');

/// Opens a review in full. A TV has no browser, so the link to TMDB only shows
/// everywhere else.
Future<void> showReviewDialog(BuildContext context, TmdbReview review) {
  final width = MediaQuery.sizeOf(context).width;
  final meta = reviewMeta(context, review);
  return showStyledPlayerDialog<void>(
    context,
    title: review.author,
    subtitle: meta.isEmpty ? null : meta,
    maxWidth: math.max(340.0, math.min(width - 80, 720.0)),
    builder: (_) => _ReviewDialogBody(review: review),
  );
}

class _ReviewDialogBody extends StatefulWidget {
  const _ReviewDialogBody({required this.review});

  final TmdbReview review;

  @override
  State<_ReviewDialogBody> createState() => _ReviewDialogBodyState();
}

class _ReviewDialogBodyState extends State<_ReviewDialogBody> {
  final _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  // The text has nothing to focus, so Up and Down page through it here. At
  // either end the key goes on, which lets Down reach the TMDB button.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final down = event.logicalKey == LogicalKeyboardKey.arrowDown;
    if (!down && event.logicalKey != LogicalKeyboardKey.arrowUp) {
      return KeyEventResult.ignored;
    }
    if (!_scroll.hasClients) return KeyEventResult.ignored;
    final position = _scroll.position;
    final step = position.viewportDimension * 0.8;
    final target = (position.pixels + (down ? step : -step)).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (target == position.pixels) return KeyEventResult.ignored;
    _scroll.animateTo(
      target,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
    );
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    final url = PlatformDetection.isTV ? null : review.url;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Focus(
            autofocus: true,
            onKeyEvent: _onKey,
            child: SingleChildScrollView(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: MessageMarkdown(markdown: review.content),
            ),
          ),
        ),
        if (url != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextButton.icon(
              icon: const AdaptiveIcon(Icons.open_in_new, size: 18),
              label: Text(AppLocalizations.of(context).readOnTmdb),
              onPressed: () => showQrOrLaunch(
                context,
                url: url,
                title: AppLocalizations.of(context).readOnTmdb,
              ),
            ),
          ),
      ],
    );
  }
}

/// One review as a card: who wrote it, their score, when, and the start of
/// what they said. Selecting it opens the whole review.
class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    this.width,
    this.focusNode,
    this.onKeyEvent,
    this.onFocus,
  });

  final TmdbReview review;
  final double? width;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;
  final VoidCallback? onFocus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final meta = reviewMeta(context, review);
    return FocusableWrapper(
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      onFocusChange: (focused) {
        if (focused) onFocus?.call();
      },
      onSelect: () => showReviewDialog(context, review),
      borderRadius: 12,
      disableScale: true,
      semanticLabel: review.author,
      child: Container(
        width: width ?? _cardWidth,
        height: reviewCardHeight,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.06),
          borderRadius: AppRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _Avatar(review: review),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                      if (meta.isNotEmpty)
                        Text(
                          meta,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.66,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                stripMarkdown(review.content),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  height: 1.35,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.review});

  final TmdbReview review;

  @override
  Widget build(BuildContext context) {
    final name = review.author.trim();
    final initial = Container(
      alignment: Alignment.center,
      color: AppColorScheme.accent.withValues(alpha: 0.35),
      child: Text(
        name.isEmpty ? '?' : name.characters.first.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
    final url = review.avatarUrl;
    return ClipOval(
      child: SizedBox(
        width: 36,
        height: 36,
        child: url == null
            ? initial
            : BoundedNetworkImage(
                imageUrl: url,
                errorBuilder: (_, _, _) => initial,
              ),
      ),
    );
  }
}

/// The reviews as one sideways row, for layouts that list their sections one
/// under another. Takes the same focus hooks as the other detail rows.
class DetailReviewsRow extends StatelessWidget {
  const DetailReviewsRow({
    super.key,
    required this.reviews,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
  });

  final List<TmdbReview> reviews;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: reviewCardHeight + 12,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(top: 6),
        itemCount: reviews.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => ReviewCard(
          review: reviews[index],
          focusNode: index == 0 ? firstItemFocusNode : null,
          onKeyEvent: onItemKeyEvent == null
              ? null
              : (_, event) => onItemKeyEvent!(index, event),
        ),
      ),
    );
  }
}

/// The reviews wrapped into as many columns as fit, for a tab or a pop-up that
/// gives them the whole width. [onTopRowUp] lets the first row hand Up back to
/// whatever sits above the grid.
class DetailReviewsGrid extends StatelessWidget {
  const DetailReviewsGrid({
    super.key,
    required this.reviews,
    this.firstFocusNode,
    this.onTopRowUp,
  });

  final List<TmdbReview> reviews;
  final FocusNode? firstFocusNode;
  final VoidCallback? onTopRowUp;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final preferred = _cardWidth;
        final columns = math.max(
          1,
          ((constraints.maxWidth + spacing) / (preferred + spacing)).floor(),
        );
        final width =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < reviews.length; i++)
              Builder(
                builder: (cellContext) => ReviewCard(
                  review: reviews[i],
                  width: width,
                  focusNode: i == 0 ? firstFocusNode : null,
                  onFocus: () => Scrollable.ensureVisible(
                    cellContext,
                    alignment: 0.5,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  ),
                  onKeyEvent: i < columns && onTopRowUp != null
                      ? (_, event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.arrowUp) {
                            onTopRowUp!();
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                        }
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }
}
