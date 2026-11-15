import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/utils/merged_copies.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A server library sorted by name, answering each page from where it's
/// asked to start.
class _SortedItemsApi implements ItemsApi {
  _SortedItemsApi(this.titles, {this.fails = false});

  /// Each title, with the TMDB id it carries when it has one.
  final List<(String, String?)> titles;
  final bool fails;
  final requests = <(int, int)>[];

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
    if (fails) throw StateError('offline');
    final start = startIndex ?? 0;
    requests.add((start, limit ?? 0));
    final sorted = [...titles]..sort((a, b) => a.$1.compareTo(b.$1));
    return {
      'TotalRecordCount': sorted.length,
      'Items': [
        for (final (title, tmdb) in sorted.skip(start).take(limit ?? 100))
          {
            'Id': '$parentId-$title',
            'Name': title,
            'SortName': title,
            'Type': 'Movie',
            'ProviderIds': {'Tmdb': ?tmdb},
          },
      ],
    };
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.itemsApi);

  @override
  final ItemsApi itemsApi;

  @override
  String get baseUrl => 'http://active';

  @override
  String? get userId => 'user';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeMdbListRepository implements MdbListRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

MergedLibrarySource _source(String serverId, _SortedItemsApi api) => (
  session: ServerUserSession(
    server: Server(
      id: serverId,
      name: serverId,
      address: 'http://$serverId',
      version: '10.11.0',
      serverType: ServerType.jellyfin,
      dateAdded: DateTime(2026),
    ),
    userId: 'user',
    client: _FakeClient(api),
  ),
  libraryId: serverId,
);

Future<LibraryBrowseViewModel> _viewModel(
  List<MergedLibrarySource> sources,
) async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return LibraryBrowseViewModel(
    libraryId: mergedLibraryId('movies'),
    client: _FakeClient(_SortedItemsApi(const [])),
    prefs: UserPreferences(store),
    mdbListRepository: _FakeMdbListRepository(),
    loadMergedLibrary: () async => (name: 'Movies', sources: sources),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('every server pages in by name, with shared titles shown once', () async {
    final a = _SortedItemsApi([
      for (var i = 0; i < 60; i += 2) ('a${i.toString().padLeft(3, '0')}', null),
      ('shared', '603'),
    ]);
    final b = _SortedItemsApi([
      for (var i = 1; i < 60; i += 2) ('a${i.toString().padLeft(3, '0')}', null),
      ('shared', '603'),
    ]);
    final vm = await _viewModel([_source('a', a), _source('b', b)]);
    addTearDown(vm.dispose);

    await vm.load();
    while (vm.hasMore) {
      await vm.loadMore();
    }

    final names = vm.items.map((item) => item.name).toList();
    expect(names, [...names]..sort());
    expect(names.where((name) => name == 'shared'), hasLength(1));
    expect(names, hasLength(61));
    expect(vm.totalCount, 61);
    final shared = vm.items.singleWhere((item) => item.name == 'shared');
    expect(copiesOf(shared).map((copy) => copy.serverId), ['a', 'b']);
    expect(vm.items.firstWhere((item) => item.name == 'a001').serverId, 'b');
    // Each server is asked from where it left off, not from the list's count.
    expect(a.requests.first.$1, 0);
    expect(a.requests.skip(1).every((request) => request.$1 > 0), isTrue);
  });

  test('a server that fails leaves the others browsing', () async {
    final vm = await _viewModel([
      _source('a', _SortedItemsApi([('one', null), ('two', null)])),
      _source('b', _SortedItemsApi(const [], fails: true)),
    ]);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.state, LibraryBrowseState.ready);
    expect(vm.items.map((item) => item.name), ['one', 'two']);
    expect(vm.hasMore, isFalse);
  });

  test('every server failing is an error, not an empty library', () async {
    final vm = await _viewModel([
      _source('a', _SortedItemsApi(const [], fails: true)),
      _source('b', _SortedItemsApi(const [], fails: true)),
    ]);
    addTearDown(vm.dispose);

    await vm.load();

    expect(vm.state, LibraryBrowseState.error);
  });
}
