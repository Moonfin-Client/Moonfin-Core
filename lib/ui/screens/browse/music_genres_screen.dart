import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'music_category_screen.dart';

/// A music library's genres, each a colored station that shuffles it next
/// to a shelf of its albums.
class MusicGenresScreen extends StatefulWidget {
  final String libraryId;

  const MusicGenresScreen({super.key, required this.libraryId});

  @override
  State<MusicGenresScreen> createState() => _MusicGenresScreenState();
}

class _MusicGenresScreenState extends MusicCategoryState<MusicGenresScreen> {
  bool _loading = true;

  /// By name, the way the server sends them.
  List<AggregatedItem> _genres = const [];
  bool _byAlbums = true;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => _loading;

  bool get _hasCounts =>
      _genres.any((genre) => (musicGenreAlbumCount(genre) ?? 0) > 0);

  List<AggregatedItem> get _ordered =>
      _byAlbums && _hasCounts ? sortGenresByAlbums(_genres) : _genres;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    try {
      _genres = await queries.genres();
    } catch (e) {
      debugPrint('Failed to load the music genres: $e');
    }
    _loading = false;
    contentChanged();
  }

  Future<void> _shuffle(AggregatedItem genre) async {
    try {
      final tracks = await queries.shuffleGenre(genre.id);
      if (mounted) await playMusicTracks(context, tracks);
    } catch (e) {
      debugPrint('Failed to shuffle ${genre.name}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: _load,
        header: () => buildHeader(
          title: l10n.genres,
          count: _genres.isEmpty ? null : l10n.genresCount(_genres.length),
          firstNode: _hasCounts ? node('order') : null,
          tabs: _hasCounts
              ? SlidingPillTabs(
                  labels: [l10n.musicSortMostAlbums, l10n.libraryAToZ],
                  selectedIndex: _byAlbums ? 0 : 1,
                  alignment: wide
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  focusNode: node('order'),
                  onChanged: (index) => setState(() => _byAlbums = index == 0),
                  onVerticalNavigation: (isUp) => moveOrHold(headerIndex, isUp),
                  onExitLeft: leaveLeft,
                  onExitRight: () {},
                )
              : null,
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    if (_loading) {
      addLoadingSection();
      return;
    }
    final genres = _ordered;
    if (genres.isEmpty) {
      addSection(emptyMessage(l10n));
      return;
    }
    final stops = <int>[];
    for (var i = 0; i < genres.length; i++) {
      stops.add(
        addStop(
          RowFocusEntry.node(
            node('station:${genres[i].id}'),
            containerKey: sectionKey('genre:${genres[i].id}'),
          ),
        ),
      );
    }
    for (var i = 0; i < genres.length; i++) {
      final genre = genres[i];
      final count = musicGenreAlbumCount(genre);
      // Up and down from a shelf land on the next shelf when it has loaded,
      // and on its station otherwise.
      bool moveFromShelf(bool isUp) {
        final next = i + (isUp ? -1 : 1);
        if (next >= 0 && next < genres.length) {
          final shelf = rowKey('genre:${genres[next].id}').currentState;
          if (shelf != null && shelf.widget.items.isNotEmpty) {
            shelf.requestFocusFromMemory();
            return true;
          }
        }
        return moveOrHold(stops[i], isUp);
      }

      addSection(
        _GenreRow(
          key: sectionKey('genre:${genre.id}'),
          genre: genre,
          queries: queries,
          color: kMusicTileColors[i % kMusicTileColors.length],
          countLabel: count == null || count <= 0
              ? null
              : l10n.spotlightAlbumsCount(count),
          shuffleLabel: l10n.shuffle,
          wide: wide,
          inset: inset,
          stationNode: node('station:${genre.id}'),
          shelfKey: rowKey('genre:${genre.id}'),
          imageUrlOf: musicImageUrl,
          onShuffle: () => unawaited(_shuffle(genre)),
          onOpen: (album) => openMusicItem(context, album),
          onStationVertical: (isUp) => move(stops[i], isUp),
          onShelfVertical: moveFromShelf,
          onLeaveLeft: leaveLeft,
        ),
      );
    }
  }
}

/// One genre: its station, then a shelf of its newest albums that loads
/// when the row first comes into view.
class _GenreRow extends StatefulWidget {
  final AggregatedItem genre;
  final MusicLibraryQueries queries;
  final Color color;
  final String? countLabel;
  final String shuffleLabel;
  final bool wide;
  final double inset;
  final FocusNode stationNode;
  final GlobalKey<LockedFocusRowState> shelfKey;
  final String? Function(AggregatedItem item, {int maxHeight}) imageUrlOf;
  final VoidCallback onShuffle;
  final void Function(AggregatedItem album) onOpen;
  final void Function(bool isUp) onStationVertical;
  final bool Function(bool isUp) onShelfVertical;
  final VoidCallback onLeaveLeft;

  const _GenreRow({
    super.key,
    required this.genre,
    required this.queries,
    required this.color,
    required this.countLabel,
    required this.shuffleLabel,
    required this.wide,
    required this.inset,
    required this.stationNode,
    required this.shelfKey,
    required this.imageUrlOf,
    required this.onShuffle,
    required this.onOpen,
    required this.onStationVertical,
    required this.onShelfVertical,
    required this.onLeaveLeft,
  });

  @override
  State<_GenreRow> createState() => _GenreRowState();
}

class _GenreRowState extends State<_GenreRow> {
  late final _albums = MusicPagedItems(
    (start, limit) => widget.queries.items(
      const ['MusicAlbum'],
      sortBy: 'DateCreated,SortName',
      descending: true,
      genreIds: [widget.genre.id],
      start: start,
      limit: limit,
    ),
    pageSize: 20,
  );

  @override
  void initState() {
    super.initState();
    _albums.addListener(_onAlbums);
    unawaited(_albums.load());
  }

  @override
  void dispose() {
    _albums.removeListener(_onAlbums);
    _albums.dispose();
    super.dispose();
  }

  void _onAlbums() {
    if (mounted) setState(() {});
  }

  void _focusShelf() {
    final shelf = widget.shelfKey.currentState;
    if (shelf != null && shelf.widget.items.isNotEmpty) {
      shelf.requestFocusFromMemory();
    }
  }

  @override
  Widget build(BuildContext context) {
    final wide = widget.wide;
    final stationWidth = wide ? 230.0 : 150.0;
    final stationHeight = wide ? 160.0 : 128.0;
    final cover = wide ? 118.0 : 96.0;
    final expansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final headroom = MediaCard.focusHeadroom(cover, expansion: expansion);
    final cardHeight = MediaCard.layoutHeight(
      context,
      width: cover,
      aspectRatio: 1,
    );
    final items = _albums.items;
    return Padding(
      padding: EdgeInsets.only(left: widget.inset, top: wide ? 20 : 14),
      child: Row(
        children: [
          _Station(
            focusNode: widget.stationNode,
            name: widget.genre.name,
            countLabel: widget.countLabel,
            shuffleLabel: widget.shuffleLabel,
            color: widget.color,
            width: stationWidth,
            height: stationHeight,
            onTap: widget.onShuffle,
            onNavigateUp: () => widget.onStationVertical(true),
            onNavigateDown: () => widget.onStationVertical(false),
            onNavigateLeft: widget.onLeaveLeft,
            onNavigateRight: _focusShelf,
          ),
          Expanded(
            child: SizedBox(
              height: headroom + cardHeight + 10,
              child: items.isEmpty
                  ? null
                  : LockedFocusRow<AggregatedItem>(
                      key: widget.shelfKey,
                      items: items,
                      hubKey: 'music_genre_${widget.genre.id}',
                      itemKey: (item, _) => item.id,
                      height: headroom + cardHeight + 10,
                      itemExtent: cover,
                      itemSpacing: wide ? 16 : 12,
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.fromLTRB(
                        wide ? 22 : 14,
                        headroom + 5,
                        20,
                        5,
                      ),
                      onVerticalNavigation: widget.onShelfVertical,
                      onLeftEdge: widget.stationNode.requestFocus,
                      onIndexChanged: (index, _) {
                        if (index >= items.length - 6) {
                          unawaited(_albums.loadMore());
                        }
                      },
                      onTap: (_, album) => widget.onOpen(album),
                      itemBuilder: (context, album, index, focused) => Align(
                        alignment: Alignment.topLeft,
                        child: MediaCard(
                          width: cover,
                          aspectRatio: 1,
                          title: album.name,
                          imageUrl: widget.imageUrlOf(album, maxHeight: 300),
                          itemType: album.type,
                          isFavorite: album.isFavorite,
                          externalIsFocused: focused,
                          cardFocusExpansion: expansion,
                          onTap: () => widget.onOpen(album),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A genre's colored tile: its name, how many albums it holds and a
/// Shuffle chip. Picking it shuffles the genre.
class _Station extends StatelessWidget {
  final FocusNode focusNode;
  final String name;
  final String? countLabel;
  final String shuffleLabel;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onTap;
  final VoidCallback onNavigateUp;
  final VoidCallback onNavigateDown;
  final VoidCallback onNavigateLeft;
  final VoidCallback onNavigateRight;

  const _Station({
    required this.focusNode,
    required this.name,
    required this.countLabel,
    required this.shuffleLabel,
    required this.color,
    required this.width,
    required this.height,
    required this.onTap,
    required this.onNavigateUp,
    required this.onNavigateDown,
    required this.onNavigateLeft,
    required this.onNavigateRight,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 16,
      autoScroll: true,
      semanticLabel: '$name, $shuffleLabel',
      onSelect: onTap,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: width > 200 ? 24 : 18,
                fontWeight: FontWeight.w800,
                height: 1.1,
                color: Colors.white,
              ),
            ),
            if (countLabel != null) ...[
              const SizedBox(height: 2),
              Text(
                countLabel!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
            const Spacer(),
            Container(
              height: 34,
              padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                borderRadius: AppRadius.circular(17),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.shuffle_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      shuffleLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
