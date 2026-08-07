import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

AudioCapabilityProfile _profile({
  bool canPassthroughAc3 = false,
  bool canPassthroughEac3 = false,
  bool canPassthroughDts = false,
  bool canPassthroughDtsHd = false,
  bool canPassthroughTrueHd = false,
  int maxPcmChannels = 8,
  AudioRouteType activeRouteType = AudioRouteType.earc,
  bool routeSupportsHdAudio = true,
}) {
  return AudioCapabilityProfile(
    canDecodeAc3: true,
    canDecodeEac3: true,
    canDecodeDts: true,
    canDecodeDtsHd: true,
    canDecodeTrueHd: true,
    canDecodeFlac: true,
    canPassthroughAc3: canPassthroughAc3,
    canPassthroughEac3: canPassthroughEac3,
    canPassthroughDts: canPassthroughDts,
    canPassthroughDtsHd: canPassthroughDtsHd,
    canPassthroughTrueHd: canPassthroughTrueHd,
    maxPcmChannels: maxPcmChannels,
    activeRouteType: activeRouteType,
    routeSupportsHdAudio: routeSupportsHdAudio,
  );
}

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('mode-aware passthrough resolvers', () {
    test('auto follows the detected capability', () async {
      final prefs = await _prefs();
      final capable = _profile(
        canPassthroughAc3: true,
        canPassthroughEac3: true,
        canPassthroughTrueHd: true,
      );

      expect(prefs.resolveAc3PassthroughEnabled(capable), isTrue);
      expect(prefs.resolveEac3PassthroughEnabled(capable), isTrue);
      expect(prefs.resolveTrueHdPassthroughEnabled(capable), isTrue);
      // Capability says no, so auto resolves false.
      expect(prefs.resolveDtsCorePassthroughEnabled(capable), isFalse);
    });

    test(
      'disabled resolves everything false regardless of capability',
      () async {
        final prefs = await _prefs();
        await prefs.set(
          UserPreferences.audioPassthroughMode,
          AudioPassthroughMode.disabled,
        );
        final capable = _profile(
          canPassthroughAc3: true,
          canPassthroughEac3: true,
          canPassthroughDts: true,
          canPassthroughDtsHd: true,
          canPassthroughTrueHd: true,
        );

        expect(prefs.resolveAc3PassthroughEnabled(capable), isFalse);
        expect(prefs.resolveEac3PassthroughEnabled(capable), isFalse);
        expect(prefs.resolveDtsCorePassthroughEnabled(capable), isFalse);
        expect(prefs.resolveDtsHdPassthroughEnabled(capable), isFalse);
        expect(prefs.resolveTrueHdPassthroughEnabled(capable), isFalse);
        expect(prefs.resolvedPassthroughCodecs(capable), isEmpty);
      },
    );

    test('manual follows the stored toggles, not the capability', () async {
      final prefs = await _prefs();
      await prefs.set(
        UserPreferences.audioPassthroughMode,
        AudioPassthroughMode.manual,
      );
      await prefs.set(UserPreferences.trueHdPassthroughEnabled, true);
      await prefs.set(UserPreferences.ac3PassthroughEnabled, false);
      final incapable = _profile();

      expect(prefs.resolveTrueHdPassthroughEnabled(incapable), isTrue);
      expect(prefs.resolveAc3PassthroughEnabled(incapable), isFalse);
    });

    test('manual DTS-HD requires the DTS core toggle too', () async {
      final prefs = await _prefs();
      await prefs.set(
        UserPreferences.audioPassthroughMode,
        AudioPassthroughMode.manual,
      );
      await prefs.set(UserPreferences.dtsCorePassthroughEnabled, false);
      await prefs.set(UserPreferences.dtsHdPassthroughEnabled, true);

      expect(prefs.resolveDtsHdPassthroughEnabled(_profile()), isFalse);

      await prefs.set(UserPreferences.dtsCorePassthroughEnabled, true);
      expect(prefs.resolveDtsHdPassthroughEnabled(_profile()), isTrue);
    });

    test('resolvedPassthroughCodecs maps to wire names', () async {
      final prefs = await _prefs();
      await prefs.set(
        UserPreferences.audioPassthroughMode,
        AudioPassthroughMode.manual,
      );
      await prefs.set(UserPreferences.eac3PassthroughEnabled, true);
      await prefs.set(UserPreferences.dtsCorePassthroughEnabled, true);
      await prefs.set(UserPreferences.dtsHdPassthroughEnabled, true);

      final codecs = prefs
          .resolvedPassthroughCodecs(_profile())
          .map((codec) => codec.wireName)
          .toSet();
      expect(codecs, equals(<String>{'eac3', 'dts', 'dtshd'}));
    });
  });

  group('ARC excludes lossless/HD passthrough', () {
    Map<String, dynamic> rawCaps(String route) => <String, dynamic>{
      'activeRouteType': route,
      'canPassthroughAc3': true,
      'canPassthroughEac3': true,
      'canPassthroughDts': true,
      'canPassthroughDtsHd': true,
      'canPassthroughTrueHd': true,
      'maxPcmChannels': 8,
    };

    test('ARC strips TrueHD and DTS-HD', () {
      final p = AudioCapabilityProfile.fromMap(rawCaps('arc'));
      expect(p.canPassthroughTrueHd, isFalse);
      expect(p.canPassthroughDtsHd, isFalse);
      // ARC-legal compressed formats are preserved.
      expect(p.canPassthroughAc3, isTrue);
      expect(p.canPassthroughEac3, isTrue);
      expect(p.canPassthroughDts, isTrue);
    });

    test('eARC keeps the HD/lossless capabilities', () {
      final p = AudioCapabilityProfile.fromMap(rawCaps('earc'));
      expect(p.canPassthroughTrueHd, isTrue);
      expect(p.canPassthroughDtsHd, isTrue);
    });

    test('plain HDMI keeps the HD/lossless capabilities', () {
      final p = AudioCapabilityProfile.fromMap(rawCaps('hdmi'));
      expect(p.canPassthroughTrueHd, isTrue);
      expect(p.canPassthroughDtsHd, isTrue);
    });

    test('ARC + auto resolver does not advertise TrueHD/DTS-HD', () async {
      final prefs = await _prefs();
      final arc = AudioCapabilityProfile.fromMap(rawCaps('arc'));
      expect(prefs.resolveTrueHdPassthroughEnabled(arc), isFalse);
      expect(prefs.resolveDtsHdPassthroughEnabled(arc), isFalse);
      // But ARC-legal ones still auto-enable.
      expect(prefs.resolveAc3PassthroughEnabled(arc), isTrue);
      expect(prefs.resolveEac3PassthroughEnabled(arc), isTrue);
    });
  });

  group('setAudioPassthroughMode', () {
    test('entering manual seeds absent toggles from detection', () async {
      final prefs = await _prefs();

      await prefs.setAudioPassthroughMode(AudioPassthroughMode.manual);

      expect(
        prefs.get(UserPreferences.audioPassthroughMode),
        AudioPassthroughMode.manual,
      );
      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(prefs.containsPreference(pref), isTrue, reason: pref.key);
      }
    });

    test('entering manual never overwrites an existing toggle value', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.ac3PassthroughEnabled, true);

      await prefs.setAudioPassthroughMode(AudioPassthroughMode.manual);

      expect(prefs.get(UserPreferences.ac3PassthroughEnabled), isTrue);
    });

    test('seedAbsentPassthroughToggles is idempotent', () async {
      final prefs = await _prefs();
      await prefs.setAudioPassthroughMode(AudioPassthroughMode.manual);
      await prefs.set(UserPreferences.trueHdPassthroughEnabled, true);

      await prefs.seedAbsentPassthroughToggles();

      expect(prefs.get(UserPreferences.trueHdPassthroughEnabled), isTrue);
    });

    test('clearPassthroughOverrides removes all five toggles', () async {
      final prefs = await _prefs();
      await prefs.setAudioPassthroughMode(AudioPassthroughMode.manual);

      await prefs.clearPassthroughOverrides();

      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(prefs.containsPreference(pref), isFalse, reason: pref.key);
      }
    });
  });
}
