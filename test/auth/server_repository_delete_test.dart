import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  final servers = <Server>[];
  final users = <String, List<PrivateUser>>{};
  final siloTokens = <String, Map<String, Map<String, dynamic>>>{};

  @override
  List<Server> getServers() => List.of(servers);

  @override
  Future<void> putServer(Server server) async {}

  @override
  Future<void> removeServer(String serverId) async {
    servers.removeWhere((s) => s.id == serverId);
    users.remove(serverId);
    siloTokens.remove(serverId);
  }

  @override
  List<PrivateUser> getUsers(String serverId) => users[serverId] ?? const [];

  @override
  List<String> getSiloAccountIds(String serverId) =>
      siloTokens[serverId]?.keys.toList() ?? const [];

  @override
  Map<String, dynamic>? getSiloTokens(String serverId, String accountId) =>
      siloTokens[serverId]?[accountId];
}

Server _server(String id, ServerType type, String address) => Server(
  id: id,
  name: id,
  address: address,
  version: '1.0.0',
  serverType: type,
  dateAdded: DateTime(2026),
  dateLastAccessed: DateTime(2026),
);

PrivateUser _user(String serverId, String id, String token) => PrivateUser(
  id: id,
  name: id,
  serverId: serverId,
  accessToken: token,
  lastUsed: DateTime(2026),
);

Map<String, dynamic> _pair(String access, String refresh) => {
  'accessToken': access,
  'refreshToken': refresh,
  'expiresAt': DateTime.now()
      .toUtc()
      .add(const Duration(hours: 1))
      .toIso8601String(),
  'lifetimeSeconds': 3600,
};

void main() {
  late HttpServer http;
  late List<(String, String)> requests;
  late _AuthStore store;
  late ServerRepository repo;
  late String address;
  final factory = MediaServerClientFactory(
    deviceInfo: const DeviceInfo(
      id: 'device',
      name: 'Device',
      appName: 'Moonfin',
      appVersion: '1.0.0',
    ),
  );

  setUp(() async {
    requests = [];
    store = _AuthStore();
    repo = ServerRepository(store, factory);
    http = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    address = 'http://127.0.0.1:${http.port}';
    http.listen((request) async {
      final auth = [
        request.headers.value('authorization'),
        request.headers.value('x-emby-token'),
      ].whereType<String>().join(' ');
      requests.add(('${request.method} ${request.uri.path}', auth));
      request.response.statusCode = HttpStatus.noContent;
      await request.response.close();
    });
  });

  tearDown(() => http.close(force: true));

  // The logouts run in the background after deleteServer returns.
  Future<void> waitForRequests(int count) async {
    final deadline = DateTime.now().add(const Duration(seconds: 5));
    while (requests.length < count && DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }
  }

  test('removing a Silo server ends each saved account login on Silo', () async {
    store.servers.add(_server('s1', ServerType.silo, address));
    store.siloTokens['s1'] = {
      'a1': _pair('access-1', 'refresh-1'),
      'a2': _pair('access-2', 'refresh-2'),
    };
    await repo.loadStoredServers();

    await repo.deleteServer('s1');
    await waitForRequests(2);

    expect(store.servers, isEmpty);
    expect(requests.map((r) => r.$1), [
      'POST /api/v2/auth/logout',
      'POST /api/v2/auth/logout',
    ]);
    expect(
      requests.map((r) => r.$2.contains('access-1')).where((x) => x),
      hasLength(1),
    );
    expect(
      requests.map((r) => r.$2.contains('access-2')).where((x) => x),
      hasLength(1),
    );
  });

  for (final type in [ServerType.jellyfin, ServerType.emby]) {
    test('removing a ${type.name} server signs out each saved user', () async {
      store.servers.add(_server('j1', type, address));
      store.users['j1'] = [
        _user('j1', 'u1', 'token-1'),
        _user('j1', 'u2', 'token-2'),
        _user('j1', 'u3', ''),
      ];
      await repo.loadStoredServers();

      await repo.deleteServer('j1');
      await waitForRequests(2);
      // Give a third (wrong) request time to show up.
      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(requests.map((r) => r.$1), [
        'POST /Sessions/Logout',
        'POST /Sessions/Logout',
      ]);
      expect(
        {for (final r in requests) r.$2.contains('token-1') ? 1 : 2},
        {1, 2},
      );
    });
  }

  test('a server that does not answer leaves the removal done', () async {
    await http.close(force: true);
    store.servers.add(_server('s1', ServerType.silo, address));
    store.siloTokens['s1'] = {'a1': _pair('access-1', 'refresh-1')};
    await repo.loadStoredServers();

    await repo.deleteServer('s1');

    expect(store.servers, isEmpty);
    expect(repo.servers, isEmpty);
  });
}
