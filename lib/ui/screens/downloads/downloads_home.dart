import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/database/offline_database.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../di/providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/accent_folding.dart';
import '../../../util/download_grouping.dart';
import '../../../util/download_utils.dart';
import '../../../util/focus/indexed_focus_nodes.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/local_search_field.dart';
import '../../widgets/sliding_pill_tabs.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/sync_indicator.dart';
import '../settings/download_settings_screen.dart';
import 'saved_show_screen.dart';
import 'widgets/active_downloads_tab.dart';
import 'widgets/saved_media_actions.dart';
import 'widgets/saved_media_menu.dart';
import 'widgets/saved_media_row.dart';
import 'widgets/storage_strip.dart';

enum SavedMediaSort { size, name, dateAdded }

/// One tab and the rows behind it, built only when the tab is the open one.
class _SavedTab {
  const _SavedTab(this.label, this.rows, {this.isActiveDownloads = false});

  final String label;
  final List<DownloadGroup> Function() rows;
  final bool isActiveDownloads;
}

/// The saved media list: what is on the device, grouped, filtered and playable
/// without a server.
class DownloadsHome extends ConsumerStatefulWidget {
  const DownloadsHome({super.key});

  @override
  ConsumerState<DownloadsHome> createState() => _DownloadsHomeState();
}

class _DownloadsHomeState extends ConsumerState<DownloadsHome> {
  int _tab = 0;
  SavedMediaSort _sort = SavedMediaSort.size;
  bool _searchOpen = false;
  String _query = '';
  bool _selectMode = false;
  final Set<String> _selected = {};
  bool _storageExpanded = false;
  Map<StorageBucket, int>? _breakdown;

  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode(debugLabel: 'SavedMediaSearch');
  final _storageFocusNode = FocusNode(debugLabel: 'SavedMediaStorage');
  final _firstActionFocusNode = FocusNode(debugLabel: 'SavedMediaFirstAction');
  final _initialFocusNode = FocusNode(debugLabel: 'SavedMediaInitialFocus');
  final _rowNodes = IndexedFocusNodes('SavedMediaRow');
  final _tabsFocusNode = FocusNode(debugLabel: 'SavedMediaTabs');

  @override
  void initState() {
    super.initState();
    _loadBreakdown();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _storageFocusNode.dispose();
    _firstActionFocusNode.dispose();
    _initialFocusNode.dispose();
    _rowNodes.dispose();
    _tabsFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadBreakdown() async {
    try {
      final breakdown = await loadStorageBreakdown();
      if (mounted) setState(() => _breakdown = breakdown);
    } catch (_) {
      // Walking the artwork cache can fail where the platform has locked the
      // folder down. The strip still has the total, which is the part that
      // answers the question people came here with.
    }
  }

  /// Tabs follow what is actually saved, so a device holding only films isn't
  /// offered four empty ones, and music and books get a tab of their own rather
  /// than being buried in All.
  ///
  /// Each tab builds its rows on demand, because only the open one is ever
  /// shown and sorting the rest on every rebuild buys nothing.
  List<_SavedTab> _buildTabs(AppLocalizations l10n, List<DownloadedItem> items) {
    List<DownloadGroup> standalone(bool Function(DownloadedItem) test) => _sorted([
      for (final item in items)
        if (test(item))
          DownloadGroup(
            key: 'item:${item.itemId}',
            title: item.name,
            items: [item],
          ),
    ]);

    bool isEpisode(DownloadedItem item) => item.type == 'Episode';
    bool isMusic(DownloadedItem item) =>
        item.type == 'Audio' || item.type == 'AudioBook';

    final types = {for (final item in items) item.type};
    // An episode saved without a series id has no show to gather under.
    final hasShows = items.any(
      (item) => isEpisode(item) && (item.seriesId?.isNotEmpty ?? false),
    );

    return [
      _SavedTab(l10n.all, () => _sorted(groupDownloads(items))),
      if (types.contains('Movie'))
        _SavedTab(l10n.movies, () => standalone((item) => item.type == 'Movie')),
      if (hasShows)
        _SavedTab(
          l10n.tvShows,
          () => _sorted(
            groupDownloads(items.where(isEpisode).toList())
                .where((group) => group.isSeries)
                .toList(),
          ),
        ),
      if (types.contains('Episode'))
        _SavedTab(l10n.episodes, () => standalone(isEpisode)),
      if (types.contains('Audio') || types.contains('AudioBook'))
        _SavedTab(l10n.music, () => standalone(isMusic)),
      if (types.contains('Book'))
        _SavedTab(l10n.books, () => standalone((item) => item.type == 'Book')),
      _SavedTab(l10n.activeDownloads, () => const [], isActiveDownloads: true),
    ];
  }

  List<DownloadGroup> _sorted(List<DownloadGroup> groups) {
    final sorted = [...groups];
    switch (_sort) {
      case SavedMediaSort.size:
        sorted.sort((a, b) => b.totalBytes.compareTo(a.totalBytes));
      case SavedMediaSort.name:
        sorted.sort(
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        );
      case SavedMediaSort.dateAdded:
        sorted.sort((a, b) => _addedAt(b).compareTo(_addedAt(a)));
    }
    return sorted;
  }

  /// A show is as recent as its newest saved episode.
  DateTime _addedAt(DownloadGroup group) {
    DateTime newest = DateTime.fromMillisecondsSinceEpoch(0);
    for (final item in group.items) {
      final at = item.downloadedAt;
      if (at != null && at.isAfter(newest)) newest = at;
    }
    return newest;
  }

  List<DownloadGroup> _filtered(List<DownloadGroup> groups) {
    // The same search field the library carries, so it has to find a title the
    // same way rather than only when the accents are typed exactly.
    final query = foldForSearch(_query.trim());
    if (query.isEmpty) return groups;
    return groups
        .where(
          (group) =>
              foldForSearch(group.title).contains(query) ||
              group.items.any(
                (item) =>
                    foldForSearch(item.name).contains(query) ||
                    foldForSearch(item.seriesName ?? '').contains(query),
              ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final catalog = ref
        .watch(downloadedCatalogProvider)
        .maybeWhen(data: (value) => value, orElse: () => DownloadCatalog.empty);
    final storage = ref
        .watch(storageUsedProvider)
        .maybeWhen(data: (value) => value, orElse: () => 0);
    final limitMb = ref
        .watch(userPreferencesProvider)
        .get(UserPreferences.downloadStorageLimitMb);

    final tabs = _buildTabs(l10n, catalog.items);
    final tabIndex = _tab.clamp(0, tabs.length - 1);
    final current = tabs[tabIndex];
    final groups = current.isActiveDownloads
        ? const <DownloadGroup>[]
        : _filtered(current.rows());

    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _initialFocusNode : null,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _header(l10n, catalog.items, storage),
              if (_searchOpen)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: LocalSearchField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onChanged: (value) => setState(() => _query = value),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
                child: StorageStrip(
                  totalBytes: storage,
                  limitMb: limitMb,
                  itemCount: catalog.items.length,
                  breakdown: _breakdown,
                  expanded: _storageExpanded,
                  onToggle: () =>
                      setState(() => _storageExpanded = !_storageExpanded),
                  focusNode: _storageFocusNode,
                  onNavigateUp: () => _firstActionFocusNode.requestFocus(),
                  onNavigateDown: () => _tabsFocusNode.requestFocus(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SlidingPillTabs(
                  labels: [for (final tab in tabs) tab.label],
                  alignment: Alignment.center,
                  selectedIndex: tabIndex,
                  onChanged: (index) => setState(() {
                    _tab = index;
                    _selected.clear();
                  }),
                  focusNode: _tabsFocusNode,
                  onVerticalNavigation: (isUp) {
                    isUp ? _storageFocusNode.requestFocus() : _focusFirstRow();
                    return true;
                  },
                ),
              ),
              Expanded(
                child: current.isActiveDownloads
                    ? ActiveDownloadsTab(
                        firstItemFocusNode: PlatformDetection.isTV
                            ? _initialFocusNode
                            : null,
                      )
                    : _list(l10n, groups, catalog.containerArtwork),
              ),
              if (_selectMode && _selected.isNotEmpty) _selectionBar(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(AppLocalizations l10n, List<DownloadedItem> items, int bytes) {
    final actions = <Widget>[
      FocusableToolbarButton(
        icon: _searchOpen ? Icons.search_off : Icons.search,
        tooltip: l10n.search,
        focusNode: _firstActionFocusNode,
        onTap: () {
          setState(() {
            _searchOpen = !_searchOpen;
            if (!_searchOpen) {
              _query = '';
              _searchController.clear();
            }
          });
          if (_searchOpen) _searchFocusNode.requestFocus();
        },
      ),
      // Reachable on TV too, because the storage controls live behind it and
      // a remote has no other way to them.
      FocusableToolbarButton(
        icon: Icons.settings_outlined,
        tooltip: l10n.settings,
        onTap: () => context.pushSettingsScreen(const DownloadSettingsScreen()),
      ),
      FocusableToolbarButton(
        icon: Icons.more_vert,
        tooltip: l10n.more,
        onTap: () => _openOverflow(l10n, items.isNotEmpty),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      child: Row(
        children: [
          // A remote closes the panel with Back, so the arrow would only be one
          // more thing for the d-pad to walk past.
          if (!PlatformDetection.isTV) ...[
            FocusableToolbarButton(
              icon: Icons.arrow_back,
              tooltip: l10n.back,
              onTap: () => closeDownloadsPanel(context),
            ),
            const SizedBox(width: 6),
          ] else ...[
            Icon(Icons.download_for_offline, color: AppColorScheme.accent),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              l10n.savedMedia,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SyncIndicator(),
          ...actions,
        ],
      ),
    );
  }

  Widget _list(
    AppLocalizations l10n,
    List<DownloadGroup> groups,
    Map<String, String> containerArtwork,
  ) {
    if (groups.isEmpty) {
      return _emptyState(
        _query.trim().isEmpty ? l10n.savedMediaNoDownloads : l10n.savedMediaNoResults,
        _query.trim().isEmpty ? l10n.savedMediaNoDownloadsDetail : null,
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
      itemCount: groups.length,
      itemBuilder: (context, index) =>
          _row(l10n, groups[index], index, groups.length, containerArtwork),
    );
  }

  Widget _row(
    AppLocalizations l10n,
    DownloadGroup group,
    int index,
    int total,
    Map<String, String> containerArtwork,
  ) {
    final first = group.first;
    final isShow = group.isSeries;
    final ids = group.itemIds;
    final selectedCount = ids.where(_selected.contains).length;

    return SavedMediaRow(
      key: ValueKey(group.key),
      rowFocusNode: _rowNodes[index],
      title: group.title,
      subtitle: isShow
          ? savedShowSubtitle(l10n, group)
          : savedMediaSubtitle(first),
      sizeLabel: formatBytes(group.totalBytes),
      posterPath: isShow
          ? containerArtwork[group.seriesId] ?? first.posterPath
          : first.posterPath,
      fallbackIcon: isShow
          ? Icons.video_library_outlined
          : savedMediaFallbackIcon(first.type),
      badge: _badge(isShow, group),
      onActivate: () => isShow ? _openShow(group) : openSavedItem(context, first),
      onPlay: isShow || !savedMediaIsPlayable(first)
          ? null
          : () => openSavedItem(context, first),
      onMenu: () => _openRowMenu(l10n, group),
      selectMode: _selectMode,
      // A partly selected show fills up first, so select always means all.
      selected: selectedCount == ids.length,
      onSelectedChanged: (value) => setState(() {
        value ? _selected.addAll(ids) : _selected.removeAll(ids);
      }),
      onNavigateUp: () => index == 0
          ? _tabsFocusNode.requestFocus()
          : _rowNodes[index - 1].requestFocus(),
      onNavigateDown: () =>
          index + 1 < total ? _rowNodes[index + 1].requestFocus() : null,
    );
  }

  Widget _badge(bool isShow, DownloadGroup group) => isShow
      ? Icon(
          Icons.video_library_outlined,
          size: 14,
          color: AppColorScheme.onSurface.withValues(alpha: 0.5),
        )
      : Icon(Icons.check_circle, size: 14, color: AppColorScheme.statusAvailable);

  Widget _emptyState(String title, String? detail) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.72),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (detail != null) ...[
            const SizedBox(height: 6),
            Text(
              detail,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.45),
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    ),
  );

  Widget _selectionBar(AppLocalizations l10n) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
    child: Row(
      children: [
        Expanded(
          child: Text(
            l10n.deleteSelectedCount(_selected.length),
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: _bulkDelete,
          icon: Icon(
            Icons.delete_outline,
            color: AppColorScheme.statusRequested,
          ),
          label: Text(l10n.deleteSelected),
        ),
      ],
    ),
  );

  void _focusFirstRow() => _rowNodes[0].requestFocus();

  /// Pushes onto the panel's own navigator, which keeps the backdrop and hands
  /// focus back to this row when the show screen pops.
  void _openShow(DownloadGroup group) {
    final seriesId = group.seriesId;
    if (seriesId == null) return;
    context.pushSettingsScreen(
      SavedShowScreen(seriesId: seriesId, title: group.title),
    );
  }

  Future<void> _openRowMenu(AppLocalizations l10n, DownloadGroup group) async {
    final first = group.first;
    final actions = <SavedMediaAction>[];

    if (group.isSeries) {
      actions.add(
        SavedMediaAction(
          icon: Icons.video_library_outlined,
          label: l10n.savedMediaOpenShow,
          onSelect: () async => _openShow(group),
        ),
      );
      actions.add(
        SavedMediaAction(
          icon: Icons.play_arrow,
          label: l10n.savedMediaPlayNextUnwatched,
          onSelect: () async => openSavedItem(context, _nextUnwatched(group)),
        ),
      );
    } else {
      if (savedMediaIsPlayable(first)) {
        actions.add(
          SavedMediaAction(
            icon: Icons.play_arrow,
            label: l10n.play,
            onSelect: () async => openSavedItem(context, first),
          ),
        );
        if (first.playbackPositionTicks > 0) {
          actions.add(
            SavedMediaAction(
              icon: Icons.replay,
              label: l10n.savedMediaPlayFromStart,
              onSelect: () async => openSavedItem(context, first),
            ),
          );
        }
      } else {
        actions.add(
          SavedMediaAction(
            icon: Icons.menu_book_outlined,
            label: l10n.savedMediaRead,
            onSelect: () async => openSavedItem(context, first),
          ),
        );
      }
    }

    actions.add(
      SavedMediaAction(
        icon: Icons.info_outline,
        label: l10n.savedMediaGoToDetails,
        onSelect: () async => openSavedItem(context, first, autoPlay: false),
      ),
    );
    actions.add(
      SavedMediaAction(
        icon: Icons.delete_outline,
        isDestructive: true,
        label: group.isSeries
            ? l10n.savedMediaDeleteEpisodes(group.items.length)
            : l10n.savedMediaDeleteDownload,
        onSelect: () async {
          final deleted = await deleteSavedItems(
            context,
            title: group.isSeries
                ? l10n.savedMediaDeleteEpisodes(group.items.length)
                : l10n.savedMediaDeleteDownload,
            message: group.title,
            itemIds: group.itemIds,
          );
          if (deleted) await _loadBreakdown();
        },
      ),
    );

    await showSavedMediaMenu(
      context,
      title: group.title,
      actions: actions,
    );
  }

  /// The earliest saved episode nobody has started, falling back to the first
  /// one so the action always does something.
  DownloadedItem _nextUnwatched(DownloadGroup group) => group.items.firstWhere(
    (item) => item.playbackPositionTicks == 0,
    orElse: () => group.first,
  );

  Future<void> _openOverflow(AppLocalizations l10n, bool hasItems) async {
    await showSavedMediaMenu(
      context,
      title: l10n.savedMedia,
      actions: [
        SavedMediaAction(
          icon: Icons.sort,
          label: l10n.sortBy,
          onSelect: () => _openSortMenu(l10n),
        ),
        if (hasItems)
          SavedMediaAction(
            icon: _selectMode ? Icons.close : Icons.checklist,
            label: _selectMode ? l10n.cancel : l10n.savedMediaSelectItems,
            onSelect: () async => setState(() {
              _selectMode = !_selectMode;
              if (!_selectMode) _selected.clear();
            }),
          ),
      ],
    );
  }

  Future<void> _openSortMenu(AppLocalizations l10n) async {
    const labels = {
      SavedMediaSort.size: Icons.data_usage,
      SavedMediaSort.name: Icons.sort_by_alpha,
      SavedMediaSort.dateAdded: Icons.schedule,
    };
    String labelFor(SavedMediaSort sort) => switch (sort) {
      SavedMediaSort.size => l10n.sortBySize,
      SavedMediaSort.name => l10n.sortByName,
      SavedMediaSort.dateAdded => l10n.sortByDateAdded,
    };
    await showSavedMediaMenu(
      context,
      title: l10n.sortBy,
      actions: [
        for (final sort in SavedMediaSort.values)
          SavedMediaAction(
            icon: _sort == sort ? Icons.check : labels[sort]!,
            label: labelFor(sort),
            onSelect: () async => setState(() => _sort = sort),
          ),
      ],
    );
  }

  Future<void> _bulkDelete() async {
    final l10n = AppLocalizations.of(context);
    final deleted = await deleteSavedItems(
      context,
      title: l10n.deleteSelected,
      message: l10n.deleteSelectedCount(_selected.length),
      itemIds: _selected.toList(),
    );
    if (!deleted || !mounted) return;
    setState(() {
      _selected.clear();
      _selectMode = false;
    });
    await _loadBreakdown();
  }
}
