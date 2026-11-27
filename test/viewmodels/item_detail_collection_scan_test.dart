import 'dart:async';

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
      () => itemsApi.getItem('movie-1', mediaSourceId: any(named: 'mediaSourceId')),
    ).thenAnswer((_) async => {'Id': 'movie-1', 'Type': 'Movie', 'Name': 'Movie'});
    when(() => itemsApi.getAncestors('movie-1')).thenAnswer((_) async => []);
  });

  tearDown(() => GetIt.instance.reset());

  test('closing the page stops the collection scan', () async {
    when(
      () => itemsApi.getItems(
        includeItemTypes: ['BoxSet'],
        recursive: true,
        sortBy: any(named: 'sortBy'),
        fields: any(named: 'fields'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          for (var i = 0; i < 24; i++)
            {'Id': 'boxset-$i', 'Type': 'BoxSet', 'Name': 'Collection $i'},
        ],
      },
    );
    // The first batch of membership lookups is still out when the page closes.
    final firstBatch = Completer<Map<String, dynamic>>();
    when(
      () => itemsApi.getItems(
        parentId: any(named: 'parentId'),
        fields: 'BasicSyncInfo',
      ),
    ).thenAnswer((_) => firstBatch.future);

    final tmdb = TmdbRepository(client);
    final vm = ItemDetailViewModel(
      itemId: 'movie-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdb),
      tmdbRepository: tmdb,
    );
    unawaited(vm.load());
    await pumpEventQueue();
    verify(
      () => itemsApi.getItems(parentId: 'boxset-0', fields: 'BasicSyncInfo'),
    ).called(1);

    vm.dispose();
    firstBatch.complete({'Items': <dynamic>[]});
    await pumpEventQueue();

    verifyNever(
      () => itemsApi.getItems(parentId: 'boxset-12', fields: 'BasicSyncInfo'),
    );
  });
}
