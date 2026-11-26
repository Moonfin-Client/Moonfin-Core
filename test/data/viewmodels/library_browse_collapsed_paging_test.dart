import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Request {
  _Request(this.startIndex, this.limit, this.enableTotalRecordCount);

  final int startIndex;
  final int? limit;
  final bool? enableTotalRecordCount;
}

/// Serves [itemCount] items in order and, like Jellyfin, reports the page's
/// own length as the total when the count is turned off.
class _SlicingItemsApi implements ItemsApi {
  _SlicingItemsApi(this.itemCount);

  final int itemCount;
  final List<_Request> requests = <_Request>[];

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
  }) async {
    final start = startIndex ?? 0;
    requests.add(_Request(start, limit, enableTotalRecordCount));
    final end = limit == null ? itemCount : (start + limit).clamp(0, itemCount);
    final page = [
      for (var i = start; i < end; i++)
        <String, dynamic>{'Id': 'item-$i', 'Name': 'Item $i'},
    ];
    return <String, dynamic>{
      'TotalRecordCount': enableTotalRecordCount == false
          ? page.length
          : itemCount,
      'Items': page,
    };
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{'Name': 'Shows', 'CollectionType': 'tvshows'};

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.itemsApi, this.serverType);

  @override
  final ItemsApi itemsApi;

  @override
  final ServerType serverType;

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
  _SlicingItemsApi api, {
  required bool groupCollections,
  ServerType serverType = ServerType.jellyfin,
}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  await prefs.set(UserPreferences.groupItemsIntoCollections, groupCollections);
  return LibraryBrowseViewModel(
    libraryId: 'shows',
    client: _FakeClient(api, serverType),
    prefs: prefs,
    mdbListRepository: _FakeMdbListRepository(),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a collapsed browse asks for big pages and counts only the first',
      () async {
    final api = _SlicingItemsApi(640);
    final vm = await _viewModel(api, groupCollections: true);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();
    await vm.loadMore();

    expect(api.requests.map((r) => r.startIndex), <int>[0, 300, 600]);
    expect(api.requests.map((r) => r.limit), <int?>[300, 300, 300]);
    expect(
      api.requests.map((r) => r.enableTotalRecordCount),
      <bool?>[null, false, false],
    );
    expect(vm.items, hasLength(640));
    expect(vm.hasMore, isFalse);
  });

  test('a server that does not collapse keeps its usual paging', () async {
    final api = _SlicingItemsApi(640);
    final vm = await _viewModel(
      api,
      groupCollections: true,
      serverType: ServerType.silo,
    );
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();

    expect(api.requests.map((r) => r.limit), <int?>[75, 48]);
    expect(
      api.requests.map((r) => r.enableTotalRecordCount),
      everyElement(isNull),
    );
  });

  test('an uncollapsed browse keeps its usual paging', () async {
    final api = _SlicingItemsApi(640);
    final vm = await _viewModel(api, groupCollections: false);
    addTearDown(vm.dispose);

    await vm.load();
    await vm.loadMore();

    expect(api.requests.map((r) => r.limit), <int?>[75, 48]);
    expect(
      api.requests.map((r) => r.enableTotalRecordCount),
      everyElement(isNull),
    );
  });
}
