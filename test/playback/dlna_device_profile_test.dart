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
        traits: SiloPlayerTraits.dlnaRenderer,
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
        traits: SiloPlayerTraits.dlnaRenderer,
      );

      final original = capabilities.deliveries['original_http']!;
      expect(original['containers'], contains('mkv'));
      expect(original['audio_decode_codecs'], containsAll(['aac', 'ac3']));
    });

    // Silo's copied-video HLS playlist grows as it copies, and an LG plays
    // that as live (no runtime, no pause), so a remux goes progressive.
    test('takes a progressive remux before HLS', () {
      final capabilities = siloCapabilitiesFromDeviceProfile(
        dlnaDeviceProfile(),
        traits: SiloPlayerTraits.dlnaRenderer,
      );

      final progressive = capabilities.deliveries['progressive']!;
      expect(progressive['supported_on_device'], isTrue);
      expect(capabilities.deliveries['hls']!['supported_on_device'], isTrue);
    });

    test('offers Silo only Dolby Vision profile 8', () {
      final capabilities = siloCapabilitiesFromDeviceProfile(
        dlnaDeviceProfile(),
        traits: SiloPlayerTraits.dlnaRenderer,
      );

      final hdr = capabilities.clientCapabilities['hdr_details'] as Map;
      expect(hdr['dolby_vision_profiles'], [8]);
      expect(hdr['hdr10'], isTrue);
    });

    // The names must match Jellyfin's VideoRangeType exactly to apply.
    test('keeps every Dolby Vision type without an HDR10 base off HEVC', () {
      final hevc = (dlnaDeviceProfile()['CodecProfiles'] as List)
          .cast<Map<String, dynamic>>()
          .firstWhere((p) => p['Codec'] == 'hevc');
      final ruledOut = [
        for (final c in (hevc['Conditions'] as List).cast<Map<String, dynamic>>())
          if (c['Property'] == 'VideoRangeType' && c['Condition'] == 'NotEquals')
            c['Value'],
      ];
      expect(
        ruledOut,
        unorderedEquals(['DOVI', 'DOVIWithEL', 'DOVIWithELHDR10Plus', 'DOVIInvalid']),
      );
    });
  });
}
