import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../navigation/destinations.dart';
import '../../widgets/book/book_browse_nav.dart';
import '../../widgets/book/book_card.dart';
import '../../widgets/book/classic/book_card.dart' as shelf;
import '../../widgets/book/book_category_nav.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/media_card.dart';
import 'book_authors_screen.dart';
import 'book_collections_screen.dart';
import 'book_discover_screen.dart';
import 'book_favorites_screen.dart';
import 'book_genres_screen.dart';
import 'book_series_screen.dart';
import 'book_titles_screen.dart';
import 'library_page_state.dart';
import 'music_category_screen.dart' show MusicNearEnd;

/// Where a book library keeps the sort its titles were last shown in.
EnumPreference<LibrarySortBy> bookTitleSortPref(String libraryId) =>
    UserPreferences.librarySortBy('books_$libraryId');

/// A book library destination, and in Bookstore the library itself. Its rail,
/// strip or chips swap to another destination in place, so Back still returns
/// to the library.
class BookCategoryScreen extends StatefulWidget {
  final String libraryId;
  final BookCategoryKind kind;
  final BookScope? scope;
  final String? collectionType;

  /// Whether this is the library's own screen, which Bookstore opens on its
  /// titles.
  final bool root;

  const BookCategoryScreen({
    super.key,
    required this.libraryId,
    required this.kind,
    this.scope,
    this.collectionType,
    this.root = false,
  });

  @override
  State<BookCategoryScreen> createState() => _BookCategoryScreenState();
}

class _BookCategoryScreenState extends State<BookCategoryScreen> {
  late final BookBrowseViewModel _vm;
  late var _kind = widget.kind;
  bool _switched = false;

  static BookPane _paneFor(BookCategoryKind kind) =>
      kind == BookCategoryKind.collections
      ? BookPane.collections
      : BookPane.titles;

  @override
  void initState() {
    super.initState();
    final prefs = GetIt.instance<UserPreferences>();
    final sortPref = bookTitleSortPref(widget.libraryId);
    final saved = prefs.get(sortPref);
    _vm = BookBrowseViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
      collectionType: widget.collectionType,
      scope: widget.scope ?? BookScope.all,
      pane: _paneFor(_kind),
      titleSort:
          prefs.containsPreference(sortPref) &&
              BookBrowseViewModel.titleSorts.contains(saved)
          ? saved
          : LibrarySortBy.dateAdded,
    );
    unawaited(_vm.load());
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  void _switchTo(BookNavPlace place) {
    final kind = place.kind ?? BookCategoryKind.titles;
    setState(() {
      _kind = kind;
      _switched = true;
    });
    // The scope goes first so a switch onto the titles loads them once.
    if (kind == BookCategoryKind.titles) _vm.setScope(place.scope);
    _vm.setPane(_paneFor(kind));
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    return ListenableBuilder(
      listenable: prefs,
      // Turning Discover off while it's open drops back to the titles.
      builder: (context, _) => _buildKind(
        _kind == BookCategoryKind.discover &&
                !prefs.get(UserPreferences.showBookDiscoverTab)
            ? BookCategoryKind.titles
            : _kind,
      ),
    );
  }

  Widget _buildKind(BookCategoryKind kind) {
    final libraryId = widget.libraryId;
    return BookCategoryScope(
      kind: kind,
      switched: _switched,
      root: widget.root,
      vm: _vm,
      switchTo: _switchTo,
      child: KeyedSubtree(
        key: ValueKey(kind),
        child: switch (kind) {
          BookCategoryKind.titles => BookTitlesScreen(libraryId: libraryId),
          BookCategoryKind.series => BookSeriesScreen(libraryId: libraryId),
          BookCategoryKind.authors => BookAuthorsScreen(libraryId: libraryId),
          BookCategoryKind.genres => BookGenresScreen(libraryId: libraryId),
          BookCategoryKind.collections => BookCollectionsScreen(
            libraryId: libraryId,
          ),
          BookCategoryKind.favorites => BookFavoritesScreen(
            libraryId: libraryId,
          ),
          BookCategoryKind.discover => BookDiscoverScreen(libraryId: libraryId),
        },
      ),
    );
  }
}

/// Which destination is showing, the library it shows, and how the screen
/// swaps to another destination.
class BookCategoryScope extends InheritedWidget {
  final BookCategoryKind kind;

  /// Whether a swap opened this destination, which keeps focus on the nav.
  final bool switched;
  final bool root;
  final BookBrowseViewModel vm;
  final ValueChanged<BookNavPlace> switchTo;

  const BookCategoryScope({
    super.key,
    required this.kind,
    required this.switched,
    required this.root,
    required this.vm,
    required this.switchTo,
    required super.child,
  });

  @override
  bool updateShouldNotify(BookCategoryScope old) =>
      kind != old.kind || switched != old.switched;
}

enum _BookNav { rail, strip, iconChips, chips }

/// What the book destinations share: the library, the style's own rail,
/// strip or chips around the screen, a header, and grids of book cards that
/// build a row at a time.
abstract class BookCategoryState<T extends StatefulWidget>
    extends LibraryPageState<T> {
  late final BookBrowseViewModel vm;
  final prefs = GetIt.instance<UserPreferences>();

  bool get cardFocusExpansion =>
      prefs.get(UserPreferences.cardFocusExpansion);

  BookCategoryScope get _scope =>
      context.getInheritedWidgetOfExactType<BookCategoryScope>()!;

  @override
  String get focusLabel => 'book';

  @override
  String get activeRoute => '/books/$libraryId';

  @override
  bool get isLoading => vm.isLoading;

  BookLibraryStyle get style => prefs.get(UserPreferences.bookLibraryStyle);

  _BookNav get _nav => switch (style) {
    BookLibraryStyle.bookstore => wide ? _BookNav.rail : _BookNav.chips,
    BookLibraryStyle.classic => _BookNav.strip,
    BookLibraryStyle.readingRoom => _BookNav.iconChips,
  };

  BookNavPlace get place => (kind: _scope.kind, scope: vm.scope);

  double get inset =>
      _nav == _BookNav.rail ? 32.0 : (wide ? 48.0 : 20.0) + bookSidebarInset;
  double get endInset => wide ? 48.0 : 20.0;
  double get gridSpacing => wide ? 20 : 12;

  /// Where the nav takes focus: the current place in a rail or chips, or the
  /// strip.
  FocusNode get navNode {
    if (_nav == _BookNav.strip) return node('nav:strip');
    final kind = _scope.kind;
    final id =
        style == BookLibraryStyle.bookstore && kind == BookCategoryKind.titles
        ? 'scope:${vm.scope.name}'
        : kind.name;
    return node('nav:$id');
  }

  /// Whether Back has something of this screen's own to close first, like an
  /// open panel.
  bool get holdsBack => false;

  /// Closes what [holdsBack] keeps open.
  void releaseBack() {}

  @override
  void initState() {
    super.initState();
    vm = _scope.vm;
    vm.addListener(contentChanged);
    prefs.addListener(contentChanged);
    // A destination the nav switched to keeps focus there while it loads, so
    // the viewer can keep moving through the destinations.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && wide && _scope.switched) navNode.requestFocus();
    });
  }

  @override
  void dispose() {
    vm.removeListener(contentChanged);
    prefs.removeListener(contentChanged);
    super.dispose();
  }

  @override
  void focusContent() {
    if (_scope.switched) {
      if (bookFocusIsLost) navNode.requestFocus();
      return;
    }
    focusBody();
  }

  /// The first stop under the header, or the nav when there's nothing.
  void focusBody() {
    if (!coordinator.moveVertical(fromIndex: headerIndex, isUp: false)) {
      navNode.requestFocus();
    }
  }

  /// Left past the content's first column, onto the rail or the sidebar.
  void leaveLeft() =>
      _nav == _BookNav.rail ? navNode.requestFocus() : focusBookSidebar();

  void _select(BookNavPlace target) {
    if (target.kind == null) return openOverview();
    final here =
        target.kind == _scope.kind &&
        (target.kind != BookCategoryKind.titles || target.scope == vm.scope);
    if (here) return focusBody();
    _scope.switchTo(target);
  }

  /// Back to the library's overview, which in Bookstore is All Titles.
  void openOverview() {
    if (style == BookLibraryStyle.bookstore) {
      _scope.switchTo((kind: BookCategoryKind.titles, scope: BookScope.all));
    } else if (context.canPop()) {
      context.pop();
    } else {
      context.go(Destinations.bookLibrary(libraryId));
    }
  }

  bool get _backReturnsToTitles =>
      _scope.root &&
      style == BookLibraryStyle.bookstore &&
      (_scope.kind != BookCategoryKind.titles || vm.scope != BookScope.all);

  void openItem(AggregatedItem item) =>
      openBookLibraryItem(context, item, libraryId: libraryId);

  void showItemMenu(AggregatedItem item) =>
      showContextMenu(context, item, onChanged: () => setState(() {}));

  /// The page in the app's chrome, beside the rail when there's one. Back
  /// closes what the screen holds open, then returns to All Titles in a
  /// Bookstore library.
  Widget buildCategoryPage(Widget Function() content) => PopScope(
    canPop: !holdsBack && !_backReturnsToTitles,
    onPopInvokedWithResult: (didPop, _) {
      if (didPop) return;
      if (holdsBack) {
        releaseBack();
      } else if (_backReturnsToTitles) {
        _scope.switchTo((kind: BookCategoryKind.titles, scope: BookScope.all));
      }
    },
    child: buildPage(
      () => _nav == _BookNav.rail
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: bookSidebarInset),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.06),
                      ),
                    ),
                  ),
                  child: _buildRail(),
                ),
                Expanded(child: content()),
              ],
            )
          : content(),
    ),
  );

  Widget _buildRail() {
    final l10n = AppLocalizations.of(context);
    return BookLibraryRail(
      title: vm.libraryName.isNotEmpty ? vm.libraryName : l10n.books,
      subtitle: l10n.spotlightTitlesCount(vm.titleCount),
      sections: bookstoreNavSections(l10n, vm, place: place, onSelect: _select),
      focusNodeFor: (id) => node('nav:$id'),
      onNavigateRight: focusBody,
      onNavigateLeft: focusBookSidebar,
      topInset: topReserve,
    );
  }

  Widget _buildNavRow(int navIndex) {
    final l10n = AppLocalizations.of(context);
    void up() => move(navIndex, true);
    void down() => move(navIndex, false);
    return switch (_nav) {
      _BookNav.strip => BookCategoryStrip(
        title: vm.libraryName.isNotEmpty ? vm.libraryName : l10n.books,
        entries: bookOverviewNavEntries(
          l10n,
          vm,
          place: place,
          onSelect: _select,
        ),
        focusNode: navNode,
        fontSize: wide ? 24 : 20,
        onVerticalNavigation: (isUp) {
          move(navIndex, isUp);
          return true;
        },
        onExitLeft: focusBookSidebar,
      ),
      _BookNav.iconChips => BookCategoryChips(
        entries: bookOverviewNavEntries(
          l10n,
          vm,
          place: place,
          onSelect: _select,
        ),
        focusNodeFor: (id) => node('nav:$id'),
        edges: BookNavEdges(up: up, down: down, left: focusBookSidebar),
      ),
      _ => BookCategoryChips(
        icons: false,
        entries: [
          for (final section in bookstoreNavSections(
            l10n,
            vm,
            place: place,
            onSelect: _select,
          ))
            ...section.entries,
        ],
        focusNodeFor: (id) => node('nav:$id'),
        edges: BookNavEdges(up: up, down: down, left: focusBookSidebar),
      ),
    };
  }

  /// The style's strip or chips, unless the rail is up, over [title] and its
  /// [count]. Wide screens put [controls] at the end of the title's line,
  /// phones under it. The header's own stop is [firstNode], under the nav's.
  /// [leading] sits before the title, like a sub view's back button.
  Widget buildHeader({
    required String title,
    String? count,
    List<Widget> controls = const [],
    FocusNode? firstNode,
    Widget? leading,
  }) {
    final hasNav = _nav != _BookNav.rail;
    final navIndex = hasNav ? addStop(RowFocusEntry.node(navNode)) : -1;
    headerIndex = firstNode == null
        ? navIndex
        : addStop(RowFocusEntry.node(firstNode));
    final onSurface = AppColorScheme.onSurface;
    final heading = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) ...[leading, const SizedBox(width: 12)],
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: wide ? 34 : 28,
              fontWeight: FontWeight.w800,
              color: onSurface,
            ),
          ),
        ),
        if (count != null) ...[
          const SizedBox(width: 14),
          Text(
            count,
            style: TextStyle(
              fontSize: 15,
              color: onSurface.withValues(alpha: 0.65),
            ),
          ),
        ],
      ],
    );
    final spaced = [
      for (var i = 0; i < controls.length; i++) ...[
        if (i > 0) const SizedBox(width: 10),
        controls[i],
      ],
    ];
    // Wide screens keep the controls at the end of the title's line, and move
    // them under it when they don't fit beside it.
    final Widget titleBlock = wide
        ? Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            runSpacing: 14,
            children: [
              heading,
              if (spaced.isNotEmpty)
                Row(mainAxisSize: MainAxisSize.min, children: spaced),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heading,
              if (spaced.isNotEmpty) ...[
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(children: spaced),
                ),
              ],
            ],
          );
    // Phones have no focus headroom over the content, so the header keeps
    // its own gap.
    return Padding(
      padding: EdgeInsets.fromLTRB(
        inset,
        topReserve + 12,
        endInset,
        wide ? 8 : 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasNav) ...[
            _buildNavRow(navIndex),
            SizedBox(height: wide ? 22 : 16),
          ],
          titleBlock,
        ],
      ),
    );
  }

  void addLoadingSection() => addSection(
    const Padding(
      padding: EdgeInsets.only(top: 48),
      child: Center(child: CircularProgressIndicator()),
    ),
  );

  void addEmptySection() {
    final l10n = AppLocalizations.of(context);
    addSection(
      Padding(
        padding: EdgeInsets.fromLTRB(inset, 48, endInset, 0),
        child: Text(
          l10n.noItemsFound,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppColorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
      ),
    );
  }

  /// How many cards [cardWidth] wide fit across [width].
  int columnsFor(double width, {double cardWidth = 150, int phone = 3}) {
    if (!wide) return phone;
    final available = width - inset - endInset;
    return ((available + gridSpacing) / (cardWidth + gridSpacing))
        .floor()
        .clamp(2, 10);
  }

  double cellWidth(double width, int columns) =>
      (width - inset - endInset - gridSpacing * (columns - 1)) / columns;

  /// Scrolls the focused [focus] toward the middle of the list.
  void reveal(FocusNode focus) {
    final target = focus.context;
    if (target == null) return;
    unawaited(
      Scrollable.ensureVisible(
        target,
        alignment: 0.5,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  /// The arrows at a grid's edges: the top row goes up the page from [stop],
  /// the first column to the rail, and nothing leaves past the last card. A
  /// card with nothing under it steps down onto the last one, and [down]
  /// takes over Down, like into a panel under the card's row.
  KeyEventResult gridKey(
    KeyEvent event, {
    required String id,
    required int index,
    required int count,
    required int columns,
    required int stop,
    VoidCallback? down,
  }) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    final column = index % columns;
    if (key.isUpKey && index < columns) {
      move(stop, true);
      return KeyEventResult.handled;
    }
    if (key.isLeftKey && column == 0) {
      leaveLeft();
      return KeyEventResult.handled;
    }
    if (key.isRightKey && (column == columns - 1 || index == count - 1)) {
      return KeyEventResult.handled;
    }
    if (key.isDownKey && down != null) {
      down();
      return KeyEventResult.handled;
    }
    if (key.isDownKey && index + columns >= count) {
      if (index ~/ columns < (count - 1) ~/ columns) {
        node('$id:${count - 1}').requestFocus();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  /// A book on a sideways shelf, drawn like the overview shelves draw them.
  Widget shelfCard(
    AggregatedItem item, {
    required double width,
    required bool focused,
  }) => Align(
    alignment: Alignment.topLeft,
    child: shelf.BookCard(
      item: item,
      isAudiobook: vm.isAudiobookItem(item),
      isComic: vm.isComicItem(item),
      subtitle: vm.bookSubtitle(item),
      imageUrl: vm.bookImageUrl(item),
      width: width,
      remaining: vm.remainingFor(item),
      remainingIsTotal: (item.playedPercentage ?? 0) <= 0,
      showFormatBadge: vm.isMixedLibrary,
      externalIsFocused: focused,
      cardFocusExpansion: cardFocusExpansion,
      onTap: () => openItem(item),
    ),
  );

  /// Adds [items] as rows of book cards [columns] across, each row its own
  /// section so a long grid only builds what's on screen. [after] adds what
  /// goes under a row, like an open panel. [onNearEnd] runs as the last rows
  /// come into view. Returns the grid's stop.
  int addTitleGrid({
    required String id,
    required List<AggregatedItem> items,
    required int columns,
    required double cell,
    required void Function(AggregatedItem item, int index) onSelect,
    bool formatBadges = false,
    void Function(int rowStart, int rowEnd)? after,
    VoidCallback? Function(int index)? downFrom,
    VoidCallback? onNearEnd,
  }) {
    final stop = addStop(
      RowFocusEntry.node(node('$id:0'), containerKey: sectionKey('$id:row:0')),
    );
    final expansion = cardFocusExpansion;
    final headroom =
        MediaCard.focusHeadroom(cell * 3 / 2, expansion: expansion) +
        MediaCard.focusRingOutset;
    for (var start = 0; start < items.length; start += columns) {
      final rowEnd = math.min(start + columns, items.length);
      Widget row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = start; i < start + columns; i++) ...[
            if (i > start) SizedBox(width: gridSpacing),
            SizedBox(
              width: cell,
              child: i >= rowEnd
                  ? null
                  : _titleCard(
                      items[i],
                      id: id,
                      index: i,
                      count: items.length,
                      columns: columns,
                      stop: stop,
                      expansion: expansion,
                      formatBadges: formatBadges,
                      onSelect: onSelect,
                      down: downFrom?.call(i),
                    ),
            ),
          ],
        ],
      );
      if (onNearEnd != null && start + columns * 2 >= items.length) {
        row = MusicNearEnd(onBuilt: onNearEnd, child: row);
      }
      addSection(
        Padding(
          key: sectionKey('$id:row:$start'),
          padding: EdgeInsets.fromLTRB(inset, headroom, endInset, gridSpacing),
          child: row,
        ),
      );
      after?.call(start, rowEnd);
    }
    return stop;
  }

  Widget _titleCard(
    AggregatedItem item, {
    required String id,
    required int index,
    required int count,
    required int columns,
    required int stop,
    required bool expansion,
    required bool formatBadges,
    required void Function(AggregatedItem item, int index) onSelect,
    VoidCallback? down,
  }) {
    final focus = node('$id:$index');
    final isAudio = vm.isAudiobookItem(item);
    return BookCard(
      item: item,
      isAudiobook: isAudio,
      subtitle: vm.bookSubtitle(item),
      imageUrl: vm.bookImageUrl(item),
      remaining: isAudio ? vm.remainingFor(item) : null,
      showComicBadge: formatBadges && vm.isComicItem(item),
      cardFocusExpansion: expansion,
      focusNode: focus,
      onFocus: wide ? () => reveal(focus) : null,
      onKeyEvent: (_, event) => gridKey(
        event,
        id: id,
        index: index,
        count: count,
        columns: columns,
        stop: stop,
        down: down,
      ),
      onTap: () => onSelect(item, index),
      onLongPress: () => showItemMenu(item),
    );
  }
}
