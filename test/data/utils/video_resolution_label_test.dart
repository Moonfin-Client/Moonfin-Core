import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/video_resolution_label.dart';

Map<String, dynamic> _stream(dynamic width, dynamic height, {bool? interlaced}) => {
  'Width': width,
  'Height': height,
  if (interlaced != null) 'IsInterlaced': interlaced,
};

void main() {
  group('videoResolutionLabel', () {
    test('names each step of the ladder', () {
      expect(videoResolutionLabel(_stream(7680, 4320)), '8K');
      expect(videoResolutionLabel(_stream(3840, 2160)), '4K');
      expect(videoResolutionLabel(_stream(2560, 1440)), '1440p');
      expect(videoResolutionLabel(_stream(1920, 1080)), '1080p');
      expect(videoResolutionLabel(_stream(1280, 720)), '720p');
      expect(videoResolutionLabel(_stream(854, 480)), '480p');
      // 640x360 clears the 600 wide threshold, so it's 480p.
      expect(videoResolutionLabel(_stream(640, 360)), '480p');
      expect(videoResolutionLabel(_stream(320, 240)), 'SD');
    });

    // Letterboxed films match on width alone.
    test('reads a letterboxed scope film by its width', () {
      expect(videoResolutionLabel(_stream(3840, 1600)), '4K');
      expect(videoResolutionLabel(_stream(1920, 800)), '1080p');
    });

    test('marks an interlaced stream, but not the fixed names above it', () {
      expect(videoResolutionLabel(_stream(1920, 1080, interlaced: true)), '1080i');
      expect(videoResolutionLabel(_stream(720, 576, interlaced: true)), '480i');
      expect(videoResolutionLabel(_stream(3840, 2160, interlaced: true)), '4K');
    });

    // An unprobed stream carries a zero, which isn't SD.
    test('says nothing when the dimensions are unusable', () {
      expect(videoResolutionLabel(_stream(0, 0)), isNull);
      expect(videoResolutionLabel(_stream(1920, 0)), isNull);
      expect(videoResolutionLabel(_stream(-1, 1080)), isNull);
      expect(videoResolutionLabel(_stream(null, null)), isNull);
      expect(videoResolutionLabel(const {}), isNull);
    });

    // Servers don't agree on the type.
    test('takes dimensions however the server typed them', () {
      expect(videoResolutionLabel(_stream('1920', '1080')), '1080p');
      expect(videoResolutionLabel(_stream(1920.0, 1080.0)), '1080p');
      expect(videoResolutionLabel(_stream('not a number', 1080)), isNull);
    });
  });
}
