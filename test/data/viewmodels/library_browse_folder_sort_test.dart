import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/utils/genre_browse_utils.dart';
import 'package:moonfin/data/viewmodels/folder_browse_view_model.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A library with no collection type, the way the server reports a mixed one,
/// unless [collectionType] says otherwise.
class _FakeItemsApi implements ItemsApi {
  _FakeItemsApi({this.collectionType});

  final String? collectionType;
  final List<String?> requestedSorts = <String?>[];
  final List<bool?> requestedRecursive = <bool?>[];
  final List<List<String>?> requestedIncludes = <List<String>?>[];
  final List<List<String>?> requestedExcludes = <List<String>?>[];

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
    requestedIncludes.add(includeItemTypes);
    requestedExcludes.add(excludeItemTypes);
    if (includeItemTypes?.contains('Folder') ?? false) {
      return <String, dynamic>{
        'Items': [
          <String, dynamic>{
            'Id': 'folder',
            'Name': 'Phase One',
            'Type': 'Folder',
            'IsFolder': true,
          },
        ],
      };
    }
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
  }) async => <String, dynamic>{
    'Name': 'Marvel',
    'CollectionType': ?collectionType,
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

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

Future<LibraryBrowseViewModel> _viewModel(
  _FakeItemsApi api, {
  LibrarySortBy? savedSort,
  UserPreferences? prefs,
}) async {
  final usedPrefs = prefs ?? await _prefs();
  if (savedSort != null) {
    await usedPrefs.set(UserPreferences.librarySortBy('mixed'), savedSort);
  }
  return LibraryBrowseViewModel(
    libraryId: 'mixed',
    client: _FakeClient(api),
    prefs: usedPrefs,
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
    expect(api.requestedSorts, everyElement('SortName'));
  });

  test('folders first lists plain folders ahead of shows and movies, which '
      'keep their name order', () async {
    final api = _FakeItemsApi();
    final vm = await _viewModel(api);

    await vm.load();

    expect(api.requestedExcludes.first, containsAll(kDirectoryItemTypes));
    expect(api.requestedIncludes.last, kDirectoryItemTypes);
    expect(vm.items.map((item) => item.id), ['folder', 'series', 'movie']);
    expect(vm.totalCount, 3);
  });

  test('a sub-folder lists plain folders ahead of shows and movies, which '
      'keep their name order', () async {
    final api = _FakeItemsApi();
    final vm = FolderBrowseViewModel(_FakeClient(api));

    await vm.loadFolder('marvel');

    expect(api.requestedSorts, everyElement('SortName'));
    expect(vm.items.map((item) => item.id), ['folder', 'series', 'movie']);
    expect(vm.hasMore, isFalse);
  });

  test('a premiere date sort stays picked when the library opens again', () async {
    final api = _FakeItemsApi();
    final vm = await _viewModel(api, savedSort: LibrarySortBy.premiereDate);

    await vm.load();

    expect(vm.sortBy, LibrarySortBy.premiereDate);
    expect(api.requestedSorts.first, 'PremiereDate,SortName');
  });

  group('Folder View', () {
    test('a movies library starts flat and shows its folders once turned on, '
        'which it remembers', () async {
      final api = _FakeItemsApi(collectionType: 'movies');
      final prefs = await _prefs();
      final vm = await _viewModel(api, prefs: prefs);

      await vm.load();
      expect(vm.folderView, isFalse);
      expect(api.requestedIncludes.first, contains('Movie'));
      expect(api.requestedRecursive.first, isTrue);

      await vm.setFolderView(true);
      expect(vm.folderView, isTrue);
      expect(vm.sortBy, LibrarySortBy.foldersFirst);
      expect(api.requestedRecursive.last, isFalse);
      expect(api.requestedIncludes.last, kDirectoryItemTypes);
      expect(vm.items.first.id, 'folder');

      final reopened = await _viewModel(
        _FakeItemsApi(collectionType: 'movies'),
        prefs: prefs,
      );
      await reopened.load();
      expect(reopened.folderView, isTrue);
    });

    test('a mixed library turned off lists everything at once, without the '
        'folders and without the folders first sort', () async {
      final api = _FakeItemsApi();
      final vm = await _viewModel(api);
      await vm.load();
      expect(vm.folderView, isTrue);

      await vm.setFolderView(false);
      expect(vm.folderView, isFalse);
      expect(vm.sortBy, LibrarySortBy.name);
      expect(api.requestedRecursive.last, isTrue);
      expect(api.requestedExcludes.last, containsAll(kDirectoryItemTypes));
    });

    test('grouping steps aside while folders are shown', () async {
      final api = _FakeItemsApi(collectionType: 'movies');
      final vm = await _viewModel(api);
      await vm.load();
      await vm.setGroupBy(LibraryGroupBy.genres);
      expect(vm.isGrouping, isTrue);

      await vm.setFolderView(true);
      expect(vm.canGroup, isFalse);
      expect(vm.isGrouping, isFalse);
    });
  });
}
