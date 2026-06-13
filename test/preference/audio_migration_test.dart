import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/injection.dart' show migrateAudioPreferenceSplit;
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const legacyAudioBehaviorKey = 'audio_behavior';
  const legacyAudioBehaviorDownmixValue = 'downmixToStereo';
  const legacyAc3EnabledKey = 'pref_bitstream_ac3';
  const legacyDtsEnabledKey = 'pref_bitstream_dts';
  const legacyTrueHdEnabledKey = 'pref_bitstream_truncated_hd';
  const legacyAudioFallbackToStereoAacKey = 'audio_fallback_to_stereo_aac';

  group('audio preference split migration', () {
    test('auto-first: carries only explicitly-enabled legacy codecs', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        legacyAudioBehaviorKey: legacyAudioBehaviorDownmixValue,
        legacyAc3EnabledKey: false,
        legacyDtsEnabledKey: true,
        legacyTrueHdEnabledKey: false,
        legacyAudioFallbackToStereoAacKey: true,
      });

      final store = PreferenceStore();
      await store.init();

      await migrateAudioPreferenceSplit(store);

      expect(
        store.getString(UserPreferences.audioOutputMode.key),
        AudioOutputMode.forceStereo.name,
      );
      expect(
        store.containsKey(UserPreferences.ac3PassthroughEnabled.key),
        isFalse,
      );
      expect(
        store.containsKey(UserPreferences.eac3PassthroughEnabled.key),
        isFalse,
      );
      expect(
        store.containsKey(UserPreferences.trueHdPassthroughEnabled.key),
        isFalse,
      );
      expect(
        store.containsKey(UserPreferences.trueHdAtmosPassthroughEnabled.key),
        isFalse,
      );
      // DTS was on, so its group is carried over and the user lands in Advanced.
      expect(store.getBool(UserPreferences.dtsCorePassthroughEnabled.key), isTrue);
      expect(store.getBool(UserPreferences.dtsHdPassthroughEnabled.key), isTrue);
      expect(store.getBool(UserPreferences.dtsXPassthroughEnabled.key), isTrue);
      expect(
        store.getString(UserPreferences.audioPassthroughPreset.key),
        AudioPassthroughPreset.advanced.name,
      );
      expect(
        store.getString(UserPreferences.audioFallbackCodec.key),
        AudioFallbackCodec.aac.name,
      );
      expect(store.getBool('pref_audio_preference_split_v3'), isTrue);
    });

    test('pure downmix user maps to the Stereo preset', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        legacyAudioBehaviorKey: legacyAudioBehaviorDownmixValue,
        legacyAc3EnabledKey: false,
        legacyDtsEnabledKey: false,
        legacyTrueHdEnabledKey: false,
      });

      final store = PreferenceStore();
      await store.init();

      await migrateAudioPreferenceSplit(store);

      expect(
        store.getString(UserPreferences.audioPassthroughPreset.key),
        AudioPassthroughPreset.stereo.name,
      );
      expect(
        store.getString(UserPreferences.audioOutputMode.key),
        AudioOutputMode.forceStereo.name,
      );
      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(store.containsKey(pref.key), isFalse, reason: pref.key);
      }
    });

    test('does not overwrite split values when already present', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        legacyAc3EnabledKey: false,
        UserPreferences.ac3PassthroughEnabled.key: true,
      });

      final store = PreferenceStore();
      await store.init();

      await migrateAudioPreferenceSplit(store);

      expect(store.getBool(UserPreferences.ac3PassthroughEnabled.key), isTrue);
    });

    test('remaps legacy fallback codecs to their renamed versions', () async {
      final codecsToTest = {
        'aacStereo': 'aac',
        'ac3_5_1': 'ac3',
        'eac3_5_1': 'eac3',
      };

      for (final entry in codecsToTest.entries) {
        SharedPreferences.setMockInitialValues(<String, Object>{
          UserPreferences.audioFallbackCodec.key: entry.key,
        });

        final store = PreferenceStore();
        await store.init();

        await migrateAudioPreferenceSplit(store);

        expect(
          store.getString(UserPreferences.audioFallbackCodec.key),
          entry.value,
        );
      }
    });

    test('keeps fresh installs on default split values', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});

      final store = PreferenceStore();
      await store.init();

      await migrateAudioPreferenceSplit(store);

      expect(store.containsKey(UserPreferences.audioOutputMode.key), isFalse);
      expect(
        store.containsKey(UserPreferences.audioPassthroughPreset.key),
        isFalse,
      );
      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(store.containsKey(pref.key), isFalse, reason: pref.key);
      }
      expect(store.getBool('pref_audio_preference_split_v3'), isTrue);
    });

    test('carries an explicitly-enabled codec into Advanced', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        legacyAc3EnabledKey: true,
      });

      final store = PreferenceStore();
      await store.init();

      await migrateAudioPreferenceSplit(store);

      expect(store.getBool(UserPreferences.ac3PassthroughEnabled.key), isTrue);
      expect(store.getBool(UserPreferences.eac3PassthroughEnabled.key), isTrue);
      expect(
        store.getString(UserPreferences.audioPassthroughPreset.key),
        AudioPassthroughPreset.advanced.name,
      );
    });
  });
}
