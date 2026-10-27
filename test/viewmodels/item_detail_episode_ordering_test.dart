import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

void main() {
  late _Client client;
  late _ItemsApi itemsApi;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);

    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
  });

  tearDown(() => GetIt.instance.reset());

  ItemDetailViewModel createViewModel(String itemId) {
    final tmdb = TmdbRepository(client);
    return ItemDetailViewModel(
      itemId: itemId,
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdb),
      tmdbRepository: tmdb,
    );
  }

  AggregatedItem makeEpisode({
    required String id,
    int? season,
    int? episode,
    String name = '',
  }) {
    return AggregatedItem(
      id: id,
      serverId: 'http://server',
      rawData: {
        'Id': id,
        'Type': 'Episode',
        'Name': name,
        'ParentIndexNumber': ?season,
        'IndexNumber': ?episode,
      },
    );
  }

  group('ItemDetailViewModel.compareEpisodes', () {
    test('sorts by season first', () {
      final s0e1 = makeEpisode(id: 's0e1', season: 0, episode: 1);
      final s1e1 = makeEpisode(id: 's1e1', season: 1, episode: 1);
      final list = [s1e1, s0e1]..sort(ItemDetailViewModel.compareEpisodes);

      expect(list.map((e) => e.id), ['s0e1', 's1e1']);
    });

    test('sorts by episode number within same season', () {
      final ep1 = makeEpisode(id: 'ep1', season: 0, episode: 1);
      final ep2 = makeEpisode(id: 'ep2', season: 0, episode: 2);
      final ep3 = makeEpisode(id: 'ep3', season: 0, episode: 3);
      final list = [ep2, ep3, ep1]..sort(ItemDetailViewModel.compareEpisodes);

      expect(list.map((e) => e.id), ['ep1', 'ep2', 'ep3']);
    });

    test('breaks ties by episode name case-insensitively', () {
      final a = makeEpisode(id: 'a', season: 0, episode: 1, name: 'alpha');
      final b = makeEpisode(id: 'b', season: 0, episode: 1, name: 'Beta');
      final list = [b, a]..sort(ItemDetailViewModel.compareEpisodes);

      expect(list.map((e) => e.id), ['a', 'b']);
    });
  });

  group('ItemDetailViewModel.compareFeatures', () {
    test('sorts by index number first, ignoring parentIndexNumber', () {
      final f1 = makeEpisode(id: 'f1', season: 2, episode: 1, name: 'Feature B');
      final f2 = makeEpisode(id: 'f2', season: 1, episode: 2, name: 'Feature A');
      final list = [f2, f1]..sort(ItemDetailViewModel.compareFeatures);

      expect(list.map((f) => f.id), ['f1', 'f2']);
    });

    test('breaks ties by feature name case-insensitively', () {
      final a = makeEpisode(id: 'a', episode: 1, name: 'alpha');
      final b = makeEpisode(id: 'b', episode: 1, name: 'Beta');
      final list = [b, a]..sort(ItemDetailViewModel.compareFeatures);

      expect(list.map((f) => f.id), ['a', 'b']);
    });
  });

  // Jellyfin puts each special in the season it aired in. Without a Next Up,
  // the detail screens pick the first unwatched episode in this order, so the
  // view model keeps it as sent.
  group('episode lists keep the server order', () {
    final airedOrder = [
      {'Id': 's1e1', 'Type': 'Episode', 'ParentIndexNumber': 1, 'IndexNumber': 1},
      {'Id': 's0e2', 'Type': 'Episode', 'ParentIndexNumber': 0, 'IndexNumber': 2},
      {'Id': 's1e2', 'Type': 'Episode', 'ParentIndexNumber': 1, 'IndexNumber': 2},
      {'Id': 's0e1', 'Type': 'Episode', 'ParentIndexNumber': 0, 'IndexNumber': 1},
    ];
    const expected = ['s1e1', 's0e2', 's1e2', 's0e1'];

    test('for every episode of a series', () async {
      when(
        () => itemsApi.getItem('series-1', mediaSourceId: any(named: 'mediaSourceId')),
      ).thenAnswer((_) async => {'Id': 'series-1', 'Type': 'Series'});
      when(
        () => itemsApi.getEpisodes('series-1', fields: any(named: 'fields')),
      ).thenAnswer((_) async => {'Items': airedOrder});

      final vm = createViewModel('series-1');
      await vm.load();
      await vm.loadAllSeriesEpisodes();

      expect(vm.seriesEpisodes.map((e) => e.id), expected);
    });

    test('for one season', () async {
      when(
        () => itemsApi.getItem('season-1', mediaSourceId: any(named: 'mediaSourceId')),
      ).thenAnswer(
        (_) async => {
          'Id': 'season-1',
          'Type': 'Season',
          'SeriesId': 'series-1',
          'IndexNumber': 1,
        },
      );
      when(
        () => itemsApi.getEpisodes(
          'series-1',
          seasonId: 'season-1',
          fields: any(named: 'fields'),
        ),
      ).thenAnswer((_) async => {'Items': airedOrder});

      final vm = createViewModel('season-1');
      await vm.load();

      for (var i = 0; i < 100 && vm.episodes.isEmpty; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }

      expect(vm.episodes.map((e) => e.id), expected);
    });
  });

  group('_loadFeatures ordering', () {
    test('orders special features by index number and name', () async {
      when(
        () => itemsApi.getItem('movie-1', mediaSourceId: any(named: 'mediaSourceId')),
      ).thenAnswer((_) async => {'Id': 'movie-1', 'Type': 'Movie'});

      when(() => itemsApi.getSpecialFeatures('movie-1')).thenAnswer(
        (_) async => [
          {'Id': 'f2', 'Type': 'Video', 'IndexNumber': 2, 'Name': 'Featurette B'},
          {'Id': 'f1', 'Type': 'Video', 'IndexNumber': 1, 'Name': 'Featurette A'},
        ],
      );

      final vm = createViewModel('movie-1');
      await vm.load();

      for (var i = 0; i < 100 && vm.features.isEmpty; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }

      expect(
        vm.features.map((f) => f.id).toList(),
        ['f1', 'f2'],
      );
    });
  });
}
