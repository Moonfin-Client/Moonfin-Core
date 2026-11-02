import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'music_category_screen.dart';

/// The kinds of favorites, one tab each.
enum _Tab { songs, albums, artists, playlists }

/// A music library's favorites in tabs by kind: songs as a list with Play
/// and Shuffle, the rest as grids.
class MusicFavoritesScreen extends StatefulWidget {
  final String libraryId;

  /// The tab to open on, by name.
  final String? tab;

  const MusicFavoritesScreen({super.key, required this.libraryId, this.tab});

  @override
  State<MusicFavoritesScreen> createState() => _MusicFavoritesScreenState();
}

class _MusicFavoritesScreenState
    extends MusicCategoryState<MusicFavoritesScreen> {
  late final Map<_Tab, MusicPagedItems> _lists = {
    _Tab.songs: MusicPagedItems(
      (start, limit) => queries.items(
        const ['Audio'],
        favorite: true,
        start: start,
        limit: limit,
      ),
    ),
    _Tab.albums: MusicPagedItems(
      (start, limit) => queries.items(
        const ['MusicAlbum'],
        favorite: true,
        start: start,
        limit: limit,
      ),
    ),
    _Tab.artists: MusicPagedItems(
      (start, limit) => queries.artists(
        albumArtists: false,
        favorite: true,
        start: start,
        limit: limit,
      ),
    ),
    // Playlists come in whole, since each is checked for music first.
    _Tab.playlists: MusicPagedItems((start, _) async {
      if (start > 0) return (items: const <AggregatedItem>[], total: 0);
      final playlists = await queries.playlists(favorite: true);
      return (items: playlists, total: playlists.length);
    }),
  };
  _Tab? _tab;
  bool _loaded = false;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => !_loaded;

  List<_Tab> get _tabs => [
    for (final tab in _Tab.values)
      if (_lists[tab]!.items.isNotEmpty) tab,
  ];

  @override
  void initState() {
    super.initState();
    for (final list in _lists.values) {
      list.addListener(_onLists);
    }
    unawaited(_load());
  }

  @override
  void dispose() {
    for (final list in _lists.values) {
      list.removeListener(_onLists);
      list.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    await Future.wait([for (final list in _lists.values) list.load()]);
  }

  void _onLists() {
    if (_lists.values.every((list) => !list.isLoading)) {
      _loaded = true;
      final tabs = _tabs;
      if (_tab == null || !tabs.contains(_tab)) {
        final asked = _Tab.values.where((tab) => tab.name == widget.tab);
        _tab = asked.isNotEmpty && tabs.contains(asked.first)
            ? asked.first
            : (tabs.isEmpty ? null : tabs.first);
      }
    }
    contentChanged();
  }

  Future<void> _playSongs({required bool shuffle}) async {
    try {
      final page = await queries.items(
        const ['Audio'],
        sortBy: shuffle ? 'Random' : 'SortName',
        favorite: true,
        limit: 300,
      );
      if (mounted) await playMusicTracks(context, page.items);
    } catch (e) {
      debugPrint('Failed to play the favorite songs: $e');
    }
  }

  String _label(AppLocalizations l10n, _Tab tab) {
    final name = switch (tab) {
      _Tab.songs => l10n.songs,
      _Tab.albums => l10n.albums,
      _Tab.artists => l10n.artists,
      _Tab.playlists => l10n.playlists,
    };
    return '$name ${_lists[tab]!.total}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) => buildSections(
          () => _addSections(l10n, constraints.maxWidth),
          onRefresh: _load,
          header: () => _buildHeader(l10n),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final tabs = _tabs;
    final tab = _tab;
    final songs = tab == _Tab.songs;
    return buildHeader(
      title: l10n.favorites,
      firstNode: tabs.isEmpty ? null : node('tabs'),
      tabsAlignment: Alignment.centerLeft,
      tabs: tabs.isEmpty || tab == null
          ? null
          : SlidingPillTabs(
              labels: [for (final t in tabs) _label(l10n, t)],
              selectedIndex: tabs.indexOf(tab),
              focusNode: node('tabs'),
              onChanged: (index) => setState(() => _tab = tabs[index]),
              onVerticalNavigation: (isUp) => moveOrHold(headerIndex, isUp),
              onExitLeft: leaveLeft,
              onExitRight: songs ? node('play').requestFocus : () {},
            ),
      actions: [
        if (songs) ...[
          MusicPillButton(
            focusNode: node('play'),
            icon: Icons.play_arrow_rounded,
            label: l10n.play,
            primary: true,
            onTap: () => unawaited(_playSongs(shuffle: false)),
            onNavigateUp: () => move(headerIndex, true),
            onNavigateDown: () => move(headerIndex, false),
          ),
          MusicPillButton(
            focusNode: node('shuffle'),
            icon: Icons.shuffle_rounded,
            label: l10n.shuffle,
            onTap: () => unawaited(_playSongs(shuffle: true)),
            onNavigateUp: () => move(headerIndex, true),
            onNavigateDown: () => move(headerIndex, false),
            onNavigateRight: () {},
          ),
        ],
      ],
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    if (!_loaded) {
      addLoadingSection();
      return;
    }
    final tab = _tab;
    if (tab == null) {
      addSection(emptyMessage(l10n));
      return;
    }
    final list = _lists[tab]!;
    final items = list.items;
    if (tab == _Tab.songs) {
      _addSongs(items, list);
      return;
    }
    final columns = wide
        ? columnsFor(width, cardWidth: 170, min: 3, max: 8)
        : columnsFor(width, cardWidth: 104, min: 2, max: 4);
    final cell = cellWidth(width, columns);
    final subtitled = tab == _Tab.albums;
    addCardGrid(
      id: 'fav:${tab.name}',
      items: items,
      columns: columns,
      cell: cell,
      rowExtent: gridRowExtent(cell, hasSubtitle: subtitled),
      round: tab == _Tab.artists,
      subtitleOf: subtitled ? musicArtistNames : null,
      onSelect: (item, _) => openMusicItem(context, item),
      onNearEnd: list.loadMore,
    );
  }

  /// Two columns of songs on wide screens, one on phones, a row at a time.
  void _addSongs(List<AggregatedItem> songs, MusicPagedItems list) {
    final columns = wide ? 2 : 1;
    final stop = addStop(
      RowFocusEntry.node(node('song:0'), containerKey: sectionKey('song:row:0')),
    );
    for (var start = 0; start < songs.length; start += columns) {
      final row = MusicGrid(
        columns: columns,
        spacing: 36,
        children: [
          for (var i = start; i < start + columns && i < songs.length; i++)
            MusicTrackTile(
              title: songs[i].name,
              subtitle: musicSongLine(songs[i]),
              imageUrl: musicImageUrl(songs[i], maxHeight: 120),
              trailing: musicRunTime(songs[i]),
              focusNode: node('song:$i'),
              onTap: () => unawaited(
                playMusicTracks(context, songs, startIndex: i),
              ),
              edges: MusicGridEdges.of(
                i,
                count: songs.length,
                columns: columns,
                onLeaveUp: () => move(stop, true),
                onLeaveDown: () => move(stop, false),
                onLeaveLeft: leaveLeft,
              ),
              onNavigateRight: i % columns == columns - 1 ? () {} : null,
            ),
        ],
      );
      addSection(
        Padding(
          key: sectionKey('song:row:$start'),
          padding: EdgeInsets.fromLTRB(
            inset,
            start == 0 ? 12 : 0,
            endInset,
            2,
          ),
          child: start + columns * 3 >= songs.length && list.hasMore
              ? MusicNearEnd(onBuilt: list.loadMore, child: row)
              : row,
        ),
      );
    }
  }
}
