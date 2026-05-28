import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  group('MediaKitPlayerBackend passthrough codec synthesis', () {
    test('returns empty codecs for force stereo mode', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.forceStereo,
        ac3PassthroughEnabled: true,
        eac3PassthroughEnabled: true,
        eac3JocPassthroughEnabled: true,
        dtsCorePassthroughEnabled: true,
        dtsHdPassthroughEnabled: true,
        dtsXPassthroughEnabled: true,
        trueHdPassthroughEnabled: true,
        trueHdAtmosPassthroughEnabled: true,
      );

      expect(codecs, isEmpty);
    });

    test('maps enabled codec toggles to mpv passthrough codec names', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.avrPassthrough,
        ac3PassthroughEnabled: true,
        eac3PassthroughEnabled: true,
        eac3JocPassthroughEnabled: false,
        dtsCorePassthroughEnabled: true,
        dtsHdPassthroughEnabled: true,
        dtsXPassthroughEnabled: false,
        trueHdPassthroughEnabled: true,
        trueHdAtmosPassthroughEnabled: false,
      );

      expect(codecs, equals(<String>['ac3', 'eac3', 'dts-hd', 'truehd']));
    });

    test('emits DTS core only when DTS-HD is disabled', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.auto,
        ac3PassthroughEnabled: false,
        eac3PassthroughEnabled: false,
        eac3JocPassthroughEnabled: false,
        dtsCorePassthroughEnabled: true,
        dtsHdPassthroughEnabled: false,
        dtsXPassthroughEnabled: false,
        trueHdPassthroughEnabled: false,
        trueHdAtmosPassthroughEnabled: false,
      );

      expect(codecs, equals(<String>['dts']));
    });

    test('prefers DTS-HD over DTS core when both toggles are enabled', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.auto,
        ac3PassthroughEnabled: false,
        eac3PassthroughEnabled: false,
        eac3JocPassthroughEnabled: false,
        dtsCorePassthroughEnabled: true,
        dtsHdPassthroughEnabled: true,
        dtsXPassthroughEnabled: false,
        trueHdPassthroughEnabled: false,
        trueHdAtmosPassthroughEnabled: false,
      );

      expect(codecs, equals(<String>['dts-hd']));
    });

    test('requires base toggles for eac3-joc and truehd-atmos passthrough', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.auto,
        ac3PassthroughEnabled: false,
        eac3PassthroughEnabled: false,
        eac3JocPassthroughEnabled: true,
        dtsCorePassthroughEnabled: false,
        dtsHdPassthroughEnabled: false,
        dtsXPassthroughEnabled: false,
        trueHdPassthroughEnabled: false,
        trueHdAtmosPassthroughEnabled: true,
      );

      expect(codecs, isEmpty);
    });

    test(
      'maps DTS:X toggle to dts-hd when DTS core and DTS-HD are enabled',
      () {
        final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
          audioOutputMode: AudioOutputMode.auto,
          ac3PassthroughEnabled: false,
          eac3PassthroughEnabled: false,
          eac3JocPassthroughEnabled: false,
          dtsCorePassthroughEnabled: true,
          dtsHdPassthroughEnabled: true,
          dtsXPassthroughEnabled: true,
          trueHdPassthroughEnabled: false,
          trueHdAtmosPassthroughEnabled: false,
        );

        expect(codecs, equals(<String>['dts-hd']));
      },
    );

    test('ignores DTS:X toggle when DTS core is disabled', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromPreferences(
        audioOutputMode: AudioOutputMode.auto,
        ac3PassthroughEnabled: false,
        eac3PassthroughEnabled: false,
        eac3JocPassthroughEnabled: false,
        dtsCorePassthroughEnabled: false,
        dtsHdPassthroughEnabled: true,
        dtsXPassthroughEnabled: true,
        trueHdPassthroughEnabled: false,
        trueHdAtmosPassthroughEnabled: false,
      );

      expect(codecs, isEmpty);
    });
  });

  group('MediaKitPlayerBackend passthrough property synthesis', () {
    test('builds audio-spdif and audio-exclusive on desktop path', () {
      final props = MediaKitPlayerBackend
          .passthroughMpvPropertiesFromPreferences(
            audioOutputMode: AudioOutputMode.auto,
            ac3PassthroughEnabled: true,
            eac3PassthroughEnabled: true,
            eac3JocPassthroughEnabled: false,
            dtsCorePassthroughEnabled: false,
            dtsHdPassthroughEnabled: false,
            dtsXPassthroughEnabled: false,
            trueHdPassthroughEnabled: true,
            trueHdAtmosPassthroughEnabled: false,
            includeAudioExclusive: true,
          );

      expect(props['audio-spdif'], equals('ac3,eac3,truehd'));
      expect(props['audio-exclusive'], equals('yes'));
    });

    test('disables exclusive when no passthrough codecs remain', () {
      final props = MediaKitPlayerBackend
          .passthroughMpvPropertiesFromPreferences(
            audioOutputMode: AudioOutputMode.forceStereo,
            ac3PassthroughEnabled: true,
            eac3PassthroughEnabled: true,
            eac3JocPassthroughEnabled: true,
            dtsCorePassthroughEnabled: true,
            dtsHdPassthroughEnabled: true,
            dtsXPassthroughEnabled: true,
            trueHdPassthroughEnabled: true,
            trueHdAtmosPassthroughEnabled: true,
            includeAudioExclusive: true,
          );

      expect(props['audio-spdif'], isEmpty);
      expect(props['audio-exclusive'], equals('no'));
    });

    test('omits audio-exclusive on non-desktop path', () {
      final props = MediaKitPlayerBackend
          .passthroughMpvPropertiesFromPreferences(
            audioOutputMode: AudioOutputMode.auto,
            ac3PassthroughEnabled: true,
            eac3PassthroughEnabled: true,
            eac3JocPassthroughEnabled: false,
            dtsCorePassthroughEnabled: true,
            dtsHdPassthroughEnabled: true,
            dtsXPassthroughEnabled: false,
            trueHdPassthroughEnabled: false,
            trueHdAtmosPassthroughEnabled: false,
            includeAudioExclusive: false,
          );

      expect(props['audio-spdif'], equals('ac3,eac3,dts-hd'));
      expect(props.containsKey('audio-exclusive'), isFalse);
    });
  });
}
