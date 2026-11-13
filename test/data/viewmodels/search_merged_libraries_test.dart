import 'dart:async';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/multi_server_fakes.dart';
import '../services/unified_catalog_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Fake implements ItemsApi {
  _ItemsApi(this.items);

  final List<Map<String, dynamic>> items;
  final fields = <String?>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      fields.add(invocation.namedArguments[#fields] as String?);
      return Future.value(<String, dynamic>{'Items': items});
    }
    return Future.value(const <String, dynamic>{'Items': []});
  }
}

/// Reports itself loaded only once [gate] is completed.
class _SlowCatalog extends UnifiedCatalogService {
  _SlowCatalog({
    required super.database,
    required super.loadSessions,
    required super.activeServerId,
  });

  // Made inside the fake clock's zone, or completing it isn't seen there.
  late Completer<void> gate;

  Future<void> loadNow() => super.ensureLoaded();

  @override
  Future<void> ensureLoaded() => gate.future;
}

void main() {
  final apis = <String, _ItemsApi>{};

  ServerUserSession server(
    String id,
    List<Map<String, dynamic>> items, {
    ServerType type = ServerType.jellyfin,
  }) {
    final client = _Client();
    final api = apis[id] = _ItemsApi(items);
    when(() => client.itemsApi).thenReturn(api);
    when(() => client.serverType).thenReturn(type);
    when(() => client.baseUrl).thenReturn('http://$id.test');
    when(() => client.gamesApi).thenReturn(null);
    return fakeSession(id, client: client, type: type);
  }

  /// Results as `server:id`, by group.
  Future<Map<String, List<String>>> search(
    List<ServerUserSession> sessions, {
    required bool merge,
    String? active = 'a',
  }) async {
    final vm = SearchViewModel(
      SearchRepository(sessions.first.client),
      sessions.first.client,
      multiServerRepository: FakeMultiServerRepository(sessions),
      mergeSharedTitles: merge,
      activeServerId: () => active,
    );
    addTearDown(vm.dispose);
    vm.searchImmediate('altovar');
    await pumpEventQueue();
    expect(vm.state, SearchState.ready, reason: '${vm.error}');
    return {
      for (final group in vm.results)
        group.itemTypes.first: [
          for (final item in group.items) '${item.serverId}:${item.id}',
        ],
    };
  }

  List<ServerUserSession> twoServers() => [
    server('a', [
      catalogMovie('a1', 'Altovar', tmdb: '1001'),
      catalogMovie('a2', 'Altovar Nation', type: 'Series', tmdb: '1008'),
      catalogMovie('a3', 'Altovar Day', type: 'Episode', tmdb: '99'),
      catalogMovie('a4', 'Altovar: Cinder'),
    ]),
    server('b', [
      catalogMovie('b1', 'Altovar', tmdb: '1001'),
      catalogMovie('b2', 'Altovar Nation', type: 'Series', tmdb: '1008'),
      catalogMovie('b3', 'Altovar Day', type: 'Episode', tmdb: '99'),
      catalogMovie('b4', 'Altovar: Cinder'),
    ]),
  ];

  setUp(apis.clear);
  tearDown(() => GetIt.instance.reset());

  test('with merged libraries on, a movie or series is found once', () async {
    final results = await search(twoServers(), merge: true);

    // The two movies without a provider id cannot be recognized as one
    // title.
    expect(results['Movie'], ['a:a1', 'a:a4', 'b:b4']);
    expect(results['Series'], ['a:a2']);
    expect(results['Episode'], ['a:a3', 'b:b3']);
  });

  test('with merged libraries off, each server lists its own', () async {
    final results = await search(twoServers(), merge: false);

    expect(results['Movie'], ['a:a1', 'b:b1', 'a:a4', 'b:b4']);
    expect(results['Series'], ['a:a2', 'b:b2']);
    expect(results['Episode'], ['a:a3', 'b:b3']);
  });

  test(
    'the folded result carries every copy for the menu and the server '
    'picker',
    () async {
      final sessions = twoServers();
      final vm = SearchViewModel(
        SearchRepository(sessions.first.client),
        sessions.first.client,
        multiServerRepository: FakeMultiServerRepository(sessions),
        mergeSharedTitles: true,
        activeServerId: () => 'b',
      );
      addTearDown(vm.dispose);
      vm.searchImmediate('altovar');
      await pumpEventQueue();

      final sharedMovie = vm.results
          .firstWhere((group) => group.itemTypes.contains('Movie'))
          .items
          .first;
      // The result is shown from the server being browsed, which here is
      // the second one.
      expect((sharedMovie.serverId, sharedMovie.id), ('b', 'b1'));
      expect(
        [
          for (final v in unifiedCopiesOf(sharedMovie.rawData))
            (v.serverId, v.itemId, v.serverName),
        ],
        [('b', 'b1', 'Server b'), ('a', 'a1', 'Server a')],
      );
    },
  );

  test('provider ids are requested only with merged libraries on', () async {
    await search(twoServers(), merge: false);
    expect(apis['a']!.fields.single, isNot(contains('ProviderIds')));
    expect(apis['b']!.fields.single, isNot(contains('ProviderIds')));

    await search(twoServers(), merge: true);
    expect(apis['a']!.fields.single, contains('ProviderIds'));
    expect(apis['b']!.fields.single, contains('ProviderIds'));
  });

  test('servers of every type fold together', () async {
    final sessions = [
      server('a', [catalogMovie('a1', 'Altovar', tmdb: '1001')]),
      for (final type in [ServerType.emby, ServerType.plex, ServerType.silo])
        server(
          type.name,
          [catalogMovie('${type.name}1', 'Altovar', tmdb: '1001')],
          type: type,
        ),
    ];

    final results = await search(sessions, merge: true);

    expect(results['Movie'], ['a:a1']);
    for (final api in apis.values) {
      expect(api.fields.single, contains('ProviderIds'));
    }
  });

  test('a shared title takes one place in a full group, not two', () async {
    List<Map<String, dynamic>> movies(String server) => [
      // Provider ids are numbered from one: no provider files a title under
      // zero.
      for (var i = 0; i < 30; i++)
        catalogMovie('$server$i', 'Altovar $i', tmdb: '${i + 1}'),
    ];

    final results = await search([
      server('a', movies('a')),
      server('b', movies('b')),
    ], merge: true);

    expect(results['Movie'], [for (var i = 0; i < 24; i++) 'a:a$i']);
  });

  test('a single server searched alone is left as it is', () async {
    final session = server('a', [catalogMovie('a1', 'Altovar', tmdb: '1001')]);
    final vm = SearchViewModel(
      SearchRepository(session.client),
      session.client,
      mergeSharedTitles: true,
    );
    addTearDown(vm.dispose);
    vm.searchImmediate('altovar');
    await pumpEventQueue();

    expect(
      vm.results.single.items.single.rawData,
      isNot(contains(unifiedCopiesKey)),
    );
    expect(apis['a']!.fields.single, isNot(contains('ProviderIds')));
  });

  group('with the merged library\'s stored catalog', () {
    const english = 'The Ledger of the Tides: The Company of the Tide';
    const french = 'Le Sablier des marées : La Société de la marée';

    late OfflineDatabase db;
    late List<ServerUserSession> sessions;

    setUp(() {
      db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    });
    tearDown(() => db.close());

    /// Stores both servers' rows: one movie under two names, and one movie
    /// each. No full read is recorded, as these tests never start one.
    Future<void> seedBoth() async {
      await seedCatalog(db, 'a', [
        catalogMovie('a1', english, tmdb: '1005'),
        catalogMovie('a2', 'Hodrimel', tmdb: '1002'),
      ], markFullyRead: false);
      await seedCatalog(db, 'b', [
        catalogMovie('b1', french, tmdb: '1005'),
        catalogMovie('b2', 'Rusquin', tmdb: '1007'),
      ], markFullyRead: false);
    }

    UnifiedCatalogService catalog() {
      final service = UnifiedCatalogService(
        database: db,
        loadSessions: () async => sessions,
        activeServerId: () => 'a',
      );
      addTearDown(service.dispose);
      return service;
    }

    SearchViewModel viewModel(
      UnifiedCatalogService? catalog, {
      bool merge = true,
    }) {
      final vm = SearchViewModel(
        SearchRepository(sessions.first.client),
        sessions.first.client,
        multiServerRepository: FakeMultiServerRepository(sessions),
        mergeSharedTitles: merge,
        unifiedCatalog: catalog,
        activeServerId: () => 'a',
      );
      addTearDown(vm.dispose);
      return vm;
    }

    Future<List<AggregatedItem>> moviesFound(
      SearchViewModel vm,
      String query,
    ) async {
      vm.searchImmediate(query);
      for (var i = 0; i < 20 && vm.state != SearchState.ready; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }
      expect(vm.state, SearchState.ready, reason: '${vm.error}');
      return [
        for (final group in vm.results)
          if (group.itemTypes.contains('Movie')) ...group.items,
      ];
    }

    List<(String, String, String?)> copies(AggregatedItem item) => [
      for (final v in unifiedCopiesOf(item.rawData))
        (v.serverId, v.itemId, v.name),
    ];

    test('a name only one server uses for a title finds its copies on '
        'both', () async {
      await seedBoth();
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b1', french, tmdb: '1005')]),
      ];

      final found = await moviesFound(viewModel(catalog()), 'sablier');

      // The result is shown from the server being browsed, as in the merged
      // library.
      expect((found.single.serverId, found.single.id), ('a', 'a1'));
      expect(found.single.name, english);
      expect(copies(found.single), [('a', 'a1', english), ('b', 'b1', french)]);
    });

    test('the name the other server uses finds both copies too', () async {
      await seedBoth();
      sessions = [
        server('a', [catalogMovie('a1', english, tmdb: '1005')]),
        server('b', []),
      ];

      final found = await moviesFound(viewModel(catalog()), 'ledger');

      expect((found.single.serverId, found.single.id), ('a', 'a1'));
      expect(copies(found.single), [('a', 'a1', english), ('b', 'b1', french)]);
    });

    test('a movie only one server holds gets no copy from the other', () async {
      await seedBoth();
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b2', 'Rusquin', tmdb: '1007')]),
      ];

      final found = await moviesFound(viewModel(catalog()), 'rusquin');

      expect((found.single.serverId, found.single.id), ('b', 'b2'));
      expect(found.single.rawData, isNot(contains(unifiedCopiesKey)));
    });

    test('a movie found on a server, not yet in the stored catalog, is '
        'still listed as a copy', () async {
      await seedBoth();
      sessions = [
        server('a', [catalogMovie('a9', 'Rusquin', tmdb: '1007')]),
        server('b', []),
      ];

      final found = await moviesFound(viewModel(catalog()), 'rusquin');

      expect(copies(found.single), [
        ('a', 'a9', 'Rusquin'),
        ('b', 'b2', 'Rusquin'),
      ]);
    });

    test('an empty stored catalog leaves the results as the servers gave '
        'them', () async {
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b1', french, tmdb: '1005')]),
      ];

      final found = await moviesFound(viewModel(catalog()), 'sablier');

      expect((found.single.serverId, found.single.id), ('b', 'b1'));
      expect(found.single.rawData, isNot(contains(unifiedCopiesKey)));
    });

    test('with merged libraries off the stored catalog is not read at all',
        () async {
      await seedBoth();
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b1', french, tmdb: '1005')]),
      ];
      final service = catalog();

      final found = await moviesFound(
        viewModel(service, merge: false),
        'sablier',
      );

      expect((found.single.serverId, found.single.id), ('b', 'b1'));
      expect(found.single.rawData, isNot(contains(unifiedCopiesKey)));
      expect(service.rowsDecoded, 0);
    });

    test('a stored catalog that fails to load leaves the results alone',
        () async {
      await seedBoth();
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b1', french, tmdb: '1005')]),
      ];
      final service = UnifiedCatalogService(
        database: db,
        loadSessions: () async => throw StateError('no sign-in store'),
        activeServerId: () => 'a',
      );
      addTearDown(service.dispose);

      final found = await moviesFound(viewModel(service), 'sablier');

      expect((found.single.serverId, found.single.id), ('b', 'b1'));
      expect(found.single.rawData, isNot(contains(unifiedCopiesKey)));
    });

    test('a stored catalog still loading does not hold the results back, and '
        'completes the card where it stands once loaded', () async {
      await seedBoth();
      sessions = [
        server('a', [catalogMovie('a2', 'Hodrimel', tmdb: '1002')]),
        server('b', [
          catalogMovie('b1', french, tmdb: '1005'),
          catalogMovie('b2', 'Rusquin', tmdb: '1007'),
        ]),
      ];
      final service = _SlowCatalog(
        database: db,
        loadSessions: () async => sessions,
        activeServerId: () => 'a',
      );
      addTearDown(service.dispose);
      await service.loadNow();
      final vm = viewModel(service);
      var changes = 0;
      vm.addListener(() => changes++);

      List<String> shown() => [
        for (final group in vm.results)
          for (final item in group.items) '${item.serverId}:${item.id}',
      ];

      fakeAsync((async) {
        service.gate = Completer();
        vm.searchImmediate('e');
        async.flushMicrotasks();
        expect(vm.state, SearchState.loading);

        async.elapse(const Duration(seconds: 1));
        expect(vm.state, SearchState.ready);
        expect(shown(), ['a:a2', 'b:b1', 'b:b2']);
        expect(unifiedCopiesOf(vm.results.single.items[1].rawData), isEmpty);

        changes = 0;
        service.gate.complete();
        async.flushMicrotasks();

        expect(changes, 1);
        expect(shown(), ['a:a2', 'a:a1', 'b:b2']);
        expect(copies(vm.results.single.items[1]), [
          ('a', 'a1', english),
          ('b', 'b1', french),
        ]);
      });
    });

    group('the search is left before the stored catalog has loaded', () {
      late _SlowCatalog service;
      late SearchViewModel vm;

      setUp(() async {
        await seedBoth();
        sessions = [
          server('a', [catalogMovie('a2', 'Hodrimel', tmdb: '1002')]),
          server('b', [catalogMovie('b1', french, tmdb: '1005')]),
        ];
        service = _SlowCatalog(
          database: db,
          loadSessions: () async => sessions,
          activeServerId: () => 'a',
        );
        addTearDown(service.dispose);
        await service.loadNow();
        vm = SearchViewModel(
          SearchRepository(sessions.first.client),
          sessions.first.client,
          multiServerRepository: FakeMultiServerRepository(sessions),
          mergeSharedTitles: true,
          unifiedCatalog: service,
          activeServerId: () => 'a',
        );
      });

      test('while the results still wait for it', () {
        fakeAsync((async) {
          service.gate = Completer();
          vm.searchImmediate('e');
          async.flushMicrotasks();
          expect(vm.state, SearchState.loading);

          vm.dispose();
          async.elapse(const Duration(seconds: 1));
          service.gate.complete();
          async.flushMicrotasks();
        });
      });

      test('once the results are up without it', () {
        fakeAsync((async) {
          service.gate = Completer();
          vm.searchImmediate('e');
          async.elapse(const Duration(seconds: 1));
          expect(vm.state, SearchState.ready);

          vm.dispose();
          service.gate.complete();
          async.flushMicrotasks();
        });
      });
    });

    group('the stored catalog is read on the first keystroke', () {
      test('with two servers that merge', () async {
        await seedBoth();
        sessions = [server('a', []), server('b', [])];
        final service = catalog();

        viewModel(service).searchDebounced('h');
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(service.rowsDecoded, 4);
      });

      test('but not with a single server, where nothing can fold', () async {
        await seedBoth();
        sessions = [
          server('a', [catalogMovie('a2', 'Hodrimel', tmdb: '1002')]),
        ];
        final service = catalog();
        final vm = viewModel(service);

        vm.searchDebounced('h');
        await Future<void>.delayed(const Duration(milliseconds: 50));
        final found = await moviesFound(vm, 'hodrimel');

        expect([for (final item in found) item.serverId], ['a']);
        expect(service.rowsDecoded, 0);
      });
    });

    group('with a rating blocked', () {
      /// Both servers hold one movie, and only [ratedOn] rates it R.
      Future<void> seedSharedMovie({required String ratedOn}) async {
        for (final id in ['a', 'b']) {
          await seedCatalog(db, id, [
            catalogMovie(
              '${id}1',
              'Hodrimel',
              tmdb: '1002',
              rating: id == ratedOn ? 'R' : null,
            ),
            catalogMovie('${id}2', 'Hodrimel Rusquin', tmdb: '1007'),
          ], markFullyRead: false);
        }
      }

      setUp(() async {
        SharedPreferences.setMockInitialValues({});
        final store = PreferenceStore();
        await store.init();
        final prefs = UserPreferences(store);
        await prefs.set(UserPreferences.blockedParentalRatings, 'R');
        GetIt.instance.registerSingleton<UserPreferences>(prefs);
      });

      List<String> shown(List<AggregatedItem> found) => [
        for (final item in found) '${item.serverId}:${item.id}',
      ];

      test('a movie found on one server is left out when the stored catalog '
          'holds a blocked copy of it', () async {
        await seedSharedMovie(ratedOn: 'b');
        // Server b's own search already left its blocked copy out.
        sessions = [
          server('a', [
            catalogMovie('a1', 'Hodrimel', tmdb: '1002'),
            catalogMovie('a2', 'Hodrimel Rusquin', tmdb: '1007'),
          ]),
          server('b', []),
        ];

        final found = await moviesFound(viewModel(catalog()), 'hodrimel');

        expect(shown(found), ['a:a2']);
        expect(copies(found.single), [
          ('a', 'a2', 'Hodrimel Rusquin'),
          ('b', 'b2', 'Hodrimel Rusquin'),
        ]);
      });

      test('a blocked copy on the server being browsed is not the one '
          'shown', () async {
        await seedSharedMovie(ratedOn: 'a');
        sessions = [
          server('a', []),
          server('b', [catalogMovie('b1', 'Hodrimel', tmdb: '1002')]),
        ];

        final found = await moviesFound(viewModel(catalog()), 'hodrimel');

        expect(shown(found), isEmpty);
      });

      test('a stored catalog that loads late takes the movie with a blocked '
          'copy back out', () async {
        await seedSharedMovie(ratedOn: 'b');
        sessions = [
          server('a', [catalogMovie('a1', 'Hodrimel', tmdb: '1002')]),
          server('b', []),
        ];
        final service = _SlowCatalog(
          database: db,
          loadSessions: () async => sessions,
          activeServerId: () => 'a',
        );
        addTearDown(service.dispose);
        await service.loadNow();
        final vm = viewModel(service);

        fakeAsync((async) {
          service.gate = Completer();
          vm.searchImmediate('hodrimel');
          async.elapse(const Duration(seconds: 1));
          // Without the catalog only server a's own copy is known.
          expect(shown(vm.results.single.items), ['a:a1']);

          service.gate.complete();
          async.flushMicrotasks();

          expect(vm.results, isEmpty);
        });
      });

      test('nothing is left out when no copy carries the blocked rating',
          () async {
        await seedSharedMovie(ratedOn: 'none');
        sessions = [
          server('a', [catalogMovie('a1', 'Hodrimel', tmdb: '1002')]),
          server('b', []),
        ];

        final found = await moviesFound(viewModel(catalog()), 'hodrimel');

        expect(shown(found), ['a:a1']);
        expect(copies(found.single), [
          ('a', 'a1', 'Hodrimel'),
          ('b', 'b1', 'Hodrimel'),
        ]);
      });
    });

    test('a stored catalog that loads late with nothing to add changes '
        'nothing', () async {
      sessions = [
        server('a', []),
        server('b', [catalogMovie('b1', french, tmdb: '1005')]),
      ];
      final service = _SlowCatalog(
        database: db,
        loadSessions: () async => sessions,
        activeServerId: () => 'a',
      );
      addTearDown(service.dispose);
      await service.loadNow();
      final vm = viewModel(service);

      fakeAsync((async) {
        service.gate = Completer();
        vm.searchImmediate('sablier');
        async.elapse(const Duration(seconds: 1));
        final before = vm.results;
        var changes = 0;
        vm.addListener(() => changes++);

        service.gate.complete();
        async.flushMicrotasks();

        expect(changes, 0);
        expect(vm.results, same(before));
      });
    });
  });
}
