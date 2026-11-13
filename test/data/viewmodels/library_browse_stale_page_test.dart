import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Answers each items request only when the test completes it, so requests
/// can come back in any order.
class _HeldItemsApi implements ItemsApi {
  final List<Completer<List<int>>> pending = <Completer<List<int>>>[];
  final List<int> requestedStartIndexes = <int>[];
  int totalRecordCount = 100;

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
    bool? enableUserData,
    bool? enableImages,
  }) async {
    // The folders that lead a library page: none here, answered at once.
    if (enableTotalRecordCount == false) {
      return <String, dynamic>{'Items': const <dynamic>[]};
    }
    requestedStartIndexes.add(startIndex ?? 0);
    final completer = Completer<List<int>>();
    pending.add(completer);
    final page = await completer.future;
    return <String, dynamic>{
      'TotalRecordCount': totalRecordCount,
      'Items': [
        for (final id in page)
          <String, dynamic>{
            'Id': 'item-$id',
            'Name': 'Item $id',
            ...?itemFields[id],
          },
      ],
    };
  }

  /// Extra fields for an item, read when its page is answered.
  final itemFields = <int, Map<String, dynamic>>{};

  /// When set, the library lookup waits for it as well.
  Completer<void>? heldItem;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    await heldItem?.future;
    return <String, dynamic>{'Name': 'Movies'};
  }

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
  _HeldItemsApi api, {
  List<String>? includeItemTypes,
}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return LibraryBrowseViewModel(
    libraryId: 'movies',
    client: _FakeClient(api),
    prefs: UserPreferences(store),
    mdbListRepository: _FakeMdbListRepository(),
    includeItemTypes: includeItemTypes,
  );
}

List<String> _ids(LibraryBrowseViewModel vm) =>
    vm.items.map((item) => item.id).toList();

/// Lets the view model run until [count] items requests are waiting.
Future<void> _requests(_HeldItemsApi api, int count) async {
  for (var i = 0; i < 200 && api.pending.length < count; i++) {
    await pumpEventQueue();
  }
  expect(api.pending, hasLength(count));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a reload answered after a newer one doesn\'t replace it', () async {
    final api = _HeldItemsApi();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    // A filter changed twice in a row: two loads in flight.
    final first = vm.load();
    await _requests(api, 1);
    final second = vm.load();
    await _requests(api, 2);

    // The newer list comes back first, the older one after it.
    api.pending[1].complete([20, 21, 22]);
    await second;
    api.pending[0].complete([10, 11, 12]);
    await first;

    expect(_ids(vm), ['item-20', 'item-21', 'item-22']);
    expect(vm.state, LibraryBrowseState.ready);
  });

  test('a scroll page still in flight stays out of the reloaded list', () async {
    final api = _HeldItemsApi()..totalRecordCount = 100;
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    final initial = vm.load();
    await _requests(api, 1);
    api.pending[0].complete([1, 2, 3, 4]);
    await initial;

    // Scrolling asks for the next page, then the sort changes before it lands.
    final more = vm.loadMore();
    await _requests(api, 2);
    final reload = vm.load();
    await _requests(api, 3);

    api.pending[1].complete([5, 6, 7, 8]);
    await more;
    api.pending[2].complete([5, 6, 1, 2]);
    await reload;

    // The reloaded list keeps items the old page also had, and nothing else
    // from it.
    expect(_ids(vm), ['item-5', 'item-6', 'item-1', 'item-2']);
    expect(vm.hasMore, isTrue);

    final next = vm.loadMore();
    await _requests(api, 4);
    api.pending[3].complete([30]);
    await next;

    // Paging carries on from the reloaded list's own offset.
    expect(api.requestedStartIndexes.last, 4);
    expect(_ids(vm).last, 'item-30');
  });

  test('a reload started during the library lookup keeps one first page', () async {
    final api = _HeldItemsApi()..heldItem = Completer<void>();
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    // Both loads wait on the library lookup before asking for their page.
    final first = vm.load();
    await pumpEventQueue();
    final second = vm.load();
    await pumpEventQueue();
    api.heldItem!.complete();
    await _requests(api, 2);

    // The newer page lands first, then the superseded one with the same ids.
    api.pending[1].complete([1, 2]);
    api.pending[0].complete([1, 2]);
    await second;
    await first;

    expect(_ids(vm), ['item-1', 'item-2']);
    expect(vm.state, LibraryBrowseState.ready);
  });

  test('the reloaded list can page while the old page is still out', () async {
    final api = _HeldItemsApi()..totalRecordCount = 100;
    final vm = await _viewModel(api);
    addTearDown(vm.dispose);

    final initial = vm.load();
    await _requests(api, 1);
    api.pending[0].complete([1, 2, 3, 4]);
    await initial;

    final oldPage = vm.loadMore();
    await _requests(api, 2);
    final reload = vm.load();
    await _requests(api, 3);
    api.pending[2].complete([11, 12, 13, 14]);
    await reload;

    // The old scroll page is still out, and the new list asks for its own.
    final newPage = vm.loadMore();
    await _requests(api, 4);
    expect(api.requestedStartIndexes.last, 4);

    // The old page landing now shouldn't release the new page's flag either.
    api.pending[1].complete([5, 6, 7, 8]);
    await oldPage;
    expect(vm.loadingMore, isTrue);

    api.pending[3].complete([15, 16]);
    await newPage;
    expect(_ids(vm), [
      'item-11',
      'item-12',
      'item-13',
      'item-14',
      'item-15',
      'item-16',
    ]);
  });

  test('a superseded page leaves the playlist categories alone', () async {
    final api = _HeldItemsApi();
    final vm = await _viewModel(api, includeItemTypes: const ['Playlist']);
    addTearDown(vm.dispose);

    final first = vm.load();
    await _requests(api, 1);
    final second = vm.load();
    await _requests(api, 2);

    // The older answer reads the same playlist differently, the way a lookup
    // that failed and fell back would.
    api.itemFields[1] = {'Type': 'Playlist', 'MediaType': 'Photo'};
    api.pending[1].complete([1]);
    await second;
    api.itemFields[1] = {'Type': 'Playlist', 'MediaType': 'Book'};
    api.pending[0].complete([1]);
    await first;

    expect(vm.categoryForPlaylist(vm.items.single), 'Photo');
  });
}
