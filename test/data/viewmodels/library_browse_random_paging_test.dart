import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeItemsApi implements ItemsApi {
  _FakeItemsApi(this.pages, {required this.totalRecordCount});

  /// One entry per page the server answers with, holding the item ids.
  final List<List<int>> pages;
  final int totalRecordCount;
  final List<int> requestedStartIndexes = <int>[];

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
    requestedStartIndexes.add(startIndex ?? 0);
    final page = _pageCursor < pages.length ? pages[_pageCursor] : const <int>[];
    _pageCursor++;
    return <String, dynamic>{
      'TotalRecordCount': totalRecordCount,
      'Items': [
        for (final id in page)
          <String, dynamic>{'Id': 'item-$id', 'Name': 'Item $id'},
      ],
    };
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{'Name': 'Movies'};

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
  final prefs = UserPreferences(store);
  await prefs.set(
    UserPreferences.librarySortBy('movies'),
    LibrarySortBy.random,
  );
  return LibraryBrowseViewModel(
    libraryId: 'movies',
    client: _FakeClient(api),
    prefs: prefs,
    mdbListRepository: _FakeMdbListRepository(),
  );
}

List<String> _ids(LibraryBrowseViewModel vm) =>
    vm.items.map((item) => item.id).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('an item the server repeats across pages is only shown once', () async {
    // The second page overlaps the first, which is what a random sort does:
    // the server reshuffles per request, so windows come from different orders.
    final api = _FakeItemsApi(
      [
        [1, 2, 3, 4],
        [3, 4, 5, 6],
      ],
      totalRecordCount: 8,
    );
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();

    expect(_ids(vm), <String>[
      'item-1',
      'item-2',
      'item-3',
      'item-4',
      'item-5',
      'item-6',
    ]);
  });

  test('the next page starts where the server left off, not where the '
      'surviving items end', () async {
    final api = _FakeItemsApi(
      [
        [1, 2, 3, 4],
        [3, 4, 5, 6],
        [7, 8],
      ],
      totalRecordCount: 10,
    );
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();
    await vm.loadMore();

    // Six items are on screen after two pages, but the server has handed back
    // eight rows, so the third page has to ask from eight.
    expect(api.requestedStartIndexes, <int>[0, 4, 8]);
  });

  test('a page that repeats everything already shown keeps browsing open', () async {
    final api = _FakeItemsApi(
      [
        [1, 2, 3, 4],
        [1, 2, 3, 4],
        [5, 6],
      ],
      totalRecordCount: 6,
    );
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();

    expect(vm.hasMore, isTrue, reason: 'the server still has rows left');

    await vm.loadMore();

    expect(_ids(vm), <String>[
      'item-1',
      'item-2',
      'item-3',
      'item-4',
      'item-5',
      'item-6',
    ]);
  });

  test('browsing ends once the server runs out of rows', () async {
    final api = _FakeItemsApi(
      [
        [1, 2],
        <int>[],
      ],
      totalRecordCount: 4,
    );
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();

    expect(vm.hasMore, isFalse);
  });
}
