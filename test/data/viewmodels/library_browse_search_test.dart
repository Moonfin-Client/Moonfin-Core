import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> _movie(String name, {String? sortName}) => <String, dynamic>{
  'Id': name,
  'Name': name,
  'SortName': ?sortName,
  'Type': 'Movie',
};

class _FakeItemsApi implements ItemsApi {
  _FakeItemsApi(this.pages);

  final List<List<Map<String, dynamic>>> pages;
  final List<String?> searchTerms = <String?>[];
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
    List<String>? officialRatings,
    List<int>? years,
    List<String>? videoTypes,
    List<String>? audioLanguages,
    List<String>? subtitleLanguages,
    bool? hasSubtitles,
    bool? hasTrailer,
    bool? hasSpecialFeature,
    bool? hasThemeSong,
    bool? hasThemeVideo,
    bool? isHd,
    bool? is4K,
    bool? is3D,
  }) async {
    pageRequests++;
    searchTerms.add(searchTerm);
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
  }) async => <String, dynamic>{
    'Name': 'Movies',
    'CollectionType': 'movies',
  };

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

Future<LibraryBrowseViewModel> _viewModel(_FakeItemsApi api) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return LibraryBrowseViewModel(
    libraryId: 'movies',
    client: _FakeClient(api),
    prefs: UserPreferences(store),
    mdbListRepository: _FakeMdbListRepository(),
  );
}

List<String> _names(LibraryBrowseViewModel vm) =>
    vm.items.map((item) => item.name).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('search', () {
    test('narrows the list to matching names, case insensitively', () async {
      final api = _FakeItemsApi([
        [_movie('Alien'), _movie('Aliens'), _movie('Titanic')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      vm.setSearchQuery('ali');

      expect(_names(vm), <String>['Alien', 'Aliens']);
    });

    test('matches anywhere in the name, not just the start', () async {
      final api = _FakeItemsApi([
        [_movie('The Matrix'), _movie('Titanic')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      vm.setSearchQuery('matrix');

      expect(_names(vm), <String>['The Matrix']);
    });

    test('matches on the sort name when the server sends one', () async {
      final api = _FakeItemsApi([
        [_movie('The Matrix', sortName: 'Matrix, The')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      vm.setSearchQuery('matrix, the');

      expect(_names(vm), <String>['The Matrix']);
    });

    test('an empty query hands back every item', () async {
      final api = _FakeItemsApi([
        [_movie('Alien'), _movie('Titanic')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      vm.setSearchQuery('alien');
      expect(_names(vm), <String>['Alien']);

      vm.setSearchQuery('');
      expect(_names(vm), <String>['Alien', 'Titanic']);
    });

    test('repeated reads reuse one filtered list', () async {
      final api = _FakeItemsApi([
        [_movie('Alien'), _movie('Titanic')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();
      vm.setSearchQuery('alien');

      // The grid reads this from its item builders, so a fresh list per read
      // would rescan the whole library several times a frame.
      expect(identical(vm.items, vm.items), isTrue);
    });

    test('never asks the server to search, so paging stays coherent', () async {
      final api = _FakeItemsApi([
        [_movie('Alien')],
        [_movie('Titanic')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      vm.setSearchQuery('alien');
      await vm.loadMore();

      // A term on the request would leave the loaded items and the fetch
      // offset describing two different result sets.
      expect(api.searchTerms, everyElement(isNull));
    });
  });

  group('ensureItemsLoadedForPrefix', () {
    test('pages until a matching item arrives, then stops', () async {
      final api = _FakeItemsApi([
        [_movie('Alien')],
        [_movie('Blade Runner')],
        [_movie('Zulu')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();
      final afterFirstPage = api.pageRequests;

      final found = await vm.ensureItemsLoadedForPrefix('B');

      expect(found, isTrue);
      expect(
        api.pageRequests,
        afterFirstPage + 1,
        reason: 'it should stop as soon as the letter is present',
      );
    });

    test('reports failure once the library runs out', () async {
      final api = _FakeItemsApi([
        [_movie('Alien')],
        [_movie('Blade Runner')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      expect(await vm.ensureItemsLoadedForPrefix('Q'), isFalse);
    });

    test('the number bucket looks for names that do not start with a letter',
        () async {
      final api = _FakeItemsApi([
        [_movie('Alien')],
        [_movie('300')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();

      expect(await vm.ensureItemsLoadedForPrefix('#'), isTrue);
    });

    test('ALL and the empty string need no loading', () async {
      final api = _FakeItemsApi([
        [_movie('Alien')],
      ]);
      final vm = await _viewModel(api);
      addTearDown(vm.dispose);
      await vm.load();
      final requests = api.pageRequests;

      expect(await vm.ensureItemsLoadedForPrefix('ALL'), isTrue);
      expect(await vm.ensureItemsLoadedForPrefix(''), isTrue);
      expect(api.pageRequests, requests);
    });
  });
}
