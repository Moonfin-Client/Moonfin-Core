import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/book/book_format_badge.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/focus/hub_focus_memory.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_widgets.dart';
import 'book_category_screen.dart';

/// The library's series, each a shelf of its books in reading order beside
/// how far along it is.
class BookSeriesScreen extends StatefulWidget {
  final String libraryId;

  const BookSeriesScreen({super.key, required this.libraryId});

  @override
  State<BookSeriesScreen> createState() => _BookSeriesScreenState();
}

class _BookSeriesScreenState extends BookCategoryState<BookSeriesScreen> {
  @override
  String get libraryId => widget.libraryId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final count = vm.seriesCount;
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: vm.load,
        header: () => buildHeader(
          title: BookCategoryKind.series.label(l10n),
          count: count > 0 ? l10n.bookSeriesCount(count) : null,
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    final all = vm.allSeries;
    if (all.isEmpty) {
      vm.isLoading ? addLoadingSection() : addEmptySection();
      return;
    }
    for (var i = 0; i < all.length; i++) {
      final stop = addStop(
        RowFocusEntry.row(rowKey('$i'), containerKey: sectionKey('$i')),
      );
      addSection(_buildSeries(l10n, all[i], i, stop));
    }
  }

  Widget _buildSeries(
    AppLocalizations l10n,
    AggregatedItem series,
    int index,
    int stop,
  ) {
    final books = vm.seriesBooks(series);
    final next =
        books
            .where((book) => (book.playedPercentage ?? 0) > 0 && !book.isPlayed)
            .firstOrNull ??
        books.where((book) => !book.isPlayed).firstOrNull;
    int number(AggregatedItem book) =>
        book.indexNumber ?? books.indexOf(book) + 1;
    final onSurface = AppColorScheme.onSurface;
    final cover = wide ? 140.0 : 110.0;
    final expansion = cardFocusExpansion;
    final headroom = MediaCard.focusHeadroom(cover * 1.5, expansion: expansion);
    final hub = 'books_${libraryId}_series_${series.id}';

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.series.toUpperCase(), style: musicEyebrowStyle()),
        const SizedBox(height: 6),
        Text(
          series.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: wide ? 24 : 20,
            fontWeight: FontWeight.w800,
            color: onSurface,
          ),
        ),
        for (final line in [
          if (books.isNotEmpty) vm.bookSubtitle(books.first),
          next == null
              ? l10n.finished
              : l10n.bookSeriesPosition(number(next), books.length),
        ])
          Text(
            line,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: onSurface.withValues(alpha: 0.65),
            ),
          ),
      ],
    );

    final shelf = LockedFocusRow<AggregatedItem>(
      key: rowKey('$index'),
      focusNode: node('series:$index'),
      items: books,
      hubKey: hub,
      itemKey: (book, _) => book.id,
      height:
          headroom +
          MediaCard.layoutHeight(
            context,
            width: cover,
            aspectRatio: 2 / 3,
            hasSubtitle: true,
          ) +
          10,
      itemExtent: cover,
      itemSpacing: wide ? 16 : 12,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(wide ? 24 : inset, headroom + 5, 20, 5),
      onVerticalNavigation: (isUp) {
        // Down from the header always lands on the first book.
        if (isUp && index == 0) HubFocusMemory.clear(hub);
        move(stop, isUp);
        return true;
      },
      onLeftEdge: leaveLeft,
      onTap: (_, book) => openItem(book),
      onLongPress: (_, book) => showItemMenu(book),
      itemBuilder: (context, book, _, focused) {
        final isAudio = vm.isAudiobookItem(book);
        return Align(
          alignment: Alignment.topLeft,
          child: MediaCard(
            width: cover,
            // Square audiobook art would lose its edges cropped to 2:3.
            aspectRatio: isAudio ? 1 : 2 / 3,
            title: book.name,
            subtitle: book.isPlayed
                ? l10n.finished
                : bookProgressMeta(
                    l10n,
                    isAudiobook: isAudio,
                    playedPercentage: book.playedPercentage ?? 0,
                    remaining: isAudio ? vm.remainingFor(book) : null,
                  ),
            imageUrl: vm.bookImageUrl(book),
            itemType: book.type,
            isFavorite: book.isFavorite,
            playedPercentage: isAudio || book.isPlayed
                ? null
                : book.playedPercentage,
            externalIsFocused: focused,
            cardFocusExpansion: expansion,
            overlayOccupiesTopLeft: true,
            onTap: () => openItem(book),
            onLongPress: () => showItemMenu(book),
            imageOverlays: [
              if (book.isPlayed)
                Positioned.fill(
                  child: ColoredBox(
                    color: AppColorScheme.scrim.withValues(alpha: 0.45),
                    child: Icon(
                      Icons.check_rounded,
                      size: cover / 3,
                      color: AppColorScheme.onBadge,
                    ),
                  ),
                ),
              Positioned(top: 6, left: 6, child: _badge('${number(book)}')),
              if (book.id == next?.id)
                Positioned(
                  left: 6,
                  right: 6,
                  bottom: 16,
                  child: _badge(l10n.upNext.toUpperCase()),
                ),
            ],
          ),
        );
      },
    );

    return Padding(
      key: sectionKey('$index'),
      padding: EdgeInsets.only(top: wide ? 24 : 16),
      child: wide
          ? Padding(
              padding: EdgeInsets.only(left: inset),
              child: Row(
                children: [
                  SizedBox(width: 220, child: info),
                  Expanded(child: shelf),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(inset, 0, endInset, 4),
                  child: info,
                ),
                shelf,
              ],
            ),
    );
  }

  Widget _badge(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      color: AppColorScheme.accent,
      borderRadius: AppRadius.circular(10),
    ),
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.6,
        color: AppColorScheme.onAccent,
      ),
    ),
  );
}
