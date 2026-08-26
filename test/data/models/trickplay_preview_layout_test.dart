import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_preview_layout.dart';

void main() {
  group('TrickplayPreviewLayout.trackXForPosition', () {
    test('position 0 sits at the thumb radius inset', () {
      final x = TrickplayPreviewLayout.trackXForPosition(
        positionMs: 0,
        durationMs: 100000,
        trackWidth: 1000,
      );
      expect(x, TrickplayPreviewLayout.seekThumbRadius);
    });

    test('position at duration sits at the far inset', () {
      final x = TrickplayPreviewLayout.trackXForPosition(
        positionMs: 100000,
        durationMs: 100000,
        trackWidth: 1000,
      );
      expect(x, 1000 - TrickplayPreviewLayout.seekThumbRadius);
    });

    test('zero duration does not divide by zero', () {
      final x = TrickplayPreviewLayout.trackXForPosition(
        positionMs: 500,
        durationMs: 0,
        trackWidth: 1000,
      );
      expect(x, TrickplayPreviewLayout.seekThumbRadius);
    });
  });

  group('TrickplayPreviewLayout.resolveSingleLeft', () {
    test('centered on the track when not following scrub', () {
      final left = TrickplayPreviewLayout.resolveSingleLeft(
        positionMs: 10000,
        durationMs: 100000,
        trackWidth: 1000,
        tileWidth: 200,
        followScrub: false,
      );
      expect(left, (1000 - 200) / 2);
    });

    test('tracks the thumb when following scrub', () {
      final left = TrickplayPreviewLayout.resolveSingleLeft(
        positionMs: 50000,
        durationMs: 100000,
        trackWidth: 1000,
        tileWidth: 200,
        followScrub: true,
      );
      final thumbX = TrickplayPreviewLayout.trackXForPosition(
        positionMs: 50000,
        durationMs: 100000,
        trackWidth: 1000,
      );
      expect(left, thumbX - 100);
    });

    test('stays fully on-screen near the left edge while following', () {
      final left = TrickplayPreviewLayout.resolveSingleLeft(
        positionMs: 0,
        durationMs: 100000,
        trackWidth: 1000,
        tileWidth: 200,
        followScrub: true,
      );
      expect(left, greaterThanOrEqualTo(0.0));
    });

    test('stays fully on-screen near the right edge while following', () {
      final left = TrickplayPreviewLayout.resolveSingleLeft(
        positionMs: 100000,
        durationMs: 100000,
        trackWidth: 1000,
        tileWidth: 200,
        followScrub: true,
      );
      expect(left, lessThanOrEqualTo(1000 - 200));
    });
  });

  group('TrickplayPreviewLayout.resolveStrip', () {
    test('fills evenly on both sides when the main tile is centered', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 450,
        trackWidth: 1000,
        tileWidth: 100,
        spacing: 0,
      );
      expect(layout.leftCount, layout.rightCount);
      expect(layout.slotCount, layout.leftCount * 2 + 1);
    });

    test('spawns fewer slots on the left when main tile is near the left edge', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 10,
        trackWidth: 1000,
        tileWidth: 100,
        spacing: 0,
      );
      expect(layout.leftCount, lessThan(layout.rightCount));
    });

    test('spawns fewer slots on the right when main tile is near the right edge', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 890,
        trackWidth: 1000,
        tileWidth: 100,
        spacing: 0,
      );
      expect(layout.rightCount, lessThan(layout.leftCount));
    });

    test('leftOffset places the highlighted slot exactly at mainTileLeft', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 273,
        trackWidth: 1000,
        tileWidth: 80,
        spacing: 8,
      );
      final highlightSlotLeft =
          layout.leftOffset + layout.leftCount * (80 + 8);
      expect(highlightSlotLeft, closeTo(273, 0.001));
    });

    test(
      'always spawns exactly one full-size slot beyond the last one that '
      'fully fits, genuinely overflowing the track rather than being '
      'shrunk to fit',
      () {
        final layout = TrickplayPreviewLayout.resolveStrip(
          mainTileLeft: 895,
          trackWidth: 1000,
          tileWidth: 100,
          spacing: 10,
        );
        expect(layout.rightCount, 1);
      },
    );

    test(
      'still spawns the overflow slot on the left even at a true edge',
      () {
        final layout = TrickplayPreviewLayout.resolveStrip(
          mainTileLeft: 5,
          trackWidth: 1000,
          tileWidth: 100,
          spacing: 10,
        );
        expect(layout.leftCount, 1);
      },
    );

    test(
      'does not run away spawning full slots indefinitely when there is '
      'plenty of room',
      () {
        final layout = TrickplayPreviewLayout.resolveStrip(
          mainTileLeft: 10,
          trackWidth: 1000,
          tileWidth: 50,
          spacing: 0,
        );
        expect(layout.rightCount, 19);
      },
    );

    test(
      'overflowMargin lets the overflow slot reach further before it '
      'stops counting as fitting, without moving leftOffset',
      () {
        const mainTileLeft = 95.6;
        const trackWidth = 340.0;
        const tileWidth = 51.0;
        const spacing = 4.0;

        final withoutMargin = TrickplayPreviewLayout.resolveStrip(
          mainTileLeft: mainTileLeft,
          trackWidth: trackWidth,
          tileWidth: tileWidth,
          spacing: spacing,
        );
        final withMargin = TrickplayPreviewLayout.resolveStrip(
          mainTileLeft: mainTileLeft,
          trackWidth: trackWidth,
          tileWidth: tileWidth,
          spacing: spacing,
          overflowMargin: 8,
        );

        expect(withMargin.leftCount, 2);
        expect(withMargin.rightCount, 4);
        expect(withMargin.leftOffset, closeTo(-14.4, 0.001));
        expect(withMargin.leftOffset, withoutMargin.leftOffset);
      },
    );

    test('overflowMargin of 0 behaves exactly like omitting it', () {
      final withZero = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 273,
        trackWidth: 1000,
        tileWidth: 80,
        spacing: 8,
        overflowMargin: 0,
      );
      final omitted = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 273,
        trackWidth: 1000,
        tileWidth: 80,
        spacing: 8,
      );
      expect(withZero.leftCount, omitted.leftCount);
      expect(withZero.rightCount, omitted.rightCount);
      expect(withZero.leftOffset, omitted.leftOffset);
    });

    test('maxSlotsPerSide guards against a degenerate near-zero tile size', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 500,
        trackWidth: 1000,
        tileWidth: 0.001,
        spacing: 0,
        maxSlotsPerSide: 50,
      );
      expect(layout.leftCount, lessThanOrEqualTo(50));
      expect(layout.rightCount, lessThanOrEqualTo(50));
    });

    test('a literal-zero step returns no wing tiles instead of throwing', () {
      final layout = TrickplayPreviewLayout.resolveStrip(
        mainTileLeft: 50,
        trackWidth: 1000,
        tileWidth: 0,
        spacing: 0,
      );
      expect(layout.leftCount, 0);
      expect(layout.rightCount, 0);
      expect(layout.leftOffset, 50);
    });
  });

  group('TrickplayPreviewLayout.resolveVerticalTravel', () {
    test('0% stays at the resting position (no travel)', () {
      final travel = TrickplayPreviewLayout.resolveVerticalTravel(
        0,
        maxTravel: 100,
      );
      expect(travel, 0);
    });

    test('100% travels the full distance to the ceiling', () {
      final travel = TrickplayPreviewLayout.resolveVerticalTravel(
        100,
        maxTravel: 100,
      );
      expect(travel, 100);
    });

    test('50% travels halfway to the ceiling', () {
      final travel = TrickplayPreviewLayout.resolveVerticalTravel(
        50,
        maxTravel: 100,
      );
      expect(travel, 50);
    });

    test('out-of-range percentages are clamped into 0-100', () {
      expect(
        TrickplayPreviewLayout.resolveVerticalTravel(-20, maxTravel: 100),
        0,
      );
      expect(
        TrickplayPreviewLayout.resolveVerticalTravel(150, maxTravel: 100),
        100,
      );
    });

    test('never exceeds a caller-supplied small maxTravel', () {
      final travel = TrickplayPreviewLayout.resolveVerticalTravel(
        100,
        maxTravel: 12,
      );
      expect(travel, lessThanOrEqualTo(12));
    });
  });

  group('TrickplayPreviewLayout.resolveVerticalTravelMax', () {
    test('a wide (landscape) track rarely binds - the raw ceiling distance wins', () {
      final maxTravel = TrickplayPreviewLayout.resolveVerticalTravelMax(
        rawMaxTravel: 300,
        trackWidth: 1200,
      );
      expect(maxTravel, 300);
    });

    test('a narrow (portrait) track caps travel to trackWidth, not the raw ceiling distance', () {
      final maxTravel = TrickplayPreviewLayout.resolveVerticalTravelMax(
        rawMaxTravel: 900,
        trackWidth: 250,
      );
      expect(maxTravel, 250);
    });

    test('never goes negative even with a negative raw distance', () {
      final maxTravel = TrickplayPreviewLayout.resolveVerticalTravelMax(
        rawMaxTravel: -40,
        trackWidth: 250,
      );
      expect(maxTravel, 0);
    });
  });

  group('TrickplayPreviewLayout.resolveTileSize', () {
    test('100% fills the whole maxHeightBudget when the track is wide enough', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 100,
        aspect: 9 / 16,
        maxHeightBudget: 500,
      );
      expect(size.height, closeTo(500, 0.001));
      expect(size.width, closeTo(500 / (9 / 16), 0.001));
    });

    test('the multiplier-1.0x slider value is half of maxHeightBudget', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 40,
        aspect: 9 / 16,
        maxHeightBudget: 500,
      );
      expect(size.height, closeTo(250, 0.001));
    });

    test('never shrinks below the 24px height floor', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 10,
        aspect: 9 / 16,
        maxHeightBudget: 0,
      );
      expect(size.height, greaterThanOrEqualTo(24.0));
    });

    test('height never exceeds maxHeightBudget regardless of trackWidth', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 3800,
        scalePercent: 100,
        aspect: 9 / 16,
        maxHeightBudget: 100,
      );
      expect(size.height, lessThanOrEqualTo(100.0 + 0.001));
    });

    test('width never exceeds a narrow (portrait) trackWidth, even with a generous height budget', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 100,
        scalePercent: 100,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      expect(size.width, closeTo(100, 0.001));
    });

    test('trackWidth narrower than the 24px height floor still wins - width never exceeds it', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 30,
        scalePercent: 100,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      expect(size.width, closeTo(30, 0.001));
      expect(size.height, lessThan(24.0));
    });

    test('respects the tile aspect ratio in both dimensions', () {
      final size = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 40,
        aspect: 3 / 4,
        maxHeightBudget: 1000,
      );
      expect(size.height / size.width, closeTo(3 / 4, 0.001));
    });

    test('clamps a scalePercent below 10 to the 0.5x floor', () {
      final atFloor = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 0,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      final atMin = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 10,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      expect(atFloor.width, closeTo(atMin.width, 0.001));
    });

    test('clamps a scalePercent above 100 to the 2.0x ceiling', () {
      final atCeiling = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 150,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      final atMax = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 100,
        aspect: 9 / 16,
        maxHeightBudget: 1000,
      );
      expect(atCeiling.width, closeTo(atMax.width, 0.001));
    });
  });

  group('TrickplayPreviewLayout.plan', () {
    const seek = Duration(minutes: 30);
    const total = Duration(hours: 1);

    TrickplayPreviewPlan planAt({required bool isStrip}) =>
        TrickplayPreviewLayout.plan(
          trackWidth: 1000,
          scalePercent: 30,
          aspect: 9 / 16,
          maxHeightBudget: 400,
          positionMs: 1800000,
          durationMs: 3600000,
          followScrub: true,
          verticalPositionPercent: 50,
          isStrip: isStrip,
          spacing: 4,
          overflowMargin: 16,
          seekPosition: seek,
          totalDuration: total,
          stepMs: 30000,
        );

    test('agrees with the pieces it is built from', () {
      final plan = planAt(isStrip: true);
      final tile = TrickplayPreviewLayout.resolveTileSize(
        trackWidth: 1000,
        scalePercent: 30,
        aspect: 9 / 16,
        maxHeightBudget: 400,
      );
      expect(plan.tileWidth, tile.width);
      expect(plan.tileHeight, tile.height);
      final mainLeft = TrickplayPreviewLayout.resolveSingleLeft(
        positionMs: 1800000,
        durationMs: 3600000,
        trackWidth: 1000,
        tileWidth: tile.width,
        followScrub: true,
      );
      expect(plan.leftOffset, mainLeft - plan.leftCount * (tile.width + 4));
      expect(
        plan.verticalTravel,
        TrickplayPreviewLayout.resolveVerticalTravel(
          50,
          maxTravel: TrickplayPreviewLayout.resolveVerticalTravelMax(
            rawMaxTravel: 400 - tile.height,
            trackWidth: 1000,
          ),
        ),
      );
    });

    test(
      'the highlighted slot is the seek position and the wings step out',
      () {
        final plan = planAt(isStrip: true);
        expect(plan.slotsByIndex[0]!.targetPosition, seek);
        expect(
          plan.slotsByIndex[1]!.targetPosition,
          seek + const Duration(seconds: 30),
        );
        expect(
          plan.slotsByIndex[-1]!.targetPosition,
          seek - const Duration(seconds: 30),
        );
        expect(plan.slotsByIndex.length, plan.leftCount + 1 + plan.rightCount);
        expect(plan.leftCount, greaterThan(0));
      },
    );

    test('single mode has one slot and no wings', () {
      final plan = planAt(isStrip: false);
      expect(plan.leftCount, 0);
      expect(plan.rightCount, 0);
      expect(plan.slotsByIndex.keys, [0]);
    });
  });
}
