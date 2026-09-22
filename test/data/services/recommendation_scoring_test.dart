import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

void main() {
  late RowDataSource dataSource;

  setUp(() {
    dataSource = RowDataSource(_MockClient());
  });

  group('Recommendation Scoring - 200.0 Point Theoretical Maximum', () {
    test('achieves exactly 200.0 points when all categories match at maximum', () {
      final candidate = <String, dynamic>{
        'Name': 'Dune: Part Two',
        'Genres': ['Action', 'Adventure', 'Drama', 'Sci-Fi', 'Fantasy'],
        'Tags': ['desert', 'spice', 'epic', 'chosen one', 'prophecy'],
        'People': [
          {'Type': 'Director', 'Name': 'Denis Villeneuve'},
          {'Type': 'Director', 'Name': 'Co-Director 1'},
          {'Type': 'Director', 'Name': 'Co-Director 2'},
          {'Type': 'Writer', 'Name': 'Jon Spaihts'},
          {'Type': 'Writer', 'Name': 'Frank Herbert'},
          {'Type': 'Writer', 'Name': 'Co-Writer 1'},
          {'Type': 'Actor', 'Name': 'Timothée Chalamet'},
          {'Type': 'Actor', 'Name': 'Zendaya'},
          {'Type': 'Actor', 'Name': 'Rebecca Ferguson'},
        ],
        'Studios': [
          {'Name': 'Legendary Pictures'},
          {'Name': 'Warner Bros.'},
        ],
        'ProductionYear': 2024,
        'CommunityRating': 8.5,
      };

      final score = dataSource.scoreCandidateForTesting(
        candidate,
        genres: ['Action', 'Adventure', 'Drama', 'Sci-Fi', 'Fantasy'],
        tags: ['desert', 'spice', 'epic', 'chosen one', 'prophecy'],
        actorNames: {'Timothée Chalamet', 'Zendaya', 'Rebecca Ferguson'},
        directorNames: {'Denis Villeneuve', 'Co-Director 1', 'Co-Director 2'},
        writerNames: {'Jon Spaihts', 'Frank Herbert', 'Co-Writer 1'},
        baseStudios: ['Legendary Pictures', 'Warner Bros.'],
        baseYear: 2024,
        baseRating: 8.5,
        baseName: 'Dune',
      );

      // Breakdown:
      // Directors: 15 + 10 + 5 = 30.0
      // Writers: 15 + 10 + 5 = 30.0
      // Genres: 5 * 7.0 = 35.0
      // Title / Franchise: 25.0
      // Actors: 10 + 6 + 4 = 20.0
      // Studios: 12 + 8 = 20.0
      // Tags: 5 * 4.0 = 20.0
      // Year: 10.0
      // Rating: 10.0
      // Total = 200.0
      expect(score, 200.0);
    });

    test('directors use diminishing returns (15, 10, 5 up to 30)', () {
      double scoreWithDirectors(List<String> directors) {
        return dataSource.scoreCandidateForTesting(
          {
            'People': directors.map((d) => {'Type': 'Director', 'Name': d}).toList(),
          },
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {'Dir1', 'Dir2', 'Dir3', 'Dir4'},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithDirectors(['Dir1']), 15.0);
      expect(scoreWithDirectors(['Dir1', 'Dir2']), 25.0);
      expect(scoreWithDirectors(['Dir1', 'Dir2', 'Dir3']), 30.0);
      expect(scoreWithDirectors(['Dir1', 'Dir2', 'Dir3', 'Dir4']), 30.0);
    });

    test('writers use diminishing returns (15, 10, 5 up to 30)', () {
      double scoreWithWriters(List<String> writers) {
        return dataSource.scoreCandidateForTesting(
          {
            'People': writers.map((w) => {'Type': 'Writer', 'Name': w}).toList(),
          },
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {'Writer1', 'Writer2', 'Writer3', 'Writer4'},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithWriters(['Writer1']), 15.0);
      expect(scoreWithWriters(['Writer1', 'Writer2']), 25.0);
      expect(scoreWithWriters(['Writer1', 'Writer2', 'Writer3']), 30.0);
      expect(scoreWithWriters(['Writer1', 'Writer2', 'Writer3', 'Writer4']), 30.0);
    });

    test('actors use diminishing returns (10, 6, 4 up to 20)', () {
      double scoreWithActors(List<String> actors) {
        return dataSource.scoreCandidateForTesting(
          {
            'People': actors.map((a) => {'Type': 'Actor', 'Name': a}).toList(),
          },
          genres: [],
          tags: [],
          actorNames: {'Actor1', 'Actor2', 'Actor3', 'Actor4'},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithActors(['Actor1']), 10.0);
      expect(scoreWithActors(['Actor1', 'Actor2']), 16.0);
      expect(scoreWithActors(['Actor1', 'Actor2', 'Actor3']), 20.0);
      expect(scoreWithActors(['Actor1', 'Actor2', 'Actor3', 'Actor4']), 20.0);
    });

    test('studios use diminishing returns (12, 8 up to 20)', () {
      double scoreWithStudios(List<String> studios) {
        return dataSource.scoreCandidateForTesting(
          {
            'Studios': studios.map((s) => {'Name': s}).toList(),
          },
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: ['Studio1', 'Studio2', 'Studio3'],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithStudios(['Studio1']), 12.0);
      expect(scoreWithStudios(['Studio1', 'Studio2']), 20.0);
      expect(scoreWithStudios(['Studio1', 'Studio2', 'Studio3']), 20.0);
    });

    test('genres are 7 pts each and capped at 35', () {
      double scoreWithGenres(List<String> genres) {
        return dataSource.scoreCandidateForTesting(
          {'Genres': genres},
          genres: ['G1', 'G2', 'G3', 'G4', 'G5', 'G6'],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithGenres(['G1']), 7.0);
      expect(scoreWithGenres(['G1', 'G2']), 14.0);
      expect(scoreWithGenres(['G1', 'G2', 'G3', 'G4', 'G5']), 35.0);
      expect(scoreWithGenres(['G1', 'G2', 'G3', 'G4', 'G5', 'G6']), 35.0);
    });

    test('tags are 4 pts each and capped at 20', () {
      double scoreWithTags(List<String> tags) {
        return dataSource.scoreCandidateForTesting(
          {'Tags': tags},
          genres: [],
          tags: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6'],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithTags(['T1']), 4.0);
      expect(scoreWithTags(['T1', 'T2']), 8.0);
      expect(scoreWithTags(['T1', 'T2', 'T3', 'T4', 'T5']), 20.0);
      expect(scoreWithTags(['T1', 'T2', 'T3', 'T4', 'T5', 'T6']), 20.0);
    });

    test('production year decays over 15 years', () {
      double scoreWithYear(int year) {
        return dataSource.scoreCandidateForTesting(
          {'ProductionYear': year},
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: 2020,
          baseRating: null,
          baseName: 'Unrelated',
        );
      }

      expect(scoreWithYear(2020), 10.0);
      expect(scoreWithYear(2017), 8.0); // diff 3: 10 * (1 - 3/15) = 8.0
      expect(scoreWithYear(2005), 0.0); // diff 15: 0.0
      expect(scoreWithYear(2000), 0.0); // diff 20: 0.0
    });

    test('community rating proximity yields up to 10 points', () {
      double scoreWithRating(double candRating, double? baseRating) {
        return dataSource.scoreCandidateForTesting(
          {'CommunityRating': candRating},
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: baseRating,
          baseName: 'Unrelated',
        );
      }

      // Exact match
      expect(scoreWithRating(8.0, 8.0), 10.0);
      // 1.0 diff: 10 * (1 - 1/10) = 9.0
      expect(scoreWithRating(7.0, 8.0), 9.0);
      // No base rating: proportional
      expect(scoreWithRating(7.5, null), 7.5);
    });

    test('sequels and pluralized suffixes earn the 25 point bonus', () {
      double scoreTitle(String candidateTitle, String baseTitle) {
        return dataSource.scoreCandidateForTesting(
          {'Name': candidateTitle},
          genres: [],
          tags: [],
          actorNames: {},
          directorNames: {},
          writerNames: {},
          baseStudios: [],
          baseYear: null,
          baseRating: null,
          baseName: baseTitle,
        );
      }

      // Substring / subset match
      expect(scoreTitle('Blade Runner 2049', 'Blade Runner'), 25.0);
      // Pluralized short suffix
      expect(scoreTitle('Aliens', 'Alien'), 25.0);
      expect(scoreTitle('Predators', 'Predator'), 25.0);
      // Unrelated
      expect(scoreTitle('Total Recall', 'Blade Runner'), 0.0);
    });
  });
}
