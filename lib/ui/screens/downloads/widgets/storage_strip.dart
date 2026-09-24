import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/repositories/offline_repository.dart';
import '../../../../data/services/storage_path_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../util/download_utils.dart';
import '../../../../util/focus/dpad_keys.dart';
import '../../../../util/focus/key_event_utils.dart';
import '../../../mixins/focus_state_mixin.dart';
import '../../../widgets/focus/focus_theme.dart';

/// What the downloads folder is holding, split into the slices the bar draws.
///
/// Labels and colours are resolved where the strip is built rather than here,
/// so reading the sizes needs no BuildContext and can start as soon as the
/// screen mounts.
enum StorageBucket { movies, tvShows, music, books, videos, images, database }

/// Reads the per-type split, plus the artwork cache and the database file,
/// neither of which is a row in the downloads table.
Future<Map<StorageBucket, int>> loadStorageBreakdown() async {
  final items = await GetIt.instance<OfflineRepository>().getItems();
  final bytes = {for (final bucket in StorageBucket.values) bucket: 0};

  void add(StorageBucket bucket, int size) =>
      bytes[bucket] = bytes[bucket]! + size;

  for (final item in items) {
    switch (item.type) {
      case 'Movie':
        add(StorageBucket.movies, item.fileSizeBytes);
      case 'Episode':
        add(StorageBucket.tvShows, item.fileSizeBytes);
      case 'Audio' || 'AudioBook':
        add(StorageBucket.music, item.fileSizeBytes);
      case 'Book':
        add(StorageBucket.books, item.fileSizeBytes);
      case 'MusicVideo' || 'Video':
        add(StorageBucket.videos, item.fileSizeBytes);
    }
  }

  final storagePath = GetIt.instance<StoragePathService>();
  final imageDir = await storagePath.getImageCacheDir();
  if (await imageDir.exists()) {
    await for (final entity in imageDir.list(recursive: true)) {
      if (entity is File) add(StorageBucket.images, await entity.length());
    }
  }

  final dbFile = await storagePath.getDatabaseFile();
  if (await dbFile.exists()) {
    add(StorageBucket.database, await dbFile.length());
  }
  return bytes;
}

String _bucketLabel(AppLocalizations l10n, StorageBucket bucket) =>
    switch (bucket) {
      StorageBucket.movies => l10n.movies,
      StorageBucket.tvShows => l10n.tvShows,
      StorageBucket.music => l10n.musicAndAudiobooks,
      StorageBucket.books => l10n.books,
      StorageBucket.videos => l10n.videos,
      StorageBucket.images => l10n.images,
      StorageBucket.database => l10n.database,
    };

Color _bucketColor(StorageBucket bucket) => switch (bucket) {
  StorageBucket.movies => AppColorScheme.accent,
  StorageBucket.tvShows => AppColorScheme.statusAvailable,
  StorageBucket.music => AppColorScheme.statusDownloading,
  StorageBucket.books => AppColorScheme.statusRequested,
  StorageBucket.videos => AppColors.blue300,
  StorageBucket.images => AppColors.orange500,
  StorageBucket.database => AppColorScheme.statusPending,
};

/// The total on one focusable line, opening to the per-type legend.
class StorageStrip extends StatefulWidget {
  const StorageStrip({
    super.key,
    required this.totalBytes,
    required this.limitMb,
    required this.itemCount,
    required this.breakdown,
    required this.expanded,
    required this.onToggle,
    required this.focusNode,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  final int totalBytes;
  final int limitMb;

  /// How many downloads the list holds. It rides on this line rather than the
  /// title bar, which it crowded out on a narrow panel while repeating the size.
  final int itemCount;

  /// Null until the sizes have been read, which leaves the bar an empty track.
  final Map<StorageBucket, int>? breakdown;
  final bool expanded;
  final VoidCallback onToggle;
  final FocusNode focusNode;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  @override
  State<StorageStrip> createState() => _StorageStripState();
}

class _StorageStripState extends State<StorageStrip>
    with FocusStateMixin<StorageStrip> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final limitBytes = widget.limitMb * 1024 * 1024;
    final ring = FocusTheme.resolveColor(context, focusColor);
    final slices = [
      for (final entry in (widget.breakdown ?? const {}).entries)
        if (entry.value > 0) entry,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: widget.focusNode,
          onFocusChange: setFocused,
          onKeyEvent: (node, event) => _onKey(event),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setHovered(true),
            onExit: (_) => setHovered(false),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onToggle,
              child: AnimatedContainer(
                duration: FocusTheme.animationDuration,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: FocusTheme.focusDecoration(
                  isFocused: showFocusBorder,
                  radius: 9,
                  color: ring,
                  backgroundColor: focused
                      ? ring.withValues(alpha: 0.13)
                      : null,
                ),
                child: Row(
                  children: [
                    Expanded(child: _bar(slices, limitBytes)),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        _usageLabel(l10n, limitBytes),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      widget.expanded ? Icons.expand_less : Icons.expand_more,
                      size: 18,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.expanded && slices.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 2),
            child: Wrap(
              spacing: 18,
              runSpacing: 6,
              children: [
                for (final slice in slices)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _bucketColor(slice.key),
                          borderRadius: AppRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${_bucketLabel(l10n, slice.key)}  ${formatBytes(slice.value)}',
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.62,
                          ),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
      ],
    );
  }

  /// "12 items • 56.4 GB of 80 GB", dropping the limit when none is set and the
  /// count when there is nothing saved.
  String _usageLabel(AppLocalizations l10n, int limitBytes) {
    final used = limitBytes > 0
        ? l10n.savedMediaOfLimit(
            formatBytes(widget.totalBytes),
            formatBytes(limitBytes),
          )
        : formatBytes(widget.totalBytes);
    if (widget.itemCount == 0) return used;
    return '${l10n.savedMediaCount(widget.itemCount)} • $used';
  }

  /// The slices sit against the limit when there is one, so the bar reads as
  /// how full the device is rather than just how the total splits up.
  Widget _bar(
    List<MapEntry<StorageBucket, int>> slices,
    int limitBytes,
  ) {
    final used = slices.fold<int>(0, (sum, slice) => sum + slice.value);
    final headroom = limitBytes > used ? limitBytes - used : 0;
    return ClipRRect(
      borderRadius: AppRadius.circular(4),
      child: SizedBox(
        height: 8,
        child: Row(
          // Each slice is an empty box, so without this they centre at zero
          // height and the bar reads as blank track.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (used == 0 && headroom == 0)
              Expanded(
                child: ColoredBox(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                ),
              ),
            for (final slice in slices)
              Expanded(
                flex: slice.value,
                child: ColoredBox(color: _bucketColor(slice.key)),
              ),
            if (headroom > 0)
              Expanded(
                flex: headroom,
                child: ColoredBox(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  KeyEventResult _onKey(KeyEvent event) {
    final handled = handleOneShotSelect(event, widget.onToggle);
    if (handled != KeyEventResult.ignored) return handled;
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isUpKey && widget.onNavigateUp != null) {
      widget.onNavigateUp!();
      return KeyEventResult.handled;
    }
    if (key.isDownKey && widget.onNavigateDown != null) {
      widget.onNavigateDown!();
      return KeyEventResult.handled;
    }
    return consumeIfEdge(event, atLeftEdge: true, atRightEdge: true);
  }
}
