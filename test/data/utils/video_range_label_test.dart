import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/video_range_label.dart';

void main() {
  group('the field the server filled in', () {
    test('a squashed range type reads straight through', () {
      expect(videoRangeLabel({'VideoRangeType': 'HDR10'}), 'HDR10');
      expect(videoRangeLabel({'VideoRangeType': 'DOVI'}), 'Dolby Vision');
      expect(videoRangeLabel({'VideoRangeType': 'HLG'}), 'HLG');
    });

    test('a typed extended video type reads straight through', () {
      // Every member of Emby's ExtendedVideoTypes enum.
      expect(videoRangeLabel({'ExtendedVideoType': 'Hdr10'}), 'HDR10');
      expect(videoRangeLabel({'ExtendedVideoType': 'Hdr10Plus'}), 'HDR10+');
      expect(videoRangeLabel({'ExtendedVideoType': 'HyperLogGamma'}), 'HLG');
      expect(
        videoRangeLabel({'ExtendedVideoType': 'DolbyVision'}),
        'Dolby Vision',
      );
      expect(videoRangeLabel({'ExtendedVideoType': 'None'}), 'SDR');
    });

    test('a range written in prose is squashed before it is read', () {
      // What Emby generates from the typed field for display.
      expect(videoRangeLabel({'VideoRange': 'HDR 10'}), 'HDR10');
      expect(videoRangeLabel({'VideoRange': 'HDR 10+'}), 'HDR10+');
      expect(videoRangeLabel({'VideoRange': 'Dolby vision'}), 'Dolby Vision');
      expect(videoRangeLabel({'VideoRange': 'HLG'}), 'HLG');
      expect(videoRangeLabel({'VideoRange': 'HDR'}), 'HDR');
    });

    test('the typed field outranks the prose generated from it', () {
      expect(
        videoRangeLabel({'ExtendedVideoType': 'None', 'VideoRange': 'HDR 10'}),
        'SDR',
      );
    });

    test('the range type wins when both are set', () {
      expect(
        videoRangeLabel({'VideoRangeType': 'DOVI', 'VideoRange': 'HDR'}),
        'Dolby Vision',
      );
    });

    test('an empty range type falls through to the other field', () {
      expect(
        videoRangeLabel({'VideoRangeType': '', 'VideoRange': 'HDR 10'}),
        'HDR10',
      );
    });
  });

  group('the label', () {
    test('picks HDR10+ ahead of the HDR10 its own name contains', () {
      expect(videoRangeLabel({'VideoRangeType': 'HDR10Plus'}), 'HDR10+');
      expect(videoRangeLabel({'VideoRange': 'HDR 10+'}), 'HDR10+');
    });

    test('is SDR when the server says so, or says nothing at all', () {
      expect(videoRangeLabel({'VideoRangeType': 'SDR'}), 'SDR');
      expect(videoRangeLabel({'VideoRange': 'SDR'}), 'SDR');
      expect(videoRangeLabel(const <String, dynamic>{}), 'SDR');
    });

    test('is SDR for a field holding something unreadable', () {
      expect(videoRangeLabel({'VideoRangeType': 42}), 'SDR');
      expect(videoRangeLabel({'VideoRangeType': '   '}), 'SDR');
    });
  });

  group('videoRangeBadges', () {
    test('names the Dolby Vision profile, then the layer it falls back to', () {
      expect(
        videoRangeBadges({
          'VideoRangeType': 'DOVIWithHDR10Plus',
          'DvProfile': 8,
        }),
        ['DV P8', 'HDR10+'],
      );
      expect(
        videoRangeBadges({'VideoRangeType': 'DOVIWithHDR10', 'DvProfile': 8}),
        ['DV P8', 'HDR10'],
      );
      expect(videoRangeBadges({'VideoRangeType': 'DOVI', 'DvProfile': 5}), [
        'DV P5',
      ]);
      expect(
        videoRangeBadges({'VideoRangeType': 'DOVIWithHLG', 'DvProfile': 8}),
        ['DV P8', 'HLG'],
      );
    });

    test("reads Emby's profile from ExtendedVideoSubType", () {
      expect(
        videoRangeBadges({
          'ExtendedVideoType': 'DolbyVision',
          'ExtendedVideoSubType': 'DoviProfile81',
        }),
        ['DV P8'],
      );
    });

    test(
      'says DV alone without a profile, and nothing for an SDR fallback',
      () {
        expect(videoRangeBadges({'VideoRangeType': 'DOVI'}), ['DV']);
        expect(
          videoRangeBadges({'VideoRangeType': 'DOVIWithSDR', 'DvProfile': 8}),
          ['DV P8'],
        );
      },
    );

    test('reads Dolby Vision the server calls invalid as HDR', () {
      expect(videoRangeBadges({'VideoRangeType': 'DOVIInvalid'}), ['HDR']);
    });

    test('is the plain range label without Dolby Vision', () {
      expect(videoRangeBadges({'VideoRangeType': 'HDR10Plus'}), ['HDR10+']);
      expect(videoRangeBadges({'VideoRangeType': 'SDR'}), ['SDR']);
    });
  });
}
