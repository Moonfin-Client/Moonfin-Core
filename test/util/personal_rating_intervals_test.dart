import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/personal_rating_intervals.dart';

void main() {
  group('effectivePersonalRatingIntervals', () {
    test('stars allows 6, 11, 21 and clamps 41 to 21', () {
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.stars, 6), 6);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.stars, 11), 11);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.stars, 21), 21);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.stars, 41), 21);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.stars, 99), 11);
    });

    test('numeric allows 11, 21, 41 and clamps 6 to 11', () {
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.numeric, 6), 11);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.numeric, 11), 11);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.numeric, 21), 21);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.numeric, 41), 41);
      expect(effectivePersonalRatingIntervals(PersonalRatingStyle.numeric, 99), 11);
    });
  });

  group('formatPersonalRatingBadge', () {
    test('trims trailing zeros to configured precision for stars', () {
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.stars, 6), '4/5');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.stars, 6), '4/5');
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.stars, 11), '4/5');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.stars, 11), '4.5/5');
      expect(formatPersonalRatingBadge(9.0, PersonalRatingStyle.stars, 11), '4.5/5');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.stars, 21), '4.25/5');
      expect(formatPersonalRatingBadge(9.0, PersonalRatingStyle.stars, 21), '4.5/5');
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.stars, 21), '4/5');
    });

    test('trims trailing zeros to configured precision for numeric', () {
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.numeric, 11), '8');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.numeric, 11), '9');
      expect(formatPersonalRatingBadge(10.0, PersonalRatingStyle.numeric, 11), '10');
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.numeric, 21), '8');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.numeric, 21), '8.5');
      expect(formatPersonalRatingBadge(8.25, PersonalRatingStyle.numeric, 41), '8.25');
      expect(formatPersonalRatingBadge(8.5, PersonalRatingStyle.numeric, 41), '8.5');
      expect(formatPersonalRatingBadge(8.0, PersonalRatingStyle.numeric, 41), '8');
    });
  });

  group('stepping and star taps', () {
    test('steps match configured intervals', () {
      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 6, up: true), 8.0);
      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 6, up: false), 4.0);

      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 11, up: true), 7.0);
      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 11, up: false), 5.0);

      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 21, up: true), 6.5);
      expect(stepPersonalRating(6.0, PersonalRatingStyle.stars, 21, up: false), 5.5);

      expect(stepPersonalRating(8.0, PersonalRatingStyle.numeric, 11, up: true), 9.0);
      expect(stepPersonalRating(8.0, PersonalRatingStyle.numeric, 21, up: true), 8.5);
      expect(stepPersonalRating(8.0, PersonalRatingStyle.numeric, 41, up: true), 8.25);
      expect(stepPersonalRating(8.0, PersonalRatingStyle.numeric, 41, up: false), 7.75);

      expect(stepPersonalRating(8.3, PersonalRatingStyle.numeric, 41, up: true), 8.5);
      expect(stepPersonalRating(8.3, PersonalRatingStyle.numeric, 41, up: false), 8.25);
      expect(stepPersonalRating(10.0, PersonalRatingStyle.numeric, 11, up: true), 10.0);
    });

    test('starTapRating maps fractions to whole, half, or quarter stars', () {
      expect(starTapRating(2, 0.1, 6), 6.0);
      expect(starTapRating(2, 0.2, 11), 5.0);
      expect(starTapRating(2, 0.8, 11), 6.0);
      expect(starTapRating(2, 0.1, 21), 4.5);
      expect(starTapRating(2, 0.35, 21), 5.0);
      expect(starTapRating(2, 0.6, 21), 5.5);
      expect(starTapRating(2, 0.9, 21), 6.0);
    });

    test('formatPersonalStarActionLabel reflects interval granularity', () {
      expect(formatPersonalStarActionLabel(8.5, 6, '0 / 5'), '★★★★');
      expect(formatPersonalStarActionLabel(9.0, 11, '0 / 5'), '★★★★½');
      expect(formatPersonalStarActionLabel(8.5, 21, '0 / 5'), '★★★★¼');
      expect(formatPersonalStarActionLabel(9.5, 21, '0 / 5'), '★★★★¾');
      expect(formatPersonalStarActionLabel(0.0, 11, '0 / 5'), '0 / 5');
    });
  });
}
