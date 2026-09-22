import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_layout_profile.dart';
import 'package:moonfin/util/tv_ui_scale.dart';

void main() {
  test('keeps row and header density within the logical ranges', () {
    for (final height in [240.0, 360.0, 540.0, 900.0, 1400.0]) {
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: 960,
        availableHeight: height,
      );

      expect(profile.rowHeight, inInclusiveRange(50, 62));
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

  test('still has somewhere to go on a surface below the design canvas', () {
    // 960 by 540 is what a 1080p Android TV used to report before every
    // television was normalized onto one canvas, and is now only reached by a
    // window that small. The guide has to stay usable there rather than
    // carrying sizes meant for the roomier canvas into it.
    final profile = GuideLayoutProfile.fromAvailableArea(
      availableWidth: 960,
      availableHeight: 540,
    );

    expect(profile.guideWindow, const Duration(minutes: 150));
    expect(profile.channelColumnWidth, closeTo(153.6, 0.0001));
    expect(profile.rowHeight, lessThan(56));
    expect(30 * profile.pixelsPerMinute, greaterThan(150));
  });

  test('gives a 30-minute cell a readable width on the television canvas', () {
    // Every television lays out on this canvas and the panel paints it at
    // about 1.45 pixels to the point, so a cell has to clear the ten foot
    // floor once that multiplication is done, not before it.
    final area = guideAvailableArea(
      maxWidth: kTvDesignWidth,
      maxHeight: kTvDesignWidth * 9 / 16,
      landscape: true,
      miniPlayerMode: false,
    );
    final profile = GuideLayoutProfile.fromAvailableArea(
      availableWidth: area.width,
      availableHeight: area.height,
    );

    expect(profile.guideWindow, const Duration(minutes: 180));
    expect(30 * profile.pixelsPerMinute, closeTo(178.7, 0.5));
    expect(
      30 * profile.pixelsPerMinute * kTvTargetScale,
      greaterThan(240),
      reason: 'a 30 minute cell has to carry a title at ten feet',
    );
    expect(profile.rowHeight, closeTo(60, 0.5));
    expect(
      profile.channelColumnWidth,
      closeTo(204, 1),
      reason: 'the rail keeps its share of the canvas rather than a ceiling',
    );
  });

  test('keeps the rail bounded on a wide browser', () {
    // The share would hand a very wide window a third of itself, so the
    // ceiling still governs there. The window is shorter than it was because
    // a cell is wider everywhere now, not only on a television.
    final profile = GuideLayoutProfile.fromAvailableArea(
      availableWidth: 2000,
      availableHeight: 900,
    );

    expect(profile.guideWindow, const Duration(hours: 5));
    expect(profile.channelColumnWidth, 208);
    expect(30 * profile.pixelsPerMinute, greaterThan(170));
  });

  test('gives a row more height as the interface text size grows', () {
    const area = (width: 1276.0, height: 721.0);
    final regular = GuideLayoutProfile.fromAvailableArea(
      availableWidth: area.width,
      availableHeight: area.height,
    );
    final scaled = GuideLayoutProfile.fromAvailableArea(
      availableWidth: area.width,
      availableHeight: area.height,
      textScaleFactor: 1.3,
    );

    expect(scaled.rowHeight, closeTo(regular.rowHeight * 1.3, 0.01));
    expect(
      area.height ~/ scaled.rowHeight,
      lessThan(area.height ~/ regular.rowHeight),
      reason: 'a taller row means fewer of them fit',
    );
  });

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

    expect(regular.channelColumnWidth, closeTo(192, 0.0001));
    expect(
      scaled.channelColumnWidth,
      greaterThan(regular.channelColumnWidth),
      reason: 'accessibility text needs the rail to grow, within bounds',
    );
    expect(scaled.channelColumnWidth, lessThanOrEqualTo(250));
  });
}
