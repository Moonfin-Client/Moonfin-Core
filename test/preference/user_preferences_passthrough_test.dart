import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/playback/device_profile_builder.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

AudioCapabilityProfile _profile({
  bool canPassthroughAc3 = false,
  bool canPassthroughEac3 = false,
  bool canPassthroughEac3Joc = false,
  bool canPassthroughDts = false,
  bool canPassthroughDtsHd = false,
  bool canPassthroughDtsX = false,
  bool canPassthroughTrueHd = false,
  bool canPassthroughTrueHdJoc = false,
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
    canPassthroughEac3Joc: canPassthroughEac3Joc,
    canPassthroughDts: canPassthroughDts,
    canPassthroughDtsHd: canPassthroughDtsHd,
    canPassthroughDtsX: canPassthroughDtsX,
    canPassthroughTrueHd: canPassthroughTrueHd,
    canPassthroughTrueHdJoc: canPassthroughTrueHdJoc,
    maxPcmChannels: maxPcmChannels,
    activeRouteType: activeRouteType,
    routeSupportsHdAudio: routeSupportsHdAudio,
  );
}

Set<String> _videoDirectPlayAudioCodecs(Map<String, dynamic> profile) {
  final directPlayProfiles =
      profile['DirectPlayProfiles'] as List<dynamic>? ?? const [];
  for (final rawProfile in directPlayProfiles) {
    final directPlay = rawProfile as Map<dynamic, dynamic>;
    if (directPlay['Type'] != 'Video') continue;
    return (directPlay['AudioCodec']?.toString() ?? '')
        .split(',')
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toSet();
  }
  return <String>{};
}

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Part 1: tri-state passthrough resolvers', () {
    test('unset toggle follows the detected capability (auto)', () async {
      final prefs = await _prefs();
      final capable = _profile(
        canPassthroughAc3: true,
        canPassthroughEac3: true,
        canPassthroughTrueHd: true,
      );

      expect(prefs.resolveAc3PassthroughEnabled(capable), isTrue);
      expect(prefs.resolveEac3PassthroughEnabled(capable), isTrue);
      expect(prefs.resolveTrueHdPassthroughEnabled(capable), isTrue);
      // Capability says no, so it resolves false when unset.
      expect(prefs.resolveDtsXPassthroughEnabled(capable), isFalse);
    });

    test('explicit OFF wins over a capable profile', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.trueHdPassthroughEnabled, false);
      final capable = _profile(canPassthroughTrueHd: true);

      expect(prefs.resolveTrueHdPassthroughEnabled(capable), isFalse);
    });

    test('explicit ON wins over an incapable profile', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.dtsXPassthroughEnabled, true);
      final incapable = _profile(); // all passthrough false

      expect(prefs.resolveDtsXPassthroughEnabled(incapable), isTrue);
    });

    test('clearing an override returns to auto (follow capability)', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.ac3PassthroughEnabled, false);
      final capable = _profile(canPassthroughAc3: true);
      expect(prefs.resolveAc3PassthroughEnabled(capable), isFalse);

      await prefs.removePreference(UserPreferences.ac3PassthroughEnabled);
      expect(
        prefs.containsPreference(UserPreferences.ac3PassthroughEnabled),
        isFalse,
      );
      expect(prefs.resolveAc3PassthroughEnabled(capable), isTrue);
    });
  });

  group('Part 6: ARC excludes lossless/HD passthrough', () {
    Map<String, dynamic> rawCaps(String route) => <String, dynamic>{
      'activeRouteType': route,
      'canPassthroughAc3': true,
      'canPassthroughEac3': true,
      'canPassthroughEac3Joc': true,
      'canPassthroughDts': true,
      'canPassthroughDtsHd': true,
      'canPassthroughDtsX': true,
      'canPassthroughTrueHd': true,
      'canPassthroughTrueHdJoc': true,
      'maxPcmChannels': 8,
    };

    test('ARC strips TrueHD / TrueHD-Atmos / DTS-HD / DTS:X', () {
      final p = AudioCapabilityProfile.fromMap(rawCaps('arc'));
      expect(p.canPassthroughTrueHd, isFalse);
      expect(p.canPassthroughTrueHdJoc, isFalse);
      expect(p.canPassthroughDtsHd, isFalse);
      expect(p.canPassthroughDtsX, isFalse);
      // ARC-legal compressed formats are preserved.
      expect(p.canPassthroughAc3, isTrue);
      expect(p.canPassthroughEac3, isTrue);
      expect(p.canPassthroughEac3Joc, isTrue);
      expect(p.canPassthroughDts, isTrue);
    });

    test('eARC keeps the HD/lossless capabilities', () {
      final p = AudioCapabilityProfile.fromMap(rawCaps('earc'));
      expect(p.canPassthroughTrueHd, isTrue);
      expect(p.canPassthroughDtsHd, isTrue);
      expect(p.canPassthroughDtsX, isTrue);
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

  group('Part 7: EAC3-JOC and TrueHD passthrough are independent', () {
    Set<String> codecsFor({
      required bool eac3,
      required bool eac3Joc,
      required bool trueHd,
      required bool trueHdAtmos,
    }) {
      final profile = DeviceProfileBuilder.build(
        audioOutputMode: AudioOutputMode.avrPassthrough,
        audioCapabilityProfile: _profile(activeRouteType: AudioRouteType.earc),
        eac3PassthroughEnabled: eac3,
        eac3JocPassthroughEnabled: eac3Joc,
        trueHdPassthroughEnabled: trueHd,
        trueHdAtmosPassthroughEnabled: trueHdAtmos,
      );
      return _videoDirectPlayAudioCodecs(profile);
    }

    test('EAC3(+JOC) on, TrueHD off keeps eac3 and drops truehd', () {
      final codecs = codecsFor(
        eac3: true,
        eac3Joc: true,
        trueHd: false,
        trueHdAtmos: false,
      );
      expect(codecs, contains('eac3'));
      expect(codecs, isNot(contains('truehd')));
    });

    test('TrueHD(+Atmos) on, EAC3 off keeps truehd and drops eac3', () {
      final codecs = codecsFor(
        eac3: false,
        eac3Joc: false,
        trueHd: true,
        trueHdAtmos: true,
      );
      expect(codecs, contains('truehd'));
      expect(codecs, isNot(contains('eac3')));
    });
  });

  group('applyAudioPassthroughPreset', () {
    test('auto resets channels to 0 and clears overrides', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.maxAudioChannels, 2);
      await prefs.set(UserPreferences.trueHdPassthroughEnabled, true);

      await prefs.applyAudioPassthroughPreset(AudioPassthroughPreset.auto);

      expect(prefs.get(UserPreferences.audioOutputMode), AudioOutputMode.auto);
      expect(prefs.get(UserPreferences.maxAudioChannels), 0);
      expect(
        prefs.containsPreference(UserPreferences.trueHdPassthroughEnabled),
        isFalse,
      );
    });

    test('surroundReceiver sets avrPassthrough and resets channels', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.maxAudioChannels, 2);

      await prefs.applyAudioPassthroughPreset(
        AudioPassthroughPreset.surroundReceiver,
      );

      expect(
        prefs.get(UserPreferences.audioOutputMode),
        AudioOutputMode.avrPassthrough,
      );
      expect(prefs.get(UserPreferences.maxAudioChannels), 0);
    });

    test('stereo forces stereo and leaves channels untouched', () async {
      final prefs = await _prefs();
      await prefs.set(UserPreferences.maxAudioChannels, 6);

      await prefs.applyAudioPassthroughPreset(AudioPassthroughPreset.stereo);

      expect(
        prefs.get(UserPreferences.audioOutputMode),
        AudioOutputMode.forceStereo,
      );
      expect(prefs.get(UserPreferences.maxAudioChannels), 6);
    });

    test('advanced materializes effective values into explicit toggles', () async {
      final prefs = await _prefs();

      await prefs.applyAudioPassthroughPreset(AudioPassthroughPreset.advanced);

      for (final pref in UserPreferences.passthroughTogglePreferences) {
        expect(prefs.containsPreference(pref), isTrue, reason: pref.key);
      }
      expect(
        prefs.get(UserPreferences.audioPassthroughPreset),
        AudioPassthroughPreset.advanced,
      );
    });
  });
}
