import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/headless_session_bootstrap.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _StoredCredentials extends Fake implements CredentialStore {
  @override
  Future<String?> getToken(String serverId) async => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('headless Plex Free TV restore keeps cloud-only mode', () async {
    SharedPreferences.setMockInitialValues({});
    final getIt = GetIt.instance;
    await getIt.reset();
    addTearDown(() async {
      await getIt.reset();
    });

    final prefs = PreferenceStore();
    await prefs.init();
    final authPrefs = AuthenticationPreferences(prefs);
    await authPrefs.setLastServerId('cloud');
    await authPrefs.setLastUserId('viewer');

    final authStore = AuthenticationStore();
    await authStore.init();
    await authStore.putServer(
      Server(
        id: 'cloud',
        name: 'Plex Free TV',
        address: 'https://plex.tv',
        version: '',
        serverType: ServerType.plex,
        cloudOnly: true,
        dateAdded: DateTime.utc(2026),
      ),
    );
    await authStore.putUser(
      PrivateUser(
        id: 'viewer',
        name: 'Viewer',
        serverId: 'cloud',
        accessToken: 'token',
        lastUsed: DateTime.utc(2026),
      ),
    );

    final factory = MediaServerClientFactory(
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );
    addTearDown(factory.disposeAll);
    getIt.registerSingleton<MediaServerClientFactory>(factory);
    getIt.registerSingleton<AuthenticationPreferences>(authPrefs);
    getIt.registerSingleton<AuthenticationStore>(authStore);
    getIt.registerSingleton<ServerRepository>(
      ServerRepository(authStore, factory),
    );
    getIt.registerSingleton<CredentialStore>(_StoredCredentials());

    final client = await HeadlessSessionBootstrap().restoreClientOrThrow();
    expect(isCloudOnlyPlexClient(client), isTrue);
    expect(client.userId, 'viewer');
    // Foreground restoration must reuse a correctly configured cached client.
    final reused = factory.getClient(
      serverId: 'cloud',
      serverType: ServerType.plex,
      baseUrl: 'https://plex.tv',
      cloudOnly: true,
    );
    expect(identical(reused, client), isTrue);
    expect(isCloudOnlyPlexClient(reused), isTrue);
  });
}
