import 'dart:async';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
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
    this.played = const {},
    this.ratings = const {},
    this.lightGate,
    this.pageCap,
  });

  /// Each title, with the TMDB id it carries when it has one.
  final List<(String, String?)> titles;
  final bool fails;

  /// The original title of each title that has one.
  final Map<String, String> originals;

  /// Titles the server lists among its provider ids but never pages in, like
  /// one hidden from this user after the list was read.
  final List<(String, String?)> listedOnly;

  /// Titles this user has watched, left out by the unplayed filter.
  final Set<String> played;

  /// The rating of each title that has one.
  final Map<String, String> ratings;
  final requests = <(int, int)>[];

  /// How many times the whole library was read for its provider ids.
  var lightReads = 0;

  /// Holds the whole-library read back until it completes, like a slow
  /// server far away.
  final Future<void>? lightGate;

  /// The most items one request answers with, whatever it asks for.
  final int? pageCap;

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
    if (fails) throw StateError('offline');
    final start = startIndex ?? 0;
    final light = fields?.startsWith('ProviderIds') ?? false;
    if (light) {
      lightReads++;
      await lightGate;
    } else {
      requests.add((start, limit ?? 0));
    }
    final unplayed = filters?.contains('IsUnplayed') ?? false;
    final sorted = [
      for (final title in [...titles, if (light) ...listedOnly])
        if (!unplayed || !played.contains(title.$1)) title,
    ]..sort((a, b) => a.$1.compareTo(b.$1));
    return {
      'TotalRecordCount': sorted.length,
      'Items': [
        for (final (title, tmdb)
            in sorted.skip(start).take(min(limit ?? 100, pageCap ?? 100000)))
          {
            'Id': '$parentId-$title',
            'Name': title,
            'SortName': title,
            'Type': 'Movie',
            'ProviderIds': {'Tmdb': ?tmdb},
            'OriginalTitle': ?originals[title],
            'OfficialRating': ?ratings[title],
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

  group('a copy paging has not reached', () {
    // Server a's first page ends long before server b's copy of the shared
    // title, which sorts last there under another name.
    List<MergedLibrarySource> sources({
      Set<String> played = const {},
      Map<String, String> ratings = const {},
      Future<void>? slow,
      List<(String, String?)> before = const [],
      int? pageCap,
    }) => [
      _source(
        'a',
        _SortedItemsApi([
          ('Aaa Vortelle', '1001'),
          for (var i = 0; i < 200; i++)
            ('b${i.toString().padLeft(3, '0')}', null),
        ]),
      ),
      _source(
        'b',
        _SortedItemsApi(
          [...before, ('Zz Vortelle', '1001')],
          played: played,
          ratings: ratings,
          lightGate: slow,
          pageCap: pageCap,
        ),
      ),
    ];

    List<String> serversOfFirstCard(LibraryBrowseViewModel vm) => [
      for (final copy in copiesOf(vm.items.first)) copy.serverId,
    ];

    test('joins its card once the index is in', () async {
      final vm = await _viewModel(sources());
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();

      expect(vm.items.first.name, 'Aaa Vortelle');
      expect(serversOfFirstCard(vm), ['a', 'b']);
    });

    test('is read with each server once for the index and the first '
        "server's titles together", () async {
      final list = sources();
      final vm = await _viewModel(list);
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();

      for (final source in list) {
        final api = source.session.client.itemsApi as _SortedItemsApi;
        expect(api.lightReads, 1);
      }
    });

    test('stays off the card when the filter on leaves it out', () async {
      final vm = await _viewModel(sources(played: {'Zz Vortelle'}));
      addTearDown(vm.dispose);
      await vm.setPlayedFilter(PlayedStatusFilter.unwatched);
      await pumpEventQueue();

      expect(vm.items.first.name, 'Aaa Vortelle');
      expect(serversOfFirstCard(vm), ['a']);
    });

    test('stays off the card when the viewer blocked its rating', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.blockedParentalRatings, 'Rated-Q');
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      addTearDown(() async {
        await GetIt.instance.reset();
        resetParentalFilterCache();
      });

      final vm = await _viewModel(sources(ratings: {'Zz Vortelle': 'Rated-Q'}));
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();

      expect(serversOfFirstCard(vm), ['a']);
    });

    test("shows the first page without waiting on a slow server's whole "
        'library', () async {
      final slow = Completer<void>();
      final vm = await _viewModel(sources(slow: slow.future));
      addTearDown(vm.dispose);

      await vm.load().timeout(const Duration(seconds: 2));
      expect(vm.items.first.name, 'Aaa Vortelle');
      expect(serversOfFirstCard(vm), ['a']);

      slow.complete();
      await pumpEventQueue();
      expect(serversOfFirstCard(vm), ['a', 'b']);
    });

    test('gives way to the full copy once paging reaches it', () async {
      final vm = await _viewModel(sources());
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();
      expect(copiesOf(vm.items.first)[1].rawData['SortName'], isNull);

      while (vm.hasMore) {
        await vm.loadMore();
      }

      final copies = copiesOf(vm.items.first);
      expect(copies.map((copy) => copy.serverId), ['a', 'b']);
      expect(copies[1].rawData['SortName'], 'Zz Vortelle');
      expect(vm.items.map((item) => item.name), isNot(contains('Zz Vortelle')));
      expect(vm.totalCount, vm.items.length);
    });

    test('is read once, and kept when the browse loads again', () async {
      final list = sources();
      final vm = await _viewModel(list);
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();
      await vm.load();
      await pumpEventQueue();

      for (final source in list) {
        final api = source.session.client.itemsApi as _SortedItemsApi;
        expect(api.lightReads, 1);
      }
      expect(serversOfFirstCard(vm), ['a', 'b']);
    });

    test(
      'is found when a server answers in pages shorter than asked',
      () async {
        final vm = await _viewModel(
          sources(
            before: [
              for (var i = 0; i < 150; i++)
                ('C${i.toString().padLeft(3, '0')}', null),
            ],
            pageCap: 50,
          ),
        );
        addTearDown(vm.dispose);
        await vm.load();
        await pumpEventQueue();

        expect(vm.items.first.name, 'Aaa Vortelle');
        expect(serversOfFirstCard(vm), ['a', 'b']);
      },
    );

    test(
      'is read again under the unplayed filter once it is watched',
      () async {
        final played = <String>{};
        final vm = await _viewModel(sources(played: played));
        addTearDown(vm.dispose);
        await vm.setPlayedFilter(PlayedStatusFilter.unwatched);
        await pumpEventQueue();
        expect(serversOfFirstCard(vm), ['a', 'b']);

        played.add('Zz Vortelle');
        await vm.load();
        await pumpEventQueue();

        expect(serversOfFirstCard(vm), ['a']);
      },
    );

    test('is read again on a refresh, though not on a plain reload', () async {
      final list = sources();
      final vm = await _viewModel(list);
      addTearDown(vm.dispose);
      await vm.load();
      await pumpEventQueue();
      await vm.load();
      await pumpEventQueue();
      await vm.refresh();
      await pumpEventQueue();

      for (final source in list) {
        final api = source.session.client.itemsApi as _SortedItemsApi;
        expect(api.lightReads, 2);
      }
    });
  });
}
