import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/media_source_summary.dart';

void main() {
  group('formatMediaSourceSize', () {
    test('prints whole megabytes below a gigabyte', () {
      expect(formatMediaSourceSize(734 * 1024 * 1024), '734 MB');
    });

    test('switches to gigabytes past 999 MB', () {
      expect(formatMediaSourceSize(5583457484), '5.20 GB');
    });

    test('has no answer for a missing size', () {
      expect(formatMediaSourceSize(0), isNull);
    });
  });

  group('videoStreamSummary', () {
    test('lists codec, resolution, frame rate, bit depth and range', () {
      expect(
        videoStreamSummary({
          'Codec': 'hevc',
          'Profile': 'Main 10',
          'Width': 3840,
          'Height': 2160,
          'RealFrameRate': 23.976,
          'BitDepth': 10,
          'VideoRange': 'HDR',
          'VideoRangeType': 'DOVI',
        }, unknownCodec: 'Unknown'),
        [
          'HEVC (Main 10)',
          '3840 x 2160',
          '23.976 fps',
          '10-bit',
          'HDR (DOVI)',
        ],
      );
    });

    test('skips what the stream lacks', () {
      expect(
        videoStreamSummary(
          {'Width': 1920, 'Height': 1080},
          unknownCodec: 'Unknown',
        ),
        ['Unknown', '1920 x 1080'],
      );
    });
  });

  test('streamLanguageLabel upper cases a code and names a missing one', () {
    expect(streamLanguageLabel('eng', unknown: 'Unknown'), 'ENG');
    expect(streamLanguageLabel(null, unknown: 'Unknown'), 'Unknown');
    expect(streamLanguageLabel('', unknown: 'Unknown'), 'Unknown');
  });

  test('mediaSourceStreams types the server maps and tolerates none', () {
    expect(mediaSourceStreams({}), isEmpty);
    expect(
      mediaSourceStreams({
        'MediaStreams': [
          {'Type': 'Video'},
          'not a map',
        ],
      }),
      [
        {'Type': 'Video'},
      ],
    );
  });
}
