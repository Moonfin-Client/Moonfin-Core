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
}
