import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_backend.dart';

/// AetherEngine cannot mux a Dolby Vision AV1 stream: it tags the sample entry
/// `dav1` whenever the display reports Dolby Vision, and FFmpeg's MP4 muxer has
/// no `dav1` entry, so `avformat_write_header` fails with EINVAL before the
/// first segment. These sources are routed to SoftwarePlaybackHost instead,
/// which never builds an fMP4 segment.
void main() {
  bool decides(Map<String, dynamic> payload) =>
      AetherBackend.needsSoftwareDecodeForDolbyVisionAv1(payload);

  group('AetherBackend Dolby Vision AV1 decode path', () {
    test('profile 10.1 by compatibility id takes the software path', () {
      expect(
        decides(<String, dynamic>{
          'videoCodec': 'av1',
          'videoDvProfile': 10,
          'videoDvBlCompatId': 1,
        }),
        isTrue,
      );
    });

    test('falls back to the range type when the compatibility id is absent',
        () {
      for (final rangeType in const [
        'DOVIWithHDR10',
        'DOVIWithHDR10Plus',
        'DOVI_WITH_HDR10_PLUS',
      ]) {
        expect(
          decides(<String, dynamic>{
            'videoCodec': 'av1',
            'videoDvProfile': 10,
            'videoRangeType': rangeType,
          }),
          isTrue,
          reason: rangeType,
        );
      }
    });

    test('a present compatibility id wins over the range type', () {
      // 10.4 carries an HLG base and muxes as av01 already, so it must keep the
      // hardware path even if the range type string were misleading.
      expect(
        decides(<String, dynamic>{
          'videoCodec': 'av1',
          'videoDvProfile': 10,
          'videoDvBlCompatId': 4,
          'videoRangeType': 'DOVIWithHDR10Plus',
        }),
        isFalse,
      );
    });

    test('profile 10.0 keeps the hardware path: no base layer to render', () {
      expect(
        decides(<String, dynamic>{
          'videoCodec': 'av1',
          'videoDvProfile': 10,
          'videoDvBlCompatId': 0,
        }),
        isFalse,
      );
    });

    test('HEVC Dolby Vision is untouched: dvh1 muxes fine', () {
      expect(
        decides(<String, dynamic>{
          'videoCodec': 'hevc',
          'videoDvProfile': 8,
          'videoDvBlCompatId': 1,
        }),
        isFalse,
      );
    });

    test('plain AV1 HDR10 is untouched: it already direct plays', () {
      expect(
        decides(<String, dynamic>{
          'videoCodec': 'av1',
          'videoRangeType': 'HDR10Plus',
        }),
        isFalse,
      );
    });

    test('an empty payload never forces the software path', () {
      expect(decides(<String, dynamic>{}), isFalse);
    });
  });
}
