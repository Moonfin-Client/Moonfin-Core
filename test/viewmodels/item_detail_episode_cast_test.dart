import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}
class _ItemsApi extends Mock implements ItemsApi {}
class _Tmdb extends Mock implements TmdbRepository {}
class _PluginSyncService extends Mock implements PluginSyncService {}
class _UserDataSync extends Mock implements UserDataSync {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
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
    when(() => pluginSync.tmdbPersonLinksAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);

    final userDataSync = _UserDataSync();
    GetIt.instance.registerSingleton<UserDataSync>(userDataSync);

    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');

    tmdb = _Tmdb();
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  ItemDetailViewModel createViewModel(String itemId) => ItemDetailViewModel(
    itemId: itemId,
    client: client,
    mutations: ItemMutationRepository(client),
    mdbListRepository: MdbListRepository(client, tmdb),
    tmdbRepository: tmdb,
  );

  test('episode resolves parent cast with guest stars first followed by main regulars', () async {
    when(() => itemsApi.getItem('ep-1')).thenAnswer(
      (_) async => {
        'Id': 'ep-1',
        'Type': 'Episode',
        'Name': 'Test Episode',
        'SeasonId': 'season-1',
        'SeriesId': 'series-1',
        'People': [
          {'Id': 'd1', 'Name': 'Director Dan', 'Type': 'Director', 'Role': 'Director'},
          {'Id': 'w1', 'Name': 'Writer Wendy', 'Type': 'Writer', 'Role': ''},
          {'Id': 'g1', 'Name': 'Guest Guy', 'Type': 'GuestStar', 'Role': 'Bounty Hunter'},
        ],
      },
    );
    when(() => itemsApi.getEpisodes('series-1', seasonId: any(named: 'seasonId'), fields: any(named: 'fields'))).thenAnswer(
      (_) async => {'Items': []},
    );
    when(() => itemsApi.getSimilarItems(any(), limit: any(named: 'limit'))).thenAnswer(
      (_) async => {'Items': []},
    );
    when(() => itemsApi.getSpecialFeatures(any())).thenAnswer((_) async => []);
    when(() => itemsApi.getItem('season-1')).thenAnswer(
      (_) async => {
        'Id': 'season-1',
        'Type': 'Season',
        'People': [
          {'Id': 'm1', 'Name': 'Main Star', 'Type': 'Actor', 'Role': 'Sheriff'},
        ],
      },
    );

    final vm = createViewModel('ep-1');
    await vm.load();

    for (var i = 0; i < 100 && vm.parentActors.isEmpty; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }

    expect(vm.directors.length, 1);
    expect(vm.directors.first['Name'], 'Director Dan');
    expect(vm.directors.first['Role'], 'Episode Director');

    expect(vm.writers.length, 1);
    expect(vm.writers.first['Name'], 'Writer Wendy');
    expect(vm.writers.first['Role'], 'Episode Writer');

    final actors = vm.actors;
    expect(actors.length, 2);
    expect(actors[0]['Name'], 'Guest Guy');
    expect(actors[0]['Role'], 'Bounty Hunter (Guest Star)');
    expect(actors[1]['Name'], 'Main Star');
    expect(actors[1]['Role'], 'Sheriff');
  });

  test('season with no actors falls back to series cast', () async {
    when(() => itemsApi.getItem('season-1')).thenAnswer(
      (_) async => {
        'Id': 'season-1',
        'Type': 'Season',
        'SeriesId': 'series-1',
        'People': <Map<String, dynamic>>[],
      },
    );
    when(() => itemsApi.getEpisodes('series-1', seasonId: any(named: 'seasonId'), fields: any(named: 'fields'))).thenAnswer(
      (_) async => {'Items': []},
    );
    when(() => itemsApi.getSpecialFeatures(any())).thenAnswer((_) async => []);
    when(() => itemsApi.getItem('series-1')).thenAnswer(
      (_) async => {
        'Id': 'series-1',
        'Type': 'Series',
        'People': [
          {'Id': 'm1', 'Name': 'Series Regular', 'Type': 'Actor', 'Role': 'Lead'},
        ],
      },
    );

    final vm = createViewModel('season-1');
    await vm.load();

    for (var i = 0; i < 100 && vm.parentActors.isEmpty; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }

    final actors = vm.actors;
    expect(actors.length, 1);
    expect(actors.first['Name'], 'Series Regular');
  });

  test('older in-flight parent cast lookup does not overwrite newer cast data', () async {
    final completer1 = Completer<Map<String, dynamic>>();
    when(() => itemsApi.getItem('ep-1')).thenAnswer(
      (_) async => {
        'Id': 'ep-1',
        'Type': 'Episode',
        'Name': 'Test Episode',
        'SeasonId': 'season-slow',
        'SeriesId': 'series-slow',
        'People': const [],
      },
    );
    when(() => itemsApi.getEpisodes(any(), seasonId: any(named: 'seasonId'), fields: any(named: 'fields'))).thenAnswer(
      (_) async => {'Items': []},
    );
    when(() => itemsApi.getSimilarItems(any(), limit: any(named: 'limit'))).thenAnswer(
      (_) async => {'Items': []},
    );
    when(() => itemsApi.getSpecialFeatures(any())).thenAnswer((_) async => []);
    when(() => itemsApi.getItem('season-slow')).thenAnswer((_) => completer1.future);

    final vm = createViewModel('ep-1');
    await vm.load();

    // Start a second load with fast resolution before the first completes
    when(() => itemsApi.getItem('season-fast')).thenAnswer(
      (_) async => {
        'Id': 'season-fast',
        'Type': 'Season',
        'People': [
          {'Id': 'f1', 'Name': 'Fast Actor', 'Type': 'Actor', 'Role': 'Sheriff'},
        ],
      },
    );
    when(() => itemsApi.getItem('ep-1')).thenAnswer(
      (_) async => {
        'Id': 'ep-1',
        'Type': 'Episode',
        'Name': 'Test Episode',
        'SeasonId': 'season-fast',
        'SeriesId': 'series-fast',
        'People': const [],
      },
    );

    await vm.load();

    for (var i = 0; i < 100 && vm.parentActors.isEmpty; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    expect(vm.parentActors.first['Name'], 'Fast Actor');

    // Complete the first (slower) lookup
    completer1.complete({
      'Id': 'season-slow',
      'Type': 'Season',
      'People': [
        {'Id': 's1', 'Name': 'Slow Stale Actor', 'Type': 'Actor', 'Role': 'Old'},
      ],
    });
    await Future<void>.delayed(const Duration(milliseconds: 20));

    // Stale lookup must be ignored due to generation change
    expect(vm.parentActors.first['Name'], 'Fast Actor');
  });
}

