import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/focus/grid_section_target.dart';

/// Three sections at four cards per row: the first fills two rows exactly, the
/// second is a single ragged row, the third fills one row and starts another.
const _lengths = [8, 3, 5];

GridSectionCell? _down(int section, int index, {List<int>? lengths}) =>
    gridSectionTarget(
      sectionLengths: lengths ?? _lengths,
      crossAxisCount: 4,
      section: section,
      index: index,
      down: true,
    );

GridSectionCell? _up(int section, int index, {List<int>? lengths}) =>
    gridSectionTarget(
      sectionLengths: lengths ?? _lengths,
      crossAxisCount: 4,
      section: section,
      index: index,
      down: false,
    );

void main() {
  group('within a section', () {
    test('down holds the column', () {
      expect(_down(0, 1), (section: 0, index: 5));
    });

    test('up holds the column', () {
      expect(_up(0, 6), (section: 0, index: 2));
    });

    test('down over a ragged row lands on the last card', () {
      // The third section runs to 5 cards, so its second row holds only one.
      expect(_down(2, 2), (section: 2, index: 4));
      expect(_down(2, 0), (section: 2, index: 4));
    });
  });

  group('across sections', () {
    test('down from the last row enters the next section', () {
      expect(_down(0, 5), (section: 1, index: 1));
    });

    test('down clamps when the next section is narrower', () {
      // The second section stops at three cards, so column 3 has none under it.
      expect(_down(0, 7), (section: 1, index: 2));
    });

    test('up from the first row enters the previous section last row', () {
      expect(_up(2, 1), (section: 1, index: 1));
    });

    test('up clamps to a ragged last row', () {
      expect(_up(2, 3), (section: 1, index: 2));
      // A last row of one card takes every column above it.
      expect(_up(1, 0, lengths: const [5, 4]), (section: 0, index: 4));
      expect(_up(1, 3, lengths: const [5, 4]), (section: 0, index: 4));
    });

    test('an empty section is stepped over, not landed on', () {
      expect(_down(0, 0, lengths: const [4, 0, 2]), (section: 2, index: 0));
      expect(_up(2, 0, lengths: const [4, 0, 2]), (section: 0, index: 0));
    });
  });

  group('leaving the grid', () {
    // Null is how the caller knows to pass the press on instead of moving
    // focus itself.
    test('up from the first row of the first section', () {
      expect(_up(0, 0), isNull);
      expect(_up(0, 3), isNull);
    });

    test('down from the last row of the last section', () {
      expect(_down(2, 4), isNull);
    });

    test('nothing left but empty sections', () {
      expect(_down(0, 0, lengths: const [4, 0]), isNull);
      expect(_up(1, 0, lengths: const [0, 4]), isNull);
    });
  });
}
