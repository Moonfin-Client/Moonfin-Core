import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cast/receiver_device_profiles.dart';
import 'package:playback_silo/playback_silo.dart';

void main() {
  group('dlnaDeviceProfile', () {
    // The phone's own default profile once went to the renderer, which marks
    // H264 and HEVC as never playable, so Silo refused every video with no
    // codec to play or to convert to.
    test('gives Silo H264 and HEVC to play and to keep over HLS', () {
      final capabilities = siloCapabilitiesFromDeviceProfile(
        dlnaDeviceProfile(),
        traits: SiloPlayerTraits.castReceiver,
      );

      final codecs = capabilities.clientCapabilities['codecs_video'] as List;
      expect(codecs, containsAll(['h264', 'hevc']));

      final hls = capabilities.deliveries['hls']!;
      expect(hls['supported_on_device'], isTrue);
      expect(hls['video_codecs'], containsAll(['h264', 'hevc']));
    });

    test('plays a Matroska original as it is', () {
      final capabilities = siloCapabilitiesFromDeviceProfile(
        dlnaDeviceProfile(),
        traits: SiloPlayerTraits.castReceiver,
      );

      final original = capabilities.deliveries['original_http']!;
      expect(original['containers'], contains('mkv'));
      expect(original['audio_decode_codecs'], containsAll(['aac', 'ac3']));
    });
  });
}
