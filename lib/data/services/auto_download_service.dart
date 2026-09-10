import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../../util/download_utils.dart';
import '../../util/platform_detection.dart';
import '../database/offline_database.dart';
import '../models/aggregated_item.dart';
import '../models/download_quality.dart';
import '../models/download_source.dart';
import '../repositories/offline_repository.dart';
import 'auto_download_downloader.dart';
import 'auto_download_planner.dart';

/// What started a subscription check. Background runs are budgeted and skip
/// transcoded subscriptions, which need a live server encode the OS may cut
/// off; everything else runs unrestricted.
enum AutoDownloadTrigger {
  serverConnected,
  appResumed,
  libraryChanged,
  userDataChanged,
  subscribed,
  manual,
  backgroundRefresh,
}

/// Outcome of one subscription check, kept for the settings screen.
class AutoDownloadRunSummary {
  const AutoDownloadRunSummary({
    required this.at,
    required this.trigger,
    this.subscriptions = 0,
    this.queued = 0,
    this.deleted = 0,
    this.storageFull = false,
    this.waitingForWifi = false,
    this.partial = false,
    this.error,
  });

  final DateTime at;
  final AutoDownloadTrigger trigger;
  final int subscriptions;
  final int queued;
  final int deleted;
  final bool storageFull;
  final bool waitingForWifi;

  /// A background run hit its time budget before every series was checked.
  final bool partial;
  final String? error;

  Map<String, dynamic> toJson() => {
    'at': at.toIso8601String(),
    'trigger': trigger.name,
    'subscriptions': subscriptions,
    'queued': queued,
    'deleted': deleted,
    'storageFull': storageFull,
    'waitingForWifi': waitingForWifi,
    'partial': partial,
    'error': error,
  };

  static AutoDownloadRunSummary? fromJson(String raw) {
    if (raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return AutoDownloadRunSummary(
        at: DateTime.parse(map['at'] as String),
        trigger: AutoDownloadTrigger.values.firstWhere(
          (t) => t.name == map['trigger'],
          orElse: () => AutoDownloadTrigger.manual,
        ),
        subscriptions: map['subscriptions'] as int? ?? 0,
        queued: map['queued'] as int? ?? 0,
        deleted: map['deleted'] as int? ?? 0,
        storageFull: map['storageFull'] as bool? ?? false,
        waitingForWifi: map['waitingForWifi'] as bool? ?? false,
        partial: map['partial'] as bool? ?? false,
        error: map['error'] as String?,
      );
    } catch (_) {
      return null;
    }
  }
}

/// An episode a check could not queue for lack of space, with the size
/// the check budgeted for it.
typedef BlockedEpisode = ({AggregatedItem episode, int bytes});

/// What one series contributed to a check.
typedef _SeriesOutcome = ({
  int queued,
  int deleted,
  List<BlockedEpisode> blocked,
});

/// Keeps followed series downloaded: on every trigger it fetches each
/// subscribed series, asks [planAutoDownload] what to queue or delete, and
/// hands the result to the download service.
///
/// One instance per signed-in server account; the server module replaces it
/// when the account changes. Checks are single-flight: a trigger that
/// arrives while a check runs shares that check's result.
class AutoDownloadService extends ChangeNotifier {
  AutoDownloadService({
    required OfflineRepository repository,
    required this.downloader,
    required UserPreferences prefs,
    required this.serverId,
    required this.userId,
    this.socketEvents,
    this.ready,
    this.playingItemId,
    this.onStorageFull,
    DateTime Function()? now,
    this.socketDebounce = const Duration(seconds: 30),
  }) : _repository = repository,
       _prefs = prefs,
       _now = now ?? DateTime.now {
    _lastRun = AutoDownloadRunSummary.fromJson(
      _prefs.get(UserPreferences.autoDownloadLastRun),
    );
  }

  /// Phones only: iOS and Android have a background scheduler for the
  /// checks; TV and desktop hide the feature until theirs exist.
  static bool get isSupportedPlatform =>
      (PlatformDetection.isIOS || PlatformDetection.isAndroid) &&
      !PlatformDetection.isTV;

  /// A transcode needs the server to keep encoding for the whole transfer,
  /// which neither an iOS background slot nor Android's download service
  /// (chunked responses cannot be promoted to it) can promise, so such
  /// subscriptions only run while the app is open.
  static bool isForegroundOnly(DownloadQuality quality) =>
      quality.isTranscoded;

  /// A connect or resume this soon after the last check is noise.
  static const throttle = Duration(minutes: 10);

  final OfflineRepository _repository;
  final AutoDownloadDownloader downloader;
  final UserPreferences _prefs;
  final Stream<ServerWebSocketMessage>? socketEvents;

  /// Completes once the download service has reconciled transfers that
  /// outlived the last process, so a check sees them as in flight.
  final Future<void>? ready;

  /// The item playing right now, which a check must not delete.
  final String? Function()? playingItemId;

  /// Told once when a full check starts holding episodes back for lack
  /// of space, and again only after a check that fit everything.
  final void Function(List<BlockedEpisode> blocked)? onStorageFull;
  final DateTime Function() _now;
  final String serverId;
  final String userId;
  final Duration socketDebounce;

  StreamSubscription<ServerWebSocketMessage>? _socketSub;
  Timer? _socketTimer;
  AutoDownloadTrigger? _pendingSocketTrigger;
  Future<AutoDownloadRunSummary>? _inFlight;
  String? _inFlightSeriesId;
  bool _inFlightScoped = false;
  AutoDownloadRunSummary? _lastRun;
  bool _disposed = false;

  AutoDownloadRunSummary? get lastRun => _lastRun;
  bool get isRunning => _inFlight != null;
  bool get isDisposed => _disposed;

  // ---------------------------------------------------------------------
  // Subscriptions

  Stream<List<AutoDownloadSubscription>> watchSubscriptions() =>
      _repository.watchSubscriptions(serverId: serverId, userId: userId);

  Stream<AutoDownloadSubscription?> watchSubscription(String seriesId) =>
      _repository.watchSubscription(
        seriesId: seriesId,
        serverId: serverId,
        userId: userId,
      );

  Future<AutoDownloadSubscription?> getSubscription(String seriesId) =>
      _repository.getSubscription(
        seriesId: seriesId,
        serverId: serverId,
        userId: userId,
      );

  /// Follows [series] and runs a check for it right away.
  Future<void> subscribe(
    AggregatedItem series, {
    required DownloadQuality quality,
  }) async {
    await _repository.upsertSubscription(
      AutoDownloadSubscriptionsCompanion(
        seriesId: Value(series.id),
        serverId: Value(serverId),
        userId: Value(userId),
        seriesName: Value(series.name),
        qualityPreset: Value(quality.name),
        createdAt: Value(_now()),
      ),
    );
    unawaited(
      runCheck(
        trigger: AutoDownloadTrigger.subscribed,
        onlySeriesId: series.id,
      ),
    );
  }

  /// Stops following a series. Downloaded episodes stay.
  Future<void> unsubscribe(String seriesId) => _repository.deleteSubscription(
    seriesId: seriesId,
    serverId: serverId,
    userId: userId,
  );

  // ---------------------------------------------------------------------
  // Triggers

  /// Starts listening to server events. Idempotent.
  void start() {
    final events = socketEvents;
    if (events == null || _socketSub != null) return;
    _socketSub = events.listen(_onSocketEvent);
  }

  void onServerConnected() =>
      _runUnlessRecent(AutoDownloadTrigger.serverConnected);

  void onAppResumed() => _runUnlessRecent(AutoDownloadTrigger.appResumed);

  void _runUnlessRecent(AutoDownloadTrigger trigger) {
    final last = _lastRun;
    if (last != null && _now().difference(last.at) < throttle) return;
    unawaited(runCheck(trigger: trigger));
  }

  void _onSocketEvent(ServerWebSocketMessage message) {
    final AutoDownloadTrigger trigger;
    switch (message) {
      case LibraryChangedMessage(:final itemsAdded) when itemsAdded.isNotEmpty:
        trigger = AutoDownloadTrigger.libraryChanged;
      case UserDataChangedMessage(:final userId) when userId == this.userId:
        trigger = AutoDownloadTrigger.userDataChanged;
      default:
        return;
    }
    // Servers burst these while a library scans; one check at the end of
    // the burst sees everything.
    _pendingSocketTrigger = trigger;
    _socketTimer?.cancel();
    _socketTimer = Timer(socketDebounce, () {
      final pending = _pendingSocketTrigger;
      _pendingSocketTrigger = null;
      if (pending != null && !_disposed) unawaited(runCheck(trigger: pending));
    });
  }

  // ---------------------------------------------------------------------
  // The check

  /// Checks every subscription (or just [onlySeriesId]) and queues or
  /// deletes what [planAutoDownload] decides. With a [deadline] the loop
  /// stops early and the summary is marked partial.
  ///
  /// A call that lands while a check runs shares that check, unless the
  /// running one is scoped to a single series and the call is not: then a
  /// full check follows as soon as the scoped one ends.
  Future<AutoDownloadRunSummary> runCheck({
    required AutoDownloadTrigger trigger,
    String? onlySeriesId,
    Duration? deadline,
  }) {
    if (_disposed) {
      return Future.value(
        _lastRun ?? AutoDownloadRunSummary(at: _now(), trigger: trigger),
      );
    }
    final inFlight = _inFlight;
    if (inFlight != null) {
      // The running check only answers for this request when it covers the
      // same ground. A full run doesn't cover a series followed after it
      // read its subscriptions, so that one waits and runs again.
      final covered = _inFlightScoped
          ? onlySeriesId != null && onlySeriesId == _inFlightSeriesId
          : onlySeriesId == null;
      if (covered) return inFlight;
      return inFlight.then(
        (_) => runCheck(
          trigger: trigger,
          onlySeriesId: onlySeriesId,
          deadline: deadline,
        ),
      );
    }
    final run = _run(
      trigger,
      onlySeriesId: onlySeriesId,
      deadline: deadline,
    ).whenComplete(() => _inFlight = null);
    _inFlight = run;
    _inFlightScoped = onlySeriesId != null;
    _inFlightSeriesId = onlySeriesId;
    notifyListeners();
    return run;
  }

  Future<AutoDownloadRunSummary> _run(
    AutoDownloadTrigger trigger, {
    String? onlySeriesId,
    Duration? deadline,
  }) async {
    final startedAt = _now();
    final endBy = deadline == null ? null : startedAt.add(deadline);

    AutoDownloadRunSummary summary;
    try {
      summary = await _check(
        trigger,
        startedAt: startedAt,
        onlySeriesId: onlySeriesId,
        endBy: endBy,
      );
    } catch (e) {
      summary = AutoDownloadRunSummary(
        at: startedAt,
        trigger: trigger,
        error: e.toString(),
      );
    }
    // A check scoped to one series must not overwrite the global summary
    // with a partial picture.
    if (onlySeriesId == null || _lastRun == null) {
      _lastRun = summary;
      // Writing a preference notifies every preference listener in the
      // app, so only checks with something to report are persisted.
      // A service disposed mid-check (sign-out) must not leave its summary
      // for the next account.
      if (!_disposed && (summary.subscriptions > 0 || summary.error != null)) {
        await _prefs.set(
          UserPreferences.autoDownloadLastRun,
          jsonEncode(summary.toJson()),
        );
      }
    }
    if (!_disposed) notifyListeners();
    return summary;
  }

  Future<AutoDownloadRunSummary> _check(
    AutoDownloadTrigger trigger, {
    required DateTime startedAt,
    required String? onlySeriesId,
    required DateTime? endBy,
  }) async {
    if (!_prefs.get(UserPreferences.autoDownloadEnabled)) {
      return AutoDownloadRunSummary(at: startedAt, trigger: trigger);
    }
    var subscriptions = await _repository.getSubscriptions(
      serverId: serverId,
      userId: userId,
    );
    if (onlySeriesId != null) {
      subscriptions = subscriptions
          .where((s) => s.seriesId == onlySeriesId)
          .toList();
    }
    if (subscriptions.isEmpty) {
      return AutoDownloadRunSummary(at: startedAt, trigger: trigger);
    }
    if (!await downloader.wifiPolicyAllowsDownload()) {
      return AutoDownloadRunSummary(
        at: startedAt,
        trigger: trigger,
        subscriptions: subscriptions.length,
        waitingForWifi: true,
      );
    }

    // Transfers adopted from the previous process must count as in flight,
    // or a cold background launch queues them a second time.
    await ready;
    final state = await _SharedState.load(_repository, downloader);
    final playing = playingItemId?.call();
    final keepSetting = _prefs.get(UserPreferences.autoDownloadKeepUnwatched);
    final keepUnwatched = keepSetting <= 0 ? null : keepSetting;
    final deleteAfterHours = _prefs.get(
      UserPreferences.autoDownloadDeleteAfterHours,
    );
    final deleteAfter = deleteAfterHours < 0
        ? null
        : Duration(hours: deleteAfterHours);

    var queued = 0;
    var deleted = 0;
    final blocked = <BlockedEpisode>[];
    var partial = false;
    String? firstError;

    for (final subscription in subscriptions) {
      if (_disposed) break;
      if (endBy != null && !_now().isBefore(endBy)) {
        partial = true;
        break;
      }
      final quality = DownloadQuality.fromName(subscription.qualityPreset);
      // A background run ends with its engine; only transfers the native
      // engine carries on its own are worth starting.
      if (trigger == AutoDownloadTrigger.backgroundRefresh &&
          !await downloader.canTransferInBackground(quality)) {
        continue;
      }
      _SeriesOutcome outcome;
      String? error;
      try {
        outcome = await _checkSeries(
          subscription.seriesId,
          newSince: subscription.createdAt,
          quality: quality,
          keepUnwatched: keepUnwatched,
          deleteAfter: deleteAfter,
          state: state,
          playingItemId: playing,
        );
      } catch (e) {
        error = e.toString();
        firstError ??= error;
        outcome = (queued: 0, deleted: 0, blocked: const []);
      }
      queued += outcome.queued;
      deleted += outcome.deleted;
      blocked.addAll(outcome.blocked);
      await _repository.updateSubscriptionCheck(
        seriesId: subscription.seriesId,
        serverId: serverId,
        userId: userId,
        checkedAt: _now(),
        queuedCount: outcome.queued,
        error: error,
      );
    }

    if (onlySeriesId == null && !_disposed) await _reportBlocked(blocked);

    return AutoDownloadRunSummary(
      at: startedAt,
      trigger: trigger,
      subscriptions: subscriptions.length,
      queued: queued,
      deleted: deleted,
      storageFull: blocked.isNotEmpty,
      partial: partial,
      error: firstError,
    );
  }

  /// Announces a shortage once: later checks that still hold episodes
  /// back stay quiet, and a check that fits everything resets the memory.
  Future<void> _reportBlocked(List<BlockedEpisode> blocked) async {
    final shown = _prefs.get(UserPreferences.autoDownloadStorageNoticeShown);
    final wantNotice = blocked.isNotEmpty;
    if (wantNotice == shown) return;
    await _prefs.set(
      UserPreferences.autoDownloadStorageNoticeShown,
      wantNotice,
    );
    if (wantNotice) onStorageFull?.call(blocked);
  }

  Future<_SeriesOutcome> _checkSeries(
    String seriesId, {
    required DateTime newSince,
    required DownloadQuality quality,
    required int? keepUnwatched,
    required Duration? deleteAfter,
    required _SharedState state,
    required String? playingItemId,
  }) async {
    final episodes = await downloader.fetchEpisodes(seriesId);
    int sizeOf(AggregatedItem episode) =>
        estimateDownloadSizeBytes(episode, quality);
    final plan = planAutoDownload(
      episodes: episodes,
      keepUnwatched: keepUnwatched,
      deleteAfter: deleteAfter,
      now: _now(),
      downloadedIds: state.downloadedIds,
      inFlightIds: state.inFlightIds,
      autoOwnedIds: state.autoOwnedIds,
      storageBudgetBytes: state.budget,
      sizeOf: sizeOf,
      newSince: newSince,
      playingItemId: playingItemId,
    );

    var deleted = 0;
    for (final episode in plan.toDelete) {
      if (await downloader.deleteDownloadedFiles(episode)) {
        deleted++;
        state.release(episode.id, sizeOf(episode));
      }
    }
    if (plan.toQueue.isNotEmpty) {
      await downloader.queueDownloads(
        plan.toQueue,
        quality: quality,
        source: DownloadSource.auto,
      );
      for (final episode in plan.toQueue) {
        state.reserve(episode.id, sizeOf(episode));
      }
    }
    return (
      queued: plan.toQueue.length,
      deleted: deleted,
      blocked: [
        for (final episode in plan.blocked)
          (episode: episode, bytes: sizeOf(episode)),
      ],
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _socketTimer?.cancel();
    _socketSub?.cancel();
    super.dispose();
  }
}

/// Snapshot of what is on disk, in flight and still allowed by the storage
/// limit, shared by every series in one check and kept current as the
/// check queues and deletes. Item ids are server GUIDs, so rows need no
/// server filter.
class _SharedState {
  _SharedState({
    required this.downloadedIds,
    required this.autoOwnedIds,
    required this.inFlightIds,
    required this.budget,
  });

  static Future<_SharedState> load(
    OfflineRepository repository,
    AutoDownloadDownloader downloader,
  ) async {
    final refs = await repository.getDownloadRefs();
    return _SharedState(
      downloadedIds: {
        for (final ref in refs)
          if (ref.downloadStatus == 2) ref.itemId,
      },
      autoOwnedIds: {
        for (final ref in refs)
          if (ref.downloadStatus == 2 &&
              DownloadSource.fromName(ref.downloadSource) ==
                  DownloadSource.auto)
            ref.itemId,
      },
      // Rows still marked in progress belong to transfers the download
      // service has adopted or is about to; never queue them twice.
      inFlightIds: {
        ...downloader.inFlightItemIds,
        for (final ref in refs)
          if (ref.downloadStatus == 1) ref.itemId,
      },
      budget: await downloader.storageHeadroomBytes(),
    );
  }

  final Set<String> downloadedIds;
  final Set<String> autoOwnedIds;
  final Set<String> inFlightIds;
  int? budget;

  void reserve(String itemId, int bytes) {
    inFlightIds.add(itemId);
    if (budget != null) budget = budget! - bytes;
  }

  void release(String itemId, int bytes) {
    downloadedIds.remove(itemId);
    autoOwnedIds.remove(itemId);
    if (budget != null) budget = budget! + bytes;
  }
}
