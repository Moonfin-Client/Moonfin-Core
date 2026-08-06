import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/parental_rating_severity.dart';

/// Sorts the way the grouped library does, so the tests read as the order a
/// user would actually see.
List<String> _bySeverity(List<String> ratings) {
  final sorted = [...ratings];
  sorted.sort((a, b) {
    final scoreA = parentalRatingSeverity(a);
    final scoreB = parentalRatingSeverity(b);
    if (scoreA != scoreB) return scoreA.compareTo(scoreB);
    return a.compareTo(b);
  });
  return sorted;
}

void main() {
  group('parentalRatingSeverity', () {
    test('orders the MPAA ladder from mildest to strongest', () {
      expect(_bySeverity(['R', 'G', 'NC-17', 'PG-13', 'PG']), <String>[
        'G',
        'PG',
        'PG-13',
        'R',
        'NC-17',
      ]);
    });

    test('orders the US television ladder', () {
      expect(
        _bySeverity(['TV-MA', 'TV-Y', 'TV-14', 'TV-Y7', 'TV-G', 'TV-PG']),
        <String>['TV-G', 'TV-Y', 'TV-Y7', 'TV-PG', 'TV-14', 'TV-MA'],
      );
    });

    test('sorts every unrated spelling last', () {
      for (final unrated in ['Unrated', 'NR', 'UR', 'Not Rated', 'Unknown']) {
        expect(
          parentalRatingSeverity(unrated),
          kRatingUnrated,
          reason: '$unrated should sort last',
        );
        expect(
          parentalRatingSeverity(unrated),
          greaterThan(parentalRatingSeverity('NC-17')),
        );
      }
    });

    test('an empty rating counts as unrated', () {
      expect(parentalRatingSeverity(''), kRatingUnrated);
      expect(parentalRatingSeverity('   '), kRatingUnrated);
    });

    test('is case and whitespace insensitive', () {
      expect(
        parentalRatingSeverity(' pg-13 '),
        parentalRatingSeverity('PG-13'),
      );
      expect(parentalRatingSeverity('tv-ma'), parentalRatingSeverity('TV-MA'));
    });

    test('TV-Y7 outranks TV-Y rather than reading as it', () {
      // The two share a prefix, so a naive contains check collapses them.
      expect(
        parentalRatingSeverity('TV-Y7'),
        greaterThan(parentalRatingSeverity('TV-Y')),
      );
      expect(
        parentalRatingSeverity('TV-Y7-FV'),
        greaterThan(parentalRatingSeverity('TV-Y')),
      );
    });

    test('numeric boards fall back to the age they name', () {
      expect(_bySeverity(['16', '6', '12', '18']), <String>[
        '6',
        '12',
        '16',
        '18',
      ]);
    });

    test('an unfamiliar age-based rating slots in by its number', () {
      // Not in the table, but "9" still says who it is for.
      expect(
        parentalRatingSeverity('9+'),
        lessThan(parentalRatingSeverity('18')),
      );
      expect(
        parentalRatingSeverity('9+'),
        greaterThan(parentalRatingSeverity('G')),
      );
    });

    test('a rating with no number and no entry sorts before unrated', () {
      final unknown = parentalRatingSeverity('BOARD-SPECIFIC-LABEL');
      expect(unknown, kRatingUnrecognized);
      expect(unknown, greaterThan(parentalRatingSeverity('NC-17')));
      expect(unknown, lessThan(kRatingUnrated));
    });

    test('a word containing Y is not mistaken for a childrens rating', () {
      // The old contains('Y') check pulled anything with a Y down to all-ages.
      expect(
        parentalRatingSeverity('MA15+'),
        greaterThan(parentalRatingSeverity('G')),
      );
    });
  });
}
