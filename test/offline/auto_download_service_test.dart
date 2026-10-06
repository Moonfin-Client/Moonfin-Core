import 'dart:async';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/download_quality.dart';
import 'package:moonfin/data/models/download_source.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/auto_download_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auto_download_test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late OfflineRepository repo;
  late UserPreferences prefs;
  late FakeDownloader downloader;
  late StreamController<ServerWebSocketMessage> socket;
  late DateTime now;
  late AutoDownloadService service;

  AutoDownloadService build({String serverId = server, String userId = user}) =>
      AutoDownloadService(
        repository: repo,
        downloader: downloader,
        prefs: prefs,
        serverId: serverId,
        userId: userId,
        socketEvents: socket.stream,
        now: () => now,
        socketDebounce: const Duration(milliseconds: 30),
      );

  Future<void> addDownloaded(
    String itemId, {
    DownloadSource source = DownloadSource.manual,
    int size = 100,
    String serverId = server,
    String series = 'series-1',
    DownloadQuality quality = DownloadQuality.original,
  }) {
    return repo.upsertItem(
      DownloadedItemsCompanion(
        itemId: Value(itemId),
        serverId: Value(serverId),
        type: const Value('Episode'),
        name: Value('Episode $itemId'),
        metadataJson: const Value('{}'),
        downloadStatus: const Value(2),
        downloadSource: Value(source.name),
        fileSizeBytes: Value(size),
        downloadedAt: Value(downloadedAt),
        seriesId: Value(series),
        qualityPreset: Value(quality.name),
      ),
    );
  }

  Future<void> subscribe(String seriesId, {DownloadQuality? quality}) async {
    await repo.upsertSubscription(
      AutoDownloadSubscriptionsCompanion(
        seriesId: Value(seriesId),
        serverId: const Value(server),
        userId: const Value(user),
        seriesName: Value('Series $seriesId'),
        qualityPreset: Value((quality ?? DownloadQuality.original).name),
        createdAt: Value(followedAt),
      ),
    );
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    downloader = FakeDownloader();
    socket = StreamController<ServerWebSocketMessage>.broadcast();
    now = DateTime(2026, 9, 7, 12);
    service = build();
  });

  tearDown(() async {
    service.dispose();
    await socket.close();
    await db.close();
  });

  group('subscriptions', () {
    test('subscribe stores the series and checks it right away', () async {
      // Subscribing records the clock; only later episodes are new.
      now = followedAt;
      downloader.episodesBySeries['series-1'] = [
        episode('e1', number: 1, played: true),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ];

      await service.subscribe(
        series('series-1'),
        quality: DownloadQuality.medium720p,
      );
      // subscribe starts the scoped check without waiting for it.
      expect(service.isRunning, isTrue);
      while (service.isRunning) {
        await Future<void>.delayed(Duration.zero);
      }

      final stored = await service.getSubscription('series-1');
      expect(stored, isNotNull);
      expect(stored!.qualityPreset, 'medium720p');
      expect(stored.seriesName, 'Series series-1');
      expect(downloader.queuedIds, ['e2', 'e3']);
      expect(downloader.batches.single.quality, DownloadQuality.medium720p);
      expect(downloader.batches.single.source, DownloadSource.auto);
      expect(stored.lastQueuedCount, 2);
      expect(stored.lastCheckedAt, now);
    });

    test('unsubscribe removes the row and keeps downloads', () async {
      await subscribe('series-1');
      await addDownloaded('e1', source: DownloadSource.auto);

      await service.unsubscribe('series-1');

      expect(await service.getSubscription('series-1'), isNull);
      expect(await repo.isAvailableOffline('e1'), isTrue);
      expect(downloader.deleted, isEmpty);
    });

    test('watchSubscriptions only lists this account', () async {
      await subscribe('series-1');
      await repo.upsertSubscription(
        AutoDownloadSubscriptionsCompanion(
          seriesId: const Value('series-other'),
          serverId: const Value('server-b'),
          userId: const Value(user),
          seriesName: const Value('Other'),
          qualityPreset: const Value('original'),
          createdAt: Value(now),
        ),
      );

      final listed = await service.watchSubscriptions().first;
      expect(listed.map((s) => s.seriesId), ['series-1']);

      downloader.episodesBySeries['series-other'] = [episode('x')];
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.fetched, ['series-1']);
    });
  });

  group('runCheck', () {
    test('respects keep-unwatched against downloaded and in-flight', () async {
      await prefs.set(UserPreferences.autoDownloadKeepUnwatched, 2);
      await subscribe('series-1');
      await addDownloaded('e1');
      downloader.inFlight.add('e2');
      downloader.episodesBySeries['series-1'] = [
        for (var n = 1; n <= 5; n++) episode('e$n', number: n),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );

      expect(downloader.queuedIds, isEmpty);
      expect(summary.queued, 0);
      expect(summary.subscriptions, 1);
    });

    test('keep 0 means every unwatched episode', () async {
      await prefs.set(UserPreferences.autoDownloadKeepUnwatched, 0);
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [
        for (var n = 1; n <= 8; n++) episode('e$n', number: n),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );
      expect(summary.queued, 8);
    });

    test(
      'deletes watched auto downloads only when the setting is on',
      () async {
        await subscribe('series-1');
        await addDownloaded('manual', source: DownloadSource.manual);
        await addDownloaded('auto', source: DownloadSource.auto);
        downloader.episodesBySeries['series-1'] = [
          episode('manual', number: 1, played: true),
          episode('auto', number: 2, played: true),
        ];

        var summary = await service.runCheck(
          trigger: AutoDownloadTrigger.manual,
        );
        expect(downloader.deleted, isEmpty);
        expect(summary.deleted, 0);

        await prefs.set(UserPreferences.autoDownloadDeleteAfterHours, 0);
        summary = await service.runCheck(trigger: AutoDownloadTrigger.manual);
        expect(downloader.deleted, ['auto']);
        expect(summary.deleted, 1);
      },
    );

    test('master switch off checks nothing', () async {
      await prefs.set(UserPreferences.autoDownloadEnabled, false);
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );
      expect(downloader.fetched, isEmpty);
      expect(summary.subscriptions, 0);
    });

    test('waits for Wi-Fi when the policy blocks downloads', () async {
      downloader.wifiAllowed = false;
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );
      expect(summary.waitingForWifi, isTrue);
      expect(downloader.fetched, isEmpty);
    });

    test('stops at the storage limit and reports it', () async {
      downloader.headroomBytes = 150;
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [
        episode('e1', number: 1, size: 100),
        episode('e2', number: 2, size: 100),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );
      expect(downloader.queuedIds, ['e1']);
      expect(summary.storageFull, isTrue);
    });

    test('a storage shortage is announced once until it clears', () async {
      final notices = <List<String>>[];
      service.dispose();
      service = AutoDownloadService(
        repository: repo,
        downloader: downloader,
        prefs: prefs,
        serverId: server,
        userId: user,
        now: () => now,
        onStorageFull: (blocked) =>
            notices.add([for (final b in blocked) b.episode.id]),
      );
      // No keep cap, so only space decides what is queued.
      await prefs.set(UserPreferences.autoDownloadKeepUnwatched, 0);
      // Nothing fits, so the same episodes are held back check after check.
      downloader.headroomBytes = 50;
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [
        episode('e1', number: 1, size: 100),
        episode('e2', number: 2, size: 100),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      // Another episode arriving while the phone is full stays quiet.
      downloader.episodesBySeries['series-1']!.add(
        episode('e3', number: 3, size: 100),
      );
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(notices, [
        ['e1', 'e2'],
      ]);

      // Space freed: everything fits, which resets the notice. The next
      // shortage is announced again.
      downloader.headroomBytes = 1000;
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      downloader.headroomBytes = 50;
      downloader.episodesBySeries['series-1']!.add(
        episode('e4', number: 4, size: 100),
      );
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(notices, hasLength(2));
      expect(notices.last, contains('e4'));
    });

    test('a failing series is recorded and does not stop the others', () async {
      await subscribe('series-1');
      await subscribe('series-2');
      downloader.failSeries.add('series-1');
      downloader.episodesBySeries['series-2'] = [
        episode('e1', series: 'series-2'),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );

      expect(downloader.fetched, ['series-1', 'series-2']);
      expect(summary.error, contains('offline'));
      expect(summary.queued, 1);
      final first = await service.getSubscription('series-1');
      expect(first!.lastError, contains('offline'));
      final second = await service.getSubscription('series-2');
      expect(second!.lastError, isNull);
      expect(downloader.queuedIds, ['e1']);
    });

    test('concurrent triggers share one run', () async {
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];
      downloader.fetchGate = Completer<void>();

      final first = service.runCheck(trigger: AutoDownloadTrigger.manual);
      final second = service.runCheck(
        trigger: AutoDownloadTrigger.libraryChanged,
      );
      expect(service.isRunning, isTrue);
      downloader.fetchGate!.complete();

      final results = await Future.wait([first, second]);
      expect(identical(results[0], results[1]), isTrue);
      expect(downloader.fetched, ['series-1']);
      expect(service.isRunning, isFalse);
    });

    test('iOS background runs skip transcoded subscriptions', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      await subscribe('series-1', quality: DownloadQuality.high1080p);
      await subscribe('series-2');
      downloader.episodesBySeries['series-1'] = [episode('a')];
      downloader.episodesBySeries['series-2'] = [
        episode('b', series: 'series-2'),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.backgroundRefresh);
      expect(downloader.fetched, ['series-2']);

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.fetched, ['series-2', 'series-1', 'series-2']);
    });

    test('Android background runs skip transcoded subscriptions too', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      await subscribe('series-1', quality: DownloadQuality.high1080p);
      downloader.episodesBySeries['series-1'] = [episode('a')];

      await service.runCheck(trigger: AutoDownloadTrigger.backgroundRefresh);
      expect(downloader.fetched, isEmpty);
    });

    test('a deadline ends the run early and marks it partial', () async {
      await subscribe('series-1');
      await subscribe('series-2');
      downloader.episodesBySeries['series-1'] = [episode('a')];
      downloader.episodesBySeries['series-2'] = [
        episode('b', series: 'series-2'),
      ];
      // Every fetch "takes" a minute on the fake clock.
      downloader.onFetch = () => now = now.add(const Duration(minutes: 1));

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.backgroundRefresh,
        deadline: const Duration(seconds: 20),
      );

      expect(summary.partial, isTrue);
      expect(summary.queued, 1);
      expect(downloader.fetched, ['series-1']);
    });

    test('the last run is persisted and restored', () async {
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];

      await service.runCheck(trigger: AutoDownloadTrigger.appResumed);

      final restored = build();
      addTearDown(restored.dispose);
      expect(restored.lastRun, isNotNull);
      expect(restored.lastRun!.queued, 1);
      expect(restored.lastRun!.trigger, AutoDownloadTrigger.appResumed);
      expect(restored.lastRun!.at, now);
    });
  });

  group('triggers', () {
    test('a resume or connect shortly after a run is ignored', () async {
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      now = now.add(const Duration(minutes: 5));
      service.onAppResumed();
      service.onServerConnected();
      await Future<void>.delayed(Duration.zero);
      expect(downloader.fetched, hasLength(1));

      now = now.add(const Duration(minutes: 6));
      service.onAppResumed();
      await Future<void>.delayed(Duration.zero);
      expect(downloader.fetched, hasLength(2));
    });

    test('library changes are debounced into one check', () async {
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];
      service.start();

      socket.add(const LibraryChangedMessage(itemsAdded: ['x']));
      socket.add(const LibraryChangedMessage(itemsAdded: ['y']));
      socket.add(const LibraryChangedMessage(itemsUpdated: ['z']));
      await Future<void>.delayed(const Duration(milliseconds: 80));

      expect(downloader.fetched, ['series-1']);
      expect(service.lastRun!.trigger, AutoDownloadTrigger.libraryChanged);
    });

    test('user data changes for another user are ignored', () async {
      await subscribe('series-1');
      service.start();

      socket.add(const UserDataChangedMessage(userId: 'someone-else'));
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(downloader.fetched, isEmpty);

      socket.add(
        const UserDataChangedMessage(
          userId: user,
          userDataList: [
            {'ItemId': 'e1'},
          ],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(downloader.fetched, ['series-1']);
      expect(service.lastRun!.trigger, AutoDownloadTrigger.userDataChanged);
    });

    test('rows still in progress count as in flight', () async {
      await prefs.set(UserPreferences.autoDownloadKeepUnwatched, 1);
      await subscribe('series-1');
      await repo.upsertItem(
        DownloadedItemsCompanion(
          itemId: const Value('e1'),
          serverId: const Value(server),
          type: const Value('Episode'),
          name: const Value('Episode e1'),
          metadataJson: const Value('{}'),
          downloadStatus: const Value(1),
        ),
      );
      downloader.episodesBySeries['series-1'] = [
        episode('e1', number: 1),
        episode('e2', number: 2),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, isEmpty);
    });

    test('waits for recovery before reading what is in flight', () async {
      final recovered = Completer<void>();
      service.dispose();
      service = AutoDownloadService(
        repository: repo,
        downloader: downloader,
        prefs: prefs,
        serverId: server,
        userId: user,
        now: () => now,
        ready: recovered.future,
      );
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];

      final run = service.runCheck(trigger: AutoDownloadTrigger.manual);
      await Future<void>.delayed(Duration.zero);
      expect(downloader.fetched, isEmpty);
      downloader.inFlight.add('e1');
      recovered.complete();

      final summary = await run;
      expect(summary.queued, 0);
    });

    test('a full check follows a scoped one instead of joining it', () async {
      await subscribe('series-1');
      await subscribe('series-2');
      downloader.episodesBySeries['series-1'] = [episode('a')];
      downloader.episodesBySeries['series-2'] = [
        episode('b', series: 'series-2'),
      ];
      downloader.fetchGate = Completer<void>();

      final scoped = service.runCheck(
        trigger: AutoDownloadTrigger.subscribed,
        onlySeriesId: 'series-1',
      );
      final full = service.runCheck(
        trigger: AutoDownloadTrigger.libraryChanged,
      );
      downloader.fetchGate!.complete();

      final scopedSummary = await scoped;
      expect(scopedSummary.queued, 1);
      final fullSummary = await full;
      expect(fullSummary.trigger, AutoDownloadTrigger.libraryChanged);
      expect(downloader.fetched, ['series-1', 'series-1', 'series-2']);
    });

    test('runCheck after dispose does nothing', () async {
      await subscribe('series-1');
      downloader.episodesBySeries['series-1'] = [episode('e1')];
      service.dispose();

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.serverConnected,
      );
      expect(summary.queued, 0);
      expect(downloader.fetched, isEmpty);
      service = build();
    });

    test('nothing fires after dispose', () async {
      await subscribe('series-1');
      service.start();
      socket.add(const LibraryChangedMessage(itemsAdded: ['x']));
      service.dispose();
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(downloader.fetched, isEmpty);
      service = build(); // so tearDown has something to dispose
    });
  });

  group('smart downloads', () {
    setUp(() async {
      await prefs.set(UserPreferences.smartDownloadsEnabled, true);
      final enabledAt = DateTime.utc(2026, 9, 1).toIso8601String();
      await prefs.set(UserPreferences.smartDownloadsEnabledAt, enabledAt);
      await prefs.set(UserPreferences.smartDownloadsPlayedSince, enabledAt);
    });

    test('swaps a watched download without any subscription', () async {
      await prefs.set(UserPreferences.defaultDownloadQuality, 'medium720p');
      // An earlier download's quality never overrides the setting.
      await addDownloaded('e1', quality: DownloadQuality.high1080p);
      await addDownloaded('e2', quality: DownloadQuality.high1080p);
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
        episode('e4', number: 4),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.userDataChanged,
      );
      expect(downloader.deleted, ['e1']);
      expect(downloader.queuedIds, ['e3']);
      expect(downloader.batches.single.quality, DownloadQuality.medium720p);
      expect(downloader.batches.single.source, DownloadSource.auto);
      expect(summary.smartSeries, 1);
      expect(summary.queued, 1);
      expect(summary.deleted, 1);
    });

    test('only fetches series with a watched download', () async {
      await addDownloaded('a1', series: 'series-a');
      await addDownloaded('b1', series: 'series-b');
      downloader.episodesBySeries['series-a'] = [
        watched('a1', series: 'series-a', number: 1),
        episode('a2', series: 'series-a', number: 2),
      ];
      downloader.episodesBySeries['series-b'] = [
        episode('b1', series: 'series-b', number: 1),
        episode('b2', series: 'series-b', number: 2),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.fetched, ['series-a']);
      expect(downloader.queuedIds, ['a2']);
    });

    test('does nothing while the setting is off', () async {
      await prefs.set(UserPreferences.smartDownloadsEnabled, false);
      await addDownloaded('e1');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.fetched, isEmpty);
      expect(downloader.deleted, isEmpty);
      expect(downloader.batches, isEmpty);
    });

    test('keeps the watched episode while waiting for Wi-Fi', () async {
      downloader.wifiAllowed = false;
      await addDownloaded('e1');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.manual,
      );
      expect(summary.waitingForWifi, isTrue);
      expect(downloader.deleted, isEmpty);
      expect(downloader.batches, isEmpty);
    });

    test('runs alongside a subscription without queueing twice', () async {
      await prefs.set(UserPreferences.autoDownloadDeleteAfterHours, 0);
      await subscribe('series-1');
      await addDownloaded('e1', source: DownloadSource.auto);
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.deleted, ['e1']);
      expect(downloader.queuedIds, ['e2', 'e3']);
      expect(downloader.queuedIds.toSet(), hasLength(2));
    });

    test('scoped checks after following a series skip the swap', () async {
      await addDownloaded('e1');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      await service.runCheck(
        trigger: AutoDownloadTrigger.subscribed,
        onlySeriesId: 'series-1',
      );
      expect(downloader.fetched, isEmpty);
      expect(downloader.deleted, isEmpty);
    });

    test('a streamed episode downloads the next ones', () async {
      await prefs.set(UserPreferences.smartDownloadsKeepReady, 2);
      await prefs.set(UserPreferences.defaultDownloadQuality, 'medium720p');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
        episode('e4', number: 4),
      ];

      final summary = await service.runCheck(
        trigger: AutoDownloadTrigger.playbackStopped,
      );
      expect(downloader.deleted, isEmpty);
      expect(downloader.queuedIds, ['e2', 'e3']);
      expect(downloader.batches.single.quality, DownloadQuality.medium720p);
      expect(summary.smartSeries, 1);
      expect(
        DateTime.parse(prefs.get(UserPreferences.smartDownloadsPlayedSince)),
        downloadedAt.add(const Duration(days: 1)),
      );
    });

    test('raising the episodes to keep ready tops up right away', () async {
      await addDownloaded('e2');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
        episode('e4', number: 4),
        episode('e5', number: 5),
      ];
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(downloader.queuedIds, isEmpty);
      expect(prefs.get(UserPreferences.smartDownloadsAppliedKeepReady), 1);

      // Nothing new was watched; only the number went up.
      await prefs.set(UserPreferences.smartDownloadsKeepReady, 3);
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e3', 'e4']);
      expect(prefs.get(UserPreferences.smartDownloadsAppliedKeepReady), 3);

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e3', 'e4']);
    });

    /// Series A is watched, then B, and a check moves the marker to B.
    /// Raising the number to keep ready then has to top up A as well as B,
    /// with [historyPageSize] plays per page of the watch history.
    Future<void> raiseAfterTwoSeries({required int historyPageSize}) async {
      final playedA = downloadedAt.add(const Duration(days: 1));
      final playedB = downloadedAt.add(const Duration(days: 2));
      downloader.historyPageSize = historyPageSize;
      await addDownloaded('a2', series: 'series-a');
      await addDownloaded('b2', series: 'series-b');
      downloader.episodesBySeries['series-a'] = [
        watched('a1', series: 'series-a', number: 1, playedAt: playedA),
        episode('a2', series: 'series-a', number: 2),
        episode('a3', series: 'series-a', number: 3),
        episode('a4', series: 'series-a', number: 4),
      ];
      downloader.episodesBySeries['series-b'] = [
        watched('b1', series: 'series-b', number: 1, playedAt: playedB),
        episode('b2', series: 'series-b', number: 2),
        episode('b3', series: 'series-b', number: 3),
        episode('b4', series: 'series-b', number: 4),
      ];
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(downloader.queuedIds, isEmpty);
      // The marker now sits on B, the newer of the two watches.
      expect(
        DateTime.parse(prefs.get(UserPreferences.smartDownloadsPlayedSince)),
        playedB,
      );

      await prefs.set(UserPreferences.smartDownloadsKeepReady, 3);
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, containsAll(['a3', 'a4', 'b3', 'b4']));
    }

    test(
      'a raise tops up a series watched before the last handled one',
      () => raiseAfterTwoSeries(historyPageSize: 100),
    );

    test(
      'a raise tops up a series watched on an older page of the history',
      // One play per page, so A sits on a later page than B.
      () => raiseAfterTwoSeries(historyPageSize: 1),
    );

    test('a number set before it was tracked counts as a raise', () async {
      await prefs.set(UserPreferences.smartDownloadsKeepReady, 3);
      await addDownloaded('e2');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
        episode('e4', number: 4),
      ];
      await prefs.set(
        UserPreferences.smartDownloadsPlayedSince,
        DateTime.utc(2027).toIso8601String(),
      );

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e3', 'e4']);
    });

    test('lowering then raising the number tops up again', () async {
      await prefs.set(UserPreferences.smartDownloadsAppliedKeepReady, 3);
      await prefs.set(UserPreferences.smartDownloadsKeepReady, 1);
      await addDownloaded('e2');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ];
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(prefs.get(UserPreferences.smartDownloadsAppliedKeepReady), 1);

      await prefs.set(UserPreferences.smartDownloadsKeepReady, 2);
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e3']);
    });

    test('a finished episode tops its series up only once', () async {
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ];
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(downloader.queuedIds, ['e2']);

      // The user deletes e2 by hand; nothing new was watched.
      downloader.inFlight.clear();
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e2']);
    });

    test('watches from before it was turned on are ignored', () async {
      final later = DateTime.utc(2026, 9, 7).toIso8601String();
      await prefs.set(UserPreferences.smartDownloadsEnabledAt, later);
      await prefs.set(UserPreferences.smartDownloadsPlayedSince, later);
      await addDownloaded('e1');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.deleted, isEmpty);
      expect(downloader.batches, isEmpty);
    });

    test('a finished episode waiting for Wi-Fi is acted on later', () async {
      downloader.wifiAllowed = false;
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(downloader.batches, isEmpty);

      downloader.wifiAllowed = true;
      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e2']);
    });

    test(
      'a stop checks soon and absorbs the user data event it causes',
      () async {
        service.dispose();
        service = AutoDownloadService(
          repository: repo,
          downloader: downloader,
          prefs: prefs,
          serverId: server,
          userId: user,
          socketEvents: socket.stream,
          now: () => now,
          socketDebounce: const Duration(milliseconds: 200),
          stopDebounce: const Duration(milliseconds: 20),
        )..start();
        downloader.episodesBySeries['series-1'] = [
          watched('e1', number: 1),
          episode('e2', number: 2),
        ];

        service.onEpisodeStopped(server);
        socket.add(const UserDataChangedMessage(userId: user));
        await Future<void>.delayed(const Duration(milliseconds: 80));
        expect(downloader.queuedIds, ['e2']);
        expect(service.lastRun!.trigger, AutoDownloadTrigger.playbackStopped);

        await Future<void>.delayed(const Duration(milliseconds: 250));
        expect(downloader.fetched, ['series-1']);
      },
    );

    test('a stop on another server checks nothing', () async {
      service.dispose();
      service = AutoDownloadService(
        repository: repo,
        downloader: downloader,
        prefs: prefs,
        serverId: server,
        userId: user,
        now: () => now,
        stopDebounce: const Duration(milliseconds: 20),
      );
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      service.onEpisodeStopped('server-b');
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(service.lastRun, isNull);
      expect(downloader.queuedIds, isEmpty);
    });

    test('turning it on stamps the start and off clears it', () async {
      await service.setSmartDownloadsEnabled(false);
      expect(prefs.get(UserPreferences.smartDownloadsEnabledAt), isEmpty);

      await service.setSmartDownloadsEnabled(true);
      expect(prefs.get(UserPreferences.smartDownloadsEnabled), isTrue);
      expect(
        DateTime.parse(prefs.get(UserPreferences.smartDownloadsPlayedSince)),
        now.toUtc(),
      );
    });

    test('an episode finished while playing is topped up once', () async {
      String? playing = 'e1';
      service.dispose();
      service = AutoDownloadService(
        repository: repo,
        downloader: downloader,
        prefs: prefs,
        serverId: server,
        userId: user,
        socketEvents: socket.stream,
        playingItemId: () => playing,
        now: () => now,
      );
      await addDownloaded('e1');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
        episode('e3', number: 3),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.userDataChanged);
      expect(downloader.batches, isEmpty);

      playing = null;
      await service.runCheck(trigger: AutoDownloadTrigger.playbackStopped);
      expect(downloader.deleted, ['e1']);
      expect(downloader.queuedIds, ['e2']);

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.queuedIds, ['e2']);
    });

    test('another server\'s download is never deleted', () async {
      await addDownloaded('e1', serverId: 'server-b');
      downloader.episodesBySeries['series-1'] = [
        watched('e1', number: 1),
        episode('e2', number: 2),
      ];

      await service.runCheck(trigger: AutoDownloadTrigger.manual);
      expect(downloader.deleted, isEmpty);
      expect(downloader.queuedIds, ['e2']);
    });

    test(
      'a failing series only holds back episodes watched after it',
      () async {
        AggregatedItem playedOn(String id, String series, int day) => episode(
          id,
          series: series,
          number: 1,
          played: true,
          extra: {
            'UserData': {
              'Played': true,
              'LastPlayedDate': DateTime.utc(2026, 9, day).toIso8601String(),
            },
          },
        );
        downloader.episodesBySeries['series-a'] = [
          playedOn('a1', 'series-a', 3),
          episode('a2', series: 'series-a', number: 2),
        ];
        downloader.episodesBySeries['series-b'] = [
          playedOn('b1', 'series-b', 5),
          episode('b2', series: 'series-b', number: 2),
        ];
        downloader.failSeries.add('series-b');

        await service.runCheck(trigger: AutoDownloadTrigger.manual);
        expect(downloader.queuedIds, ['a2']);
        expect(
          DateTime.parse(prefs.get(UserPreferences.smartDownloadsPlayedSince)),
          DateTime.utc(2026, 9, 3),
        );
      },
    );
  });
}
