import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';

ImageType defaultFor(HomeSectionType type) =>
    UserPreferences.homeRowImageType(type).defaultValue;

void main() {
  group('home row image type defaults', () {
    test('the rows that carry playback progress start on posters', () {
      // The merged row keeps the resume row's identity, so it reads this one
      // too rather than a default of its own.
      expect(defaultFor(HomeSectionType.resume), ImageType.poster);
      expect(defaultFor(HomeSectionType.nextUp), ImageType.poster);
    });

    test('my media keeps its thumbnails', () {
      expect(defaultFor(HomeSectionType.libraryTilesSmall), ImageType.thumb);
    });

    test('every other section starts on posters', () {
      final others = HomeSectionType.values.where(
        (type) =>
            type != HomeSectionType.libraryTilesSmall &&
            type != HomeSectionType.none,
      );
      for (final type in others) {
        expect(defaultFor(type), ImageType.poster, reason: type.name);
      }
    });
  });
}
