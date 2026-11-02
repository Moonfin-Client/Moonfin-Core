import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/book/book_category_nav.dart';
import '../../widgets/book/book_format_badge.dart';
import '../../widgets/book/book_list_tile.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/book/book_shelf_row.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/settings/preference_tiles.dart' show showSettingsPicker;
import '../../widgets/sliding_pill_tabs.dart';
import '../detail/playlist_sort_filter_bar.dart' show librarySortLabel;
import 'book_category_screen.dart';
import 'music_category_screen.dart' show MusicNearEnd;

/// The library's titles in one format, as a grid of covers. Picking one opens
/// a panel under its row with what it is and how far along it is.
class BookTitlesScreen extends StatefulWidget {
  final String libraryId;

  const BookTitlesScreen({super.key, required this.libraryId});

  @override
  State<BookTitlesScreen> createState() => _BookTitlesScreenState();
}

class _BookTitlesScreenState extends BookCategoryState<BookTitlesScreen> {
  static const _sorts = [
    LibrarySortBy.dateAdded,
    LibrarySortBy.name,
    LibrarySortBy.premiereDate,
    LibrarySortBy.datePlayed,
  ];

  final _favorites = <String, bool>{};

  String? _open;
  Map<String, dynamic>? _details;
  int _detailsRequest = 0;
  int _columns = 1;
  Timer? _pickTimer;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get holdsBack => _open != null;

  @override
  void releaseBack() => _close();

  // A title that left the list, like after a scope change, takes its panel
  // with it, so Back isn't held by a panel that isn't showing.
  @override
  void contentChanged() {
    if (!vm.paneItems.any((item) => item.id == _open)) _open = null;
    super.contentChanged();
  }

  @override
  void dispose() {
    _pickTimer?.cancel();
    super.dispose();
  }

  bool get _listView => prefs.get(
    UserPreferences.bookLibraryListView,
  );

  bool get _showsContinue =>
      style == BookLibraryStyle.bookstore &&
      vm.scope == BookScope.all &&
      vm.genre == null &&
      (vm.resumeRow?.items.isNotEmpty ?? false);

  /// Runs [pick] once the D-pad stops on a pill, since pill tabs pick on
  /// every arrow press.
  void _pickSoon(VoidCallback pick) {
    _pickTimer?.cancel();
    _pickTimer = Timer(const Duration(milliseconds: 400), pick);
  }

  void _select(AggregatedItem item, int index) {
    if (_open == item.id) {
      _close();
      return;
    }
    final request = ++_detailsRequest;
    setState(() {
      _open = item.id;
      _details = null;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final row = sectionKey('title:row:${index - index % _columns}');
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
      Map<String, dynamic>? details;
      try {
        details = await GetIt.instance<MediaServerClient>().itemsApi.getItem(
          item.id,
        );
      } catch (e) {
        debugPrint('Failed to load the book details: $e');
      }
      if (!mounted || request != _detailsRequest) return;
      setState(() => _details = details);
    }());
  }

  void _close() {
    final open = _open;
    if (open == null) return;
    _detailsRequest++;
    final index = vm.paneItems.indexWhere((item) => item.id == open);
    setState(() => _open = null);
    if (index >= 0) node('title:$index').requestFocus();
  }

  void _setSort(LibrarySortBy sort) {
    vm.setTitleSort(sort);
    unawaited(
      prefs.set(bookTitleSortPref(libraryId), sort),
    );
  }

  Future<void> _pickGenre(AppLocalizations l10n) async {
    final genres = vm.titlesByGenre.keys.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    final picked = await showSettingsPicker<String>(
      context,
      title: l10n.musicGenreFilterTitle,
      values: ['', ...genres],
      current: vm.genre ?? '',
      labelOf: (genre) => genre.isEmpty ? l10n.allGenres : genre,
    );
    if (!mounted || picked == null || picked == (vm.genre ?? '')) return;
    vm.setGenre(picked.isEmpty ? null : picked);
  }

  Future<void> _toggleFavorite(AggregatedItem item) async {
    final next = !(_favorites[item.id] ?? item.isFavorite);
    setState(() => _favorites[item.id] = next);
    try {
      await GetIt.instance<ItemMutationRepository>().setFavorite(
        item.id,
        isFavorite: next,
      );
    } catch (e) {
      debugPrint('Failed to change the favorite: $e');
      if (mounted) setState(() => _favorites[item.id] = !next);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) => buildSections(
          () => _addSections(l10n, constraints.maxWidth),
          onRefresh: vm.load,
          header: () => _buildHeader(l10n),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final scopes = style != BookLibraryStyle.bookstore && vm.isMixedLibrary
        ? vm.availableScopes
        : const <BookScope>[];
    final count = vm.titleCountFor(vm.scope);
    final sortIndex = _sorts.indexOf(vm.titleSort);
    bool vertical(bool isUp) {
      move(headerIndex, isUp);
      return true;
    }

    return buildHeader(
      title: bookScopeTitle(l10n, vm.scope),
      count: vm.genre == null && count > 0
          ? l10n.spotlightTitlesCount(count)
          : null,
      firstNode: node(scopes.isEmpty ? 'sort' : 'scope'),
      controls: [
        if (scopes.isNotEmpty)
          SlidingPillTabs(
            labels: [for (final scope in scopes) bookScopeTitle(l10n, scope)],
            selectedIndex: scopes.indexOf(vm.scope).clamp(0, scopes.length - 1),
            focusNode: node('scope'),
            onChanged: (index) => _pickSoon(() => vm.setScope(scopes[index])),
            onVerticalNavigation: vertical,
            onExitLeft: leaveLeft,
            onExitRight: node('sort').requestFocus,
          ),
        SlidingPillTabs(
          labels: [for (final sort in _sorts) librarySortLabel(sort, l10n)],
          selectedIndex: sortIndex < 0 ? 0 : sortIndex,
          focusNode: node('sort'),
          onChanged: (index) => _pickSoon(() => _setSort(_sorts[index])),
          onVerticalNavigation: vertical,
          onExitLeft: scopes.isEmpty ? leaveLeft : node('scope').requestFocus,
          onExitRight: node('filter').requestFocus,
        ),
        MusicPillButton(
          focusNode: node('filter'),
          icon: Icons.filter_list_rounded,
          iconColor: vm.genre == null ? null : AppColorScheme.accent,
          label: vm.genre ?? l10n.musicFilter,
          onTap: () => unawaited(_pickGenre(l10n)),
          onNavigateUp: () => move(headerIndex, true),
          onNavigateDown: () => move(headerIndex, false),
          onNavigateLeft: node('sort').requestFocus,
          onNavigateRight: () {},
        ),
      ],
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    if (_showsContinue) _addContinue();
    final items = vm.paneItems;
    if (items.isEmpty) {
      vm.paneLoading ? addLoadingSection() : addEmptySection();
      return;
    }
    final onNearEnd = vm.paneHasMore ? vm.loadMorePane : null;
    if (_listView) {
      _addList(l10n, items, onNearEnd);
    } else {
      final columns = columnsFor(width);
      _columns = columns;
      final cell = cellWidth(width, columns);
      final open = items.indexWhere((item) => item.id == _open);
      addTitleGrid(
        id: 'title',
        items: items,
        columns: columns,
        cell: cell,
        formatBadges: vm.scope == BookScope.all && vm.isMixedLibrary,
        onSelect: _select,
        onNearEnd: onNearEnd,
        downFrom: (index) => open >= 0 && index ~/ columns == open ~/ columns
            ? () {
                node('panel:read').requestFocus();
                reveal(node('panel:read'));
              }
            : null,
        after: (start, end) {
          if (open < start || open >= end) return;
          addSection(
            _buildPanel(
              l10n,
              items[open],
              caretCenter:
                  inset + (open - start) * (cell + gridSpacing) + cell / 2,
              cardIndex: open,
              below: end < items.length ? node('title:$end') : null,
            ),
          );
        },
      );
    }
    if (vm.paneLoading) addLoadingSection();
  }

  void _addContinue() {
    final row = vm.resumeRow!;
    final stop = addStop(
      RowFocusEntry.row(
        rowKey('continue'),
        containerKey: sectionKey('continue'),
      ),
    );
    addSection(
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: BookShelfRow(
          key: const ValueKey('bookContinue'),
          row: row,
          title: row.title,
          hubKey: 'books_${libraryId}_resume',
          rowKey: rowKey('continue'),
          containerKey: sectionKey('continue'),
          tileWidth: wide ? 340 : 300,
          leadingInset: inset,
          onVerticalNavigation: (isUp) => move(stop, isUp),
          onLeftEdge: leaveLeft,
          onItemTap: openItem,
          onItemPlay: (item) => readOrListenBook(
            context,
            item,
            isAudiobook: vm.isAudiobookItem(item),
          ),
          onItemLongPress: showItemMenu,
          imageUrlFor: vm.bookImageUrl,
          subtitleFor: vm.bookSubtitle,
          isAudiobookFor: vm.isAudiobookItem,
          remainingFor: vm.remainingFor,
        ),
      ),
    );
  }

  void _addList(
    AppLocalizations l10n,
    List<AggregatedItem> items,
    VoidCallback? onNearEnd,
  ) {
    final stop = addStop(
      RowFocusEntry.node(node('title:0'), containerKey: sectionKey('title:0')),
    );
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final isAudio = vm.isAudiobookItem(item);
      final pct = item.playedPercentage ?? 0;
      final focus = node('title:$i');
      Widget tile = BookListTile(
        title: item.name,
        subtitle: vm.bookSubtitle(item),
        imageUrl: vm.bookImageUrl(item),
        isAudio: isAudio,
        isComic: vm.isComicItem(item),
        progress: pct > 0 ? (pct / 100).clamp(0.0, 1.0) : null,
        meta: bookProgressMeta(
          l10n,
          isAudiobook: isAudio,
          playedPercentage: pct,
          remaining: isAudio ? vm.remainingFor(item) : null,
        ),
        focusNode: focus,
        onKeyEvent: (_, event) => gridKey(
          event,
          id: 'title',
          index: i,
          count: items.length,
          columns: 1,
          stop: stop,
        ),
        onTap: () => openItem(item),
        onLongPress: () => showItemMenu(item),
      );
      if (onNearEnd != null && i == math.max(0, items.length - 4)) {
        tile = MusicNearEnd(onBuilt: onNearEnd, child: tile);
      }
      addSection(
        Padding(
          key: sectionKey('title:$i'),
          padding: EdgeInsets.fromLTRB(inset, i == 0 ? 8 : 0, endInset, 0),
          child: tile,
        ),
      );
    }
  }

  Widget _buildPanel(
    AppLocalizations l10n,
    AggregatedItem item, {
    required double caretCenter,
    required int cardIndex,
    required FocusNode? below,
  }) {
    final onSurface = AppColorScheme.onSurface;
    final fill = onSurface.withValues(alpha: 0.06);
    final isAudio = vm.isAudiobookItem(item);
    final pct = item.playedPercentage ?? 0;
    final started = pct > 0 && !item.isPlayed;
    final details = _details;
    final genres = (details?['Genres'] as List?)?.whereType<String>();
    final overview = (details?['Overview'] as String?)
        ?.replaceAll(RegExp(r'<[^>]*>'), '')
        .trim();
    final year = item.productionYear ?? details?['ProductionYear'] as int?;
    final series = item.seriesName;
    final favorite = _favorites[item.id] ?? item.isFavorite;
    final format = isAudio
        ? l10n.bookFormatAudiobook
        : vm.isComicItem(item)
        ? l10n.bookFormatComic
        : l10n.bookFormatBook;
    void up() => node('title:$cardIndex').requestFocus();
    void down() => below?.requestFocus();

    final buttons = [
      MusicPillButton(
        focusNode: node('panel:read'),
        icon: isAudio ? Icons.headphones_rounded : Icons.menu_book_rounded,
        label: started
            ? (isAudio ? l10n.continueListening : l10n.continueReading)
            : (isAudio ? l10n.bookHeroListen : l10n.bookHeroRead),
        primary: true,
        onTap: () => readOrListenBook(context, item, isAudiobook: isAudio),
        onNavigateUp: up,
        onNavigateDown: down,
        onNavigateLeft: leaveLeft,
      ),
      MusicPillButton(
        focusNode: node('panel:details'),
        icon: Icons.info_outline_rounded,
        label: l10n.details,
        onTap: () => openItem(item),
        onNavigateUp: up,
        onNavigateDown: down,
      ),
      MusicPillButton(
        focusNode: node('panel:favorite'),
        icon: favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        iconColor: favorite ? AppColorScheme.accent : null,
        semanticLabel: l10n.favorite,
        onTap: () => unawaited(_toggleFavorite(item)),
        onNavigateUp: up,
        onNavigateDown: down,
        onNavigateRight: () {},
      ),
    ];

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          [format, ?genres?.firstOrNull].join(' · ').toUpperCase(),
          style: musicEyebrowStyle(),
        ),
        const SizedBox(height: 6),
        Text(
          item.name,
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
            vm.bookSubtitle(item),
            if (year != null) '$year',
            if (series != null && series.isNotEmpty)
              item.indexNumber == null
                  ? series
                  : '$series #${item.indexNumber}',
          ].where((part) => part.isNotEmpty).join(' · '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            color: onSurface.withValues(alpha: 0.75),
          ),
        ),
        if (overview != null && overview.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: onSurface.withValues(alpha: 0.82),
            ),
          ),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: ClipRRect(
                  borderRadius: AppRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: item.isPlayed ? 1 : (pct / 100).clamp(0.0, 1.0),
                    minHeight: 4,
                    backgroundColor: onSurface.withValues(alpha: 0.16),
                    color: AppColorScheme.accent,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                bookProgressMeta(
                      l10n,
                      isAudiobook: isAudio,
                      playedPercentage: pct,
                      remaining: isAudio ? vm.remainingFor(item) : null,
                    ) ??
                    '',
                style: TextStyle(
                  fontSize: 13,
                  color: onSurface.withValues(alpha: 0.65),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Wrap(spacing: 10, runSpacing: 10, children: buttons),
      ],
    );

    final cover = SizedBox(
      width: wide ? 150 : 110,
      child: AspectRatio(
        aspectRatio: isAudio ? 1 : 2 / 3,
        child: ClipRRect(
          borderRadius: AppRadius.circular(8),
          child: musicArt(
            vm.bookImageUrl(item),
            icon: isAudio ? Icons.headphones_rounded : Icons.menu_book_rounded,
          ),
        ),
      ),
    );

    return Padding(
      key: sectionKey('title:panel'),
      padding: EdgeInsets.fromLTRB(inset, 4, endInset, gridSpacing + 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            decoration: BoxDecoration(
              color: fill,
              borderRadius: AppRadius.circular(16),
            ),
            // A phone is too narrow for the cover beside the text, so it sits
            // above it.
            child: wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cover,
                      const SizedBox(width: 28),
                      Expanded(child: info),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [cover, const SizedBox(height: 16), info],
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
