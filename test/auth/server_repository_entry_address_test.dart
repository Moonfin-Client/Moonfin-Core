import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  final saved = <Server>[];
  final removed = <String>[];
  var failPuts = false;

  @override
  Future<void> putServer(Server server) async {
    if (failPuts) throw StateError('disk full');
    saved.add(server);
  }

  @override
  Future<void> removeServer(String serverId) async => removed.add(serverId);
}

class _ClientFactory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String serverId) => null;

  @override
  void removeClient(String serverId) {}
}

void main() {
  // These tests talk to real local servers, so they skip
  // TestWidgetsFlutterBinding.
  late HttpServer entry;
  late HttpServer target;
  late _AuthStore store;
  late ServerRepository repo;
  var targetId = 'abc';

  setUp(() async {
    store = _AuthStore();
    repo = ServerRepository(store, _ClientFactory());
    targetId = 'abc';
    target = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    target.listen((request) async {
      if (request.uri.path == '/System/Info/Public') {
        request.response
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode({
              'ServerName': 'Media',
              'Version': '10.11.0',
              'ProductName': 'Jellyfin Server',
              'Id': targetId,
            }),
          );
      } else {
        request.response.statusCode = HttpStatus.notFound;
      }
      await request.response.close();
    });
    // A stable name in front of a dynamic host:port, the way a reverse proxy
    // or redirect service answers.
    entry = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    entry.listen((request) async {
      request.response
        ..statusCode = HttpStatus.found
        ..headers.set(
          HttpHeaders.locationHeader,
          'http://127.0.0.1:${target.port}${request.uri.path}',
        );
      await request.response.close();
    });
  });

  tearDown(() async {
    await entry.close(force: true);
    await target.close(force: true);
  });

  String entryUrl() => 'http://127.0.0.1:${entry.port}';
  String targetUrl() => 'http://127.0.0.1:${target.port}';

  Server saved({String? entryAddress, String? entryServerId = 'abc'}) =>
      Server(
        id: 'server-1',
        name: 'Media',
        // A port nothing listens on any more: the redirect target moved.
        address: 'http://127.0.0.1:1',
        entryAddress: entryAddress ?? entryUrl(),
        entryServerId: entryServerId,
        version: '10.11.0',
        serverType: ServerType.jellyfin,
        dateAdded: DateTime(2026),
      );

  test('adding through a redirect keeps the entered address', () async {
    final server = await repo.addServer(entryUrl());

    expect(server, isNotNull);
    expect(server!.address, targetUrl());
    expect(server.entryAddress, entryUrl());
    expect(server.entryServerId, 'abc');
  });

  test('adding without a redirect saves no entry address', () async {
    final server = await repo.addServer(targetUrl());

    expect(server!.address, targetUrl());
    expect(server.entryAddress, isNull);
    expect(server.entryServerId, isNull);
  });

  test('a moved redirect target is followed and saved', () async {
    final followed = await repo.withFollowedEntryAddress(saved());

    expect(followed.address, targetUrl());
    expect(followed.entryAddress, entryUrl());
    expect(store.saved.single.address, targetUrl());
  });

  test('a saved server that moved reports its new address', () async {
    await repo.saveServer(saved());

    expect(await repo.followEntryAddressOf('server-1'), targetUrl());
    expect(repo.getServer('server-1')!.address, targetUrl());
    // Asked again, nothing moved any more.
    expect(await repo.followEntryAddressOf('server-1'), isNull);
  });

  test('a request that failed to connect gets the new address', () async {
    await repo.saveServer(saved());
    final moves = <ServerMove>[];
    final sub = repo.serverMoved.listen(moves.add);

    // Requests failing together share one ask.
    final asks = await Future.wait([
      repo.followMovedAddress('http://127.0.0.1:1/'),
      repo.followMovedAddress('http://127.0.0.1:1'),
    ]);

    expect(asks, [targetUrl(), targetUrl()]);
    expect(repo.getServer('server-1')!.address, targetUrl());
    await Future<void>.delayed(Duration.zero);
    expect(moves.single.server.address, targetUrl());
    expect(moves.single.from, 'http://127.0.0.1:1');
    await sub.cancel();
  });

  test('a request that fails after the move still gets the new address',
      () async {
    await repo.saveServer(saved());
    expect(await repo.followMovedAddress('http://127.0.0.1:1'), targetUrl());

    // A request that started on the old address before the move and failed
    // after it: no saved server uses that address any more.
    expect(await repo.followMovedAddress('http://127.0.0.1:1/'), targetUrl());
    expect(await repo.followMovedAddress('http://127.0.0.1:2'), isNull);
  });

  test('an old address another saved server uses now is not redirected',
      () async {
    await repo.saveServer(saved());
    expect(await repo.followMovedAddress('http://127.0.0.1:1'), targetUrl());
    await repo.saveServer(
      Server(
        id: 'server-2',
        name: 'Other',
        address: 'http://127.0.0.1:1',
        version: '10.11.0',
        serverType: ServerType.jellyfin,
        dateAdded: DateTime(2026),
      ),
    );

    // Its failed request, token and all, stays with it.
    expect(await repo.followMovedAddress('http://127.0.0.1:1/'), isNull);
  });

  test('a server removed while its entry address is asked stays removed',
      () async {
    await repo.saveServer(saved());
    store.saved.clear();

    final asking = repo.withFollowedEntryAddress(repo.getServer('server-1')!);
    await repo.deleteServer('server-1');
    await asking;

    expect(repo.getServer('server-1'), isNull);
    expect(store.saved, isEmpty);
    expect(store.removed, ['server-1']);
  });

  test('an answer for an address the server already left is dropped',
      () async {
    await repo.saveServer(saved());
    store.saved.clear();

    final asking = repo.withFollowedEntryAddress(repo.getServer('server-1')!);
    // Meanwhile something else moved it.
    await repo.updateServer(
      repo.getServer('server-1')!.copyWith(address: 'http://127.0.0.1:3'),
    );
    final followed = await asking;

    expect(followed.address, 'http://127.0.0.1:3');
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:3');
    expect(store.saved.single.address, 'http://127.0.0.1:3');
  });

  test('a move that could not be saved leaves the list as it was', () async {
    await repo.saveServer(saved());
    store.failPuts = true;

    expect(await repo.followEntryAddressOf('server-1'), isNull);
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:1');
  });

  test('adding a server at its target directly drops its entry address',
      () async {
    await repo.saveServer(saved().copyWith(address: targetUrl()));

    final server = await repo.addServer(targetUrl());

    expect(server!.id, 'server-1');
    expect(server.entryAddress, isNull);
    expect(server.entryServerId, isNull);
    expect(repo.getServer('server-1')!.entryAddress, isNull);
  });

  test('adding it through the redirect again keeps its entry address',
      () async {
    await repo.saveServer(saved().copyWith(address: targetUrl()));

    final server = await repo.addServer(entryUrl());

    expect(server!.entryAddress, entryUrl());
    expect(server.entryServerId, 'abc');
  });

  test('only a server added through a redirect can move', () async {
    await repo.saveServer(saved());

    expect(repo.canMove('http://127.0.0.1:1/'), isTrue);
    expect(repo.canMove('http://127.0.0.1:2'), isFalse);
  });

  test('an address no saved server uses is not asked about', () async {
    await repo.saveServer(saved());

    expect(await repo.followMovedAddress('http://127.0.0.1:2'), isNull);
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:1');
  });

  test('opening the server list follows every entry address', () async {
    await repo.saveServer(saved());

    await repo.followAllEntryAddresses();

    expect(repo.getServer('server-1')!.address, targetUrl());
  });

  test('a redirect to a different server is not followed', () async {
    targetId = 'other';

    final followed = await repo.withFollowedEntryAddress(saved());

    expect(followed.address, 'http://127.0.0.1:1');
    expect(store.saved, isEmpty);
  });

  test('a server without an entry address is left alone', () async {
    final server = Server(
      id: 'server-1',
      name: 'Media',
      address: 'http://127.0.0.1:1',
      version: '10.11.0',
      serverType: ServerType.jellyfin,
      dateAdded: DateTime(2026),
    );

    final followed = await repo.withFollowedEntryAddress(server);

    expect(followed, same(server));
    expect(store.saved, isEmpty);
  });

  group('what counts as a redirect', () {
    bool redirect(String from, String to) =>
        ServerRepository.isRedirectToOtherOrigin(from, to);

    test('another port or host does', () {
      expect(redirect('https://name.example', 'https://1.2.3.4:51234'), isTrue);
      expect(redirect('http://a.example', 'http://b.example'), isTrue);
    });

    test('an HTTPS upgrade on the same host and default ports does not', () {
      expect(
        redirect('http://media.example.com', 'https://media.example.com'),
        isFalse,
      );
      expect(
        redirect('http://Media.example.com:80', 'https://media.example.com/'),
        isFalse,
      );
    });

    test('an HTTPS upgrade that changes the port or host still does', () {
      expect(
        redirect('http://media.example.com', 'https://media.example.com:8920'),
        isTrue,
      );
      expect(
        redirect('http://media.example.com', 'https://other.example.com'),
        isTrue,
      );
    });

    test('a path the probe added does not', () {
      expect(redirect('http://emby.local:8096', 'http://emby.local:8096/emby'),
          isFalse);
    });
  });

  test('the entry address survives a save and load', () {
    final server = saved();
    final restored = Server.fromJson(server.id, server.toJson());

    expect(restored.entryAddress, entryUrl());
    expect(restored.entryServerId, 'abc');
    expect(restored.copyWith(address: targetUrl()).entryAddress, entryUrl());
  });
}
