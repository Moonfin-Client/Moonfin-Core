import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/download_source.dart';
import '../../../../data/services/download_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../util/download_utils.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/focus/dpad_list_tile.dart';

/// Transfers that are running or waiting, with their speed, ETA and a way to
/// stop them.
///
/// The tab stays even when nothing is downloading, so the tabs beside it don't
/// shuffle the moment a transfer starts or finishes.
class ActiveDownloadsTab extends StatelessWidget {
  const ActiveDownloadsTab({super.key, this.firstItemFocusNode});

  final FocusNode? firstItemFocusNode;

  static const _maxQueuedTiles = 10;

  /// "1.2 GB of 4.6 GB • 25.3 MB/s • 2m 10s remaining" for a running
  /// original-file transfer, leaving out whatever isn't known yet. Null while
  /// the item is queued or finalizing.
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
    final l10n = AppLocalizations.of(context);
    if (!GetIt.instance.isRegistered<DownloadService>()) {
      return _empty(context, l10n);
    }
    final service = GetIt.instance<DownloadService>();
    final statusStyle = _statusTextStyle;

    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        // Running transfers first, then the queue in order. A series can
        // queue hundreds of episodes, so only the head of the queue gets a
        // tile and the rest becomes one summary row.
        final running = <DownloadProgress>[];
        final queued = <DownloadProgress>[];
        for (final p in service.activeDownloads.values) {
          if (p.isComplete || p.error != null) continue;
          (p.isQueued ? queued : running).add(p);
        }
        if (running.isEmpty && queued.isEmpty) return _empty(context, l10n);

        final active = [...running, ...queued.take(_maxQueuedTiles)];
        final hiddenQueued = queued.length - (active.length - running.length);

        return ListView(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      service.isBatchDownloading
                          ? '${l10n.download} (${service.completedCount}/${service.totalQueued})'
                          : l10n.download,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: 15,
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
            ),
            for (var index = 0; index < active.length; index++)
              DpadListTile(
                focusNode: index == 0 ? firstItemFocusNode : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                outerPadding: const EdgeInsets.symmetric(vertical: 2),
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
                      // A subscription picked this quality, so say why the
                      // transfer is fragile and a restart isn't a surprise.
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
                      TileTrackedProgress(
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
                        tooltip: l10n.savedMediaCancelDownload,
                        onPressed: () =>
                            service.cancelDownload(active[index].itemId),
                      ),
                onTap: PlatformDetection.isTV
                    ? () => service.cancelDownload(active[index].itemId)
                    : null,
              ),
            if (hiddenQueued > 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
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

  Widget _empty(BuildContext context, AppLocalizations l10n) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        l10n.savedMediaNoActiveDownloads,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          fontSize: 14,
        ),
      ),
    ),
  );
}

/// Download progress bar for use inside a tile subtitle. The unfilled track
/// follows the tile's effective text color, which the TV focus highlight
/// inverts to the dark palette while the tile is focused, so the track stays
/// visible on the light focus fill. Off TV the track keeps the surface token.
class TileTrackedProgress extends StatelessWidget {
  const TileTrackedProgress({super.key, this.value});

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
