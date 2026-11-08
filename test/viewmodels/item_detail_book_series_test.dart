import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

class _RowDataSource extends Mock implements RowDataSource {}

Map<String, dynamic> _book(
  String id,
  String series,
  int number,
  String folder, {
  Map<String, dynamic> userData = const {},
}) => {
  'Id': id,
  'Name': id,
  'Type': 'Book',
  'SeriesName': series,
  'IndexNumber': number,
  'ParentId': folder,
  'UserData': userData,
};

/// Answers the library lookup, the title scan, the user data refresh and the
/// ancestors, and records each item query.
class _ItemsApi extends Fake implements ItemsApi {
  final titles = [
    _book('dune-3', 'Dune', 3, 'herbert'),
    _book('dune-1', 'Dune', 1, 'herbert', userData: {'Played': true}),
    // Metadata can carry a stray space after the series name.
    _book('dune-2', 'Dune ', 2, 'sequels', userData: {'PlayedPercentage': 40}),
    _book('neuromancer', 'Sprawl', 1, 'gibson'),
  ];
  final queries = <Map<Symbol, dynamic>>[];
  var ancestorLookups = 0;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) async => {'Id': itemId, 'Name': 'Books', 'CollectionType': 'books'};

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    ancestorLookups++;
    return [
      {'Id': 'herbert', 'Type': 'Folder'},
      {'Id': 'lib-1', 'Type': 'CollectionFolder'},
      {'Id': 'root', 'Type': 'AggregateFolder'},
    ];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName != #getItems) {
      return super.noSuchMethod(invocation);
    }
    final named = invocation.namedArguments;
    queries.add(named);
    final ids = named[#ids] as List<String>?;
    final types = named[#includeItemTypes] as List<String>?;
    final items = [
      for (final title in titles)
        if (ids?.contains(title['Id']) ?? types?.contains(title['Type']) ?? false)
          title,
    ];
    return Future.value({'Items': items, 'TotalRecordCount': items.length});
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
    GetIt.instance.registerSingleton<RowDataSource>(_RowDataSource());
    client = _Client();
    itemsApi = _ItemsApi();
    userLibraryApi = _UserLibraryApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibraryApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => userLibraryApi.markFavorite(any())).thenAnswer((_) async {});
    when(() => userLibraryApi.markPlayed(any())).thenAnswer((_) async {});
  });

  tearDown(() {
    userDataSync.reset();
    return GetIt.instance.reset();
  });

  ItemDetailViewModel viewModel(String itemId, {String? libraryId}) {
    final tmdbRepository = TmdbRepository(client);
    return ItemDetailViewModel(
      itemId: itemId,
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdbRepository),
      tmdbRepository: tmdbRepository,
      libraryId: libraryId,
    );
  }

  test('a series page gathers every book with the name, in reading order, '
      'from different folders', () async {
    final vm = viewModel('bookSeries:Dune', libraryId: 'lib-1');
    await vm.load();

    expect(vm.state, ItemDetailState.ready);
    expect(vm.item?.type, 'BookSeries');
    expect(vm.item?.name, 'Dune');
    expect(vm.seriesBooks.map((b) => b.id), ['dune-1', 'dune-2', 'dune-3']);
    expect(vm.seriesFeaturedBook?.id, 'dune-2');
    final scan = itemsApi.queries.single;
    expect(scan[#parentId], 'lib-1');
    expect(scan[#fields], contains('Overview'));
  });

  test('a series with one book in the library still opens', () async {
    final vm = viewModel('bookSeries:Sprawl', libraryId: 'lib-1');
    await vm.load();

    expect(vm.state, ItemDetailState.ready);
    expect(vm.seriesBooks.map((b) => b.id), ['neuromancer']);
  });

  test('a series name no book carries shows series not found', () async {
    final vm = viewModel('bookSeries:Foundation', libraryId: 'lib-1');
    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect('${vm.error}', 'Exception: Series not found');
  });

  test('favorite and played on a series page change the featured book', () async {
    final vm = viewModel('bookSeries:Dune', libraryId: 'lib-1');
    await vm.load();

    await vm.toggleFavorite();
    await vm.togglePlayed();

    verify(() => userLibraryApi.markFavorite('dune-2')).called(1);
    verify(() => userLibraryApi.markPlayed('dune-2')).called(1);
    verifyNever(() => userLibraryApi.markFavorite('bookSeries:Dune'));
    verifyNever(() => userLibraryApi.markPlayed('bookSeries:Dune'));
  });

  test('coming back to a series page refreshes its books without the series '
      'id', () async {
    final vm = viewModel('bookSeries:Dune', libraryId: 'lib-1');
    await vm.load();
    userDataSync.publish('dune-3', {'Played': true});

    await vm.syncUserDataIfStale();

    final refresh = itemsApi.queries.last[#ids] as List<String>;
    expect(refresh, containsAll(['dune-1', 'dune-2', 'dune-3']));
    expect(refresh, isNot(contains('bookSeries:Dune')));
  });

  final book = AggregatedItem(
    id: 'dune-3',
    serverId: 'http://server',
    rawData: _book('dune-3', 'Dune', 3, 'herbert'),
  );

  test('a book opened from its library hands that library to its series',
      () async {
    final vm = viewModel('dune-3', libraryId: 'lib-1');

    expect(await vm.libraryIdOf(book), 'lib-1');
    expect(itemsApi.ancestorLookups, 0);
  });

  test('a book opened from anywhere else finds its library in its ancestors, '
      'not its folder', () async {
    final vm = viewModel('dune-3');

    expect(await vm.libraryIdOf(book), 'lib-1');
  });
}
