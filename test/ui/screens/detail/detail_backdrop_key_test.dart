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
  group('detailBackdropKey', () {
    test('new backdrop tags on the same item give a new key', () {
      expect(
        detailBackdropKey(
          _item({
            'BackdropImageTags': ['new'],
          }),
        ),
        isNot(
          detailBackdropKey(
            _item({
              'BackdropImageTags': ['old'],
            }),
          ),
        ),
      );
      expect(
        detailBackdropKey(
          _item({
            'BackdropImageTags': ['new'],
          }),
        ),
        isNot(detailBackdropKey(_item({}))),
      );
    });

    test('a user data change keeps the key', () {
      expect(
        detailBackdropKey(
          _item({
            'BackdropImageTags': ['old'],
            'UserData': {'IsFavorite': true},
          }),
        ),
        detailBackdropKey(
          _item({
            'BackdropImageTags': ['old'],
            'UserData': {'IsFavorite': false},
          }),
        ),
      );
    });
  });

  group('a detail page after Change Artwork', () {
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

    test(
      'the reload shows the new backdrop, and a favourite keeps it',
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

        // The detail screen's rule: on every notify, pick the backdrop again
        // only when the key moved.
        String? lastKey;
        var picks = 0;
        vm.addListener(() {
          final item = vm.item;
          if (item == null) return;
          final key = detailBackdropKey(item);
          if (key == lastKey) return;
          lastKey = key;
          picks++;
          backgrounds.setBackground(item);
        });

        await vm.load();
        await pumpEventQueue();
        expect(backgrounds.currentUrl, 'backdrop/m1/0?tag=old');
        expect(picks, 1);

        // Change Artwork saves a new backdrop, closes and the page reloads.
        itemsApi.backdropTags = const ['new'];
        await vm.load();
        await pumpEventQueue();
        expect(backgrounds.currentUrl, 'backdrop/m1/0?tag=new');
        expect(picks, 2);

        userDataSync.publish('m1', {'IsFavorite': true});
        await pumpEventQueue();
        expect(vm.item?.isFavorite, isTrue);
        expect(backgrounds.currentUrl, 'backdrop/m1/0?tag=new');
        expect(
          picks,
          2,
          reason: 'a favourite does not pick the backdrop again',
        );
      },
    );
  });
}
