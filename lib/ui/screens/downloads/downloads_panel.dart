import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/database/offline_database.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../data/repositories/offline_repository.dart';
import '../../../data/services/download_service.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../di/providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/download_utils.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_slider.dart';
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
  bool _selectMode = false;

  @override
  void initState() {
    super.initState();
    _loadBreakdown();
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
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final storage = ref.watch(storageUsedProvider);
    final prefs = ref.watch(userPreferencesProvider);
    final storageLimitMb = prefs.get(UserPreferences.downloadStorageLimitMb);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(l10n.savedMedia),
        actions: [
          const SyncIndicator(),
          if (_selectMode && _selected.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete, color: AppColorScheme.statusRequested),
              onPressed: _bulkDelete,
            ),
          if (_itemsBySize != null && _itemsBySize!.isNotEmpty)
            IconButton(
              icon: Icon(_selectMode ? Icons.close : Icons.checklist),
              onPressed: () => setState(() {
                _selectMode = !_selectMode;
                if (!_selectMode) _selected.clear();
              }),
            ),
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
          const _ActiveDownloadsSection(),
          const SizedBox(height: 24),
          if (_breakdown != null) _buildBreakdownSection(),
          const SizedBox(height: 24),
          if (_itemsBySize != null && _itemsBySize!.isNotEmpty)
            _buildItemsSection(),
          const SizedBox(height: 24),
          _buildStorageLimitSetting(storageLimitMb),
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

  Widget _buildItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).downloadedItems,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ..._itemsBySize!.map((item) {
          final isSelected = _selected.contains(item.itemId);
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: _selectMode
                ? Checkbox(
                    value: isSelected,
                    onChanged: (_) => setState(() {
                      isSelected
                          ? _selected.remove(item.itemId)
                          : _selected.add(item.itemId);
                    }),
                  )
                : Icon(switch (item.type) {
                    'Audio' || 'AudioBook' => Icons.music_note_outlined,
                    'Book' => Icons.menu_book_outlined,
                    _ => Icons.movie_outlined,
                  }, color: AppColorScheme.onSurface.withValues(alpha: 0.38)),
            title: Text(
              item.name,
              style: TextStyle(color: AppColorScheme.onSurface),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${item.type} • ${item.qualityPreset}',
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.38),
                fontSize: 12,
              ),
            ),
            trailing: Text(
              formatBytes(item.fileSizeBytes),
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.54),
              ),
            ),
            onTap: _selectMode
                ? () => setState(() {
                    isSelected
                        ? _selected.remove(item.itemId)
                        : _selected.add(item.itemId);
                  })
                : null,
          );
        }),
      ],
    );
  }

  Widget _buildStorageLimitSetting(int currentLimitMb) {
    final l10n = AppLocalizations.of(context);
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
  const _ActiveDownloadsSection();

  @override
  Widget build(BuildContext context) {
    if (!GetIt.instance.isRegistered<DownloadService>()) {
      return const SizedBox.shrink();
    }
    final service = GetIt.instance<DownloadService>();
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        final active = service.activeDownloads.values
            .where((p) => !p.isComplete && p.error == null)
            .toList();
        if (active.isEmpty) return const SizedBox.shrink();

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
            ...active.map(
              (p) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  p.fileName,
                  style: TextStyle(color: AppColorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: p.progress >= 0 ? p.progress : null,
                      backgroundColor: AppColorScheme.onSurface.withValues(
                        alpha: 0.12,
                      ),
                      color: AppColorScheme.accent,
                      minHeight: 4,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => service.cancelDownload(p.itemId),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
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
