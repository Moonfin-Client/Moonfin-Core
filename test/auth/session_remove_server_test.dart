import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/preference/preference_constants.dart';

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

  @override
  Future<void> removeUser(String serverId, String userId) async {
    users[serverId]?.removeWhere((u) => u.id == userId);
  }
}

class _Prefs extends Fake implements AuthenticationPreferences {
  @override
  UserSelectBehavior get loginBehavior => UserSelectBehavior.lastUser;

  @override
  Future<void> setLastServerId(String id) async {}

  @override
  Future<void> setLastUserId(String id) async {}

  @override
  Future<void> clearAutoLogin() async {}
}

class _Credentials extends Fake implements CredentialStore {
  @override
  Future<void> deleteToken(String serverId) async {}
}

class _Socket extends Fake implements SocketHandler {
  @override
  void disconnect() {}
}

class _Users extends Fake implements UserRepository {
  @override
  void setCurrentUser(User? user) {}
}

class _PluginSync extends Fake implements PluginSyncService {
  @override
  void resetState({
    bool notify = true,
    bool stopStream = true,
    bool keepIncompleteRecordings = false,
  }) {}
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
  late ServerRepository servers;
  late SessionRepository repo;
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
    servers = ServerRepository(store, factory);
    repo = SessionRepository(
      store,
      _Prefs(),
      _Credentials(),
      factory,
      _Socket(),
      servers,
      _Users(),
      _PluginSync(),
    );
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

  // The logouts run in the background after removeServer returns.
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
    await servers.loadStoredServers();

    await repo.removeServer('s1');
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
      await servers.loadStoredServers();

      await repo.removeServer('j1');
      await waitForRequests(2);
      // Give a third (wrong) request time to show up.
      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(requests.map((r) => r.$1), [
        'POST /Sessions/Logout',
        'POST /Sessions/Logout',
      ]);
      for (final token in ['token-1', 'token-2']) {
        expect(
          requests.where((r) => r.$2.contains(token)),
          hasLength(1),
          reason: token,
        );
      }
    });
  }

  test('a token another saved server holds is not ended', () async {
    store.servers
      ..add(_server('j1', ServerType.jellyfin, address))
      ..add(_server('j2', ServerType.jellyfin, 'http://other.invalid'));
    store.users['j1'] = [
      _user('j1', 'u1', 'shared'),
      _user('j1', 'u2', 'own'),
    ];
    store.users['j2'] = [_user('j2', 'u1', 'shared')];
    await servers.loadStoredServers();

    await repo.removeServer('j1');
    await waitForRequests(1);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(requests, hasLength(1));
    expect(requests.single.$2, contains('own'));
  });

  group('the signed-in server', () {
    Future<void> signIn(String serverId, String userId, String token) async {
      final server = servers.getServer(serverId)!;
      factory
              .getClient(
                serverId: serverId,
                serverType: server.serverType,
                baseUrl: server.address,
              )
              .accessToken =
          token;
      repo.setActiveSessionForTest(serverId, userId);
    }

    test('its login is ended when no other server holds it', () async {
      store.servers.add(_server('j1', ServerType.jellyfin, address));
      store.users['j1'] = [_user('j1', 'u1', 'own')];
      await servers.loadStoredServers();
      await signIn('j1', 'u1', 'own');

      await repo.removeServer('j1');
      await waitForRequests(1);
      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(repo.activeServerId, isNull);
      expect(requests, hasLength(1));
      expect(requests.single.$2, contains('own'));
    });

    test('a login another saved server holds is not ended', () async {
      store.servers
        ..add(_server('j1', ServerType.jellyfin, address))
        ..add(_server('j2', ServerType.jellyfin, 'http://other.invalid'));
      store.users['j1'] = [_user('j1', 'u1', 'shared')];
      store.users['j2'] = [_user('j2', 'u1', 'shared')];
      await servers.loadStoredServers();
      await signIn('j1', 'u1', 'shared');

      await repo.removeServer('j1');
      await Future<void>.delayed(const Duration(milliseconds: 200));

      expect(repo.activeServerId, isNull);
      expect(requests, isEmpty);
      expect(store.users['j2'], hasLength(1));
    });
  });

  test('a server that never answers does not hold the removal', () async {
    // Accepts the connection and never replies.
    final silent = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    final held = <Socket>[];
    silent.listen(held.add);
    addTearDown(() async {
      for (final s in held) {
        s.destroy();
      }
      await silent.close();
    });
    store.servers.add(
      _server('s1', ServerType.silo, 'http://127.0.0.1:${silent.port}'),
    );
    store.siloTokens['s1'] = {'a1': _pair('access-1', 'refresh-1')};
    await servers.loadStoredServers();

    final watch = Stopwatch()..start();
    await repo.removeServer('s1');

    expect(watch.elapsed, lessThan(const Duration(seconds: 1)));
    expect(store.servers, isEmpty);
  });

  test('a server that refuses the connection leaves the removal done', () async {
    await http.close(force: true);
    store.servers.add(_server('s1', ServerType.silo, address));
    store.siloTokens['s1'] = {'a1': _pair('access-1', 'refresh-1')};
    await servers.loadStoredServers();

    await repo.removeServer('s1');

    expect(store.servers, isEmpty);
    expect(servers.servers, isEmpty);
  });
}
