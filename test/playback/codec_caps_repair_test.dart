import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/codec_caps_repair.dart';

void main() {
  group('codecCapsLookDegenerate', () {
    test('a healthy probe result is not degenerate', () {
      expect(
        codecCapsLookDegenerate({'supportsAvc': true, 'avcMainLevel': 52}),
        isFalse,
      );
    });

    test('missing or false AVC support is degenerate', () {
      expect(codecCapsLookDegenerate({}), isTrue);
      expect(
        codecCapsLookDegenerate({'supportsAvc': false, 'avcMainLevel': 52}),
        isTrue,
      );
    });

    test('a missing, zero, or non integer level is degenerate', () {
      expect(codecCapsLookDegenerate({'supportsAvc': true}), isTrue);
      expect(
        codecCapsLookDegenerate({'supportsAvc': true, 'avcMainLevel': 0}),
        isTrue,
      );
      expect(
        codecCapsLookDegenerate({'supportsAvc': true, 'avcMainLevel': '41'}),
        isTrue,
      );
    });
  });

  group('withAvcFloor', () {
    test('fills in the AVC floor and leaves every other field untouched', () {
      final repaired = withAvcFloor({
        'supportsAvc': false,
        'avcMainLevel': 0,
        'supportsHevc': true,
        'supportsDvP8': true,
      });

      expect(repaired['supportsAvc'], isTrue);
      expect(repaired['avcMainLevel'], avcFloorLevel);
      expect(repaired['supportsHevc'], isTrue);
      expect(repaired['supportsDvP8'], isTrue);
    });

    test('a repaired result no longer looks degenerate', () {
      expect(codecCapsLookDegenerate(withAvcFloor({})), isFalse);
    });
  });
}
