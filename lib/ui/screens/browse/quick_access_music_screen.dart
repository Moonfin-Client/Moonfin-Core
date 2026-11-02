import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../navigation/destinations.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/navigation_layout.dart';
import 'music_library_base.dart';

/// The Quick Access music library: a grid of recent albums and playlists to
/// jump straight into, over the rows. Wide layouts move the categories and
/// playlists into a rail and list the songs played last.
class QuickAccessMusicScreen extends StatefulWidget {
  final String libraryId;

  const QuickAccessMusicScreen({super.key, required this.libraryId});

  @override
  State<QuickAccessMusicScreen> createState() => _QuickAccessMusicScreenState();
}

typedef _QuickItem = ({String title, String? imageUrl, VoidCallback onTap});

class _QuickAccessMusicScreenState
    extends MusicLibraryState<QuickAccessMusicScreen> {
  static const _railWidth = 248.0;

  @override
  String get libraryId => widget.libraryId;

  /// Left past the content's first column: the rail on wide layouts, the
  /// sidebar otherwise.
  void _focusLeft() =>
      wide ? node('rail:overview').requestFocus() : focusBookSidebar();

  /// Albums from the songs played last, then playlists.
  List<_QuickItem> _quickItems() {
    final seen = <String>{};
    final items = <_QuickItem>[];
    for (final track in rowOf('lastPlayed_')?.items ?? const []) {
      final albumId = track.albumId;
      if (albumId == null || albumId.isEmpty) {
        if (seen.add(track.id)) {
          items.add((
            title: track.name,
            imageUrl: vm.getMusicImageUrl(track),
            onTap: () => openItem(track),
          ));
        }
        continue;
      }
      if (!seen.add(albumId)) continue;
      items.add((
        title: track.album ?? track.name,
        imageUrl: vm.getMusicImageUrl(track),
        onTap: () => context.push(
          Destinations.item(albumId, serverId: track.serverId),
        ),
      ));
    }
    for (final playlist in rowOf('playlists')?.items ?? const []) {
      items.add((
        title: playlist.name,
        imageUrl: vm.getMusicImageUrl(playlist),
        onTap: () => openItem(playlist),
      ));
    }
    return items.take(wide ? 8 : 6).toList();
  }

  @override
  Widget build(BuildContext context) => buildPage(
    () => wide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: bookSidebarInset),
              _buildRail(context),
              Expanded(child: buildSectionList(_addSections)),
            ],
          )
        : buildSectionList(_addSections),
  );

  void _addSections() {
    final l10n = AppLocalizations.of(context);
    final inset = wide ? 32.0 : 16.0;
    final quick = _quickItems();

    headerIndex = addStop(
      RowFocusEntry.node(
        node(wide ? 'filter' : 'search'),
        containerKey: sectionKey('header'),
      ),
    );
    addSection(
      KeyedSubtree(
        key: sectionKey('header'),
        child: _buildHeader(l10n, inset, quick.isNotEmpty),
      ),
    );

    if (!wide) {
      final index = addStop(
        RowFocusEntry.node(node('chip:0'), containerKey: sectionKey('chips')),
      );
      addSection(_buildChips(l10n, inset, index));
    }

    if (quick.isNotEmpty) {
      final index = addStop(
        RowFocusEntry.node(node('quick:0'), containerKey: sectionKey('quick')),
      );
      addSection(_buildQuickGrid(l10n, quick, inset, index));
    }

    addShelf(rowOf('latest_'), inset: inset, onLeftEdge: _focusLeft);
    if (wide) {
      addList(
        rowOf('lastPlayed_'),
        title: l10n.lastPlayed,
        inset: inset,
        onLeftEdge: _focusLeft,
        max: 6,
      );
    } else {
      addList(
        rowOf('playlists'),
        title: l10n.yourPlaylists,
        inset: inset,
        onLeftEdge: _focusLeft,
      );
    }
    for (final prefix in const [
      'albumartist_',
      'favorites_',
      'musicartist_',
      'musicalbum_',
    ]) {
      addShelf(rowOf(prefix), inset: inset, onLeftEdge: _focusLeft);
    }
  }

  Widget _buildHeader(AppLocalizations l10n, double inset, bool hasQuick) {
    final top = topReserve;
    VoidCallback leave(bool isUp) =>
        () => move(headerIndex, isUp);

    if (wide) {
      return Padding(
        padding: EdgeInsets.fromLTRB(inset, top + 16, inset, 0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hasQuick ? l10n.jumpBackIn : vm.libraryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
            FocusableWrapper(
              highlightOnHover: true,
              focusNode: node('filter'),
              borderRadius: 20,
              disableScale: true,
              onSelect: showSortAndFilter,
              onNavigateUp: leave(true),
              onNavigateDown: leave(false),
              onNavigateLeft: _focusLeft,
              onNavigateRight: () {},
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.08),
                  borderRadius: AppRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.tune_rounded,
                      size: 18,
                      color: AppColorScheme.onSurface,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.sortAndFilter,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget iconButton(String id, IconData icon, String label, VoidCallback on) =>
        FocusableWrapper(
          highlightOnHover: true,
          focusNode: node(id),
          borderRadius: 22,
          disableScale: true,
          semanticLabel: label,
          onSelect: on,
          onNavigateUp: leave(true),
          onNavigateDown: leave(false),
          child: SizedBox.square(
            dimension: 44,
            child: Icon(icon, color: AppColorScheme.onSurface),
          ),
        );

    return Padding(
      padding: EdgeInsets.fromLTRB(inset, top + 4, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              vm.libraryName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: AppColorScheme.onSurface,
              ),
            ),
          ),
          iconButton('search', Icons.search_rounded, l10n.searchMusic, search),
          iconButton(
            'filter',
            Icons.tune_rounded,
            l10n.sortAndFilter,
            showSortAndFilter,
          ),
        ],
      ),
    );
  }

  /// All, then the categories, as chips under the header on phones.
  Widget _buildChips(AppLocalizations l10n, double inset, int entryIndex) {
    final categories = musicCategories(context, libraryId);
    final labels = [l10n.all, for (final c in categories) c.label];
    // Built all at once, so the All chip the header steps down to is always
    // there however far the row has scrolled.
    return SingleChildScrollView(
      key: sectionKey('chips'),
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(inset, 12, inset, 8),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            MusicChip(
              label: labels[i],
              selected: i == 0,
              focusNode: node('chip:$i'),
              onTap: i == 0
                  ? () {}
                  : () => context.push(categories[i - 1].route),
              onNavigateUp: () => move(entryIndex, true),
              onNavigateDown: () => move(entryIndex, false),
              onNavigateLeft: i == 0 ? _focusLeft : null,
              onNavigateRight: i == labels.length - 1 ? () {} : null,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuickGrid(
    AppLocalizations l10n,
    List<_QuickItem> quick,
    double inset,
    int entryIndex,
  ) {
    final grid = LayoutBuilder(
      builder: (context, constraints) {
        // Tiles stay wide enough for two lines of a long album name.
        final columns = wide
            ? (constraints.maxWidth / 240).floor().clamp(2, 4)
            : 2;
        return MusicGrid(
          columns: columns,
          children: [
            for (var i = 0; i < quick.length; i++)
              MusicQuickTile(
                title: quick[i].title,
                imageUrl: quick[i].imageUrl,
                large: wide,
                focusNode: node('quick:$i'),
                onTap: quick[i].onTap,
                edges: MusicGridEdges.of(
                  i,
                  count: quick.length,
                  columns: columns,
                  onLeaveUp: () => move(entryIndex, true),
                  onLeaveDown: () => move(entryIndex, false),
                  onLeaveLeft: _focusLeft,
                ),
              ),
          ],
        );
      },
    );
    return KeyedSubtree(
      key: sectionKey('quick'),
      // On wide layouts the header already reads Jump Back In.
      child: wide
          ? Padding(
              padding: EdgeInsets.fromLTRB(inset, 16, inset, 0),
              child: grid,
            )
          : MusicSection(
              title: l10n.jumpBackIn,
              padding: EdgeInsets.symmetric(horizontal: inset),
              child: grid,
            ),
    );
  }

  Widget _buildRail(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = musicCategories(context, libraryId);
    final playlists = rowOf('playlists')?.items ?? const <AggregatedItem>[];
    final ids = [
      'rail:search',
      'rail:overview',
      for (var i = 0; i < categories.length; i++) 'rail:category:$i',
      for (var i = 0; i < playlists.length; i++) 'rail:playlist:$i',
    ];

    Widget item(
      int index, {
      required String label,
      required VoidCallback onTap,
      IconData? icon,
      String? imageUrl,
      bool selected = false,
    }) => MusicRailItem(
      label: label,
      icon: icon,
      imageUrl: imageUrl,
      selected: selected,
      focusNode: node(ids[index]),
      onTap: onTap,
      onNavigateUp: index == 0
          ? () => NavigationLayout.focusNavbarNotifier.value?.call()
          : null,
      onNavigateDown: index == ids.length - 1 ? () {} : null,
      onNavigateLeft: focusBookSidebar,
      onNavigateRight: focusContent,
    );

    final top = topReserve;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.62);
    return Container(
      width: _railWidth,
      color: AppColorScheme.onSurface.withValues(alpha: 0.03),
      child: ListView(
        padding: EdgeInsets.fromLTRB(12, top + 16, 12, 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              vm.libraryName,
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
            label: l10n.searchMusic,
            icon: Icons.search_rounded,
            onTap: search,
          ),
          item(
            1,
            label: l10n.overview,
            icon: Icons.space_dashboard_outlined,
            selected: true,
            onTap: focusContent,
          ),
          for (var i = 0; i < categories.length; i++)
            item(
              2 + i,
              label: categories[i].label,
              icon: categories[i].icon,
              onTap: () => context.push(categories[i].route),
            ),
          if (playlists.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
              child: Text(
                l10n.playlists.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: muted,
                ),
              ),
            ),
            for (var i = 0; i < playlists.length; i++)
              item(
                2 + categories.length + i,
                label: playlists[i].name,
                imageUrl: vm.getMusicImageUrl(playlists[i]),
                onTap: () => openItem(playlists[i]),
              ),
          ],
        ],
      ),
    );
  }
}
