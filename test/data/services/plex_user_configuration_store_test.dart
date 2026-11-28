import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

void main() {
  tearDown(() => GetIt.instance.reset());

  test('a Plex user configuration survives a new factory and stays with its '
      'server', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton(UserPreferences(store));

    MediaServerClient plex(MediaServerClientFactory factory, String serverId) =>
        factory.getClient(
          serverId: serverId,
          serverType: ServerType.plex,
          baseUrl: 'http://$serverId.lan:32400',
        )..userId = 'owner';

    await plex(
      MediaServerClientFactory(deviceInfo: _device),
      'first',
    ).usersApi.updateUserConfiguration(
      const UserConfiguration(
        orderedViews: ['plex-section-2', 'plex-section-1'],
        myMediaExcludes: ['plex-section-3'],
      ),
    );

    final factory = MediaServerClientFactory(deviceInfo: _device);
    final config = await plex(factory, 'first').usersApi.getUserConfiguration();
    expect(config.orderedViews, ['plex-section-2', 'plex-section-1']);
    expect(config.myMediaExcludes, ['plex-section-3']);

    final other = await plex(factory, 'second').usersApi.getUserConfiguration();
    expect(other.orderedViews, isEmpty);
    expect(other.myMediaExcludes, isEmpty);
  });
}
