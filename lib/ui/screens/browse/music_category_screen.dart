import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/navigation_layout.dart';
import 'library_page_state.dart';
import 'music_albums_screen.dart';
import 'music_artists_screen.dart';
import 'music_browse_screen.dart';
import 'music_favorites_screen.dart';
import 'music_genres_screen.dart';
import 'music_playlists_screen.dart';
import 'music_songs_screen.dart';

/// The screen a music library's category opens. Its strip, rail or chips
/// swap to another category in place, so Back still returns to the library.
class MusicCategoryScreen extends StatefulWidget {
  final String libraryId;
  final MusicCategoryKind kind;

  /// What the screen opens on: `all` for every artist, or a favorites tab.
  final String? show;

  const MusicCategoryScreen({
    super.key,
    required this.libraryId,
    required this.kind,
    this.show,
  });

  @override
  State<MusicCategoryScreen> createState() => _MusicCategoryScreenState();
}

class _MusicCategoryScreenState extends State<MusicCategoryScreen> {
  late var _kind = widget.kind;
  late String? _show = widget.show;
  bool _switched = false;

  void _switchTo(MusicCategoryKind kind) => setState(() {
    _kind = kind;
    _show = null;
    _switched = true;
  });

  @override
  Widget build(BuildContext context) {
    final libraryId = widget.libraryId;
    return MusicCategoryScope(
      kind: _kind,
      switched: _switched,
      switchTo: _switchTo,
      child: KeyedSubtree(
        key: ValueKey(_kind),
        child: switch (_kind) {
          MusicCategoryKind.artists => MusicArtistsScreen(
            libraryId: libraryId,
            allArtists: _show == 'all',
          ),
          MusicCategoryKind.albums => MusicAlbumsScreen(libraryId: libraryId),
          MusicCategoryKind.songs => MusicSongsScreen(libraryId: libraryId),
          MusicCategoryKind.playlists => MusicPlaylistsScreen(
            libraryId: libraryId,
          ),
          MusicCategoryKind.genres => MusicGenresScreen(libraryId: libraryId),
          MusicCategoryKind.favorites => MusicFavoritesScreen(
            libraryId: libraryId,
            tab: _show,
          ),
        },
      ),
    );
  }
}

/// How a category screen shows the other categories.
enum _MusicNav { strip, quickRail, quickChips, classicRail, classicBar }

/// Which category is showing, and how the screen swaps to another.
class MusicCategoryScope extends InheritedWidget {
  final MusicCategoryKind kind;

  /// Whether a swap opened this screen, which keeps focus on the strip, rail
  /// or chips.
  final bool switched;
  final ValueChanged<MusicCategoryKind> switchTo;

  const MusicCategoryScope({
    super.key,
    required this.kind,
    required this.switched,
    required this.switchTo,
    required super.child,
  });

  static MusicCategoryScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MusicCategoryScope>()!;

  @override
  bool updateShouldNotify(MusicCategoryScope old) =>
      kind != old.kind || switched != old.switched;
}

/// What the music category screens share: the library's queries, the
/// category strip, rail or chips around the screen, and grids of cards that
/// build a row at a time.
abstract class MusicCategoryState<T extends StatefulWidget>
    extends LibraryPageState<T> {
  late final MusicLibraryQueries queries = MusicLibraryQueries(
    libraryId: libraryId,
    client: GetIt.instance<MediaServerClient>(),
  );

  @override
  String get focusLabel => 'music';

  @override
  String get activeRoute => '/music/$libraryId';

  static const _railWidth = 248.0;

  String _libraryName = '';
  Timer? _reloadTimer;

  /// The categories show the way the library's style shows them on its
  /// overview: Immersive's strip, Quick Access's rail on wide layouts or its
  /// chips on phones, and Classic's rail on desktop or its chips everywhere
  /// else.
  _MusicNav get _nav {
    final style = GetIt.instance<UserPreferences>().get(
      UserPreferences.musicLibraryStyle,
    );
    return switch (style) {
      MusicLibraryStyle.quickAccess =>
        wide ? _MusicNav.quickRail : _MusicNav.quickChips,
      MusicLibraryStyle.classic => PlatformDetection.useDesktopUi
          ? _MusicNav.classicRail
          : _MusicNav.classicBar,
      _ => _MusicNav.strip,
    };
  }

  bool get _railNav =>
      _nav == _MusicNav.quickRail || _nav == _MusicNav.classicRail;

  double get inset => _railNav ? 32.0 : (wide ? 48.0 : 20.0) + bookSidebarInset;
  double get endInset => wide ? 48.0 : 20.0;

  MusicCategoryScope get _scope =>
      context.getInheritedWidgetOfExactType<MusicCategoryScope>()!;

  /// Where the category navigation takes focus: the current category in a
  /// rail or a style's chips, or the strip.
  FocusNode get _navNode => switch (_nav) {
    _MusicNav.strip => node('strip'),
    _MusicNav.quickRail => node('rail:${_scope.kind.name}'),
    _MusicNav.quickChips => node('chip:${_scope.kind.name}'),
    _MusicNav.classicRail || _MusicNav.classicBar => node(
      'classic:${_scope.kind.name}',
    ),
  };

  MusicCategoryNav get _classicNav {
    final scope = MusicCategoryScope.of(context);
    return MusicCategoryNav(
      current: scope.kind,
      onOverview: _openOverview,
      onSelect: scope.switchTo,
      onCurrent: _focusBody,
      focusNode: (id) => node('classic:$id'),
    );
  }

  /// Left past the content's first column, onto the rail or the sidebar.
  void leaveLeft() => _railNav ? _navNode.requestFocus() : focusBookSidebar();

  @override
  void initState() {
    super.initState();
    unawaited(_loadLibraryName());
    // A screen the strip or rail switched to keeps focus there while it
    // loads, so the viewer can keep moving through the categories.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (wide && _scope.switched) _navNode.requestFocus();
      final chip = _nav == _MusicNav.quickChips ? _navNode.context : null;
      if (chip != null) Scrollable.ensureVisible(chip, alignment: 0.5);
    });
  }

  @override
  void dispose() {
    _reloadTimer?.cancel();
    super.dispose();
  }

  @override
  void focusContent() {
    if (!_scope.switched) {
      super.focusContent();
    } else if (bookFocusIsLost) {
      _navNode.requestFocus();
    }
  }

  void _focusBody() => super.focusContent();

  /// Moves up or down the page's stops, holding focus where it is when
  /// there's nowhere to go, so it never wanders off to the sidebar.
  bool moveOrHold(int fromIndex, bool isUp) {
    move(fromIndex, isUp);
    return true;
  }

  Future<void> _loadLibraryName() async {
    try {
      final item = await queries.client.itemsApi.getItem(libraryId);
      final name = item['Name'] as String?;
      if (mounted && name != null) setState(() => _libraryName = name);
    } catch (e) {
      debugPrint('Failed to load the music library name: $e');
    }
  }

  /// Runs [reload] once the D-pad stops on a new sort or type, since the
  /// pill tabs pick on every arrow press.
  void reloadSoon(VoidCallback reload) {
    _reloadTimer?.cancel();
    _reloadTimer = Timer(const Duration(milliseconds: 400), reload);
  }

  Widget get loadingIndicator => const Center(child: CircularProgressIndicator());

  /// The page in the app's chrome, with the header and the rail up while it
  /// loads.
  Widget buildCategoryPage(Widget Function() content) => buildPage(
    () => _railNav
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: bookSidebarInset),
              if (_nav == _MusicNav.quickRail)
                _buildRail()
              else
                MusicCategoryRail(
                  libraryId: libraryId,
                  libraryName: _libraryName,
                  nav: _classicNav,
                  topPadding: topReserve,
                  onNavigateUp: () =>
                      NavigationLayout.focusNavbarNotifier.value?.call(),
                  onNavigateLeft: focusBookSidebar,
                  onNavigateRight: _focusBody,
                ),
              Expanded(child: content()),
            ],
          )
        : content(),
  );

  void addLoadingSection() => addSection(
    Padding(padding: const EdgeInsets.only(top: 48), child: loadingIndicator),
  );

  Widget emptyMessage(AppLocalizations l10n) => Padding(
    padding: EdgeInsets.fromLTRB(inset, 48, endInset, 0),
    child: Text(
      l10n.noItemsFound,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: AppColorScheme.onSurface.withValues(alpha: 0.65),
      ),
    ),
  );

  void _openOverview() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(Destinations.musicLibrary(libraryId));
    }
  }

  /// The Quick Access rail: the library's name, Search, Overview and the
  /// categories, the current one picked.
  Widget _buildRail() {
    final l10n = AppLocalizations.of(context);
    final scope = MusicCategoryScope.of(context);
    final categories = musicCategories(context, libraryId);
    final kinds = MusicCategoryKind.values;
    final count = 2 + categories.length;

    Widget item(
      int index,
      String id, {
      required String label,
      required IconData icon,
      required VoidCallback onTap,
      bool selected = false,
    }) => MusicRailItem(
      label: label,
      icon: icon,
      selected: selected,
      focusNode: node('rail:$id'),
      onTap: onTap,
      onNavigateUp: index == 0
          ? () => NavigationLayout.focusNavbarNotifier.value?.call()
          : null,
      onNavigateDown: index == count - 1 ? () {} : null,
      onNavigateLeft: focusBookSidebar,
      onNavigateRight: _focusBody,
    );

    return Container(
      width: _railWidth,
      color: AppColorScheme.onSurface.withValues(alpha: 0.03),
      child: ListView(
        padding: EdgeInsets.fromLTRB(12, topReserve + 16, 12, 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              _libraryName.isEmpty ? l10n.music : _libraryName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColorScheme.onSurface,
              ),
            ),
          ),
          item(
            0,
            'search',
            label: l10n.searchMusic,
            icon: Icons.search_rounded,
            onTap: () => context.push(Destinations.searchInLibrary(libraryId)),
          ),
          item(
            1,
            'overview',
            label: l10n.overview,
            icon: Icons.space_dashboard_outlined,
            onTap: _openOverview,
          ),
          for (var i = 0; i < categories.length; i++)
            item(
              2 + i,
              kinds[i].name,
              label: categories[i].label,
              icon: categories[i].icon,
              selected: kinds[i] == scope.kind,
              onTap: () => kinds[i] == scope.kind
                  ? _focusBody()
                  : scope.switchTo(kinds[i]),
            ),
        ],
      ),
    );
  }

  /// The library's name and its categories, the current one picked.
  Widget _buildStrip(int stripIndex) {
    final l10n = AppLocalizations.of(context);
    final scope = MusicCategoryScope.of(context);
    final categories = musicCategories(context, libraryId);
    return Row(
      children: [
        Text(
          _libraryName.isEmpty ? l10n.music : _libraryName,
          style: TextStyle(
            fontSize: wide ? 24 : 20,
            fontWeight: FontWeight.w800,
            color: AppColorScheme.onSurface,
          ),
        ),
        SizedBox(width: wide ? 28 : 16),
        Expanded(
          child: MusicCategoryTabs(
            labels: [l10n.overview, for (final c in categories) c.label],
            current: scope.kind.index + 1,
            onOpen: (index) => index == 0
                ? _openOverview()
                : scope.switchTo(MusicCategoryKind.values[index - 1]),
            focusNode: node('strip'),
            onVerticalNavigation: (isUp) => moveOrHold(stripIndex, isUp),
            onExitLeft: leaveLeft,
            onExitRight: () {},
          ),
        ),
      ],
    );
  }

  /// Quick Access's chips on phones: All for the overview, then the
  /// categories, the current one filled.
  Widget _buildChips(int stripIndex) {
    final l10n = AppLocalizations.of(context);
    final scope = MusicCategoryScope.of(context);
    final categories = musicCategories(context, libraryId);
    final kinds = MusicCategoryKind.values;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          MusicChip(
            label: l10n.all,
            selected: false,
            focusNode: node('chip:overview'),
            onTap: _openOverview,
            onNavigateUp: () => move(stripIndex, true),
            onNavigateDown: () => move(stripIndex, false),
            onNavigateLeft: leaveLeft,
          ),
          for (var i = 0; i < categories.length; i++) ...[
            const SizedBox(width: 8),
            MusicChip(
              label: categories[i].label,
              selected: kinds[i] == scope.kind,
              focusNode: node('chip:${kinds[i].name}'),
              onTap: () => kinds[i] == scope.kind
                  ? _focusBody()
                  : scope.switchTo(kinds[i]),
              onNavigateUp: () => move(stripIndex, true),
              onNavigateDown: () => move(stripIndex, false),
              onNavigateRight: i == categories.length - 1 ? () {} : null,
            ),
          ],
        ],
      ),
    );
  }

  /// The category strip or a style's chips, unless a rail is up, over
  /// [title] and its [count]. Wide screens put [tabs] and [actions] at the end of the
  /// title's line, phones under it. The header's own stop is [firstNode],
  /// under the strip's.
  Widget buildHeader({
    required String title,
    String? count,
    Widget? tabs,
    List<Widget> actions = const [],
    FocusNode? firstNode,
    Alignment tabsAlignment = Alignment.centerRight,
  }) {
    final strip = !_railNav;
    final stripIndex = strip ? addStop(RowFocusEntry.node(_navNode)) : -1;
    headerIndex = firstNode == null
        ? stripIndex
        : addStop(RowFocusEntry.node(firstNode));
    final onSurface = AppColorScheme.onSurface;
    final heading = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: wide ? 34 : 28,
            fontWeight: FontWeight.w800,
            color: onSurface,
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
      for (var i = 0; i < actions.length; i++) ...[
        if (i > 0) const SizedBox(width: 10),
        actions[i],
      ],
    ];
    final Widget titleBlock;
    if (wide) {
      titleBlock = Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          heading,
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: tabs == null
                      ? const SizedBox.shrink()
                      : Align(alignment: tabsAlignment, child: tabs),
                ),
                if (spaced.isNotEmpty) const SizedBox(width: 10),
                ...spaced,
              ],
            ),
          ),
        ],
      );
    } else {
      titleBlock = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          heading,
          if (tabs != null) ...[const SizedBox(height: 12), tabs],
          if (spaced.isNotEmpty) ...[
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: spaced),
            ),
          ],
        ],
      );
    }
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
          if (_nav == _MusicNav.classicBar) ...[
            MusicCategoryBar(
              libraryId: libraryId,
              nav: _classicNav,
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
              onNavigateUp: () => move(stripIndex, true),
              onNavigateDown: () => move(stripIndex, false),
              onNavigateLeft: leaveLeft,
            ),
            SizedBox(height: wide ? 14 : 8),
          ] else if (_nav == _MusicNav.quickChips) ...[
            _buildChips(stripIndex),
            const SizedBox(height: 16),
          ] else if (strip) ...[
            _buildStrip(stripIndex),
            SizedBox(height: wide ? 22 : 16),
          ],
          titleBlock,
        ],
      ),
    );
  }

  /// How many cards fit across the content.
  int columnsFor(double width, {required double cardWidth, int min = 2, int max = 8}) {
    final available = width - inset - endInset;
    return ((available + gridSpacing) / (cardWidth + gridSpacing))
        .floor()
        .clamp(min, max);
  }

  double get gridSpacing => wide ? 20 : 12;

  double cellWidth(double width, int columns) =>
      (width - inset - endInset - gridSpacing * (columns - 1)) / columns;

  /// How tall one row of [addCardGrid] lays out, with room above for a
  /// focused card to grow.
  double gridRowExtent(
    double cell, {
    required bool hasSubtitle,
  }) {
    final expansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    return MediaCard.focusHeadroom(cell, expansion: expansion) +
        MediaCard.focusRingOutset +
        MediaCard.layoutHeight(
          context,
          width: cell,
          aspectRatio: 1,
          hasSubtitle: hasSubtitle,
        ) +
        gridSpacing;
  }

  /// Adds [items] as rows of square cards [columns] across, each row its own
  /// section so a long grid only builds what's on screen. The D-pad moves
  /// between the cards by position and leaves the grid through its edges.
  /// [first] and [end] pick the slice of [items] this call draws, so a grid
  /// split by headings still moves as one, joining the stop at [stopIndex].
  /// [onNearEnd] runs as the last rows come into view. Returns the stop.
  int addCardGrid({
    required String id,
    required List<AggregatedItem> items,
    required int columns,
    required double cell,
    required double rowExtent,
    required void Function(AggregatedItem item, int index) onSelect,
    String Function(AggregatedItem item)? subtitleOf,
    bool round = false,
    int first = 0,
    int? end,
    int? stopIndex,
    VoidCallback? onLeaveRight,
    VoidCallback? onNearEnd,
    void Function(int index)? onFocus,
    VoidCallback? Function(int index)? downFrom,
  }) {
    final last = end ?? items.length;
    final stop =
        stopIndex ??
        addStop(
          RowFocusEntry.node(
            node('$id:0'),
            containerKey: sectionKey('$id:row:0'),
          ),
        );
    final expansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final headroom =
        MediaCard.focusHeadroom(cell, expansion: expansion) +
        MediaCard.focusRingOutset;
    for (var start = first; start < last; start += columns) {
      final rowEnd = (start + columns).clamp(0, last);
      final firstRow = start == 0;
      final lastRow = rowEnd == items.length;
      Widget row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = start; i < start + columns; i++) ...[
            if (i > start) SizedBox(width: gridSpacing),
            SizedBox(
              width: cell,
              child: i >= rowEnd
                  ? null
                  : MusicGridCard(
                      focusNode: node('$id:$i'),
                      onTap: () => onSelect(items[i], i),
                      onFocus: onFocus == null ? null : () => onFocus(i),
                      edges: MusicGridEdges(
                        up: firstRow ? () => move(stop, true) : null,
                        down:
                            downFrom?.call(i) ??
                            (lastRow ? () => move(stop, false) : null),
                        left: i == start ? leaveLeft : null,
                        right: i == rowEnd - 1 ? onLeaveRight : null,
                      ),
                      builder: (focused) => MediaCard(
                        width: cell,
                        aspectRatio: 1,
                        title: items[i].name,
                        subtitle: subtitleOf?.call(items[i]),
                        imageUrl: musicImageUrl(items[i]),
                        // MediaCard only draws Person cards round.
                        itemType: round ? 'Person' : items[i].type,
                        isFavorite: items[i].isFavorite,
                        externalIsFocused: focused,
                        cardFocusExpansion: expansion,
                        onTap: () => onSelect(items[i], i),
                      ),
                    ),
            ),
          ],
        ],
      );
      if (onNearEnd != null && start + columns * 2 >= last) {
        row = MusicNearEnd(onBuilt: onNearEnd, child: row);
      }
      addSection(
        SizedBox(
          key: sectionKey('$id:row:$start'),
          height: rowExtent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(inset, headroom, endInset, gridSpacing),
            child: row,
          ),
        ),
      );
    }
    return stop;
  }

  String? musicImageUrl(AggregatedItem item, {int maxHeight = 400}) =>
      musicItemImageUrl(queries.client.imageApi, item, maxHeight: maxHeight);
}

/// Tells [onBuilt] once, after its first frame, that a row near the end of
/// a list came into view, so the list can page in more.
class MusicNearEnd extends StatefulWidget {
  final VoidCallback onBuilt;
  final Widget child;

  const MusicNearEnd({super.key, required this.onBuilt, required this.child});

  @override
  State<MusicNearEnd> createState() => _MusicNearEndState();
}

class _MusicNearEndState extends State<MusicNearEnd> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onBuilt();
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
