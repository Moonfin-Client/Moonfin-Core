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
import 'package:moonfin/data/services/sync_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PreferenceStore prefStore;
  late PendingRatingStore store;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefStore = PreferenceStore();
    await prefStore.init();
    store = PendingRatingStore(prefStore);
  });

  group('PendingRatingStore', () {
    test('keeps one entry per item, so the last rating wins', () async {
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 4),
      );
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 9),
      );
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'b', likes: true),
      );

      final all = store.all;
      expect(all, hasLength(2));
      expect(all.singleWhere((e) => e.itemId == 'a').rating, 9);
      expect(all.singleWhere((e) => e.itemId == 'b').likes, isTrue);
    });

    test('the same item id on another server stays a separate entry',
        () async {
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 2),
      );
      await store.put(
        const PendingRating(serverId: 's2', itemId: 'a', clear: true),
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
        pendingRatings: store,
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
              'UserData': {'Likes': true},
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

    test('a numeric rating is queued and lands in the stored user data',
        () async {
      await api.updateNumericUserRating('m1', rating: 8.5);

      final entry = store.all.single;
      expect(entry.serverId, 'server-1');
      expect(entry.rating, 8.5);

      final row = await repo.getItem('m1');
      final userData =
          (jsonDecode(row!.metadataJson) as Map)['UserData'] as Map;
      expect(userData['Rating'], 8.5);
      expect(
        userData.containsKey('Likes'),
        isFalse,
        reason: 'a stale thumb would contradict the new score',
      );
    });

    test('clearing removes both the score and the thumb locally', () async {
      await api.deleteUserRating('m1');

      expect(store.all.single.clear, isTrue);
      final row = await repo.getItem('m1');
      final userData =
          (jsonDecode(row!.metadataJson) as Map)['UserData'] as Map;
      expect(userData.containsKey('Rating'), isFalse);
      expect(userData.containsKey('Likes'), isFalse);
    });

    test('an item outside the catalog still fails like any offline call',
        () async {
      await expectLater(
        api.updateUserRating('missing', likes: true),
        throwsA(anything),
      );
      expect(store.all, isEmpty);
    });
  });

  group('SyncService.syncPendingRatings', () {
    late _MockClient client;
    late _MockUserLibraryApi userLibrary;
    late SyncService sync;
    late OfflineDatabase db;

    setUp(() {
      db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
      client = _MockClient();
      userLibrary = _MockUserLibraryApi();
      when(() => client.userLibraryApi).thenReturn(userLibrary);
      sync = SyncService(OfflineRepository(db), store);
    });

    tearDown(() async {
      await db.close();
    });

    test('replays only the active server and clears what it pushed', () async {
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 7),
      );
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'b', likes: false),
      );
      await store.put(
        const PendingRating(serverId: 's2', itemId: 'c', clear: true),
      );
      when(() => userLibrary.updateNumericUserRating('a', rating: 7))
          .thenAnswer((_) async {});
      when(() => userLibrary.updateUserRating('b', likes: false))
          .thenAnswer((_) async {});

      final result = await sync.syncPendingRatings(client, serverId: 's1');

      expect(result.synced, 2);
      expect(result.failed, 0);
      verifyNever(() => userLibrary.deleteUserRating(any()));
      expect(store.all.single.serverId, 's2',
          reason: 'the other server waits for its own reconnect');
    });

    test('a failed push keeps its entry for the next reconnect', () async {
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 7),
      );
      when(() => userLibrary.updateNumericUserRating('a', rating: 7))
          .thenThrow(Exception('boom'));

      final result = await sync.syncPendingRatings(client, serverId: 's1');

      expect(result.synced, 0);
      expect(result.failed, 1);
      expect(store.all, hasLength(1));
    });

    test('no known active server replays nothing', () async {
      await store.put(
        const PendingRating(serverId: 's1', itemId: 'a', rating: 7),
      );

      final result = await sync.syncPendingRatings(client, serverId: null);

      expect(result.synced, 0);
      expect(store.all, hasLength(1));
      verifyZeroInteractions(userLibrary);
    });
  });
}
