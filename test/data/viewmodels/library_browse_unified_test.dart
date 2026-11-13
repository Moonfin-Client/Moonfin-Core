import 'dart:async';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/unified_catalog_fakes.dart';

class _CountingCatalog extends UnifiedCatalogService {
  _CountingCatalog({
    required super.database,
    required super.loadSessions,
    required super.activeServerId,
    super.now,
    super.retryDelay,
    super.confirmDelay,
    super.userDataDebounce,
    super.userDataRetryDelay,
    super.frameBudget,
  });

  int lookups = 0;

  @override
  Map<String, dynamic>? currentItem(
    UnifiedLibraryKind kind,
    String serverId,
    String itemId,
  ) {
    lookups++;
    return super.currentItem(kind, serverId, itemId);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late _CountingCatalog catalog;
  late List<ServerUserSession> sessions;
  late FakeCatalogServer a;
  late FakeCatalogServer b;
  late UserPreferences prefs;
  late DateTime now;

  /// While set, the catalog waits on it before learning who is signed in.
  Completer<void>? sessionsGate;

  Future<LibraryBrowseViewModel> viewModel({
    UnifiedLibraryKind kind = UnifiedLibraryKind.movies,
  }) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    final vm = LibraryBrowseViewModel(
      libraryId: '',
      client: UntouchedClient(),
      prefs: prefs,
      mdbListRepository: FakeMdbListRepository(),
      includeItemTypes: [kind.itemType],
      overrideName: 'Movies',
      unifiedKind: kind,
      unifiedCatalog: catalog,
    );
    addTearDown(vm.dispose);
    return vm;
  }

  List<String> names(LibraryBrowseViewModel vm) =>
      vm.items.map((item) => item.name).toList();

  setUp(() {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    now = unifiedTestNow;
    sessionsGate = null;
    // Tests that read servers call signInToFakeServers() to swap these for
    // the two fakes.
    sessions = [
      for (final id in ['a', 'b']) fakeSession(id, client: UntouchedClient()),
    ];
    a = FakeCatalogServer('a')..stubApis();
    b = FakeCatalogServer('b')..stubApis();
    catalog = _CountingCatalog(
      database: db,
      loadSessions: () async {
        await sessionsGate?.future;
        return sessions;
      },
      activeServerId: () => 'a',
      now: () => now,
      retryDelay: Duration.zero,
      confirmDelay: Duration.zero,
      userDataDebounce: Duration.zero,
      userDataRetryDelay: Duration.zero,
      // Long enough that no test depends on how fast the machine is.
      frameBudget: const Duration(hours: 1),
    );
  });

  tearDown(() async {
    catalog.dispose();
    userDataSync.reset();
    resetParentalFilterCache();
    await GetIt.instance.reset();
    await db.close();
  });

  void signInToFakeServers() => sessions = [a.session, b.session];

  List<Map<String, dynamic>> numbered(String serverId, Iterable<int> numbers) =>
      [
        for (final i in numbers)
          catalogMovie('$serverId$i', 'Movie ${'$i'.padLeft(3, '0')}'),
      ];

  bool played(LibraryBrowseViewModel vm, String name) =>
      (vm.items.firstWhere((item) => item.name == name).rawData['UserData']
          as Map)['Played'] ==
      true;

  test(
    'lists both servers, a shared title once, each under its server',
    () async {
      await seedCatalog(db, 'a', [
        catalogMovie('a1', 'Altovar', tmdb: '1001'),
        catalogMovie('a2', 'Hodrimel'),
      ]);
      await seedCatalog(db, 'b', [
        catalogMovie('b1', 'Altovar', tmdb: '1001'),
        catalogMovie('b2', 'Rusquin'),
      ]);
      final vm = await viewModel();

      await vm.load();

      expect(vm.state, LibraryBrowseState.ready);
      expect(vm.libraryName, 'Movies');
      expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
      expect(vm.totalCount, 3);
      expect([for (final item in vm.items) item.serverId], ['a', 'a', 'b']);
      expect(unifiedCopiesOf(vm.items.first.rawData), hasLength(2));
    },
  );

  test('pages through a catalog larger than one page', () async {
    await seedCatalog(db, 'a', [
      for (var i = 0; i < 100; i++)
        catalogMovie('a$i', 'Movie ${'$i'.padLeft(3, '0')}'),
    ]);
    await seedCatalog(db, 'b', [
      for (var i = 100; i < 200; i++)
        catalogMovie('b$i', 'Movie ${'$i'.padLeft(3, '0')}'),
    ]);
    final vm = await viewModel();

    await vm.load();
    expect(vm.items.length, lessThan(200));
    expect(vm.hasMore, isTrue);

    await vm.ensureAllItemsLoaded();
    expect(vm.items, hasLength(200));
    expect(vm.hasMore, isFalse);
    expect(names(vm), [...names(vm)]..sort());
  });

  test('two servers reusing an id keep both of their titles', () async {
    await seedCatalog(db, 'a', [catalogMovie('7', 'Altovar')]);
    await seedCatalog(db, 'b', [catalogMovie('7', 'Rusquin')]);
    final vm = await viewModel();

    await vm.load();

    expect(names(vm), ['Altovar', 'Rusquin']);
  });

  test('sorts and filters without asking any server', () async {
    await seedCatalog(db, 'a', [
      catalogMovie('a1', 'Altovar', added: '2020-01-01', played: true),
      catalogMovie('a2', 'Hodrimel', added: '2026-01-01'),
    ]);
    await seedCatalog(db, 'b', [
      catalogMovie('b1', 'Rusquin', added: '2023-01-01'),
    ]);
    final vm = await viewModel();
    await vm.load();

    await vm.setSortBy(LibrarySortBy.dateAdded);
    await vm.setSortDirection(SortDirection.descending);
    expect(names(vm), ['Hodrimel', 'Rusquin', 'Altovar']);

    await vm.setPlayedFilter(PlayedStatusFilter.watched);
    expect(names(vm), ['Altovar']);
  });

  test('searches across every server, past the first page', () async {
    await seedCatalog(db, 'a', [
      for (var i = 0; i < 100; i++)
        catalogMovie('a$i', 'Movie ${'$i'.padLeft(3, '0')}'),
      catalogMovie('az', 'Zintry'),
    ]);
    await seedCatalog(db, 'b', [
      for (var i = 100; i < 200; i++)
        catalogMovie('b$i', 'Movie ${'$i'.padLeft(3, '0')}'),
      catalogMovie('bz', 'Zintry Crossing'),
    ]);
    final vm = await viewModel();
    await vm.load();
    expect(vm.hasMore, isTrue);

    fakeAsync((async) {
      vm.setSearchQuery('zintry');
      // Both matches sort after every title on the first page.
      expect(names(vm), isEmpty);
      // Wait past the pause that lets the typing stop.
      async.elapse(const Duration(milliseconds: 400));
      async.flushTimers();

      expect(names(vm), ['Zintry', 'Zintry Crossing']);
      expect([for (final item in vm.items) item.serverId], ['a', 'b']);
    });
  });

  group('a search stays over the whole list', () {
    // Each match sorts after every title on the first page.
    Future<void> settle() async {
      for (var i = 0; i < 5; i++) {
        await pumpEventQueue();
      }
    }

    test('when the list is loaded with the query already typed', () async {
      await seedCatalog(db, 'a', numbered('a', [for (var i = 0; i < 800; i++) i]));
      await seedCatalog(db, 'b', [catalogMovie('bz', 'Zintry')]);
      final vm = await viewModel();
      // Nothing is loaded yet, so this starts no page walk of its own.
      vm.setSearchQuery('zintry');

      await vm.load();
      await settle();

      expect(names(vm), ['Zintry']);
    });

    test('when a catalog change rebuilds the list mid walk', () async {
      await seedCatalog(db, 'a', numbered('a', [for (var i = 0; i < 800; i++) i]));
      await seedCatalog(db, 'b', [catalogMovie('bz', 'Zintry')]);
      final vm = await viewModel();
      await vm.load();
      // Wait past the check made on opening, which lets changes straight in.
      await pumpEventQueue();
      await catalog.removeCopy('a', 'a0');
      expect(vm.hasPendingCatalogUpdate, isTrue);

      vm.setSearchQuery('zintry');
      // The walk the query starts once the typing stops, here without the
      // wait, so the rebuild lands while it is still paging.
      unawaited(vm.ensureAllItemsLoaded());
      await vm.applyCatalogUpdate();
      expect(vm.hasMore, isTrue);
      await settle();

      expect(names(vm), ['Zintry']);
    });

    test('when a refresh brings another match', () async {
      signInToFakeServers();
      a.movies = numbered('a', [for (var i = 0; i < 300; i++) i]);
      b.movies = [catalogMovie('bz', 'Zintry')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      vm.setSearchQuery('zintry');
      await vm.load();
      await settle();

      b.movies = [...b.movies, catalogMovie('by', 'Zintry Crossing')];
      await vm.refreshCatalog();
      await settle();

      expect(names(vm), ['Zintry', 'Zintry Crossing']);
    });

    test('and a list already complete is not walked again', () async {
      await seedCatalog(db, 'a', [catalogMovie('a1', 'Altovar')]);
      await seedCatalog(db, 'b', [catalogMovie('bz', 'Zintry')]);
      final vm = await viewModel();
      vm.setSearchQuery('zintry');
      await vm.load();
      await settle();
      var notified = 0;
      vm.addListener(() => notified++);

      await vm.load();
      await settle();

      expect(names(vm), ['Zintry']);
      // One for the loading state and one for the list, none for a page.
      expect(notified, 2);
    });
  });

  test('offers only the sorts and filters the stored catalog can '
      'answer', () async {
    await seedCatalog(db, 'a', [catalogMovie('a1', 'Altovar')]);
    final vm = await viewModel();
    await vm.load();

    expect(vm.isUnifiedBrowse, isTrue);
    expect(vm.sortOptions, isNot(contains(LibrarySortBy.myRating)));
    expect(vm.sortOptions, isNot(contains(LibrarySortBy.dateEpisodeAdded)));
    expect(vm.sortOptions, contains(LibrarySortBy.dateAdded));
    expect(vm.supportsVideoFilters, isFalse);
    expect(vm.supportsExtraFilters, isFalse);
    expect(vm.canGroup, isTrue);
  });

  test('fills in once a read brings a title to an empty library', () async {
    signInToFakeServers();
    await catalog.forceFullRead();
    final vm = await viewModel();
    await vm.load();
    await pumpEventQueue();
    expect(vm.state, LibraryBrowseState.ready);
    expect(vm.items, isEmpty);
    expect(vm.isCatalogSyncing, isFalse);

    a.movies = [catalogMovie('a1', 'Altovar')];
    await catalog.forceFullRead();
    await pumpEventQueue();

    expect(names(vm), ['Altovar']);
    expect(vm.hasPendingCatalogUpdate, isFalse);
  });

  group('opened while the servers are first being read', () {
    setUp(() {
      signInToFakeServers();
      a.movies = numbered('a', [for (var i = 0; i < 200; i += 2) i]);
      b.movies = numbered('b', [for (var i = 1; i < 200; i += 2) i]);
    });

    test('shows as loading, not as empty, until one server has been '
        'read', () async {
      a.holdRequests = true;
      b.holdRequests = true;
      final vm = await viewModel();
      var notified = 0;
      vm.addListener(() => notified++);

      await vm.load();
      // The state is ready with no items: only isCatalogSyncing tells this
      // from an empty library.
      expect(vm.state, LibraryBrowseState.ready);
      expect(vm.items, isEmpty);
      expect(vm.isCatalogSyncing, isTrue);
      await pumpEventQueue();

      expect(vm.items, isEmpty);
      expect(vm.isCatalogSyncing, isTrue);
      expect(vm.catalogServersUpToDate, 0);
      expect(vm.catalogServersTotal, 2);

      final before = notified;
      a.holdRequests = false;
      a.releaseNext();
      await pumpEventQueue();
      expect(notified, greaterThan(before));
      expect(vm.catalogServersUpToDate, 1);
      expect(vm.isCatalogSyncing, isTrue);
      expect(vm.items, isNotEmpty);

      b.holdRequests = false;
      b.releaseNext();
      await pumpEventQueue();
      expect(vm.isCatalogSyncing, isFalse);
      expect(vm.catalogServersUpToDate, 2);
    });

    test('ends with every title of every server', () async {
      b.holdRequests = true;
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();

      await vm.ensureAllItemsLoaded();
      expect(vm.items, hasLength(100));
      expect(vm.counterText, '100 | 100');

      b.holdRequests = false;
      b.releaseNext();
      await pumpEventQueue();

      expect(vm.state, LibraryBrowseState.ready);
      expect(vm.totalCount, 200);
      expect(vm.items, hasLength(100));
      expect(names(vm), [
        for (var i = 0; i < 100; i++) 'Movie ${'$i'.padLeft(3, '0')}',
      ]);

      await vm.ensureAllItemsLoaded();
      expect(names(vm).toSet(), hasLength(200));
      expect(names(vm), [...names(vm)]..sort());
      expect(vm.counterText, '200 | 200');
      expect(vm.hasMore, isFalse);
      expect(vm.hasPendingCatalogUpdate, isFalse);
    });

    test('the list never blanks while it is being rebuilt', () async {
      b.holdRequests = true;
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      final states = <(LibraryBrowseState, int)>[];
      vm.addListener(() => states.add((vm.state, vm.items.length)));

      b.holdRequests = false;
      b.releaseNext();
      await pumpEventQueue();

      expect(states, isNotEmpty);
      expect(states, everyElement((LibraryBrowseState.ready, 75)));
    });
  });

  group('opened on a stored catalog read from the servers earlier', () {
    setUp(() async {
      signInToFakeServers();
      a.movies = numbered('a', [for (var i = 0; i < 200; i += 2) i]);
      b.movies = numbered('b', [for (var i = 1; i < 200; i += 2) i]);
      await catalog.forceFullRead();
      // Long enough ago that opening the library checks the servers.
      now = now.add(const Duration(hours: 1));
    });

    test('draws from the stored catalog at once, then lets in a title added '
        'since without being asked', () async {
      a.movies = [...a.movies, catalogMovie('new', 'Movie 000 again')];
      a.holdRequests = true;
      final fullPages = a.fullPageRequests;
      final vm = await viewModel();

      await vm.load();
      await pumpEventQueue();
      expect(vm.state, LibraryBrowseState.ready);
      expect(vm.items, hasLength(75));
      expect(names(vm), isNot(contains('Movie 000 again')));
      expect(vm.isCatalogSyncing, isTrue);
      expect(vm.catalogServersUpToDate, 1);

      a.letThrough();
      await pumpEventQueue();

      expect(names(vm).take(3), ['Movie 000', 'Movie 000 again', 'Movie 001']);
      expect(vm.totalCount, 201);
      expect(vm.hasPendingCatalogUpdate, isFalse);
      expect(vm.isCatalogSyncing, isFalse);
      expect(vm.catalogServersUpToDate, 2);
      expect(a.rowRequests, [
        ['new'],
      ]);
      expect(a.fullPageRequests, fullPages);
    });

    test(
      'keeps as many titles loaded when the check brings a change',
      () async {
        a.movies = [...a.movies, catalogMovie('new', 'Movie 000 again')];
        a.holdRequests = true;
        final vm = await viewModel();
        await vm.load();
        await vm.ensureAllItemsLoaded();
        expect(vm.items, hasLength(200));
        final states = <(LibraryBrowseState, int)>[];
        vm.addListener(() => states.add((vm.state, vm.items.length)));

        a.letThrough();
        await pumpEventQueue();

        expect(vm.items, hasLength(200));
        expect(vm.totalCount, 201);
        expect(names(vm), contains('Movie 000 again'));
        expect(states, everyElement((LibraryBrowseState.ready, 200)));
      },
    );

    test('is not rebuilt when the servers hold what they did', () async {
      a.holdRequests = true;
      b.holdRequests = true;
      final fullPages = a.fullPageRequests + b.fullPageRequests;
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      final shown = vm.items;
      expect(vm.isCatalogSyncing, isTrue);
      expect(vm.catalogServersUpToDate, 0);
      final states = <LibraryBrowseState>[];
      vm.addListener(() => states.add(vm.state));

      a.letThrough();
      b.letThrough();
      await pumpEventQueue();

      expect(vm.items, same(shown));
      expect(states, everyElement(LibraryBrowseState.ready));
      expect(vm.hasPendingCatalogUpdate, isFalse);
      // The screen was still notified, so its progress could move and end.
      expect(states, isNotEmpty);
      expect(vm.isCatalogSyncing, isFalse);
      expect(vm.catalogServersUpToDate, 2);
      expect(a.countRequests + b.countRequests, 4);
      expect(a.fullPageRequests + b.fullPageRequests, fullPages);
    });

    test('opened again within a minute asks no server', () async {
      await (await viewModel()).load();
      await pumpEventQueue();
      final requests = a.requests + b.requests;
      expect(a.countRequests + b.countRequests, 4);

      await (await viewModel()).load();
      await pumpEventQueue();
      expect(a.requests + b.requests, requests);

      now = now.add(const Duration(seconds: 61));
      await (await viewModel()).load();
      await pumpEventQueue();
      expect(a.requests + b.requests, requests + 6);
    });

    test('a change of sort does not ask the servers again', () async {
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      final requests = a.requests + b.requests;

      now = now.add(const Duration(minutes: 5));
      await vm.setSortBy(LibrarySortBy.dateAdded);
      await pumpEventQueue();

      expect(a.requests + b.requests, requests);
    });
  });

  group('once a whole list is on screen', () {
    setUp(() async {
      signInToFakeServers();
      a.movies = [catalogMovie('a1', 'Altovar'), catalogMovie('a2', 'Hodrimel')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      await catalog.forceFullRead();
    });

    test('new titles wait instead of moving the cards', () async {
      final vm = await viewModel();
      await vm.load();
      expect(vm.hasPendingCatalogUpdate, isFalse);
      var notified = 0;
      vm.addListener(() => notified++);

      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
      await catalog.forceFullRead();
      await pumpEventQueue();

      expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
      expect(vm.hasPendingCatalogUpdate, isTrue);
      expect(notified, greaterThan(0));

      await vm.applyCatalogUpdate();
      expect(names(vm), ['Altovar', 'Brindlow', 'Hodrimel', 'Rusquin']);
      expect(vm.hasPendingCatalogUpdate, isFalse);
    });

    test('waiting titles are let in on the way back to the grid', () async {
      final vm = await viewModel();
      await vm.load();
      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
      await catalog.forceFullRead();
      await pumpEventQueue();

      // The screen calls this when the route above it is popped.
      await vm.syncUserDataIfStale();

      expect(names(vm), ['Altovar', 'Brindlow', 'Hodrimel', 'Rusquin']);
      expect(vm.hasPendingCatalogUpdate, isFalse);
    });

    test('a read that changes nothing leaves nothing pending', () async {
      final vm = await viewModel();
      await vm.load();

      await catalog.forceFullRead();
      await pumpEventQueue();

      expect(vm.hasPendingCatalogUpdate, isFalse);
    });

    test('refreshing reads every server again and reloads', () async {
      final vm = await viewModel();
      await vm.load();
      final requestsBefore = a.fullPageStartIndexes.length;
      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];

      a.holdRequests = true;
      final syncingWhenTold = <bool>[];
      vm.addListener(() => syncingWhenTold.add(vm.isCatalogSyncing));
      final first = vm.refreshCatalog();
      expect(syncingWhenTold, [true]);
      final second = vm.refreshCatalog();
      await pumpEventQueue();
      expect(second, same(first));
      expect(vm.isCatalogSyncing, isTrue);
      expect(vm.hasPendingCatalogUpdate, isFalse);

      a.holdRequests = false;
      a.releaseNext();
      await first;

      expect(a.fullPageStartIndexes, hasLength(requestsBefore + 1));
      expect(names(vm), ['Altovar', 'Brindlow', 'Hodrimel', 'Rusquin']);
      expect(vm.isCatalogSyncing, isFalse);
      expect(vm.hasPendingCatalogUpdate, isFalse);
    });
  });

  group('a title that becomes blocked while the grid is open', () {
    // Set after the first load, the way the tests above leave the grid open.
    Future<void> blockRating(String rating) async {
      await prefs.set(UserPreferences.blockedParentalRatings, rating);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      resetParentalFilterCache();
    }

    setUp(signInToFakeServers);

    test('leaves at once when its rating changes, and stays out of the '
        'count and the search', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar', rating: 'PG'),
        catalogMovie('a2', 'Hodrimel', rating: 'PG'),
      ];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await blockRating('R');
      await vm.load();
      expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
      vm.setFocusedItem(vm.items.first);

      a.movies = [
        catalogMovie('a1', 'Altovar', rating: 'R'),
        a.movies.last,
      ];
      await catalog.forceFullRead();
      await pumpEventQueue();

      expect(names(vm), ['Hodrimel', 'Rusquin']);
      expect(vm.totalCount, 2);
      expect(vm.hasMore, isFalse);
      expect(vm.focusedItem, isNull);
      vm.setSearchQuery('alto');
      expect(vm.items, isEmpty);
      vm.setSearchQuery('');

      await vm.applyCatalogUpdate();
      expect(names(vm), ['Hodrimel', 'Rusquin']);
      expect(vm.totalCount, 2);
    });

    test('leaves when another server adds a copy with a blocked rating',
        () async {
      a.movies = [
        catalogMovie('a1', 'Altovar', tmdb: '1001', rating: 'PG'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await blockRating('R');
      await vm.load();
      expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);

      b.movies = [
        ...b.movies,
        catalogMovie('b2', 'Altovar', tmdb: '1001', rating: 'R'),
      ];
      await catalog.forceFullRead();
      await pumpEventQueue();

      // The card is still a's copy, whose own rating is allowed.
      expect(names(vm), ['Hodrimel', 'Rusquin']);
      expect(vm.totalCount, 2);
    });

    test('keeps the count right for the pages still to come', () async {
      List<Map<String, dynamic>> movies({Set<int> restricted = const {}}) => [
        for (var i = 0; i < 150; i++)
          catalogMovie(
            'a$i',
            'Movie ${'$i'.padLeft(3, '0')}',
            rating: restricted.contains(i) ? 'R' : 'PG',
          ),
      ];
      a.movies = movies();
      b.movies = [];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await blockRating('R');
      await vm.load();
      final firstPage = vm.items.length;
      expect(firstPage, inInclusiveRange(4, 139));
      expect(vm.totalCount, 150);

      // One is on screen, the other on a page not read yet.
      a.movies = movies(restricted: {3, 140});
      await catalog.forceFullRead();
      await pumpEventQueue();

      expect(vm.items, hasLength(firstPage - 1));
      expect(names(vm), isNot(contains('Movie 003')));
      expect(vm.totalCount, 149);
      expect(vm.hasMore, isTrue);

      await vm.ensureAllItemsLoaded();

      expect(vm.items, hasLength(148));
      expect(names(vm), isNot(contains('Movie 003')));
      expect(names(vm), isNot(contains('Movie 140')));
      expect(vm.totalCount, 148);
      expect(vm.hasMore, isFalse);
    });

    test('leaves when only its watched state is brought up to date, and '
        'the cards after it are still found', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar', rating: 'PG'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();
      expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
      // Nothing reloads the grid for this, so the card is still on screen.
      await blockRating('PG');
      catalog.lookups = 0;

      a.setUserData('a1', {'Played': true});
      userDataSync.publish('a1', {'Played': true});
      await pumpEventQueue();

      expect(names(vm), ['Hodrimel', 'Rusquin']);
      expect(vm.totalCount, 2);
      // Only the changed card was looked at.
      expect(catalog.lookups, 2);

      b.setUserData('b1', {'Played': true});
      userDataSync.publish('b1', {'Played': true});
      await pumpEventQueue();

      expect(played(vm, 'Rusquin'), isTrue);
      expect(played(vm, 'Hodrimel'), isFalse);
    });
  });

  group('paging', () {
    setUp(() async {
      await seedCatalog(db, 'a', [
        for (var i = 0; i < 100; i++)
          catalogMovie('a$i', 'Movie ${'$i'.padLeft(3, '0')}'),
      ]);
      await seedCatalog(db, 'b', [
        for (var i = 100; i < 200; i++)
          catalogMovie('b$i', 'Movie ${'$i'.padLeft(3, '0')}'),
      ]);
    });

    test('a random sort shows every title once, whatever changes between '
        'its pages', () async {
      final vm = await viewModel();
      await vm.load();
      await vm.setSortBy(LibrarySortBy.random);
      final firstPage = names(vm);

      catalog.applyUserData('a', {
        'a199': {'Played': true},
        'a5': {'Played': true},
      });
      await vm.ensureAllItemsLoaded();

      expect(names(vm).take(firstPage.length), firstPage);
      expect(names(vm).toSet(), hasLength(200));
      expect(vm.counterText, '200 | 200');
    });

    test('a random sort is shuffled again by the next load', () async {
      final vm = await viewModel();
      await vm.load();
      await vm.setSortBy(LibrarySortBy.random);
      final first = names(vm);

      await vm.load();

      expect(names(vm), isNot(first));
    });

    test(
      'a random sort keeps its order when the list is rebuilt in place',
      () async {
        final vm = await viewModel();
        await vm.load();
        await pumpEventQueue();
        await vm.setSortBy(LibrarySortBy.random);
        await vm.ensureAllItemsLoaded();
        final before = names(vm);
        expect(before, hasLength(200));

        await catalog.removeCopy('a', 'a7');
        expect(vm.hasPendingCatalogUpdate, isTrue);
        await vm.applyCatalogUpdate();
        await vm.ensureAllItemsLoaded();

        expect(names(vm), [...before]..remove('Movie 007'));
      },
    );

    test('a page asked for while the accounts are being switched does not '
        'leave the grid empty', () async {
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      expect(vm.hasMore, isTrue);

      // The catalog is reloading from disk while the grid still scrolls.
      catalog.reset();
      unawaited(vm.loadMore());
      await pumpEventQueue();

      expect(vm.items, isNotEmpty);
      await vm.ensureAllItemsLoaded();
      expect(vm.items, hasLength(200));
    });

    test('a title removed between pages does not make a later one go '
        'missing', () async {
      final vm = await viewModel();
      await vm.load();
      // Wait past the check made on opening, which lets changes straight in.
      await pumpEventQueue();

      await catalog.removeCopy('a', 'a0');
      await vm.ensureAllItemsLoaded();

      expect(names(vm), [
        for (var i = 0; i < 200; i++) 'Movie ${'$i'.padLeft(3, '0')}',
      ]);
      expect(vm.hasPendingCatalogUpdate, isTrue);
    });
  });

  test('walking every page lets frames through', () async {
    await seedCatalog(db, 'a', [
      for (var i = 0; i < 800; i++) catalogMovie('a$i', 'Movie $i'),
    ]);
    final vm = await viewModel();
    await vm.load();

    final turns = await turnsDuring(vm.ensureAllItemsLoaded);

    expect(vm.items, hasLength(800));
    expect(turns, greaterThanOrEqualTo(2));
  });

  group('watched state', () {
    test('changed on one server leaves another server\'s title with the '
        'same id alone', () async {
      signInToFakeServers();
      a.movies = [catalogMovie('7', 'Altovar')];
      b.movies = [catalogMovie('7', 'Rusquin')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();

      // This is what playing Rusquin from any screen ends in.
      b.setUserData('7', {'Played': true});
      userDataSync.publish('7', {'Played': true});
      await pumpEventQueue();

      expect(played(vm, 'Rusquin'), isTrue);
      expect(played(vm, 'Altovar'), isFalse);
    });

    test('of a title on two servers follows the copy that changed, so it '
        'does not flip', () async {
      signInToFakeServers();
      a.movies = [catalogMovie('a1', 'Altovar', tmdb: '1001')];
      b.movies = [catalogMovie('b1', 'Altovar', tmdb: '1001', played: true)];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();
      expect(vm.items.single.serverId, 'a');
      expect(played(vm, 'Altovar'), isTrue);

      // An unrelated episode was watched: no server is asked, and b's copy
      // still counts as played.
      userDataSync.publish('an-episode', {'Played': true});
      await pumpEventQueue();
      await vm.syncUserDataIfStale();

      expect([...a.userDataRequests, ...b.userDataRequests], isEmpty);
      expect([...a.parentRequests, ...b.parentRequests], isEmpty);
      expect(played(vm, 'Altovar'), isTrue);

      b.setUserData('b1', {'Played': false});
      userDataSync.publish('b1', {'Played': false});
      await pumpEventQueue();
      await vm.syncUserDataIfStale();

      expect(a.userDataRequests, isEmpty);
      expect(b.userDataRequests, [
        ['b1'],
      ]);
      expect(played(vm, 'Altovar'), isFalse);
      expect(
        [for (final v in unifiedCopiesOf(vm.items.single.rawData)) v.played],
        [false, false],
      );
    });

    test('coming back to a long grid asks only about the title that changed',
        () async {
      signInToFakeServers();
      a.movies = numbered('a', [for (var i = 0; i < 150; i++) i]);
      b.movies = numbered('b', [for (var i = 150; i < 300; i++) i]);
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();
      expect(vm.items.length, greaterThan(40));

      a.setUserData('a7', {'Played': true});
      userDataSync.publish('a7', {'Played': true});
      await pumpEventQueue();
      await vm.syncUserDataIfStale();

      expect(a.userDataRequests, [
        ['a7'],
      ]);
      expect(b.userDataRequests, isEmpty);
      expect(a.parentRequests, isEmpty);
      expect(played(vm, 'Movie 007'), isTrue);
    });

    test('an episode watched brings its series up to date, and only it',
        () async {
      signInToFakeServers();
      a.series = [
        catalogMovie('s1', 'Arvistel', type: 'Series', tmdb: '7'),
        catalogMovie('s2', 'Dastrel', type: 'Series'),
      ];
      b.series = [
        catalogMovie('t1', 'Arvistel', type: 'Series', tmdb: '7'),
        catalogMovie('t2', 'Fendral', type: 'Series'),
      ];
      a.seriesOf['e1'] = 's1';
      await catalog.forceFullRead();
      final vm = await viewModel(kind: UnifiedLibraryKind.series);
      await vm.load();
      expect(names(vm), ['Arvistel', 'Dastrel', 'Fendral']);

      // The socket names the episode and its season, never the series.
      a.setUserData('s1', {'Played': true});
      userDataSync.publish('e1', {'Played': true});
      await pumpEventQueue();
      await vm.syncUserDataIfStale();

      expect(a.parentRequests, [
        ['e1'],
      ]);
      expect(a.userDataRequests, [
        ['s1'],
      ]);
      expect(b.userDataRequests, isEmpty);
      expect(played(vm, 'Arvistel'), isTrue);
      expect(played(vm, 'Dastrel'), isFalse);
    });

    test('changed for one title brings only its card up to date', () async {
      signInToFakeServers();
      a.movies = numbered('a', [for (var i = 0; i < 40; i++) i]);
      b.movies = [];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();
      expect(vm.items.length, greaterThanOrEqualTo(40));
      final before = vm.items;
      catalog.lookups = 0;

      a.setUserData('a7', {'Played': true});
      userDataSync.publish('a7', {'Played': true});
      await pumpEventQueue();

      expect(played(vm, 'Movie 007'), isTrue);
      expect(vm.items, isNot(same(before)));
      for (var i = 0; i < before.length; i++) {
        if (before[i].id == 'a7') continue;
        expect(vm.items[i], same(before[i]));
      }
      // One lookup to find the copies of the changed title, one for its card.
      // No other card is looked up or compared.
      expect(catalog.lookups, 2);
    });

    test('still reaches the right card once more pages have loaded and '
        'cards have been patched', () async {
      await seedCatalog(db, 'a', numbered('a', [for (var i = 0; i < 400; i++) i]));
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      final firstPage = vm.items.length;
      expect(vm.hasMore, isTrue);

      catalog.applyUserData('a', {
        'a7': {'Played': true},
      });
      expect(played(vm, 'Movie 007'), isTrue);

      await vm.ensureAllItemsLoaded();
      expect(vm.items, hasLength(400));
      final before = vm.items;
      catalog.lookups = 0;
      catalog.applyUserData('a', {
        'a7': {'Played': false},
        'a399': {'Played': true},
      });

      expect(firstPage, lessThan(399));
      expect(played(vm, 'Movie 007'), isFalse);
      expect(played(vm, 'Movie 399'), isTrue);
      expect(names(vm), [for (final item in before) item.name]);
      expect(catalog.lookups, 4);
    });

    test('that changes nothing a card shows leaves the list as it was',
        () async {
      await seedCatalog(db, 'a', numbered('a', [for (var i = 0; i < 40; i++) i]));
      final vm = await viewModel();
      await vm.load();
      await pumpEventQueue();
      catalog.applyUserData('a', {
        'a7': {'Played': true},
      });
      final before = vm.items;

      catalog.applyUserData('a', {
        'a7': {'Played': true},
      });

      expect(vm.items, same(before));
    });

    test('keeps each copy\'s own state for the server picker', () async {
      signInToFakeServers();
      a.movies = [catalogMovie('a1', 'Altovar', tmdb: '1001')];
      b.movies = [catalogMovie('b1', 'Altovar', tmdb: '1001')];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();

      b.setUserData('b1', {'Played': true});
      userDataSync.publish('b1', {'Played': true});
      await pumpEventQueue();

      expect(
        {
          for (final v in unifiedCopiesOf(vm.items.single.rawData))
            v.serverId: v.played,
        },
        {'a': false, 'b': true},
      );
      expect(played(vm, 'Altovar'), isTrue);
    });
  });

  test('loads again and checks the servers once the accounts are switched, '
      'without being asked', () async {
    signInToFakeServers();
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    await catalog.forceFullRead();
    final vm = await viewModel();
    await vm.load();
    await pumpEventQueue();
    expect(names(vm), ['Altovar', 'Rusquin']);

    // A profile switch leaves only one server signed in, with a title added.
    now = now.add(const Duration(hours: 1));
    sessions = [a.session];
    a.movies = [...a.movies, catalogMovie('a2', 'Hodrimel')];
    catalog.reset();
    await pumpEventQueue();

    expect(names(vm), ['Altovar', 'Hodrimel']);
    expect(vm.hasPendingCatalogUpdate, isFalse);
  });

  test('shows nothing of the accounts that left while the new accounts\' '
      'catalog loads', () async {
    a.movies = [
      catalogMovie('a1', 'Altovar', genres: ['Crime']),
      catalogMovie('a2', 'Hodrimel', genres: ['Crime']),
    ];
    b.movies = [
      catalogMovie('b1', 'Rusquin', genres: ['Family']),
      catalogMovie('b2', 'Zintrymel', genres: ['Family']),
    ];
    sessions = [a.session];
    await catalog.forceFullRead();
    final vm = await viewModel();
    await vm.load();
    await pumpEventQueue();
    await vm.ensureFacetValuesLoaded();
    expect(names(vm), ['Altovar', 'Hodrimel']);
    expect(vm.facetValues.genres, ['Crime']);
    vm.setFocusedItem(vm.items.first);
    vm.setSearchQuery('altovar');
    expect(names(vm), ['Altovar']);

    // Everything the screen is told to draw from here on.
    final shown = <String>{};
    void record() => shown.addAll([
      ...names(vm),
      ?vm.focusedItem?.name,
      for (final group in vm.groupedCategories.values)
        for (final item in group) item.name,
    ]);
    vm.addListener(record);

    // A restricted profile takes over, and its catalog is slow to load.
    sessionsGate = Completer<void>();
    sessions = [b.session];
    catalog.reset();
    await pumpEventQueue();

    expect(vm.state, LibraryBrowseState.loading);
    expect(vm.items, isEmpty);
    expect(vm.totalCount, 0);
    expect(vm.focusedItem, isNull);
    expect(vm.focusedRatings, isEmpty);
    expect(vm.facetValues.genres, isEmpty);
    expect(vm.hasPendingCatalogUpdate, isFalse);
    vm.setSearchQuery('');
    expect(vm.items, isEmpty);
    expect(shown, isEmpty);

    sessionsGate!.complete();
    await pumpEventQueue();
    vm.removeListener(record);

    expect(vm.state, LibraryBrowseState.ready);
    expect(names(vm), ['Rusquin', 'Zintrymel']);
    expect(vm.facetValues.genres, ['Family']);
    expect(vm.focusedItem, isNull);
    expect(shown, {'Rusquin', 'Zintrymel'});
  });

  test('a check asked for before the accounts were switched, finishing '
      'after, does not end the one that followed it', () async {
    signInToFakeServers();
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    await catalog.forceFullRead();
    now = now.add(const Duration(hours: 1));

    a.holdRequests = true;
    final vm = await viewModel();
    await vm.load();
    await pumpEventQueue();
    expect(names(vm), ['Altovar', 'Rusquin']);
    expect(a.heldRequests, hasLength(1));

    a.movies = [...a.movies, catalogMovie('a2', 'Hodrimel')];
    catalog.reset();
    await pumpEventQueue();
    expect(a.heldRequests, hasLength(2));

    a.releaseNext();
    await pumpEventQueue();
    a.holdRequests = false;
    while (a.heldRequests.isNotEmpty) {
      a.releaseNext();
      await pumpEventQueue();
    }

    expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(vm.hasPendingCatalogUpdate, isFalse);
  });

  group('what the screen is told about the servers', () {
    setUp(() {
      signInToFakeServers();
      a.movies = [catalogMovie('a1', 'Altovar', played: true)];
      b.movies = [catalogMovie('b1', 'Rusquin')];
    });

    test(
      'a server that failed counts as unreachable, one still being read '
      'does not',
      () async {
        b.down = true;
        a.holdRequests = true;
        final vm = await viewModel();
        await vm.load();
        await pumpEventQueue();

        expect(vm.catalogUnreachableServerCount, 1);
        expect(vm.catalogServersTotal, 2);
        expect(vm.catalogHasTitles, isFalse);

        a.holdRequests = false;
        while (a.heldRequests.isNotEmpty) {
          a.releaseNext();
          await pumpEventQueue();
        }
        expect(vm.catalogUnreachableServerCount, 1);
        expect(vm.catalogServersUpToDate, 1);
        expect(vm.catalogHasTitles, isTrue);
      },
    );

    test('a filter that leaves nothing is told from a catalog with '
        'nothing in it', () async {
      await catalog.forceFullRead();
      final vm = await viewModel();
      await vm.load();
      await vm.setPlayedFilter(PlayedStatusFilter.inProgress);

      expect(vm.items, isEmpty);
      expect(vm.catalogHasTitles, isTrue);
      expect(vm.catalogUnreachableServerCount, 0);
    });
  });

  group('the filter picker', () {
    setUp(() async {
      signInToFakeServers();
      a.movies = [
        catalogMovie('a1', 'Altovar', tmdb: '1001', rating: 'PG-13'),
        catalogMovie('a2', 'Hodrimel', rating: 'PG', genres: ['Crime']),
      ];
      b.movies = [
        catalogMovie(
          'b1',
          'Altovar',
          tmdb: '1001',
          rating: 'R',
          genres: ['Horror'],
        ),
      ];
      await catalog.forceFullRead();
    });

    test('follows the stored catalog as its titles change', () async {
      final vm = await viewModel();
      await vm.load();
      await vm.ensureFacetValuesLoaded();
      // Only b's copy of Altovar is Horror, and the card is shown from a.
      expect(vm.facetValues.genres, ['Crime', 'Horror']);

      a.movies = [
        ...a.movies,
        catalogMovie('a3', 'Umbrel', genres: ['Family']),
      ];
      await catalog.forceFullRead();
      await pumpEventQueue();

      expect(vm.facetValues.genres, ['Crime', 'Family', 'Horror']);
    });

    test('a title any server rates as blocked is hidden, with what it '
        'would have offered', () async {
      // The card is shown from server a, whose rating is the milder one.
      a.movies = [
        catalogMovie(
          'a1',
          'Altovar',
          tmdb: '1001',
          rating: 'PG-13',
          genres: ['Horror'],
        ),
        a.movies.last,
      ];
      await catalog.forceFullRead();
      final vm = await viewModel();
      await prefs.set(UserPreferences.blockedParentalRatings, 'R');
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      resetParentalFilterCache();

      await vm.load();
      await vm.ensureFacetValuesLoaded();

      expect(names(vm), ['Hodrimel']);
      expect(vm.totalCount, 1);
      expect(vm.facetValues.genres, ['Crime']);
      expect(vm.facetValues.officialRatings, ['PG']);
    });
  });

  test('an ordinary library has no catalog to report on', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    final vm = LibraryBrowseViewModel(
      libraryId: 'library',
      client: UntouchedClient(),
      prefs: UserPreferences(store),
      mdbListRepository: FakeMdbListRepository(),
    );
    addTearDown(vm.dispose);

    expect(vm.isCatalogSyncing, isFalse);
    expect(vm.catalogServersUpToDate, 0);
    expect(vm.catalogServersTotal, 0);
    expect(vm.catalogUnreachableServerCount, 0);
    expect(vm.catalogHasTitles, isFalse);
    expect(vm.hasPendingCatalogUpdate, isFalse);
    await vm.refreshCatalog();
    await vm.applyCatalogUpdate();
  });

  group('search by a name the card does not show', () {
    const english = 'The Ledger of the Tides: The Company of the Tide';
    const french = 'Le Sablier des marées : La Société de la marée';

    Future<LibraryBrowseViewModel> library() async {
      await seedCatalog(db, 'a', [
        catalogMovie('a1', english, tmdb: '1005'),
        catalogMovie('a2', 'Hodrimel'),
        {
          ...catalogMovie('a3', 'Selwick Fold', tmdb: '1006'),
          'SortName': 'Selwick Fold',
        },
      ]);
      await seedCatalog(db, 'b', [
        catalogMovie('b1', french, tmdb: '1005'),
        {
          ...catalogMovie('b3', 'Le Verger de Tolvane', tmdb: '1006'),
          'OriginalTitle': 'Hoshi to Tolvane no Niwa',
        },
        {
          ...catalogMovie('b4', 'Ambréval'),
          'OriginalTitle': 'Le Lanternier Distrait',
        },
      ]);
      final vm = await viewModel();
      await vm.load();
      return vm;
    }

    test('finds the title under another server\'s name', () async {
      final vm = await library();

      vm.setSearchQuery('sablier');
      expect(names(vm), [english]);
      expect(unifiedCopiesOf(vm.items.single.rawData), hasLength(2));

      vm.setSearchQuery('ledger');
      expect(names(vm), [english]);
    });

    test('whatever the accents or the case', () async {
      final vm = await library();

      vm.setSearchQuery('SOCIETE');
      expect(names(vm), [english]);

      vm.setSearchQuery('vergér');
      expect(names(vm), ['Selwick Fold']);
    });

    test('finds it under its original title, on any copy', () async {
      final vm = await library();

      vm.setSearchQuery('niwa');
      expect(names(vm), ['Selwick Fold']);

      vm.setSearchQuery('lanternier');
      expect(names(vm), ['Ambréval']);
    });

    test('a name no copy has finds nothing', () async {
      final vm = await library();

      vm.setSearchQuery('sablier hodrimel');
      expect(names(vm), isEmpty);
    });
  });
}
