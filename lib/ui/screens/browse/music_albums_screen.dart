import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/playback_time_label.dart';
import '../../navigation/destinations.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'music_category_screen.dart';

/// A music library's albums as a grid of covers. Picking one opens a panel
/// under its row with the album's songs and Play, Shuffle and Open Album.
class MusicAlbumsScreen extends StatefulWidget {
  final String libraryId;

  const MusicAlbumsScreen({super.key, required this.libraryId});

  @override
  State<MusicAlbumsScreen> createState() => _MusicAlbumsScreenState();
}

class _MusicAlbumsScreenState extends MusicCategoryState<MusicAlbumsScreen> {
  var _sort = MusicAlbumSort.recentlyAdded;
  AggregatedItem? _genre;
  late final _albums = MusicPagedItems(
    (start, limit) => queries.albums(
      _sort,
      genreId: _genre?.id,
      start: start,
      limit: limit,
    ),
  );
  bool _loaded = false;

  /// The album whose panel is open.
  int? _open;
  List<AggregatedItem> _tracks = const [];
  bool _tracksLoading = false;
  int _tracksRequest = 0;
  int _columns = 1;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => !_loaded;

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
    if (!_albums.isLoading) _loaded = true;
    contentChanged();
  }

  void _reload() {
    _open = null;
    unawaited(_albums.load());
  }

  void _select(AggregatedItem album, int index) {
    if (_open == index) {
      _close();
      return;
    }
    final request = ++_tracksRequest;
    setState(() {
      _open = index;
      _tracks = const [];
      _tracksLoading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final row = sectionKey('album:row:${index - index % _columns}');
      final rowContext = row.currentContext;
      if (rowContext != null) {
        Scrollable.ensureVisible(
          rowContext,
          alignment: 0.05,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOut,
        );
      }
    });
    unawaited(() async {
      List<AggregatedItem> tracks = const [];
      try {
        tracks = await queries.albumTracks(album.id);
      } catch (e) {
        debugPrint('Failed to load the album songs: $e');
      }
      if (!mounted || request != _tracksRequest) return;
      setState(() {
        _tracks = tracks;
        _tracksLoading = false;
      });
    }());
  }

  void _close() {
    final index = _open;
    if (index == null) return;
    _tracksRequest++;
    setState(() => _open = null);
    node('album:$index').requestFocus();
  }

  Future<void> _pickGenre(AppLocalizations l10n) async {
    List<AggregatedItem> genres;
    try {
      genres = await queries.genres();
    } catch (e) {
      debugPrint('Failed to load the music genres: $e');
      return;
    }
    if (!mounted) return;
    final names = {for (final genre in genres) genre.id: genre.name};
    final picked = await showSettingsPicker<String>(
      context,
      title: l10n.musicGenreFilterTitle,
      values: ['', ...names.keys],
      current: _genre?.id ?? '',
      labelOf: (id) => id.isEmpty ? l10n.allGenres : names[id] ?? '',
    );
    if (!mounted || picked == null || picked == (_genre?.id ?? '')) return;
    setState(() {
      _genre = picked.isEmpty
          ? null
          : genres.firstWhere((genre) => genre.id == picked);
    });
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PopScope(
      canPop: _open == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close();
      },
      child: buildCategoryPage(
        () => LayoutBuilder(
          builder: (context, constraints) => buildSections(
            () => _addSections(l10n, constraints.maxWidth),
            onRefresh: () async => _reload(),
            header: () => _buildHeader(l10n),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final total = _albums.total;
    return buildHeader(
      title: l10n.albums,
      count: total > 0 ? l10n.spotlightAlbumsCount(total) : null,
      firstNode: node('sort'),
      tabs: SlidingPillTabs(
        labels: [
          l10n.recentlyAdded,
          l10n.libraryAToZ,
          l10n.musicSortYear,
          l10n.librarySortArtist,
        ],
        selectedIndex: _sort.index,
        alignment: wide ? Alignment.centerRight : Alignment.centerLeft,
        focusNode: node('sort'),
        onChanged: (index) {
          if (_sort.index == index) return;
          setState(() => _sort = MusicAlbumSort.values[index]);
          reloadSoon(_reload);
        },
        onVerticalNavigation: (isUp) => moveOrHold(headerIndex, isUp),
        onExitLeft: leaveLeft,
        onExitRight: node('filter').requestFocus,
      ),
      actions: [
        MusicPillButton(
          focusNode: node('filter'),
          icon: Icons.filter_list_rounded,
          iconColor: _genre == null ? null : AppColorScheme.accent,
          label: _genre?.name ?? l10n.musicFilter,
          onTap: () => unawaited(_pickGenre(l10n)),
          onNavigateUp: () => move(headerIndex, true),
          onNavigateDown: () => move(headerIndex, false),
          onNavigateRight: () {},
        ),
      ],
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    final items = _albums.items;
    if (_albums.isLoading) {
      addLoadingSection();
      return;
    }
    if (items.isEmpty) {
      addSection(emptyMessage(l10n));
      return;
    }
    final columns = wide
        ? columnsFor(width, cardWidth: 170, min: 3, max: 8)
        : columnsFor(width, cardWidth: 104, min: 2, max: 4);
    _columns = columns;
    final cell = cellWidth(width, columns);
    final rowExtent = gridRowExtent(cell, hasSubtitle: true);
    final open = _open != null && _open! < items.length ? _open : null;
    final split = open == null
        ? items.length
        : (open - open % columns + columns).clamp(0, items.length);
    VoidCallback? intoPanel(int index) =>
        open != null && index >= split - columns && index < split
        ? node('panel:play').requestFocus
        : null;
    final stop = addCardGrid(
      id: 'album',
      items: items,
      columns: columns,
      cell: cell,
      rowExtent: rowExtent,
      end: split,
      subtitleOf: musicArtistNames,
      onSelect: _select,
      downFrom: intoPanel,
      onNearEnd: split == items.length ? _albums.loadMore : null,
    );
    if (open == null) return;
    addSection(
      _buildPanel(
        l10n,
        items[open],
        caretCenter: inset + (open % columns) * (cell + gridSpacing) + cell / 2,
        after: split < items.length ? node('album:$split') : null,
      ),
    );
    if (split < items.length) {
      addCardGrid(
        id: 'album',
        items: items,
        columns: columns,
        cell: cell,
        rowExtent: rowExtent,
        first: split,
        stopIndex: stop,
        subtitleOf: musicArtistNames,
        onSelect: _select,
        onNearEnd: _albums.loadMore,
      );
    }
  }

  String _meta(AppLocalizations l10n, AggregatedItem album) {
    final runtime =
        album.runtime ??
        Duration(
          microseconds:
              _tracks.fold<int>(0, (sum, t) => sum + (t.runTimeTicks ?? 0)) ~/
              10,
        );
    return [
      if (_tracks.isNotEmpty) l10n.trackCount(_tracks.length),
      if (runtime > Duration.zero) formatRuntimeShort(runtime),
      if (album.genres.isNotEmpty) album.genres.first,
    ].join(' · ');
  }

  Widget _buildPanel(
    AppLocalizations l10n,
    AggregatedItem album, {
    required double caretCenter,
    required FocusNode? after,
  }) {
    final onSurface = AppColorScheme.onSurface;
    final fill = onSurface.withValues(alpha: 0.06);
    final openIndex = _open!;
    void up() => node('album:$openIndex').requestFocus();
    void down() {
      if (_tracks.isNotEmpty) {
        node('track:0').requestFocus();
      } else {
        after?.requestFocus();
      }
    }

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.album.toUpperCase(), style: musicEyebrowStyle()),
        const SizedBox(height: 6),
        Text(
          album.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: wide ? 28 : 22,
            fontWeight: FontWeight.w800,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          [
            musicArtistNames(album),
            if (album.productionYear != null) '${album.productionYear}',
          ].where((part) => part.isNotEmpty).join(' · '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 15, color: onSurface.withValues(alpha: 0.75)),
        ),
        const SizedBox(height: 2),
        Text(
          _meta(l10n, album),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: onSurface.withValues(alpha: 0.65)),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            MusicPillButton(
              focusNode: node('panel:play'),
              icon: Icons.play_arrow_rounded,
              label: l10n.play,
              primary: true,
              onTap: () => unawaited(playMusicTracks(context, _tracks)),
              onNavigateUp: up,
              onNavigateDown: down,
            ),
            MusicPillButton(
              focusNode: node('panel:shuffle'),
              icon: Icons.shuffle_rounded,
              label: l10n.shuffle,
              onTap: () => unawaited(
                shuffleMusic(
                  context,
                  parentId: album.id,
                  serverId: album.serverId,
                ),
              ),
              onNavigateUp: up,
              onNavigateDown: down,
            ),
            MusicPillButton(
              focusNode: node('panel:open'),
              icon: Icons.album_rounded,
              label: l10n.openAlbum,
              onTap: () => context.push(
                Destinations.item(album.id, serverId: album.serverId),
              ),
              onNavigateUp: up,
              onNavigateDown: down,
              onNavigateRight: wide && _tracks.isNotEmpty
                  ? node('track:0').requestFocus
                  : () {},
            ),
          ],
        ),
      ],
    );

    final columns = wide ? 2 : 1;
    final Widget tracks;
    if (_tracksLoading) {
      tracks = const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      tracks = MusicGrid(
        columns: columns,
        spacing: 2,
        children: [
          for (var i = 0; i < _tracks.length; i++)
            MusicTrackTile(
              title: _tracks[i].name,
              subtitle: '',
              leadingLabel: '${_tracks[i].indexNumber ?? i + 1}',
              trailing: musicRunTime(_tracks[i]),
              focusNode: node('track:$i'),
              onTap: () => unawaited(
                playMusicTracks(context, _tracks, startIndex: i),
              ),
              edges: MusicGridEdges(
                up: i < columns ? node('panel:play').requestFocus : null,
                down: i + columns >= _tracks.length
                    ? () => after?.requestFocus()
                    : null,
                left: wide && i % columns == 0
                    ? node('panel:open').requestFocus
                    : null,
              ),
              onNavigateRight: i % columns == columns - 1 ? () {} : null,
            ),
        ],
      );
    }

    return Padding(
      key: sectionKey('album:panel'),
      padding: EdgeInsets.fromLTRB(inset, 12, endInset, gridSpacing + 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            decoration: BoxDecoration(
              color: fill,
              borderRadius: AppRadius.circular(16),
            ),
            child: wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 340, child: info),
                      const SizedBox(width: 32),
                      Expanded(child: tracks),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [info, const SizedBox(height: 16), tracks],
                  ),
          ),
          Positioned(
            top: -9,
            left: caretCenter - inset - 9,
            child: CustomPaint(
              size: const Size(18, 9),
              painter: PanelCaretPainter(fill),
            ),
          ),
        ],
      ),
    );
  }
}
