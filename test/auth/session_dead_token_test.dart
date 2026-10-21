import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
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
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

// A dead token at startup used to fan out into a parallel burst of 401s,
// which is enough to trip a fail2ban jail before the app noticed. This pins
// the recovery: one rejected probe, no logout with the dead token, and the
// stored credentials gone.

DioException _unauthorized() => DioException(
  requestOptions: RequestOptions(path: '/Users/Me'),
  response: Response(
    requestOptions: RequestOptions(path: '/Users/Me'),
    statusCode: 401,
  ),
);

class _RejectingUsersApi extends Fake implements UsersApi {
  int calls = 0;

  @override
  Future<ServerUser> getCurrentUser() async {
    calls++;
    throw _unauthorized();
  }
}

class _RecordingAuthApi extends Fake implements AuthApi {
  int logoutCalls = 0;

  @override
  Future<void> logout() async {
    logoutCalls++;
  }
}

class _TestClient extends Fake implements MediaServerClient {
  final usersApiFake = _RejectingUsersApi();
  final authApiFake = _RecordingAuthApi();

  @override
  String? accessToken;

  @override
  String? userId;

  @override
  UsersApi get usersApi => usersApiFake;

  @override
  AuthApi get authApi => authApiFake;
}

class _TestClientFactory extends Fake implements MediaServerClientFactory {
  final client = _TestClient();
  int removedClients = 0;

  @override
  MediaServerClient getClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) => client;

  @override
  MediaServerClient? getClientIfExists(String serverId) => client;

  @override
  void removeClient(String serverId) {
    removedClients++;
  }
}

class _TestAuthStore extends Fake implements AuthenticationStore {
  final PrivateUser user;
  int removedUsers = 0;

  _TestAuthStore(this.user);

  @override
  List<PrivateUser> getUsers(String serverId) => [user];

  @override
  Future<void> removeUser(String serverId, String userId) async {
    removedUsers++;
  }
}

class _TestAuthPrefs extends Fake implements AuthenticationPreferences {
  @override
  UserSelectBehavior get loginBehavior => UserSelectBehavior.lastUser;

  @override
  Future<void> setLastServerId(String id) async {}

  @override
  Future<void> setLastUserId(String id) async {}

  @override
  Future<void> clearAutoLogin() async {}
}

class _TestCredentialStore extends Fake implements CredentialStore {
  int deletedTokens = 0;

  @override
  Future<String?> getToken(String serverId) async => 'stored-token';

  @override
  Future<void> deleteToken(String serverId) async {
    deletedTokens++;
  }
}

class _TestSocketHandler extends Fake implements SocketHandler {
  @override
  void disconnect() {}
}

class _TestServerRepository extends Fake implements ServerRepository {
  final Server server;

  _TestServerRepository(this.server);

  @override
  Server? getServer(String id) => server;
}

class _TestUserRepository extends Fake implements UserRepository {
  @override
  void setCurrentUser(User? user) {}
}

class _TestPluginSyncService extends Fake implements PluginSyncService {
  @override
  void resetState({
    bool notify = true,
    bool stopStream = true,
    bool keepIncompleteRecordings = false,
  }) {}
}

class _RecordingManager extends PlaybackManager {
  int stops = 0;

  @override
  Future<void> stop({bool userInitiated = true}) async => stops++;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'a rejected stored token costs one probe and no logout request',
    () async {
      final server = Server(
        id: 'server-1',
        name: 'Test',
        address: 'https://server.test',
        version: '10.11.0',
        serverType: ServerType.jellyfin,
        dateAdded: DateTime.utc(2026, 8, 21),
      );
      final user = PrivateUser(
        id: 'user-1',
        name: 'kis',
        serverId: 'server-1',
        accessToken: 'dead-token',
        lastUsed: DateTime.utc(2026, 8, 21),
      );
      final clientFactory = _TestClientFactory();
      final credentialStore = _TestCredentialStore();
      final authStore = _TestAuthStore(user);
      final repo = SessionRepository(
        authStore,
        _TestAuthPrefs(),
        credentialStore,
        clientFactory,
        _TestSocketHandler(),
        _TestServerRepository(server),
        _TestUserRepository(),
        _TestPluginSyncService(),
      );

      final ok = await repo.switchCurrentSession(
        serverId: 'server-1',
        userId: 'user-1',
        validateToken: true,
      );

      expect(ok, isFalse);
      expect(clientFactory.client.usersApiFake.calls, 1);
      expect(
        clientFactory.client.authApiFake.logoutCalls,
        0,
        reason: 'logout authenticates with the same dead token',
      );
      expect(credentialStore.deletedTokens, 1);
      expect(authStore.removedUsers, 1);
      expect(clientFactory.removedClients, 1);
    },
  );

  // Music left playing in the background belongs to the user signing out, and
  // the sign-in screen has nothing to stop it.
  test('signing out stops music left playing', () async {
    final manager = _RecordingManager();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    addTearDown(() async {
      manager.dispose();
      await GetIt.instance.reset();
    });
    final server = Server(
      id: 'server-1',
      name: 'Test',
      address: 'https://server.test',
      version: '10.11.0',
      serverType: ServerType.jellyfin,
      dateAdded: DateTime.utc(2026, 8, 21),
    );
    final user = PrivateUser(
      id: 'user-1',
      name: 'kis',
      serverId: 'server-1',
      accessToken: 'token',
      lastUsed: DateTime.utc(2026, 8, 21),
    );
    final repo = SessionRepository(
      _TestAuthStore(user),
      _TestAuthPrefs(),
      _TestCredentialStore(),
      _TestClientFactory(),
      _TestSocketHandler(),
      _TestServerRepository(server),
      _TestUserRepository(),
      _TestPluginSyncService(),
    );

    await repo.destroyCurrentSession();

    expect(manager.stops, 1);
  });
}
