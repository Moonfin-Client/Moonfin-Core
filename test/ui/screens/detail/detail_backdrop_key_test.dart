import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _PluginSyncService extends Mock implements PluginSyncService {}

class _ImageApi extends Fake implements ImageApi {
  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'backdrop/$itemId/$index?tag=$tag';

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'primary/$itemId?tag=$tag';
}

/// A server with one movie whose backdrop tags a test can change, the way
/// Change Artwork changes them.
class _ItemsApi extends Fake implements ItemsApi {
  List<String> backdropTags = const ['old'];

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) async => {
    'Id': itemId,
    'Name': 'Alien',
    'Type': 'Movie',
    'BackdropImageTags': backdropTags,
    'UserData': {'IsFavorite': false},
  };

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems ||
        invocation.memberName == #getSimilarItems) {
      return Future.value({'Items': const [], 'TotalRecordCount': 0});
    }
    return super.noSuchMethod(invocation);
  }
}

AggregatedItem _item(Map<String, dynamic> rawData) => AggregatedItem(
  id: 'm1',
  serverId: 'server',
  rawData: {'Id': 'm1', ...rawData},
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late BackgroundService backgrounds;

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
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.imageApi).thenReturn(_ImageApi());
    final factory = _Factory();
    when(() => factory.clientForServerOrActive(any())).thenReturn(client);
    GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
    backgrounds = BackgroundService();
  });

  tearDown(() {
    backgrounds.dispose();
    userDataSync.reset();
    return GetIt.instance.reset();
  });

  String key(Map<String, dynamic> rawData) =>
      detailBackdropKey(backgrounds, _item(rawData));

  group('detailBackdropKey', () {
    test('new backdrop tags on the item give a new key', () {
      expect(
        key({
          'BackdropImageTags': ['new'],
        }),
        isNot(
          key({
            'BackdropImageTags': ['old'],
          }),
        ),
      );
      expect(
        key({
          'BackdropImageTags': ['new'],
        }),
        isNot(key({})),
      );
    });

    test('a new parent backdrop gives a new key', () {
      expect(
        key({
          'Type': 'Episode',
          'ParentBackdropItemId': 's1',
          'ParentBackdropImageTags': ['new'],
        }),
        isNot(
          key({
            'Type': 'Episode',
            'ParentBackdropItemId': 's1',
            'ParentBackdropImageTags': ['old'],
          }),
        ),
      );
    });

    test('a new cover on an album without a backdrop gives a new key', () {
      expect(
        key({
          'Type': 'MusicAlbum',
          'ImageTags': {'Primary': 'new'},
        }),
        isNot(
          key({
            'Type': 'MusicAlbum',
            'ImageTags': {'Primary': 'old'},
          }),
        ),
      );
    });

    test('a user data change keeps the key', () {
      expect(
        key({
          'BackdropImageTags': ['old'],
          'UserData': {'IsFavorite': true},
        }),
        key({
          'BackdropImageTags': ['old'],
          'UserData': {'IsFavorite': false},
        }),
      );
    });
  });

  test(
    'a reload after Change Artwork gives a new key, and a favourite keeps it',
    () async {
      final itemsApi = _ItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final tmdbRepository = TmdbRepository(client);
      final vm = ItemDetailViewModel(
        itemId: 'm1',
        client: client,
        mutations: ItemMutationRepository(client),
        mdbListRepository: MdbListRepository(client, tmdbRepository),
        tmdbRepository: tmdbRepository,
      );
      addTearDown(vm.dispose);

      await vm.load();
      await pumpEventQueue();
      final before = detailBackdropKey(backgrounds, vm.item!);

      itemsApi.backdropTags = const ['new'];
      await vm.load();
      await pumpEventQueue();
      final reloaded = detailBackdropKey(backgrounds, vm.item!);
      expect(reloaded, isNot(before));

      userDataSync.publish('m1', {'IsFavorite': true});
      await pumpEventQueue();
      expect(vm.item?.isFavorite, isTrue);
      expect(detailBackdropKey(backgrounds, vm.item!), reloaded);
    },
  );
}
