import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../../util/server_url.dart';
import '../database/offline_database.dart';
import '../models/aggregated_item.dart';
import '../models/download_source.dart';
import '../repositories/offline_repository.dart';
import 'auto_download_planner.dart';
import 'remove_watched_planner.dart';
import 'sync_service.dart';

/// The signed-in server: its client and the app's id for it.
typedef SignedInServer = ({MediaServerClient client, String serverId});

/// Deletes the download of [item] from [serverId], refusing it when the
/// downloads now belong to another server. Returns whether it went.
typedef DeleteServerDownload = Future<bool> Function(
  AggregatedItem item, {
  required String serverId,
});

/// Removes episodes and movies the user downloaded by hand once they are
/// watched, on every platform. What smart downloads and followed series
/// queued goes by their own settings.
///
/// A pass judges the played state stored in the downloads database, so it
/// runs where that state is fresh: at the end of the reconnect sync, right
/// after the metadata refresh, and after a downloaded item stops playing,
/// once that item's state was pulled from the server. It also runs when the
/// app resumes, when the setting changes and every hour, for the delays that
/// ran out since. Passes never overlap: one asked for while another runs
/// waits for it.
class RemoveWatchedService {
  RemoveWatchedService({
    required OfflineRepository repository,
    required UserPreferences prefs,
    required DeleteServerDownload deleteDownload,
    SignedInServer? Function()? signedInServer,
    bool Function()? syncInFlight,
    String? Function()? playingItemId,
    DateTime Function()? now,
    @visibleForTesting Duration stopDebounce = const Duration(seconds: 3),
  }) : _repository = repository,
       _prefs = prefs,
       _deleteDownload = deleteDownload,
       _signedInServer = signedInServer,
       _syncInFlight = syncInFlight,
       _playingItemId = playingItemId,
       _now = now ?? DateTime.now,
       _stopDebounce = stopDebounce;

  final OfflineRepository _repository;
  final UserPreferences _prefs;
  final DeleteServerDownload _deleteDownload;
  final SignedInServer? Function()? _signedInServer;

  /// Whether the reconnect sync is running. It ends with a pass of its own
  /// on fresh played state, so another one now would only race its writes.
  final bool Function()? _syncInFlight;
  final String? Function()? _playingItemId;
  final DateTime Function() _now;
  final Duration _stopDebounce;

  Future<int>? _pass;
  bool _passQueued = false;
  final _stoppedIds = <String>{};
  Timer? _stopTimer;
  Timer? _hourly;

  /// Starts the hourly pass. Desktops and TVs stay connected and in the
  /// foreground for days, so a delay that runs out between reconnects needs
  /// one. It only reads the downloads database. The service is resolved, and
  /// this called, by the first reconnect sync after sign-in.
  void start() {
    _hourly ??= Timer.periodic(
      const Duration(hours: 1),
      (_) => unawaited(runForSignedInServer()),
    );
  }

  bool get isEnabled =>
      _prefs.get(UserPreferences.downloadRemoveWatchedAfterHours) >= 0;

  /// Deletes the watched downloads of [serverId], which [client] talks to,
  /// and returns how many went. Asked for while a pass runs, it waits for
  /// that one; asks made meanwhile share the waiting pass.
  Future<int> run(MediaServerClient client, {required String serverId}) {
    final running = _pass;
    if (running == null) return _track(_runPass(client, serverId));
    if (_passQueued) return running;
    _passQueued = true;
    return _track(
      running.catchError((Object _) => 0).then((_) {
        _passQueued = false;
        return _runPass(client, serverId);
      }),
    );
  }

  Future<int> _track(Future<int> pass) {
    late final Future<int> tracked;
    tracked = pass.whenComplete(() {
      if (identical(_pass, tracked)) _pass = null;
    });
    return _pass = tracked;
  }

  /// [run], logging a failure instead of throwing it.
  Future<int> runSafely(
    MediaServerClient client, {
    required String serverId,
  }) async {
    try {
      return await run(client, serverId: serverId);
    } catch (e) {
      debugPrint('[RemoveWatched] Pass failed: $e');
      return 0;
    }
  }

  /// A pass for the signed-in server, when there is one and the reconnect
  /// sync is not about to run its own.
  Future<int> runForSignedInServer() async {
    final server = _signedInServer?.call();
    if (server == null || !isEnabled || (_syncInFlight?.call() ?? false)) {
      return 0;
    }
    return runSafely(server.client, serverId: server.serverId);
  }

  Future<int> _runPass(MediaServerClient client, String serverId) async {
    if (!isEnabled) return 0;
    final hours = _prefs.get(UserPreferences.downloadRemoveWatchedAfterHours);

    final downloadedAt = <String, DateTime?>{};
    final candidates = <RemoveWatchedCandidate>[];
    for (final row in await _repository.getItems(onlyCompleted: true)) {
      if (!removeWatchedTypes.contains(row.type) ||
          !_isOn(row, client, serverId)) {
        continue;
      }
      final AggregatedItem item;
      try {
        item = AggregatedItem.fromOffline(row);
      } catch (_) {
        // Unreadable metadata: nothing to judge it by.
        continue;
      }
      downloadedAt[row.itemId] = row.downloadedAt;
      candidates.add((
        item: item,
        downloadedAt: row.downloadedAt,
        progressSynced: row.progressSynced,
        source: DownloadSource.fromName(row.downloadSource),
      ));
    }

    final toDelete = planRemoveWatched(
      candidates,
      deleteAfter: Duration(hours: hours),
      now: _now(),
      watchedAfter: DateTime.tryParse(
        _prefs.get(UserPreferences.downloadRemoveWatchedSince),
      ),
      keptIds: _prefs.downloadKeptIdsFor(serverId),
      playingItemId: _playingItemId?.call(),
    );

    var deleted = 0;
    for (final item in toDelete) {
      // Deletes take a while: the rule, a Keep or playback may have changed
      // since the plan.
      if (!isEnabled ||
          isKeptDownload(item, _prefs.downloadKeptIdsFor(serverId)) ||
          item.id == _playingItemId?.call()) {
        continue;
      }
      // Re-queued at another quality since the snapshot: that row is not
      // the one judged watched.
      final current = await _rowOn(item.id, client, serverId);
      if (current == null ||
          current.downloadStatus != 2 ||
          current.downloadedAt != downloadedAt[item.id]) {
        continue;
      }
      if (await _deleteDownload(item, serverId: serverId)) deleted++;
    }
    if (toDelete.isNotEmpty) {
      debugPrint(
        '[RemoveWatched] Removed $deleted of ${toDelete.length} watched '
        'downloads',
      );
    }
    return deleted;
  }

  /// An episode or movie of [itemId] stopped playing, streamed or from its
  /// download. Debounced so a quick stop and start (the next episode, a
  /// re-resolve) fetches once, but every item stopped meanwhile is fetched.
  void onItemStopped(String itemId) {
    if (!isEnabled) return;
    _stoppedIds.add(itemId);
    _stopTimer?.cancel();
    _stopTimer = Timer(_stopDebounce, () => unawaited(_afterStops()));
  }

  /// Pulls each stopped download's played state from the server, then runs
  /// a pass. One request per item, rather than the reconnect sync's refresh
  /// of every download.
  Future<void> _afterStops() async {
    final itemIds = _stoppedIds.toList();
    _stoppedIds.clear();
    final server = _signedInServer?.call();
    if (server == null) return;
    var completed = false;
    for (final itemId in itemIds) {
      if (await _adoptServerCompletion(itemId, server)) completed = true;
    }
    if (completed) {
      await runSafely(server.client, serverId: server.serverId);
    }
  }

  /// Stores the server's completion of the download of [itemId], the
  /// reconnect sync's rule: a completion on the server wins over the
  /// position recorded locally, so the row counts as synced. Returns whether
  /// the server had it completed.
  Future<bool> _adoptServerCompletion(
    String itemId,
    SignedInServer server,
  ) async {
    final row = await _rowOn(itemId, server.client, server.serverId);
    if (row == null ||
        row.downloadStatus != 2 ||
        !removeWatchedTypes.contains(row.type)) {
      return false;
    }
    try {
      final serverItem = await server.client.itemsApi.getItem(itemId);
      final userData = (serverItem['UserData'] as Map?)
          ?.cast<String, dynamic>();
      if (userData == null || userData['Played'] != true) return false;
      await _repository.setSyncedPlaybackPosition(
        itemId,
        0,
        metadataJson: SyncService.mergeServerUserData(
          row.metadataJson,
          userData,
        ),
        serverId: row.serverId,
      );
      return true;
    } catch (e) {
      // Unreachable or gone: the next reconnect sync picks it up.
      debugPrint('[RemoveWatched] Could not refresh $itemId: $e');
      return false;
    }
  }

  /// This server's row for [itemId]. Emby ids are plain numbers, so another
  /// server's download can share one.
  Future<DownloadedItem?> _rowOn(
    String itemId,
    MediaServerClient client,
    String serverId,
  ) async {
    for (final row in await _repository.getItemsWithId(itemId)) {
      if (_isOn(row, client, serverId)) return row;
    }
    return null;
  }

  static bool _isOn(
    DownloadedItem row,
    MediaServerClient client,
    String serverId,
  ) =>
      isStoredServer(row.serverId, serverId: serverId, baseUrl: client.baseUrl);

  void dispose() {
    _stopTimer?.cancel();
    _hourly?.cancel();
  }
}
