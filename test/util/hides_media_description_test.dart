import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/overview_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('hidesMediaDescription (legacy boolean)', () {
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

    test('Seerr items are never hidden', () {
      for (final type in ['Movie', 'Episode']) {
        expect(
          hidesMediaDescription(
            itemType: type,
            hideMediaDescription: true,
            isSeerr: true,
          ),
          isFalse,
        );
      }
    });
  });

  group('hidesMediaDescription (granular preferences)', () {
    Future<UserPreferences> makePrefs() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      return UserPreferences(store);
    }

    test('hides each video type independently', () async {
      final prefs = await makePrefs();
      final cases = <(Preference<bool>, List<String>)>[
        (UserPreferences.hideDetailsMediaDescriptionMovie, ['Movie']),
        (UserPreferences.hideDetailsMediaDescriptionShow, ['Series']),
        (UserPreferences.hideDetailsMediaDescriptionSeason, ['Season']),
        (UserPreferences.hideDetailsMediaDescriptionEpisode, ['Episode']),
        (UserPreferences.hideDetailsMediaDescriptionBoxSet, ['BoxSet']),
      ];

      for (final (pref, matchingTypes) in cases) {
        await prefs.set(pref, true);
        for (final type in matchingTypes) {
          expect(
            hidesMediaDescription(itemType: type, prefs: prefs),
            isTrue,
            reason: '$type should be hidden when ${pref.key} is true',
          );
        }
        for (final (otherPref, otherTypes) in cases) {
          if (otherPref == pref) continue;
          for (final type in otherTypes) {
            expect(
              hidesMediaDescription(itemType: type, prefs: prefs),
              isFalse,
              reason: '$type should remain visible when only ${pref.key} is true',
            );
          }
        }
        await prefs.set(pref, false);
      }
    });

    test('legacy hideDetailsMediaDescription still hides Movie and Episode', () async {
      final prefs = await makePrefs();
      await prefs.set(UserPreferences.hideDetailsMediaDescription, true);

      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isTrue);
      expect(hidesMediaDescription(itemType: 'Series', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Season', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'BoxSet', prefs: prefs), isFalse);
    });

    test('explicit false overrides legacy hideDetailsMediaDescription', () async {
      final prefs = await makePrefs();
      await prefs.set(UserPreferences.hideDetailsMediaDescription, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionMovie, false);

      expect(hidesMediaDescription(itemType: 'Movie', prefs: prefs), isFalse);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isTrue);
      expect(prefs.effectiveHideDetailsMediaDescription, isTrue);

      await prefs.set(UserPreferences.hideDetailsMediaDescriptionEpisode, false);
      expect(hidesMediaDescription(itemType: 'Episode', prefs: prefs), isFalse);
      expect(prefs.effectiveHideDetailsMediaDescription, isFalse);
    });

    test('Seerr pages stay visible even when all hide toggles are enabled', () async {
      final prefs = await makePrefs();
      await prefs.set(UserPreferences.hideDetailsMediaDescription, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionMovie, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionShow, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeason, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionEpisode, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionBoxSet, true);

      for (final type in [
        'Movie',
        'Series',
        'Season',
        'Episode',
        'BoxSet',
        'Person',
      ]) {
        expect(
          hidesMediaDescription(itemType: type, prefs: prefs, isSeerr: true),
          isFalse,
          reason: 'Seerr $type should never be hidden',
        );
      }
    });

    test('non-video types stay visible when all hide toggles are enabled', () async {
      final prefs = await makePrefs();
      await prefs.set(UserPreferences.hideDetailsMediaDescription, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionMovie, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionShow, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionSeason, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionEpisode, true);
      await prefs.set(UserPreferences.hideDetailsMediaDescriptionBoxSet, true);

      for (final type in [
        'Book',
        'AudioBook',
        'Person',
        'MusicAlbum',
        'MusicArtist',
        'Audio',
        'Playlist',
      ]) {
        expect(
          hidesMediaDescription(itemType: type, prefs: prefs),
          isFalse,
          reason: 'Non-video $type should remain visible',
        );
      }
    });

    test('Kids Mode hides every video page, Seerr included, but no others',
        () async {
      final prefs = await makePrefs();
      await prefs.set(UserPreferences.kidsModeEnabled, true);

      for (final type in ['Movie', 'Series', 'Season', 'Episode', 'BoxSet']) {
        expect(hidesMediaDescription(itemType: type, prefs: prefs), isTrue);
        expect(
          hidesMediaDescription(itemType: type, prefs: prefs, isSeerr: true),
          isTrue,
        );
      }
      for (final type in ['Book', 'Person', 'MusicAlbum']) {
        expect(hidesMediaDescription(itemType: type, prefs: prefs), isFalse);
      }
    });
  });
}
