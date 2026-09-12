import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_layout_profile.dart';

void main() {
  test('keeps row and header density within the logical ranges', () {
    for (final height in [240.0, 360.0, 540.0, 900.0, 1400.0]) {
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: 960,
        availableHeight: height,
      );

      expect(profile.rowHeight, inInclusiveRange(50, 56));
      expect(profile.timeHeaderHeight, inInclusiveRange(22, 24));
    }
  });

  test('derives positive time density for every responsive window', () {
    for (final width in [120.0, 240.0, 480.0, 720.0, 960.0, 1920.0, 3840.0]) {
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: width,
        availableHeight: 540,
        textScaleFactor: 1.5,
      );

      expect(profile.pixelsPerMinute, greaterThan(0));
    }
  });

  test('uses half-hour windows bounded between 2.5 and 6 hours', () {
    for (final width in [120.0, 240.0, 480.0, 720.0, 960.0, 1920.0, 3840.0]) {
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: width,
        availableHeight: 540,
      );

      expect(profile.targetSlots, inInclusiveRange(5, 12));
      expect(profile.guideWindow.inMinutes, profile.targetSlots * 30);
      expect(
        profile.pixelsPerMinute * profile.guideWindow.inMinutes,
        // The profile floors the guide area at one pixel, which only bites at
        // widths the channel column alone consumes.
        closeTo(math.max(1.0, width - profile.channelColumnWidth), 0.0001),
        reason: 'width $width',
      );
    }
  });

  test('gives a 30-minute cell a readable width on a 1080p television', () {
    // 1920 physical at density 2 is 960 logical. This remains the compact TV
    // density: five half-hour slots with a narrower, content-sized rail.
    final profile = GuideLayoutProfile.fromAvailableArea(
      availableWidth: 960,
      availableHeight: 540,
    );

    expect(profile.guideWindow, const Duration(minutes: 150));
    expect(profile.channelColumnWidth, closeTo(153.6, 0.0001));
    expect(profile.pixelsPerMinute, closeTo(5.376, 0.0001));
    expect(30 * profile.pixelsPerMinute, closeTo(161.28, 0.0001));
  });

  test(
    'uses six hours on a wide browser without widening the channel rail',
    () {
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: 2000,
        availableHeight: 900,
      );

      expect(profile.guideWindow, const Duration(hours: 6));
      expect(profile.targetSlots, 12);
      expect(profile.channelColumnWidth, 168);
      expect(30 * profile.pixelsPerMinute, closeTo(152.6667, 0.0001));
    },
  );

  test('allows bounded channel-rail growth for accessibility text', () {
    final regular = GuideLayoutProfile.fromAvailableArea(
      availableWidth: 1200,
      availableHeight: 700,
    );
    final scaled = GuideLayoutProfile.fromAvailableArea(
      availableWidth: 1200,
      availableHeight: 700,
      textScaleFactor: 2,
    );

    expect(regular.channelColumnWidth, 168);
    expect(scaled.channelColumnWidth, 200);
  });
}
