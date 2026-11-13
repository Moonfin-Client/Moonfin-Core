import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';

import 'unified_catalog_fakes.dart';

void main() {
  late OfflineDatabase db;
  late UnifiedCatalogService catalog;
  late String active;

  setUp(() {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    active = 'a';
    catalog = UnifiedCatalogService(
      database: db,
      loadSessions: () async => [
        for (final id in ['a', 'b'])
          fakeSession(id, client: FakeCatalogServer(id).client),
      ],
      activeServerId: () => active,
      now: () => unifiedTestNow,
    );
  });

  tearDown(() async {
    catalog.dispose();
    await db.close();
  });

  test('folds same-named genres and counts a shared title once', () async {
    await seedCatalog(db, 'a', [
      catalogMovie('a1', 'Altovar', tmdb: '1001', genres: ['Sci-Fi']),
      catalogMovie('a2', 'Aidrun!', genres: ['Comedy']),
      catalogMovie('a3', 'Dastrel', type: 'Series', genres: ['Sci-Fi']),
    ]);
    await seedCatalog(db, 'b', [
      catalogMovie('b1', 'Altovar', tmdb: '1001', genres: ['sci-fi', 'Horror']),
      catalogMovie('b2', 'Ambréval', genres: ['Comédie', 'COMEDY']),
    ]);
    await catalog.ensureLoaded();

    final genres = catalog.genres(UnifiedLibraryKind.values);

    expect(
      [for (final genre in genres) '${genre.name} ${genre.items.length}'],
      ['Comedy 2', 'Comédie 1', 'Horror 1', 'Sci-Fi 2'],
    );
    expect(
      [
        for (final genre in catalog.genres([UnifiedLibraryKind.series]))
          '${genre.name} ${genre.items.length}',
      ],
      ['Sci-Fi 1'],
    );
  });

  test('a genre is spelled as the first server spells it, whichever server '
      'is active', () async {
    await seedCatalog(db, 'a', [
      catalogMovie('a1', 'Altovar', genres: ['Sci-Fi']),
    ]);
    await seedCatalog(db, 'b', [
      catalogMovie('b1', 'Dusvane', genres: ['SCI-FI']),
    ]);
    await catalog.ensureLoaded();
    active = 'b';

    expect(catalog.genres(UnifiedLibraryKind.values).single.name, 'Sci-Fi');
    expect(catalog.facets(UnifiedLibraryKind.movies).genres, ['Sci-Fi']);
  });

  test('pages movies and series from one sorted list', () async {
    await seedCatalog(db, 'a', [
      for (var i = 0; i < 3; i++)
        catalogMovie('am$i', 'Title ${i * 2}', genres: ['Drama']),
      catalogMovie('ax', 'Other', genres: ['Crime']),
    ]);
    await seedCatalog(db, 'b', [
      for (var i = 0; i < 3; i++)
        catalogMovie(
          'bs$i',
          'Title ${i * 2 + 1}',
          type: 'Series',
          genres: ['Drama'],
        ),
    ]);
    await catalog.ensureLoaded();

    final snapshot = catalog.snapshotOf(
      UnifiedLibraryKind.values,
      const UnifiedCatalogQuery(itemTypes: 'Movie,Series', genre: 'drama'),
    );
    List<String> page(int start) => [
      for (final item
          in snapshot.page(startIndex: start, limit: 4)['Items'] as List)
        '${(item as Map)['Name']} ${item['Type']}',
    ];

    expect(snapshot.page()['TotalRecordCount'], 6);
    expect(page(0), [
      'Title 0 Movie',
      'Title 1 Series',
      'Title 2 Movie',
      'Title 3 Series',
    ]);
    expect(page(4), ['Title 4 Movie', 'Title 5 Series']);
    // Asking for one kind alone gives the merged library's own list.
    expect(
      catalog
          .snapshot(
            UnifiedLibraryKind.movies,
            const UnifiedCatalogQuery(itemTypes: 'Movie'),
          )
          .items,
      hasLength(4),
    );
  });
}
