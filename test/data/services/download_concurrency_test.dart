import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/download_notification_service.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeOfflineRepository extends OfflineRepository {
  _FakeOfflineRepository(super.db);

  @override
  Future<void> upsertItem(DownloadedItemsCompanion item) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeStoragePathService implements StoragePathService {
  _FakeStoragePathService(this.dir);
  final Directory dir;

  @override
  Future<Directory> getOfflineRoot() async => dir;

  @override
  Future<Directory> getImageCacheDir() async {
    final imageDir = Directory('${dir.path}/images');
    if (!await imageDir.exists()) await imageDir.create(recursive: true);
    return imageDir;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Holds each metadata fetch open until released, so the peak number of items
/// in flight at once is observable.
class _GatedItemsApi implements ItemsApi {
  final Map<String, dynamic> itemData;
  _GatedItemsApi(this.itemData);

  int inFlight = 0;
  int peakInFlight = 0;
  final gate = Completer<void>();

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    inFlight++;
    if (inFlight > peakInFlight) peakInFlight = inFlight;
    await gate.future;
    inFlight--;
    return {...itemData, 'Id': itemId};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this._itemsApi);
  final ItemsApi _itemsApi;

  @override
  ItemsApi get itemsApi => _itemsApi;

  @override
  String? get accessToken => 'test-token';

  // Unroutable, so every transfer fails immediately once metadata resolves.
  @override
  String get baseUrl => 'http://127.0.0.1:1';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late OfflineDatabase db;
  late Directory tempDir;
  late _GatedItemsApi itemsApi;
  late DownloadService service;

  final itemData = <String, dynamic>{
    'Type': 'Movie',
    'Name': 'Test Movie',
    'MediaSources': [
      {'Id': 'source-1', 'Container': 'mkv', 'Size': 1024},
    ],
  };

  Future<void> buildService(int concurrentCount) async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'download_concurrent_count': concurrentCount,
    });
    final store = PreferenceStore();
    await store.init();

    tempDir = await Directory.systemTemp.createTemp('moonfin_conc_test');
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    itemsApi = _GatedItemsApi(itemData);

    final getIt = GetIt.instance;
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<StoragePathService>(
      _FakeStoragePathService(tempDir),
    );
    getIt.registerSingleton<OfflineRepository>(_FakeOfflineRepository(db));

    service = DownloadService(
      _FakeClient(itemsApi),
      DownloadNotificationService(),
    );
  }

  tearDown(() async {
    await GetIt.instance.reset();
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  List<AggregatedItem> itemsFor(int count) => [
    for (var i = 0; i < count; i++)
      AggregatedItem(
        id: 'movie-$i',
        serverId: 'server-1',
        rawData: {...itemData, 'Id': 'movie-$i'},
      ),
  ];

  test('a batch runs no more items at once than the setting allows', () async {
    await buildService(3);

    final batch = service.downloadItems(itemsFor(8));
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(itemsApi.peakInFlight, 3);

    itemsApi.gate.complete();
    await batch;
  });

  test('a setting of one keeps the old single file behaviour', () async {
    await buildService(1);

    final batch = service.downloadItems(itemsFor(4));
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(itemsApi.peakInFlight, 1);

    itemsApi.gate.complete();
    await batch;
  });

  test('a batch smaller than the setting starts only what it has', () async {
    await buildService(8);

    final batch = service.downloadItems(itemsFor(2));
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(itemsApi.peakInFlight, 2);

    itemsApi.gate.complete();
    await batch;
  });
}
