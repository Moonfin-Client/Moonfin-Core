import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/util/signed_in_server_features.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('anyServerTypeSupports', () {
    bool liveTv(Iterable<ServerType> types) =>
        anyServerTypeSupports(types, (f) => f.supportsLiveTv);

    test('no servers hides nothing', () {
      expect(liveTv(const []), isTrue);
    });

    test('Silo alone lacks Live TV', () {
      expect(liveTv(const [ServerType.silo]), isFalse);
    });

    test('any Jellyfin or Emby server brings it back', () {
      expect(liveTv(const [ServerType.silo, ServerType.emby]), isTrue);
      expect(liveTv(const [ServerType.jellyfin]), isTrue);
    });
  });

  group('liveTvOnAnySignedInServer', () {
    late AuthenticationStore store;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      store = AuthenticationStore();
      await store.init();
    });

    Future<void> addServer(
      String id,
      ServerType type, {
      bool signedIn = true,
    }) async {
      await store.putServer(
        Server(
          id: id,
          name: id,
          address: 'https://$id.example',
          version: '1',
          serverType: type,
          dateAdded: DateTime.utc(2026, 10, 14),
        ),
      );
      if (signedIn) {
        await store.putUser(
          PrivateUser(
            id: 'user-$id',
            name: 'Brady',
            serverId: id,
            accessToken: 'token',
            lastUsed: DateTime.utc(2026, 10, 14),
          ),
        );
      }
    }

    test('only Silo signed in: off', () async {
      await addServer('silo', ServerType.silo);

      expect(liveTvOnAnySignedInServer(store: store), isFalse);
    });

    test('Silo and Emby signed in: on', () async {
      await addServer('silo', ServerType.silo);
      await addServer('emby', ServerType.emby);

      expect(liveTvOnAnySignedInServer(store: store), isTrue);
    });

    test('a server nobody is signed in to does not count', () async {
      await addServer('silo', ServerType.silo);
      await addServer('emby', ServerType.emby, signedIn: false);

      expect(liveTvOnAnySignedInServer(store: store), isFalse);
    });

    test('music follows the same rule', () async {
      await addServer('silo', ServerType.silo);
      expect(musicOnAnySignedInServer(store: store), isFalse);

      await addServer('jellyfin', ServerType.jellyfin);
      expect(musicOnAnySignedInServer(store: store), isTrue);
    });

    test('Silo has Moonbase, and the full plugin follows the same rule',
        () async {
      bool fullPlugin() => anySignedInServerSupports(
        (f) => f.supportsFullMoonfinPlugin,
        store: store,
      );
      await addServer('silo', ServerType.silo);
      expect(moonfinPluginOnAnySignedInServer(store: store), isTrue);
      expect(fullPlugin(), isFalse);

      await addServer('emby', ServerType.emby);
      expect(fullPlugin(), isTrue);
    });

    test('Seerr is offered on Silo, through its own requests', () async {
      await addServer('silo', ServerType.silo);
      expect(seerrOnAnySignedInServer(store: store), isTrue);
    });

    test('nobody signed in anywhere: on', () async {
      await addServer('silo', ServerType.silo, signedIn: false);

      expect(liveTvOnAnySignedInServer(store: store), isTrue);
    });
  });

  group('itemServerSupports', () {
    const device = DeviceInfo(
      id: 'device',
      name: 'Device',
      appName: 'Moonfin',
      appVersion: '1.0.0',
    );
    final getIt = GetIt.instance;

    setUp(() {
      final factory = MediaServerClientFactory(deviceInfo: device);
      factory.getClient(
        serverId: 'silo',
        serverType: ServerType.silo,
        baseUrl: 'https://silo.example',
      );
      final emby = factory.getClient(
        serverId: 'emby',
        serverType: ServerType.emby,
        baseUrl: 'https://emby.example',
      );
      getIt.registerSingleton<MediaServerClientFactory>(factory);
      getIt.registerSingleton<MediaServerClient>(emby);
    });

    tearDown(() async => getIt.reset());

    bool playlists(String? serverId) =>
        itemServerSupports(serverId, (f) => f.supportsPlaylists);

    test('a Silo item has no playlists, an Emby item does', () {
      expect(playlists('silo'), isFalse);
      expect(playlists('emby'), isTrue);
    });

    test('an item without a known server uses the active one', () {
      expect(playlists(null), isTrue);
      expect(playlists(''), isTrue);
      expect(playlists('unknown'), isTrue);
    });

    test('with no client set up nothing is hidden', () async {
      await getIt.reset();
      expect(playlists('silo'), isTrue);
    });
  });
}
