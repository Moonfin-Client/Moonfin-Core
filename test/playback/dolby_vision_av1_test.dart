import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/dolby_vision_av1.dart';

void main() {
  bool decides(Map<String, dynamic> payload) =>
      needsBaseLayerOnlyForDolbyVisionAv1(payload);

  group('Dolby Vision AV1 base layer', () {
    test('profile 10.1 by compatibility id is served as its base layer', () {
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
      // Dolby Vision route even if the range type string were misleading.
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

    test('profile 10.0 keeps Dolby Vision: no base layer to present', () {
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

    test('an empty payload never asks for the base layer', () {
      expect(decides(<String, dynamic>{}), isFalse);
    });
  });
}
