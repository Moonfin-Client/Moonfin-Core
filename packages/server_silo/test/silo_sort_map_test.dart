import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

void main() {
  group('Moonfin → Silo', () {
    test('each mapped field, ascending and descending', () {
      const expected = {
        'SortName': 'title',
        'Name': 'title',
        'SeriesSortName': 'title',
        'ProductionYear': 'year',
        'PremiereDate': 'release_date',
        'DateCreated': 'added_at',
        'DateLastContentAdded': 'latest_episode_added',
        'CommunityRating': 'rating_tmdb',
        'CriticRating': 'rating_rt_critic',
        'OfficialRating': 'content_rating',
        'Runtime': 'runtime',
        'DatePlayed': 'date_viewed',
        'PlayCount': 'plays',
      };
      for (final MapEntry(key: moonfin, value: silo) in expected.entries) {
        expect(
          siloSortFor(sortBy: moonfin, sortOrder: 'Ascending'),
          silo,
          reason: moonfin,
        );
        expect(
          siloSortFor(sortBy: moonfin, sortOrder: 'Descending'),
          '-$silo',
          reason: moonfin,
        );
      }
    });

    test('no order means ascending; case doesn\'t matter', () {
      expect(siloSortFor(sortBy: 'sortname'), 'title');
      expect(
        siloSortFor(sortBy: 'DateCreated', sortOrder: 'descending'),
        '-added_at',
      );
    });

    test('random: no Silo sort, the caller shuffles', () {
      // Silo's catalog refuses sort=random.
      expect(siloSortFor(sortBy: 'Random', sortOrder: 'Descending'), isNull);
      expect(siloWantsRandom('Random'), isTrue);
      expect(siloWantsRandom('random,SortName'), isTrue);
      expect(siloWantsRandom('SortName,Random'), isFalse);
      expect(siloWantsRandom(null), isFalse);
    });

    test('only the first term counts', () {
      expect(
        siloSortFor(
          sortBy: 'ProductionYear,SortName',
          sortOrder: 'Descending,Ascending',
        ),
        '-year',
      );
      expect(siloSortFor(sortBy: ' ,PremiereDate'), 'release_date');
    });

    test('an unmapped first term leaves sort out, not the next term', () {
      expect(
        siloSortFor(sortBy: 'ParentIndexNumber,IndexNumber,SortName'),
        isNull,
      );
      expect(siloSortFor(sortBy: 'IsFolder,SortName'), isNull);
    });

    test('fields Silo has no sort for, and nothing', () {
      for (final field in [
        'Album',
        'Artist',
        'StartDate',
      ]) {
        expect(siloSortFor(sortBy: field), isNull, reason: field);
      }
      expect(siloSortFor(), isNull);
      expect(siloSortFor(sortBy: ''), isNull);
    });
  });

  group('Silo → Moonfin', () {
    test('every Silo field maps back', () {
      expect(jellyfinSortForSilo('title'), (
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      ));
      expect(jellyfinSortForSilo('-added_at'), (
        sortBy: 'DateCreated',
        sortOrder: 'Descending',
      ));
      expect(jellyfinSortForSilo('-date_viewed'), (
        sortBy: 'DatePlayed',
        sortOrder: 'Descending',
      ));
      for (final field in siloSortFields.values.toSet()) {
        final back = jellyfinSortForSilo(field)!;
        expect(siloSortFor(sortBy: back.sortBy), field);
      }
    });

    test('unknown or empty gives null', () {
      expect(jellyfinSortForSilo('play_count'), isNull);
      expect(jellyfinSortForSilo('rating'), isNull, reason: 'Silo refuses it');
      expect(jellyfinSortForSilo(''), isNull);
      expect(jellyfinSortForSilo(null), isNull);
    });
  });
}
