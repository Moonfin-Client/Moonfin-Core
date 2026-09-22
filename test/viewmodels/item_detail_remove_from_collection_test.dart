import 'package:dio/dio.dart';
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
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;

  Map<String, dynamic> member(String id, String name) => {
    'Id': id,
    'Type': 'Movie',
    'Name': name,
    'ServerId': 'server-1',
  };

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);

    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');

    when(
      () => itemsApi.getItem(
        'boxset-1',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer(
      (_) async => {'Id': 'boxset-1', 'Type': 'BoxSet', 'Name': 'Crossovers'},
    );

    when(
      () => itemsApi.getItems(
        parentId: 'boxset-1',
        startIndex: 0,
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          member('a', 'Alpha'),
          member('b', 'Beta'),
          member('c', 'Gamma'),
        ],
        'TotalRecordCount': 3,
      },
    );
  });

  tearDown(() => GetIt.instance.reset());

  Future<ItemDetailViewModel> loadedVm() async {
    final tmdb = TmdbRepository(client);
    final vm = ItemDetailViewModel(
      itemId: 'boxset-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdb),
      tmdbRepository: tmdb,
    );
    await vm.load();
    for (var i = 0; i < 100 && vm.collectionItems.length < 3; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    return vm;
  }

  test('removal calls the collection endpoint with just the item id', () async {
    final vm = await loadedVm();
    when(() => itemsApi.removeFromCollection(any(), any()))
        .thenAnswer((_) async {});

    final alpha = vm.collectionItems.firstWhere((i) => i.id == 'a');
    await vm.removeFromCollection(alpha);

    verify(() => itemsApi.removeFromCollection('boxset-1', ['a'])).called(1);
  });

  test('the card leaves the grid on success and the counts follow', () async {
    final vm = await loadedVm();
    when(() => itemsApi.removeFromCollection(any(), any()))
        .thenAnswer((_) async {});

    await vm.removeFromCollection(
      vm.collectionItems.firstWhere((i) => i.id == 'b'),
    );

    expect(vm.collectionItems.map((i) => i.id), ['a', 'c']);
  });

  test('a failed server call puts the removed card back', () async {
    final vm = await loadedVm();
    when(() => itemsApi.removeFromCollection(any(), any()))
        .thenThrow(DioException(requestOptions: RequestOptions(path: '/x')));

    await expectLater(
      vm.removeFromCollection(
        vm.collectionItems.firstWhere((i) => i.id == 'a'),
      ),
      throwsA(isA<DioException>()),
    );

    expect(vm.collectionItems.map((i) => i.id), ['a', 'b', 'c']);
  });

  test("removal is a no-op when the page isn't a collection", () async {
    final tmdb = TmdbRepository(client);
    when(
      () => itemsApi.getItem(
        'movie-9',
        mediaSourceId: any(named: 'mediaSourceId'),
      ),
    ).thenAnswer(
      (_) async => {'Id': 'movie-9', 'Type': 'Movie', 'Name': 'Not A Box'},
    );
    final vm = ItemDetailViewModel(
      itemId: 'movie-9',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdb),
      tmdbRepository: tmdb,
    );
    await vm.load();

    await vm.removeFromCollection(
      const AggregatedItem(id: 'a', serverId: 'server-1', rawData: {}),
    );

    verifyNever(() => itemsApi.removeFromCollection(any(), any()));
  });

  group('a collection bigger than one page', () {
    const memberCount = 60;
    const pageSize = 50;

    late List<Map<String, dynamic>> members;

    /// The grid reads the collection in server order, m00 first. The years run
    /// the other way, so the release sort behind the playlist tab starts at
    /// m59. One card can then sit inside the loaded grid page and outside the
    /// loaded playlist page at the same time.
    Future<ItemDetailViewModel> pagedVm() async {
      members = [
        for (var i = 0; i < memberCount; i++)
          {
            ...member('m${i.toString().padLeft(2, '0')}', 'Title $i'),
            'ProductionYear': 2100 - i,
          },
      ];

      when(
        () => itemsApi.getItems(
          parentId: any(named: 'parentId'),
          ids: any(named: 'ids'),
          startIndex: any(named: 'startIndex'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
        ),
      ).thenAnswer((invocation) async {
        final named = invocation.namedArguments;

        final ids = named[#ids] as List<String>?;
        if (ids != null) {
          final byId = {for (final m in members) m['Id'] as String: m};
          return {
            'Items': [
              for (final id in ids)
                if (byId[id] != null) byId[id]!,
            ],
            'TotalRecordCount': ids.length,
          };
        }

        // The index scan reads the whole collection in one request.
        if (named[#fields] == 'BasicSyncInfo') {
          return {'Items': members, 'TotalRecordCount': members.length};
        }

        final from = ((named[#startIndex] as int?) ?? 0).clamp(
          0,
          members.length,
        );
        final to = (from + ((named[#limit] as int?) ?? members.length)).clamp(
          0,
          members.length,
        );
        return {
          'Items': members.sublist(from, to),
          'TotalRecordCount': members.length,
        };
      });

      // The fake server drops the id for real, so pages read after a removal
      // are the shorter ones a real server would send.
      when(() => itemsApi.removeFromCollection(any(), any()))
          .thenAnswer((invocation) async {
            final ids = invocation.positionalArguments[1] as List<String>;
            members.removeWhere((m) => ids.contains(m['Id']));
          });

      final tmdb = TmdbRepository(client);
      final vm = ItemDetailViewModel(
        itemId: 'boxset-1',
        client: client,
        mutations: ItemMutationRepository(client),
        mdbListRepository: MdbListRepository(client, tmdb),
        tmdbRepository: tmdb,
      );
      await vm.load();
      for (var i = 0; i < 200; i++) {
        if (vm.collectionItems.length >= pageSize &&
            vm.playlistItems.length >= pageSize) {
          break;
        }
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }
      return vm;
    }

    test('the two lists open on opposite ends of the collection', () async {
      final vm = await pagedVm();

      expect(vm.collectionItems.first.id, 'm00');
      expect(vm.collectionItems.length, pageSize);
      expect(vm.playlistItems.first.id, 'm59');
      expect(vm.playlistItems.length, pageSize);
    });

    test(
      "a card removed past the playlist cursor isn't served twice",
      () async {
        final vm = await pagedVm();

        // m00 is on the loaded grid page and last in the playlist order, well
        // past the 50 ids the playlist tab has read.
        await vm.removeFromCollection(
          vm.collectionItems.firstWhere((i) => i.id == 'm00'),
        );
        await vm.loadMorePlaylistItems();

        final ids = vm.playlistItems.map((i) => i.id).toList();
        expect(ids, isNot(contains('m00')));
        expect(ids.toSet().length, ids.length, reason: 'no id served twice');
        expect(ids.length, memberCount - 1);
      },
    );

    test("a card removed past the grid cursor isn't served twice", () async {
      final vm = await pagedVm();

      // The mirror case, what the grid sees when the removal came from the
      // playlist tab. m55 is on the loaded playlist page and sits past the 50
      // the grid has read.
      await vm.removeFromCollection(
        vm.playlistItems.firstWhere((i) => i.id == 'm55'),
      );
      await vm.loadMoreCollectionItems();

      final ids = vm.collectionItems.map((i) => i.id).toList();
      expect(ids, isNot(contains('m55')));
      expect(ids.toSet().length, ids.length, reason: 'no id served twice');
      expect(ids.length, memberCount - 1);
    });
  });
}
