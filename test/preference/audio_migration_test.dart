import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/injection.dart'
    show migrateAudioPassthroughMode, migrateAudioPreferenceSplit;
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<PreferenceStore> _store([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return store;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const legacyAudioBehaviorKey = 'audio_behavior';
  const legacyAudioBehaviorDownmixValue = 'downmixToStereo';
  const legacyAc3EnabledKey = 'pref_bitstream_ac3';
  const legacyDtsEnabledKey = 'pref_bitstream_dts';
  const legacyTrueHdEnabledKey = 'pref_bitstream_truncated_hd';
  const legacyAudioFallbackToStereoAacKey = 'audio_fallback_to_stereo_aac';

  const oldPresetKey = 'pref_audio_passthrough_preset';
  const oldOutputModeKey = 'audio_output_mode';

  group('audio preference split migration', () {
    test(
      'carries only explicitly-enabled legacy codecs onto base toggles',
      () async {
        final store = await _store(<String, Object>{
          legacyAc3EnabledKey: false,
          legacyDtsEnabledKey: true,
          legacyTrueHdEnabledKey: false,
        });

        await migrateAudioPreferenceSplit(store);

        expect(
          store.containsKey(UserPreferences.ac3PassthroughEnabled.key),
          isFalse,
        );
        expect(
          store.containsKey(UserPreferences.trueHdPassthroughEnabled.key),
          isFalse,
        );
        expect(
          store.getBool(UserPreferences.dtsCorePassthroughEnabled.key),
          isTrue,
        );
        expect(
          store.getBool(UserPreferences.dtsHdPassthroughEnabled.key),
          isTrue,
        );
        // Carried-over hand-set toggles land the user in manual mode.
        expect(
          store.getString(UserPreferences.audioPassthroughMode.key),
          AudioPassthroughMode.manual.name,
        );
        expect(store.getBool('pref_audio_preference_split_v3'), isTrue);
      },
    );

    test(
      'legacy downmix maps to disabled mode plus the downmix pref',
      () async {
        final store = await _store(<String, Object>{
          legacyAudioBehaviorKey: legacyAudioBehaviorDownmixValue,
          legacyAudioFallbackToStereoAacKey: true,
        });

        await migrateAudioPreferenceSplit(store);

        expect(store.getBool(UserPreferences.downmixToStereo.key), isTrue);
        expect(
          store.getString(UserPreferences.audioPassthroughMode.key),
          AudioPassthroughMode.disabled.name,
        );
        expect(
          store.getString(UserPreferences.audioFallbackCodec.key),
          AudioFallbackCodec.aac.name,
        );
      },
    );

    test('does not overwrite split values when already present', () async {
      final store = await _store(<String, Object>{
        legacyAc3EnabledKey: false,
        UserPreferences.ac3PassthroughEnabled.key: true,
      });

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
        final store = await _store(<String, Object>{
          UserPreferences.audioFallbackCodec.key: entry.key,
        });

        await migrateAudioPreferenceSplit(store);

        expect(
          store.getString(UserPreferences.audioFallbackCodec.key),
          entry.value,
        );
      }
    });

    test('keeps fresh installs on default values', () async {
      final store = await _store();

      await migrateAudioPreferenceSplit(store);

      expect(
        store.containsKey(UserPreferences.audioPassthroughMode.key),
        isFalse,
      );
      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(store.containsKey(pref.key), isFalse, reason: pref.key);
      }
      expect(store.getBool('pref_audio_preference_split_v3'), isTrue);
    });
  });

  group('audio passthrough mode migration', () {
    test('fresh install stays on defaults (auto, no downmix)', () async {
      final store = await _store();

      await migrateAudioPassthroughMode(store);

      expect(
        store.containsKey(UserPreferences.audioPassthroughMode.key),
        isFalse,
      );
      expect(store.containsKey(UserPreferences.downmixToStereo.key), isFalse);
      expect(store.getBool(UserPreferences.audioModeMigrated.key), isTrue);
    });

    test('stereo preset maps to disabled mode with downmix on', () async {
      final store = await _store(<String, Object>{oldPresetKey: 'stereo'});

      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.disabled.name,
      );
      expect(store.getBool(UserPreferences.downmixToStereo.key), isTrue);
    });

    test('forceStereo output mode maps like the stereo preset', () async {
      final store = await _store(<String, Object>{
        oldOutputModeKey: 'forceStereo',
        oldPresetKey: 'advanced',
      });

      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.disabled.name,
      );
      expect(store.getBool(UserPreferences.downmixToStereo.key), isTrue);
    });

    test('advanced preset maps to manual and keeps base toggles', () async {
      final store = await _store(<String, Object>{
        oldPresetKey: 'advanced',
        UserPreferences.ac3PassthroughEnabled.key: true,
        UserPreferences.trueHdPassthroughEnabled.key: false,
        'pref_passthrough_truehd_atmos': true,
      });

      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.manual.name,
      );
      expect(store.getBool(UserPreferences.ac3PassthroughEnabled.key), isTrue);
      // A variant-only ON was a no-op under the old AND-hierarchy, so the
      // retired key is left behind without promoting the base toggle.
      expect(
        store.getBool(UserPreferences.trueHdPassthroughEnabled.key),
        isFalse,
      );
    });

    test('auto preset with a hand-set toggle maps to manual', () async {
      final store = await _store(<String, Object>{
        oldPresetKey: 'auto',
        UserPreferences.eac3PassthroughEnabled.key: false,
      });

      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.manual.name,
      );
      expect(
        store.getBool(UserPreferences.eac3PassthroughEnabled.key),
        isFalse,
      );
    });

    test('surroundReceiver with no toggles maps to auto', () async {
      final store = await _store(<String, Object>{
        oldPresetKey: 'surroundReceiver',
        oldOutputModeKey: 'avrPassthrough',
      });

      await migrateAudioPassthroughMode(store);

      // Auto is the default, so nothing needs writing.
      expect(
        store.containsKey(UserPreferences.audioPassthroughMode.key),
        isFalse,
      );
      expect(store.containsKey(UserPreferences.downmixToStereo.key), isFalse);
    });

    test('runs once', () async {
      final store = await _store(<String, Object>{oldPresetKey: 'stereo'});

      await migrateAudioPassthroughMode(store);
      await store.setString(
        UserPreferences.audioPassthroughMode.key,
        AudioPassthroughMode.auto.name,
      );
      await store.setBool(UserPreferences.downmixToStereo.key, false);
      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.auto.name,
      );
      expect(store.getBool(UserPreferences.downmixToStereo.key), isFalse);
    });

    test('never clobbers an already-written new value', () async {
      final store = await _store(<String, Object>{
        oldPresetKey: 'stereo',
        UserPreferences.audioPassthroughMode.key:
            AudioPassthroughMode.auto.name,
      });

      await migrateAudioPassthroughMode(store);

      expect(
        store.getString(UserPreferences.audioPassthroughMode.key),
        AudioPassthroughMode.auto.name,
      );
    });
  });
}
