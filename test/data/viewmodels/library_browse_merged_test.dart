import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/utils/merged_copies.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A server library sorted by name, answering each page from where it's
/// asked to start.
class _SortedItemsApi implements ItemsApi {
  _SortedItemsApi(
    this.titles, {
    this.fails = false,
    this.originals = const {},
    this.listedOnly = const [],
  });

  /// Each title, with the TMDB id it carries when it has one.
  final List<(String, String?)> titles;
  final bool fails;

  /// The original title of each title that has one.
  final Map<String, String> originals;

  /// Titles the server lists among its provider ids but never pages in, like
  /// one hidden from this user after the list was read.
  final List<(String, String?)> listedOnly;
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
    final sorted = [...titles, if (fields == 'ProviderIds') ...listedOnly]
      ..sort((a, b) => a.$1.compareTo(b.$1));
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
            'OriginalTitle': ?originals[title],
          },
      ],
    };
  }

  /// Each server's library id stands in for the genre only it holds.
  @override
  Future<QueryFilterValues> getQueryFilters({
    String? parentId,
    List<String>? includeItemTypes,
  }) async => QueryFilterValues(genres: [?parentId]);

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
  List<MergedLibrarySource> sources, {
  Future<MergedLibrary> Function()? lookup,
}) async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return LibraryBrowseViewModel(
    libraryId: mergedLibraryId('movies'),
    client: _FakeClient(_SortedItemsApi(const [])),
    prefs: UserPreferences(store),
    mdbListRepository: _FakeMdbListRepository(),
    loadMergedLibrary:
        lookup ??
        () async => (name: 'Movies', sources: sources, complete: true),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'every server pages in by name, with shared titles shown once',
    () async {
      final a = _SortedItemsApi([
        for (var i = 0; i < 60; i += 2)
          ('a${i.toString().padLeft(3, '0')}', null),
        ('shared', '603'),
      ]);
      final b = _SortedItemsApi([
        for (var i = 1; i < 60; i += 2)
          ('a${i.toString().padLeft(3, '0')}', null),
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
      final pages = a.requests.where((request) => request.$2 > 0);
      expect(pages.first.$1, 0);
      expect(pages.skip(1).every((request) => request.$1 > 0), isTrue);
    },
  );

  test('the search box finds a card by any copy\'s title or the original '
      'title', () async {
    final vm = await _viewModel([
      _source(
        'a',
        _SortedItemsApi(
          [('The Lord of the Rings', '120'), ('Amélie', '194')],
          originals: {'Amélie': "Le Fabuleux Destin d'Amélie Poulain"},
        ),
      ),
      _source(
        'b',
        _SortedItemsApi([
          ('Le Seigneur des Anneaux', '120'),
          ('Die fabelhafte Welt der Amélie', '194'),
        ]),
      ),
    ]);
    addTearDown(vm.dispose);
    await vm.load();

    vm.setSearchQuery('seigneur');
    expect(vm.items.map((item) => item.name), ['The Lord of the Rings']);
    vm.setSearchQuery('fabuleux');
    expect(vm.items.map((item) => item.name), ['Amélie']);
  });

  test(
    'loading everything carries on past a page that only held copies',
    () async {
      String name(String prefix, int i) =>
          '$prefix${i.toString().padLeft(3, '0')}';
      final vm = await _viewModel([
        _source(
          'a',
          _SortedItemsApi([
            for (var i = 0; i < 600; i++) (name('a', i), '${i + 1}'),
          ]),
        ),
        _source(
          'b',
          _SortedItemsApi([
            for (var i = 0; i < 600; i++) (name('z', i), '${i + 1}'),
            ('zzzz', null),
          ]),
        ),
      ]);
      addTearDown(vm.dispose);
      await vm.load();

      await vm.ensureAllItemsLoaded();

      expect(vm.items, hasLength(601));
      expect(vm.items.last.name, 'zzzz');
    },
  );

  group("the first server's copy is the card", () {
    List<MergedLibrarySource> sources({
      List<(String, String?)> listedOnly = const [],
    }) => [
      _source(
        'a',
        _SortedItemsApi([
          ('Alpha', '1'),
          ('The Lord of the Rings', '120'),
        ], listedOnly: listedOnly),
      ),
      _source(
        'b',
        _SortedItemsApi([
          ('Beta', '2'),
          ('Le Seigneur des Anneaux', '120'),
          ('Spectre', '9'),
        ]),
      ),
    ];

    test('at its own place, even when the other copy sorts first', () async {
      final vm = await _viewModel(sources());
      addTearDown(vm.dispose);
      await vm.load();

      expect(vm.items.map((item) => item.name), [
        'Alpha',
        'Beta',
        'Spectre',
        'The Lord of the Rings',
      ]);
      expect(copiesOf(vm.items.last).map((copy) => copy.serverId), ['a', 'b']);
    });

    test('but the first copy keeps the card while a filter is on', () async {
      final vm = await _viewModel(sources());
      addTearDown(vm.dispose);
      await vm.setPlayedFilter(PlayedStatusFilter.unwatched);

      expect(
        vm.items.map((item) => item.name),
        contains('Le Seigneur des Anneaux'),
      );
    });

    test(
      'a copy that waited for a card that never came shows at the end',
      () async {
        final vm = await _viewModel(sources(listedOnly: [('Spectre', '9')]));
        addTearDown(vm.dispose);
        await vm.load();

        expect(vm.items.map((item) => item.name), [
          'Alpha',
          'Beta',
          'The Lord of the Rings',
          'Spectre',
        ]);
        expect(vm.totalCount, 4);
      },
    );
  });

  test(
    'a search is still filling until it has read the whole library',
    () async {
      final vm = await _viewModel([
        _source(
          'a',
          _SortedItemsApi([
            for (var i = 0; i < 200; i++)
              ('a${i.toString().padLeft(3, '0')}', null),
          ]),
        ),
        _source('b', _SortedItemsApi(const [('zebra', null)])),
      ]);
      addTearDown(vm.dispose);
      await vm.load();
      expect(vm.hasMore, isTrue);

      vm.setSearchQuery('zebra');
      expect(vm.items, isEmpty);
      expect(vm.searchFilling, isTrue);

      while (vm.searchFilling) {
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }
      expect(vm.items.map((item) => item.name), ['zebra']);
    },
  );

  test('a search with nothing left to read is done at once', () async {
    final vm = await _viewModel([
      _source('a', _SortedItemsApi(const [('alpha', null)])),
      _source('b', _SortedItemsApi(const [('beta', null)])),
    ]);
    addTearDown(vm.dispose);
    await vm.load();

    vm.setSearchQuery('zebra');
    expect(vm.items, isEmpty);
    expect(vm.searchFilling, isFalse);
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

  test(
    'a server that answers a retried lookup adds its filter values',
    () async {
      final a = _source('a', _SortedItemsApi(const [('Alpha', '1')]));
      final b = _source('b', _SortedItemsApi(const [('Beta', '2')]));
      var lookups = 0;
      final vm = await _viewModel(
        const [],
        lookup: () async => ++lookups == 1
            ? (name: 'Movies', sources: [a], complete: false)
            : (name: 'Movies', sources: [a, b], complete: true),
      );
      await vm.load();
      await vm.ensureFacetValuesLoaded();
      expect(vm.facetValues.genres, ['a']);

      await vm.load();
      await pumpEventQueue();
      expect(vm.facetValues.genres, ['a', 'b']);
    },
  );

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
