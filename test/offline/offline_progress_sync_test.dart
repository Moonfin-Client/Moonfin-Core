import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/pending_rating_store.dart';
import 'package:moonfin/data/services/sync_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockPlaybackApi extends Mock implements PlaybackApi {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

class _MockConnectivity extends Mock implements Connectivity {}

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

  // #1603: the only sync trigger used to be the server becoming reachable, so
  // a cold start on a live network never pushed what was watched offline.
  group('when the sync runs', () {
    late HttpServer ping;
    late _MockConnectivity connectivity;
    var probes = 0;

    setUp(() async {
      // The reporter is on iOS. flutter_test reports Android, where a null
      // lifecycle counts as a headless engine and parks the sync.
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      // The test binding answers every request with a 400, and the probe has
      // to reach the loopback server.
      HttpOverrides.global = null;
      await GetIt.instance.reset();
      probes = 0;
      ping = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      ping.listen((request) async {
        probes++;
        request.response.statusCode = HttpStatus.ok;
        await request.response.close();
      });
      connectivity = _MockConnectivity();
      when(() => connectivity.onConnectivityChanged)
          .thenAnswer((_) => const Stream.empty());
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      GetIt.instance.registerSingleton<SyncService>(sync);
    });

    tearDown(() async {
      debugDefaultTargetPlatformOverride = null;
      await ping.close(force: true);
      await GetIt.instance.reset();
    });

    String pingUrl() => 'http://${ping.address.address}:${ping.port}';

    ConnectivityService startService() {
      final service = ConnectivityService(connectivity: connectivity);
      addTearDown(service.dispose);
      service.initialize();
      return service;
    }

    /// What setActiveServerClient does for the app engine.
    Future<void> signIn(
      ConnectivityService service,
      _FakeServer server,
      String serverId,
    ) {
      if (GetIt.instance.isRegistered<MediaServerClient>()) {
        GetIt.instance.unregister<MediaServerClient>();
      }
      GetIt.instance.registerSingleton<MediaServerClient>(server.client);
      return service.onServerClientReady(serverId);
    }

    Future<void> until(
      FutureOr<bool> Function() done, {
      Duration timeout = const Duration(seconds: 5),
    }) async {
      final deadline = DateTime.now().add(timeout);
      while (!await done()) {
        if (DateTime.now().isAfter(deadline)) return;
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }
    }

    test('cold start online: progress watched offline reaches the server, '
        'with one probe shared with the startup screen', () async {
      final server = _FakeServer(pingUrl());
      await watchedOffline(
        'm',
        server,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );

      // Boot: the connectivity service starts long before any client exists.
      final service = startService();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(server.stopReports, isEmpty);

      // Session restore registers the client, and the startup screen's
      // recheck lands while the sign-in probe is in flight.
      await Future.wait([
        signIn(service, server, 'server-a'),
        service.recheckNow(),
      ]);
      await until(() async => await localSynced('m'));

      expect(probes, 1);
      expect(server.stopReports, hasLength(1));
      expect(server.ticks('m'), 40 * _min);
      expect(await localTicks('m'), 40 * _min);
      expect(await localSynced('m'), isTrue);
    });

    test('the network coming back while the app is open still syncs', () async {
      final server = _FakeServer(pingUrl());
      await download('m', ticksAtDownload: 10 * _min);
      server.set('m', ticks: 10 * _min);
      final flips = StreamController<List<ConnectivityResult>>();
      addTearDown(flips.close);
      when(() => connectivity.onConnectivityChanged)
          .thenAnswer((_) => flips.stream);

      final service = startService();
      await signIn(service, server, 'server-a');
      await Future<void>.delayed(const Duration(milliseconds: 100));

      flips.add([ConnectivityResult.none]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(service.canReachServer, isFalse);
      await repo.updatePlaybackPosition('m', 40 * _min);
      flips.add([ConnectivityResult.wifi]);
      await until(() async => await localSynced('m'));

      expect(server.ticks('m'), 40 * _min);
      expect(await localTicks('m'), 40 * _min);
      expect(await localSynced('m'), isTrue);
    });

    test('sign-ins asking together run the chain once', () async {
      final server = _FakeServer(pingUrl());
      await watchedOffline(
        'm',
        server,
        serverTicks: 10 * _min,
        ticks: 40 * _min,
      );
      final service = startService();
      await Future<void>.delayed(const Duration(milliseconds: 100));

      GetIt.instance.registerSingleton<MediaServerClient>(server.client);
      await Future.wait([
        service.onServerClientReady('server-a'),
        service.onServerClientReady('server-a'),
      ]);
      await until(() => server.itemFetches.isNotEmpty);
      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(server.stopReports, hasLength(1));
      expect(server.itemFetches, ['m']);
    });

    test(
      'switching server mid-sync syncs each server with its own rows',
      () async {
        final serverA = _FakeServer(pingUrl());
        final serverB = _FakeServer(pingUrl());
        await watchedOffline(
          'a-movie',
          serverA,
          serverTicks: 10 * _min,
          ticks: 40 * _min,
        );
        await watchedOffline(
          'b-movie',
          serverB,
          serverId: 'server-b',
          serverTicks: 5 * _min,
          ticks: 30 * _min,
        );
        serverA.gate = Completer<void>();
        final service = startService();
        await Future<void>.delayed(const Duration(milliseconds: 100));

        await signIn(service, serverA, 'server-a');
        // Server A's chain is now held in its user-data fetch.
        await signIn(service, serverB, 'server-b');
        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(serverB.stopReports, isEmpty);

        serverA.gate!.complete();
        await until(() async => await localSynced('b-movie'));

        expect(serverA.stopReports.map((r) => r['ItemId']), ['a-movie']);
        expect(serverB.stopReports.map((r) => r['ItemId']), ['b-movie']);
        expect(serverA.ticks('a-movie'), 40 * _min);
        expect(serverB.ticks('b-movie'), 30 * _min);
      },
    );

    test(
      'a headless Android engine parks the sync until the app is opened',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        final server = _FakeServer(pingUrl());
        await watchedOffline(
          'm',
          server,
          serverTicks: 10 * _min,
          ticks: 40 * _min,
        );
        final service = startService();
        await Future<void>.delayed(const Duration(milliseconds: 100));

        await signIn(service, server, 'server-a');
        await Future<void>.delayed(const Duration(milliseconds: 200));
        expect(server.stopReports, isEmpty);

        // app.dart forwards the first resumed event to the service.
        TestWidgetsFlutterBinding.instance.handleAppLifecycleStateChanged(
          AppLifecycleState.resumed,
        );
        service.onAppResumed();
        await until(() async => await localSynced('m'));

        expect(server.ticks('m'), 40 * _min);
        expect(await localSynced('m'), isTrue);
      },
    );
  });
}
