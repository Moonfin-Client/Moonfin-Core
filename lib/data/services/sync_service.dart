import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../database/offline_database.dart';
import '../repositories/offline_repository.dart';

enum SyncState { idle, syncing, done, error }

class SyncResult {
  final int synced;
  final int failed;
  const SyncResult({required this.synced, required this.failed});
}

class SyncService extends ChangeNotifier {
  final OfflineRepository _offlineRepo;

  SyncState _state = SyncState.idle;
  SyncState get state => _state;

  Timer? _doneResetTimer;

  SyncService(this._offlineRepo);

  Future<SyncResult> syncPlaybackProgress(MediaServerClient client) async {
    if (_state == SyncState.syncing) {
      return const SyncResult(synced: 0, failed: 0);
    }

    _setState(SyncState.syncing);

    final unsynced = await _offlineRepo.getUnsyncedProgress();
    if (unsynced.isEmpty) {
      _setState(SyncState.done);
      _scheduleDoneReset();
      return const SyncResult(synced: 0, failed: 0);
    }

    int synced = 0, failed = 0;

    // Batch-fetch server progress for every unsynced item in one request
    // instead of a round-trip per item on reconnect.
    final serverUserData = await _fetchServerUserData(
      client,
      unsynced.map((i) => i.itemId).toList(),
    );

    for (final item in unsynced) {
      try {
        final userData = serverUserData[item.itemId];
        if (userData != null) {
          final serverPlayed = userData['Played'] as bool? ?? false;
          final serverTicks = userData['PlaybackPositionTicks'] as int? ?? 0;
          final localPlayed = item.playbackPositionTicks == 0;

          if (serverPlayed) {
            // Server already finished it, adopt played state locally.
            await _offlineRepo.updatePlaybackPosition(item.itemId, 0);
            await _offlineRepo.markProgressSynced(item.itemId);
            synced++;
            continue;
          }

          // Otherwise furthest progress wins, but a local completion outranks
          // any partial server position, so leave it to be pushed below.
          if (!localPlayed && serverTicks > item.playbackPositionTicks) {
            await _offlineRepo.updatePlaybackPosition(item.itemId, serverTicks);
            await _offlineRepo.markProgressSynced(item.itemId);
            synced++;
            continue;
          }
        }

        if (item.playbackPositionTicks == 0) {
          await client.userLibraryApi.markPlayed(item.itemId);
        } else {
          final report = PlaybackStopReport(
            itemId: item.itemId,
            mediaSourceId: item.itemId,
            positionTicks: item.playbackPositionTicks,
          );
          await client.playbackApi.reportPlaybackStopped(report.toJson());
        }
        await _offlineRepo.markProgressSynced(item.itemId);
        synced++;
      } catch (_) {
        failed++;
      }
    }

    _setState(failed > 0 && synced == 0 ? SyncState.error : SyncState.done);
    _scheduleDoneReset();
    return SyncResult(synced: synced, failed: failed);
  }

  /// Fetches the server's `UserData` for [itemIds] in a single query, keyed by
  /// item id. Returns an empty map on failure so callers fall back to pushing
  /// local progress. Ids are stringified because Emby returns them numerically.
  Future<Map<String, Map<String, dynamic>>> _fetchServerUserData(
    MediaServerClient client,
    List<String> itemIds,
  ) async {
    final result = <String, Map<String, dynamic>>{};
    if (itemIds.isEmpty) return result;
    try {
      final response = await client.itemsApi.getItems(
        ids: itemIds,
        fields: 'UserData',
      );
      final items = response['Items'] as List<dynamic>?;
      if (items != null) {
        for (final raw in items) {
          final map = raw as Map<String, dynamic>;
          final id = map['Id']?.toString();
          final userData = map['UserData'] as Map<String, dynamic>?;
          if (id != null && userData != null) {
            result[id] = userData;
          }
        }
      }
    } catch (_) {}
    return result;
  }

  Future<void> refreshMetadata(MediaServerClient client) async {
    final items = await _offlineRepo.getItems();
    for (final item in items.where((i) => i.downloadStatus == 2)) {
      try {
        final serverData = await client.itemsApi.getItem(item.itemId);
        final userData = serverData['UserData'] as Map<String, dynamic>?;
        int? serverTicks;
        if (userData != null) {
          final serverPlayed = userData['Played'] as bool? ?? false;
          serverTicks = serverPlayed ? 0 : (userData['PlaybackPositionTicks'] as int? ?? 0);
        }

        final localItem = await _offlineRepo.getItem(item.itemId);
        if (localItem == null) continue;
        final shouldUpdateTicks = localItem.progressSynced && serverTicks != null;

        await _offlineRepo.upsertItem(
          DownloadedItemsCompanion(
            itemId: Value(localItem.itemId),
            serverId: Value(localItem.serverId),
            type: Value(localItem.type),
            name: Value(localItem.name),
            metadataJson: Value(jsonEncode(serverData)),
            downloadStatus: Value(localItem.downloadStatus),
            localFilePath: Value(localItem.localFilePath),
            posterPath: Value(localItem.posterPath),
            backdropPath: Value(localItem.backdropPath),
            logoPath: Value(localItem.logoPath),
            thumbPath: Value(localItem.thumbPath),
            downloadProgress: Value(localItem.downloadProgress),
            errorMessage: Value(localItem.errorMessage),
            fileSizeBytes: Value(localItem.fileSizeBytes),
            downloadedAt: Value(localItem.downloadedAt),
            qualityPreset: Value(localItem.qualityPreset),
            seriesId: Value(localItem.seriesId),
            seasonId: Value(localItem.seasonId),
            seriesName: Value(localItem.seriesName),
            seasonName: Value(localItem.seasonName),
            indexNumber: Value(localItem.indexNumber),
            parentIndexNumber: Value(localItem.parentIndexNumber),
            progressSynced: Value(localItem.progressSynced),
            playbackPositionTicks: shouldUpdateTicks ? Value(serverTicks) : Value(localItem.playbackPositionTicks),
          ),
        );
      } catch (_) {
      }
    }
  }

  void _setState(SyncState newState) {
    _state = newState;
    notifyListeners();
  }

  void _scheduleDoneReset() {
    _doneResetTimer?.cancel();
    _doneResetTimer = Timer(const Duration(seconds: 5), () {
      if (_state == SyncState.done) {
        _setState(SyncState.idle);
      }
    });
  }

  @override
  void dispose() {
    _doneResetTimer?.cancel();
    super.dispose();
  }
}
