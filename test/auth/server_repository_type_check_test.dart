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

void main() {
  // These tests talk to a real local server, so they skip
  // TestWidgetsFlutterBinding.
  late HttpServer http;
  late Map<String, Object> routes;
  late _AuthStore store;
  final factory = MediaServerClientFactory(
    deviceInfo: const DeviceInfo(
      id: 'device',
      name: 'Device',
      appName: 'Moonfin',
      appVersion: '1.0.0',
    ),
  );

  setUp(() async {
    store = _AuthStore();
    routes = {};
    http = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    http.listen((request) async {
      final body = routes[request.uri.path];
      if (body == null) {
        request.response.statusCode = HttpStatus.notFound;
      } else {
        request.response
          ..headers.contentType = ContentType.json
          ..write(jsonEncode(body));
      }
      await request.response.close();
    });
  });

  tearDown(() => http.close(force: true));

  Server saved(ServerType type, {String? address}) => Server(
    id: 'server-1',
    name: 'Media',
    address: address ?? 'http://127.0.0.1:${http.port}',
    version: '4.10.2.0',
    serverType: type,
    dateAdded: DateTime(2026),
  );

  // Emby 4.10 sends no ProductName, only a four-part version.
  const embyInfo = {'ServerName': 'Media', 'Version': '4.10.2.0', 'Id': 'abc'};

  test('an Emby server saved as Jellyfin is corrected and saved', () async {
    routes = {'/System/Info/Public': embyInfo};

    final checked = await ServerRepository(
      store,
      factory,
    ).withCheckedType(saved(ServerType.jellyfin));

    expect(checked.serverType, ServerType.emby);
    expect(store.saved.single.serverType, ServerType.emby);
  });

  test('a type found at an address the server left is not applied', () async {
    routes = {'/System/Info/Public': embyInfo};
    final repo = ServerRepository(store, factory);
    await repo.saveServer(saved(ServerType.jellyfin));
    store.saved.clear();

    final checking = repo.withCheckedType(repo.getServer('server-1')!);
    // Its entry address led somewhere new meanwhile.
    await repo.updateServer(
      repo.getServer('server-1')!.copyWith(address: 'http://127.0.0.1:2'),
    );
    final checked = await checking;

    // What answered was the old address, not the server where it is now.
    expect(checked.serverType, ServerType.jellyfin);
    expect(checked.address, 'http://127.0.0.1:2');
    expect(store.saved.last.address, 'http://127.0.0.1:2');
    expect(repo.getServer('server-1')!.serverType, ServerType.jellyfin);
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:2');
  });

  test('a server saved with the right type is left alone', () async {
    routes = {'/System/Info/Public': embyInfo};

    final checked = await ServerRepository(
      store,
      factory,
    ).withCheckedType(saved(ServerType.emby));

    expect(checked.serverType, ServerType.emby);
    expect(store.saved, isEmpty);
  });

  test('a server that does not answer keeps its saved type', () async {
    final unreachable = saved(
      ServerType.jellyfin,
      address: 'http://127.0.0.1:1',
    );

    final checked = await ServerRepository(
      store,
      factory,
    ).withCheckedType(unreachable);

    expect(checked.serverType, ServerType.jellyfin);
    expect(store.saved, isEmpty);
  });

  test('the factory swaps a cached client of the wrong type', () {
    final jellyfin = factory.getClient(
      serverId: 'swap',
      serverType: ServerType.jellyfin,
      baseUrl: 'http://127.0.0.1:1',
    );
    final emby = factory.getClient(
      serverId: 'swap',
      serverType: ServerType.emby,
      baseUrl: 'http://127.0.0.1:1',
    );

    expect(jellyfin.serverType, ServerType.jellyfin);
    expect(emby.serverType, ServerType.emby);
    factory.removeClient('swap');
  });
}
