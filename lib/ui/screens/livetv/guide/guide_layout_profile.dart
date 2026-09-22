import 'dart:math' as math;

/// The padding the guide puts above its content. The mini player keeps the
/// roomier inset because its frame is already holding the guide off the edge.
double guideContentTopInset({
  required bool landscape,
  required bool miniPlayerMode,
}) => landscape && !miniPlayerMode ? 8.0 : 20.0;

/// The padding down the guide's leading edge.
const double guideContentLeftInset = 24.0;

/// The padding under the guide's content.
const double guideContentBottomInset = 16.0;

/// The area [GuideLayoutProfile] measures, given the box the guide was handed.
///
/// The screen and the test that checks its arrangement both need this, so the
/// insets are worked out here rather than written onto both sides, where they
/// drift apart and the test starts agreeing with itself instead of the screen.
({double width, double height}) guideAvailableArea({
  required double maxWidth,
  required double maxHeight,
  required bool landscape,
  required bool miniPlayerMode,
}) => (
  // The trailing edge gives up a little on a box taller than it is wide,
  // where width is the scarce axis.
  width: maxWidth - guideContentLeftInset - (maxWidth >= maxHeight ? 24 : 16),
  height:
      maxHeight -
      guideContentTopInset(
        landscape: landscape,
        miniPlayerMode: miniPlayerMode,
      ) -
      guideContentBottomInset,
);

/// Logical dimensions used to keep the guide readable across available areas.
class GuideLayoutProfile {
  static const Duration minGuideWindow = Duration(minutes: 150);
  static const Duration maxGuideWindow = Duration(hours: 6);
  static const int _slotMinutes = 30;

  /// The density that makes a 30-minute cell wide enough to read a title at
  /// ten feet: about 179 points on the canvas a television lays out on, which
  /// the panel paints at roughly 259.
  ///
  /// Points aren't the thing being aimed at here, painted pixels are, and the
  /// two only line up on that canvas. A value tuned against whatever size a
  /// panel happens to report lands at a different painted width on every
  /// other panel.
  static const double _targetPixelsPerMinute = 6.2;

  /// One channel row, with the interface text size already in it. A row
  /// carries a title over a metadata line and has to grow with them.
  final double rowHeight;
  final double channelColumnWidth;
  final double pixelsPerMinute;
  final double timeHeaderHeight;
  final int targetSlots;
  final Duration guideWindow;

  const GuideLayoutProfile({
    required this.rowHeight,
    required this.channelColumnWidth,
    required this.pixelsPerMinute,
    required this.timeHeaderHeight,
    required this.targetSlots,
    required this.guideWindow,
  });

  /// Derives guide dimensions from logical layout constraints and text scale.
  factory GuideLayoutProfile.fromAvailableArea({
    required double availableWidth,
    required double availableHeight,
    double textScaleFactor = 1.0,
  }) {
    final width = math.max(1.0, availableWidth);
    final scale = math.max(1.0, textScaleFactor);
    final height = math.max(1.0, availableHeight);
    final heightProgress = ((height - 320) / 480).clamp(0.0, 1.0);
    // The rail is content-sized rather than taking a fifth of every display.
    // A bounded text-scale allowance preserves room for accessibility text
    // without allowing the rail to consume a wide browser or television.
    //
    // The ceiling has to sit above the share on the canvas a television lays
    // out on, or the share never gets a say there and the rail is whatever
    // the ceiling happens to be.
    final baseChannelWidth = (width * 0.16).clamp(144.0, 208.0);
    final channelColumnWidth = (baseChannelWidth * scale.clamp(1.0, 1.2)).clamp(
      144.0,
      250.0,
    );
    final guideWidth = math.max(1.0, width - channelColumnWidth);
    final minSlots = minGuideWindow.inMinutes ~/ _slotMinutes;
    final maxSlots = maxGuideWindow.inMinutes ~/ _slotMinutes;
    final targetSlots = (guideWidth / (_targetPixelsPerMinute * _slotMinutes))
        .round()
        .clamp(minSlots, maxSlots);
    final guideWindow = Duration(minutes: targetSlots * _slotMinutes);

    // Both of the text-bearing dimensions take the interface size in full,
    // where the rail above is bounded. A rail that grows takes its width out
    // of the guide beside it, so it has somewhere to stop. A row that grows
    // only costs another row, and capping it would clip the very text the
    // larger size was set to read.
    return GuideLayoutProfile(
      rowHeight: (50 + (12 * heightProgress)) * scale,
      channelColumnWidth: channelColumnWidth,
      pixelsPerMinute: guideWidth / guideWindow.inMinutes,
      timeHeaderHeight: (22 + (2 * heightProgress)) * scale,
      targetSlots: targetSlots,
      guideWindow: guideWindow,
    );
  }
}
