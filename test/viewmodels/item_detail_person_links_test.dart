import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _Tmdb extends Mock implements TmdbRepository {}

class _PluginSyncService extends Mock implements PluginSyncService {}

// Issue #1721: a hidden or unavailable links section shouldn't cost a TMDB call.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _Tmdb tmdb;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.tmdbPersonLinksAvailable).thenReturn(true);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);

    client = _Client();
    final itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => itemsApi.getItem('person-1')).thenAnswer(
      (_) async => {
        'Id': 'person-1',
        'Type': 'Person',
        'ProviderIds': {'Tmdb': '70851'},
      },
    );
    tmdb = _Tmdb();
    when(() => tmdb.getPersonAccounts(any())).thenAnswer((_) async => null);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<void> load() => ItemDetailViewModel(
    itemId: 'person-1',
    client: client,
    mutations: ItemMutationRepository(client),
    mdbListRepository: MdbListRepository(client, tmdb),
    tmdbRepository: tmdb,
  ).load();

  test('fetches the accounts when the links are on', () async {
    await load();
    verify(() => tmdb.getPersonAccounts('70851')).called(1);
  });

  test('skips the fetch when the links are switched off', () async {
    await prefs.set(UserPreferences.hiddenDetailSectionsMobile, 'personLinks');
    await prefs.set(UserPreferences.hiddenDetailSectionsDesktop, 'personLinks');
    await load();
    verifyNever(() => tmdb.getPersonAccounts(any()));
  });

  test('skips the fetch on TV', () async {
    PlatformDetection.setTvMode(true);
    await load();
    verifyNever(() => tmdb.getPersonAccounts(any()));
  });
}
