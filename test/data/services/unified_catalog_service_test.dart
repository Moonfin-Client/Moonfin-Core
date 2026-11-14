import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/offline/offline_catalog.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/pending_rating_store.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'unified_catalog_fakes.dart';

class _CountingUserDataSync extends UserDataSync {
  int lookups = 0;

  @override
  int revisionFor(String itemId) {
    lookups++;
    return super.revisionFor(itemId);
  }
}

void main() {
  late OfflineDatabase db;
  late FakeCatalogServer a;
  late FakeCatalogServer b;
  late List<FakeCatalogServer> signedIn;
  late DateTime now;
  late UserDataSync userData;

  UnifiedCatalogService build({
    Future<List<FakeCatalogServer>> Function()? servers,
    // Long enough that work is only cut into turns where a test asks for it.
    Duration frameBudget = const Duration(hours: 1),
    Iterable<({String serverId, String userId})> Function()? knownAccounts,
    bool Function()? isOffline,
    bool Function()? isMetered,
    bool Function()? isEnabled,
    Duration confirmDelay = Duration.zero,
    UserDataSync? userDataSync,
  }) {
    final service = UnifiedCatalogService(
      database: db,
      loadSessions: () async => [
        for (final server in await (servers?.call() ?? Future.value(signedIn)))
          server.session,
      ],
      activeServerId: () => 'a',
      knownAccounts: knownAccounts,
      isOffline: isOffline,
      isMetered: isMetered,
      isEnabled: isEnabled,
      confirmDelay: confirmDelay,
      now: () => now,
      userDataSync: userDataSync ?? userData,
      pageTimeout: const Duration(seconds: 5),
      retryDelay: Duration.zero,
      userDataDebounce: Duration.zero,
      userDataRetryDelay: Duration.zero,
      frameBudget: frameBudget,
    );
    addTearDown(service.dispose);
    return service;
  }

  List<Map<String, dynamic>> movies(
    UnifiedCatalogService service, {
    List<String> filters = const [],
  }) =>
      (service.query(
                UnifiedLibraryKind.movies,
                UnifiedCatalogQuery(itemTypes: 'Movie', filters: filters),
              )['Items']
              as List)
          .cast<Map<String, dynamic>>();

  List<String> movieNames(
    UnifiedCatalogService service, {
    List<String> filters = const [],
  }) => [
    for (final item in movies(service, filters: filters))
      item['Name'] as String,
  ];

  Future<List<CatalogEntry>> storedEntries() =>
      db.select(db.catalogEntries).get();

  Future<CatalogSyncState> syncStateOf(
    String serverId, {
    String itemType = 'Movie',
  }) =>
      (db.select(db.catalogSyncStates)..where(
            (t) => t.serverId.equals(serverId) & t.kind.equals(itemType),
          ))
          .getSingle();

  /// [count] movies of [server] with the ids `<server>0`, `<server>1`, ...
  /// and the names `Movie <server>0`, `Movie <server>1`, ...
  List<Map<String, dynamic>> numbered(String server, int count) => [
    for (var i = 0; i < count; i++)
      catalogMovie('$server$i', 'Movie $server$i'),
  ];

  bool playedOnDisk(CatalogEntry row) =>
      ((jsonDecode(row.metadataJson) as Map)['UserData'] as Map)['Played'] ==
      true;

  void advanceClock(Duration time) => now = now.add(time);

  setUp(() {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    now = unifiedTestNow;
    userData = UserDataSync();
    a = FakeCatalogServer('a')..stubApis();
    b = FakeCatalogServer('b', type: ServerType.emby)..stubApis();
    signedIn = [a, b];
  });

  tearDown(() async {
    userData.dispose();
    await db.close();
  });

  test('reads every server and folds the title they share', () async {
    a.movies = [
      catalogMovie('a1', 'Altovar', tmdb: '1001'),
      catalogMovie('a2', 'Hodrimel'),
    ];
    b.movies = [
      catalogMovie('b1', 'Altovar', tmdb: '1001'),
      catalogMovie('b2', 'Rusquin'),
    ];
    final service = build();

    await service.forceFullRead();

    expect(movieNames(service), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(service.serverCounts, (upToDate: 2, total: 2));
  });

  test('keeps each copy\'s original title, for the search', () async {
    a.movies = [
      {
        ...catalogMovie('a1', 'Selwick Fold', tmdb: '1006'),
        'OriginalTitle': 'Hoshi',
      },
    ];
    b.movies = [catalogMovie('b1', 'Le Verger de Tolvane', tmdb: '1006')];
    final service = build();

    await service.forceFullRead();

    expect(a.fullPageFields, everyElement(contains('OriginalTitle')));
    expect(unifiedSearchText(movies(service).single), contains('hoshi'));
    expect(unifiedSearchText(movies(service).single), contains('verger'));
  });

  test('walks a large library a page at a time', () async {
    a.movies = numbered('a', 650);
    final service = build();

    await service.forceFullRead();

    expect(a.fullPageStartIndexes, [0, 300, 600]);
    expect(
      service.query(
        UnifiedLibraryKind.movies,
        const UnifiedCatalogQuery(itemTypes: 'Movie'),
        limit: 48,
      )['TotalRecordCount'],
      650,
    );
  });

  group('forceFullRead (full read) that goes wrong', () {
    test('a read that fails part way through keeps the stored catalog, on '
        'disk too', () async {
      a.movies = numbered('a', 400);
      final service = build();
      await service.forceFullRead();

      a.movies = [
        for (var i = 0; i < 400; i++) catalogMovie('a$i', 'Changed $i'),
      ];
      a.failAtStartIndex = 300;
      await service.forceFullRead();

      // The first page did come back, so the read really failed part way.
      expect(a.fullPageStartIndexes.where((start) => start == 300), isNotEmpty);
      expect(movieNames(service), hasLength(400));
      expect(movieNames(service), everyElement(startsWith('Movie')));
      final stored = await storedEntries();
      expect(stored, hasLength(400));
      expect(
        stored.map((row) => row.metadataJson),
        everyElement(contains('"Name":"Movie ')),
      );
      expect(service.serverCounts, (upToDate: 1, total: 2));
    });

    test('a page that is empty before the count is reached does not cut '
        'the stored catalog down', () async {
      a.movies = numbered('a', 400);
      final service = build();
      await service.forceFullRead();

      // The server stops listing part way, at a different place on each read.
      a.emptyFromStartIndex = 300;
      a.onMoviePageRequest = (start) {
        if (start == 300) a.movies = a.movies.skip(1).toList();
      };
      await service.forceFullRead();

      expect(movieNames(service), hasLength(400));
      expect(await storedEntries(), hasLength(400));
      expect(service.serverCounts, (upToDate: 1, total: 2));
      expect(service.unreachableServerCount, 1);
    });

    test(
      'a server whose listing stops short at the same place each time is '
      'asked again later before titles are dropped',
      () async {
        a.movies = numbered('a', 400);
        final service = build();
        await service.forceFullRead();
        a.fullPageStartIndexes.clear();
        a.viewsRequests = 0;

        // The server stops listing part way during the first read, and
        // lists everything by the time it is asked again.
        a.emptyFromStartIndex = 300;
        a.onViewsRequest = () {
          if (a.viewsRequests == 2) a.emptyFromStartIndex = null;
        };
        await service.forceFullRead();

        expect(a.viewsRequests, 2);
        expect(movieNames(service), hasLength(400));
        expect(await storedEntries(), hasLength(400));
        expect(service.serverCounts, (upToDate: 2, total: 2));
      },
    );

    test('a server that lists no libraries once does not wipe the stored '
        'catalog', () async {
      a.movies = numbered('a', 400);
      final service = build();
      await service.forceFullRead();

      a.emptyViewsAnswers = 1;
      await service.forceFullRead();

      expect(movieNames(service), hasLength(400));
      expect(await storedEntries(), hasLength(400));
    });

    test('a server that lists part of the library is asked again before '
        'titles are dropped', () async {
      final all = numbered('a', 100);
      a.movies = all;
      final service = build();
      await service.forceFullRead();
      a.fullPageStartIndexes.clear();
      a.viewsRequests = 0;

      // The server is part way through a rescan on the first read and has
      // finished it by the second.
      a.movies = all.take(50).toList();
      a.onViewsRequest = () {
        if (a.viewsRequests == 2) a.movies = all;
      };
      await service.forceFullRead();

      expect(a.fullPageStartIndexes, [0, 0]);
      expect(movieNames(service), hasLength(100));
      expect(await storedEntries(), hasLength(100));
    });

    test('a server that refuses is not asked again and again', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      a.error = httpError(401);
      final service = build();

      await service.forceFullRead();

      expect(a.fullPageStartIndexes, [0]);
      expect(service.serverCounts, (upToDate: 1, total: 2));
    });

    test('a dropped connection is tried again', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      a.error = StateError('connection reset');
      final service = build();

      await service.forceFullRead();

      expect(a.fullPageStartIndexes, [0, 0, 0]);
    });
  });

  test('an emptied library is accepted once a second read confirms '
      'it', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    final service = build();
    await service.forceFullRead();

    a.movies = [];
    await service.forceFullRead();

    expect(movieNames(service), isEmpty);
    expect(await storedEntries(), isEmpty);
    expect(service.serverCounts, (upToDate: 2, total: 2));
  });

  test('a title the server dropped is gone after the next read', () async {
    a.movies = [catalogMovie('a1', 'Altovar'), catalogMovie('a2', 'Hodrimel')];
    final service = build();
    await service.forceFullRead();

    a.movies = [catalogMovie('a1', 'Altovar')];
    await service.forceFullRead();

    expect(movieNames(service), ['Altovar']);
  });

  test('a server that is down leaves the others readable', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    b.down = true;
    final service = build();

    await service.forceFullRead();

    expect(movieNames(service), ['Altovar']);
    expect(service.serverCounts, (upToDate: 1, total: 2));
  });

  test('a server counts as up to date only once it has been read', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.holdRequests = true;
    final service = build();
    await service.ensureLoaded();
    expect(service.serverCounts, (upToDate: 0, total: 2));

    final reading = service.forceFullRead();
    await pumpEventQueue();
    expect(service.isSyncing, isTrue);
    expect(service.serverCounts, (upToDate: 1, total: 2));

    b.letThrough();
    await reading;
    expect(service.isSyncing, isFalse);
    expect(service.serverCounts, (upToDate: 2, total: 2));
  });

  test('the stored catalog is there for the next launch', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    final first = build();
    await first.forceFullRead();

    a.down = true;
    b.down = true;
    final second = build();
    await second.ensureLoaded();

    expect(movieNames(second), ['Altovar']);
  });

  test('a load that fails is not remembered: the next ensureLoaded tries '
      'again', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    await build().forceFullRead();

    var fail = true;
    final service = build(
      servers: () async => fail ? throw StateError('not ready') : signedIn,
    );
    await expectLater(service.ensureLoaded(), throwsStateError);

    fail = false;
    await service.ensureLoaded();
    expect(movieNames(service), ['Altovar']);
  });

  test('a stored catalog that cannot be saved does not count against the '
      'server', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    final service = build();
    await service.forceFullRead();
    // Dropping the table stands in for a disk that fails.
    await db.customStatement('DROP TABLE catalog_entries');

    await service.forceFullRead();

    expect(service.unreachableServerCount, 0);
    expect(service.serverCounts, (upToDate: 0, total: 2));
    expect(movieNames(service), ['Altovar']);
  });

  group('syncNow (check)', () {
    /// Overwrites a stored row, so that a later rewrite of it shows.
    Future<void> tamperWithRow(String itemId) =>
        (db.update(
          db.catalogEntries,
        )..where((t) => t.itemId.equals(itemId))).write(
          CatalogEntriesCompanion(
            metadataJson: Value(jsonEncode(catalogMovie(itemId, 'Tampered'))),
          ),
        );

    Future<bool> rowStillTampered(String itemId) async =>
        (await storedEntries())
            .singleWhere((row) => row.itemId == itemId)
            .metadataJson
            .contains('Tampered');

    /// Read in full an hour ago: a check is due, another full read is not.
    Future<UnifiedCatalogService> synced() async {
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));
      return service;
    }

    test('with every count unchanged costs one small request per library, '
        'and rewrites nothing', () async {
      a.movies = numbered('a', 600);
      b.movies = numbered('b', 600);
      final service = build();
      await service.forceFullRead();
      expect(a.requests + b.requests, 8);
      expect(a.rowsSent + b.rowsSent, 1200);

      advanceClock(const Duration(hours: 1));
      await tamperWithRow('a7');
      final requests = a.requests + b.requests;
      final revision = service.revision;
      final titles = service.titlesRevision;
      var notified = 0;
      service.addListener(() => notified++);

      await service.syncNow();

      // Per server: its libraries, then the count of movies and of series.
      expect(a.requests + b.requests - requests, 6);
      expect(a.countRequests + b.countRequests, 4);
      expect(a.idPageStartIndexes, isEmpty);
      expect(a.rowRequests, isEmpty);
      expect(a.fullPageRequests + b.fullPageRequests, 6);
      expect(a.rowsSent + b.rowsSent, 1200);
      expect(await rowStillTampered('a7'), isTrue);
      expect(service.revision, revision);
      expect(service.titlesRevision, titles);
      expect(notified, greaterThan(0));
      expect(service.serverCounts, (upToDate: 2, total: 2));
      expect((await syncStateOf('a')).lastSyncedAt, now);
    });

    test('says which servers it is asking while it runs', () async {
      a.movies = numbered('a', 3);
      final service = await synced();
      final revision = service.revision;

      a.holdRequests = true;
      final checking = service.syncNow();
      await pumpEventQueue();
      expect(service.isSyncing, isTrue);
      expect(service.serverCounts, (upToDate: 1, total: 2));

      a.letThrough();
      await checking;
      expect(service.isSyncing, isFalse);
      expect(service.serverCounts, (upToDate: 2, total: 2));
      expect(service.revision, revision);
    });

    test('requests only the title that was added', () async {
      a.movies = numbered('a', 600);
      final service = await synced();
      await tamperWithRow('a7');
      final fullPages = a.fullPageRequests;
      final rowsSent = a.rowsSent;
      final titles = service.titlesRevision;

      a.movies = [...a.movies, catalogMovie('new', 'Zunmere')];
      await service.syncNow();

      expect(a.idPageStartIndexes, [0]);
      expect(a.rowRequests, [
        ['new'],
      ]);
      expect(a.fullPageRequests, fullPages);
      expect(a.rowsSent - rowsSent, 1);
      expect(movieNames(service), hasLength(601));
      expect(movieNames(service), contains('Zunmere'));
      expect(await storedEntries(), hasLength(601));
      expect(await rowStillTampered('a7'), isTrue);
      expect(service.titlesRevision, greaterThan(titles));
      final state = await syncStateOf('a');
      expect((state.serverTotal, state.itemCount), (601, 601));

      advanceClock(const Duration(minutes: 5));
      await service.syncNow();
      expect(a.idPageStartIndexes, [0]);
    });

    test('deletes only the title that was removed', () async {
      a.movies = numbered('a', 600);
      final service = await synced();
      await tamperWithRow('a7');
      final fullPages = a.fullPageRequests;

      a.movies = [...a.movies]..removeAt(300);
      await service.syncNow();

      expect(a.idPageStartIndexes, [0]);
      expect(a.rowRequests, isEmpty);
      expect(a.fullPageRequests, fullPages);
      expect(movieNames(service), hasLength(599));
      expect(movieNames(service), isNot(contains('Movie a300')));
      final stored = await storedEntries();
      expect(stored, hasLength(599));
      expect(stored.map((row) => row.itemId), isNot(contains('a300')));
      expect(await rowStillTampered('a7'), isTrue);
      final state = await syncStateOf('a');
      expect((state.serverTotal, state.itemCount), (599, 599));
    });

    test('lists a library past a thousand titles in pages of ids', () async {
      a.movies = numbered('a', 2100);
      final service = await synced();

      a.movies = [...a.movies, catalogMovie('new', 'Zunmere')];
      await service.syncNow();

      expect(a.idPageStartIndexes, [0, 1000, 2000]);
      expect(movieNames(service), hasLength(2101));
    });

    test('does not see a title swapped for another, which the daily full '
        'read does', () async {
      a.movies = numbered('a', 10);
      final service = await synced();
      final fullPages = a.fullPageRequests;

      a.movies = [...a.movies.skip(1), catalogMovie('new', 'Zunmere')];
      await service.syncNow();
      expect(a.idPageStartIndexes, isEmpty);
      expect(a.fullPageRequests, fullPages);
      expect(movieNames(service), contains('Movie a0'));
      expect(movieNames(service), isNot(contains('Zunmere')));

      advanceClock(const Duration(hours: 24));
      await service.syncNow();
      expect(a.fullPageRequests, greaterThan(fullPages));
      expect(movieNames(service), isNot(contains('Movie a0')));
      expect(movieNames(service), contains('Zunmere'));
    });

    test('that fails part way through listing ids changes nothing', () async {
      a.movies = numbered('a', 1500);
      final service = await synced();
      final before = await syncStateOf('a');

      a.movies = [
        ...a.movies.skip(1),
        catalogMovie('n1', 'New 1'),
        catalogMovie('n2', 'New 2'),
      ];
      a.failIdsAtStartIndex = 1000;
      await service.syncNow();

      expect(a.idPageStartIndexes, [0, 1000, 1000, 1000]);
      expect(a.rowRequests, isEmpty);
      expect(movieNames(service), hasLength(1500));
      expect(movieNames(service), contains('Movie a0'));
      final stored = await storedEntries();
      expect(stored, hasLength(1500));
      expect(stored.map((row) => row.itemId), contains('a0'));
      expect(stored.map((row) => row.itemId), isNot(contains('n1')));
      expect(await syncStateOf('a'), before);
      expect(service.serverCounts, (upToDate: 1, total: 2));

      a.failIdsAtStartIndex = null;
      await service.syncNow();
      expect(movieNames(service), hasLength(1501));
      expect(movieNames(service), isNot(contains('Movie a0')));
      expect(service.serverCounts, (upToDate: 2, total: 2));
    });

    test('of a server that refuses is not tried again and again', () async {
      a.movies = numbered('a', 3);
      final service = await synced();

      a.error = httpError(401);
      await service.syncNow();

      expect(a.countRequests, 1);
      expect(movieNames(service), hasLength(3));
      expect(service.serverCounts, (upToDate: 1, total: 2));
    });

    test('of a server that is down keeps its stored rows and still checks '
        'the other servers', () async {
      a.movies = numbered('a', 3);
      b.movies = numbered('b', 3);
      final service = await synced();
      final revision = service.revision;

      b.movies = [...b.movies, catalogMovie('new', 'Zunmere')];
      a.down = true;
      await service.syncNow();

      expect(movieNames(service), hasLength(7));
      expect(service.serverCounts, (upToDate: 1, total: 2));
      // Which servers answer decides the copy a shared title is shown from.
      expect(service.revision, greaterThan(revision));
    });

    group('that finds too much missing', () {
      test('reads the server in full instead', () async {
        a.movies = numbered('a', 10);
        final service = await synced();
        final fullPages = a.fullPageRequests;

        a.movies = [...a.movies, ...numbered('extra', 4)];
        await service.syncNow();

        expect(a.rowRequests, isEmpty);
        expect(a.fullPageRequests, greaterThan(fullPages));
        expect(movieNames(service), hasLength(14));
        expect((await syncStateOf('a')).lastFullSyncAt, now);
      });

      test('patches up to three titles in ten', () async {
        a.movies = numbered('a', 10);
        final service = await synced();
        final fullPages = a.fullPageRequests;
        final fullSyncAt = (await syncStateOf('a')).lastFullSyncAt;

        a.movies = [...a.movies, ...numbered('extra', 3)];
        await service.syncNow();

        expect(a.rowRequests, hasLength(1));
        expect(
          a.rowRequests.single,
          unorderedEquals(['extra0', 'extra1', 'extra2']),
        );
        expect(a.fullPageRequests, fullPages);
        expect(movieNames(service), hasLength(13));
        // Patching is not the daily full read, and must not postpone it.
        expect((await syncStateOf('a')).lastFullSyncAt, fullSyncAt);
      });

      test('reads in full a library that was empty', () async {
        final service = await synced();
        final fullPages = a.fullPageRequests;

        a.movies = numbered('a', 2);
        await service.syncNow();

        expect(a.rowRequests, isEmpty);
        expect(a.fullPageRequests, greaterThan(fullPages));
        expect(movieNames(service), hasLength(2));
      });
    });

    group('that finds a large part of the stored rows gone from the '
        'server', () {
      late List<Map<String, dynamic>> all;

      /// A hundred titles stored for a server that now lists and counts
      /// [listed].
      Future<UnifiedCatalogService> shrunkTo(int listed) async {
        all = numbered('a', 100);
        a.movies = all;
        final service = await synced();
        a.movies = all.take(listed).toList();
        a.viewsRequests = 0;
        a.fullPageStartIndexes.clear();
        return service;
      }

      test('deletes nothing when the server lists them all again', () async {
        final service = await shrunkTo(5);
        // By the third request, which starts the confirming read, the
        // server's rescan is over.
        a.onViewsRequest = () {
          if (a.viewsRequests == 3) a.movies = all;
        };

        await service.syncNow();

        expect(a.fullPageStartIndexes, [0, 0]);
        expect(movieNames(service), hasLength(100));
        expect(await storedEntries(), hasLength(100));
        expect((await syncStateOf('a')).serverTotal, 100);
      });

      test('keeps the stored rows while the server\'s count is still '
          'changing', () async {
        final service = await shrunkTo(5);
        a.onViewsRequest = () {
          if (a.viewsRequests == 3) a.movies = all.take(40).toList();
        };

        await service.syncNow();

        expect(movieNames(service), hasLength(100));
        expect(await storedEntries(), hasLength(100));
        expect((await syncStateOf('a')).serverTotal, 100);
        expect(service.serverCounts, (upToDate: 1, total: 2));
      });

      test('drops them once a second read says the same', () async {
        final service = await shrunkTo(5);

        await service.syncNow();

        expect(a.fullPageStartIndexes, [0, 0]);
        expect(movieNames(service), hasLength(5));
        expect(await storedEntries(), hasLength(5));
        expect((await syncStateOf('a')).serverTotal, 5);
      });

      test('patches a few titles gone from a small library', () async {
        a.movies = numbered('a', 10);
        final service = await synced();
        final fullPages = a.fullPageRequests;

        a.movies = a.movies.take(6).toList();
        await service.syncNow();

        expect(a.fullPageRequests, fullPages);
        expect(movieNames(service), hasLength(6));
      });
    });

    test('answered with no libraries once does not wipe the stored '
        'catalog', () async {
      a.movies = numbered('a', 5);
      final service = await synced();

      a.emptyViewsAnswers = 1;
      await service.syncNow();

      expect(movieNames(service), hasLength(5));
      expect(await storedEntries(), hasLength(5));
    });

    test('reads the server in full when it lists a title it will not hand '
        'over', () async {
      a.movies = numbered('a', 10);
      final service = await synced();
      final fullPages = a.fullPageRequests;

      a.movies = [...a.movies, catalogMovie('new', 'Zunmere')];
      a.withheldIds.add('new');
      await service.syncNow();

      expect(a.rowRequests, hasLength(1));
      expect(a.fullPageRequests, greaterThan(fullPages));
      expect(movieNames(service), hasLength(11));
    });

    test('compares the server\'s count with its previous count, not with '
        'the number of stored rows', () async {
      // One title sits in both movie libraries: counted twice, stored once.
      a.movies = numbered('a', 8);
      a.moreMovies = [a.movies.last, catalogMovie('a8', 'Rusquin')];
      final service = await synced();
      expect(movieNames(service), hasLength(9));
      final state = await syncStateOf('a');
      expect((state.serverTotal, state.itemCount), (10, 9));

      await service.syncNow();
      expect(a.idPageStartIndexes, isEmpty);

      advanceClock(const Duration(minutes: 5));
      a.moreMovies = [...a.moreMovies, catalogMovie('a9', 'Zunmere')];
      await service.syncNow();
      expect(a.rowRequests, [
        ['a9'],
      ]);
      expect(movieNames(service), hasLength(10));
      final after = await syncStateOf('a');
      expect((after.serverTotal, after.itemCount), (11, 10));
    });

    test('keeps a watched change made while it runs', () async {
      signedIn = [a];
      a.movies = numbered('a', 5);
      final service = await synced();

      a.movies = [...a.movies, catalogMovie('new', 'Zunmere')];
      a.holdRequests = true;
      final checking = service.syncNow();
      await pumpEventQueue();
      expect(a.heldRequests, hasLength(1));
      service.applyUserData('a', {
        'a1': {'Played': true},
      });
      a.letThrough();
      await checking;
      await pumpEventQueue();

      expect(a.rowRequests, hasLength(1));
      expect(movieNames(service), hasLength(6));
      expect(movieNames(service, filters: ['IsPlayed']), ['Movie a1']);
      expect(
        {
          for (final row in await storedEntries())
            if (playedOnDisk(row)) row.itemId,
        },
        {'a1'},
      );
    });

    test('cut off by an account change writes nothing', () async {
      signedIn = [a];
      a.movies = numbered('a', 5);
      final service = await synced();
      final before = await syncStateOf('a');

      a.movies = [...a.movies, catalogMovie('new', 'Zunmere')];
      a.holdRequests = true;
      final checking = service.syncNow();
      await pumpEventQueue();
      expect(a.heldRequests, hasLength(1));
      service.reset();
      a.letThrough();
      await checking;
      await pumpEventQueue();

      expect(a.rowRequests, isEmpty);
      expect(await storedEntries(), hasLength(5));
      expect(await syncStateOf('a'), before);
      expect(service.isSyncing, isFalse);

      await service.syncNow();
      expect(movieNames(service), hasLength(6));
      expect(service.serverCounts, (upToDate: 1, total: 1));
    });
  });

  group('when a server is read in full', () {
    test('a server never read: on the first check', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();

      await service.syncNow();

      expect(a.countRequests, 0);
      expect(a.fullPageRequests, 2);
      expect(movieNames(service), ['Altovar']);
      expect(service.serverCounts, (upToDate: 2, total: 2));
    });

    test('once a day, however often it is checked in between', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      final fullPages = a.fullPageRequests;

      for (var hour = 1; hour < 24; hour++) {
        advanceClock(const Duration(hours: 1));
        await service.syncNow();
      }
      expect(a.fullPageRequests, fullPages);
      expect(a.countRequests, 23 * 2);

      advanceClock(const Duration(hours: 1));
      await service.syncNow();
      expect(a.fullPageRequests, fullPages + 2);
    });

    test('a full read dated in the future (clock set back) is '
        'redone', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      final fullPages = a.fullPageRequests;

      now = now.subtract(const Duration(days: 1));
      await service.syncNow();

      expect(a.fullPageRequests, greaterThan(fullPages));
    });

    test('whenever forceFullRead is called', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      final fullPages = a.fullPageRequests;

      await service.forceFullRead();

      expect(a.fullPageRequests, fullPages + 2);
      expect(a.countRequests, 0);
    });

    test('a stored catalog from before counts were kept is read in full '
        'once', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      await build().forceFullRead();
      // This is what an install that synced before the upgrade has on disk.
      await db
          .update(db.catalogSyncStates)
          .write(
            const CatalogSyncStatesCompanion(
              serverTotal: Value(null),
              lastFullSyncAt: Value(null),
            ),
          );
      advanceClock(const Duration(hours: 1));
      final fullPages = a.fullPageRequests;

      final service = build();
      await service.syncNow();

      expect(a.fullPageRequests, fullPages + 2);
      expect(
        (await db.select(db.catalogSyncStates).get()).map(
          (state) => state.lastFullSyncAt,
        ),
        everyElement(now),
      );
    });
  });

  group('how often the servers are asked', () {
    test('a server checked within the last minute is left alone', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));

      await service.syncNow();
      final requests = a.requests + b.requests;
      advanceClock(const Duration(seconds: 59));
      await service.syncNow();
      expect(a.requests + b.requests, requests);
      expect(service.serverCounts, (upToDate: 2, total: 2));

      advanceClock(const Duration(seconds: 1));
      await service.syncNow();
      expect(a.requests + b.requests, requests + 6);
    });

    test('a server that failed its check is asked on the next one', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));

      a.down = true;
      await service.syncNow();
      expect(service.serverCounts, (upToDate: 1, total: 2));
      a.down = false;
      final requestsBefore = b.requests;
      await service.syncNow();

      expect(service.serverCounts, (upToDate: 2, total: 2));
      expect(b.requests, requestsBefore);
    });

    test('syncOnLaunch checks once, until the accounts change', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));

      await Future.wait([service.syncOnLaunch(), service.syncOnLaunch()]);
      final requests = a.requests + b.requests;
      expect(a.countRequests + b.countRequests, 4);
      advanceClock(const Duration(hours: 1));
      await service.syncOnLaunch();
      expect(a.requests + b.requests, requests);

      service.reset();
      await service.syncOnLaunch();
      expect(a.requests + b.requests, requests + 6);
    });

    test('syncOnLaunch asked before anybody is known to be signed in tries '
        'again', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final everyone = signedIn;
      signedIn = [];
      final service = build();
      await service.syncOnLaunch();
      expect(a.requests, 0);

      signedIn = everyone;
      service.reset();
      signedIn = [];
      await service.syncOnLaunch();
      signedIn = everyone;
      await service.syncOnLaunch();

      await service.ensureLoaded();
      expect(movieNames(service), ['Altovar']);
    });
  });

  test('says which kinds a server holds without decoding its stored '
      'rows', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.series = [
      {'Id': 'b1', 'Name': 'Dastrel', 'Type': 'Series', 'UserData': {}},
    ];
    await build().forceFullRead();

    final service = build();
    expect(await service.kindsHeldBy('a'), {UnifiedLibraryKind.movies});
    expect(await service.kindsHeldBy('b'), {UnifiedLibraryKind.series});
    expect(await service.kindsHeldBy('nobody'), isEmpty);
    expect(service.rowsDecoded, 0);

    signedIn = [a];
    expect(await service.kindsHeldBy('b'), isEmpty);
  });

  test('the disk is only searched for signed-out accounts when the accounts '
      'change', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    final service = build();
    await service.forceFullRead();
    // A row inserted directly into the database shows whether the service
    // searched the disk.
    await db
        .into(db.catalogSyncStates)
        .insert(
          CatalogSyncStatesCompanion.insert(
            serverId: 'gone',
            userId: 'user',
            kind: 'Movie',
            lastSyncedAt: now,
          ),
        );

    await service.forceFullRead();
    expect(
      (await db.select(db.catalogSyncStates).get()).map((s) => s.serverId),
      contains('gone'),
    );

    signedIn = [a];
    service.reset();
    await service.forceFullRead();
    expect(
      (await db.select(db.catalogSyncStates).get()).map((s) => s.serverId),
      everyElement('a'),
    );
  });

  group('reads that overlap', () {
    test('a read left over from before a reset does not let a second one '
        'start beside the new one', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      a.holdRequests = true;
      final service = build();

      final before = service.syncNow();
      await pumpEventQueue();
      service.reset();
      final after = service.syncNow();
      await pumpEventQueue();
      expect(a.heldRequests, hasLength(2));

      a.releaseNext();
      await before;
      await pumpEventQueue();
      final joined = service.syncNow();
      await pumpEventQueue();
      expect(a.heldRequests, hasLength(1));
      expect(service.isSyncing, isTrue);

      a.holdRequests = false;
      a.releaseNext();
      await Future.wait([after, joined]);
      expect(movieNames(service), ['Altovar']);
    });

    test('forceFullRead called during a syncNow that only checks still '
        'reads every server in full', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      final service = build();
      await service.forceFullRead();
      final fullPagesBefore = a.fullPageStartIndexes.length;

      signedIn = [a, b];
      b.holdRequests = true;
      final skipping = service.syncNow();
      await pumpEventQueue();
      expect(b.heldRequests, hasLength(1));
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      final forced = service.forceFullRead();
      await pumpEventQueue();

      b.holdRequests = false;
      b.releaseNext();
      await Future.wait([skipping, forced]);

      expect(a.fullPageStartIndexes.length, greaterThan(fullPagesBefore));
      expect(movieNames(service), ['Altovar', 'Hodrimel', 'Rusquin']);
    });
  });

  test('with no sign-in store given, an account that signed out is pruned '
      'from disk by the next read', () async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    final service = build();
    await service.forceFullRead();

    signedIn = [a];
    service.reset();
    await service.forceFullRead();

    expect(movieNames(service), ['Altovar']);
    expect((await storedEntries()).map((row) => row.serverId).toSet(), {'a'});
  });

  group('an account that is left out of the signed-in ones', () {
    late Set<({String serverId, String userId})> stored;

    setUp(() {
      a.movies = [catalogMovie('a1', 'Altovar')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      stored = {
        (serverId: 'a', userId: 'user'),
        (serverId: 'b', userId: 'user'),
      };
    });

    test(
      'keeps its stored rows while the device still holds its sign-in',
      () async {
        final service = build(knownAccounts: () => stored);
        await service.forceFullRead();

        // Its token could not be read this once.
        signedIn = [a];
        service.reset();
        await service.forceFullRead();
        expect(movieNames(service), ['Altovar']);
        expect(
          (await storedEntries()).map((row) => row.serverId).toSet(),
          {'a', 'b'},
        );

        final requestsBefore = b.requests;
        signedIn = [a, b];
        service.reset();
        await service.syncNow();
        expect(movieNames(service), ['Altovar', 'Rusquin']);
        expect(b.fullPageRequests, 2);
        expect(b.requests, requestsBefore);
      },
    );

    test(
      'loses its stored rows once the device no longer holds its sign-in',
      () async {
        final service = build(knownAccounts: () => stored);
        await service.forceFullRead();

        signedIn = [a];
        stored = {(serverId: 'a', userId: 'user')};
        service.reset();
        await service.forceFullRead();

        expect(
          (await storedEntries()).map((row) => row.serverId).toSet(),
          {'a'},
        );
        expect(
          (await db.select(db.catalogSyncStates).get()).map((s) => s.serverId),
          everyElement('a'),
        );
      },
    );

    test('keeps its stored rows when the stored sign-ins cannot be '
        'read', () async {
      final service = build(
        knownAccounts: () => throw StateError('store not ready'),
      );
      await service.forceFullRead();

      signedIn = [a];
      service.reset();
      await service.forceFullRead();

      expect(
        (await storedEntries()).map((row) => row.serverId).toSet(),
        {'a', 'b'},
      );
      expect(service.serverCounts, (upToDate: 1, total: 1));
    });
  });

  group('while the app is offline', () {
    late bool offline;
    late OfflineCatalog downloads;

    /// The app's client for [server], which answers from no downloads offline.
    Future<void> browseThroughAppClient(FakeCatalogServer server) async {
      SharedPreferences.setMockInitialValues({});
      final prefs = PreferenceStore();
      await prefs.init();
      final repo = OfflineRepository(db);
      downloads = OfflineCatalog(repo);
      server.appClient = ConnectivityAwareMediaServerClient(
        server.client,
        useOffline: () => offline,
        catalog: downloads,
        storagePath: StoragePathService(),
        pendingRatings: PendingRatingStore(prefs),
        offlineRepo: repo,
      );
    }

    setUp(() async {
      offline = false;
      signedIn = [a];
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      await browseThroughAppClient(a);
    });

    tearDown(() => downloads.dispose());

    test('the stored catalog is never written from the downloads', () async {
      // The service is not told it is offline, as when the connection drops
      // between its deciding to read and the requests going out.
      final service = build();
      await service.forceFullRead();
      final requestsBefore = a.requests;

      offline = true;
      await service.forceFullRead();

      expect(a.requests, greaterThan(requestsBefore));
      expect(movieNames(service), ['Altovar', 'Hodrimel']);
      expect(await storedEntries(), hasLength(2));
    });

    test('no server is asked and every stored row stays', () async {
      final service = build(isOffline: () => offline);
      await service.forceFullRead();
      final requestsBefore = a.requests;
      final revision = service.revision;

      offline = true;
      advanceClock(const Duration(days: 2));
      await service.syncNow();
      await service.forceFullRead();

      expect(a.requests, requestsBefore);
      expect(movieNames(service), ['Altovar', 'Hodrimel']);
      expect(await storedEntries(), hasLength(2));
      expect(service.serverCounts, (upToDate: 1, total: 1));
      expect(service.isSyncing, isFalse);
      expect(service.revision, revision);
    });

    test('watched state is not asked for', () async {
      final service = build(isOffline: () => offline);
      await service.forceFullRead();

      offline = true;
      await service.refreshUserData([(serverId: 'a', itemId: 'a1')]);

      expect(a.userDataRequests, isEmpty);
    });

    test('a title not among the downloads is not taken for gone', () async {
      final service = build(isOffline: () => offline);
      await service.forceFullRead();

      offline = true;
      await service.removeCopy('a', 'a1');

      expect(movieNames(service), ['Altovar', 'Hodrimel']);
      expect(await storedEntries(), hasLength(2));
    });

    test('going offline part way does not count against the server', () async {
      final service = build(isOffline: () => offline);
      await service.forceFullRead();

      a.holdRequests = true;
      final reading = service.forceFullRead();
      await pumpEventQueue();
      offline = true;
      a.error = StateError('no connection');
      a.letThrough();
      await reading;

      expect(movieNames(service), ['Altovar', 'Hodrimel']);
      expect(service.serverCounts, (upToDate: 1, total: 1));
    });

    test('syncOnLaunch checks once the app is back online', () async {
      final service = build(isOffline: () => offline);
      await service.forceFullRead();
      final requestsBefore = a.requests;

      offline = true;
      advanceClock(const Duration(hours: 1));
      service.reset();
      await service.syncOnLaunch();
      expect(a.requests, requestsBefore);

      offline = false;
      await service.syncOnLaunch();
      expect(a.requests, greaterThan(requestsBefore));
    });
  });

  group('asked who is signed in while the accounts are being switched', () {
    late bool ready;

    setUp(() {
      a.movies = [catalogMovie('a1', 'Altovar')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      ready = true;
    });

    UnifiedCatalogService switching() =>
        build(servers: () async => ready ? signedIn : <FakeCatalogServer>[]);

    test('an answer of nobody is not kept for the next load', () async {
      final service = switching();
      await service.forceFullRead();

      ready = false;
      service.reset();
      await service.ensureLoaded();
      expect(movieNames(service), isEmpty);

      ready = true;
      await service.ensureLoaded();
      expect(movieNames(service), ['Altovar', 'Rusquin']);
      expect(service.serverCounts, (upToDate: 2, total: 2));
    });

    test('asking again with still nobody reports nothing new', () async {
      final service = switching();
      ready = false;
      await service.ensureLoaded();
      var notified = 0;
      service.addListener(() => notified++);

      await service.ensureLoaded();
      await service.ensureLoaded();

      expect(notified, 0);
    });

    test('a reset says the accounts changed', () async {
      final service = switching();
      final session = service.session;

      service.reset();

      expect(service.session, greaterThan(session));
    });
  });

  test(
    'a session store that answers with nobody does not empty the disk',
    () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      final service = build();
      await service.forceFullRead();

      signedIn = [];
      service.reset();
      await service.forceFullRead();
      expect(await storedEntries(), hasLength(2));

      signedIn = [a, b];
      service.reset();
      await service.ensureLoaded();
      expect(movieNames(service), ['Altovar', 'Rusquin']);
    },
  );

  group('watched state', () {
    test('reaches the catalog in memory and the disk', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();

      service.applyUserData('a', {
        'a1': {'Played': true},
      });
      await pumpEventQueue();

      expect(movieNames(service, filters: ['IsPlayed']), ['Altovar']);
      expect(playedOnDisk((await storedEntries()).single), isTrue);
    });

    test('stays with the server it came from when two share an id', () async {
      a.movies = [catalogMovie('7', 'Altovar')];
      b.movies = [catalogMovie('7', 'Rusquin')];
      final service = build();
      await service.forceFullRead();

      service.applyUserData('b', {
        '7': {'Played': true},
      });
      await pumpEventQueue();

      expect(movieNames(service, filters: ['IsPlayed']), ['Rusquin']);
      expect(
        {
          for (final row in await storedEntries())
            row.serverId: playedOnDisk(row),
        },
        {'a': false, 'b': true},
      );
    });

    test('is not written over another profile of the same server', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      await db
          .into(db.catalogEntries)
          .insert(
            CatalogEntriesCompanion.insert(
              serverId: 'a',
              userId: 'someone-else',
              itemId: 'a1',
              kind: 'Movie',
              metadataJson: jsonEncode(catalogMovie('a1', 'Altovar')),
            ),
          );

      service.applyUserData('a', {
        'a1': {'Played': true},
      });
      await pumpEventQueue();

      expect(
        {
          for (final row in await storedEntries())
            row.userId: playedOnDisk(row),
        },
        {'user': true, 'someone-else': false},
      );
    });

    test('changed anywhere in the app is asked of the servers holding that '
        'id, and only the one that agrees takes it', () async {
      a.movies = [catalogMovie('7', 'Altovar')];
      b.movies = [catalogMovie('7', 'Rusquin')];
      final service = build();
      await service.forceFullRead();
      var notified = 0;
      service.addListener(() => notified++);

      // Watched on b, from a screen that knows nothing of the catalog.
      b.setUserData('7', {'Played': true});
      userData.publish('7', {'Played': true});
      await pumpEventQueue();

      // Server a can't be told from one that has yet to record the change,
      // so it is asked again, a few times at most.
      expect(a.userDataRequests, isNotEmpty);
      expect(a.userDataRequests.length, lessThanOrEqualTo(3));
      expect(a.userDataRequests, everyElement(['7']));
      expect(b.userDataRequests, [
        ['7'],
      ]);
      expect(movieNames(service, filters: ['IsPlayed']), ['Rusquin']);
      expect(notified, greaterThan(0));
      expect(
        {
          for (final row in await storedEntries())
            row.serverId: playedOnDisk(row),
        },
        {'a': false, 'b': true},
      );
    });

    test(
      'a change is looked up, not searched for among every stored title',
      () async {
        final counting = _CountingUserDataSync();
        userData.dispose();
        userData = counting;
        signedIn = [a];
        a.movies = numbered('a', 300);
        final service = build();
        await service.forceFullRead();

        a.setUserData('a7', {'Played': true});
        counting.publish('a7', {'Played': true});
        await pumpEventQueue();

        expect(a.userDataRequests, [
          ['a7'],
        ]);
        expect(counting.lookups, lessThan(10));
        expect(movies(service, filters: ['IsPlayed']), hasLength(1));
      },
    );

    test('a change for an id no server lists costs no request', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();

      userData.publish('an-episode', {'Played': true});
      await pumpEventQueue();

      expect(a.userDataRequests, isEmpty);
      expect(movieNames(service, filters: ['IsPlayed']), isEmpty);
    });

    test('published before the server has it is asked for again', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();

      // The server's first answer still holds the old state.
      a.afterUserDataRequest = () {
        a.afterUserDataRequest = null;
        a.setUserData('a1', {'Played': true});
      };
      userData.publish('a1', {'Played': true});
      await pumpEventQueue();

      expect(a.userDataRequests, hasLength(2));
      expect(movieNames(service, filters: ['IsPlayed']), ['Altovar']);
    });

    test('a server answering late is asked again, though another server '
        'holds the change under the same id', () async {
      a.movies = [catalogMovie('7', 'Altovar')];
      b.movies = [catalogMovie('7', 'Rusquin')];
      b.setUserData('7', {'Played': true});
      final service = build();
      await service.forceFullRead();
      expect(movieNames(service, filters: ['IsPlayed']), ['Rusquin']);

      // Server a's first answer still holds the old state.
      a.afterUserDataRequest = () {
        a.afterUserDataRequest = null;
        a.setUserData('7', {'Played': true});
      };
      userData.publish('7', {'Played': true});
      await pumpEventQueue();

      expect(a.userDataRequests, hasLength(2));
      expect(b.userDataRequests, hasLength(1));
      expect(
        movieNames(service, filters: ['IsPlayed']),
        unorderedEquals(['Altovar', 'Rusquin']),
      );
    });

    test('changed while the server is being read survives the read', () async {
      signedIn = [a];
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      final service = build();
      await service.forceFullRead();

      a.holdRequests = true;
      final reading = service.forceFullRead();
      await pumpEventQueue();
      service.applyUserData('a', {
        'a1': {'Played': true},
      });
      a.holdRequests = false;
      a.releaseNext();
      await reading;
      await pumpEventQueue();

      expect(movieNames(service, filters: ['IsPlayed']), ['Altovar']);
      expect(
        {
          for (final row in await storedEntries())
            row.itemId: playedOnDisk(row),
        },
        {'a1': true, 'a2': false},
      );
    });

    test(
      'changed while a read that then fails is running is still saved',
      () async {
        signedIn = [a];
        a.movies = [catalogMovie('a1', 'Altovar')];
        final service = build();
        await service.forceFullRead();

        a.holdRequests = true;
        final reading = service.forceFullRead();
        await pumpEventQueue();
        service.applyUserData('a', {
          'a1': {'Played': true},
        });
        a.error = httpError(403);
        a.holdRequests = false;
        a.releaseNext();
        await reading;
        await pumpEventQueue();

        expect(playedOnDisk((await storedEntries()).single), isTrue);
      },
    );
  });

  group('removing a copy', () {
    test('leaves the other server its own', () async {
      a.movies = [catalogMovie('a1', 'Altovar', tmdb: '1001')];
      b.movies = [catalogMovie('b1', 'Altovar', tmdb: '1001')];
      final service = build();
      await service.forceFullRead();

      await service.removeCopy('a', 'a1');

      expect(movies(service).single[unifiedServerIdKey], 'b');
    });

    test('leaves another profile of the same server its own', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      await db
          .into(db.catalogEntries)
          .insert(
            CatalogEntriesCompanion.insert(
              serverId: 'a',
              userId: 'someone-else',
              itemId: 'a1',
              kind: 'Movie',
              metadataJson: jsonEncode(catalogMovie('a1', 'Altovar')),
            ),
          );

      await service.removeCopy('a', 'a1');

      expect(
        (await storedEntries()).map((row) => row.userId),
        ['someone-else'],
      );
    });
  });

  group('a snapshot', () {
    test(
      'keeps its titles and order whatever the catalog does after',
      () async {
        a.movies = numbered('a', 50);
        b.movies = [
          for (var i = 0; i < 50; i++) catalogMovie('b$i', 'Other $i'),
        ];
        final service = build();
        await service.forceFullRead();

        final snapshot = service.snapshot(
          UnifiedLibraryKind.movies,
          const UnifiedCatalogQuery(itemTypes: 'Movie', sortBy: 'Random'),
          random: Random(7),
        );
        final firstPage = snapshot.page(limit: 30)['Items'] as List;
        service.applyUserData('a', {
          'a1': {'Played': true},
        });
        await service.removeCopy('b', 'b3');
        service.query(
          UnifiedLibraryKind.series,
          const UnifiedCatalogQuery(itemTypes: 'Series'),
        );
        final rest = snapshot.page(startIndex: 30)['Items'] as List;

        final ids = [
          for (final item in [...firstPage, ...rest])
            '${(item as Map)[unifiedServerIdKey]}|${item['Id']}',
        ];
        expect(ids.toSet(), hasLength(100));
        expect(snapshot.page()['TotalRecordCount'], 100);
      },
    );

    test('says which titles it was taken from', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      final service = build();
      await service.forceFullRead();
      final snapshot = service.snapshot(
        UnifiedLibraryKind.movies,
        const UnifiedCatalogQuery(itemTypes: 'Movie'),
      );

      service.applyUserData('a', {
        'a1': {'Played': true},
      });
      expect(service.titlesRevision, snapshot.titlesRevision);
      expect(service.revision, greaterThan(snapshot.revision));

      await service.removeCopy('a', 'a2');
      expect(service.titlesRevision, greaterThan(snapshot.titlesRevision));
    });
  });

  group('revisions', () {
    test(
      'a read that brings back the same titles is not a change of them',
      () async {
        a.movies = [catalogMovie('a1', 'Altovar')];
        final service = build();
        await service.forceFullRead();
        final titles = service.titlesRevision;

        await service.forceFullRead();
        expect(service.titlesRevision, titles);

        a.movies = [catalogMovie('a1', 'Altovar: Director\'s Cut')];
        await service.forceFullRead();
        expect(service.titlesRevision, greaterThan(titles));
      },
    );

    test('a watched change folds its own title again and no other', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar', tmdb: '1001'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      b.movies = [
        catalogMovie('b1', 'Altovar', tmdb: '1001'),
        catalogMovie('b2', 'Rusquin'),
      ];
      final service = build();
      await service.forceFullRead();
      Map<String, dynamic>? item(String serverId, String itemId) =>
          service.currentItem(UnifiedLibraryKind.movies, serverId, itemId);
      final sharedMovie = item('a', 'a1');
      final movieOnA = item('a', 'a2');
      final movieOnB = item('b', 'b2');
      final revision = service.revision;

      service.applyUserData('b', {
        'b1': {'Played': true},
      });

      expect(item('a', 'a2'), same(movieOnA));
      expect(item('b', 'b2'), same(movieOnB));
      expect(item('a', 'a1'), isNot(same(sharedMovie)));
      expect(item('a', 'a1'), same(item('b', 'b1')));
      expect((item('a', 'a1')!['UserData'] as Map)['Played'], isTrue);
      expect(unifiedCopiesOf(item('a', 'a1')!).map((v) => v.played), [
        false,
        true,
      ]);
      // The item fetched before the change is untouched, so a page already
      // built from it stays valid.
      expect((sharedMovie!['UserData'] as Map)['Played'], isFalse);
      expect(movieNames(service), ['Altovar', 'Hodrimel', 'Rusquin']);
      expect(movieNames(service, filters: ['IsPlayed']), ['Altovar']);
      expect(service.userDataChangedSince(revision), {
        (serverId: 'b', itemId: 'b1'),
      });
    });

    test(
      'userDataChangedSince names the copies that changed, until more than '
      'watched state changes',
      () async {
        a.movies = [
          catalogMovie('a1', 'Altovar'),
          catalogMovie('a2', 'Hodrimel'),
        ];
        signedIn = [a];
        final service = build();
        await service.forceFullRead();
        final revision = service.revision;

        service.applyUserData('a', {
          'a1': {'Played': true},
        });
        final afterFirst = service.revision;
        service.applyUserData('a', {
          'a2': {'Played': true},
        });
        expect(service.userDataChangedSince(revision), {
          (serverId: 'a', itemId: 'a1'),
          (serverId: 'a', itemId: 'a2'),
        });
        expect(service.userDataChangedSince(afterFirst), {
          (serverId: 'a', itemId: 'a2'),
        });
        expect(service.userDataChangedSince(service.revision), isEmpty);

        await service.removeCopy('a', 'a2');
        expect(service.userDataChangedSince(revision), isNull);
      },
    );

    test('a query is cut from a merged list that is built once per '
        'change', () async {
      a.movies = [catalogMovie('a1', 'Altovar', tmdb: '1001')];
      b.movies = [catalogMovie('b1', 'Altovar', tmdb: '1001')];
      final service = build();
      await service.forceFullRead();

      Map<String, dynamic> sharedMovie() => movies(service).single;
      final first = sharedMovie();
      expect(sharedMovie(), same(first));
      expect(service.facets(UnifiedLibraryKind.movies).years, isEmpty);
      expect(
        service.currentItem(UnifiedLibraryKind.movies, 'b', 'b1'),
        same(first),
      );

      service.applyUserData('b', {
        'b1': {'Played': true},
      });
      expect(sharedMovie(), isNot(same(first)));
      expect((sharedMovie()['UserData'] as Map)['Played'], isTrue);
    });
  });

  group('a large library', () {
    setUp(() {
      signedIn = [a];
      a.movies = numbered('a', 600);
    });

    test('is written in turns, so frames get drawn in between', () async {
      final service = build(frameBudget: Duration.zero);

      final turns = await turnsDuring(service.forceFullRead);

      expect(turns, greaterThan(300));
    });

    test('is read from disk in turns', () async {
      await build().forceFullRead();
      final service = build(frameBudget: Duration.zero);

      final turns = await turnsDuring(service.ensureLoaded);

      expect(turns, greaterThan(300));
      expect(movieNames(service), hasLength(600));
    });
  });

  group('a library that changes while it is being read', () {
    setUp(() => signedIn = [a]);

    test('a title added between two pages is not missed', () async {
      a.movies = numbered('a', 400);
      // The added title sorts first, so page two starts with the last title
      // of page one again.
      var added = false;
      a.onMoviePageRequest = (start) {
        if (start == 300 && !added) {
          added = true;
          a.movies = [catalogMovie('a-new', 'Added'), ...a.movies];
        }
      };
      final service = build();

      await service.forceFullRead();

      expect(a.fullPageStartIndexes, [0, 300, 0, 300]);
      expect(movieNames(service), hasLength(401));
      expect(movieNames(service), contains('Added'));
      expect(await storedEntries(), hasLength(401));
      expect((await syncStateOf('a')).serverTotal, 401);

      advanceClock(const Duration(hours: 1));
      await service.syncNow();
      expect(a.idPageStartIndexes, isEmpty);
      expect(a.rowRequests, isEmpty);
    });

    test('a title removed between two pages forces the read to '
        'restart', () async {
      a.movies = numbered('a', 400);
      var removed = false;
      a.onMoviePageRequest = (start) {
        if (start == 300 && !removed) {
          removed = true;
          a.movies = a.movies.skip(1).toList();
        }
      };
      final service = build();

      await service.forceFullRead();

      // The first pass skipped a title, yet listed as many as were counted.
      expect(a.fullPageStartIndexes, [0, 300, 0, 300]);
      expect(movieNames(service), hasLength(399));
      expect(
        (await storedEntries()).map((row) => row.itemId).toSet(),
        a.movies.map((movie) => movie['Id']).toSet(),
      );
    });

    test('a library that never stops changing is taken as listed, and the '
        'next check lists its ids to settle what was missed', () async {
      a.movies = numbered('a', 400);
      var changing = true;
      var next = 0;
      a.onMoviePageRequest = (start) {
        if (changing && start == 300) {
          a.movies = [
            catalogMovie('a-new${next++}', 'Added $next'),
            ...a.movies,
          ];
        }
      };
      final service = build();

      await service.forceFullRead();

      expect(a.fullPageStartIndexes, [0, 300, 0, 300]);
      expect(service.unreachableServerCount, 0);
      expect((await syncStateOf('a')).serverTotal, isNull);
      expect(movieNames(service), hasLength(lessThan(402)));

      changing = false;
      advanceClock(const Duration(hours: 1));
      await service.syncNow();

      expect(a.idPageStartIndexes, isNotEmpty);
      expect(movieNames(service), hasLength(402));
      expect((await syncStateOf('a')).serverTotal, 402);
    });

    test('a check that lists ids across a change lists them again', () async {
      a.movies = numbered('a', 1500);
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));

      a.movies = [...a.movies, catalogMovie('a-late', 'Late')];
      var added = false;
      a.onMoviePageRequest = (start) {
        if (start == 1000 && !added) {
          added = true;
          a.movies = [catalogMovie('a-new', 'Added'), ...a.movies];
        }
      };
      await service.syncNow();

      expect(a.idPageStartIndexes, [0, 1000, 0, 1000]);
      expect(movieNames(service), hasLength(1502));
      expect((await syncStateOf('a')).serverTotal, 1502);
    });

    test('a title the server said was gone while it was being read stays '
        'gone', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
      final service = build();
      await service.forceFullRead();

      a.holdRequests = true;
      final reading = service.forceFullRead();
      await pumpEventQueue();
      await service.removeCopy('a', 'a1');
      expect(movieNames(service), ['Hodrimel']);
      a.letThrough();
      await reading;

      expect(movieNames(service), ['Hodrimel']);
      expect((await storedEntries()).map((row) => row.itemId), ['a2']);
      final state = await syncStateOf('a');
      expect(state.itemCount, 1);
      // The server's count included the removed title, so it is not kept
      // for later checks to compare with.
      expect(state.serverTotal, isNull);
    });
  });

  group('a library that counts more titles than it lists', () {
    setUp(() {
      signedIn = [a];
      a.movies = numbered('a', 350);
      a.movieOvercount = 5;
    });

    test('is read, once it has listed the same titles twice', () async {
      final service = build();

      await service.forceFullRead();

      expect(movieNames(service), hasLength(350));
      expect(await storedEntries(), hasLength(350));
      expect(service.serverCounts, (upToDate: 1, total: 1));
      expect(service.unreachableServerCount, 0);

      advanceClock(const Duration(hours: 1));
      final requestsBefore = a.requests;
      await service.syncNow();
      expect(a.requests - requestsBefore, 3);
      expect(a.idPageStartIndexes, isEmpty);
    });

    test('is never patched from its list of ids: a change triggers a full '
        'read', () async {
      final service = build();
      await service.forceFullRead();
      advanceClock(const Duration(hours: 1));
      final fullPages = a.fullPageRequests;

      a.movies = [...a.movies.skip(1), catalogMovie('a-new', 'Added')];
      a.movies.removeLast();
      await service.syncNow();

      expect(a.idPageStartIndexes, isNotEmpty);
      expect(a.rowRequests, isEmpty);
      expect(a.fullPageRequests, greaterThan(fullPages));
      expect(movieNames(service), hasLength(349));
      expect(service.unreachableServerCount, 0);
    });
  });

  group('a server that answers but cannot be taken at its word', () {
    setUp(() => signedIn = [a, b]);

    test(
      'whose libraries are still changing is not shown as unreachable',
      () async {
        final all = numbered('a', 100);
        a.movies = all;
        b.movies = [catalogMovie('b1', 'Shared', tmdb: '7')];
        a.movies[0] = catalogMovie('a0', 'Shared', tmdb: '7');
        final service = build();
        await service.forceFullRead();

        a.onViewsRequest = () =>
            a.movies = all.take(20 + a.viewsRequests).toList();
        await service.forceFullRead();

        expect(movieNames(service), hasLength(100));
        expect(service.unreachableServerCount, 0);
        expect(service.serverCounts, (upToDate: 1, total: 2));
        final shared = movies(service)
            .singleWhere((m) => m['Name'] == 'Shared');
        expect(
          unifiedCopiesOf(shared).map((copy) => copy.reachable),
          everyElement(isTrue),
        );
      },
    );

    test('is given the time it asks for before being asked to confirm', () {
      fakeAsync((async) {
        final all = numbered('a', 100);
        a.movies = all;
        signedIn = [a];
        final service = build(confirmDelay: const Duration(seconds: 30));
        var done = false;
        service.forceFullRead().then((_) => done = true);
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 1));
        expect(done, isTrue);

        a.fullPageStartIndexes.clear();
        a.movies = all.take(50).toList();
        done = false;
        service.forceFullRead().then((_) => done = true);
        // This is long past the pause between two tries of a failed request.
        async.elapse(const Duration(seconds: 29));
        expect(a.fullPageStartIndexes, [0]);
        expect(done, isFalse);

        a.movies = all;
        async.elapse(const Duration(seconds: 2));
        expect(a.fullPageStartIndexes, [0, 0]);
        expect(done, isTrue);
        expect(movieNames(service), hasLength(100));
      });
    });
  });

  group('what a server sends that is not what was asked for', () {
    setUp(() => signedIn = [a, b]);

    test('one malformed title does not take the library with it', () async {
      a.movies = [
        catalogMovie('a1', 'Altovar', tmdb: '1001'),
        {
          'Id': 'a2',
          'Name': 'Broken',
          'Type': 'Movie',
          'UserData': 'none',
          'Genres': 'Horror',
          'ProviderIds': ['tmdb', 5],
          'ProductionYear': {'year': 2033},
        },
        {
          'Id': 'a3',
          'Name': 'Texty',
          'Type': 'Movie',
          'UserData': {'PlayedPercentage': '50', 'PlaybackPositionTicks': '9'},
          'Genres': ['Drama', 7, null],
        },
        {'Name': 'No id', 'Type': 'Movie'},
      ];
      b.movies = [
        {
          'Id': 'b1',
          'Name': 'Altovar',
          'Type': 'Movie',
          'ProviderIds': {'Tmdb': 1001},
          'UserData': {'PlayedPercentage': 'half'},
        },
      ];
      final service = build();

      await service.forceFullRead();

      expect(service.unreachableServerCount, 0);
      expect(movieNames(service), ['Altovar', 'Broken', 'Texty']);
      expect(movieNames(service, filters: ['IsResumable']), ['Texty']);
      final facets = service.facets(UnifiedLibraryKind.movies);
      expect(facets.genres, ['7', 'Drama']);
      final sharedMovie = movies(service).first;
      expect(unifiedCopiesOf(sharedMovie), hasLength(2));

      final reloaded = build();
      await reloaded.ensureLoaded();
      expect(movieNames(reloaded), ['Altovar', 'Broken', 'Texty']);
    });

    test('counts sent as text and ids sent as numbers are read', () async {
      signedIn = [b];
      b.countsAsText = true;
      b.movies = [
        for (var i = 11; i <= 20; i++)
          {'Id': i, 'Name': 'Movie $i', 'Type': 'Movie', 'UserData': {}},
      ];
      final service = build();

      await service.forceFullRead();

      expect(service.unreachableServerCount, 0);
      expect(movies(service).map((movie) => movie['Id']), [
        for (var i = 11; i <= 20; i++) '$i',
      ]);
      expect((await syncStateOf('b')).serverTotal, 10);

      advanceClock(const Duration(hours: 1));
      b.movies = [
        ...b.movies,
        {'Id': 21, 'Name': 'Movie 21', 'Type': 'Movie', 'UserData': {}},
      ];
      await service.syncNow();

      expect(b.rowRequests, [
        ['21'],
      ]);
      expect(movieNames(service), hasLength(11));
    });

    test('a library with no usable collection type is passed over', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      when(
        () =>
            a.viewsApi.getUserViews(includeHidden: any(named: 'includeHidden')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'odd', 'CollectionType': 7},
            'not a library',
            {'Id': 'a-movies', 'CollectionType': 'movies'},
          ],
        },
      );
      final service = build();

      await service.forceFullRead();

      expect(service.unreachableServerCount, 0);
      expect(movieNames(service), ['Altovar']);
    });
  });

  group('syncOnLaunch (launch check)', () {
    test('with every count unchanged decodes nothing', () async {
      a.movies = numbered('a', 600);
      b.movies = numbered('b', 600);
      await build().forceFullRead();
      advanceClock(const Duration(hours: 1));
      final requests = a.requests + b.requests;

      final service = build();
      await service.syncOnLaunch();

      expect(a.requests + b.requests - requests, 6);
      expect(service.rowsDecoded, 0);
      expect(service.serverCounts, (upToDate: 2, total: 2));
    });

    test('patches the stored rows from the server\'s ids, still without '
        'decoding them', () async {
      a.movies = numbered('a', 600);
      await build().forceFullRead();
      advanceClock(const Duration(hours: 1));
      final fullPages = a.fullPageRequests;
      a.movies = [...a.movies.skip(2), catalogMovie('a-new', 'Added')];

      final service = build();
      await service.syncOnLaunch();

      expect(service.rowsDecoded, 0);
      expect(a.rowRequests, [
        ['a-new'],
      ]);
      expect(a.fullPageRequests, fullPages);
      final stored = (await storedEntries()).where(
        (row) => row.serverId == 'a',
      );
      expect(stored, hasLength(599));
      expect(stored.map((row) => row.itemId), contains('a-new'));
      expect(stored.map((row) => row.itemId), isNot(contains('a0')));
      expect((await syncStateOf('a')).itemCount, 599);
      expect((await syncStateOf('a')).serverTotal, 599);

      await service.ensureLoaded();
      expect(service.rowsDecoded, 599);
      expect(movieNames(service), contains('Added'));
    });

    test('a stored catalog being loaded from disk while a check patches '
        'it is loaded again', () async {
      signedIn = [a];
      a.movies = numbered('a', 600);
      await build().forceFullRead();
      advanceClock(const Duration(hours: 1));
      a.movies = [...a.movies, catalogMovie('a-new', 'Added')];

      final service = build(frameBudget: Duration.zero);
      final checking = service.syncOnLaunch();
      final loading = service.ensureLoaded();
      await Future.wait([checking, loading]);

      expect(movieNames(service), hasLength(601));
    });

    test('a watched change made before the stored catalog was loaded is '
        'asked about once it is', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      final earlier = UserDataSync();
      addTearDown(earlier.dispose);
      await build(userDataSync: earlier).forceFullRead();
      advanceClock(const Duration(hours: 1));

      final service = build();
      await service.syncOnLaunch();
      a.setUserData('a1', {'Played': true});
      userData.publish('a1', {'Played': true});
      await pumpEventQueue();
      expect(a.userDataRequests, isEmpty);

      await service.ensureLoaded();
      await pumpEventQueue();

      expect(a.userDataRequests, [
        ['a1'],
      ]);
      expect(movieNames(service, filters: ['IsPlayed']), ['Altovar']);
    });

    test('tries again on the next call when a server was down', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      a.down = true;
      final service = build();

      await service.syncOnLaunch();
      expect(service.unreachableServerCount, 1);

      a.down = false;
      await service.syncOnLaunch();

      expect(service.unreachableServerCount, 0);
      expect(service.serverCounts, (upToDate: 2, total: 2));
      await service.ensureLoaded();
      expect(movieNames(service), ['Altovar']);

      final requests = a.requests + b.requests;
      advanceClock(const Duration(hours: 1));
      await service.syncOnLaunch();
      expect(a.requests + b.requests, requests);
    });

    group('on a metered connection', () {
      var metered = true;
      setUp(() {
        metered = true;
        signedIn = [a];
        a.movies = numbered('a', 600);
      });

      test('leaves a server never read for when a merged library is '
          'opened', () async {
        final service = build(isMetered: () => metered);

        await service.syncOnLaunch();
        expect(a.requests, 0);
        expect(service.unreachableServerCount, 0);
        expect(service.serverCounts, (upToDate: 0, total: 1));

        await service.syncNow();
        expect(a.fullPageRequests, 3);
        expect(movieNames(service), hasLength(600));
      });

      test('checks a server due its daily full read without reading it in '
          'full, until the connection is no longer metered', () async {
        await build().forceFullRead();
        final fullPages = a.fullPageRequests;
        advanceClock(const Duration(hours: 25));
        a.movies = [...a.movies, catalogMovie('a-new', 'Added')];

        final service = build(isMetered: () => metered);
        await service.syncOnLaunch();

        expect(a.fullPageRequests, fullPages);
        expect(a.rowRequests, [
          ['a-new'],
        ]);
        expect(await storedEntries(), hasLength(601));

        metered = false;
        advanceClock(const Duration(minutes: 5));
        await service.syncOnLaunch();
        expect(a.fullPageRequests, greaterThan(fullPages));
      });

      test('reads in full as soon as the connection is no longer metered, '
          'without waiting for the next check', () async {
        await build().forceFullRead();
        final fullPages = a.fullPageRequests;
        advanceClock(const Duration(hours: 25));

        final service = build(isMetered: () => metered);
        await service.syncOnLaunch();
        expect(a.fullPageRequests, fullPages);

        metered = false;
        advanceClock(const Duration(seconds: 10));
        await service.syncOnLaunch();
        expect(a.fullPageRequests, greaterThan(fullPages));
      });

      test('a second launch check while still metered does not settle the '
          'full read', () async {
        await build().forceFullRead();
        final fullPages = a.fullPageRequests;
        advanceClock(const Duration(hours: 25));

        final service = build(isMetered: () => metered);
        await service.syncOnLaunch();
        advanceClock(const Duration(seconds: 10));
        await service.syncOnLaunch();
        expect(a.fullPageRequests, fullPages);

        metered = false;
        advanceClock(const Duration(seconds: 10));
        await service.syncOnLaunch();
        expect(a.fullPageRequests, greaterThan(fullPages));
      });

      test('forceFullRead reads in full all the same', () async {
        final service = build(isMetered: () => metered);

        await service.forceFullRead();

        expect(movieNames(service), hasLength(600));
      });
    });
  });

  group('accounts that change under a check', () {
    test('a check started before a reset checks the accounts signed in '
        'since, rather than reading every server in full', () async {
      a.movies = numbered('a', 5);
      b.movies = numbered('b', 5);
      await build().forceFullRead();
      advanceClock(const Duration(hours: 1));
      final fullPages = a.fullPageRequests + b.fullPageRequests;

      // The first request for who is signed in takes a moment to answer.
      final gate = Completer<void>();
      var sessionLoads = 0;
      final service = build(
        servers: () async {
          if (sessionLoads++ == 0) await gate.future;
          return signedIn;
        },
      );
      final checking = service.syncNow();
      await pumpEventQueue();
      service.reset();
      gate.complete();
      await checking;

      expect(a.fullPageRequests + b.fullPageRequests, fullPages);
      expect(a.countRequests + b.countRequests, 4);
      expect(movieNames(service), hasLength(10));
    });

    test('accounts found changed are announced even when the disk then '
        'fails', () async {
      signedIn = [a];
      a.movies = [catalogMovie('a1', 'Altovar')];
      final service = build();
      await service.forceFullRead();
      expect(service.serverCounts.total, 1);
      advanceClock(const Duration(hours: 1));

      signedIn = [a, b];
      await db.customStatement('DROP TABLE catalog_entries');
      final titles = service.titlesRevision;
      await service.syncNow();

      expect(service.serverCounts.total, 2);
      expect(service.titlesRevision, greaterThan(titles));
    });
  });

  group('removing a copy the server says is gone', () {
    setUp(() {
      signedIn = [a];
      a.movies = [
        catalogMovie('a1', 'Altovar'),
        catalogMovie('a2', 'Hodrimel'),
      ];
    });

    test('keeps the sync state in line with the stored rows', () async {
      final service = build();
      await service.forceFullRead();
      expect((await syncStateOf('a')).itemCount, 2);

      a.movies = [catalogMovie('a2', 'Hodrimel')];
      await service.removeCopy('a', 'a1');

      final state = await syncStateOf('a');
      expect(state.itemCount, 1);
      expect(state.serverTotal, isNull);

      advanceClock(const Duration(hours: 1));
      await service.syncNow();
      expect(a.idPageStartIndexes, [0]);
      expect(a.rowRequests, isEmpty);
      expect((await syncStateOf('a')).serverTotal, 1);
    });

    test('works before the stored catalog has been loaded', () async {
      await build().forceFullRead();

      final service = build();
      await service.removeCopy('a', 'a1');

      expect(service.rowsDecoded, 0);
      expect((await storedEntries()).map((row) => row.itemId), ['a2']);
      expect((await syncStateOf('a')).itemCount, 1);
    });

    test('a load running alongside does not keep the removed copy', () async {
      await build().forceFullRead();

      final service = build();
      final removal = service.removeCopy('a', 'a1');
      await service.ensureLoaded();
      await removal;

      expect(movieNames(service), ['Hodrimel']);
    });

    test('a disk that fails is not an error for the caller', () async {
      final service = build();
      await service.forceFullRead();
      await db.customStatement('DROP TABLE catalog_entries');

      await expectLater(service.removeCopy('a', 'a1'), completes);
      expect(movieNames(service), ['Hodrimel']);
    });
  });

  group('stored rows that are no longer wanted', () {
    test('of an account signed out of are deleted on the reset that '
        'follows', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      b.movies = [catalogMovie('b1', 'Rusquin')];
      var stored = [
        (serverId: 'a', userId: 'user'),
        (serverId: 'b', userId: 'user'),
      ];
      final service = build(knownAccounts: () => stored);
      await service.forceFullRead();
      expect(await storedEntries(), hasLength(2));

      stored = [(serverId: 'a', userId: 'user')];
      signedIn = [a];
      service.reset();
      await pumpEventQueue();

      // No sync has run since, so the reset itself deleted them.
      expect((await storedEntries()).map((row) => row.serverId), ['a']);
      expect(
        (await db.select(db.catalogSyncStates).get()).map((s) => s.serverId),
        everyElement('a'),
      );
    });

    test('are all deleted when merged libraries are turned off, and no '
        'server is asked while they stay off', () async {
      a.movies = [catalogMovie('a1', 'Altovar')];
      var enabled = true;
      final service = build(isEnabled: () => enabled);
      await service.forceFullRead();
      expect(await storedEntries(), isNotEmpty);
      final session = service.session;

      enabled = false;
      await service.clear();

      expect(await storedEntries(), isEmpty);
      expect(await db.select(db.catalogSyncStates).get(), isEmpty);
      expect(service.session, greaterThan(session));
      expect(movieNames(service), isEmpty);

      final requests = a.requests + b.requests;
      await service.syncNow();
      await service.forceFullRead();
      await service.syncOnLaunch();
      expect(a.requests + b.requests, requests);
      expect(await storedEntries(), isEmpty);

      enabled = true;
      await service.syncOnLaunch();
      expect(await storedEntries(), isNotEmpty);
    });
  });

  group('an account change during a budgeted write of a large library', () {
    setUp(() {
      signedIn = [a];
      a.movies = numbered('a', 1200);
    });

    test('leaves the stored rows whole', () async {
      await build().forceFullRead();
      a.movies = numbered('a', 1700);
      final service = build(frameBudget: Duration.zero);
      await service.ensureLoaded();

      // The reset comes after the server has been read, while the rows are
      // encoded or written.
      final watch = Timer.periodic(Duration.zero, (timer) {
        if (a.fullPageStartIndexes.length >= 10) {
          timer.cancel();
          service.reset();
        }
      });
      addTearDown(watch.cancel);
      await service.forceFullRead();
      await pumpEventQueue();

      expect(await storedEntries(), hasLength(anyOf(1200, 1700)));
    });
  });

  test('a genre is written as the first server writes it now, not as it did '
      'when last asked', () async {
    a.movies = [catalogMovie('a1', 'Altovar', genres: ['Sci-Fi'])];
    b.movies = [catalogMovie('b1', 'Rusquin', genres: ['sci-fi'])];
    final service = build();
    await service.forceFullRead();
    expect(service.genres(UnifiedLibraryKind.values).single.name, 'Sci-Fi');
    expect(service.facets(UnifiedLibraryKind.movies).genres, ['Sci-Fi']);

    a.movies = [catalogMovie('a1', 'Altovar', genres: ['SCI-FI'])];
    await service.forceFullRead();

    expect(service.genres(UnifiedLibraryKind.values).single.name, 'SCI-FI');
    expect(service.facets(UnifiedLibraryKind.movies).genres, ['SCI-FI']);
  });
}
