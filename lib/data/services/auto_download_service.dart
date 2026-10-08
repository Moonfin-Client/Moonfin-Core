import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../../util/download_utils.dart';
import '../../util/platform_detection.dart';
import '../../util/server_url.dart';
import '../database/offline_database.dart';
import '../models/aggregated_item.dart';
import '../models/download_quality.dart';
import '../models/download_source.dart';
import '../repositories/offline_repository.dart';
import 'auto_download_downloader.dart';
import 'auto_download_planner.dart';
import 'smart_download_planner.dart';

/// What started a subscription check. Background runs are budgeted and skip
/// transcoded subscriptions, which need a live server encode the OS may cut
/// off; everything else runs unrestricted.
enum AutoDownloadTrigger {
  serverConnected,
  appResumed,
  libraryChanged,
  userDataChanged,
  playbackStopped,
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
    this.smartSeries = 0,
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

  /// Series smart downloads swapped episodes in.
  final int smartSeries;
  final int queued;
  final int deleted;
  final bool storageFull;
  final bool waitingForWifi;

  /// A background run hit its time budget before every series was checked.
  final bool partial;
  final String? error;

  /// Whether the check had anything to act on or report.
  bool get hasNews =>
      subscriptions > 0 || smartSeries > 0 || waitingForWifi || error != null;

  Map<String, dynamic> toJson() => {
    'at': at.toIso8601String(),
    'trigger': trigger.name,
    'subscriptions': subscriptions,
    'smartSeries': smartSeries,
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
        smartSeries: map['smartSeries'] as int? ?? 0,
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

/// One series a check fetches, with how to plan it once its episodes and
/// the size of each in [quality] are known.
typedef _SeriesTarget = ({
  String seriesId,
  DownloadQuality quality,
  AutoDownloadPlan Function(
    List<AggregatedItem> episodes,
    int Function(AggregatedItem episode) sizeOf,
  )
  plan,
});

/// What a check runs on: shared by every series it fetches.
typedef _Run = ({
  AutoDownloadTrigger trigger,
  DateTime? endBy,
  _SharedState state,
  _Tally tally,
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
    this.stopDebounce = const Duration(seconds: 3),
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

  /// How long after a stop a check runs, so the stop report lands first
  /// and a quick next episode joins the same check.
  final Duration stopDebounce;

  StreamSubscription<ServerWebSocketMessage>? _socketSub;
  Timer? _triggerTimer;
  AutoDownloadTrigger? _pendingTrigger;
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

  /// An episode of [itemServerId] just stopped playing, streamed or
  /// downloaded. Smart downloads checks shortly after, once the stop report
  /// has landed. A stop on another server leaves this one's check alone.
  void onEpisodeStopped(String itemServerId) {
    if (!_prefs.get(UserPreferences.smartDownloadsEnabled)) return;
    if (!isStoredServer(
      itemServerId,
      serverId: serverId,
      baseUrl: downloader.serverBaseUrl,
    )) {
      return;
    }
    _schedule(AutoDownloadTrigger.playbackStopped, stopDebounce);
  }

  /// The episodes to keep ready changed. A raise tops up the series being
  /// watched shortly after, without waiting for their next watch.
  void onKeepReadyChanged() {
    if (!_prefs.get(UserPreferences.smartDownloadsEnabled)) return;
    _schedule(AutoDownloadTrigger.manual, stopDebounce);
  }

  void _onSocketEvent(ServerWebSocketMessage message) {
    switch (message) {
      case LibraryChangedMessage(:final itemsAdded) when itemsAdded.isNotEmpty:
        _schedule(AutoDownloadTrigger.libraryChanged, socketDebounce);
      case UserDataChangedMessage(:final userId) when userId == this.userId:
        _schedule(AutoDownloadTrigger.userDataChanged, socketDebounce);
      default:
    }
  }

  /// Servers burst events while a library scans; one check at the end of
  /// the burst sees everything. A pending stop check is a full check due
  /// sooner, so the user data event the stop itself causes joins it.
  void _schedule(AutoDownloadTrigger trigger, Duration delay) {
    if (_pendingTrigger == AutoDownloadTrigger.playbackStopped &&
        (_triggerTimer?.isActive ?? false)) {
      return;
    }
    _pendingTrigger = trigger;
    _triggerTimer?.cancel();
    _triggerTimer = Timer(delay, () {
      final pending = _pendingTrigger;
      _pendingTrigger = null;
      if (pending != null && !_disposed) unawaited(runCheck(trigger: pending));
    });
  }

  /// Turns smart downloads on or off. Only what is watched from now on
  /// counts, so the stamps restart with each switch-on.
  Future<void> setSmartDownloadsEnabled(bool enabled) =>
      _prefs.batchNotifications(() async {
        final now = enabled ? _now().toUtc().toIso8601String() : '';
        await _prefs.set(UserPreferences.smartDownloadsEnabledAt, now);
        await _prefs.set(UserPreferences.smartDownloadsPlayedSince, now);
        await _prefs.set(
          UserPreferences.smartDownloadsAppliedKeepReady,
          enabled ? _prefs.get(UserPreferences.smartDownloadsKeepReady) : 0,
        );
        await _prefs.set(UserPreferences.smartDownloadsEnabled, enabled);
      });

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
      if (!_disposed && summary.hasNews) {
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
    var subscriptions = _prefs.get(UserPreferences.autoDownloadEnabled)
        ? await _repository.getSubscriptions(serverId: serverId, userId: userId)
        : <AutoDownloadSubscription>[];
    if (onlySeriesId != null) {
      subscriptions = subscriptions
          .where((s) => s.seriesId == onlySeriesId)
          .toList();
    }
    // A check scoped to a series just followed leaves smart downloads to
    // the next full one.
    final smart =
        onlySeriesId == null &&
        _prefs.get(UserPreferences.smartDownloadsEnabled);
    if (subscriptions.isEmpty && !smart) {
      return AutoDownloadRunSummary(at: startedAt, trigger: trigger);
    }
    // Waiting holds back the smart deletes too, so a swap is never left
    // half done.
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
    final tally = _Tally();
    final run = (trigger: trigger, endBy: endBy, state: state, tally: tally);

    // Smart downloads run first: a followed series' delete-after-watched
    // rule would otherwise remove a watched episode before its replacement
    // is queued, and the subscriptions then count what was swapped in.
    final smartPlan = smart ? await _smartTargets(state, playing) : null;
    if (smartPlan != null) {
      final handled = <String>{};
      await _runSeries(
        smartPlan.targets,
        run,
        onSeriesDone: (seriesId, _, error) async {
          if (error == null) handled.add(seriesId);
        },
      );
      // Each finished episode tops its series up once. The marker stops
      // before the oldest one whose series was not acted on (failed, out of
      // time, or left for the app engine), which is read again next time.
      DateTime? upTo;
      for (final play in smartPlan.finished.reversed) {
        if (!handled.contains(play.seriesId)) break;
        upTo = play.playedAt;
      }
      if (upTo != null && !_disposed) {
        await _prefs.set(
          UserPreferences.smartDownloadsPlayedSince,
          upTo.toUtc().toIso8601String(),
        );
      }
      // A raise counts as applied once every series it reached was acted on.
      if (smartPlan.raised.every(handled.contains) && !_disposed) {
        await _prefs.set(
          UserPreferences.smartDownloadsAppliedKeepReady,
          smartPlan.keepReady,
        );
      }
    }

    await _runSeries(
      [
        for (final subscription in subscriptions)
          (
            seriesId: subscription.seriesId,
            quality: DownloadQuality.fromName(subscription.qualityPreset),
            plan: (episodes, sizeOf) => planAutoDownload(
              episodes: episodes,
              keepUnwatched: keepUnwatched,
              deleteAfter: deleteAfter,
              now: _now(),
              downloadedIds: state.downloadedIds,
              inFlightIds: state.inFlightIds,
              autoOwnedIds: state.autoOwnedIds,
              storageBudgetBytes: state.budget,
              sizeOf: sizeOf,
              newSince: subscription.createdAt,
              playingItemId: playing,
            ),
          ),
      ],
      run,
      onSeriesDone: (seriesId, queued, error) =>
          _repository.updateSubscriptionCheck(
            seriesId: seriesId,
            serverId: serverId,
            userId: userId,
            checkedAt: _now(),
            queuedCount: queued,
            error: error,
          ),
    );

    if (onlySeriesId == null && !_disposed) {
      await _reportBlocked(tally.blocked);
    }

    return AutoDownloadRunSummary(
      at: startedAt,
      trigger: trigger,
      subscriptions: subscriptions.length,
      smartSeries: smartPlan?.targets.length ?? 0,
      queued: tally.queued,
      deleted: tally.deleted,
      storageFull: tally.blocked.isNotEmpty,
      partial: tally.partial,
      error: tally.firstError,
    );
  }

  /// Fetches each series in [targets], applies its plan and adds the
  /// outcome to the run's tally. Stops at the run's deadline. A background
  /// run ends with its engine, so it skips qualities only the app engine
  /// can transfer.
  Future<void> _runSeries(
    List<_SeriesTarget> targets,
    _Run run, {
    Future<void> Function(String seriesId, int queued, String? error)?
    onSeriesDone,
  }) async {
    for (final target in targets) {
      if (_disposed) break;
      if (run.endBy case final endBy? when !_now().isBefore(endBy)) {
        run.tally.partial = true;
        break;
      }
      if (run.trigger == AutoDownloadTrigger.backgroundRefresh &&
          !await downloader.canTransferInBackground(target.quality)) {
        continue;
      }
      _SeriesOutcome outcome;
      String? error;
      try {
        final episodes = await downloader.fetchEpisodes(target.seriesId);
        int sizeOf(AggregatedItem episode) =>
            estimateDownloadSizeBytes(episode, target.quality);
        outcome = await _apply(
          target.plan(episodes, sizeOf),
          quality: target.quality,
          state: run.state,
          sizeOf: sizeOf,
        );
      } catch (e) {
        error = e.toString();
        run.tally.firstError ??= error;
        outcome = (queued: 0, deleted: 0, blocked: const []);
      }
      run.tally.add(outcome);
      await onSeriesDone?.call(target.seriesId, outcome.queued, error);
    }
  }

  /// The series smart downloads acts on, newest watch first: those with an
  /// episode finished since the last check, streamed or downloaded, and
  /// those with a download watched since it was downloaded that is still
  /// on the phone. The recently played episodes, read back to the last
  /// finished one acted on, tell which they are. The episode playing right
  /// now counts once it stops, so it is never topped up for twice. After
  /// the episodes to keep ready is raised, every recently watched series
  /// with a download on the phone is topped up to the new number too.
  Future<
    ({
      List<_SeriesTarget> targets,
      List<({String seriesId, DateTime playedAt})> finished,
      Set<String> raised,
      int keepReady,
    })
  >
  _smartTargets(_SharedState state, String? playingItemId) async {
    final since = await _smartSince(UserPreferences.smartDownloadsEnabledAt);
    final playedSince = await _smartSince(
      UserPreferences.smartDownloadsPlayedSince,
    );
    final keepReady = _prefs.get(UserPreferences.smartDownloadsKeepReady);
    // Turned on before the number was tracked: count from the default.
    final stored = _prefs.get(UserPreferences.smartDownloadsAppliedKeepReady);
    final applied = stored > 0 ? stored : 1;
    final isRaise = keepReady > applied;
    final downloadsBySeries = <String, List<DownloadedEpisodeRef>>{};
    final downloadById = <String, DownloadedEpisodeRef>{};
    for (final row in await _repository.getDownloadedEpisodes()) {
      // Another server's ids can collide with this one's.
      if (!isStoredServer(
        row.serverId,
        serverId: serverId,
        baseUrl: downloader.serverBaseUrl,
      )) {
        continue;
      }
      (downloadsBySeries[row.seriesId] ??= []).add(row);
      downloadById[row.itemId] = row;
    }

    final finished = <({String seriesId, DateTime playedAt})>[];
    final raised = <String>{};
    final seriesIds = <String>{};
    // A raise reaches every series watched since smart downloads was turned
    // on, not just those finished since the last check, so it reads back
    // that far.
    for (final item in await downloader.fetchRecentlyPlayedEpisodes(
      playedAfter: isRaise ? since : playedSince,
    )) {
      final seriesId = item.seriesId;
      final playedAt = item.lastPlayedDate;
      if (seriesId == null || playedAt == null || item.id == playingItemId) {
        continue;
      }
      final download = downloadById[item.id];
      final finishedNow = playedAt.isAfter(playedSince);
      final topUp = isRaise && downloadsBySeries.containsKey(seriesId);
      if (finishedNow) {
        finished.add((seriesId: seriesId, playedAt: playedAt));
      }
      if (topUp) raised.add(seriesId);
      if (!finishedNow &&
          !topUp &&
          (download == null ||
              !watchedSinceDownload(item, download.downloadedAt, since))) {
        continue;
      }
      seriesIds.add(seriesId);
    }

    final finishedSeries = {for (final play in finished) play.seriesId};
    // Always the setting, whatever an earlier download of the series used.
    final quality = DownloadQuality.fromName(
      _prefs.get(UserPreferences.defaultDownloadQuality),
    );
    return (
      finished: finished,
      raised: raised,
      keepReady: keepReady,
      targets: [
        for (final seriesId in seriesIds)
          (
            seriesId: seriesId,
            quality: quality,
            plan: (episodes, sizeOf) => planSmartDownload(
              episodes: episodes,
              downloadedAt: {
                for (final row in downloadsBySeries[seriesId] ?? const [])
                  row.itemId: row.downloadedAt,
              },
              inFlightIds: state.inFlightIds,
              keepReady: keepReady,
              storageBudgetBytes: state.budget,
              sizeOf: sizeOf,
              since: since,
              playedSince: playedSince,
              finishedRecently:
                  finishedSeries.contains(seriesId) ||
                  raised.contains(seriesId),
              playingItemId: playingItemId,
            ),
          ),
      ],
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

  /// Deletes, then queues, what [plan] decided, keeping [state] current.
  Future<_SeriesOutcome> _apply(
    AutoDownloadPlan plan, {
    required DownloadQuality quality,
    required _SharedState state,
    required int Function(AggregatedItem episode) sizeOf,
  }) async {
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

  /// The time stored in [pref], stamped now when it is still empty: smart
  /// downloads only acts on what is watched once it is on.
  Future<DateTime> _smartSince(Preference<String> pref) async {
    final stored = DateTime.tryParse(_prefs.get(pref));
    if (stored != null) return stored;
    final now = _now().toUtc();
    await _prefs.set(pref, now.toIso8601String());
    return now;
  }

  @override
  void dispose() {
    _disposed = true;
    _triggerTimer?.cancel();
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

/// What the series of one check added up to.
class _Tally {
  var queued = 0;
  var deleted = 0;
  final blocked = <BlockedEpisode>[];

  /// The deadline ended the check before every series was fetched.
  var partial = false;
  String? firstError;

  void add(_SeriesOutcome outcome) {
    queued += outcome.queued;
    deleted += outcome.deleted;
    blocked.addAll(outcome.blocked);
  }
}
