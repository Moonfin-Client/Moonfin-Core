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

  group('codecCapsLookIncomplete', () {
    test('a result carrying HEVC is complete', () {
      expect(
        codecCapsLookIncomplete({
          'supportsAvc': true,
          'avcMainLevel': 52,
          'supportsHevc': true,
        }),
        isFalse,
      );
    });

    test('a result that cleared the AVC check but lost HEVC is incomplete', () {
      expect(
        codecCapsLookIncomplete({'supportsAvc': true, 'avcMainLevel': 52}),
        isTrue,
      );
      expect(
        codecCapsLookIncomplete({
          'supportsAvc': true,
          'avcMainLevel': 52,
          'supportsHevc': false,
        }),
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

  group('codecCapsWithoutAProbe', () {
    // The launch that reported an HEVC library as H264 only had a cached
    // answer on disk the whole time, and reached for the floor instead.
    test('keeps a seeded answer rather than falling to the floor', () {
      const seeded = {
        'supportsAvc': true,
        'avcMainLevel': 52,
        'supportsHevc': true,
        'hevcMainLevel': 153,
      };

      expect(codecCapsWithoutAProbe(seeded), seeded);
    });

    test('falls to the floor when there is nothing seeded', () {
      expect(codecCapsWithoutAProbe(const {}), withAvcFloor(const {}));
    });

    test('falls to the floor when the seed is itself degenerate', () {
      expect(
        codecCapsWithoutAProbe(const {'supportsAvc': false}),
        withAvcFloor(const {}),
      );
    });
  });
}
