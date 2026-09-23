import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/pending_rating_store.dart';
import 'package:moonfin/data/services/sync_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockPlaybackApi extends Mock implements PlaybackApi {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

const _min = 60 * 10000000;
const _runtime = 100 * _min;

/// A server that keeps one position per item and takes stop reports and
/// mark-played the way Jellyfin does, including a success for a stop report
/// about an item it has never heard of.
class _FakeServer {
  _FakeServer(this.baseUrl) {
    client = _buildClient();
  }

  final String baseUrl;
  final Map<String, Map<String, dynamic>> userData = {};
  final List<Map<String, dynamic>> stopReports = [];
  final List<String> markedPlayed = [];
  final List<String> itemFetches = [];
  final playback = _MockPlaybackApi();

  /// Holds the user-data batch until completed, to keep a sync in flight.
  Completer<void>? gate;

  void set(String id, {int ticks = 0, bool played = false}) {
    userData[id] = {'PlaybackPositionTicks': ticks, 'Played': played};
  }

  int ticks(String id) => userData[id]!['PlaybackPositionTicks'] as int;
  bool played(String id) => userData[id]!['Played'] as bool;

  late final MediaServerClient client;

  MediaServerClient _buildClient() {
    final client = _MockClient();
    final items = _MockItemsApi();
    final library = _MockUserLibraryApi();
    when(() => client.baseUrl).thenReturn(baseUrl);
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.playbackApi).thenReturn(playback);
    when(() => client.userLibraryApi).thenReturn(library);
    when(
      () => items.getItems(
        ids: any(named: 'ids'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer((inv) async {
      await gate?.future;
      final ids = inv.namedArguments[#ids] as List<String>;
      return {
        'Items': [
          for (final id in ids)
            if (userData.containsKey(id))
              {'Id': id, 'UserData': Map<String, dynamic>.from(userData[id]!)},
        ],
      };
    });
    when(() => items.getItem(any())).thenAnswer((inv) async {
      final id = inv.positionalArguments.first as String;
      itemFetches.add(id);
      if (!userData.containsKey(id)) throw Exception('404');
      return {
        'Id': id,
        'RunTimeTicks': _runtime,
        'UserData': Map<String, dynamic>.from(userData[id]!),
      };
    });
    when(() => playback.reportPlaybackStopped(any())).thenAnswer((inv) async {
      final info = inv.positionalArguments.first as Map<String, dynamic>;
      stopReports.add(info);
      final id = info['ItemId'] as String;
      if (userData.containsKey(id)) {
        userData[id] = {
          'PlaybackPositionTicks': info['PositionTicks'] as int,
          'Played': false,
        };
      }
    });
    when(() => library.markPlayed(any())).thenAnswer((inv) async {
      final id = inv.positionalArguments.first as String;
      markedPlayed.add(id);
      userData[id] = {'PlaybackPositionTicks': 0, 'Played': true};
    });
    return client;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late OfflineRepository repo;
  late SyncService sync;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefStore = PreferenceStore();
    await prefStore.init();
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    sync = SyncService(repo, PendingRatingStore(prefStore));
  });

  tearDown(() async {
    sync.dispose();
    await db.close();
  });

  Future<void> download(
    String id, {
    String serverId = 'server-a',
    int ticksAtDownload = 0,
  }) => repo.upsertItem(
    DownloadedItemsCompanion(
      itemId: Value(id),
      serverId: Value(serverId),
      type: const Value('Movie'),
      name: Value(id),
      metadataJson: Value(
        jsonEncode({
          'Id': id,
          'RunTimeTicks': _runtime,
          'UserData': {
            'PlaybackPositionTicks': ticksAtDownload,
            'Played': false,
          },
        }),
      ),
      downloadStatus: const Value(2),
      playbackPositionTicks: Value(ticksAtDownload),
    ),
  );

  /// Downloaded at [server]'s position, then watched offline to [ticks].
  Future<void> watchedOffline(
    String id,
    _FakeServer server, {
    String serverId = 'server-a',
    required int serverTicks,
    required int ticks,
  }) async {
    await download(id, serverId: serverId, ticksAtDownload: serverTicks);
    server.set(id, ticks: serverTicks);
    await repo.updatePlaybackPosition(id, ticks);
  }

  Future<int> localTicks(String id) async =>
      (await repo.getItem(id))!.playbackPositionTicks;
  Future<bool> localSynced(String id) async =>
      (await repo.getItem(id))!.progressSynced;

  // The rules from PR #560: whichever side got further wins, and a completion
  // on either side beats a partial position on the other.
  group('furthest progress wins', () {
    late _FakeServer server;

    setUp(() => server = _FakeServer('http://server-a.test'));

    Future<void> reconnect() async {
      await sync.syncPlaybackProgress(server.client, serverId: 'server-a');
      await sync.refreshMetadata(server.client, serverId: 'server-a');
    }

    test('local ahead: pushed, and the refresh keeps it', () async {
      await watchedOffline(
        'm',
        server,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );

      await reconnect();

      expect(server.ticks('m'), 40 * _min);
      expect(await localTicks('m'), 40 * _min);
      expect(await localSynced('m'), isTrue);
    });

    test('server ahead: the server position is adopted', () async {
      await watchedOffline(
        'm',
        server,
        serverTicks: 30 * _min,
        ticks: 10 * _min,
      );

      await reconnect();

      expect(server.stopReports, isEmpty);
      expect(server.ticks('m'), 30 * _min);
      expect(await localTicks('m'), 30 * _min);
      expect(await localSynced('m'), isTrue);
    });

    test('played on the server beats a partial local position', () async {
      await watchedOffline('m', server, serverTicks: 0, ticks: 50 * _min);
      server.set('m', played: true);

      await reconnect();

      expect(server.stopReports, isEmpty);
      expect(server.played('m'), isTrue);
      expect(await localTicks('m'), 0);
    });

    test('finished offline beats a partial server position', () async {
      await watchedOffline('m', server, serverTicks: 20 * _min, ticks: 0);

      await reconnect();

      expect(server.markedPlayed, ['m']);
      expect(server.played('m'), isTrue);
    });

    test('nothing watched offline: newer server progress comes down', () async {
      await download('m', ticksAtDownload: 5 * _min);
      server.set('m', ticks: 25 * _min);

      await reconnect();

      expect(server.stopReports, isEmpty);
      expect(await localTicks('m'), 25 * _min);
    });

    test('a failed push keeps the local position for the next try', () async {
      await watchedOffline(
        'm',
        server,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );
      when(() => server.playback.reportPlaybackStopped(any()))
          .thenThrow(Exception('boom'));

      await reconnect();

      expect(await localTicks('m'), 40 * _min);
      expect(await localSynced('m'), isFalse);
    });
  });

  // A server answers a stop report for an item it does not have with success,
  // so syncing another server's row would mark it synced and its own server
  // would never get it.
  group('only the active server is synced', () {
    late _FakeServer serverA;
    late _FakeServer serverB;

    setUp(() {
      serverA = _FakeServer('http://server-a.test');
      serverB = _FakeServer('http://server-b.test');
    });

    test('server A progress waits while server B is active', () async {
      await watchedOffline(
        'a-movie',
        serverA,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );

      await sync.syncPlaybackProgress(serverB.client, serverId: 'server-b');
      await sync.refreshMetadata(serverB.client, serverId: 'server-b');

      expect(serverB.stopReports, isEmpty);
      expect(serverB.itemFetches, isEmpty);
      expect(await localSynced('a-movie'), isFalse);

      await sync.syncPlaybackProgress(serverA.client, serverId: 'server-a');

      expect(serverA.ticks('a-movie'), 40 * _min);
      expect(await localSynced('a-movie'), isTrue);
    });

    test(
      'a row stored under the server address is still that server\'s',
      () async {
        await watchedOffline(
          'a-movie',
          serverA,
          serverId: 'HTTP://Server-A.test/',
          serverTicks: 10 * _min,
          ticks: 40 * _min,
        );

        await sync.syncPlaybackProgress(serverB.client, serverId: 'server-b');
        expect(serverB.stopReports, isEmpty);

        await sync.syncPlaybackProgress(serverA.client, serverId: 'server-a');
        await sync.refreshMetadata(serverA.client, serverId: 'server-a');

        expect(serverA.ticks('a-movie'), 40 * _min);
        expect(serverA.itemFetches, ['a-movie']);
        expect(await localSynced('a-movie'), isTrue);
      },
    );

    test('no active server id: nothing is pushed', () async {
      await watchedOffline(
        'a-movie',
        serverA,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );

      await sync.syncPlaybackProgress(serverA.client, serverId: null);
      await sync.refreshMetadata(serverA.client, serverId: null);

      expect(serverA.stopReports, isEmpty);
      expect(serverA.itemFetches, isEmpty);
      expect(await localSynced('a-movie'), isFalse);
    });
  });
}
