import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/book_browse_view_model.dart' show BookScope;
import '../../../data/viewmodels/classic_book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/book/book_category_nav.dart';
import '../../widgets/book/book_empty_state.dart';
import '../../widgets/book/book_format_badge.dart' show bookProgressMeta;
import '../../widgets/book/book_navigation.dart';
import '../../widgets/book/classic/book_hero.dart';
import '../../widgets/book/classic/book_scope_filter.dart';
import '../../widgets/book/classic/book_shelf_row.dart';
import '../../widgets/book/classic/book_stats_band.dart';
import '../../widgets/focus/can_claim_initial_focus.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/skeleton/skeleton_library_grid.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/left_sidebar.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/top_toolbar.dart';

class ClassicBookBrowseScreen extends StatefulWidget {
  final String libraryId;
  final String? collectionType;

  const ClassicBookBrowseScreen({
    super.key,
    required this.libraryId,
    this.collectionType,
  });

  @override
  State<ClassicBookBrowseScreen> createState() =>
      _ClassicBookBrowseScreenState();
}

class _ClassicBookBrowseScreenState extends State<ClassicBookBrowseScreen> {
  late final ClassicBookBrowseViewModel _vm;
  final _prefs = GetIt.instance<UserPreferences>();

  final _coordinator = RowFocusCoordinator();
  // Never attached. As the initial focus target it keeps RequestInitialFocus
  // from parking focus in the sidebar before the shelves load, and
  // _onChanged lands focus on the content once they do.
  final _initialFocusNode = FocusNode(debugLabel: 'bookInitialContent');
  bool _landedOnContent = false;
  final _heroCtaFocusNode = FocusNode(debugLabel: 'bookHeroCta');
  final _scopeFocusNode = FocusNode(debugLabel: 'bookScopeFilter');
  final _navFocusNode = FocusNode(debugLabel: 'bookNav');
  final _heroContainerKey = GlobalKey();
  final _scopeContainerKey = GlobalKey();
  final _navContainerKey = GlobalKey();
  final Map<String, GlobalKey<LockedFocusRowState>> _rowKeys = {};
  final Map<String, GlobalKey> _rowContainerKeys = {};
  final Map<String, FocusNode> _seeAllNodes = {};

  @override
  void initState() {
    super.initState();
    _vm = ClassicBookBrowseViewModel(
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
    _heroCtaFocusNode.dispose();
    _scopeFocusNode.dispose();
    _navFocusNode.dispose();
    for (final node in _seeAllNodes.values) {
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
        // The first load lands on the top of the content. After that, an
        // update only steps in when a rebuild took the focused card away,
        // never while the viewer is somewhere on the page.
        if (_landedOnContent && !bookFocusIsLost) return;
        _landedOnContent = true;
        if (_vm.featuredItem != null) {
          _heroCtaFocusNode.requestFocus();
        } else {
          _coordinator.focusFirst();
        }
      });
    }
  }

  double get _cardWidth {
    final scale = PlatformDetection.isTV ? 0.9 : 1.0;
    return 132 * scale;
  }

  void _onItemTap(AggregatedItem item, HomeRow row) {
    if (row.rowType == HomeRowType.genres) {
      final scoped = _vm.scopedTypes;
      context.push(
        Destinations.genre(
          item.name,
          genreId: item.id,
          parentId: widget.libraryId,
          includeType: scoped.length == 1 || _vm.scope != BookScope.all
              ? scoped.first
              : null,
        ),
      );
      return;
    }
    _openItem(item);
  }

  void _openItem(AggregatedItem item) =>
      openBookLibraryItem(context, item, libraryId: widget.libraryId);

  void _onItemLongPress(AggregatedItem item) {
    if (item.type == 'BookSeries') return;
    showContextMenu(context, item, onChanged: () => setState(() {}));
  }

  void _onSeeAll(HomeRow row) {
    final kind = row.rowType == HomeRowType.genres
        ? BookCategoryKind.genres
        : _vm.isSeriesRow(row)
        ? BookCategoryKind.series
        : _vm.isCollectionsRow(row)
        ? BookCategoryKind.collections
        : _vm.isFavoritesRow(row)
        ? BookCategoryKind.favorites
        : BookCategoryKind.titles;
    _open((kind: kind, scope: _vm.seeAllScopeFor(row)));
  }

  void _open(BookNavPlace place) =>
      openBookPlace(context, widget.libraryId, place);

  bool _moveVertical(int fromIndex, bool isUp) =>
      moveBookFocus(_coordinator, fromIndex, isUp);

  GlobalKey<LockedFocusRowState> _rowKey(String rowId) =>
      _rowKeys.putIfAbsent(rowId, GlobalKey<LockedFocusRowState>.new);

  GlobalKey _rowContainerKey(String rowId) =>
      _rowContainerKeys.putIfAbsent(rowId, GlobalKey.new);

  BookShelfVariant _variantFor(HomeRow row) {
    if (row.rowType == HomeRowType.genres) return BookShelfVariant.chip;
    if (row.rowType == HomeRowType.audioArtists) return BookShelfVariant.avatar;
    return BookShelfVariant.poster;
  }

  List<BookStat> _stats(AppLocalizations l10n) => [
    if (_vm.isMixedLibrary) ...[
      if (_vm.bookCount > 0) BookStat(label: l10n.books, count: _vm.bookCount),
      if (_vm.audiobookCount > 0)
        BookStat(label: l10n.audiobooks, count: _vm.audiobookCount),
      if (_vm.comicCount > 0)
        BookStat(label: l10n.comics, count: _vm.comicCount),
    ] else
      BookStat(
        label: _vm.isAudiobookLibrary ? l10n.audiobooks : l10n.books,
        count: _vm.titleCount,
      ),
    BookStat(label: l10n.series, count: _vm.seriesCount),
    BookStat(label: l10n.authors, count: _vm.authorCount),
    BookStat(label: l10n.genres, count: _vm.genreCount),
  ];

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
    targetNode: _initialFocusNode,
    child: _buildContent(context),
  );

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        activeRoute: '/books/${widget.libraryId}',
        showBackButton: true,
        child: _vm.isLoading
            ? const SkeletonLibraryGrid(
                cardWidth: 160,
                aspectRatio: 2 / 3,
              )
            : RefreshIndicator(
                onRefresh: _vm.refresh,
                child: BottomNavPadded(
                  fallback: 120,
                  builder: (_, bottom) => ListView(
                    padding: EdgeInsets.only(bottom: bottom),
                    children: _buildSections(context),
                  ),
                ),
              ),
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final topReserve = MediaQuery.paddingOf(context).top + 56;
    final featured = _vm.featuredItem;
    final showScope = _vm.isMixedLibrary;
    final rows = _vm.rows;

    // Rebuild the vertical focus chain to match this build's composition.
    final entries = <RowFocusEntry>[
      RowFocusEntry.node(_navFocusNode, containerKey: _navContainerKey),
      if (featured != null)
        RowFocusEntry.node(_heroCtaFocusNode, containerKey: _heroContainerKey),
      if (showScope)
        RowFocusEntry.node(_scopeFocusNode, containerKey: _scopeContainerKey),
      for (final row in rows)
        RowFocusEntry.row(
          _rowKey(row.id),
          containerKey: _rowContainerKey(row.id),
        ),
    ];
    _coordinator.entries = entries;
    var entryIndex = 0;
    final navIndex = entryIndex++;
    final heroIndex = featured != null ? entryIndex++ : -1;
    final scopeIndex = showScope ? entryIndex++ : -1;
    final firstRowIndex = entryIndex;

    final nav = Padding(
      key: _navContainerKey,
      padding: EdgeInsets.fromLTRB(16 + bookSidebarInset, 6, 16, 10),
      child: BookCategoryStrip(
        title: _vm.libraryName.isNotEmpty ? _vm.libraryName : l10n.books,
        entries: bookOverviewNavEntries(
          l10n,
          _vm,
          place: (kind: null, scope: _vm.scope),
          onSelect: _open,
        ),
        focusNode: _navFocusNode,
        fontSize: PlatformDetection.useMobileUi ? 20 : 24,
        onVerticalNavigation: (isUp) => _moveVertical(navIndex, isUp),
        onExitLeft: focusBookSidebar,
      ),
    );

    return [
      // The strip sits over the top of the hero, whose backdrop runs up
      // behind the navbar.
      if (featured != null)
        Stack(
          children: [
            KeyedSubtree(
              key: _heroContainerKey,
              child: _buildHero(l10n, featured, topReserve + 56, heroIndex),
            ),
            Positioned(top: topReserve, left: 0, right: 0, child: nav),
          ],
        )
      else ...[
        SizedBox(height: topReserve),
        nav,
      ],
      Padding(
        padding: EdgeInsets.only(left: bookSidebarInset),
        child: BookStatsBand(stats: _stats(l10n)),
      ),
      if (showScope)
        Padding(
          key: _scopeContainerKey,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: BookScopeFilter(
                value: _vm.scope,
                onChanged: _vm.setScope,
                availableScopes: _vm.availableScopes,
                focusNode: _scopeFocusNode,
                onVerticalNavigation: (isUp) =>
                    _moveVertical(scopeIndex, isUp),
              ),
            ),
          ),
        ),
      if (rows.isNotEmpty)
        for (var i = 0; i < rows.length; i++)
          _buildShelf(rows[i], l10n, firstRowIndex + i)
      else
        const BookEmptyState(),
    ];
  }

  Widget _buildHero(
    AppLocalizations l10n,
    AggregatedItem featured,
    double topReserve,
    int heroIndex,
  ) {
    final isAudio = _vm.isAudiobookItem(featured);
    final pct = featured.playedPercentage ?? 0;
    final started = pct > 0;

    final eyebrow = isAudio ? l10n.continueListening : l10n.continueReading;
    final ctaLabel = started
        ? (isAudio ? l10n.continueListening : l10n.continueReading)
        : (isAudio ? l10n.bookHeroListen : l10n.bookHeroRead);

    return BookHero(
      eyebrow: eyebrow,
      title: featured.name,
      subtitle: _vm.bookSubtitle(featured),
      ctaLabel: ctaLabel,
      metaLabel: bookProgressMeta(
        l10n,
        isAudiobook: isAudio,
        playedPercentage: pct,
        remaining: isAudio ? _vm.remainingFor(featured) : null,
      ),
      imageUrl: _vm.bookImageUrl(featured),
      progress: started ? (pct / 100).clamp(0.0, 1.0) : null,
      topInset: topReserve,
      leftInset: bookSidebarInset,
      onPrimary: () =>
          readOrListenBook(context, featured, isAudiobook: isAudio),
      ctaFocusNode: _heroCtaFocusNode,
      onVerticalNavigation: (isUp) => _moveVertical(heroIndex, isUp),
    );
  }

  Widget _buildShelf(HomeRow row, AppLocalizations l10n, int entryIndex) {
    final variant = _variantFor(row);
    return BookShelfRow(
      key: ValueKey(row.id),
      row: row,
      title: localizeHomeRowTitle(row: row, l10n: l10n),
      variant: variant,
      hubKey: 'books_${widget.libraryId}_${row.id}_${_vm.scope.name}',
      rowKey: _rowKey(row.id),
      containerKey: _rowContainerKey(row.id),
      cardWidth: _cardWidth,
      leadingInset: 16 + bookSidebarInset,
      showFormatBadges: _vm.rowCanMixFormats(row),
      onVerticalNavigation: (isUp) => _moveVertical(entryIndex, isUp),
      onLeftEdge: focusBookSidebar,
      onItemTap: (item) => _onItemTap(item, row),
      onItemLongPress: _onItemLongPress,
      onSeeAll: variant == BookShelfVariant.avatar ? null : () => _onSeeAll(row),
      seeAllFocusNode: _seeAllNodes.putIfAbsent(
        row.id,
        () => FocusNode(debugLabel: 'bookSeeAll:${row.id}'),
      ),
      imageUrlFor: _vm.bookImageUrl,
      subtitleFor: _vm.bookSubtitle,
      isAudiobookFor: _vm.isAudiobookItem,
      isComicFor: _vm.isComicItem,
      remainingFor: _vm.remainingFor,
    );
  }
}
