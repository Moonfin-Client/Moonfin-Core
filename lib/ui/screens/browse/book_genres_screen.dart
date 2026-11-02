import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'book_category_screen.dart';

/// A book library's genres, each a colored station that opens a random
/// unread title, beside a shelf of its newest titles.
class BookGenresScreen extends StatefulWidget {
  final String libraryId;

  const BookGenresScreen({super.key, required this.libraryId});

  @override
  State<BookGenresScreen> createState() => _BookGenresScreenState();
}

class _BookGenresScreenState extends BookCategoryState<BookGenresScreen> {
  bool _byTitles = true;

  @override
  String get libraryId => widget.libraryId;

  /// Opens a random title of the genre nobody has started, or any of them
  /// once they all have been.
  void _surprise(List<AggregatedItem> titles) {
    final unread = [
      for (final title in titles)
        if (!title.isPlayed && (title.playedPercentage ?? 0) <= 0) title,
    ];
    final pool = unread.isEmpty ? titles : unread;
    openItem(pool[Random().nextInt(pool.length)]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final count = vm.isLoading ? 0 : vm.titlesByGenre.length;
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: vm.load,
        header: () => buildHeader(
          title: l10n.genres,
          count: count > 0 ? l10n.genresCount(count) : null,
          firstNode: count > 0 ? node('order') : null,
          controls: [
            if (count > 0)
              SlidingPillTabs(
                labels: [l10n.bookSortMostTitles, l10n.libraryAToZ],
                selectedIndex: _byTitles ? 0 : 1,
                focusNode: node('order'),
                onChanged: (index) => setState(() => _byTitles = index == 0),
                onVerticalNavigation: (isUp) {
                  move(headerIndex, isUp);
                  return true;
                },
                onExitLeft: leaveLeft,
                onExitRight: () {},
              ),
          ],
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    if (vm.isLoading) return addLoadingSection();
    final byGenre = vm.titlesByGenre;
    final names = byGenre.keys.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    if (names.isEmpty) return addEmptySection();
    // A genre keeps its color whichever order it's in.
    final colors = {
      for (final (i, name) in names.indexed)
        name: kMusicTileColors[i % kMusicTileColors.length],
    };
    if (_byTitles) {
      mergeSort(
        names,
        compare: (a, b) => byGenre[b]!.length.compareTo(byGenre[a]!.length),
      );
    }
    final expansion = cardFocusExpansion;
    for (var i = 0; i < names.length; i++) {
      final stop = addStop(
        RowFocusEntry.node(
          node('surprise:${names[i]}'),
          containerKey: sectionKey('genre:${names[i]}'),
        ),
      );
      addSection(_buildRow(l10n, names, i, stop, colors[names[i]]!, expansion));
    }
  }

  /// One genre: its station, then a shelf of its titles, newest first.
  Widget _buildRow(
    AppLocalizations l10n,
    List<String> names,
    int i,
    int stop,
    Color color,
    bool expansion,
  ) {
    final name = names[i];
    final titles = vm.titlesByGenre[name]!;
    final station = node('surprise:$name');
    final shelf = node('shelf:$name');
    final cardWidth = wide ? 120.0 : 100.0;
    final headroom = MediaCard.focusHeadroom(
      cardWidth * 1.5,
      expansion: expansion,
    );
    final height =
        headroom +
        MediaCard.layoutHeight(
          context,
          width: cardWidth,
          aspectRatio: 2 / 3,
          hasSubtitle: true,
        ) +
        10;

    final label = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          maxLines: wide ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: wide ? 24 : 18,
            fontWeight: FontWeight.w800,
            height: 1.1,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          l10n.spotlightTitlesCount(titles.length),
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withValues(alpha: 0.85),
          ),
        ),
      ],
    );
    final surprise = Container(
      height: 34,
      padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: AppRadius.circular(17),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.casino_rounded, size: 18, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            l10n.bookSurpriseMe,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    final tile = FocusableWrapper(
      highlightOnHover: true,
      focusNode: station,
      borderRadius: 16,
      autoScroll: true,
      semanticLabel: '$name, ${l10n.bookSurpriseMe}',
      onSelect: () => _surprise(titles),
      onNavigateUp: () => move(stop, true),
      onNavigateDown: () => move(stop, false),
      onNavigateLeft: leaveLeft,
      onNavigateRight: () =>
          rowKey('genre:$name').currentState?.requestFocusFromMemory(),
      child: Container(
        width: wide ? 230 : null,
        height: wide ? cardWidth * 1.5 : null,
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppRadius.circular(16),
        ),
        child: wide
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [label, const Spacer(), surprise],
              )
            : Row(
                children: [
                  Expanded(child: label),
                  surprise,
                ],
              ),
      ),
    );
    final row = LockedFocusRow<AggregatedItem>(
      key: rowKey('genre:$name'),
      focusNode: shelf,
      items: titles,
      hubKey: 'books_${libraryId}_genre_$name',
      itemKey: (item, _) => item.id,
      height: height,
      itemExtent: cardWidth,
      itemSpacing: wide ? 16 : 12,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(wide ? 22 : inset, headroom + 5, 20, 5),
      onFocusChange: (has) {
        if (has) reveal(shelf);
      },
      // Up and down keep to the shelves while the next one is built, and
      // fall back to its station otherwise.
      onVerticalNavigation: (isUp) {
        final next = i + (isUp ? -1 : 1);
        final target = next < 0 || next >= names.length
            ? null
            : rowKey('genre:${names[next]}').currentState;
        if (target != null) {
          target.requestFocusFromMemory();
        } else {
          move(stop, isUp);
        }
        return true;
      },
      onLeftEdge: station.requestFocus,
      onTap: (_, item) => openItem(item),
      onLongPress: (_, item) => showItemMenu(item),
      itemBuilder: (context, item, _, focused) =>
          shelfCard(item, width: cardWidth, focused: focused),
    );
    return Padding(
      key: sectionKey('genre:$name'),
      padding: EdgeInsets.only(left: wide ? inset : 0, top: wide ? 20 : 14),
      child: wide
          ? Row(
              children: [
                tile,
                Expanded(child: row),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(inset, 0, endInset, 4),
                  child: tile,
                ),
                row,
              ],
            ),
    );
  }
}
