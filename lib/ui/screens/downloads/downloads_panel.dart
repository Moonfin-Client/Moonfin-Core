import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/database/offline_database.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/models/download_source.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../data/repositories/offline_repository.dart';
import '../../../data/services/download_service.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../di/providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/download_grouping.dart';
import '../../../util/download_utils.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_slider.dart';
import '../../widgets/focus/dpad_list_tile.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/sync_indicator.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../settings/download_settings_screen.dart';

/// Opens the Downloads dialog: storage usage + breakdown chart, active
/// downloads, per-item size list with bulk delete, storage limit, and
/// download settings. Downloaded items themselves are browsed and played in
/// the regular UI (which shows only downloads when offline).
Future<void> showDownloadsDialog(BuildContext context) {
  return SettingsPanel.open(context, const DownloadsPanel());
}

class DownloadsPanel extends ConsumerStatefulWidget {
  const DownloadsPanel({super.key});

  @override
  ConsumerState<DownloadsPanel> createState() => _DownloadsPanelState();
}

class _DownloadsPanelState extends ConsumerState<DownloadsPanel> {
  List<_StorageBreakdownItem>? _breakdown;
  List<DownloadedItem>? _itemsBySize;
  final Set<String> _selected = {};
  final Set<String> _expandedSeries = {};
  final FocusNode _initialContentFocusNode = FocusNode(
    debugLabel: 'DownloadsPanelInitialContent',
  );
  bool _selectMode = false;

  @override
  void initState() {
    super.initState();
    _loadBreakdown();
  }

  @override
  void dispose() {
    _initialContentFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadBreakdown() async {
    final repo = GetIt.instance<OfflineRepository>();
    final allItems = await repo.getItems();

    int movieBytes = 0,
        tvBytes = 0,
        musicBytes = 0,
        bookBytes = 0,
        videoBytes = 0,
        imageBytes = 0;
    for (final item in allItems) {
      final size = item.fileSizeBytes;
      switch (item.type) {
        case 'Movie':
          movieBytes += size;
        case 'Episode':
          tvBytes += size;
        case 'Audio' || 'AudioBook':
          musicBytes += size;
        case 'Book':
          bookBytes += size;
        case 'MusicVideo' || 'Video':
          videoBytes += size;
      }
    }

    final storagePath = GetIt.instance<StoragePathService>();
    final imageDir = await storagePath.getImageCacheDir();
    if (await imageDir.exists()) {
      await for (final entity in imageDir.list(recursive: true)) {
        if (entity is File) {
          imageBytes += await entity.length();
        }
      }
    }

    final dbFile = await storagePath.getDatabaseFile();
    final dbBytes = await dbFile.exists() ? await dbFile.length() : 0;

    const downloadableTypes = {
      'Movie',
      'Episode',
      'Audio',
      'AudioBook',
      'Book',
      'MusicVideo',
      'Video',
    };
    final downloadable =
        allItems
            .where(
              (i) => i.fileSizeBytes > 0 && downloadableTypes.contains(i.type),
            )
            .toList()
          ..sort((a, b) => b.fileSizeBytes.compareTo(a.fileSizeBytes));

    if (mounted) {
      final l10n = AppLocalizations.of(context);
      setState(() {
        _breakdown = [
          _StorageBreakdownItem(l10n.movies, movieBytes, AppColorScheme.accent),
          _StorageBreakdownItem(
            l10n.tvShows,
            tvBytes,
            AppColorScheme.statusAvailable,
          ),
          _StorageBreakdownItem(
            l10n.musicAndAudiobooks,
            musicBytes,
            AppColorScheme.statusDownloading,
          ),
          _StorageBreakdownItem(
            l10n.books,
            bookBytes,
            AppColorScheme.statusRequested,
          ),
          _StorageBreakdownItem(l10n.videos, videoBytes, AppColors.blue300),
          _StorageBreakdownItem(l10n.images, imageBytes, AppColors.orange500),
          _StorageBreakdownItem(
            l10n.database,
            dbBytes,
            AppColorScheme.statusPending,
          ),
        ];
        _itemsBySize = downloadable;
      });
    }
  }

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
    targetNode: PlatformDetection.isTV ? _initialContentFocusNode : null,
    child: _buildContent(context),
  );

  void _closePanel() {
    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }

  /// Opens the item with autoplay rather than starting playback here, so the
  /// detail screen still decides the resume position and the track selection,
  /// and playback stays local first and picks up the downloaded copy.
  void _playItem(DownloadedItem item) {
    _closePanel();
    context.navigateTopLevel(
      Destinations.item(item.itemId, serverId: item.serverId, autoPlay: true),
    );
  }

  Widget _buildContent(BuildContext context) {
    final storage = ref.watch(storageUsedProvider);
    final prefs = ref.watch(userPreferencesProvider);
    final storageLimitMb = prefs.get(UserPreferences.downloadStorageLimitMb);
    final l10n = AppLocalizations.of(context);
    final hasActiveDownloads =
        PlatformDetection.isTV &&
        GetIt.instance.isRegistered<DownloadService>() &&
        GetIt.instance<DownloadService>().activeDownloads.values.any(
          (progress) => !progress.isComplete && progress.error == null,
        );
    final hasDownloadedItems = _itemsBySize?.isNotEmpty ?? false;
    final finishedLoading = _itemsBySize != null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // This is the first route of the panel's own navigator, so the app bar
        // has nothing to imply a leading button from, and on a phone or tablet
        // the panel covers the barrier that would otherwise dismiss it. Without
        // this the only way out is to kill the app. A TV closes with the remote
        // and needs no button.
        leading: PlatformDetection.isTV
            ? null
            : IconButton(onPressed: _closePanel, icon: const Icon(Icons.close)),
        automaticallyImplyLeading: false,
        title: Text(l10n.savedMedia),
        actions: [
          const SyncIndicator(),
          if (!PlatformDetection.isTV && _selectMode && _selected.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete, color: AppColorScheme.statusRequested),
              onPressed: _bulkDelete,
            ),
          if (!PlatformDetection.isTV && hasDownloadedItems)
            IconButton(
              icon: Icon(_selectMode ? Icons.close : Icons.checklist),
              onPressed: () => setState(() {
                _selectMode = !_selectMode;
                if (!_selectMode) _selected.clear();
              }),
            ),
          if (!PlatformDetection.isTV)
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () =>
                  context.pushSettingsScreen(const DownloadSettingsScreen()),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          storage.when(
            data: (bytes) =>
                _TotalStorageHeader(totalBytes: bytes, limitMb: storageLimitMb),
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          _ActiveDownloadsSection(
            initialFocusNode: PlatformDetection.isTV && hasActiveDownloads
                ? _initialContentFocusNode
                : null,
          ),
          const SizedBox(height: 24),
          if (_breakdown != null) _buildBreakdownSection(),
          const SizedBox(height: 24),
          if (hasDownloadedItems)
            _buildItemsSection(
              initialFocusNode: PlatformDetection.isTV && !hasActiveDownloads
                  ? _initialContentFocusNode
                  : null,
            ),
          const SizedBox(height: 24),
          _buildStorageLimitSetting(
            storageLimitMb,
            focusNode:
                PlatformDetection.isTV &&
                    !hasActiveDownloads &&
                    finishedLoading &&
                    !hasDownloadedItems
                ? _initialContentFocusNode
                : null,
          ),
          const SizedBox(height: 16),
          _buildDeleteAllButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildBreakdownSection() {
    final total = _breakdown!.fold<int>(0, (sum, item) => sum + item.bytes);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).storageBreakdown,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        if (total > 0)
          ClipRRect(
            borderRadius: AppRadius.circular(4),
            child: SizedBox(
              height: 12,
              child: Row(
                children: _breakdown!
                    .where((b) => b.bytes > 0)
                    .map(
                      (b) => Expanded(
                        flex: b.bytes,
                        child: Container(color: b.color),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        const SizedBox(height: 12),
        ..._breakdown!.map(
          (b) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: b.color,
                    borderRadius: AppRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    b.label,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                Text(
                  formatBytes(b.bytes),
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemsSection({FocusNode? initialFocusNode}) {
    final l10n = AppLocalizations.of(context);
    final groups = groupDownloads(_itemsBySize!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.downloadedItems,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (PlatformDetection.isTV)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (_selectMode && _selected.isNotEmpty)
                    OutlinedButton.icon(
                      onPressed: _bulkDelete,
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColorScheme.statusRequested,
                      ),
                      label: Text(l10n.deleteSelected),
                    ),
                  OutlinedButton.icon(
                    onPressed: () => setState(() {
                      _selectMode = !_selectMode;
                      if (!_selectMode) _selected.clear();
                    }),
                    icon: Icon(_selectMode ? Icons.close : Icons.checklist),
                    label: Text(_selectMode ? l10n.cancel : l10n.select),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
        for (var index = 0; index < groups.length; index++)
          if (groups[index].isSeries)
            _buildSeriesGroup(
              groups[index],
              focusNode: index == 0 ? initialFocusNode : null,
            )
          else
            _buildItemTile(
              groups[index].first,
              focusNode: index == 0 ? initialFocusNode : null,
            ),
      ],
    );
  }

  /// A series collapses to one row saying how many episodes are actually on the
  /// device, which a flat list of episode names never answered, and opens to
  /// show which ones they are.
  Widget _buildSeriesGroup(DownloadGroup group, {FocusNode? focusNode}) {
    final l10n = AppLocalizations.of(context);
    final ids = group.itemIds;
    final selectedCount = ids.where(_selected.contains).length;
    if (PlatformDetection.isTV) {
      final expanded = _expandedSeries.contains(group.key);
      void activate() => setState(() {
        if (_selectMode) {
          // A partly selected series fills up first, so select always means all.
          if (selectedCount == ids.length) {
            _selected.removeAll(ids);
          } else {
            _selected.addAll(ids);
          }
        } else if (expanded) {
          _expandedSeries.remove(group.key);
        } else {
          _expandedSeries.add(group.key);
        }
      });

      return Column(
        children: [
          DpadListTile(
            focusNode: focusNode,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            outerPadding: const EdgeInsets.symmetric(vertical: 4),
            leading: _selectMode
                ? ExcludeFocus(
                    child: Checkbox(
                      value: selectedCount == 0
                          ? false
                          : selectedCount == ids.length
                          ? true
                          : null,
                      tristate: true,
                      onChanged: (_) => activate(),
                    ),
                  )
                // No explicit color on TV: the tile's icon palette already
                // inverts when the highlight fills with a light color.
                : const Icon(Icons.video_library_outlined),
            title: Text(
              group.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(l10n.episodeCount(group.items.length)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(formatBytes(group.totalBytes)),
                if (!_selectMode) ...[
                  const SizedBox(width: 4),
                  Icon(expanded ? Icons.expand_less : Icons.expand_more),
                ],
              ],
            ),
            onTap: activate,
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(children: group.items.map(_buildItemTile).toList()),
            ),
        ],
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(left: 16),
        leading: _selectMode
            ? Checkbox(
                value: selectedCount == ids.length,
                tristate: true,
                onChanged: (_) => setState(() {
                  if (selectedCount == ids.length) {
                    _selected.removeAll(ids);
                  } else {
                    _selected.addAll(ids);
                  }
                }),
              )
            : Icon(
                Icons.video_library_outlined,
                color: AppColorScheme.onSurface.withValues(alpha: 0.38),
              ),
        title: Text(
          group.title,
          style: TextStyle(color: AppColorScheme.onSurface),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          l10n.episodeCount(group.items.length),
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.38),
            fontSize: 12,
          ),
        ),
        trailing: Text(
          formatBytes(group.totalBytes),
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
        children: group.items.map(_buildItemTile).toList(),
      ),
    );
  }

  Widget _buildItemTile(DownloadedItem item, {FocusNode? focusNode}) {
    final l10n = AppLocalizations.of(context);
    final isSelected = _selected.contains(item.itemId);
    // A book opens a reader rather than a player.
    final isBook = item.type == 'Book';
    final numberLabel = episodeNumberLabel(item);
    final subtitle = item.type == 'Episode' && numberLabel != null
        ? '$numberLabel • ${item.qualityPreset}'
        : '${item.type} • ${item.qualityPreset}';
    return DpadListTile(
      focusNode: focusNode,
      contentPadding: PlatformDetection.isTV
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      outerPadding: PlatformDetection.isTV
          ? const EdgeInsets.symmetric(vertical: 4)
          : null,
      leading: _selectMode
          ? PlatformDetection.isTV
                ? ExcludeFocus(
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (_) => setState(() {
                        isSelected
                            ? _selected.remove(item.itemId)
                            : _selected.add(item.itemId);
                      }),
                    ),
                  )
                : Checkbox(
                    value: isSelected,
                    onChanged: (_) => setState(() {
                      isSelected
                          ? _selected.remove(item.itemId)
                          : _selected.add(item.itemId);
                    }),
                  )
          : Icon(
              switch (item.type) {
                'Audio' || 'AudioBook' => Icons.music_note_outlined,
                'Book' => Icons.menu_book_outlined,
                _ => Icons.movie_outlined,
              },
              // On TV the tile's icon palette inverts on focus, so an
              // explicit color would disappear on the light fill.
              color: PlatformDetection.isTV
                  ? null
                  : AppColorScheme.onSurface.withValues(alpha: 0.38),
            ),
      title: Text(
        item.name,
        style: PlatformDetection.isTV
            ? null
            : TextStyle(color: AppColorScheme.onSurface),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: PlatformDetection.isTV
            ? null
            : TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.38),
                fontSize: 12,
              ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatBytes(item.fileSizeBytes),
            style: PlatformDetection.isTV
                ? null
                : TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                  ),
          ),
          // While selecting, a tap belongs to the selection.
          if (!_selectMode && !isBook)
            PlatformDetection.isTV
                ? const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.play_arrow),
                  )
                : IconButton(
                    icon: const Icon(Icons.play_arrow),
                    tooltip: l10n.play,
                    onPressed: () => _playItem(item),
                  ),
        ],
      ),
      onTap: _selectMode
          ? () => setState(() {
              isSelected
                  ? _selected.remove(item.itemId)
                  : _selected.add(item.itemId);
            })
          : isBook
          ? null
          : () => _playItem(item),
    );
  }

  Widget _buildStorageLimitSetting(int currentLimitMb, {FocusNode? focusNode}) {
    final l10n = AppLocalizations.of(context);
    if (PlatformDetection.isTV) {
      return DpadListTile(
        focusNode: focusNode,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        outerPadding: const EdgeInsets.symmetric(vertical: 4),
        title: Text(l10n.storageLimit),
        subtitle: Text(
          currentLimitMb == 0
              ? l10n.noLimit
              : l10n.gbValue((currentLimitMb / 1024).toStringAsFixed(1)),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => DownloadSettingsScreen.showStorageLimitPicker(
          context,
          ref.read(userPreferencesProvider),
          currentLimitMb,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.storageLimit,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          currentLimitMb == 0
              ? l10n.noLimit
              : '${(currentLimitMb / 1024).toStringAsFixed(1)} GB',
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
            fontSize: 13,
          ),
        ),
        adaptiveSlider(
          value: currentLimitMb.toDouble(),
          min: 0,
          max: 102400,
          divisions: 20,
          label: currentLimitMb == 0
              ? l10n.noLimit
              : '${(currentLimitMb / 1024).toStringAsFixed(1)} GB',
          onChanged: (value) {
            ref
                .read(userPreferencesProvider)
                .set(UserPreferences.downloadStorageLimitMb, value.round());
          },
        ),
      ],
    );
  }

  Widget _buildDeleteAllButton() {
    return Center(
      child: OutlinedButton.icon(
        icon: Icon(Icons.delete_forever, color: AppColorScheme.statusRequested),
        label: Text(
          AppLocalizations.of(context).deleteAllDownloads,
          style: TextStyle(color: AppColorScheme.statusRequested),
        ),
        style: OutlinedButton.styleFrom(
          side: ThemeRegistry.active.borders.chipBorder.copyWith(
            color: AppColorScheme.statusRequested,
          ),
        ),
        onPressed: _confirmDeleteAll,
      ),
    );
  }

  Future<void> _bulkDelete() async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.deleteSelected),
        content: Text(l10n.deleteSelectedCount(_selected.length)),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.statusRequested,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final repo = GetIt.instance<OfflineRepository>();
    final downloadService = GetIt.instance<DownloadService>();

    for (final itemId in _selected) {
      final item = await repo.getItem(itemId);
      if (item == null) continue;
      await downloadService.deleteDownloadedFiles(
        AggregatedItem.fromOffline(item),
      );
    }

    setState(() {
      _selected.clear();
      _selectMode = false;
    });
    _loadBreakdown();
  }

  Future<void> _confirmDeleteAll() async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.deleteAllDownloads),
        content: Text(l10n.deleteAllDownloadsWarning),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.statusRequested,
            ),
            child: Text(l10n.deleteAll),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final downloadService = GetIt.instance<DownloadService>();
    await downloadService.clearAllDownloads();
    _loadBreakdown();
  }
}

/// Live list of in-flight downloads with per-item cancel and cancel-all.
class _ActiveDownloadsSection extends StatelessWidget {
  const _ActiveDownloadsSection({this.initialFocusNode});

  final FocusNode? initialFocusNode;

  // Status texts must follow the tile's focus-inverted palette on TV: an
  // explicit onSurface color would vanish on the focused tile's light fill.
  // On other platforms the muted explicit color stays.
  /// "1.2 GB of 4.6 GB • 25.3 MB/s • 2m 10s remaining" for a running
  /// original-file transfer, omitting whatever is not known yet. Null when
  /// nothing is, or while the item is queued or finalizing.
  String? _transferStatusLine(AppLocalizations l10n, DownloadProgress p) {
    if (p.isQueued || p.isFinalizing) return null;
    final parts = <String>[
      if (p.totalBytes > 0 && p.bytesReceived > 0)
        l10n.downloadBytesOfTotal(
          formatBytes(p.bytesReceived),
          formatBytes(p.totalBytes),
        ),
      if (p.bytesPerSecond != null)
        l10n.downloadSpeed(formatBytes(p.bytesPerSecond!)),
      if (p.etaSeconds != null) l10n.timeRemaining(formatEta(p.etaSeconds!)),
    ];
    return parts.isEmpty ? null : parts.join(' • ');
  }

  TextStyle? get _statusTextStyle => PlatformDetection.isTV
      ? null
      : TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          fontSize: 12,
        );

  @override
  Widget build(BuildContext context) {
    if (!GetIt.instance.isRegistered<DownloadService>()) {
      return const SizedBox.shrink();
    }
    final service = GetIt.instance<DownloadService>();
    final l10n = AppLocalizations.of(context);
    final statusStyle = _statusTextStyle;

    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        // Running transfers first, then the queue in order. A series can
        // queue hundreds of episodes; listing them all is noise and, in this
        // non-lazy column, costly on every update, so only the head of the
        // queue gets a tile and the rest is one summary row.
        final running = <DownloadProgress>[];
        final queued = <DownloadProgress>[];
        for (final p in service.activeDownloads.values) {
          if (p.isComplete || p.error != null) continue;
          (p.isQueued ? queued : running).add(p);
        }
        if (running.isEmpty && queued.isEmpty) return const SizedBox.shrink();
        final active = [...running, ...queued.take(_maxQueuedTiles)];
        final hiddenQueued = queued.length - (active.length - running.length);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    service.isBatchDownloading
                        ? '${l10n.download} (${service.completedCount}/${service.totalQueued})'
                        : l10n.download,
                    style: TextStyle(
                      color: AppColorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: service.cancelAll,
                  child: Text(
                    l10n.cancel,
                    style: TextStyle(color: AppColorScheme.statusRequested),
                  ),
                ),
              ],
            ),
            for (var index = 0; index < active.length; index++)
              DpadListTile(
                focusNode: index == 0 ? initialFocusNode : null,
                contentPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                outerPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(vertical: 4)
                    : null,
                title: Text(
                  active[index].fileName,
                  style: PlatformDetection.isTV
                      ? null
                      : TextStyle(color: AppColorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (active[index].isTranscoded && !active[index].isQueued)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            active[index].etaSeconds != null
                                ? l10n.timeRemaining(
                                    formatEta(active[index].etaSeconds!),
                                  )
                                : l10n.transcodingTimeRemainingUnavailable,
                            style: statusStyle,
                          ),
                        )
                      else if (_transferStatusLine(l10n, active[index])
                          case final line?)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(line, style: statusStyle),
                        ),
                      // A subscription picked this quality; say why the
                      // transfer is fragile so a restart is not a surprise.
                      if (active[index].isTranscoded &&
                          !active[index].isQueued &&
                          service.sourceOf(active[index].itemId) ==
                              DownloadSource.auto)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            l10n.autoDownloadTranscodedRunningNote,
                            style: statusStyle,
                          ),
                        ),
                      _TileTrackedProgress(
                        value: active[index].isQueued
                            ? 0
                            : active[index].isFinalizing ||
                                  active[index].progress < 0
                            ? null
                            : active[index].progress,
                      ),
                      if (active[index].isFinalizing)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            l10n.finalizingDownload,
                            style: statusStyle,
                          ),
                        ),
                      if (active[index].isQueued)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(l10n.queuedDownload, style: statusStyle),
                        ),
                    ],
                  ),
                ),
                trailing: PlatformDetection.isTV
                    ? const Icon(Icons.close)
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () =>
                            service.cancelDownload(active[index].itemId),
                      ),
                onTap: PlatformDetection.isTV
                    ? () => service.cancelDownload(active[index].itemId)
                    : null,
              ),
            if (hiddenQueued > 0)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PlatformDetection.isTV ? 16 : 0,
                  vertical: 8,
                ),
                child: Text(
                  l10n.queuedMoreCount(hiddenQueued),
                  style: statusStyle,
                ),
              ),
          ],
        );
      },
    );
  }

  static const _maxQueuedTiles = 10;
}

class _TotalStorageHeader extends StatelessWidget {
  final int totalBytes;
  final int limitMb;

  const _TotalStorageHeader({required this.totalBytes, required this.limitMb});

  @override
  Widget build(BuildContext context) {
    final limitBytes = limitMb * 1024 * 1024;
    final fraction = limitBytes > 0
        ? (totalBytes / limitBytes).clamp(0.0, 1.0)
        : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatBytes(totalBytes),
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (limitMb > 0) ...[
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: fraction,
            backgroundColor: AppColorScheme.onSurface.withValues(alpha: 0.12),
            color: fraction > 0.9
                ? AppColorScheme.statusRequested
                : AppColorScheme.accent,
          ),
          const SizedBox(height: 4),
          Text(
            AppLocalizations.of(
              context,
            ).ofStorageLimit(formatBytes(limitBytes)),
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.54),
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }
}

class _StorageBreakdownItem {
  final String label;
  final int bytes;
  final Color color;
  const _StorageBreakdownItem(this.label, this.bytes, this.color);
}

/// Download progress bar for use inside a tile subtitle. The unfilled track
/// follows the tile's effective text color, which the TV focus highlight
/// inverts to the dark palette while the tile is focused, so the track stays
/// visible on the light focus fill. Off TV the track keeps the surface token.
class _TileTrackedProgress extends StatelessWidget {
  const _TileTrackedProgress({this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    final base = PlatformDetection.isTV
        ? DefaultTextStyle.of(context).style.color ?? AppColorScheme.onSurface
        : AppColorScheme.onSurface;
    return ClipRRect(
      borderRadius: AppRadius.circular(2),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: base.withValues(alpha: 0.12),
        color: AppColorScheme.accent,
        minHeight: 4,
      ),
    );
  }
}
