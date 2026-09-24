import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/parental_filter.dart';
import 'package:moonfin/util/parental_rating_severity.dart';

void main() {
  group('the ceiling', () {
    test('blocking a rating blocks everything at or above it', () {
      final filter = ParentalFilter.fromRatings(const ['R']);
      for (final rating in const ['R', 'TV-MA', 'NC-17', 'X', 'AO', 'MA15+', '18']) {
        expect(filter.isBlockedRating(rating), isTrue, reason: rating);
      }
    });

    test('it leaves everything below it alone', () {
      final filter = ParentalFilter.fromRatings(const ['R']);
      for (final rating in const ['PG-13', 'TV-14', 'PG', 'G', 'TV-Y', 'U']) {
        expect(filter.isBlockedRating(rating), isFalse, reason: rating);
      }
    });

    test('several ticks take the mildest, not the last', () {
      // Blocking NC-17 and PG-13 has to block R, which sits between them.
      final filter = ParentalFilter.fromRatings(const ['NC-17', 'PG-13']);
      expect(filter.isBlockedRating('R'), isTrue);
      expect(filter.isBlockedRating('PG'), isFalse);
    });

    test('it crosses boards, which is the point of reusing the ladder', () {
      expect(
        ParentalFilter.fromRatings(const ['TV-MA']).isBlockedRating('R'),
        isTrue,
      );
      expect(
        ParentalFilter.fromRatings(const ['15']).isBlockedRating('TV-MA'),
        isTrue,
      );
    });

    test('case and whitespace are the same rating on both sides', () {
      final filter = ParentalFilter.fromRatings(const [' r ']);
      expect(filter.isBlockedRating('R'), isTrue);
      expect(filter.isBlockedRating(' tv-ma '), isTrue);
    });
  });

  group('unrated', () {
    test('passes whatever is blocked', () {
      final filter = ParentalFilter.fromRatings(const ['G']);
      for (final rating in [null, '', '   ']) {
        expect(filter.isBlockedRating(rating), isFalse, reason: '$rating');
      }
    });

    test('ticking NR blocks that label without setting a ceiling', () {
      final filter = ParentalFilter.fromRatings(const ['NR']);
      expect(filter.ceiling, isNull);
      expect(filter.isBlockedRating('NR'), isTrue);
      expect(filter.isBlockedRating('R'), isFalse);
      expect(filter.isBlockedRating(null), isFalse);
    });

    test('an empty filter blocks nothing', () {
      expect(ParentalFilter.none.isActive, isFalse);
      expect(ParentalFilter.none.isBlockedRating('NC-17'), isFalse);
    });

    test('a raw map with a non string rating does not throw', () {
      final filter = ParentalFilter.fromRatings(const ['R']);
      expect(filter.isBlockedRaw({'OfficialRating': 12}), isFalse);
      expect(filter.isBlockedRaw({'OfficialRating': 'R'}), isTrue);
      expect(filter.isBlockedRaw(const {}), isFalse);
    });
  });

  group('a rating the ladder cannot place', () {
    test('is not caught by the ceiling', () {
      // The regression test for the whole design. Treating the unrecognized
      // bucket as a severity would empty a library on an unfamiliar board.
      expect(
        ParentalFilter.fromRatings(const ['R']).isBlockedRating('APTA'),
        isFalse,
      );
    });

    test('sets no ceiling when it is the only thing blocked', () {
      final filter = ParentalFilter.fromRatings(const ['APTA', 'LIVRE']);
      expect(filter.ceiling, isNull);
      for (final rating in const ['G', 'PG', 'PG-13', 'R', 'NC-17']) {
        expect(filter.isBlockedRating(rating), isFalse, reason: rating);
      }
    });

    test('still blocks itself by name', () {
      expect(
        ParentalFilter.fromRatings(const ['APTA']).isBlockedRating('apta'),
        isTrue,
      );
    });

    test('mixes with a real rating without disturbing it', () {
      final filter = ParentalFilter.fromRatings(const ['R', 'APTA']);
      expect(filter.ceiling, kRatingMature);
      expect(filter.isBlockedRating('APTA'), isTrue);
      expect(filter.isBlockedRating('NC-17'), isTrue);
      expect(filter.isBlockedRating('LIVRE'), isFalse);
      expect(filter.isBlockedRating('PG'), isFalse);
    });
  });

  group('parsing the stored form', () {
    test('an empty or comma only value blocks nothing', () {
      expect(ParentalFilter.fromCsv('').isActive, isFalse);
      expect(ParentalFilter.fromCsv(',,').isActive, isFalse);
    });

    test('blank entries are skipped', () {
      final filter = ParentalFilter.fromCsv('R,,PG-13,');
      expect(filter.literals, {'R', 'PG-13'});
    });

    test('the same value parses equal, so a cache can compare', () {
      expect(ParentalFilter.fromCsv('R,PG-13'), ParentalFilter.fromCsv('R,PG-13'));
    });
  });

  group('the recommendation cap', () {
    test('an unrated source caps nothing', () {
      expect(exceedsRatingCap('NC-17', null), isFalse);
      expect(exceedsRatingCap('NC-17', ''), isFalse);
    });

    test('a stronger candidate is dropped and a milder one kept', () {
      expect(exceedsRatingCap('R', 'PG'), isTrue);
      expect(exceedsRatingCap('PG', 'R'), isFalse);
      expect(exceedsRatingCap('R', 'R'), isFalse);
    });

    test('a candidate the ladder cannot place is dropped', () {
      // The opposite of the filter, on purpose. A lost suggestion costs
      // nothing, a hidden item costs someone their own content.
      expect(exceedsRatingCap('APTA', 'PG'), isTrue);
    });

    test('a source the ladder cannot place imposes no cap', () {
      expect(exceedsRatingCap('NC-17', 'APTA'), isFalse);
    });
  });

  group('isRankedRatingSeverity', () {
    test('every tier is ranked', () {
      for (final severity in const [
        kRatingAllAges,
        kRatingYoungChildren,
        kRatingGuidance,
        kRatingTeen,
        kRatingMature,
        kRatingAdultsOnly,
      ]) {
        expect(isRankedRatingSeverity(severity), isTrue, reason: '$severity');
      }
    });

    test('the two off ladder buckets are not', () {
      expect(isRankedRatingSeverity(kRatingUnrecognized), isFalse);
      expect(isRankedRatingSeverity(kRatingUnrated), isFalse);
    });

    test('every spelling of unrated stays off the ladder', () {
      for (final spelling in const ['NR', 'UR', 'UNRATED', 'NOT RATED', 'UNKNOWN', 'OTHER']) {
        expect(
          isRankedRatingSeverity(parentalRatingSeverity(spelling)),
          isFalse,
          reason: spelling,
        );
      }
    });
  });
}
