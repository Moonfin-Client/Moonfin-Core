import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';

import 'unified_catalog_fakes.dart';

/// One server's copy of a title, as the stored catalog hands it to a query.
///
/// The item id is `<serverId>-<name>` unless [id] names another. [overrides]
/// replaces fields of the raw item, for answers a well-behaved server would
/// not send.
UnifiedCatalogEntry _entry(
  String serverId,
  String name, {
  String? id,
  String type = 'Movie',
  String? tmdb,
  String? imdb,
  String? added,
  bool played = false,
  bool favorite = false,
  int positionTicks = 0,
  int? year,
  List<String> genres = const [],
  String? rating,
  double? score,
  Map<String, dynamic> overrides = const {},
}) {
  final itemId = id ?? '$serverId-$name';
  return UnifiedCatalogEntry(
    serverId: serverId,
    itemId: itemId,
    itemType: type,
    raw: {
      ...catalogMovie(
        itemId,
        name,
        type: type,
        tmdb: tmdb,
        imdb: imdb,
        added: added,
        played: played,
        favorite: favorite,
        positionTicks: positionTicks,
        year: year,
        genres: genres,
        rating: rating,
        score: score,
      ),
      ...overrides,
    },
  );
}

/// Folds the copies of one title the way a merged library builds its list.
List<Map<String, dynamic>> _merge(
  Iterable<UnifiedCatalogEntry> entries, {
  required String itemType,
  required List<UnifiedServerInfo> servers,
}) {
  final order = UnifiedServerOrder(servers);
  return [
    for (final copies in groupCatalogEntries(
      entries,
      itemType: itemType,
      order: order,
    ))
      mergeCatalogCopies(copies, order),
  ];
}

const _servers = [
  UnifiedServerInfo(id: 'a', name: 'Alpha'),
  UnifiedServerInfo(id: 'b', name: 'Beta'),
];

List<String> _names(List<Map<String, dynamic>> items) => [
  for (final item in items) item['Name'] as String,
];

void main() {
  group('catalogMatchKeys', () {
    test('reads the id whatever casing the server used for its key', () {
      expect(
        catalogMatchKeys('Movie', {
          'ProviderIds': {'TMDB': '1003'},
        }),
        catalogMatchKeys('Movie', {
          'ProviderIds': {'Tmdb': '1003'},
        }),
      );
    });

    test('keeps a movie and a series with the same id apart', () {
      const raw = {
        'ProviderIds': {'Tmdb': '1003'},
      };
      expect(
        catalogMatchKeys('Movie', raw),
        isNot(catalogMatchKeys('Series', raw)),
      );
    });

    test('is empty for a title with no external id', () {
      expect(catalogMatchKeys('Movie', {'Name': 'Home video'}), isEmpty);
      expect(
        catalogMatchKeys('Movie', {
          'ProviderIds': {'Tmdb': ''},
        }),
        isEmpty,
      );
    });

    test('writes an id the same way however the server wrote it', () {
      expect(
        catalogMatchKeys('Movie', {
          'ProviderIds': {
            ' Tmdb ': ' 01003 ',
            'IMDB': ' TT9000001 ',
            'Tvdb': 77,
          },
        }),
        ['movie:tmdb:1003', 'movie:imdb:tt9000001', 'movie:tvdb:77'],
      );
    });

    test('leaves out a placeholder id', () {
      for (final ids in <Map<String, Object?>>[
        {'Tmdb': '0'},
        {'Tmdb': 0},
        {'Tmdb': '000'},
        {'Tmdb': '   '},
        {'Tmdb': null},
        {'Tmdb': 'unknown'},
        {'Tmdb': '-1'},
        {'Tvdb': '0'},
        {'Tvdb': 'n/a'},
        {'Imdb': 'tt0000000'},
        {'Imdb': 'tt'},
        {'Imdb': '0'},
        {'Imdb': ''},
      ]) {
        expect(
          catalogMatchKeys('Movie', {'ProviderIds': ids}),
          isEmpty,
          reason: '$ids',
        );
      }
    });

    test('provider ids sent as a list count as no ids', () {
      expect(
        catalogMatchKeys('Movie', {
          'ProviderIds': ['Tmdb', '1003'],
        }),
        isEmpty,
      );
    });
  });

  group('folding the copies of a title', () {
    test('unmatched titles that all carry the placeholder provider id 0 '
        'are not folded', () {
      final merged = _merge(
        [
          for (final (index, server) in ['a', 'b', 'a', 'b', 'a'].indexed)
            _entry(server, 'Home video $index', tmdb: '0'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(merged, hasLength(5));
      expect(
        merged.map((item) => unifiedCopiesOf(item).length),
        everyElement(1),
      );
    });

    test('a title watched only on a copy that is not the one shown, with '
        'no copy in progress, takes the watched copy\'s whole user data', () {
      UnifiedCatalogEntry series(String serverId, Map<String, dynamic> state) =>
          _entry(
            serverId,
            'Dastrel',
            type: 'Series',
            overrides: {
              'ProviderIds': {'Tvdb': '1011'},
              'UserData': state,
            },
          );

      final merged = _merge(
        [
          series('a', {
            'Played': false,
            'UnplayedItemCount': 10,
            'PlayedPercentage': 0,
          }),
          series('b', {
            'Played': true,
            'UnplayedItemCount': 0,
            'PlayedPercentage': 100,
            'PlayCount': 1,
          }),
        ],
        itemType: 'Series',
        servers: _servers,
      ).single;

      expect(merged[unifiedServerIdKey], 'a');
      expect(merged['UserData'], {
        'Played': true,
        'UnplayedItemCount': 0,
        'PlayedPercentage': 100,
        'PlayCount': 1,
      });
    });

    test('user data in an unexpected shape is folded as if the server had '
        'sent none', () {
      // The user data and the genres are not the maps and lists expected.
      UnifiedCatalogEntry malformed(String serverId, Object? userData) =>
          _entry(
            serverId,
            'Odd',
            tmdb: '9',
            overrides: {'UserData': userData, 'Genres': 'Drama'},
          );

      final merged = _merge(
        [
          malformed('a', 'none'),
          malformed('b', {
            'PlayedPercentage': '40',
            'PlaybackPositionTicks': '12',
          }),
        ],
        itemType: 'Movie',
        servers: _servers,
      ).single;

      final copies = unifiedCopiesOf(merged);
      expect(copies.map((copy) => copy.playedPercentage), [40, null]);
      expect(copies.first.positionTicks, 12);
      expect(
        _names(
          filterAndSortCatalog(
            [merged],
            const UnifiedCatalogQuery(
              itemTypes: 'Movie',
              filters: ['IsResumable'],
            ),
          ),
        ),
        ['Odd'],
      );
      expect(catalogFacets([merged]).genres, isEmpty);
      expect(unifiedCopiesOf({unifiedCopiesKey: 'not a list'}), isEmpty);
      expect(unifiedCopiesOf({unifiedCopiesKey: 7}), isEmpty);
    });

    test('folds a title two servers hold into one item', () {
      final merged = _merge(
        [
          _entry('a', 'The Morvent', tmdb: '1003'),
          _entry('b', 'The Morvent', tmdb: '1003'),
          _entry('b', 'Hodrimel', tmdb: '1002'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(_names(merged), unorderedEquals(['The Morvent', 'Hodrimel']));
      final sharedMovie = merged.firstWhere((m) => m['Name'] == 'The Morvent');
      expect(sharedMovie[unifiedServerIdKey], 'a');
      expect(
        [for (final copy in unifiedCopiesOf(sharedMovie)) copy.serverName],
        ['Alpha', 'Beta'],
      );
    });

    test('folds on any id two servers share, not only the first', () {
      final merged = _merge(
        [
          _entry('a', 'The Morvent', tmdb: '1003', imdb: 'tt9000001'),
          _entry('b', 'The Morvent', imdb: 'tt9000001'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(merged, hasLength(1));
      expect(
        [for (final copy in unifiedCopiesOf(merged.single)) copy.serverId],
        ['a', 'b'],
      );
    });

    test('folds two copies that only meet through a third', () {
      final merged = _merge(
        [
          _entry('a', 'The Morvent', tmdb: '1003'),
          _entry('b', 'The Morvent', imdb: 'tt9000001'),
          _entry('c', 'The Morvent', tmdb: '1003', imdb: 'tt9000001'),
        ],
        itemType: 'Movie',
        servers: const [
          ..._servers,
          UnifiedServerInfo(id: 'c', name: 'Gamma'),
        ],
      );

      expect(merged, hasLength(1));
      expect(unifiedCopiesOf(merged.single), hasLength(3));
    });

    test('keeps both copies one server holds, told apart by name', () {
      final merged = _merge(
        [
          _entry('a', 'The Morvent', id: 'hd', tmdb: '1003'),
          _entry(
            'a',
            'The Morvent (4K)',
            id: 'uhd',
            tmdb: '1003',
            played: true,
          ),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(merged, hasLength(1));
      final copies = unifiedCopiesOf(merged.single);
      expect([for (final copy in copies) copy.itemId], ['hd', 'uhd']);
      expect(
        [for (final copy in copies) copy.name],
        ['The Morvent', 'The Morvent (4K)'],
      );
      expect([for (final copy in copies) copy.played], [false, true]);
      expect((merged.single['UserData'] as Map)['Played'], isTrue);
    });

    test('carries each copy\'s own parental rating', () {
      final merged = _merge(
        [
          _entry('a', 'Altovar', tmdb: '1001', rating: 'PG-13'),
          _entry('b', 'Altovar', tmdb: '1001', rating: 'R'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(
        [
          for (final copy in unifiedCopiesOf(merged.single))
            copy.officialRating,
        ],
        ['PG-13', 'R'],
      );
    });

    test('never folds on the title alone', () {
      final merged = _merge(
        [_entry('a', 'Crendil'), _entry('b', 'Crendil')],
        itemType: 'Movie',
        servers: _servers,
      );
      expect(merged, hasLength(2));
    });

    test('shows the copy the viewer is part way through', () {
      final merged = _merge(
        [
          _entry('a', 'Hodrimel', tmdb: '1002'),
          _entry('b', 'Hodrimel', tmdb: '1002', positionTicks: 500),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      expect(merged.single[unifiedServerIdKey], 'b');
    });

    test('shows the copy on a reachable server before one on an unreachable '
        'server', () {
      final merged = _merge(
        [
          _entry('a', 'Hodrimel', tmdb: '1002'),
          _entry('b', 'Hodrimel', tmdb: '1002'),
        ],
        itemType: 'Movie',
        servers: const [
          UnifiedServerInfo(id: 'a', name: 'Alpha', reachable: false),
          UnifiedServerInfo(id: 'b', name: 'Beta'),
        ],
      );
      expect(merged.single[unifiedServerIdKey], 'b');
      expect(unifiedCopiesOf(merged.single).map((copy) => copy.reachable), [
        true,
        false,
      ]);
    });

    test('counts a title as watched once any server says so', () {
      final merged = _merge(
        [
          _entry('a', 'Hodrimel', tmdb: '1002'),
          _entry('b', 'Hodrimel', tmdb: '1002', played: true, favorite: true),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      final userData = merged.single['UserData'] as Map;
      expect(userData['Played'], isTrue);
      expect(userData['IsFavorite'], isTrue);
      // Each copy still reports its own state to the server picker.
      expect(unifiedCopiesOf(merged.single).map((copy) => copy.played), [
        false,
        true,
      ]);
    });

    group('a title watched on one server and being watched again on '
        'another', () {
      List<Map<String, dynamic>> rewatched({bool resumingReachable = true}) =>
          _merge(
            [
              _entry('a', 'Hodrimel', tmdb: '1002', played: true),
              _entry('b', 'Hodrimel', tmdb: '1002', positionTicks: 500),
            ],
            itemType: 'Movie',
            servers: [
              const UnifiedServerInfo(id: 'a', name: 'Alpha'),
              UnifiedServerInfo(
                id: 'b',
                name: 'Beta',
                reachable: resumingReachable,
              ),
            ],
          );

      List<String> matching(String filter) => _names(
        filterAndSortCatalog(
          rewatched(),
          UnifiedCatalogQuery(itemTypes: 'Movie', filters: [filter]),
        ),
      );

      test('is in progress, not watched', () {
        final userData = rewatched().single['UserData'] as Map;
        expect(userData['Played'], isFalse);
        expect(userData['PlaybackPositionTicks'], 500);
      });

      test('is found by the filters that find a title in progress', () {
        expect(matching('IsResumable'), ['Hodrimel']);
        expect(matching('IsUnplayed'), ['Hodrimel']);
        expect(matching('IsPlayed'), isEmpty);
      });

      test('is in progress whichever copy it is shown from', () {
        final merged = rewatched(resumingReachable: false).single;
        expect(merged[unifiedServerIdKey], 'a');
        final userData = merged['UserData'] as Map;
        expect(userData['Played'], isFalse);
        expect(userData['PlaybackPositionTicks'], 500);
      });

      test('leaves each copy the state its own server reports', () {
        final copies = unifiedCopiesOf(rewatched().single);
        expect(
          [
            for (final copy in copies)
              (copy.serverId, copy.played, copy.positionTicks),
          ],
          [('b', false, 500), ('a', true, 0)],
        );
      });
    });

    test('dates a shared title by its most recent addition', () {
      final merged = _merge(
        [
          _entry('a', 'Hodrimel', tmdb: '1002', added: '2020-01-01'),
          _entry('b', 'Hodrimel', tmdb: '1002', added: '2026-05-01'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      expect(merged.single['DateCreated'], startsWith('2026-05-01'));
    });

    test('leaves out a server that is no longer signed in', () {
      final merged = _merge(
        [
          _entry('a', 'Hodrimel', tmdb: '1002'),
          _entry('gone', 'Rusquin', tmdb: '1'),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      expect(_names(merged), ['Hodrimel']);
    });
  });

  group('filterAndSortCatalog', () {
    final items = _merge(
      [
        _entry(
          'a',
          'Élorn',
          added: '2024-01-01',
          year: 2035,
          genres: ['Drama'],
          rating: 'PG',
          score: 6,
        ),
        _entry(
          'b',
          'Altovar',
          added: '2026-01-01',
          year: 2033,
          genres: ['Horror'],
          rating: 'R',
          score: 7.5,
          played: true,
        ),
        _entry(
          'a',
          'Zunmere',
          added: '2025-01-01',
          year: 2037,
          genres: ['Crime', 'Drama'],
          rating: 'R',
          favorite: true,
          positionTicks: 10,
        ),
      ],
      itemType: 'Movie',
      servers: _servers,
    );

    List<String> namesFor(UnifiedCatalogQuery query) =>
        _names(filterAndSortCatalog(items, query));

    test('sorts by name with accents folded away', () {
      expect(namesFor(const UnifiedCatalogQuery(itemTypes: 'Movie')), [
        'Altovar',
        'Élorn',
        'Zunmere',
      ]);
    });

    test('sorts by date added, newest first', () {
      expect(
        namesFor(
          const UnifiedCatalogQuery(
            itemTypes: 'Movie',
            sortBy: 'DateCreated,SortName',
            descending: true,
          ),
        ),
        ['Altovar', 'Zunmere', 'Élorn'],
      );
    });

    test('puts a title without a rating last when the best come first', () {
      expect(
        namesFor(
          const UnifiedCatalogQuery(
            itemTypes: 'Movie',
            sortBy: 'CommunityRating,SortName',
            descending: true,
          ),
        ),
        ['Altovar', 'Élorn', 'Zunmere'],
      );
    });

    test('filters on watched state, favorites and progress', () {
      expect(
        namesFor(
          const UnifiedCatalogQuery(itemTypes: 'Movie', filters: ['IsPlayed']),
        ),
        ['Altovar'],
      );
      expect(
        namesFor(
          const UnifiedCatalogQuery(
            itemTypes: 'Movie',
            filters: ['IsUnplayed'],
          ),
        ),
        ['Élorn', 'Zunmere'],
      );
      expect(
        namesFor(
          const UnifiedCatalogQuery(
            itemTypes: 'Movie',
            filters: ['IsResumable'],
          ),
        ),
        ['Zunmere'],
      );
      expect(
        namesFor(
          const UnifiedCatalogQuery(itemTypes: 'Movie', favoritesOnly: true),
        ),
        ['Zunmere'],
      );
    });

    test('filters on genre, parental rating and year', () {
      expect(
        namesFor(
          const UnifiedCatalogQuery(itemTypes: 'Movie', genres: ['Drama']),
        ),
        ['Élorn', 'Zunmere'],
      );
      expect(
        namesFor(
          const UnifiedCatalogQuery(itemTypes: 'Movie', officialRatings: ['R']),
        ),
        ['Altovar', 'Zunmere'],
      );
      expect(
        namesFor(const UnifiedCatalogQuery(itemTypes: 'Movie', years: [2033])),
        ['Altovar'],
      );
    });

    test('a seeded random sort keeps every title', () {
      final shuffled = filterAndSortCatalog(
        items,
        const UnifiedCatalogQuery(itemTypes: 'Movie', sortBy: 'Random'),
        random: Random(1),
      );
      expect(
        _names(shuffled),
        unorderedEquals(['Altovar', 'Élorn', 'Zunmere']),
      );
    });

    test('two servers sharing an id and a name always sort the same way', () {
      Map<String, dynamic> sameIdMovie(String serverId) => {
        'Id': '7',
        'Name': 'Crendil',
        unifiedServerIdKey: serverId,
      };
      const query = UnifiedCatalogQuery(itemTypes: 'Movie');

      List<Object?> order(List<Map<String, dynamic>> items) => [
        for (final item in filterAndSortCatalog(items, query))
          item[unifiedServerIdKey],
      ];

      expect(order([sameIdMovie('a'), sameIdMovie('b')]), ['a', 'b']);
      expect(order([sameIdMovie('b'), sameIdMovie('a')]), ['a', 'b']);
    });

    test('sorts on dates the server wrote in different ways', () {
      final sorted = filterAndSortCatalog([
        {'Id': '1', 'Name': 'Old', 'DateCreated': '2020-05-01T00:00:00Z'},
        {
          'Id': '2',
          'Name': 'New',
          'DateCreated': '2024-05-01T00:00:00.0000000+02:00',
        },
        {'Id': '3', 'Name': 'Undated'},
        {'Id': '4', 'Name': 'Middle', 'DateCreated': '2022-05-01T00:00:00'},
      ], const UnifiedCatalogQuery(itemTypes: 'Movie', sortBy: 'DateCreated'));

      expect(_names(sorted), ['Undated', 'Old', 'Middle', 'New']);
    });

    test('lists the filter values the titles hold', () {
      final facets = catalogFacets(items);
      expect(facets.genres, ['Crime', 'Drama', 'Horror']);
      expect(facets.officialRatings, ['PG', 'R']);
      expect(facets.years, [2037, 2035, 2033]);
    });
  });

  group('a genre across servers', () {
    UnifiedCatalogEntry series(String serverId, String name, {String? tmdb}) =>
        _entry(serverId, name, type: 'Series', tmdb: tmdb, genres: ['Drama']);

    test('a title matches the genre any of its copies carries', () {
      final merged = _merge(
        [
          _entry('a', 'Altovar', tmdb: '1001', genres: ['Sci-Fi']),
          _entry('b', 'Altovar', tmdb: '1001', genres: ['Horror', 'sci-fi']),
          _entry('a', 'Hodrimel', genres: ['Crime']),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      final sharedMovie = merged.firstWhere(
        (item) => item['Name'] == 'Altovar',
      );

      expect(sharedMovie[unifiedServerIdKey], 'a');
      expect(sharedMovie['Genres'], ['Sci-Fi']);
      expect(unifiedGenresOf(sharedMovie), ['Sci-Fi', 'Horror']);
      expect(
        _names(
          filterAndSortCatalog(
            merged,
            const UnifiedCatalogQuery(itemTypes: 'Movie', genre: ' horror '),
          ),
        ),
        ['Altovar'],
      );
    });

    test('the library\'s genre filter matches any copy\'s genre too', () {
      final merged = _merge(
        [
          _entry('a', 'Altovar', tmdb: '1001', genres: ['Sci-Fi']),
          _entry('b', 'Altovar', tmdb: '1001', genres: ['Horror']),
          _entry('a', 'Aidrun!', genres: ['Comedy']),
          _entry('b', 'Clestin', genres: [' COMEDY ']),
          _entry('b', 'Ambréval', genres: ['Comédie']),
        ],
        itemType: 'Movie',
        servers: _servers,
      );
      List<String> filtered(List<String> genres) => _names(
        filterAndSortCatalog(
          merged,
          UnifiedCatalogQuery(itemTypes: 'Movie', genres: genres),
        ),
      );

      expect(filtered(['Horror']), ['Altovar']);
      expect(filtered(['Comedy']), ['Aidrun!', 'Clestin']);
      expect(filtered(['Comédie']), ['Ambréval']);
      expect(filtered(['Horror', 'comédie']), ['Altovar', 'Ambréval']);
    });

    test('the filter list holds one entry per genre name', () {
      final merged = _merge(
        [
          _entry('a', 'Altovar', tmdb: '1001', genres: ['Sci-Fi']),
          _entry('b', 'Altovar', tmdb: '1001', genres: ['Horror', 'SCI-FI']),
          _entry('a', 'Aidrun!', genres: ['Comedy']),
          _entry('b', 'Clestin', genres: [' COMEDY ']),
          _entry('b', 'Ambréval', genres: ['Comédie']),
        ],
        itemType: 'Movie',
        servers: _servers,
      );

      expect(catalogFacets(merged).genres, [
        'Comedy',
        'Comédie',
        'Horror',
        'Sci-Fi',
      ]);
      expect(
        catalogFacets(merged, genreSpellings: {'comedy': 'comedy'}).genres,
        contains('comedy'),
      );
    });

    test('same names are one genre, whatever the case or the padding', () {
      final genres = catalogGenres([
        {
          'Id': '1',
          'Genres': ['Comedy'],
        },
        {
          'Id': '2',
          'Genres': ['COMEDY', ' comedy '],
        },
        {
          'Id': '3',
          'Genres': ['Comédie', 'Action'],
        },
      ]);

      expect([for (final genre in genres) genre.name], [
        'Action',
        'Comedy',
        'Comédie',
      ]);
      expect([for (final genre in genres) genre.items.length], [1, 2, 1]);
    });

    test('a genre is spelled the way the caller\'s spellings say', () {
      final genres = catalogGenres(
        [
          {
            'Id': '1',
            'Genres': ['sci-fi'],
          },
        ],
        spellings: {'sci-fi': 'Sci-Fi'},
      );

      expect(genres.single.name, 'Sci-Fi');
    });

    test('movies and series sort as one list and never merge', () {
      final items = [
        ..._merge(
          [
            _entry('a', 'Zunmere', genres: ['Drama'], added: '2025-01-01'),
            _entry(
              'a',
              'Dastrel',
              tmdb: '7',
              genres: ['Drama'],
              added: '2024-01-01',
            ),
            _entry('b', 'Hodrimel', genres: ['Crime']),
          ],
          itemType: 'Movie',
          servers: _servers,
        ),
        ..._merge(
          [
            series('a', 'Mivel Dorn'),
            series('b', 'Dastrel', tmdb: '7'),
            series('b', 'Mivel Dorn'),
          ],
          itemType: 'Series',
          servers: _servers,
        ),
      ];

      final byName = filterAndSortCatalog(
        items,
        const UnifiedCatalogQuery(itemTypes: 'Movie,Series', genre: 'Drama'),
      );
      expect(
        [for (final item in byName) '${item['Name']} ${item['Type']}'],
        [
          'Dastrel Movie',
          'Dastrel Series',
          'Mivel Dorn Series',
          'Mivel Dorn Series',
          'Zunmere Movie',
        ],
      );
      expect(
        _names(
          filterAndSortCatalog(
            items,
            const UnifiedCatalogQuery(
              itemTypes: 'Movie,Series',
              genre: 'Drama',
              sortBy: 'DateCreated',
              descending: true,
            ),
          ),
        ).take(2),
        ['Zunmere', 'Dastrel'],
      );
    });
  });
}
