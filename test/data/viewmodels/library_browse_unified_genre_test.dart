import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/library_browse_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/unified_catalog_fakes.dart';

/// A title filed under Drama, the genre most of these tests open.
Map<String, dynamic> _drama(
  String id,
  String name, {
  String type = 'Movie',
  String? tmdb,
  String? rating,
  int? year,
}) => catalogMovie(
  id,
  name,
  type: type,
  tmdb: tmdb,
  genres: const ['Drama'],
  rating: rating,
  year: year,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late UnifiedCatalogService catalog;
  late UserPreferences prefs;

  Future<LibraryBrowseViewModel> genrePage(
    String genre, {
    UnifiedLibraryKind? kind,
  }) async {
    final vm = LibraryBrowseViewModel(
      libraryId: '',
      client: UntouchedClient('the merged genre'),
      prefs: prefs,
      mdbListRepository: FakeMdbListRepository(),
      includeItemTypes: kind == null ? null : [kind.itemType],
      overrideName: genre,
      unifiedGenre: genre,
      unifiedGenreKinds: kind == null ? null : [kind],
      unifiedCatalog: catalog,
    );
    addTearDown(vm.dispose);
    await vm.load();
    return vm;
  }

  List<String> names(LibraryBrowseViewModel vm) =>
      vm.items.map((item) => item.name).toList();

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    catalog = UnifiedCatalogService(
      database: db,
      loadSessions: () async => [
        for (final id in ['a', 'b'])
          fakeSession(id, client: UntouchedClient('the merged genre')),
      ],
      activeServerId: () => 'a',
      now: () => unifiedTestNow,
      retryDelay: Duration.zero,
    );
  });

  tearDown(() async {
    // Each page starts a check on opening, which still holds the database:
    // wait for it to end.
    await catalog.syncNow();
    catalog.dispose();
    userDataSync.reset();
    await GetIt.instance.reset();
    await db.close();
  });

  test('lists the genre from both servers, a shared title once', () async {
    await seedCatalog(db, 'a', [
      _drama('a1', 'Altovar', tmdb: '1001'),
      _drama('a2', 'Hodrimel'),
      catalogMovie('a3', 'Umbrel', genres: ['Family']),
    ]);
    await seedCatalog(db, 'b', [
      _drama('b1', 'Altovar', tmdb: '1001'),
      catalogMovie('b2', 'Rusquin', genres: ['drama']),
    ]);

    final vm = await genrePage('Drama');

    expect(vm.state, LibraryBrowseState.ready);
    expect(vm.isUnifiedBrowse, isTrue);
    expect(vm.isGenreBrowse, isTrue);
    expect(vm.libraryName, 'Drama');
    expect(names(vm), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(vm.totalCount, 3);
    expect([for (final item in vm.items) item.serverId], ['a', 'a', 'b']);
    expect(
      [
        for (final copy in unifiedCopiesOf(vm.items.first.rawData))
          copy.key,
      ],
      ['a|a1', 'b|b1'],
    );
    expect(vm.catalogHasTitles, isTrue);
  });

  test('a title is listed when only its copy on another server is filed '
      'under the genre', () async {
    await seedCatalog(db, 'a', [
      catalogMovie('a1', 'Altovar', tmdb: '1001', genres: ['Sci-Fi']),
    ]);
    await seedCatalog(db, 'b', [
      catalogMovie('b1', 'Altovar', tmdb: '1001', genres: ['Horror']),
    ]);

    final vm = await genrePage('Horror');

    expect(names(vm), ['Altovar']);
    expect(vm.items.single.serverId, 'a');
    expect(unifiedCopiesOf(vm.items.single.rawData), hasLength(2));
  });

  test('genres match whatever the case, but an accented spelling is '
      'another genre', () async {
    await seedCatalog(db, 'a', [
      catalogMovie('a1', 'Aidrun!', genres: ['Comedy']),
    ]);
    await seedCatalog(db, 'b', [
      catalogMovie('b1', 'Ambréval', genres: ['Comédie']),
      catalogMovie('b2', 'Clestin', genres: ['COMEDY']),
    ]);

    expect(names(await genrePage('Comedy')), ['Aidrun!', 'Clestin']);
    expect(names(await genrePage('Comédie')), ['Ambréval']);
  });

  test('movies and series share one order and one paging', () async {
    await seedCatalog(db, 'a', [
      for (var i = 0; i < 60; i++)
        _drama('am$i', 'Title ${'${i * 2}'.padLeft(3, '0')}'),
    ]);
    await seedCatalog(db, 'b', [
      for (var i = 0; i < 60; i++)
        _drama(
          'bs$i',
          'Title ${'${i * 2 + 1}'.padLeft(3, '0')}',
          type: 'Series',
        ),
    ]);

    final vm = await genrePage('Drama');

    expect(vm.totalCount, 120);
    expect(vm.items, hasLength(75));
    expect(names(vm).take(4), [
      'Title 000',
      'Title 001',
      'Title 002',
      'Title 003',
    ]);
    expect(vm.items.take(4).map((item) => item.type), [
      'Movie',
      'Series',
      'Movie',
      'Series',
    ]);
    expect(vm.hasMore, isTrue);

    await vm.loadMore();

    expect(vm.items, hasLength(120));
    expect(names(vm), [
      for (var i = 0; i < 120; i++) 'Title ${'$i'.padLeft(3, '0')}',
    ]);
    expect(vm.hasMore, isFalse);

    await vm.setSortDirection(SortDirection.descending);
    expect(names(vm).take(2), ['Title 119', 'Title 118']);
  });

  test('a page for one kind leaves the other out', () async {
    await seedCatalog(db, 'a', [_drama('a1', 'Hodrimel')]);
    await seedCatalog(db, 'b', [_drama('b1', 'Mivel Dorn', type: 'Series')]);

    expect(names(await genrePage('Drama', kind: UnifiedLibraryKind.movies)), [
      'Hodrimel',
    ]);
    expect(names(await genrePage('Drama', kind: UnifiedLibraryKind.series)), [
      'Mivel Dorn',
    ]);
  });

  test('offers the genre\'s own ratings and years, not genres', () async {
    await seedCatalog(db, 'a', [
      _drama('a1', 'Hodrimel', rating: 'R', year: 2032),
      catalogMovie(
        'a2',
        'Umbrel',
        genres: ['Family'],
        rating: 'PG',
        year: 2036,
      ),
    ]);
    await seedCatalog(db, 'b', [
      _drama('b1', 'Mivel Dorn', type: 'Series', rating: 'TV-14', year: 2034),
    ]);
    final vm = await genrePage('Drama');

    await vm.ensureFacetValuesLoaded();

    expect(vm.facetValues.genres, isEmpty);
    expect(vm.facetValues.officialRatings, ['R', 'TV-14']);
    expect(vm.facetValues.years, [2034, 2032]);
  });

  test('saves its sort apart from the merged libraries\' sort', () async {
    await seedCatalog(db, 'a', [_drama('a1', 'Hodrimel')]);
    final vm = await genrePage('Drama');

    await vm.setSortDirection(SortDirection.descending);

    expect(
      prefs.get(UserPreferences.librarySortDirection('unified_movies')),
      SortDirection.ascending,
    );
    expect(
      prefs.get(
        UserPreferences.librarySortDirection(
          'unified_genre_drama_movies_series',
        ),
      ),
      SortDirection.descending,
    );
  });
}
