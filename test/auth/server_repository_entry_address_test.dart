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

  @override
  Future<void> putServer(Server server) async => saved.add(server);
}

class _ClientFactory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String serverId) => null;
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

  test('the entry address survives a save and load', () {
    final server = saved();
    final restored = Server.fromJson(server.id, server.toJson());

    expect(restored.entryAddress, entryUrl());
    expect(restored.entryServerId, 'abc');
    expect(restored.copyWith(address: targetUrl()).entryAddress, entryUrl());
  });
}
