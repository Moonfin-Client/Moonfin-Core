import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/download_source.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/download_notification_service.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// No-op repository so the test doesn't need the sqlite3 native library.
/// The database is never opened because every method DownloadService uses
/// is overridden.
class _FakeOfflineRepository extends OfflineRepository {
  _FakeOfflineRepository(super.db);

  @override
  Future<void> upsertItem(DownloadedItemsCompanion item) async {}

  @override
  Future<void> updateDownloadStatus(
    String itemId,
    int status, {
    double? progress,
    String? error,
  }) async {}

  @override
  Future<void> setLocalFilePath(
    String itemId,
    String path, {
    int? fileSize,
  }) async {}

  @override
  Future<int> getTotalStorageUsed() async => 0;

  @override
  Future<List<DownloadedItem>> getItems({
    String? type,
    bool onlyCompleted = false,
  }) async => const [];

  @override
  Future<DownloadedItem?> getItem(String itemId) async => null;

  @override
  Future<void> deleteItem(String itemId) async {}
}

class _FakeStoragePathService extends StoragePathService {
  final Directory dir;
  _FakeStoragePathService(this.dir);

  @override
  Future<Directory> getOfflineRoot() async => dir;

  @override
  Future<Directory> getImageCacheDir() async {
    final imageDir = Directory('${dir.path}/images');
    if (!await imageDir.exists()) await imageDir.create(recursive: true);
    return imageDir;
  }
}

/// Parks every upsert so a download that passed the storage check stays
/// admitted (and reserving) for as long as the test wants.
class _GatedOfflineRepository extends _FakeOfflineRepository {
  _GatedOfflineRepository(super.db);

  final Completer<void> upsertGate = Completer<void>();
  int upsertCalls = 0;

  @override
  Future<void> upsertItem(DownloadedItemsCompanion item) async {
    upsertCalls++;
    await upsertGate.future;
  }
}

/// Answers getItem from a fixed table and parks one item's fetch until the
/// test releases it, so its storage check runs while another download is
/// already admitted and reserving bytes.
class _StorageTestApi implements ItemsApi {
  _StorageTestApi(this._dataById, {required this.parkItemId});

  final Map<String, Map<String, dynamic>> _dataById;
  final String parkItemId;
  final Completer<void> releaseParked = Completer<void>();

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    if (itemId == parkItemId) await releaseParked.future;
    return _dataById[itemId]!;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, dynamic> _sizedItemData(String id, int sizeBytes) => {
  'Id': id,
  'Type': 'Movie',
  'Name': 'Movie $id',
  'MediaSources': [
    {'Id': 'source-$id', 'Container': 'mkv', 'Size': sizeBytes},
  ],
};

class _FakeItemsApi implements ItemsApi {
  final Map<String, dynamic> itemData;
  _FakeItemsApi(this.itemData);

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => itemData;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _BlockingItemsApi implements ItemsApi {
  final List<Completer<Map<String, dynamic>>> _pending = [];
  int calls = 0;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) {
    calls++;
    final completer = Completer<Map<String, dynamic>>();
    _pending.add(completer);
    return completer.future;
  }

  void releaseNext() {
    _pending.removeAt(0).completeError(StateError('Test download released'));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Answers the batch-fetch calls (seasons, episodes, collection children)
/// and records the `fields` each request asked for.
class _LibraryItemsApi implements ItemsApi {
  _LibraryItemsApi({required this.episodesBySeason, required this.boxSetItems});

  final Map<String, List<Map<String, dynamic>>> episodesBySeason;
  final List<Map<String, dynamic>> boxSetItems;
  final List<String?> episodeFields = [];
  String? boxSetFields;

  @override
  Future<Map<String, dynamic>> getEpisodes(
    String seriesId, {
    String? seasonId,
    String? fields,
  }) async {
    episodeFields.add(fields);
    if (seasonId == null) {
      return {'Items': episodesBySeason.values.expand((e) => e).toList()};
    }
    return {'Items': episodesBySeason[seasonId] ?? const []};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    // getItems has dozens of named parameters; intercept it here instead of
    // spelling out the full override.
    if (invocation.memberName == #getItems) {
      boxSetFields = invocation.namedArguments[#fields] as String?;
      return Future<Map<String, dynamic>>.value({'Items': boxSetItems});
    }
    return super.noSuchMethod(invocation);
  }
}

Map<String, dynamic> _playableItem(String id, {required bool played}) => {
  'Id': id,
  'Type': 'Episode',
  'Name': 'Item $id',
  'UserData': {'Played': played},
};

class _FakeClient implements MediaServerClient {
  _FakeClient(this._itemsApi);

  final ItemsApi _itemsApi;

  @override
  ItemsApi get itemsApi => _itemsApi;

  @override
  String? get accessToken => 'test-token';

  @override
  String get baseUrl => 'http://127.0.0.1:1';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late OfflineDatabase db;
  late Directory tempDir;
  late UserPreferences prefs;
  late DownloadService service;

  const itemId = 'movie-1';
  final itemData = <String, dynamic>{
    'Id': itemId,
    'Type': 'Movie',
    'Name': 'Test Movie',
    'MediaSources': [
      {'Id': 'source-1', 'Container': 'mkv', 'Size': 1024},
    ],
  };

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    tempDir = await Directory.systemTemp.createTemp('moonfin_retry_test');
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    final repo = _FakeOfflineRepository(db);

    final getIt = GetIt.instance;
    getIt.registerSingleton<UserPreferences>(prefs);
    getIt.registerSingleton<StoragePathService>(
      _FakeStoragePathService(tempDir),
    );
    getIt.registerSingleton<OfflineRepository>(repo);

    service = DownloadService(
      _FakeClient(_FakeItemsApi(itemData)),
      DownloadNotificationService(),
    );
  });

  tearDown(() async {
    service.dispose();
    await GetIt.instance.reset();
    await db.close();
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('a failed download can be retried without an app restart', () async {
    final item = AggregatedItem(
      id: itemId,
      serverId: 'http://127.0.0.1:1',
      rawData: itemData,
    );

    final errors = <String>[];
    final sub = service.errors.listen(errors.add);

    await service.downloadItem(item);
    await pumpEventQueue();

    expect(
      service.activeDownloads[itemId]?.error,
      isNotNull,
      reason: 'first attempt should fail with a connection error',
    );
    expect(errors, hasLength(1));
    expect(
      service.isDownloading(itemId),
      isTrue,
      reason: 'the error entry is retained for the Retry UI',
    );

    // The regression: this second call used to no-op because the stale error
    // entry made the in-flight guard treat the item as still downloading.
    await service.downloadItem(item);
    await pumpEventQueue();

    expect(
      errors,
      hasLength(2),
      reason: 'retry must run (and fail again), not silently no-op',
    );
    expect(service.activeDownloads[itemId]?.error, isNotNull);

    await sub.cancel();
  });

  test('limits queued downloads to the configured concurrency', () async {
    await prefs.set(UserPreferences.downloadConcurrentCount, 2);
    final itemsApi = _BlockingItemsApi();
    service.dispose();
    service = DownloadService(
      _FakeClient(itemsApi),
      DownloadNotificationService(),
    );
    final items = List.generate(
      3,
      (index) => AggregatedItem(
        id: 'movie-$index',
        serverId: 'http://127.0.0.1:1',
        rawData: {...itemData, 'MediaSources': const []},
      ),
    );

    final downloads = items.map(service.downloadItem).toList();
    await _waitForCalls(itemsApi, 2);
    expect(itemsApi.calls, 2);

    // Every enqueued item is listed while the first two hold the slots; the
    // waiting third one carries a queued placeholder.
    expect(service.activeDownloads.length, 3);
    expect(service.isDownloading('movie-2'), isTrue);
    expect(service.activeDownloads['movie-2']?.isQueued, isTrue);

    itemsApi.releaseNext();
    await _waitForCalls(itemsApi, 3);
    expect(itemsApi.calls, 3);

    itemsApi.releaseNext();
    itemsApi.releaseNext();
    await Future.wait(downloads);

    expect(
      service.activeDownloads.values.every((p) => p.error != null),
      isTrue,
    );
  });

  test(
    'the native handoff wait covers a download still in the queue',
    () async {
      final itemsApi = _BlockingItemsApi();
      service.dispose();
      service = DownloadService(
        _FakeClient(itemsApi),
        DownloadNotificationService(),
      );
      final item = AggregatedItem(
        id: 'movie-0',
        serverId: 'http://127.0.0.1:1',
        rawData: {...itemData, 'MediaSources': const []},
      );

      // A background run queues and then waits; the item is only a queued
      // placeholder at that instant, so the wait must still hold the engine.
      final download = service.downloadItem(item);
      final wait = service.waitForNativeHandoff(
        timeout: const Duration(seconds: 5),
      );
      var waited = false;
      unawaited(wait.then((_) => waited = true));
      await _waitForCalls(itemsApi, 1);
      await Future<void>.delayed(const Duration(milliseconds: 600));
      expect(waited, isFalse, reason: 'preparation is still in progress');

      itemsApi.releaseNext();
      await download;
      await wait;
      expect(service.activeDownloads['movie-0']?.error, isNotNull);
    },
  );

  test('queued downloads are listed and cancellable while waiting', () async {
    await prefs.set(UserPreferences.downloadConcurrentCount, 1);
    final itemsApi = _BlockingItemsApi();
    service.dispose();
    service = DownloadService(
      _FakeClient(itemsApi),
      DownloadNotificationService(),
    );
    final items = List.generate(
      2,
      (index) => AggregatedItem(
        id: 'movie-$index',
        serverId: 'http://127.0.0.1:1',
        rawData: {...itemData, 'MediaSources': const []},
      ),
    );

    final downloads = items.map(service.downloadItem).toList();
    await _waitForCalls(itemsApi, 1);

    // The second item waits for a slot but is visible as queued.
    expect(service.isDownloading('movie-1'), isTrue);
    expect(service.activeDownloads['movie-1']?.isQueued, isTrue);

    // Cancelling the waiting item removes its placeholder and completes its
    // download future without touching the running one.
    service.cancelDownload('movie-1');
    expect(service.activeDownloads.containsKey('movie-1'), isFalse);
    expect(service.isDownloading('movie-0'), isTrue);

    itemsApi.releaseNext();
    await Future.wait(downloads);
    expect(service.activeDownloads['movie-0']?.error, isNotNull);
  });

  test('concurrently admitted downloads share the storage cap', () async {
    await prefs.set(UserPreferences.downloadConcurrentCount, 2);
    // 1 MiB: each 600 KB item fits alone, two admitted together do not.
    await prefs.set(UserPreferences.downloadStorageLimitMb, 1);
    final repo = _GatedOfflineRepository(db);
    GetIt.instance.unregister<OfflineRepository>();
    GetIt.instance.registerSingleton<OfflineRepository>(repo);
    final itemsApi = _StorageTestApi({
      'storage-a': _sizedItemData('storage-a', 600000),
      'storage-b': _sizedItemData('storage-b', 600000),
    }, parkItemId: 'storage-b');
    service.dispose();
    service = DownloadService(
      _FakeClient(itemsApi),
      DownloadNotificationService(),
    );

    final futureA = service.downloadItem(
      AggregatedItem(
        id: 'storage-a',
        serverId: 'http://127.0.0.1:1',
        rawData: _sizedItemData('storage-a', 600000),
      ),
    );
    final futureB = service.downloadItem(
      AggregatedItem(
        id: 'storage-b',
        serverId: 'http://127.0.0.1:1',
        rawData: _sizedItemData('storage-b', 600000),
      ),
    );

    // Item A is admitted and reserves its bytes; item B's metadata fetch is
    // parked until then so its storage check must see A's reservation.
    await _waitFor(() => repo.upsertCalls == 1);
    itemsApi.releaseParked.complete();

    await _waitFor(() => service.activeDownloads['storage-b']?.error != null);
    expect(
      service.activeDownloads['storage-b']?.error,
      contains('Storage limit'),
      reason: 'the second admission must fail against the reserved bytes',
    );
    expect(
      service.activeDownloads['storage-a']?.isQueued,
      isTrue,
      reason: 'the admitted item is still preparing',
    );
    await futureB;

    repo.upsertGate.complete();
    await futureA;
    expect(
      service.activeDownloads.values.every((p) => p.error != null),
      isTrue,
    );
  });

  test('queueing a large batch coalesces listener notifications', () async {
    await prefs.set(UserPreferences.downloadWifiOnly, true);
    final items = List.generate(
      200,
      (index) => AggregatedItem(
        id: 'movie-$index',
        serverId: 'http://127.0.0.1:1',
        rawData: itemData,
      ),
    );
    var notifications = 0;
    service.addListener(() => notifications++);

    await service.downloadItems(items);
    await pumpEventQueue();

    // One placeholder per item plus one failure per item used to mean 400
    // rebuilds of the downloads panel; they now collapse to a handful.
    expect(notifications, lessThan(10));
    expect(service.activeDownloads.length, items.length);
  });

  test('a batch with an escaping failure resets its state', () async {
    await prefs.set(UserPreferences.downloadWifiOnly, true);
    final items = List.generate(
      2,
      (index) => AggregatedItem(
        id: 'movie-$index',
        serverId: 'http://127.0.0.1:1',
        rawData: itemData,
      ),
    );

    // wifiOnly routes the policy check through Connectivity(), which has no
    // platform implementation in tests and throws before any progress entry
    // is created — the escape the placeholder repair guards against.
    await service.downloadItems(items);

    expect(service.isBatchDownloading, isFalse);
    for (final item in items) {
      final progress = service.activeDownloads[item.id];
      expect(progress?.error, isNotNull);
      expect(progress?.isQueued, isFalse);
    }
  });

  group('unwatched-only batch downloads', () {
    late _LibraryItemsApi api;
    late DownloadService libraryService;

    setUp(() {
      api = _LibraryItemsApi(
        episodesBySeason: {
          'season-1': [
            _playableItem('ep-1', played: true),
            _playableItem('ep-2', played: false),
          ],
          'season-2': [
            _playableItem('ep-3', played: false),
            _playableItem('ep-4', played: true),
          ],
        },
        boxSetItems: [
          _playableItem('movie-a', played: true),
          _playableItem('movie-b', played: false),
        ],
      );
      libraryService = DownloadService(
        _FakeClient(api),
        DownloadNotificationService(),
      );
    });

    tearDown(() => libraryService.dispose());

    test('series fetch is one call and requests user data', () async {
      final episodes = await libraryService.fetchEpisodes('series-1');

      expect(episodes.map((e) => e.id), ['ep-1', 'ep-2', 'ep-3', 'ep-4']);
      expect(api.episodeFields.single, contains('UserData'));
      expect(api.episodeFields.single, contains('RunTimeTicks'));
    });

    test('season fetch requests media sources and user data', () async {
      final episodes = await libraryService.fetchEpisodes(
        'series-1',
        seasonId: 'season-2',
      );

      expect(episodes.map((e) => e.id), ['ep-3', 'ep-4']);
      expect(api.episodeFields.single, contains('MediaSources'));
      expect(api.episodeFields.single, contains('UserData'));
    });

    test('collection fetch requests user data', () async {
      final items = await libraryService.fetchBoxSetPlayableItems('boxset-1');

      expect(items.map((e) => e.id), ['movie-a', 'movie-b']);
      expect(api.boxSetFields, contains('UserData'));
    });

    test('downloadItems queues exactly the unwatched list', () async {
      // wifiOnly makes every item fail fast in tests (no Connectivity
      // platform), leaving one error entry per queued item.
      await prefs.set(UserPreferences.downloadWifiOnly, true);
      final episodes = await libraryService.fetchEpisodes('series-1');

      await libraryService.downloadItems(
        episodes.where((e) => !e.isPlayed).toList(),
      );

      expect(libraryService.activeDownloads.keys.toSet(), {'ep-2', 'ep-3'});
    });
  });

  group('batch queueing', () {
    late _BlockingItemsApi api;
    late _CompletedRowsRepository repo;
    late DownloadService batchService;

    AggregatedItem movie(String id) => AggregatedItem(
      id: id,
      serverId: 'http://127.0.0.1:1',
      rawData: _sizedItemData(id, 1024),
    );

    setUp(() {
      api = _BlockingItemsApi();
      repo = _CompletedRowsRepository(db);
      GetIt.instance.unregister<OfflineRepository>();
      GetIt.instance.registerSingleton<OfflineRepository>(repo);
      batchService = DownloadService(
        _FakeClient(api),
        DownloadNotificationService(),
      );
    });

    tearDown(() => batchService.dispose());

    test('queueDownloads skips in-flight and repeated items', () async {
      await prefs.set(UserPreferences.downloadConcurrentCount, 3);
      repo.completedIds.add('done');
      final inFlight = batchService.downloadItem(movie('running'));
      await _waitForCalls(api, 1);

      final batch = await batchService.queueDownloads([
        movie('running'),
        movie('done'),
        movie('fresh'),
        movie('fresh'),
      ]);

      // 'done' is already downloaded, but a manual batch is the user asking
      // for it, so only the running transfer and the repeat are dropped.
      expect(batch.queued.map((i) => i.id), ['done', 'fresh']);
      expect(batchService.totalQueued, 2);
      expect(batchService.inFlightItemIds, {'running', 'done', 'fresh'});

      await _waitForCalls(api, 3);
      api.releaseNext();
      api.releaseNext();
      api.releaseNext();
      await inFlight.catchError((_) {});
      await batch.done;
      expect(batchService.totalQueued, 0);
    });

    test('an automatic batch leaves finished downloads alone', () async {
      repo.completedIds.add('done');

      final batch = await batchService.queueDownloads([
        movie('done'),
        movie('fresh'),
      ], source: DownloadSource.auto);

      expect(batch.queued.map((i) => i.id), ['fresh']);
      expect(batchService.totalQueued, 1);

      await _waitForCalls(api, 1);
      api.releaseNext();
      await batch.done;
      expect(batchService.totalQueued, 0);
    });

    test('a batch starts its count from zero', () async {
      // Every finished download bumps the counter, so leftovers from a
      // one-off would push a later batch past its total early.
      final single = batchService.downloadItem(movie('one-off'));
      await _waitForCalls(api, 1);
      api.releaseNext();
      await single.catchError((_) {});

      final batch = await batchService.queueDownloads([
        movie('a'),
        movie('b'),
      ]);
      expect(batchService.totalQueued, 2);
      expect(batchService.completedCount, 0);
      expect(batchService.isBatchDownloading, isTrue);

      await _waitForCalls(api, 3);
      api.releaseNext();
      api.releaseNext();
      await batch.done;
    });

    test(
      'concurrent batches share one count until the last finishes',
      () async {
        await prefs.set(UserPreferences.downloadConcurrentCount, 3);
        final first = await batchService.queueDownloads([
          movie('a'),
          movie('b'),
        ]);
        expect(batchService.totalQueued, 2);
        expect(batchService.isBatchDownloading, isTrue);

        final second = await batchService.queueDownloads([movie('c')]);
        expect(batchService.totalQueued, 3, reason: 'counts are additive');

        await _waitForCalls(api, 3);
        api.releaseNext();
        api.releaseNext();
        await first.done;
        expect(
          batchService.totalQueued,
          3,
          reason: 'the count holds while another batch is still open',
        );

        api.releaseNext();
        await second.done;
        expect(batchService.totalQueued, 0);
        expect(batchService.completedCount, 0);
        expect(batchService.isBatchDownloading, isFalse);
      },
    );

    test('an auto batch stamps its rows with the auto source', () async {
      final batch = await batchService.queueDownloads([
        movie('auto-1'),
      ], source: DownloadSource.auto);
      await _waitForCalls(api, 1);
      api.releaseNext();
      await batch.done;

      expect(repo.upserts.single.downloadSource.value, 'auto');
    });
  });
}

/// Reports [completedIds] as finished downloads and records every upsert.
class _CompletedRowsRepository extends _FakeOfflineRepository {
  _CompletedRowsRepository(super.db);

  final Set<String> completedIds = {};
  final List<DownloadedItemsCompanion> upserts = [];

  @override
  Future<void> upsertItem(DownloadedItemsCompanion item) async {
    upserts.add(item);
  }

  @override
  Future<List<DownloadRef>> getDownloadRefs() async => [
    for (final id in completedIds)
      (itemId: id, downloadStatus: 2, downloadSource: 'manual'),
  ];
}

Future<void> _waitForCalls(_BlockingItemsApi api, int expected) async {
  for (var attempt = 0; attempt < 100; attempt++) {
    if (api.calls >= expected) return;
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  fail('Expected $expected item requests, got ${api.calls}.');
}

Future<void> _waitFor(bool Function() condition) async {
  for (var attempt = 0; attempt < 100; attempt++) {
    if (condition()) return;
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  fail('Condition was not met in time.');
}
