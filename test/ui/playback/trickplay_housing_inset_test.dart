import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/trickplay_housing_inset.dart';

void main() {
  const landscape = EdgeInsets.only(left: 59, bottom: 21);
  const portrait = EdgeInsets.only(top: 59, bottom: 34);

  test('the setting off leaves the preview alone', () {
    expect(
      trickplayHousingInset(keepClear: false, viewPadding: landscape),
      EdgeInsets.zero,
    );
  });

  test('landscape holds the preview back from the housing side only', () {
    expect(
      trickplayHousingInset(keepClear: true, viewPadding: landscape),
      const EdgeInsets.only(left: 59),
    );
  });

  test('the housing on the other side is held back just the same', () {
    expect(
      trickplayHousingInset(
        keepClear: true,
        viewPadding: const EdgeInsets.only(right: 59, bottom: 21),
      ),
      const EdgeInsets.only(right: 59),
    );
  });

  test('portrait is left alone, since the housing is above the picture', () {
    expect(
      trickplayHousingInset(keepClear: true, viewPadding: portrait),
      EdgeInsets.zero,
    );
  });

  test('a screen with no housing leaves the preview alone', () {
    expect(
      trickplayHousingInset(keepClear: true, viewPadding: EdgeInsets.zero),
      EdgeInsets.zero,
    );
  });
}
