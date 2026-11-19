import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/plex_free_tv_favorites.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Test',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

PlexMediaServerClient _plex(String userId, {bool cloudOnly = false}) =>
    PlexMediaServerClient(
      baseUrl: cloudOnly ? 'https://plex.tv' : 'https://pms.example',
      deviceInfo: _device,
      cloudOnly: cloudOnly,
    )..userId = userId;

void main() {
  setUp(() async {
    userDataSync.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    userDataSync.reset();
    await GetIt.instance.reset();
  });

  test('Plex Cloud favorites follow the account across PMS and remain private', () async {
    final cloud = _plex('plex-user', cloudOnly: true);
    final pms = _plex('plex-user');
    final other = _plex('other-user');
    addTearDown(cloud.dispose);
    addTearDown(pms.dispose);
    addTearDown(other.dispose);

    const channel = <String, dynamic>{
      'Id': 'channel-plex-free123',
      'UserData': {'IsFavorite': false},
    };
    bool saved(MediaServerClient client) =>
        (PlexFreeTvFavorites.applyToItem(client, channel)['UserData'] as Map)['IsFavorite'] == true;

    await ItemMutationRepository(cloud).setFavorite(channel['Id'] as String, isFavorite: true);
    expect(saved(pms), isTrue);
    expect(saved(other), isFalse);

    await ItemMutationRepository(pms).setFavorite(channel['Id'] as String, isFavorite: false);
    expect(saved(cloud), isFalse);
  });
}
