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

Map<String, dynamic> _episode(String id, int index) => {
  'Id': id,
  'Type': 'Episode',
  'SeriesId': 'series-1',
  'ParentIndexNumber': 1,
  'IndexNumber': index,
};

void main() {
  late _Client client;
  late _ItemsApi itemsApi;

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

    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(
      () => itemsApi.getItem(
        'series-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer((_) async => {'Id': 'series-1', 'Type': 'Series'});
  });

  tearDown(() async {
    userDataSync.reset();
    await GetIt.instance.reset();
  });

  void answerNextUp(Future<Map<String, dynamic>> Function() answer) {
    when(
      () => itemsApi.getNextUp(
        seriesId: 'series-1',
        limit: 1,
        fields: any(named: 'fields'),
      ),
    ).thenAnswer((_) => answer());
  }

  Future<ItemDetailViewModel> loadSeries() async {
    final vm = ItemDetailViewModel(
      itemId: 'series-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, TmdbRepository(client)),
      tmdbRepository: TmdbRepository(client),
    );
    addTearDown(vm.dispose);
    await vm.load();
    return vm;
  }

  Future<void> waitUntil(bool Function() done) async {
    for (var i = 0; i < 100 && !done(); i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
  }

  test('marking the next up episode played moves the series on', () async {
    var nextUp = _episode('e3', 3);
    answerNextUp(() async => {'Items': [nextUp]});
    final vm = await loadSeries();
    await waitUntil(() => vm.nextUp != null);
    expect(vm.nextUp?.id, 'e3');

    // The episode page marks it played, and the server now has e4 as next up.
    userDataSync.publish('e3', {'Played': true, 'PlaybackPositionTicks': 0});
    nextUp = _episode('e4', 4);

    await vm.syncUserDataIfStale();

    expect(vm.nextUp?.id, 'e4');
  });

  test('marking it played from the series page moves it on too', () async {
    var nextUp = _episode('e3', 3);
    answerNextUp(() async => {'Items': [nextUp]});
    final vm = await loadSeries();
    await waitUntil(() => vm.nextUp != null);
    expect(vm.nextUp?.id, 'e3');

    // Marks only publish once the server has them, so e4 is already next.
    nextUp = _episode('e4', 4);
    userDataSync.publish('e3', {'Played': true, 'PlaybackPositionTicks': 0});
    await waitUntil(() => vm.nextUp?.id == 'e4');

    expect(vm.nextUp?.id, 'e4');
  });

  test('a late answer to the first Next Up request doesn\'t replace the refreshed one', () async {
    // The page's own request is still out when the refresh asks again.
    final firstAnswer = Completer<Map<String, dynamic>>();
    final answers = <Future<Map<String, dynamic>>>[
      firstAnswer.future,
      Future.value({
        'Items': [_episode('e4', 4)],
      }),
    ];
    answerNextUp(() => answers.removeAt(0));
    final vm = await loadSeries();
    await waitUntil(() => answers.length == 1);
    expect(answers, hasLength(1), reason: 'the page asked for Next Up');

    userDataSync.publish('e3', {'Played': true, 'PlaybackPositionTicks': 0});
    await vm.syncUserDataIfStale();
    expect(vm.nextUp?.id, 'e4');

    firstAnswer.complete({
      'Items': [_episode('e3', 3)],
    });
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(vm.nextUp?.id, 'e4');
  });

  test('a failed Next Up refresh keeps the card already shown', () async {
    var fail = false;
    answerNextUp(() async {
      if (fail) throw Exception('connection dropped');
      return {
        'Items': [_episode('e3', 3)],
      };
    });
    final vm = await loadSeries();
    await waitUntil(() => vm.nextUp != null);
    expect(vm.nextUp?.id, 'e3');

    fail = true;
    userDataSync.publish('e2', {'Played': true, 'PlaybackPositionTicks': 0});
    await vm.syncUserDataIfStale();

    expect(vm.nextUp?.id, 'e3');
  });
}
