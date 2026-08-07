import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  group('MediaKitPlayerBackend passthrough codec synthesis', () {
    test('downmix empties the codec list regardless of the set', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromSet(
        PassthroughCodec.values.toSet(),
        downmixToStereo: true,
      );

      expect(codecs, isEmpty);
    });

    test('maps the codec set to mpv passthrough names in order', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromSet({
        PassthroughCodec.ac3,
        PassthroughCodec.eac3,
        PassthroughCodec.dtsCore,
        PassthroughCodec.dtsHd,
        PassthroughCodec.trueHd,
      }, downmixToStereo: false);

      expect(codecs, equals(<String>['ac3', 'eac3', 'dts-hd', 'truehd']));
    });

    test('emits DTS core only when DTS-HD is absent', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromSet({
        PassthroughCodec.dtsCore,
      }, downmixToStereo: false);

      expect(codecs, equals(<String>['dts']));
    });

    test('prefers dts-hd over dts when both are present', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromSet({
        PassthroughCodec.dtsCore,
        PassthroughCodec.dtsHd,
      }, downmixToStereo: false);

      expect(codecs, equals(<String>['dts-hd']));
    });

    test('an empty set synthesizes nothing', () {
      final codecs = MediaKitPlayerBackend.passthroughCodecsFromSet(
        const {},
        downmixToStereo: false,
      );

      expect(codecs, isEmpty);
    });
  });

  group('MediaKitPlayerBackend mpv property synthesis', () {
    test('writes audio-spdif and audio-exclusive on desktop', () {
      final properties = MediaKitPlayerBackend.passthroughMpvPropertiesFromSet(
        {PassthroughCodec.ac3, PassthroughCodec.eac3},
        downmixToStereo: false,
        includeAudioExclusive: true,
      );

      expect(properties['audio-spdif'], 'ac3,eac3');
      expect(properties['audio-exclusive'], 'yes');
    });

    test('clears audio-exclusive when nothing is passed through', () {
      final properties = MediaKitPlayerBackend.passthroughMpvPropertiesFromSet(
        const {},
        downmixToStereo: false,
        includeAudioExclusive: true,
      );

      expect(properties['audio-spdif'], '');
      expect(properties['audio-exclusive'], 'no');
    });

    test('omits audio-exclusive off desktop', () {
      final properties = MediaKitPlayerBackend.passthroughMpvPropertiesFromSet(
        {PassthroughCodec.ac3},
        downmixToStereo: false,
        includeAudioExclusive: false,
      );

      expect(properties.containsKey('audio-exclusive'), isFalse);
      expect(properties['audio-spdif'], 'ac3');
    });
  });
}
