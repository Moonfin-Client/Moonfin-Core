// Pins the Spotlight action-row cap: Play plus at most three secondary
// buttons stay inline and everything else goes behind the ellipsis menu,
// strictly, even when the menu would hold a single action. The legacy modes
// keep their exact previous behavior, where a row exactly at the cap stays
// inline with no More button.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

void main() {
  // Spotlight landscape passes maxVisibleButtonsOverride: 5. On the
  // non-mobile layout the primary occupies a visible slot, so visibleCount is
  // maxVisible - 1: Play + 3 secondaries + the ellipsis slot.
  group('spotlight landscape (override 5)', () {
    ({int visibleCount, bool needsOverflow}) split(int totalButtons) =>
        DetailActionButtonsState.countSplit(
          totalButtons: totalButtons,
          maxVisible: 5,
          isModernMobile: false,
          overflowAsMenu: true,
          countCapped: true,
        );

    test('a full row folds to Play + 3 + ellipsis', () {
      final result = split(8);
      expect(result.needsOverflow, isTrue);
      expect(result.visibleCount, 4);
    });

    test('Play + 4 overflows even though the menu holds one action', () {
      // The legacy comparison kept all five inline; the Spotlight cap is
      // strict: never more than three secondaries beside Play.
      expect(split(5).needsOverflow, isTrue);
    });

    test('Play + 3 stays inline with no ellipsis', () {
      expect(split(4).needsOverflow, isFalse);
    });
  });

  // Spotlight portrait passes maxVisibleButtonsOverride: 4. The full-width
  // Play pill sits on its own row, so it neither counts nor takes a slot:
  // the tile row holds 3 secondaries + the ellipsis.
  group('spotlight portrait (override 4, modern mobile)', () {
    ({int visibleCount, bool needsOverflow}) split(int totalButtons) =>
        DetailActionButtonsState.countSplit(
          totalButtons: totalButtons,
          maxVisible: 4,
          isModernMobile: true,
          overflowAsMenu: true,
          countCapped: true,
        );

    test('many buttons fold to pill + 3 tiles + ellipsis', () {
      final result = split(9);
      expect(result.needsOverflow, isTrue);
      expect(result.visibleCount, 4);
    });

    test('4 secondaries overflow strictly', () {
      expect(split(5).needsOverflow, isTrue);
    });

    test('3 secondaries stay inline', () {
      expect(split(4).needsOverflow, isFalse);
    });
  });

  group('legacy modes are untouched', () {
    test('a row exactly at the cap stays inline', () {
      final result = DetailActionButtonsState.countSplit(
        totalButtons: 5,
        maxVisible: 5,
        isModernMobile: false,
        overflowAsMenu: false,
        countCapped: true,
      );
      expect(result.needsOverflow, isFalse);
    });

    test('one over the cap overflows', () {
      final result = DetailActionButtonsState.countSplit(
        totalButtons: 6,
        maxVisible: 5,
        isModernMobile: false,
        overflowAsMenu: false,
        countCapped: true,
      );
      expect(result.needsOverflow, isTrue);
      expect(result.visibleCount, 4);
    });
  });

  test('without a count cap the width heuristic stays in charge', () {
    final result = DetailActionButtonsState.countSplit(
      totalButtons: 12,
      maxVisible: 5,
      isModernMobile: false,
      overflowAsMenu: true,
      countCapped: false,
    );
    expect(result.needsOverflow, isFalse);
  });

  group('user preference limit overrides', () {
    test('prefLimit = 1 (Play only) folds secondary buttons into More menu', () {
      // prefLimit == 1 sets maxVisible: 2, countCapped: true
      final result = DetailActionButtonsState.countSplit(
        totalButtons: 5,
        maxVisible: 2,
        isModernMobile: false,
        overflowAsMenu: true,
        countCapped: true,
      );
      expect(result.needsOverflow, isTrue);
      // visibleCount = maxVisible - 1 = 1 (only Play is shown inline before '...')
      expect(result.visibleCount, 1);
    });

    test('prefLimit = 1 with only Play button does not overflow', () {
      final result = DetailActionButtonsState.countSplit(
        totalButtons: 1,
        maxVisible: 2,
        isModernMobile: false,
        overflowAsMenu: true,
        countCapped: true,
      );
      expect(result.needsOverflow, isFalse);
    });

    test('prefLimit = 8 allows 8 inline buttons before overflowing', () {
      // prefLimit == 8 sets maxVisible: 9, countCapped: true
      final inline = DetailActionButtonsState.countSplit(
        totalButtons: 8,
        maxVisible: 9,
        isModernMobile: false,
        overflowAsMenu: true,
        countCapped: true,
      );
      expect(inline.needsOverflow, isFalse);

      final overflow = DetailActionButtonsState.countSplit(
        totalButtons: 9,
        maxVisible: 9,
        isModernMobile: false,
        overflowAsMenu: true,
        countCapped: true,
      );
      expect(overflow.needsOverflow, isTrue);
      expect(overflow.visibleCount, 8);
    });

    test('prefLimit = -1 (All/unlimited) disables count cap', () {
      final result = DetailActionButtonsState.countSplit(
        totalButtons: 15,
        maxVisible: 5,
        isModernMobile: false,
        overflowAsMenu: true,
        countCapped: false,
      );
      expect(result.needsOverflow, isFalse);
    });
  });
}

