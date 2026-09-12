import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_backend.dart';

/// AetherEngine tags the sample entry `dav1` for a Dolby Vision AV1 stream
/// whenever the display reports Dolby Vision. movenc resolves an mp4 tag
/// through `validate_codec_tag`, which needs the exact (tag, codec_id) pair in
/// `ff_codec_movvideo_tags`; that table has `av01` for AV1 and no `dav1`, so
/// the header fails with EINVAL before segment 0 and playback dies two packets
/// in. These sources take `preferredDecodePath: .software` instead, which
/// never builds an fMP4 segment and renders the profile 10.1 HDR10 base layer.
/// That is a CPU decode, not a hardware one — see the doc comment on
/// `needsSoftwareDecodeForDolbyVisionAv1`.
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
