import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../navigation/destinations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/book/book_see_all_button.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/skeleton/skeleton_music_browse.dart';
import 'library_page_state.dart';
import 'music_browse_screen.dart';

/// What the Quick Access and Immersive music libraries share: the view
/// model, the D-pad stops and the shelf each row is drawn as.
abstract class MusicLibraryState<T extends StatefulWidget>
    extends LibraryPageState<T> {
  late final MusicBrowseViewModel vm;

  @override
  String get focusLabel => 'music';

  @override
  String get activeRoute => '/music/$libraryId';

  @override
  Widget get loadingPlaceholder => const SkeletonMusicBrowse();

  @override
  bool get isLoading => vm.isLoading;

  @override
  void initState() {
    super.initState();
    vm = MusicBrowseViewModel(
      libraryId: libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
    );
    vm.addListener(contentChanged);
    reload();
  }

  @override
  void dispose() {
    vm.removeListener(contentChanged);
    vm.dispose();
    super.dispose();
  }

  Future<void> reload() async {
    await vm.load();
    if (mounted) onLoaded();
  }

  /// Runs after every load, for what a style loads on top of the rows.
  void onLoaded() {}

  void openItem(AggregatedItem item) => openMusicItem(context, item);

  void search() => context.push(Destinations.searchInLibrary(libraryId));

  void showSortAndFilter() => OverlaySheetController.show<void>(
    context,
    builder: (_) => MusicRowVisibilityDialog(
      libraryName: vm.libraryName,
      onChanged: reload,
    ),
  );

  /// The row the view model loaded under [prefix], if it has items.
  HomeRow? rowOf(String prefix) {
    for (final row in vm.rows) {
      if (row.id.startsWith(prefix) && row.items.isNotEmpty) return row;
    }
    return null;
  }

  /// The sections [addSections] adds, in a list that pulls to refresh.
  Widget buildSectionList(VoidCallback addSections) =>
      buildSections(addSections, onRefresh: reload);

  void addShelf(
    HomeRow? row, {
    required double inset,
    required VoidCallback onLeftEdge,
  }) {
    if (row == null) return;
    final index = addStop(
      RowFocusEntry.row(rowKey(row.id), containerKey: sectionKey(row.id)),
    );
    addSection(
      _buildShelf(row, entryIndex: index, inset: inset, onLeftEdge: onLeftEdge),
    );
  }

  void addList(
    HomeRow? row, {
    required String title,
    required double inset,
    required VoidCallback onLeftEdge,
    int max = 5,
  }) {
    if (row == null) return;
    final index = addStop(
      RowFocusEntry.node(node('${row.id}:0'), containerKey: sectionKey(row.id)),
    );
    addSection(
      _buildList(
        row,
        title: title,
        entryIndex: index,
        inset: inset,
        onLeftEdge: onLeftEdge,
        max: max,
      ),
    );
  }

  static bool _isArtistRow(HomeRow row) =>
      row.id.startsWith('albumartist_') || row.id.startsWith('musicartist_');

  /// [row] as a shelf of covers, or circles for artists.
  Widget _buildShelf(
    HomeRow row, {
    required int entryIndex,
    required double inset,
    required VoidCallback onLeftEdge,
  }) {
    final l10n = AppLocalizations.of(context);
    final round = _isArtistRow(row);
    final width = wide ? 168.0 : 140.0;
    final expansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final seeAll = musicSeeAllRoute(libraryId, row.id);
    final rowIndex = vm.rows.indexOf(row);
    return MusicShelf(
      title: localizeHomeRowTitle(row: row, l10n: l10n),
      onSeeAll: seeAll == null ? null : () => context.push(seeAll),
      seeAllFocusNode: seeAll == null ? null : node('seeAll:${row.id}'),
      items: row.items,
      hubKey: 'music_${row.id}',
      rowKey: rowKey(row.id),
      containerKey: sectionKey(row.id),
      itemExtent: width,
      height: width + 64,
      leadingInset: inset,
      large: wide,
      headroom: MediaCard.focusHeadroom(width, expansion: expansion),
      onSelect: openItem,
      onVerticalNavigation: (isUp) => move(entryIndex, isUp),
      onLeftEdge: onLeftEdge,
      onIndexChanged: (index) {
        if (index >= row.items.length - 8) vm.loadMoreForRow(rowIndex);
      },
      itemBuilder: (context, item, index, focused) => Align(
        alignment: Alignment.topLeft,
        child: MediaCard(
          width: width,
          aspectRatio: 1,
          title: item.name,
          subtitle: vm.getMusicSubtitle(item),
          imageUrl: vm.getMusicImageUrl(item),
          // MediaCard only draws Person cards round.
          itemType: round ? 'Person' : item.type,
          isFavorite: item.isFavorite,
          externalIsFocused: focused,
          cardFocusExpansion: expansion,
          onTap: () => openItem(item),
        ),
      ),
    );
  }

  /// The first [max] items of [row] as a list of rows, songs with their
  /// length and playlists with their size.
  Widget _buildList(
    HomeRow row, {
    required String title,
    required int entryIndex,
    required double inset,
    required VoidCallback onLeftEdge,
    int max = 5,
  }) {
    final items = row.items.take(max).toList();
    final seeAll = musicSeeAllRoute(libraryId, row.id);
    final seeAllNode = seeAll == null ? null : node('seeAll:${row.id}');
    return KeyedSubtree(
      key: sectionKey(row.id),
      child: MusicSection(
        title: title,
        large: wide,
        padding: EdgeInsets.symmetric(horizontal: inset),
        trailing: seeAll == null
            ? null
            : BookSeeAllButton(
                onPressed: () => context.push(seeAll),
                focusNode: seeAllNode,
                onNavigateUp: () => move(entryIndex, true),
                onNavigateDown: node('${row.id}:0').requestFocus,
              ),
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++)
              MusicTrackTile(
                title: items[i].name,
                subtitle: _songSubtitle(items[i]),
                imageUrl: vm.getMusicImageUrl(items[i]),
                trailing: musicRunTime(items[i]),
                focusNode: node('${row.id}:$i'),
                onTap: () => openItem(items[i]),
                edges: MusicGridEdges.of(
                  i,
                  count: items.length,
                  columns: 1,
                  onLeaveUp: seeAllNode == null
                      ? () => move(entryIndex, true)
                      : seeAllNode.requestFocus,
                  onLeaveDown: () => move(entryIndex, false),
                  onLeaveLeft: onLeftEdge,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// A song's artist and album, or the view model's subtitle for the rest.
  String _songSubtitle(AggregatedItem item) =>
      item.type == 'Audio' ? musicSongLine(item) : vm.getMusicSubtitle(item);
}
