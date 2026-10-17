import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/overview_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('legacy hideMediaDescription parameter', () {
    test('a film and an episode give the story away, so they are held back', () {
      for (final type in ['Movie', 'Episode']) {
        expect(
          hidesMediaDescription(itemType: type, hideMediaDescription: true),
          isTrue,
          reason: '$type should be hidden',
        );
      }
    });

    test('a series or a season keeps its description', () {
      for (final type in ['Series', 'Season', 'BoxSet', 'Person']) {
        expect(
          hidesMediaDescription(itemType: type, hideMediaDescription: true),
          isFalse,
          reason: '$type is not an episode specific spoiler',
        );
      }
    });

    test('nothing is held back while the setting is off', () {
      for (final type in ['Movie', 'Episode', 'Series']) {
        expect(
          hidesMediaDescription(itemType: type, hideMediaDescription: false),
          isFalse,
        );
      }
    });

    test('an unknown or missing type keeps its description', () {
      expect(
        hidesMediaDescription(itemType: null, hideMediaDescription: true),
        isFalse,
      );
      expect(
        hidesMediaDescription(itemType: '', hideMediaDescription: true),
        isFalse,
      );
    });
  });

  group('UserPreferences granular media description settings', () {
    late UserPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues(const <String, Object>{});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
    });

    test('local content items are hidden when their specific setting is on', () async {
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Season', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Book', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Person', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'MusicAlbum', prefs: prefs), isFalse);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionMovie, true);
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isFalse);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionShow, true);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Show', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Tv', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeason, true);
      expect(hidesMediaDescription(itemType: 'Season', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionEpisode, true);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionBoxSet, true);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Collection', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionBook, true);
      expect(hidesMediaDescription(itemType: 'Book', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'AudioBook', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionPerson, true);
      expect(hidesMediaDescription(itemType: 'Person', prefs: prefs), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionMusic, true);
      expect(hidesMediaDescription(itemType: 'MusicAlbum', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'MusicArtist', prefs: prefs), isTrue);
    });

    test('seerr content items respect seerr specific settings', () async {
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs, isSeerr: true), isFalse);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs, isSeerr: true), isFalse);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs, isSeerr: true), isFalse);
      expect(hidesMediaDescription(itemType: 'Person', prefs: prefs, isSeerr: true), isFalse);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeerrMovie, true);
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs, isSeerr: true), isTrue);
      // Local movie is still false
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs, isSeerr: false), isFalse);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeerrShow, true);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs, isSeerr: true), isTrue);
      expect(hidesMediaDescription(itemType: 'Show', prefs: prefs, isSeerr: true), isTrue);
      expect(hidesMediaDescription(itemType: 'Tv', prefs: prefs, isSeerr: true), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeerrCollection, true);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs, isSeerr: true), isTrue);
      expect(hidesMediaDescription(itemType: 'Collection', prefs: prefs, isSeerr: true), isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionPerson, true);
      expect(hidesMediaDescription(itemType: 'Person', prefs: prefs, isSeerr: true), isTrue);
    });

    test('legacy hideDetailsMediaDescription preference acts as fallback for Movie and Episode', () async {
      await prefs.set(UserPreferences.hideDetailsMediaDescription, true);
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isFalse);
      expect(prefs.effectiveHideDetailsMediaDescription, isTrue);
    });

    test('Kids Mode forces all media descriptions to be hidden', () async {
      await prefs.set(UserPreferences.kidsModeEnabled, true);
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Season', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Person', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs, isSeerr: true), isTrue);
      expect(prefs.effectiveHideDetailsMediaDescription, isTrue);
    });
  });
}
