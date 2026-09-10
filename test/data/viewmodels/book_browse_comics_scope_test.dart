import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/book_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/book/book_scope_filter.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

Map<String, dynamic> _book(String id, String name) => {
  'Id': id,
  'Name': name,
  'SortName': name,
  'Type': 'Book',
};

/// A comic is a Book on the server and is only told apart by its container.
Map<String, dynamic> _comic(String id, String name) => {
  'Id': id,
  'Name': name,
  'SortName': name,
  'Type': 'Book',
  'Path': '/library/$name.cbz',
};

/// Serves one library's items and counts the requests, so a query that is
/// only meant to run when the typed one came back empty can be checked.
class _FakeItemsApi extends Fake implements ItemsApi {
  _FakeItemsApi(this.items);

  final List<Map<String, dynamic>> items;
  int calls = 0;
  int untypedCalls = 0;

  /// Reproduces the server bug this screen works around: a query naming item
  /// types matches nothing, while the same query without them answers.
  bool typedQueriesReturnNothing = false;

  /// Answers with none of the fields the readers expect.
  bool bareResponses = false;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    const empty = {'Items': <dynamic>[], 'TotalRecordCount': 0};
    if (bareResponses) return Future.value(<String, dynamic>{});
    if (invocation.memberName != #getItems) return Future.value(empty);
    calls++;
    final named = invocation.namedArguments;
    final types =
        named[#includeItemTypes] as List<String>? ?? const <String>[];
    final filters = named[#filters] as List<String>?;
    final isFavorite = named[#isFavorite] as bool?;
    final limit = named[#limit] as int?;
    if (types.isEmpty) untypedCalls++;

    if ((filters != null && filters.isNotEmpty) || isFavorite == true) {
      return Future.value(empty);
    }
    if (types.isNotEmpty && typedQueriesReturnNothing) {
      return Future.value(empty);
    }
    final matching = types.isEmpty
        ? items
        : items.where((it) => types.contains(it['Type'])).toList();
    return Future.value({
      'Items': limit == null ? matching : matching.take(limit).toList(),
      'TotalRecordCount': matching.length,
    });
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late _FakeItemsApi itemsApi;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    itemsApi = _FakeItemsApi([
      _book('b1', 'Alpha'),
      _book('b2', 'Beta'),
      _comic('c1', 'Zeta Comic'),
    ]);
    client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.imageApi).thenReturn(_MockImageApi());
  });

  tearDown(() => GetIt.instance.reset());

  BookBrowseViewModel buildVm() => BookBrowseViewModel(
    libraryId: 'lib-1',
    dataSource: RowDataSource(client),
    client: client,
    collectionType: 'books',
  );

  HomeRow rowWithId(String id) =>
      HomeRow(id: id, title: '', rowType: HomeRowType.latestMedia);

  test('the comics scope keeps every shelf on its own id', () async {
    final vm = buildVm();
    await vm.load();
    vm.setScope(BookScope.comics);

    final ids = vm.rows.map((r) => r.id).toList();
    expect(
      ids.length,
      ids.toSet().length,
      reason: 'two shelves sharing an id share a GlobalKey and crash',
    );
  });

  test('a comic reaches the all titles shelf', () async {
    final vm = buildVm();
    await vm.load();

    final all = vm.rows.firstWhere((r) => r.id == 'allTitles_lib-1');
    expect(all.items.map((i) => i.id), contains('c1'));
  });

  test('comics rows ask the grid for a type the server knows', () {
    final vm = buildVm();
    for (final id in ['latestComics_lib-1', 'allComics_lib-1']) {
      final types = vm.seeAllTypesFor(rowWithId(id));
      expect(types, isNot(contains('Comic')));
      expect(types, contains('Book'));
    }
  });

  test('a typed query that answers is not asked twice', () async {
    final row = await RowDataSource(client).loadLibraryItemsByType(
      'lib-1',
      'http://server',
      title: 'Books',
      includeItemTypes: const ['Book'],
    );
    expect(row.items, isNotEmpty);
    expect(itemsApi.calls, 1);
    expect(itemsApi.untypedCalls, 0);
  });

  test('a typed query that matches nothing is retried without types', () async {
    itemsApi.typedQueriesReturnNothing = true;
    final row = await RowDataSource(client).loadLibraryItemsByType(
      'lib-1',
      'http://server',
      title: 'Books',
      includeItemTypes: const ['Book'],
    );
    expect(row.items.map((i) => i.id), containsAll(['b1', 'b2']));
    expect(itemsApi.untypedCalls, 1);
  });

  test('responses missing their fields leave the screen empty', () async {
    itemsApi.bareResponses = true;
    final vm = buildVm();
    await vm.load();

    expect(vm.isLoading, isFalse);
    expect(vm.rows, isEmpty);
    expect(vm.bookCount, 0);
    expect(vm.comicCount, 0);
  });
}
