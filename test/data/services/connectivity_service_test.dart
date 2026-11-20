import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_silo/server_silo.dart';

class _MockConnectivity extends Mock implements Connectivity {}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _MockSystemApi extends Mock implements SystemApi {}

/// A client whose pings wait until the test answers them, at an address the
/// test can move.
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

  /// Answers every ping still waiting, and those sent once they are.
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

class _FakeServerRepository extends Fake implements ServerRepository {
  _FakeServerRepository(this.onFollow);

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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HttpServer server;
  late _MockConnectivity connectivity;
  var failuresLeft = 0;
  var probes = 0;
  var answer = HttpStatus.ok;

  // A ping body labelled json. Empty means no body, as in every other case.
  var pingBody = '';

  var paths = <String>[];

  setUp(() async {
    // The test binding answers every request with a 400, and the probe has to
    // reach the server on the loopback for these to mean anything.
    HttpOverrides.global = null;
    await GetIt.instance.reset();
    failuresLeft = 0;
    probes = 0;
    answer = HttpStatus.ok;
    pingBody = '';
    paths = [];
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      probes++;
      paths.add(request.uri.path);
      request.response.statusCode = failuresLeft > 0
          ? HttpStatus.serviceUnavailable
          : answer;
      if (failuresLeft > 0) failuresLeft--;
      if (pingBody.isNotEmpty) {
        request.response.headers.contentType = ContentType.json;
        request.response.write(pingBody);
      }
      await request.response.close();
    });

    // The probe asks the client's own ping. Emby's is the one that meets a
    // 401 from a remote server and a plain text body.
    final baseUrl = 'http://${server.address.address}:${server.port}';
    final client = _MockMediaServerClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn(baseUrl);
    when(() => client.systemApi)
        .thenReturn(EmbySystemApi(Dio(BaseOptions(baseUrl: baseUrl))));
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    connectivity = _MockConnectivity();
    when(
      () => connectivity.onConnectivityChanged,
    ).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() async {
    await server.close(force: true);
    await GetIt.instance.reset();
  });

  ConnectivityService serviceOnline({required bool online}) {
    when(() => connectivity.checkConnectivity()).thenAnswer(
      (_) async => [online ? ConnectivityResult.wifi : ConnectivityResult.none],
    );
    return ConnectivityService(
      connectivity: connectivity,
      retryBase: const Duration(milliseconds: 50),
      entryFollowInterval: const Duration(milliseconds: 20),
      entryFollowBudget: const Duration(milliseconds: 300),
    );
  }

  // Nothing else re-asks while the verdict stands, so a lost probe has to be
  // retried on its own.
  test('keeps probing until the server answers', () async {
    failuresLeft = 2;
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await service.recheckNow();
    expect(service.canReachServer, isFalse);

    await Future<void>.delayed(const Duration(milliseconds: 400));
    expect(service.canReachServer, isTrue);
    expect(probes, 3);
  });

  // A pooled connection the server already dropped fails the same way a server
  // that went away does, and one of those used to send the whole app to the
  // downloads catalog.
  test('one lost probe does not send the app offline', () async {
    failuresLeft = 1;
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await service.recheckNow();

    expect(service.canReachServer, isTrue);
    expect(probes, 2);
  });

  // Startup, a network flip and the retry can all ask at once. Two probes would
  // each open a connection and each read the verdict from before either
  // answered, which reported the server unreachable twice over.
  test('overlapping probes share one request', () async {
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await Future.wait([
      service.recheckNow(),
      service.recheckNow(),
      service.recheckNow(),
    ]);

    expect(probes, 1);
    expect(service.canReachServer, isTrue);
  });

  test('a ping turned down for its missing token still counts', () async {
    answer = HttpStatus.unauthorized;
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await service.recheckNow();

    expect(service.canReachServer, isTrue);
    expect(probes, 1);
  });

  // A proxy can label Emby's plain text ping as json. Decoding it used to fail
  // the probe and send every browse call to the downloads catalog.
  test('a ping body that is not json still counts as reachable', () async {
    pingBody = 'Emby Server';
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await service.recheckNow();

    expect(service.canReachServer, isTrue);
    expect(probes, 1);
  });

  // Jellyfin always answers the ping, so a 404 is an address that isn't the
  // server anymore, and a 502 is a proxy with nothing behind it.
  test('any other refusal still counts as down', () async {
    for (final status in [HttpStatus.notFound, HttpStatus.badGateway]) {
      answer = status;
      final service = serviceOnline(online: true);

      await service.recheckNow();

      expect(service.canReachServer, isFalse, reason: '$status');
      service.dispose();
    }
  });

  test('asks the server type its own route', () async {
    final service = serviceOnline(online: true);
    addTearDown(service.dispose);

    await service.recheckNow();
    expect(paths, ['/System/Ping']);

    // Silo has no /System/Ping, so its public identity read stands in.
    final silo = SiloMediaServerClient(
      baseUrl: 'http://${server.address.address}:${server.port}',
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Test Mac',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );
    GetIt.instance
      ..unregister<MediaServerClient>()
      ..registerSingleton<MediaServerClient>(silo);
    paths.clear();

    await service.recheckNow();
    expect(paths, ['/api/v2/system/identity']);
    expect(service.canReachServer, isTrue);
  });

  test('leaves the server alone while the device itself is offline', () async {
    failuresLeft = 99;
    // On another machine, so losing the network cuts it off.
    when(() => GetIt.instance<MediaServerClient>().baseUrl)
        .thenReturn('http://192.168.1.20:8096');
    final service = serviceOnline(online: false);
    addTearDown(service.dispose);

    await service.recheckNow();
    expect(service.canReachServer, isFalse);

    await Future<void>.delayed(const Duration(milliseconds: 300));
    expect(probes, 0);
  });

  test('a server on this device is reached with every radio off', () async {
    final service = serviceOnline(online: false);
    addTearDown(service.dispose);

    await service.recheckNow();
    expect(service.canReachServer, isTrue);
    expect(probes, 1);
  });

  group('a server added through a redirect', () {
    // The saved target stopped answering, e.g. a VPN reconnect moved the
    // forwarded port while the app was open.
    late String currentBase;
    late String liveBase;

    setUp(() {
      liveBase = 'http://${server.address.address}:${server.port}';
      currentBase = 'http://127.0.0.1:1';
      final client = GetIt.instance<MediaServerClient>();
      when(() => client.systemApi).thenAnswer(
        (_) => EmbySystemApi(Dio(BaseOptions(baseUrl: currentBase))),
      );
    });

    test('follows its entry address and is reachable again', () async {
      final repo = _FakeServerRepository((_) async {
        // The repository hands the cached client the new address.
        currentBase = liveBase;
        return liveBase;
      });
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      await service.recheckNow();

      await service.onServerClientReady('server-1');

      expect(repo.asked, contains('server-1'));
      expect(service.canReachServer, isTrue);
    });

    test('a lost stream follows the entry address at once', () async {
      final repo = _FakeServerRepository((_) async {
        currentBase = liveBase;
        return liveBase;
      });
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      // Reachable at sign-in: the old address still answered then.
      currentBase = liveBase;
      await service.onServerClientReady('server-1');
      expect(service.canReachServer, isTrue);
      repo.asked.clear();
      // The port changed while playing.
      currentBase = 'http://127.0.0.1:1';
      final pingsBefore = probes;

      await service.onStreamConnectionLost();

      expect(repo.asked, ['server-1']);
      expect(service.canReachServer, isTrue);
      // The new address answered the first ping: no ping to the old one.
      expect(probes, pingsBefore + 1);
    });

    test('keeps following while the player reconnects until it moves',
        () async {
      var calls = 0;
      final repo = _FakeServerRepository((_) async {
        // The redirect catches up on the third ask.
        if (++calls < 3) return null;
        currentBase = liveBase;
        return liveBase;
      });
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final player = _MockPlaybackManager();
      when(() => player.state).thenReturn(PlayerState());
      when(() => player.isReconnecting).thenReturn(true);
      GetIt.instance.registerSingleton<PlaybackManager>(player);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      currentBase = liveBase;
      await service.onServerClientReady('server-1');
      repo.asked.clear();
      currentBase = 'http://127.0.0.1:1';

      await service.onStreamConnectionLost();

      expect(repo.asked, ['server-1', 'server-1', 'server-1']);
      expect(service.canReachServer, isTrue);
    });

    test('a move found after start reopens the open stream', () async {
      // Started before the repository exists, as the app does.
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      service.initialize();
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final player = _MockPlaybackManager();
      when(() => player.hasReconnectableStream).thenReturn(true);
      when(
        () => player.onServerMoved(
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer((_) async {});
      GetIt.instance.registerSingleton<PlaybackManager>(player);

      // Signing in to the server starts listening.
      await service.onServerClientReady('server-1');
      repo.moves.add(
        ServerMove(
          from: 'http://127.0.0.1:1',
          server: Server(
          id: 'server-1',
          name: 'Media',
          address: 'http://127.0.0.1:2',
          version: '10.11.0',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
          ),
        ),
      );
      await Future<void>.delayed(Duration.zero);

      verify(
        () => player.onServerMoved(
          from: 'http://127.0.0.1:1',
          to: 'http://127.0.0.1:2',
        ),
      ).called(1);
    });

    test('stops following when the stream dropped but nothing moved',
        () async {
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final player = _MockPlaybackManager();
      when(() => player.state).thenReturn(PlayerState());
      when(() => player.isReconnecting).thenReturn(false);
      GetIt.instance.registerSingleton<PlaybackManager>(player);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      currentBase = liveBase;
      await service.onServerClientReady('server-1');
      repo.asked.clear();

      // A brief drop: the server still answers at its address.
      await service.onStreamConnectionLost();

      expect(repo.asked, ['server-1']);
      expect(service.canReachServer, isTrue);
    });

    test('keeps following a server that is down until the budget ends',
        () async {
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final player = _MockPlaybackManager();
      when(() => player.state).thenReturn(PlayerState());
      // The player already gave up; the server still doesn't answer.
      when(() => player.isReconnecting).thenReturn(false);
      GetIt.instance.registerSingleton<PlaybackManager>(player);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      currentBase = liveBase;
      await service.onServerClientReady('server-1');
      repo.asked.clear();
      currentBase = 'http://127.0.0.1:1';

      await service.onStreamConnectionLost();

      // Asked again and again, not once and done (exact count depends on
      // timing).
      expect(repo.asked.length, greaterThan(1));
      expect(service.canReachServer, isFalse);
    });

    test('stays unreachable when the entry address leads nowhere new',
        () async {
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);
      await service.recheckNow();

      await service.onServerClientReady('server-1');

      expect(repo.asked, contains('server-1'));
      expect(service.canReachServer, isFalse);
    });

    // A check for server A still waiting on its pings when the user switches
    // to B must neither ask B's entry address for A's client (whose token
    // would then go to B) nor hand A's verdict to B.
    test('a check overtaken by a server switch stays with its own server',
        () async {
      final repo = _FakeServerRepository((_) async => 'http://127.0.0.1:9');
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final a = _HeldClient('http://127.0.0.1:1')..register();
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);

      final checkA = service.onServerClientReady('server-a');
      await Future<void>.delayed(Duration.zero);
      expect(a.pings, 1);

      final b = _HeldClient('http://127.0.0.1:2')..register();
      final checkB = service.onServerClientReady('server-b');
      await a.answerAll(false);
      await b.answerAll(true);
      await Future.wait([checkA, checkB]);

      expect(repo.asked, isNot(contains('server-b')));
      verifyNever(() => a.client.baseUrl = any());
      expect(b.pings, greaterThan(0));
      expect(service.canReachServer, isTrue);
    });

    // A failed request or the player found the move while the check's pings
    // to the old address were still out. Its verdict is about that old
    // address and must not mark the new one unreachable unasked.
    test('a move during a check asks the new address afresh', () async {
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final c = _HeldClient('http://127.0.0.1:1')..register();
      final service = serviceOnline(online: true);
      addTearDown(service.dispose);

      final check = service.onServerClientReady('server-1');
      await Future<void>.delayed(Duration.zero);
      c.held.removeAt(0).complete(false);
      await Future<void>.delayed(Duration.zero);
      expect(c.pings, 2);

      // The repository moved the cached client while the second ping was
      // out, and the new address answers.
      c.url = 'http://127.0.0.1:2';
      when(() => c.api.ping()).thenAnswer((_) async {
        c.pings++;
        return true;
      });
      repo.moves.add(
        ServerMove(
          from: 'http://127.0.0.1:1',
          server: Server(
            id: 'server-1',
            name: 'Media',
            address: 'http://127.0.0.1:2',
            version: '10.11.0',
            serverType: ServerType.jellyfin,
            dateAdded: DateTime(2026),
          ),
        ),
      );
      await Future<void>.delayed(Duration.zero);
      // It joined the running check, whose ping to the old address fails
      // only now.
      c.held.single.complete(false);
      await check;

      expect(service.canReachServer, isTrue);
    });

    test('a lost stream stops following once the service is disposed',
        () async {
      final repo = _FakeServerRepository((_) async => null);
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final player = _MockPlaybackManager();
      when(() => player.state).thenReturn(PlayerState());
      when(() => player.isReconnecting).thenReturn(true);
      GetIt.instance.registerSingleton<PlaybackManager>(player);
      final service = serviceOnline(online: true);
      currentBase = liveBase;
      await service.onServerClientReady('server-1');
      repo.asked.clear();
      currentBase = 'http://127.0.0.1:1';

      final following = service.onStreamConnectionLost();
      await Future<void>.delayed(const Duration(milliseconds: 50));
      service.dispose();
      final askedAtDispose = repo.asked.length;
      final pingsAtDispose = probes;
      await following;
      await Future<void>.delayed(const Duration(milliseconds: 400));

      expect(repo.asked.length, askedAtDispose);
      expect(probes, pingsAtDispose);
    });

    test('a check that ends after dispose schedules no retry', () async {
      final c = _HeldClient('http://127.0.0.1:1')..register();
      final service = serviceOnline(online: true);

      final check = service.recheckNow();
      await Future<void>.delayed(Duration.zero);
      service.dispose();
      await c.answerAll(false);
      await check;
      final pingsAtEnd = c.pings;
      await Future<void>.delayed(const Duration(milliseconds: 300));

      expect(c.pings, pingsAtEnd);
    });

    test('a check that ends after dispose asks no entry address', () async {
      final c = _HeldClient('http://127.0.0.1:1')..register();
      final repo = _FakeServerRepository((_) async => 'http://127.0.0.1:2');
      GetIt.instance.registerSingleton<ServerRepository>(repo);
      final service = serviceOnline(online: true);
      final online = service.recheckNow();
      await Future<void>.delayed(Duration.zero);
      await c.answerAll(true);
      await online;

      final check = service.onServerClientReady('server-1');
      await Future<void>.delayed(Duration.zero);
      service.dispose();
      await c.answerAll(false);
      await check;

      expect(repo.asked, isEmpty);
      verifyNever(() => c.client.baseUrl = any());
    });
  });
}
