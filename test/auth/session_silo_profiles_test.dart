import 'package:flutter_test/flutter_test.dart';
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
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Household profiles in the session repository: a locked profile isn't
// switched to without its PIN, and signing out of a profile keeps the
// account's login for its other profiles.

class _AuthApi extends Fake implements AuthApi {
  int logouts = 0;

  @override
  Future<void> logout() async => logouts++;
}

class _Client extends Fake implements MediaServerClient {
  final authApiFake = _AuthApi();

  @override
  AuthApi get authApi => authApiFake;
}

class _Factory extends Fake implements MediaServerClientFactory {
  final client = _Client();
  int created = 0;

  @override
  MediaServerClient getClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) {
    created++;
    return client;
  }

  @override
  MediaServerClient? getClientIfExists(String serverId) => client;

  @override
  void removeClient(String serverId) {}
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
  Future<String?> getToken(String serverId) async => null;

  @override
  Future<void> deleteToken(String serverId) async {}
}

class _Socket extends Fake implements SocketHandler {
  @override
  void disconnect() {}
}

class _Servers extends Fake implements ServerRepository {
  _Servers(this.server);

  final Server server;

  @override
  Server? getServer(String id) => server;
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

final _server = Server(
  id: 's1',
  name: 'Silo',
  address: 'https://silo.example',
  version: 'bd9d59ea',
  serverType: ServerType.silo,
  dateAdded: DateTime.utc(2026, 10, 19),
);

PrivateUser _profile(String id, {String account = '9', bool pin = false}) =>
    PrivateUser(
      id: id,
      name: id,
      serverId: 's1',
      accessToken: 'access-1',
      lastUsed: DateTime.utc(2026, 10, 19),
      siloAccountId: account,
      siloHasPin: pin,
    );

const _pair = {
  'access_token': 'access-1',
  'refresh_token': 'refresh-1',
  'expires_at': '2026-10-19T13:00:00.000Z',
  'lifetime_seconds': 3600,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthenticationStore store;
  late _Factory factory;
  late SessionRepository repo;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = AuthenticationStore();
    await store.init();
    factory = _Factory();
    repo = SessionRepository(
      store,
      _Prefs(),
      _Credentials(),
      factory,
      _Socket(),
      _Servers(_server),
      _Users(),
      _PluginSync(),
    );
    await store.putSiloTokens('s1', '9', _pair);
  });

  test('a locked profile without its PIN is not switched to', () async {
    await store.putUser(_profile('teen', pin: true));

    final ok = await repo.switchCurrentSession(serverId: 's1', userId: 'teen');

    expect(ok, isFalse);
    expect(factory.created, 0, reason: 'nothing acted as the profile');
    expect(repo.activeUserId, isNull);
  });

  group('signing out', () {
    test('one profile: it stays listed with its siblings, and the login '
        'stays', () async {
      await store.putUser(_profile('brady'));
      await store.putUser(_profile('kid'));
      repo.setActiveSessionForTest('s1', 'brady');
      expect(repo.activeUserHasSiloSiblings, isTrue);

      await repo.destroyCurrentSession();

      expect(factory.client.authApiFake.logouts, 0);
      expect(store.getUsers('s1').map((u) => u.id), ['brady', 'kid']);
      expect(store.getSiloTokens('s1', '9'), isNotNull);
    });

    test('the last profile ends the login', () async {
      await store.putUser(_profile('brady'));
      repo.setActiveSessionForTest('s1', 'brady');
      expect(repo.activeUserHasSiloSiblings, isFalse);

      await repo.destroyCurrentSession();

      expect(factory.client.authApiFake.logouts, 1);
      expect(store.getUsers('s1'), isEmpty);
      expect(store.getSiloTokens('s1', '9'), isNull);
    });

    test('the account: every profile goes and the login ends', () async {
      await store.putUser(_profile('brady'));
      await store.putUser(_profile('kid'));
      await store.putUser(_profile('teen', pin: true));
      await store.putUser(_profile('other', account: '10'));
      await store.putSiloTokens('s1', '10', _pair);
      repo.setActiveSessionForTest('s1', 'kid');

      await repo.signOutSiloAccount();

      expect(factory.client.authApiFake.logouts, 1);
      expect(store.getUsers('s1').map((u) => u.id), ['other']);
      expect(store.getSiloTokens('s1', '9'), isNull);
      expect(store.getSiloTokens('s1', '10'), isNotNull);
    });

    test('another account on the server is not a sibling', () async {
      await store.putUser(_profile('brady'));
      await store.putUser(_profile('other', account: '10'));
      repo.setActiveSessionForTest('s1', 'brady');

      expect(repo.activeUserHasSiloSiblings, isFalse);
      await repo.destroyCurrentSession();

      expect(factory.client.authApiFake.logouts, 1);
    });
  });
}
