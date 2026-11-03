import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/book/book_category_nav.dart';
import '../../widgets/book/book_empty_state.dart';
import '../../widgets/book/book_format_badge.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/book/book_scope_filter.dart';
import '../../widgets/book/book_see_all_button.dart';
import '../../widgets/book/classic/book_card.dart';
import '../../widgets/book/reading_room/reading_room_continue_card.dart';
import '../../widgets/book/reading_room/reading_room_tiles.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/focus/can_claim_initial_focus.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/left_sidebar.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/offline_aware_image.dart';
import '../../widgets/skeleton/skeleton_library_grid.dart';
import '../../widgets/top_toolbar.dart';

/// The Reading Room book library: what's being read on large Continue cards
/// over shelves of recent titles and series, then authors and genres.
class ReadingRoomBookScreen extends StatefulWidget {
  final String libraryId;
  final String? collectionType;

  const ReadingRoomBookScreen({
    super.key,
    required this.libraryId,
    this.collectionType,
  });

  @override
  State<ReadingRoomBookScreen> createState() => _ReadingRoomBookScreenState();
}

class _ReadingRoomBookScreenState extends State<ReadingRoomBookScreen> {
  late final BookBrowseViewModel _vm;
  final _prefs = GetIt.instance<UserPreferences>();

  final _coordinator = RowFocusCoordinator();
  // Never attached. As the initial focus target it keeps RequestInitialFocus
  // from parking focus in the sidebar before the content loads, and
  // _onChanged lands focus on the content once it does.
  final _initialFocusNode = FocusNode(debugLabel: 'bookInitialContent');
  bool _landedOnContent = false;
  int _headerIndex = -1;

  /// D-pad focus is on the focused Continue card's button, not the card.
  bool _onContinueButton = false;

  final _searchFocusNode = FocusNode(debugLabel: 'bookSearch');
  final _scopeFocusNode = FocusNode(debugLabel: 'bookScopeFilter');
  final _browseAllFocusNode = FocusNode(debugLabel: 'bookBrowseAll');
  final Map<String, FocusNode> _tileNodes = {};
  final _continueRowKey = GlobalKey<LockedFocusRowState>();
  final _recentRowKey = GlobalKey<LockedFocusRowState>();
  final _seriesRowKey = GlobalKey<LockedFocusRowState>();
  final _headerKey = GlobalKey();
  final _navKey = GlobalKey();
  final Map<String, FocusNode> _navNodes = {};
  final _continueKey = GlobalKey();
  final _scopeKey = GlobalKey();
  final _recentKey = GlobalKey();
  final _seriesKey = GlobalKey();
  final _authorsKey = GlobalKey();
  final _genresKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // The default sort is newest first, so the first title page is the
    // Recently added shelf.
    _vm = BookBrowseViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
      collectionType: widget.collectionType,
    );
    _vm.addListener(_onChanged);
    _prefs.addListener(_onChanged);
    _vm.load();
  }

  @override
  void dispose() {
    _prefs.removeListener(_onChanged);
    _vm.removeListener(_onChanged);
    _vm.dispose();
    _initialFocusNode.dispose();
    for (final node in _navNodes.values) {
      node.dispose();
    }
    _searchFocusNode.dispose();
    _scopeFocusNode.dispose();
    _browseAllFocusNode.dispose();
    for (final node in _tileNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    setState(() {});
    if (!PlatformDetection.useMobileUi && !_vm.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted ||
            _vm.isLoading ||
            !canClaimInitialFocus(context) ||
            LeftSidebar.isFocusedNotifier.value ||
            TopToolbar.isFocusedNotifier.value) {
          return;
        }
        // The first load lands under the header. After that, an update only
        // steps in when a rebuild took the focused card away, never while
        // the viewer is somewhere on the page.
        if (_landedOnContent && !bookFocusIsLost) return;
        _landedOnContent = true;
        if (!_coordinator.moveVertical(fromIndex: _headerIndex, isUp: false)) {
          _coordinator.focusFirst();
        }
      });
    }
  }

  bool get _wide => !PlatformDetection.useMobileUi;

  FocusNode _tileNode(String id) =>
      _tileNodes.putIfAbsent(id, () => FocusNode(debugLabel: 'bookTile:$id'));

  void _openItem(AggregatedItem item) =>
      openBookLibraryItem(context, item, libraryId: widget.libraryId);

  void _readOrListen(AggregatedItem item) =>
      readOrListenBook(context, item, isAudiobook: _vm.isAudiobookItem(item));

  void _onItemLongPress(AggregatedItem item) {
    if (item.type == 'BookSeries') return;
    showContextMenu(context, item, onChanged: () => setState(() {}));
  }

  bool _move(int fromIndex, bool isUp) =>
      moveBookFocus(_coordinator, fromIndex, isUp);

  FocusNode _navNode(String id) =>
      _navNodes.putIfAbsent(id, () => FocusNode(debugLabel: 'bookNav:$id'));

  void _open(BookNavPlace place) =>
      openBookPlace(context, widget.libraryId, place);

  void _browseAll() =>
      _open((kind: BookCategoryKind.titles, scope: _vm.scope));

  String _stats(AppLocalizations l10n) => [
    l10n.spotlightTitlesCount(_vm.titleCount),
    if (_vm.seriesCount > 0) l10n.bookSeriesCount(_vm.seriesCount),
    if (_vm.authorCount > 0) l10n.authorsCount(_vm.authorCount),
    if (_vm.genreCount > 0) l10n.genresCount(_vm.genreCount),
  ].join(' · ');

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
    targetNode: _initialFocusNode,
    child: Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        activeRoute: '/books/${widget.libraryId}',
        showBackButton: true,
        child: _vm.isLoading
            ? const SkeletonLibraryGrid(cardWidth: 160, aspectRatio: 2 / 3)
            : RefreshIndicator(
                onRefresh: _vm.load,
                child: BottomNavPadded(
                  fallback: 120,
                  builder: (_, bottom) => ListView(
                    padding: EdgeInsets.only(bottom: bottom + 24),
                    children: _buildSections(context),
                  ),
                ),
              ),
      ),
    ),
  );

  List<Widget> _buildSections(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final wide = _wide;
    final inset = (wide ? 48.0 : 16.0) + bookSidebarInset;
    final resumeRow = _vm.resumeRow;
    final resume = resumeRow?.items ?? const <AggregatedItem>[];
    final recent = _vm.paneItems.take(20).toList();
    final series = _vm.allSeries;
    final authors = _vm.authorPreview;
    final genres = _vm.genrePreview;
    final showScope = _vm.isMixedLibrary;
    final showBrowseAll = wide && _vm.titleCount > 0;
    final headerNode = wide ? _searchFocusNode : null;

    var next = 0;
    int slot(bool present) => present ? next++ : -1;
    final navIndex = slot(true);
    final headerIndex = _headerIndex = headerNode == null
        ? navIndex
        : slot(true);
    final continueIndex = slot(resume.isNotEmpty);
    final scopeIndex = slot(showScope || showBrowseAll);
    final recentIndex = slot(recent.isNotEmpty);
    final seriesIndex = slot(series.isNotEmpty);
    final authorsIndex = slot(authors.isNotEmpty);
    final genresIndex = slot(genres.isNotEmpty);
    _coordinator.entries = [
      RowFocusEntry.node(_navNode('overview'), containerKey: _navKey),
      if (headerNode != null)
        RowFocusEntry.node(headerNode, containerKey: _headerKey),
      if (resume.isNotEmpty)
        RowFocusEntry.row(_continueRowKey, containerKey: _continueKey),
      if (scopeIndex >= 0)
        RowFocusEntry.node(
          showScope ? _scopeFocusNode : _browseAllFocusNode,
          containerKey: _scopeKey,
        ),
      if (recent.isNotEmpty)
        RowFocusEntry.row(_recentRowKey, containerKey: _recentKey),
      if (series.isNotEmpty)
        RowFocusEntry.row(_seriesRowKey, containerKey: _seriesKey),
      if (authors.isNotEmpty)
        RowFocusEntry.node(_tileNode('author:0'), containerKey: _authorsKey),
      if (genres.isNotEmpty)
        RowFocusEntry.node(_tileNode('genre:0'), containerKey: _genresKey),
    ];

    final header = KeyedSubtree(
      key: _headerKey,
      child: _buildHeader(l10n, inset, navIndex, headerIndex),
    );
    final backdropUrl = wide &&
            resume.isNotEmpty &&
            !_prefs.get(UserPreferences.hideBackdropsInLibraries)
        ? _vm.bookImageUrl(resume.first)
        : null;
    final continueShelf = resume.isEmpty
        ? null
        : _buildContinue(l10n, resumeRow!, inset, continueIndex);

    return [
      Stack(
        children: [
          if (backdropUrl != null)
            Positioned.fill(child: _Backdrop(imageUrl: backdropUrl)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [header, ?continueShelf],
          ),
        ],
      ),
      if (_vm.titleCount == 0 && resume.isEmpty)
        const BookEmptyState()
      else ...[
        if (scopeIndex >= 0)
          _buildScopeRow(l10n, inset, showScope, showBrowseAll, scopeIndex),
        if (recent.isNotEmpty) _buildRecent(l10n, recent, inset, recentIndex),
        if (series.isNotEmpty) _buildSeries(l10n, series, inset, seriesIndex),
        _buildPeopleAndGenres(
          l10n,
          authors,
          genres,
          inset,
          authorsIndex,
          genresIndex,
        ),
      ],
    ];
  }

  Widget _buildHeader(
    AppLocalizations l10n,
    double inset,
    int navIndex,
    int headerIndex,
  ) {
    final wide = _wide;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.65);
    final title = Text(
      _vm.libraryName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: readingRoomSerif(wide ? 52 : 34).copyWith(letterSpacing: -0.5),
    );
    final stats = Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        _stats(l10n),
        style: TextStyle(fontSize: wide ? 15 : 13, color: muted),
      ),
    );
    final top = MediaQuery.paddingOf(context).top + 56;
    final nav = Padding(
      key: _navKey,
      padding: const EdgeInsets.only(bottom: 18),
      child: BookCategoryChips(
        entries: bookOverviewNavEntries(
          l10n,
          _vm,
          place: (kind: null, scope: _vm.scope),
          onSelect: _open,
        ),
        focusNodeFor: _navNode,
        edges: BookNavEdges(
          up: () => _move(navIndex, true),
          down: () => _move(navIndex, false),
          left: focusBookSidebar,
        ),
      ),
    );

    if (!wide) {
      return Padding(
        padding: EdgeInsets.fromLTRB(inset, top + 4, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [nav, title, stats],
        ),
      );
    }

    final search = FocusableWrapper(
      focusNode: _searchFocusNode,
      borderRadius: 22,
      disableScale: true,
      onSelect: () =>
          context.push(Destinations.searchInLibrary(widget.libraryId)),
      onNavigateLeft: focusBookSidebar,
      onNavigateUp: () => _move(headerIndex, true),
      onNavigateDown: () => _move(headerIndex, false),
      onNavigateRight: () {},
      child: Container(
        width: 260,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.06),
          borderRadius: AppRadius.circular(22),
          border: Border.all(
            color: AppColorScheme.onSurface.withValues(alpha: 0.14),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded, size: 20, color: muted),
            const SizedBox(width: 10),
            Text(
              _vm.isAudiobookLibrary ? l10n.searchAudiobooks : l10n.searchBooks,
              style: TextStyle(fontSize: 14, color: muted),
            ),
          ],
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(inset, top + 16, 48, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          nav,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [title, stats],
                ),
              ),
              const SizedBox(width: 32),
              search,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContinue(
    AppLocalizations l10n,
    HomeRow resumeRow,
    double inset,
    int entryIndex,
  ) {
    final wide = _wide;
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Three cards fill a wide row, the rest scroll.
    final cardWidth = wide
        ? ((screenWidth - inset - 48 - 40) / 3).clamp(360.0, 520.0)
        : 306.0;
    final count = resumeRow.totalCount > 0
        ? resumeRow.totalCount
        : resumeRow.items.length;
    return ReadingRoomShelf(
      title: _vm.isAudiobookLibrary
          ? l10n.continueListening
          : l10n.continueReading,
      caption: l10n.bookInProgressCount(count),
      items: resumeRow.items,
      hubKey: 'books_${widget.libraryId}_continue',
      rowKey: _continueRowKey,
      containerKey: _continueKey,
      itemExtent: cardWidth,
      height: ReadingRoomContinueCard.heightFor(large: wide) + 12,
      leadingInset: inset,
      large: wide,
      onSelect: (item) =>
          _onContinueButton ? _readOrListen(item) : _openItem(item),
      onLongPress: _onItemLongPress,
      // Down from a card steps onto its button before leaving the row, and
      // Up from the button steps back.
      onVerticalNavigation: (isUp) {
        if (isUp == _onContinueButton) {
          setState(() => _onContinueButton = !isUp);
          return true;
        }
        return _move(entryIndex, isUp);
      },
      onLeftEdge: focusBookSidebar,
      onFocusChange: (hasFocus) {
        if (!hasFocus && _onContinueButton) {
          setState(() => _onContinueButton = false);
        }
      },
      itemBuilder: (context, item, index, focused) {
        final isAudio = _vm.isAudiobookItem(item);
        final pct = item.playedPercentage ?? 0;
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: cardWidth,
            child: ReadingRoomContinueCard(
              eyebrow: isAudio
                  ? l10n.bookFormatAudiobook
                  : (_vm.isComicItem(item)
                        ? l10n.bookFormatComic
                        : l10n.bookFormatBook),
              title: item.name,
              subtitle: _vm.bookSubtitle(item),
              imageUrl: _vm.bookImageUrl(item),
              isAudio: isAudio,
              progress: (pct / 100).clamp(0.0, 1.0),
              meta: bookProgressMeta(
                l10n,
                isAudiobook: isAudio,
                playedPercentage: pct,
                remaining: isAudio ? _vm.remainingFor(item) : null,
              ),
              ctaLabel: isAudio ? l10n.bookHeroListen : l10n.bookHeroRead,
              large: wide,
              focused: focused && !_onContinueButton,
              buttonFocused: focused && _onContinueButton,
              onTap: () => _openItem(item),
              onPlay: () => _readOrListen(item),
              onLongPress: () => _onItemLongPress(item),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScopeRow(
    AppLocalizations l10n,
    double inset,
    bool showScope,
    bool showBrowseAll,
    int entryIndex,
  ) {
    final browseAll = FocusableWrapper(
      focusNode: _browseAllFocusNode,
      borderRadius: 20,
      disableScale: true,
      onSelect: _browseAll,
      onNavigateLeft: showScope
          ? _scopeFocusNode.requestFocus
          : focusBookSidebar,
      onNavigateUp: () => _move(entryIndex, true),
      onNavigateDown: () => _move(entryIndex, false),
      onNavigateRight: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.bookBrowseAllTitles(_vm.titleCountFor(_vm.scope)),
              style: TextStyle(
                fontSize: 14,
                color: AppColorScheme.onSurface.withValues(alpha: 0.75),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: AppColorScheme.onSurface.withValues(alpha: 0.75),
            ),
          ],
        ),
      ),
    );
    return Padding(
      key: _scopeKey,
      padding: EdgeInsets.fromLTRB(inset, _wide ? 32 : 24, 40, 0),
      child: Row(
        children: [
          if (showScope)
            Flexible(
              child: BookScopeFilter(
                value: _vm.scope,
                onChanged: _vm.setScope,
                availableScopes: _vm.availableScopes,
                focusNode: _scopeFocusNode,
                onVerticalNavigation: (isUp) => _move(entryIndex, isUp),
                onExitLeft: focusBookSidebar,
                onExitRight: showBrowseAll
                    ? _browseAllFocusNode.requestFocus
                    : null,
              ),
            ),
          if (showBrowseAll) ...[
            const Spacer(),
            browseAll,
          ],
        ],
      ),
    );
  }

  Widget _buildRecent(
    AppLocalizations l10n,
    List<AggregatedItem> recent,
    double inset,
    int entryIndex,
  ) {
    final cardWidth = _wide ? 160.0 : 120.0;
    final expansion = _prefs.get(UserPreferences.cardFocusExpansion);
    return ReadingRoomShelf(
      title: l10n.recentlyAdded,
      onSeeAll: _browseAll,
      seeAllFocusNode: _tileNode('seeAll:recent'),
      items: recent,
      hubKey: 'books_${widget.libraryId}_recent_${_vm.scope.name}',
      rowKey: _recentRowKey,
      containerKey: _recentKey,
      itemExtent: cardWidth,
      height: cardWidth * 1.5 + 60,
      leadingInset: inset,
      large: _wide,
      headroom: MediaCard.focusHeadroom(cardWidth * 1.5, expansion: expansion),
      onSelect: _openItem,
      onLongPress: _onItemLongPress,
      onVerticalNavigation: (isUp) => _move(entryIndex, isUp),
      onLeftEdge: focusBookSidebar,
      itemBuilder: (context, item, index, focused) {
        final isAudio = _vm.isAudiobookItem(item);
        return Align(
          alignment: Alignment.topLeft,
          child: BookCard(
            item: item,
            isAudiobook: isAudio,
            isComic: _vm.isComicItem(item),
            subtitle: _vm.bookSubtitle(item),
            imageUrl: _vm.bookImageUrl(item),
            width: cardWidth,
            remaining: isAudio ? _vm.remainingFor(item) : null,
            remainingIsTotal: (item.playedPercentage ?? 0) <= 0,
            showFormatBadge: _vm.isMixedLibrary,
            externalIsFocused: focused,
            cardFocusExpansion: expansion,
            onTap: () => _openItem(item),
            onLongPress: () => _onItemLongPress(item),
          ),
        );
      },
    );
  }

  Widget _buildSeries(
    AppLocalizations l10n,
    List<AggregatedItem> series,
    double inset,
    int entryIndex,
  ) {
    final coverWidth = _wide ? 140.0 : 100.0;
    final fan = ReadingRoomSeriesTile.fanFor(coverWidth);
    return ReadingRoomShelf(
      title: l10n.series,
      onSeeAll: () =>
          _open((kind: BookCategoryKind.series, scope: BookScope.all)),
      seeAllFocusNode: _tileNode('seeAll:series'),
      items: series,
      hubKey: 'books_${widget.libraryId}_series',
      rowKey: _seriesRowKey,
      containerKey: _seriesKey,
      itemExtent: coverWidth + fan * 2,
      height: coverWidth * 1.5 + fan * 0.8 + 62,
      leadingInset: inset,
      large: _wide,
      onSelect: _openItem,
      onVerticalNavigation: (isUp) => _move(entryIndex, isUp),
      onLeftEdge: focusBookSidebar,
      itemBuilder: (context, item, index, focused) {
        final covers = _vm.seriesCoverUrls(item);
        final fallback = _vm.bookImageUrl(item);
        return Align(
          alignment: Alignment.topLeft,
          child: ReadingRoomSeriesTile(
            name: item.name,
            countLabel: l10n.bookSeriesItemCount(item.childCount ?? 0),
            coverUrls: covers.isEmpty && fallback != null ? [fallback] : covers,
            coverWidth: coverWidth,
            focused: focused,
            onTap: () => _openItem(item),
          ),
        );
      },
    );
  }

  Widget _buildPeopleAndGenres(
    AppLocalizations l10n,
    List<AggregatedItem> authors,
    List<AggregatedItem> genres,
    double inset,
    int authorsIndex,
    int genresIndex,
  ) {
    final wide = _wide;
    const authorColumns = 2;
    final genreColumns = wide ? 3 : 2;
    // On wide layouts Genres sits right of Authors, so Left from its first
    // column reaches the authors rather than the sidebar.
    final genresBesideAuthors = wide && authors.isNotEmpty;
    final genresSeeAll = _tileNode('seeAll:genres');

    VoidCallback? up(int i, int columns, VoidCallback leave) =>
        i < columns ? leave : null;
    VoidCallback? down(int i, int columns, int count, int entry) =>
        i + columns >= count ? () => _move(entry, false) : null;

    final authorsSection = authors.isEmpty
        ? null
        : _GridSection(
            key: _authorsKey,
            title: l10n.authors,
            columns: authorColumns,
            children: [
              for (var i = 0; i < authors.length; i++)
                ReadingRoomAuthorPill(
                  name: authors[i].name,
                  countLabel: switch (_vm.authorTitleCount(authors[i])) {
                    0 => null,
                    final n => l10n.spotlightTitlesCount(n),
                  },
                  imageUrl: _vm.bookImageUrl(authors[i]),
                  focusNode: _tileNode('author:$i'),
                  onTap: () => _openItem(authors[i]),
                  onNavigateUp: up(
                    i,
                    authorColumns,
                    () => _move(authorsIndex, true),
                  ),
                  onNavigateDown: down(
                    i,
                    authorColumns,
                    authors.length,
                    authorsIndex,
                  ),
                  onNavigateLeft: i % authorColumns == 0
                      ? focusBookSidebar
                      : null,
                ),
            ],
          );
    final genresSection = genres.isEmpty
        ? null
        : _GridSection(
            key: _genresKey,
            title: l10n.genres,
            seeAll: BookSeeAllButton(
              onPressed: () =>
                  _open((kind: BookCategoryKind.genres, scope: BookScope.all)),
              focusNode: genresSeeAll,
              onNavigateUp: () => _move(
                genresBesideAuthors ? authorsIndex : genresIndex,
                true,
              ),
              onNavigateDown: _tileNode('genre:0').requestFocus,
            ),
            columns: genreColumns,
            children: [
              for (var i = 0; i < genres.length; i++)
                ReadingRoomGenreTile(
                  name: genres[i].name,
                  countLabel: switch (genres[i].childCount ?? 0) {
                    0 => null,
                    final n => l10n.spotlightTitlesCount(n),
                  },
                  height: wide ? 102 : 84,
                  focusNode: _tileNode('genre:$i'),
                  onTap: () => _openItem(genres[i]),
                  onNavigateUp: up(i, genreColumns, genresSeeAll.requestFocus),
                  onNavigateDown: down(
                    i,
                    genreColumns,
                    genres.length,
                    genresIndex,
                  ),
                  onNavigateLeft:
                      i % genreColumns == 0 && !genresBesideAuthors
                      ? focusBookSidebar
                      : null,
                ),
            ],
          );

    return Padding(
      padding: EdgeInsets.fromLTRB(inset, 0, wide ? 48 : 16, 0),
      child: wide && authorsSection != null && genresSection != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: authorsSection),
                const SizedBox(width: 48),
                Expanded(child: genresSection),
              ],
            )
          : Column(children: [?authorsSection, ?genresSection]),
    );
  }
}

/// A section heading over a grid of D-pad stops, [columns] across.
class _GridSection extends StatelessWidget {
  final String title;
  final Widget? seeAll;
  final int columns;
  final List<Widget> children;

  const _GridSection({
    super.key,
    required this.title,
    required this.columns,
    required this.children,
    this.seeAll,
  });

  @override
  Widget build(BuildContext context) {
    final large = !PlatformDetection.useMobileUi;
    return Padding(
      padding: EdgeInsets.only(top: large ? 32 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: Text(title, style: readingRoomSerif(large ? 24 : 21)),
                ),
                ?seeAll,
              ],
            ),
          ),
          const SizedBox(height: 10),
          for (var start = 0; start < children.length; start += columns)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  for (var i = start; i < start + columns; i++) ...[
                    if (i > start) const SizedBox(width: 12),
                    Expanded(
                      child: i < children.length
                          ? children[i]
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// The first Continue cover blurred behind the header, fading into the page.
class _Backdrop extends StatelessWidget {
  final String imageUrl;

  const _Backdrop({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final background = AppColorScheme.background;
    final image = OfflineAwareImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
    final sigma = GlassSettings.capSigma(36);
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Without a blur budget a faded image keeps the text readable.
          if (sigma > 0)
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: image,
            )
          else
            Opacity(opacity: 0.35, child: image),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  background.withValues(alpha: 0.2),
                  background.withValues(alpha: 0.75),
                  background,
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
