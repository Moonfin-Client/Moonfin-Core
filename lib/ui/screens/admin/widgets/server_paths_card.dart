import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';

class ServerPathsCard extends StatelessWidget {
  final StorageInfo storageInfo;

  const ServerPathsCard({super.key, required this.storageInfo});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final pathRows = <Widget>[];
    for (final row in [
      _pathTile(
        l10n.adminServerPathData,
        storageInfo.programDataPath,
        storageInfo.programDataFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathImageCache,
        storageInfo.imageCacheFolder?.path ?? '',
        storageInfo.imageCacheFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathCache,
        storageInfo.cachePath,
        storageInfo.cacheFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathLogs,
        storageInfo.logPath,
        storageInfo.logFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathMetadata,
        storageInfo.internalMetadataPath,
        storageInfo.internalMetadataFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathTranscode,
        storageInfo.transcodingTempPath,
        storageInfo.transcodingTempFolder,
        context,
      ),
      _pathTile(
        l10n.adminServerPathWeb,
        storageInfo.webFolder?.path ?? '',
        storageInfo.webFolder,
        context,
      ),
    ]) {
      if (row != null) {
        pathRows.add(row);
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.folder, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(l10n.adminServerPaths, style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            if (pathRows.isEmpty)
              Text(
                l10n.adminNoServerPathsReturned,
                style: theme.textTheme.bodySmall,
              )
            else
              ...pathRows,
          ],
        ),
      ),
    );
  }

  Widget? _pathTile(
    String label,
    String path,
    FolderStorageInfo? storage,
    BuildContext context,
  ) {
    if (path.trim().isEmpty) return null;
    final l10n = AppLocalizations.of(context);

    final hasCapacity = storage != null && storage.totalSpace > 0;
    final double usageFrac =
        hasCapacity ? storage.usageFraction.clamp(0.0, 1.0) : 0;
    final bool critical = usageFrac >= 0.90;
    final bool warning = usageFrac >= 0.75;
    final Color barColor = critical
      ? AppColorScheme.statusRequested
        : warning
        ? AppColorScheme.statusPending
        : AppColorScheme.statusAvailable;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              if (critical) ...[
                const SizedBox(width: 6),
                Icon(Icons.warning_amber,
                    size: 13, color: AppColorScheme.statusPending),
              ],
            ],
          ),
          const SizedBox(height: 2),
          Text(
            path,
            style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          if (hasCapacity) ...[
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: AppRadius.circular(999),
              child: LinearProgressIndicator(
                minHeight: 4,
                value: usageFrac,
                color: barColor,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.adminPercentUsed((usageFrac * 100).round()),
                  style: TextStyle(
                    fontSize: 11,
                    color: barColor,
                    fontWeight:
                        warning ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                Text(
                  '${_formatBytes(storage.usedSpace)} / ${_formatBytes(storage.totalSpace)}',
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) {
      return '0 B';
    }

    const units = ['B', 'KiB', 'MiB', 'GiB', 'TiB', 'PiB'];
    var size = bytes.toDouble();
    var unitIndex = 0;
    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }

    final fraction = size >= 100 ? 0 : (size >= 10 ? 1 : 2);
    return '${size.toStringAsFixed(fraction)} ${units[unitIndex]}';
  }
}
