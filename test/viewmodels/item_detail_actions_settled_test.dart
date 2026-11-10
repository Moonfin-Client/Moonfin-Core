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

class _PluginSyncService extends Mock implements PluginSyncService {}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    userDataSync.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
  });

  tearDown(() async {
    userDataSync.reset();
    await GetIt.instance.reset();
  });

  test('the action row shows once its wait runs out', () async {
    final client = _Client();
    final itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(
      () => itemsApi.getItem(
        'series-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer((_) async => {'Id': 'series-1', 'Type': 'Series'});
    // Next Up never answers, like a server that's slow to.
    final nextUp = Completer<Map<String, dynamic>>();
    when(
      () => itemsApi.getNextUp(
        seriesId: 'series-1',
        limit: 1,
        fields: any(named: 'fields'),
      ),
    ).thenAnswer((_) => nextUp.future);

    final vm = ItemDetailViewModel(
      itemId: 'series-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, TmdbRepository(client)),
      tmdbRepository: TmdbRepository(client),
    );
    addTearDown(vm.dispose);
    await vm.load();
    expect(vm.actionsSettled, isFalse);

    await Future<void>.delayed(
      ItemDetailViewModel.actionsWaitCap + const Duration(milliseconds: 100),
    );

    expect(vm.actionsSettled, isTrue);
  });
}
