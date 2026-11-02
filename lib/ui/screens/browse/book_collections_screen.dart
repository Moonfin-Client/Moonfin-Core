import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/book/book_cover_strip_card.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import 'book_category_screen.dart';
import 'music_category_screen.dart' show MusicNearEnd;

/// The library's collections holding books, as wide cards with a strip of
/// their covers.
class BookCollectionsScreen extends StatefulWidget {
  final String libraryId;

  const BookCollectionsScreen({super.key, required this.libraryId});

  @override
  State<BookCollectionsScreen> createState() => _BookCollectionsScreenState();
}

class _BookCollectionsScreenState
    extends BookCategoryState<BookCollectionsScreen> {
  @override
  String get libraryId => widget.libraryId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // The load only checks the first collections, so the pane can know more.
    final count = math.max(vm.collectionCount, vm.paneItems.length);
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: vm.load,
        header: () => buildHeader(
          title: BookCategoryKind.collections.label(l10n),
          count: count > 0 ? l10n.spotlightCollectionsCount(count) : null,
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    final items = vm.paneItems;
    if (items.isEmpty) {
      vm.paneLoading ? addLoadingSection() : addEmptySection();
      return;
    }
    final columns = wide ? 2 : 1;
    final stop = addStop(
      RowFocusEntry.node(
        node('collection:0'),
        containerKey: sectionKey('collection:0'),
      ),
    );
    for (var start = 0; start < items.length; start += columns) {
      Widget row = MusicGrid(
        columns: columns,
        spacing: gridSpacing,
        children: [
          for (var i = start; i < math.min(start + columns, items.length); i++)
            BookCoverStripCard(
              covers: vm.collectionCoverUrls(items[i]),
              title: items[i].name,
              lines: [
                l10n.spotlightTitlesCount(
                  items[i].rawData['BookCount'] as int? ?? 0,
                ),
                items[i].overview ?? '',
              ],
              focusNode: node('collection:$i'),
              onTap: () => openItem(items[i]),
              onKeyEvent: (_, event) => gridKey(
                event,
                id: 'collection',
                index: i,
                count: items.length,
                columns: columns,
                stop: stop,
              ),
            ),
        ],
      );
      if (vm.paneHasMore && start + columns * 2 >= items.length) {
        row = MusicNearEnd(onBuilt: vm.loadMorePane, child: row);
      }
      addSection(
        Padding(
          key: sectionKey('collection:$start'),
          padding: EdgeInsets.fromLTRB(inset, 8, endInset, gridSpacing),
          child: row,
        ),
      );
    }
    if (vm.paneLoading) addLoadingSection();
  }
}
