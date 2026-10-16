import 'dart:convert';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/offline/offline_catalog.dart';
import 'package:moonfin/data/offline/offline_stub_apis.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/pending_rating_store.dart';
import 'package:moonfin/data/services/pending_playbackposition_store.dart';
import 'package:moonfin/data/services/sync_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PreferenceStore prefStore;
  late PendingRatingStore dummyStore;
  late PendingPlaybackPositionStore store;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefStore = PreferenceStore();
    await prefStore.init();
    dummyStore = PendingRatingStore(prefStore);
    store = PendingPlaybackPositionStore(prefStore);
  });

  group('PendingPlaybackPositionStore', () {
    test('keeps one entry per item, so the last update wins', () async {
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 40),
      );
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 90),
      );

      final all = store.all;
      expect(all, hasLength(1));
      expect(all.singleWhere((e) => e.itemId == 'a').value, 90);
    });

    test('the same item id on another server stays a separate entry',
        () async {
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 20),
      );
      await store.put(
        const PendingPlaybackPosition(serverId: 's2', itemId: 'a', value: 30),
      );

      expect(store.all, hasLength(2));
      await store.remove('s1', 'a');
      expect(store.all.single.serverId, 's2');
    });
  });

  group('OfflineUserLibraryApi', () {
    late OfflineDatabase db;
    late OfflineRepository repo;
    late OfflineCatalog catalog;
    late OfflineUserLibraryApi api;

    setUp(() async {
      db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
      repo = OfflineRepository(db);
      catalog = OfflineCatalog(repo);
      api = OfflineUserLibraryApi(
        catalog,
        pendingRatings: dummyStore,
        pendingPlaybackPosition: store,
        offlineRepo: repo,
      );

      await repo.upsertItem(
        DownloadedItemsCompanion(
          itemId: const Value('m1'),
          serverId: const Value('server-1'),
          type: const Value('Movie'),
          name: const Value('Alpha'),
          metadataJson: Value(
            jsonEncode({
              'Id': 'm1',
              'Type': 'Movie',
              'Name': 'Alpha',
              'UserData': {'PlaybackPositionTicks': 40},
            }),
          ),
          downloadStatus: const Value(2),
        ),
      );
      await catalog.warm();
    });

    tearDown(() async {
      catalog.dispose();
      await db.close();
    });

    test('a position update is queued and lands in the stored user data',
        () async {
      await api.updatePlayedPosition('m1', playedPosition: 85);

      final entry = store.all.single;
      expect(entry.serverId, 'server-1');
      expect(entry.value, 85);

      final row = await repo.getItem('m1');
      final userData =
          (jsonDecode(row!.metadataJson) as Map)['UserData'] as Map;
      expect(userData['PlaybackPositionTicks'], 85);
    });

    test('an item outside the catalog still fails like any offline call',
        () async {
      await expectLater(
        api.updatePlayedPosition('missing', playedPosition: 90),
        throwsA(anything),
      );
      expect(store.all, isEmpty);
    });
  });

  group('SyncService.syncPendingPlaybackPosition', () {
    late _MockClient client;
    late _MockUserLibraryApi userLibrary;
    late SyncService sync;
    late OfflineDatabase db;

    setUp(() {
      db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
      client = _MockClient();
      userLibrary = _MockUserLibraryApi();
      when(() => client.userLibraryApi).thenReturn(userLibrary);
      sync = SyncService(OfflineRepository(db), dummyStore, store);
    });

    tearDown(() async {
      await db.close();
    });

    test('replays only the active server and clears what it pushed', () async {
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 70),
      );
      await store.put(
        const PendingPlaybackPosition(serverId: 's2', itemId: 'b', value: 80),
      );
      when(() => userLibrary.updatePlayedPosition('a', playedPosition: 70))
          .thenAnswer((_) async {});
      when(() => userLibrary.updatePlayedPosition('b', playedPosition: 80))
          .thenAnswer((_) async {});

      final result = await sync.syncPendingPlaybackPosition(client, serverId: 's1');

      expect(result.synced, 1);
      expect(result.failed, 0);
      expect(store.all.single.serverId, 's2',
          reason: 'the other server waits for its own reconnect');
    });

    test('a failed push keeps its entry for the next reconnect', () async {
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 70),
      );
      when(() => userLibrary.updatePlayedPosition('a', playedPosition: 70))
          .thenThrow(Exception('boom'));

      final result = await sync.syncPendingPlaybackPosition(client, serverId: 's1');

      expect(result.synced, 0);
      expect(result.failed, 1);
      expect(store.all, hasLength(1));
    });

    test('no known active server replays nothing', () async {
      await store.put(
        const PendingPlaybackPosition(serverId: 's1', itemId: 'a', value: 70),
      );

      final result = await sync.syncPendingPlaybackPosition(client, serverId: null);

      expect(result.synced, 0);
      expect(store.all, hasLength(1));
      verifyZeroInteractions(userLibrary);
    });
  });
}
