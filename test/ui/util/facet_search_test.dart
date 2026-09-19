import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/util/facet_search.dart';

void main() {
  group('facetIsSearchable', () {
    test('a list short enough to read gets no box', () {
      expect(facetIsSearchable(List.generate(5, (i) => 'tag$i')), isFalse);
      expect(
        facetIsSearchable(List.generate(facetSearchThreshold, (i) => 'tag$i')),
        isFalse,
      );
    });

    test('a list past the threshold gets one', () {
      expect(
        facetIsSearchable(
          List.generate(facetSearchThreshold + 1, (i) => 'tag$i'),
        ),
        isTrue,
      );
    });
  });

  group('facetValuesMatching', () {
    const tags = ['adventure', 'adventurer', 'absurd', 'adult animation'];

    test('a partial word finds every tag that carries it', () {
      // The case from the issue: typing "adve" should leave both adventures.
      expect(facetValuesMatching(tags, 'adve'), <String>[
        'adventure',
        'adventurer',
      ]);
    });

    test('matches anywhere in the row, not only at the start', () {
      expect(facetValuesMatching(tags, 'animation'), <String>[
        'adult animation',
      ]);
    });

    test('an empty or blank query hands the list straight back', () {
      expect(identical(facetValuesMatching(tags, ''), tags), isTrue);
      expect(identical(facetValuesMatching(tags, '   '), tags), isTrue);
    });

    test('a query nothing carries comes back empty', () {
      expect(facetValuesMatching(tags, 'zzz'), isEmpty);
    });

    test('ignores case', () {
      expect(facetValuesMatching(tags, 'ADVE').length, 2);
    });

    // A tag is whatever the library owner typed, so it may well carry accents
    // the viewer does not reach for.
    test('folds accents on both sides', () {
      const accented = ['Cançó', 'Acció', 'Drama'];

      expect(facetValuesMatching(accented, 'canco'), <String>['Cançó']);
      expect(facetValuesMatching(accented, 'cançó'), <String>['Cançó']);
      expect(facetValuesMatching(accented, 'acció'), <String>['Acció']);
    });

    test('matches the label a row shows, not the value it filters by', () {
      // A language row reads "Catalan" while it filters on "cat".
      const values = ['cat', 'eng'];
      const labels = {'cat': 'Catalan', 'eng': 'English'};

      expect(
        facetValuesMatching(values, 'catalan', labels: labels),
        <String>['cat'],
      );
      expect(facetValuesMatching(values, 'english', labels: labels), <String>[
        'eng',
      ]);
    });
  });
}
