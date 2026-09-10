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
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

    when(
      () => itemsApi.getItem('boxset-1', mediaSourceId: any(named: 'mediaSourceId')),
    ).thenAnswer(
      (_) async => {'Id': 'boxset-1', 'Type': 'BoxSet', 'Name': 'Crossovers'},
    );

    // The strict shape is the assertion. A page fetch that walks the tree or
    // filters by type carries extra arguments, misses this stub, and the grid
    // stays empty, which is the reported bug.
    when(
      () => itemsApi.getItems(
        parentId: 'boxset-1',
        startIndex: 0,
        limit: any(named: 'limit'),
        fields: 'PrimaryImageAspectRatio,BasicSyncInfo,People',
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'ep-flash', 'Type': 'Episode', 'Name': 'Flash vs. Arrow', 'SeriesName': 'The Flash'},
          {'Id': 'ep-arrow', 'Type': 'Episode', 'Name': 'The Brave and the Bold', 'SeriesName': 'Arrow'},
        ],
        'TotalRecordCount': 2,
      },
    );
  });

  tearDown(() => GetIt.instance.reset());

  test('collection grid asks for the members themselves, episodes included',
      () async {
    final tmdb = TmdbRepository(client);
    final vm = ItemDetailViewModel(
      itemId: 'boxset-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdb),
      tmdbRepository: tmdb,
    );

    await vm.load();
    // load() kicks the grid fetch off without awaiting it, so give the
    // page a moment to land before looking.
    for (var i = 0; i < 100 && vm.collectionItems.isEmpty; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }

    expect(vm.collectionItems, hasLength(2));
    expect(vm.collectionItems.map((i) => i.type), everyElement('Episode'));
    expect(vm.collectionItems.first.name, 'Flash vs. Arrow');
  });
}
