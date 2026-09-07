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
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/book/book_format_badge.dart';
import '../../widgets/book/book_hero.dart';
import '../../widgets/book/book_scope_filter.dart';
import '../../widgets/book/book_segmented_control.dart';
import '../../widgets/book/book_shelf_row.dart';
import '../../widgets/book/book_stats_band.dart';
import '../../widgets/book/discover/book_discover_tab.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/navigation_layout.dart';

class BookBrowseScreen extends StatefulWidget {
  final String libraryId;
  final String? collectionType;

  const BookBrowseScreen({
    super.key,
    required this.libraryId,
    this.collectionType,
  });

  @override
  State<BookBrowseScreen> createState() => _BookBrowseScreenState();
}

class _BookBrowseScreenState extends State<BookBrowseScreen> {
  late final BookBrowseViewModel _vm;
  final _prefs = GetIt.instance<UserPreferences>();
  int _tab = 0;

  final _coordinator = RowFocusCoordinator();
  final _heroCtaFocusNode = FocusNode(debugLabel: 'bookHeroCta');
  final _scopeFocusNode = FocusNode(debugLabel: 'bookScopeFilter');
  final _tabsFocusNode = FocusNode(debugLabel: 'bookTabs');
  final _heroContainerKey = GlobalKey();
  final _scopeContainerKey = GlobalKey();
  final _tabsContainerKey = GlobalKey();
  final Map<String, GlobalKey<LockedFocusRowState>> _rowKeys = {};
  final Map<String, GlobalKey> _rowContainerKeys = {};

  @override
  void initState() {
    super.initState();
    _vm = BookBrowseViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
      collectionType: widget.collectionType,
    );
    _vm.addListener(_onChanged);
    _vm.load();
  }

  @override
  void dispose() {
    _vm.removeListener(_onChanged);
    _vm.dispose();
    _heroCtaFocusNode.dispose();
    _scopeFocusNode.dispose();
    _tabsFocusNode.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
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

  void _openItem(AggregatedItem item) {
    final type = item.type;
    if (type == 'BookSeries') {
      context.push(Destinations.searchWith(item.name));
      return;
    }
    if (type == 'BoxSet') {
      context.push(Destinations.collection(item.id));
      return;
    }
    final isFolder = item.rawData['IsFolder'] as bool? ?? false;
    if (isFolder || type == 'Folder' || type == 'CollectionFolder') {
      context.push(Destinations.folder(item.id, serverId: item.serverId));
      return;
    }
    if (type == 'Book' || item.isComic) {
      context.push(Destinations.book(item.id, serverId: item.serverId));
      return;
    }
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  void _onItemLongPress(AggregatedItem item) {
    if (item.type == 'BookSeries') return;
    showContextMenu(context, item, onChanged: () => setState(() {}));
  }

  void _onSeeAll(HomeRow row) {
    if (row.rowType == HomeRowType.genres) {
      context.push(Destinations.libraryGenresOf(widget.libraryId));
      return;
    }
    context.push(
      Destinations.library(
        widget.libraryId,
        includeItemTypes: _vm.seeAllTypesFor(row),
      ),
    );
  }


  bool _moveVertical(int fromIndex, bool isUp) {
    if (_coordinator.moveVertical(fromIndex: fromIndex, isUp: isUp)) {
      return true;
    }
    if (isUp) {
      final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
      if (focusNavbar != null) {
        focusNavbar();
        return true;
      }
    }
    return false;
  }

  void _onRowLeftEdge() {
    final navbarIsLeft =
        _prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    if (!navbarIsLeft) return;
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

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
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: _vm.isLoading
            ? Center(
                child: CircularProgressIndicator(color: AppColorScheme.accent),
              )
            : RefreshIndicator(
                onRefresh: _vm.refresh,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 120),
                  children: _buildSections(context),
                ),
              ),
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final topReserve = MediaQuery.paddingOf(context).top + 56;
    final featured = _vm.featuredItem;
    final showScope = _vm.isMixedLibrary && _tab == 0;
    final rows = _tab == 0 ? _vm.rows : const <HomeRow>[];

    // Rebuild the vertical focus chain to match this build's composition.
    final entries = <RowFocusEntry>[
      if (featured != null)
        RowFocusEntry.node(_heroCtaFocusNode, containerKey: _heroContainerKey),
      if (showScope)
        RowFocusEntry.node(_scopeFocusNode, containerKey: _scopeContainerKey),
      RowFocusEntry.node(_tabsFocusNode, containerKey: _tabsContainerKey),
      for (final row in rows)
        RowFocusEntry.row(
          _rowKey(row.id),
          containerKey: _rowContainerKey(row.id),
        ),
    ];
    _coordinator.entries = entries;
    var entryIndex = 0;
    final heroIndex = featured != null ? entryIndex++ : -1;
    final scopeIndex = showScope ? entryIndex++ : -1;
    final tabsIndex = entryIndex++;
    final firstRowIndex = entryIndex;

    return [
      if (featured != null)
        KeyedSubtree(
          key: _heroContainerKey,
          child: _buildHero(l10n, featured, topReserve, heroIndex),
        )
      else
        SizedBox(height: topReserve),
      BookStatsBand(stats: _stats(l10n)),
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
      Padding(
        key: _tabsContainerKey,
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
        child: FocusableWrapper(
          focusNode: _tabsFocusNode,
          borderRadius: 22,
          descendantsAreFocusable: false,
          onSelect: () => setState(() => _tab = _tab == 0 ? 1 : 0),
          onNavigateLeft: () {
            if (_tab != 0) setState(() => _tab = 0);
          },
          onNavigateRight: () {
            if (_tab != 1) setState(() => _tab = 1);
          },
          onNavigateUp: () => _moveVertical(tabsIndex, true),
          onNavigateDown: () => _moveVertical(tabsIndex, false),
          child: BookSegmentedControl(
            labels: [l10n.library, l10n.discover],
            selectedIndex: _tab,
            onChanged: (v) => setState(() => _tab = v),
          ),
        ),
      ),
      if (_tab == 0) ...[
        if (rows.isNotEmpty)
          for (var i = 0; i < rows.length; i++)
            _buildShelf(rows[i], l10n, firstRowIndex + i)
        else
          _buildEmptyState(l10n),
      ] else
        BookDiscoverTab(
          libraryId: widget.libraryId,
          isAudiobook: _vm.isAudiobookLibrary,
        ),
    ];
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    final onSurface = AppColorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_stories_outlined,
              size: 56,
              color: onSurface.withValues(alpha: 0.35),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noBooksFound,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: onSurface.withValues(alpha: 0.85),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.noBooksFoundDescription,
              style: TextStyle(
                fontSize: 14,
                color: onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
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

    String? metaLabel;
    if (isAudio) {
      final remaining = _vm.remainingFor(featured);
      if (remaining != null) {
        final label = formatBookDuration(remaining);
        metaLabel = started ? l10n.bookTimeLeft(label) : label;
      }
    } else if (started) {
      metaLabel = l10n.bookPercentRead(pct.round());
    }

    return BookHero(
      eyebrow: eyebrow,
      title: featured.name,
      subtitle: _vm.bookSubtitle(featured),
      ctaLabel: ctaLabel,
      metaLabel: metaLabel,
      imageUrl: _vm.bookImageUrl(featured),
      progress: started ? (pct / 100).clamp(0.0, 1.0) : null,
      topInset: topReserve,
      onPrimary: () => _openItem(featured),
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
      showFormatBadges: _vm.rowCanMixFormats(row),
      onVerticalNavigation: (isUp) => _moveVertical(entryIndex, isUp),
      onLeftEdge: _onRowLeftEdge,
      onItemTap: (item) => _onItemTap(item, row),
      onItemLongPress: _onItemLongPress,
      onSeeAll: variant == BookShelfVariant.avatar ? null : () => _onSeeAll(row),
      imageUrlFor: _vm.bookImageUrl,
      subtitleFor: _vm.bookSubtitle,
      isAudiobookFor: _vm.isAudiobookItem,
      isComicFor: _vm.isComicItem,
      remainingFor: _vm.remainingFor,
    );
  }
}
