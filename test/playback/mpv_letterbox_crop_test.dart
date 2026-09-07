import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/mpv_letterbox_crop.dart';

void main() {
  group('MpvLetterboxCrop.parseVfMetadata', () {
    test('reads JSON lavfi keys', () {
      const raw =
          '{"lavfi.cropdetect.w":"1920","lavfi.cropdetect.h":"804","lavfi.cropdetect.x":"0","lavfi.cropdetect.y":"138"}';
      expect(MpvLetterboxCrop.parseVfMetadata(raw), {
        'w': '1920',
        'h': '804',
        'x': '0',
        'y': '138',
      });
    });

    test('reads key=value lavfi dump', () {
      const raw =
          'lavfi.cropdetect.w=1920 lavfi.cropdetect.h=804 lavfi.cropdetect.x=0 lavfi.cropdetect.y=138';
      expect(MpvLetterboxCrop.parseVfMetadata(raw)['h'], '804');
    });

    test('empty input is empty map', () {
      expect(MpvLetterboxCrop.parseVfMetadata(null), isEmpty);
      expect(MpvLetterboxCrop.parseVfMetadata('null'), isEmpty);
    });
  });

  group('MpvLetterboxCrop.decide', () {
    test('crops letterbox bars', () {
      final rect = MpvLetterboxCrop.decide(
        lavfi: {'w': '1920', 'h': '804', 'x': '0', 'y': '138'},
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(rect, const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138));
      expect(rect!.videoCrop, '1920x804+0+138');
    });

    test('skips a full-frame detect', () {
      expect(
        MpvLetterboxCrop.decide(
          lavfi: {'w': '1920', 'h': '1080', 'x': '0', 'y': '0'},
          sourceWidth: 1920,
          sourceHeight: 1080,
        ),
        isNull,
      );
    });

    test('skips an over-crop', () {
      expect(
        MpvLetterboxCrop.decide(
          lavfi: {'w': '100', 'h': '100', 'x': '0', 'y': '0'},
          sourceWidth: 1920,
          sourceHeight: 1080,
        ),
        isNull,
      );
    });
  });

  group('MpvLetterboxCrop.mustDisableHwdec', () {
    test('keeps copy and software decoders', () {
      expect(MpvLetterboxCrop.mustDisableHwdec('no'), isFalse);
      expect(MpvLetterboxCrop.mustDisableHwdec('auto-copy'), isFalse);
      expect(MpvLetterboxCrop.mustDisableHwdec('vaapi-copy'), isFalse);
    });

    test('disables zero-copy hwdec', () {
      expect(MpvLetterboxCrop.mustDisableHwdec('vaapi'), isTrue);
      expect(MpvLetterboxCrop.mustDisableHwdec('auto'), isTrue);
      expect(MpvLetterboxCrop.mustDisableHwdec('nvdec'), isTrue);
    });

    test('hwdecForCropdetect prefers auto-copy over software', () {
      expect(MpvLetterboxCrop.hwdecForCropdetect('nvdec'), 'auto-copy');
      expect(MpvLetterboxCrop.hwdecForCropdetect('vaapi-copy'), isNull);
      expect(MpvLetterboxCrop.hwdecForCropdetect('no'), isNull);
    });
  });
}
