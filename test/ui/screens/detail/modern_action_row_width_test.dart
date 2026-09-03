// The row uses this to decide whether every action button fits on one line or
// some of them move into an overflow menu. Counting Play at its grown width
// describes a row where two buttons are grown at once, which hides buttons
// that had room to stay.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

void main() {
  // What _buildModernChild lays each button out at.
  const playResting = 54.0;
  const circleResting = 52.0;
  const grownWidth = 200.0;
  const spacing = 8.0;

  double worstWidth(int buttonCount, [double playFocused = 140.0]) =>
      DetailActionButtonsState.modernRowWorstWidth(
        buttonCount,
        spacing,
        playFocused,
      );

  test('a row of only Play needs only its own focused width', () {
    expect(worstWidth(1, 140), 140);
    expect(worstWidth(1, 200), 200);
  });

  test('it measures one grown button and the rest at rest', () {
    for (var circles = 1; circles <= 6; circles++) {
      expect(
        worstWidth(circles + 1),
        circles * spacing +
            grownWidth +
            playResting +
            (circles - 1) * circleResting,
        reason: 'circles=$circles',
      );
    }
  });

  // Pinned rather than recomputed, so a formula that drifts has to answer for
  // a number somebody can hold against a screen.
  test('a five button row asks for 442', () {
    expect(worstWidth(5), 442);
  });

  // Play only ever rests while a circle is grown, so how wide its label makes
  // it cannot change what the row needs.
  test('the Play label does not change a row that has circles', () {
    expect(worstWidth(5, 140), worstWidth(5, 200));
  });
}
