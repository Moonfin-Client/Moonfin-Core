import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A library with no collection type, the way the server reports a mixed one.
class _FakeItemsApi implements ItemsApi {
  final List<String?> requestedSorts = <String?>[];
  final List<bool?> requestedRecursive = <bool?>[];

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
    requestedSorts.add(sortBy);
    requestedRecursive.add(recursive);
    return <String, dynamic>{
      'TotalRecordCount': 2,
      'Items': [
        <String, dynamic>{'Id': 'series', 'Name': 'Loki', 'Type': 'Series'},
        <String, dynamic>{'Id': 'movie', 'Name': 'Eternals', 'Type': 'Movie'},
      ],
    };
  }

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => <String, dynamic>{'Name': 'Marvel'};

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
  LibrarySortBy? savedSort,
}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  if (savedSort != null) {
    await prefs.set(UserPreferences.librarySortBy('mixed'), savedSort);
  }
  return LibraryBrowseViewModel(
    libraryId: 'mixed',
    client: _FakeClient(api),
    prefs: prefs,
    mdbListRepository: _FakeMdbListRepository(),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('sorting a mixed library by name keeps shows and movies together', () async {
    final api = _FakeItemsApi();
    final vm = await _viewModel(api, savedSort: LibrarySortBy.name);

    await vm.load();

    expect(vm.sortBy, LibrarySortBy.name);
    expect(api.requestedSorts.first, 'SortName');
    expect(api.requestedRecursive.first, isFalse);
  });

  test('a mixed library with no saved sort opens with folders first', () async {
    final api = _FakeItemsApi();
    final vm = await _viewModel(api);

    await vm.load();

    expect(vm.sortBy, LibrarySortBy.foldersFirst);
    expect(api.requestedSorts.first, 'IsFolder,SortName');
  });

  test('a premiere date sort stays picked when the library opens again', () async {
    final api = _FakeItemsApi();
    final vm = await _viewModel(api, savedSort: LibrarySortBy.premiereDate);

    await vm.load();

    expect(vm.sortBy, LibrarySortBy.premiereDate);
    expect(api.requestedSorts.first, 'PremiereDate,SortName');
  });
}
