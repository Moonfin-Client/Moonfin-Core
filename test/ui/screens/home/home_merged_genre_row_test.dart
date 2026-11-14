import 'dart:async';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/home_row_cache_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/multi_server_fakes.dart';
import '../../../data/services/unified_catalog_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _DataSource extends Mock implements RowDataSource {}

class _MediaBar extends Mock implements MediaBarViewModel {}

class _PluginSync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _AuthStore extends Mock implements AuthenticationStore {}

class _Credentials extends Mock implements CredentialStore {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _Session extends Mock implements SessionRepository {}

/// The real repository over [sessions], so its own rule says when genres
/// merge.
class _RealMultiServerRepository extends MultiServerRepository {
  _RealMultiServerRepository(this.sessions)
    : super(_AuthStore(), _Credentials(), _Factory(), _Session());

  final List<ServerUserSession> sessions;

  @override
  Future<List<ServerUserSession>> getLoggedInServers() async => sessions;
}

class _Cache extends Fake implements HomeRowCacheStore {
  List<HomeRow>? cachedRows;
  int writes = 0;

  @override
  Future<List<HomeRow>?> read(String cacheKey) async => cachedRows;

  @override
  Future<void> write(String cacheKey, List<HomeRow> rows) async => writes++;
}

/// Counts what Home asks of it; with a [gate], loaded only once it completes.
class _Catalog extends UnifiedCatalogService {
  _Catalog({
    required super.database,
    required super.loadSessions,
    required super.activeServerId,
  });

  int loads = 0;
  Completer<void>? gate;

  Future<void> loadNow() => super.ensureLoaded();

  @override
  Future<void> ensureLoaded() {
    loads++;
    return gate?.future ?? super.ensureLoaded();
  }
}

const _genreId = 'a-animation';
const _rowId = 'pluginDynamic:genres:http://a.test:genre:$_genreId';

/// A title filed under Animation unless [genres] says otherwise.
Map<String, dynamic> _title(
  String id,
  String name, {
  String type = 'Movie',
  String? tmdb,
  List<String> genres = const ['Animation'],
  String? rating,
}) => catalogMovie(
  id,
  name,
  type: type,
  tmdb: tmdb,
  genres: genres,
  rating: rating,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late OfflineDatabase db;
  late _DataSource source;
  late _Cache cache;
  late List<ServerUserSession> sessions;
  late List<Map<String, dynamic>> live;
  late _Catalog catalog;

  ServerUserSession server(String id) {
    final client = _Client();
    when(() => client.baseUrl).thenReturn('http://$id.test');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    return fakeSession(id, client: client);
  }

  /// Adds [items] to the stored catalog without recording a full read, so a
  /// test can add to one server more than once.
  Future<void> storeRows(String serverId, List<Map<String, dynamic>> items) =>
      seedCatalog(db, serverId, items, markFullyRead: false);

  final onA = [
    _title('a1', 'Akundel', tmdb: '1'),
    _title('a2', 'Bantrel', tmdb: '2'),
    _title('a3', 'Hodrimel', tmdb: '3', genres: ['Crime']),
    _title('a5', 'Dulmira', tmdb: '5', genres: ['Family']),
    _title('a7', 'Arvistel', type: 'Series', tmdb: '7'),
  ];
  final onB = [
    _title('b1', 'Akundel', tmdb: '1'),
    _title('b4', 'Coswen', tmdb: '4', genres: [' animation']),
    _title('b5', 'Dulmira', tmdb: '5'),
    _title('b6', 'Erdwyn', tmdb: '6', genres: ['Animación']),
  ];

  /// What server a answers for its own genre, by name, the way it tags each
  /// title.
  List<Map<String, dynamic>> liveOf(List<Map<String, dynamic>> items) => [
    for (final item in items)
      if ((item['Genres'] as List).contains('Animation'))
        {
          ...item,
          'GenreItems': [
            {'Name': 'Animation', 'Id': _genreId},
          ],
        },
  ]..sort((a, b) => (a['Name'] as String).compareTo(b['Name'] as String));

  setUpAll(() {
    registerFallbackValue(HomeSectionPluginSource.genres);
    registerFallbackValue(
      const HomeRow(id: '', title: '', rowType: HomeRowType.genres),
    );
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final cfg in HomeSectionConfig.defaults())
        cfg.copyWith(enabled: false),
      HomeSectionConfig.pluginDynamic(
        serverId: 'http://a.test',
        pluginSection: 'genre',
        pluginAdditionalData: _genreId,
        pluginDisplayText: 'Animation',
        pluginSource: HomeSectionPluginSource.genres,
      ),
    ]);
    await prefs.set(UserPreferences.displayGenresRows, true);
    await turnOnMergedLibraries(prefs);
    await prefs.set(
      UserPreferences.lastExternalRowsRefreshTime,
      DateTime.now().millisecondsSinceEpoch,
    );

    final pluginSync = _PluginSync();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.pluginAvailable).thenReturn(false);

    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    sessions = [server('a'), server('b')];
    catalog = _Catalog(
      database: db,
      loadSessions: () async => sessions,
      activeServerId: () => 'a',
    );
    GetIt.instance
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<PluginSyncService>(pluginSync)
      ..registerSingleton<SeerrPreferences>(_SeerrPrefs())
      ..registerSingleton<UnifiedCatalogService>(catalog);

    live = liveOf(onA);
    source = _DataSource();
    cache = _Cache();
    when(
      () => source.loadDynamicSection(
        rowId: any(named: 'rowId'),
        section: any(named: 'section'),
        title: any(named: 'title'),
        serverId: any(named: 'serverId'),
        additionalData: any(named: 'additionalData'),
        pluginSource: any(named: 'pluginSource'),
        forceRefresh: any(named: 'forceRefresh'),
      ),
    ).thenAnswer(
      (invocation) async => HomeRow(
        id: invocation.namedArguments[#rowId] as String,
        title: invocation.namedArguments[#title] as String,
        rowType: HomeRowType.genres,
        items: [
          for (final item in live)
            AggregatedItem(
              id: item['Id'] as String,
              serverId: invocation.namedArguments[#serverId] as String,
              rawData: item,
            ),
        ],
        totalCount: live.length,
      ),
    );
  });

  tearDown(() async {
    catalog.dispose();
    await db.close();
    await GetIt.instance.reset();
  });

  late _Client homeClient;

  HomeViewModel model({bool disposes = true}) {
    final client = homeClient = _Client();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://a.test');
    final mediaBar = _MediaBar();
    when(() => mediaBar.load(force: any(named: 'force')))
        .thenAnswer((_) async {});
    final vm = HomeViewModel(
      dataSource: source,
      prefs: prefs,
      client: client,
      mediaBarViewModel: mediaBar,
      multiServerRepo: _RealMultiServerRepository(sessions),
      cacheStore: cache,
    );
    if (disposes) addTearDown(vm.dispose);
    return vm;
  }

  HomeRow rowOf(HomeViewModel vm) =>
      vm.rows.singleWhere((row) => row.id == _rowId);

  /// Each card of the row as `server:id` followed by the server of each copy.
  List<String> cardKeys(HomeViewModel vm) => [
    for (final item in rowOf(vm).items)
      [
        '${item.serverId}:${item.id}',
        ...unifiedCopiesOf(item.rawData).map((copy) => copy.serverId),
      ].join(' '),
  ];

  List<String> rowTitles(HomeViewModel vm) => [
    for (final item in rowOf(vm).items) item.name,
  ];

  /// The row without merging: server a's own answer, untouched.
  void expectLiveRow(HomeViewModel vm) {
    expect(cardKeys(vm), [
      for (final item in live) 'http://a.test:${item['Id']}',
    ]);
    expect(rowOf(vm).totalCount, live.length);
  }

  group('in merge mode', () {
    setUp(() async {
      await storeRows('a', onA);
      await storeRows('b', onB);
    });

    test('the row lists the genre\'s titles from every server once, each '
        'with its copies', () async {
      final vm = model();
      await vm.load();

      expect(cardKeys(vm), [
        'a:a1 a b',
        'a:a7 a',
        'a:a2 a',
        'b:b4 b',
        'a:a5 a b',
      ]);
      expect(rowOf(vm).title, 'Animation');
      expect(rowOf(vm).totalCount, 5);
    });

    test('a title only the other server files under the genre is listed',
        () async {
      final vm = model();
      await vm.load();

      expect(rowTitles(vm), containsAll(['Coswen', 'Dulmira']));
      expect(live.map((item) => item['Name']), isNot(contains('Dulmira')));
    });

    test('a genre named in another language is not merged in', () async {
      final vm = model();
      await vm.load();

      expect(rowTitles(vm), isNot(contains('Erdwyn')));
      expect(rowTitles(vm), isNot(contains('Hodrimel')));
    });

    test('the row follows its order and item type settings', () async {
      await prefs.set(
        UserPreferences.genresRowSortOrder,
        SortDirection.descending,
      );
      await prefs.set(
        UserPreferences.genresRowItemFilter,
        GenresRowItemFilter.movies,
      );
      final vm = model();
      await vm.load();

      expect(rowTitles(vm), ['Dulmira', 'Coswen', 'Bantrel', 'Akundel']);
    });

    test('the genre is found by the section\'s title when the server names '
        'none', () async {
      live = [for (final item in live) {...item}..remove('GenreItems')];
      final vm = model();
      await vm.load();

      expect(rowTitles(vm), [
        'Akundel',
        'Arvistel',
        'Bantrel',
        'Coswen',
        'Dulmira',
      ]);
    });

    test('the first page is one page long, and loading more adds the rest '
        'without duplicates', () async {
      await storeRows('b', [
        for (var i = 0; i < 20; i++)
          _title('n$i', 'Zeq ${'$i'.padLeft(2, '0')}', tmdb: '${100 + i}'),
      ]);
      final vm = model();
      await vm.load();

      expect(rowOf(vm).items, hasLength(15));
      expect(rowOf(vm).totalCount, 25);

      await vm.loadMoreForRow(0);
      expect(rowOf(vm).items, hasLength(25));
      expect(rowTitles(vm).toSet(), hasLength(25));
      expect(rowTitles(vm).take(6), [
        'Akundel',
        'Arvistel',
        'Bantrel',
        'Coswen',
        'Dulmira',
        'Zeq 00',
      ]);
      expect(rowOf(vm).hasMore, isFalse);
      verifyNever(
        () => source.loadMore(
          row: any(named: 'row'),
          serverId: any(named: 'serverId'),
          offset: any(named: 'offset'),
        ),
      );
    });

    test('a stored catalog with nothing of the genre leaves the live row',
        () async {
      await db.delete(db.catalogEntries).go();
      await storeRows('a', [
        _title('a3', 'Hodrimel', tmdb: '3', genres: ['Crime']),
      ]);
      await storeRows('b', [
        _title('b9', 'Rusquin', tmdb: '9', genres: ['Crime']),
      ]);
      final vm = model();
      await vm.load();

      expectLiveRow(vm);
    });

    test('a title a blocked rating covers on any copy is left out', () async {
      await storeRows('b', [
        _title('b8', 'Bantrel', tmdb: '2', rating: 'R'),
      ]);
      await prefs.set(UserPreferences.blockedParentalRatings, 'R');
      final vm = model();
      await vm.load();

      expect(rowTitles(vm), ['Akundel', 'Arvistel', 'Coswen', 'Dulmira']);
    });

    test('with the merged setting turned off, the merged row gives way to '
        'the server\'s own', () async {
      final vm = model();
      await vm.load();
      expect(cardKeys(vm), contains('a:a1 a b'));

      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      await vm.load(preserveExisting: true);

      expectLiveRow(vm);
    });

    test('a next page that waited on the stored catalog is dropped once the '
        'merged setting is turned off', () async {
      await storeRows('b', [
        for (var i = 0; i < 20; i++)
          _title('n$i', 'Zeq ${'$i'.padLeft(2, '0')}', tmdb: '${100 + i}'),
      ]);
      final vm = model();
      await vm.load();
      expect(rowOf(vm).items, hasLength(15));

      catalog.gate = Completer<void>();
      final paging = vm.loadMoreForRow(0);
      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      await vm.load(preserveExisting: true);
      expectLiveRow(vm);

      catalog.gate!.complete();
      await paging;

      expectLiveRow(vm);
    });

    test('with the merged setting turned off, a merged row restored from '
        'the cache gives way too', () async {
      final vm = model();
      await vm.load();
      cache.cachedRows = vm.rows;

      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      final next = model();
      await next.load();

      expectLiveRow(next);
    });

    group('with a stored catalog that loads late', () {
      late HomeViewModel vm;
      late int changes;

      void loadLate(FakeAsync async) {
        catalog.gate = Completer();
        vm = model();
        unawaited(vm.load());
        async.elapse(const Duration(seconds: 1));
        async.flushMicrotasks();
        expect(vm.isLoading, isFalse);
        changes = 0;
        vm.addListener(() => changes++);
      }

      test('Home shows the live row, then merges it in one update', () async {
        await catalog.loadNow();
        fakeAsync((async) {
          loadLate(async);
          expectLiveRow(vm);

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 1);
          expect(cardKeys(vm), [
            'a:a1 a b',
            'a:a7 a',
            'a:a2 a',
            'b:b4 b',
            'a:a5 a b',
          ]);
          expect(cache.writes, 2);
        });
      });

      test('the cards already shown keep their order', () async {
        await catalog.loadNow();
        fakeAsync((async) {
          loadLate(async);
          final before = rowTitles(vm);

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(
            rowTitles(vm).where(before.contains).toList(),
            before,
          );
        });
      });

      test('a random row keeps every card in place and adds the rest after',
          () async {
        await prefs.set(UserPreferences.genresRowSortBy, LibrarySortBy.random);
        live = liveOf(onA).reversed.toList();
        await catalog.loadNow();
        fakeAsync((async) {
          loadLate(async);
          final before = rowTitles(vm);
          expect(before, ['Bantrel', 'Arvistel', 'Akundel']);

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 1);
          expect(rowTitles(vm).take(3), before);
          expect(cardKeys(vm).take(3), ['a:a2 a', 'a:a7 a', 'a:a1 a b']);
          expect(rowTitles(vm).skip(3).toSet(), {'Coswen', 'Dulmira'});
        });
      });

      test('a stored catalog with nothing of the genre changes nothing',
          () async {
        await db.delete(db.catalogEntries).go();
        await catalog.loadNow();
        fakeAsync((async) {
          loadLate(async);
          final before = rowOf(vm);

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 0);
          expect(rowOf(vm), same(before));
        });
      });

      test('a Home closed before the stored catalog loads saves nothing',
          () async {
        await catalog.loadNow();
        fakeAsync((async) {
          catalog.gate = Completer();
          final closed = model(disposes: false);
          unawaited(closed.load());
          async.elapse(const Duration(seconds: 1));
          async.flushMicrotasks();
          final writes = cache.writes;

          closed.dispose();
          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(cache.writes, writes);
        });
      });

      test('a Home whose user was switched away keeps its row and saves '
          'nothing', () async {
        await catalog.loadNow();
        fakeAsync((async) {
          loadLate(async);
          final before = rowOf(vm);
          final writes = cache.writes;

          when(() => homeClient.userId).thenReturn('someone-else');
          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 0);
          expect(rowOf(vm), same(before));
          expect(cache.writes, writes);
        });
      });

      test('a merged row restored from the cache stays as it is once the '
          'stored catalog has loaded', () async {
        final first = model();
        await first.load();
        cache.cachedRows = first.rows;
        final merged = cardKeys(first);

        fakeAsync((async) {
          loadLate(async);
          expect(cardKeys(vm), merged);

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 0);
          expect(cardKeys(vm), merged);
        });
      });

      test('a merged row restored from the cache takes the stored catalog\'s '
          'details when only they differ', () async {
        final first = model();
        await first.load();
        // The cache was written before Bantrel was renamed and watched: the
        // same cards and copies, with older details.
        cache.cachedRows = [
          for (final row in first.rows)
            row.copyWith(
              items: [
                for (final item in row.items)
                  item.name != 'Bantrel'
                      ? item
                      : AggregatedItem(
                          id: item.id,
                          serverId: item.serverId,
                          rawData: {
                            ...item.rawData,
                            'Name': 'Bantrel Before',
                            'UserData': {'Played': false},
                          },
                        ),
              ],
            ),
        ];
        final merged = cardKeys(first);
        final titles = rowTitles(first);

        fakeAsync((async) {
          loadLate(async);
          expect(rowTitles(vm), contains('Bantrel Before'));
          final writes = cache.writes;

          catalog.gate!.complete();
          async.flushMicrotasks();

          expect(changes, 1);
          expect(cardKeys(vm), merged);
          expect(rowTitles(vm), titles);
          expect(cache.writes, writes + 1);
        });
      });
    });
  });

  group('outside merge mode', () {
    setUp(() async {
      await storeRows('a', onA);
      await storeRows('b', onB);
    });

    // When genres merge is the repository's rule, covered case by case in
    // multi_server_merged_genres_test.dart. Home is checked for one case.
    test('with merged libraries off, the row is the server\'s own and paging '
        'asks that server', () async {
      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      final vm = model();
      await vm.load();

      expectLiveRow(vm);
      expect(rowOf(vm).items.map((item) => item.rawData), live);
      expect(catalog.loads, 0);

      when(
        () => source.loadMore(
          row: any(named: 'row'),
          serverId: any(named: 'serverId'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer((invocation) async {
        final row = invocation.namedArguments[#row] as HomeRow;
        return (row.items, row.items.length);
      });
      vm.setRowsForTesting([rowOf(vm).copyWith(totalCount: 40)]);
      await vm.loadMoreForRow(0);
      verify(
        () => source.loadMore(
          row: any(named: 'row'),
          serverId: 'http://a.test',
          offset: any(named: 'offset'),
        ),
      ).called(1);
    });

    test('offline, Home shows no row and does not load the stored catalog',
        () async {
      GetIt.instance.registerSingleton<ConnectivityService>(
        UnreachableConnectivity(),
      );
      final vm = model();
      await vm.load();

      expect(vm.rows, isEmpty);
      expect(catalog.loads, 0);
    });
  });
}
