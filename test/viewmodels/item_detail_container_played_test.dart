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

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

/// A server holding one season of three episodes. Marking the season played
/// marks every episode, the way Jellyfin does, and no socket message follows.
class _ItemsApi extends Fake implements ItemsApi {
  final userData = <String, Map<String, dynamic>>{
    'season-1': {'Played': false},
    'ep-1': {'Played': true},
    'ep-2': {
      'Played': false,
      'PlaybackPositionTicks': 400,
      'PlayedPercentage': 40,
    },
    'ep-3': {'Played': false},
  };

  void markSeasonPlayed() {
    for (final id in userData.keys) {
      userData[id] = {'Played': true, 'PlaybackPositionTicks': 0};
    }
  }

  Map<String, dynamic> _episode(String id, int number) => {
    'Id': id,
    'Name': id,
    'Type': 'Episode',
    'SeriesId': 'series-1',
    'SeasonId': 'season-1',
    'IndexNumber': number,
    'UserData': userData[id],
  };

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) async => {
    'Id': itemId,
    'Name': 'Season 1',
    'Type': 'Season',
    'SeriesId': 'series-1',
    'UserData': userData[itemId],
  };

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final named = invocation.namedArguments;
    if (invocation.memberName == #getEpisodes) {
      final items = [
        _episode('ep-1', 1),
        _episode('ep-2', 2),
        _episode('ep-3', 3),
      ];
      return Future.value({'Items': items, 'TotalRecordCount': items.length});
    }
    if (invocation.memberName == #getItems && named[#fields] == 'UserData') {
      final ids = named[#ids] as List<String>? ?? const [];
      final items = [
        for (final id in ids)
          if (userData.containsKey(id)) {'Id': id, 'UserData': userData[id]},
      ];
      return Future.value({'Items': items, 'TotalRecordCount': items.length});
    }
    if (invocation.memberName == #getItems) {
      return Future.value({'Items': const [], 'TotalRecordCount': 0});
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late _UserLibraryApi userLibraryApi;

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
    userLibraryApi = _UserLibraryApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibraryApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => userLibraryApi.markPlayed(any())).thenAnswer((_) async {
      itemsApi.markSeasonPlayed();
    });
  });

  tearDown(() {
    userDataSync.reset();
    return GetIt.instance.reset();
  });

  test('marking a season played shows its episodes played without waiting '
      'for the socket', () async {
    final tmdbRepository = TmdbRepository(client);
    final vm = ItemDetailViewModel(
      itemId: 'season-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdbRepository),
      tmdbRepository: tmdbRepository,
    );
    await vm.load();
    await pumpEventQueue();
    expect(vm.episodes.map((e) => e.id), ['ep-1', 'ep-2', 'ep-3']);
    expect(vm.episodes.every((e) => e.isPlayed), isFalse);

    await vm.togglePlayed();

    expect(vm.item?.isPlayed, isTrue);
    expect(vm.episodes.every((e) => e.isPlayed), isTrue);
    expect(vm.episodes[1].playbackPositionTicks, 0);
  });
}
