import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';

void main() {
  group('the TMDB home sections', () {
    // A new tmdb* section missing from the map fails here.
    test('every tmdb section in the enum has a preference', () {
      final inEnum = HomeSectionType.values
          .where((type) => type.name.startsWith('tmdb'))
          .toSet();
      final mapped = UserPreferences.tmdbSectionEnabled.keys.toSet();

      expect(inEnum.difference(mapped), isEmpty,
          reason: 'tmdb sections with no preference');
      expect(mapped.difference(inEnum), isEmpty,
          reason: 'preferences for sections that are not tmdb');
    });

    test('each section maps to its own preference', () {
      final keys = UserPreferences.tmdbSectionEnabled.values
          .map((pref) => pref.key)
          .toList();
      expect(keys.toSet(), hasLength(keys.length));
    });

    test('a preference key names the section it belongs to', () {
      UserPreferences.tmdbSectionEnabled.forEach((type, pref) {
        expect(pref.key, startsWith('tmdb_'), reason: type.name);
        expect(pref.key, endsWith('_enabled'), reason: type.name);
      });
    });

    test('isTmdbSectionType answers for the whole enum', () {
      for (final type in HomeSectionType.values) {
        expect(
          UserPreferences.isTmdbSectionType(type),
          type.name.startsWith('tmdb'),
          reason: type.name,
        );
      }
    });
  });
}
