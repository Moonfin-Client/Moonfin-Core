import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Media3 audio decoder preferences payload', () {
    test('defaults to auto with no downmix', () async {
      final prefs = await _prefs();

      final payload = Media3PlayerBackend.audioDecoderPreferencesPayload(prefs);

      expect(payload['passthroughMode'], 'auto');
      expect(payload['downmixToStereo'], isFalse);
      expect(payload['passthroughCodecs'], isA<List<String>>());
    });

    test('disabled mode sends an empty codec list', () async {
      final prefs = await _prefs();
      await prefs.set(
        UserPreferences.audioPassthroughMode,
        AudioPassthroughMode.disabled,
      );

      final payload = Media3PlayerBackend.audioDecoderPreferencesPayload(prefs);

      expect(payload['passthroughMode'], 'disabled');
      expect(payload['passthroughCodecs'], isEmpty);
    });

    test(
      'manual mode sends exactly the wire names of enabled toggles',
      () async {
        final prefs = await _prefs();
        await prefs.set(
          UserPreferences.audioPassthroughMode,
          AudioPassthroughMode.manual,
        );
        await prefs.set(UserPreferences.ac3PassthroughEnabled, true);
        await prefs.set(UserPreferences.eac3PassthroughEnabled, true);
        await prefs.set(UserPreferences.dtsCorePassthroughEnabled, true);
        await prefs.set(UserPreferences.dtsHdPassthroughEnabled, true);
        await prefs.set(UserPreferences.trueHdPassthroughEnabled, true);

        final payload = Media3PlayerBackend.audioDecoderPreferencesPayload(
          prefs,
        );

        expect(
          (payload['passthroughCodecs'] as List<String>).toSet(),
          equals(<String>{'ac3', 'eac3', 'dts', 'dtshd', 'truehd'}),
        );
      },
    );

    test('manual DTS-HD stays out of the payload without DTS core', () async {
      final prefs = await _prefs();
      await prefs.set(
        UserPreferences.audioPassthroughMode,
        AudioPassthroughMode.manual,
      );
      await prefs.set(UserPreferences.dtsCorePassthroughEnabled, false);
      await prefs.set(UserPreferences.dtsHdPassthroughEnabled, true);

      final payload = Media3PlayerBackend.audioDecoderPreferencesPayload(prefs);

      expect(payload['passthroughCodecs'], isNot(contains('dtshd')));
      expect(payload['passthroughCodecs'], isNot(contains('dts')));
    });

    test('downmix preference is forwarded', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.downmixToStereo, true);

      final payload = Media3PlayerBackend.audioDecoderPreferencesPayload(prefs);

      expect(payload['downmixToStereo'], isTrue);
    });
  });

  group('Media3 DoVi compat mode', () {
    test(
      'disabled behavior turns the chain off regardless of hardware',
      () async {
        final prefs = await _prefs();
        await prefs.set(
          UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
          DolbyVisionProfile7DirectPlayBehavior.disabled,
        );

        expect(
          Media3PlayerBackend.doviCompatMode(
            prefs,
            supportsP7: true,
            supportsP8: true,
            displaySupportsDolbyVision: true,
          ),
          Media3DoviCompatMode.off,
        );
      },
    );

    test('a profile 7 decoder plays natively, untouched', () async {
      final prefs = await _prefs();

      expect(
        Media3PlayerBackend.doviCompatMode(
          prefs,
          supportsP7: true,
          supportsP8: true,
          displaySupportsDolbyVision: true,
        ),
        Media3DoviCompatMode.native,
      );
    });

    test('a profile 8 decoder with a DoVi display converts', () async {
      final prefs = await _prefs();

      expect(
        Media3PlayerBackend.doviCompatMode(
          prefs,
          supportsP7: false,
          supportsP8: true,
          displaySupportsDolbyVision: true,
        ),
        Media3DoviCompatMode.convert,
      );
    });

    test('no DoVi display strips to HDR10 even with a P8 decoder', () async {
      final prefs = await _prefs();

      expect(
        Media3PlayerBackend.doviCompatMode(
          prefs,
          supportsP7: false,
          supportsP8: true,
          displaySupportsDolbyVision: false,
        ),
        Media3DoviCompatMode.strip,
      );
    });

    test(
      'the strip pref forces strip over an available convert path',
      () async {
        final prefs = await _prefs();
        await prefs.set(
          UserPreferences.media3MapDolbyVisionProfile7ToHevc,
          true,
        );

        expect(
          Media3PlayerBackend.doviCompatMode(
            prefs,
            supportsP7: false,
            supportsP8: true,
            displaySupportsDolbyVision: true,
          ),
          Media3DoviCompatMode.strip,
        );
      },
    );

    test('wire names match the Kotlin enum values', () {
      expect(Media3DoviCompatMode.values.map((m) => m.name).toList(), [
        'native',
        'convert',
        'strip',
        'off',
      ]);
    });
  });

  group('Media3 direct play containers', () {
    test('drops the containers media3 has no demuxer for', () {
      final containers = media3DirectPlayVideoContainers.split(',');

      expect(containers, isNot(contains('asf')));
      expect(containers, isNot(contains('wmv')));
      expect(containers, isNot(contains('ogm')));
      expect(containers, isNot(contains('ogv')));
      expect(containers, contains('avi'));
      expect(containers, contains('flv'));
      expect(containers, contains('mkv'));
      expect(containers, contains('mp4'));
      expect(containers, contains('ts'));
    });
  });
}
