import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// One movie as the server would hand it back. Only the fields grouping reads
/// are filled in.
Map<String, dynamic> _movie(
  String id, {
  List<String>? genres,
  String? officialRating,
  int? productionYear,
  List<String>? studios,
}) => <String, dynamic>{
  'Id': id,
  'Name': id,
  'Type': 'Movie',
  'Genres': ?genres,
  'OfficialRating': ?officialRating,
  'ProductionYear': ?productionYear,
  if (studios != null)
    'Studios': [
      for (final studio in studios) <String, dynamic>{'Name': studio},
    ],
};

class _FakeItemsApi implements ItemsApi {
  _FakeItemsApi(this.pages);

  /// One entry per page the server answers with.
  final List<List<Map<String, dynamic>>> pages;
  int pageRequests = 0;

  int _pageCursor = 0;

  @override
  Future<Map<String, dynamic>> getItems({
    bool? serverWide,
    String? parentId,
    List<String>? ids,
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    String? sortBy,
    String? sortOrder,
    int? startIndex,
    int? limit,
    bool? recursive,
    String? searchTerm,
    String? fields,
    List<String>? personIds,
    List<String>? artistIds,
    List<String>? filters,
    List<String>? seriesStatus,
    String? nameStartsWith,
    String? nameLessThan,
    List<String>? genreIds,
    List<String>? genres,
    bool? isFavorite,
    bool? collapseBoxSetItems,
    bool? enableTotalRecordCount,
    String? enableImageTypes,
    int? imageTypeLimit,
    List<String>? tags,
    List<String>? studios,
    DateTime? minPremiereDate,
    String? maxOfficialRating,
    bool? hasParentalRating,
    String? anyProviderIdEquals,
  }) async {
    pageRequests++;
    final page = _pageCursor < pages.length
        ? pages[_pageCursor]
        : const <Map<String, dynamic>>[];
    _pageCursor++;
    return <String, dynamic>{
      'TotalRecordCount': pages.fold<int>(0, (sum, p) => sum + p.length),
      'Items': page,
    };
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{'Name': 'Movies', 'CollectionType': 'movies'};

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.itemsApi);

  @override
  final ItemsApi itemsApi;

  @override
  String get baseUrl => 'http://server';

  @override
  String? get userId => 'user';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeMdbListRepository implements MdbListRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<LibraryBrowseViewModel> _viewModel(
  _FakeItemsApi api, {
  LibraryGroupBy groupBy = LibraryGroupBy.none,
}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  await prefs.set(UserPreferences.libraryGroupBy('movies'), groupBy);
  return LibraryBrowseViewModel(
    libraryId: 'movies',
    client: _FakeClient(api),
    prefs: prefs,
    mdbListRepository: _FakeMdbListRepository(),
  );
}

List<String> _idsIn(Map<String, List<dynamic>> categories, String category) =>
    categories[category]!.map((item) => item.id as String).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('decades run newest first with unknown years last', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', productionYear: 1994),
        _movie('b', productionYear: 2001),
        _movie('c'),
        _movie('d', productionYear: 1999),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.decade);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.groupedCategories.keys.toList(), <String>[
      '2000s',
      '1990s',
      'Unknown',
    ]);
    expect(_idsIn(vm.groupedCategories, '1990s'), <String>['a', 'd']);
  });

  test('parental ratings run mildest first with unrated last', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', officialRating: 'R'),
        _movie('b', officialRating: 'G'),
        _movie('c'),
        _movie('d', officialRating: 'PG-13'),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.parentalRatings);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.groupedCategories.keys.toList(), <String>[
      'G',
      'PG-13',
      'R',
      'Unrated',
    ]);
  });

  test('a movie appears under each of its genres', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', genres: ['Action', 'Comedy']),
        _movie('b', genres: ['Comedy']),
        _movie('c'),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);
    addTearDown(vm.dispose);

    await vm.load();

    expect(_idsIn(vm.groupedCategories, 'Action'), <String>['a']);
    expect(_idsIn(vm.groupedCategories, 'Comedy'), <String>['a', 'b']);
    // The catch-all bucket sorts after the named genres.
    expect(vm.groupedCategories.keys.last, 'Other');
    expect(_idsIn(vm.groupedCategories, 'Other'), <String>['c']);
  });

  test('studios sort alphabetically with the unknown bucket last', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', studios: ['Warner Bros.']),
        _movie('b', studios: ['A24']),
        _movie('c'),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.studio);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.groupedCategories.keys.toList(), <String>[
      'A24',
      'Warner Bros.',
      'Unknown',
    ]);
  });

  test('grouping is off by default and reports no categories', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', genres: ['Action']),
      ],
    ]);
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.groupBy, LibraryGroupBy.none);
    expect(vm.groupedCategories, isEmpty);
    expect(vm.currentCategoryItems, vm.items);
  });

  test(
    'the same grouping is not recomputed while the list holds still',
    () async {
      final api = _FakeItemsApi([
        [
          _movie('a', genres: ['Action']),
        ],
      ]);
      final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);
      addTearDown(vm.dispose);

      await vm.load();

      // The grid asks for this more than once per build, so repeated reads have
      // to come back as the same object rather than a fresh grouping pass.
      expect(identical(vm.groupedCategories, vm.groupedCategories), isTrue);
    },
  );

  test('switching grouping rebuilds the categories', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', genres: ['Action'], productionYear: 1994),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);
    addTearDown(vm.dispose);

    await vm.load();
    expect(vm.groupedCategories.keys, contains('Action'));

    await vm.setGroupBy(LibraryGroupBy.decade);

    expect(vm.groupedCategories.keys.toList(), <String>['1990s']);
    expect(vm.selectedCategoryTab, isNull);
  });

  test(
    'the current category falls back to the first, never to everything',
    () async {
      final api = _FakeItemsApi([
        [
          _movie('a', genres: ['Action']),
          _movie('b', genres: ['Comedy']),
        ],
      ]);
      final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);
      addTearDown(vm.dispose);

      await vm.load();
      vm.setSelectedCategoryTab('Documentary');

      // A retired category must not silently widen the grid to the whole library.
      expect(vm.currentCategoryItems.length, 1);
      expect(vm.currentCategoryItems.single.id, 'a');
    },
  );

  test(
    'grouping pulls the remaining pages in so every category is complete',
    () async {
      final api = _FakeItemsApi([
        [
          _movie('a', genres: ['Action']),
        ],
        [
          _movie('b', genres: ['Action']),
        ],
        [
          _movie('c', genres: ['Comedy']),
        ],
      ]);
      final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);
      addTearDown(vm.dispose);

      await vm.load();
      // load() kicks the page walk off without awaiting it, so let it drain.
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(_idsIn(vm.groupedCategories, 'Action'), <String>['a', 'b']);
      expect(_idsIn(vm.groupedCategories, 'Comedy'), <String>['c']);
    },
  );

  test('disposing mid-walk stops the page fetching instead of notifying a '
      'dead listener', () async {
    final api = _FakeItemsApi([
      [
        _movie('a', genres: ['Action']),
      ],
      [
        _movie('b', genres: ['Action']),
      ],
      [
        _movie('c', genres: ['Action']),
      ],
      [
        _movie('d', genres: ['Action']),
      ],
    ]);
    final vm = await _viewModel(api, groupBy: LibraryGroupBy.genres);

    await vm.load();
    final requestsAtDispose = api.pageRequests;
    vm.dispose();

    // Anything still in flight would throw out of the notifyListeners in
    // loadMore, so a quiet drain here is the whole point.
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(
      api.pageRequests,
      lessThanOrEqualTo(requestsAtDispose + 1),
      reason: 'the walk should stop at the page already in flight',
    );
  });
}
