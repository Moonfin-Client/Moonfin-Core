// Entry redirect (portnook fork): tests for entry_redirect_connectivity.dart.
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/entry_redirect/entry_redirect.dart';
import 'package:moonfin/entry_redirect/entry_redirect_connectivity.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';

class _MockConnectivity extends Mock implements Connectivity {}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _MockSystemApi extends Mock implements SystemApi {}

/// A client whose pings wait until the test answers them.
class _HeldClient {
  _HeldClient(this.url) {
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenAnswer((_) => url);
    when(() => client.systemApi).thenReturn(api);
    when(() => api.ping()).thenAnswer((_) {
      pings++;
      final answer = Completer<bool>();
      held.add(answer);
      return answer.future;
    });
  }

  final client = _MockMediaServerClient();
  final api = _MockSystemApi();
  final held = <Completer<bool>>[];
  String url;
  var pings = 0;

  Future<void> answerAll(bool reachable) async {
    for (var i = 0; i < 5; i++) {
      final waiting = List.of(held);
      held.clear();
      for (final c in waiting) {
        c.complete(reachable);
      }
      await Future<void>.delayed(Duration.zero);
    }
  }

  void register() {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<MediaServerClient>()) {
      getIt.unregister<MediaServerClient>();
    }
    getIt.registerSingleton<MediaServerClient>(client);
  }
}

class _FakeRedirect extends Fake implements EntryRedirect {
  _FakeRedirect(this.onFollow);

  final Future<String?> Function(String serverId) onFollow;
  final asked = <String>[];
  final moves = StreamController<ServerMove>.broadcast();

  @override
  Stream<ServerMove> get serverMoved => moves.stream;

  @override
  Future<String?> followEntryAddressOf(String serverId) {
    asked.add(serverId);
    return onFollow(serverId);
  }
}

Server _server(String address) => Server(
  id: 'server-1',
  name: 'Media',
  address: address,
  version: '10.11.0',
  serverType: ServerType.jellyfin,
  dateAdded: DateTime(2026),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HttpServer server;
  late _MockConnectivity connectivity;
  // The saved target stopped answering, e.g. a VPN reconnect moved the
  // forwarded port while the app was open.
  late String currentBase;
  late String liveBase;

  setUp(() async {
    HttpOverrides.global = null;
    await GetIt.instance.reset();
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      await request.response.close();
    });
    liveBase = 'http://${server.address.address}:${server.port}';
    currentBase = 'http://127.0.0.1:1';
    final client = _MockMediaServerClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenAnswer((_) => currentBase);
    when(
      () => client.systemApi,
    ).thenAnswer((_) => EmbySystemApi(Dio(BaseOptions(baseUrl: currentBase))));
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    connectivity = _MockConnectivity();
    when(() => connectivity.onConnectivityChanged)
        .thenAnswer((_) => const Stream.empty());
    when(() => connectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);
  });

  tearDown(() async {
    await server.close(force: true);
    await GetIt.instance.reset();
  });

  (ConnectivityService, EntryRedirectConnectivity) started(
    _FakeRedirect redirect,
  ) {
    final service = ConnectivityService(
      connectivity: connectivity,
      retryBase: const Duration(milliseconds: 50),
    );
    final watcher = EntryRedirectConnectivity(
      service,
      redirect,
      followInterval: const Duration(milliseconds: 20),
      followBudget: const Duration(milliseconds: 300),
    )..start();
    addTearDown(() {
      watcher.stop();
      service.dispose();
    });
    return (service, watcher);
  }

  _MockPlaybackManager player({required bool reconnecting}) {
    final player = _MockPlaybackManager();
    when(() => player.state).thenReturn(PlayerState());
    when(() => player.isReconnecting).thenReturn(reconnecting);
    GetIt.instance.registerSingleton<PlaybackManager>(player);
    return player;
  }

  test('follows its entry address and is reachable again', () async {
    final redirect = _FakeRedirect((_) async {
      // The service hands the cached client the new address.
      currentBase = liveBase;
      return liveBase;
    });
    final (service, _) = started(redirect);
    await service.recheckNow();

    await service.onServerClientReady('server-1');

    expect(redirect.asked, contains('server-1'));
    expect(service.canReachServer, isTrue);
  });

  test('stays unreachable when the entry address leads nowhere new', () async {
    final redirect = _FakeRedirect((_) async => null);
    final (service, _) = started(redirect);
    await service.recheckNow();

    await service.onServerClientReady('server-1');

    expect(redirect.asked, contains('server-1'));
    expect(service.canReachServer, isFalse);
  });

  test('a lost stream follows the entry address at once', () async {
    final redirect = _FakeRedirect((_) async {
      currentBase = liveBase;
      return liveBase;
    });
    final (service, watcher) = started(redirect);
    // Reachable at sign-in: the old address still answered then.
    currentBase = liveBase;
    await service.onServerClientReady('server-1');
    expect(service.canReachServer, isTrue);
    redirect.asked.clear();
    // The port changed while playing.
    currentBase = 'http://127.0.0.1:1';

    await watcher.onStreamConnectionLost();

    expect(redirect.asked.first, 'server-1');
    expect(service.canReachServer, isTrue);
  });

  test('keeps following while the player reconnects until it moves', () async {
    var calls = 0;
    final redirect = _FakeRedirect((_) async {
      // The redirect catches up on the third ask.
      if (++calls < 3) return null;
      currentBase = liveBase;
      return liveBase;
    });
    player(reconnecting: true);
    final (service, watcher) = started(redirect);
    currentBase = liveBase;
    await service.onServerClientReady('server-1');
    redirect.asked.clear();
    calls = 0;
    currentBase = 'http://127.0.0.1:1';

    await watcher.onStreamConnectionLost();

    expect(calls, greaterThanOrEqualTo(3));
    expect(service.canReachServer, isTrue);
  });

  test('stops following when the stream dropped but nothing moved', () async {
    final redirect = _FakeRedirect((_) async => null);
    player(reconnecting: false);
    final (service, watcher) = started(redirect);
    currentBase = liveBase;
    await service.onServerClientReady('server-1');
    redirect.asked.clear();

    // A brief drop: the server still answers at its address.
    await watcher.onStreamConnectionLost();

    expect(redirect.asked, ['server-1']);
    expect(service.canReachServer, isTrue);
  });

  test('keeps following a server that is down until the budget ends', () async {
    final redirect = _FakeRedirect((_) async => null);
    player(reconnecting: false);
    final (service, watcher) = started(redirect);
    currentBase = liveBase;
    await service.onServerClientReady('server-1');
    redirect.asked.clear();
    currentBase = 'http://127.0.0.1:1';

    await watcher.onStreamConnectionLost();

    expect(redirect.asked.length, greaterThan(1));
    expect(service.canReachServer, isFalse);
  });

  test('a move found anywhere reaches the open stream', () async {
    final redirect = _FakeRedirect((_) async => null);
    final service = ConnectivityService(connectivity: connectivity);
    final streamMoves = <String>[];
    final watcher = EntryRedirectConnectivity(
      service,
      redirect,
      moveStream: (from, to) async => streamMoves.add('$from -> $to'),
    )..start();
    addTearDown(() {
      watcher.stop();
      service.dispose();
    });
    currentBase = liveBase;
    await service.onServerClientReady('server-1');

    redirect.moves.add(
      ServerMove(from: 'http://127.0.0.1:1', server: _server(liveBase)),
    );
    // A move of another server isn't the open stream's.
    redirect.moves.add(
      ServerMove(
        from: 'http://127.0.0.1:5',
        server: Server(
          id: 'server-2',
          name: 'Other',
          address: 'http://127.0.0.1:6',
          version: '10.11.0',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
        ),
      ),
    );
    await Future<void>.delayed(Duration.zero);
    await watcher.lastMoveCheck;

    expect(streamMoves, ['http://127.0.0.1:1 -> $liveBase']);
  });

  // A check for server A still waiting on its pings when the user switches
  // to B must not ask B's entry address for A's client, whose token would
  // then go to B.
  test(
    'a check overtaken by a server switch stays with its own server',
    () async {
      final redirect = _FakeRedirect((_) async => null);
      final a = _HeldClient('http://127.0.0.1:1')..register();
      final (service, _) = started(redirect);

      final checkA = service.onServerClientReady('server-a');
      await Future<void>.delayed(Duration.zero);
      expect(a.pings, 1);

      final b = _HeldClient('http://127.0.0.1:2')..register();
      final checkB = service.onServerClientReady('server-b');
      await a.answerAll(false);
      await b.answerAll(true);
      await Future.wait([checkA, checkB]);

      expect(redirect.asked, isNot(contains('server-b')));
    },
  );

  test('a stopped watcher follows nothing', () async {
    final redirect = _FakeRedirect((_) async => liveBase);
    player(reconnecting: true);
    final (service, watcher) = started(redirect);
    watcher.stop();

    await service.recheckNow();
    await watcher.onStreamConnectionLost();

    expect(redirect.asked, isEmpty);
    expect(service.onServerUnreachable, isNull);
  });
}
