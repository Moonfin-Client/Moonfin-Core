import 'dart:math' as math;

/// Logical dimensions used to keep the guide readable across available areas.
class GuideLayoutProfile {
  static const Duration minGuideWindow = Duration(minutes: 150);
  static const Duration maxGuideWindow = Duration(hours: 6);
  static const int _slotMinutes = 30;

  /// The density that makes a 30-minute cell roughly 154 logical pixels wide,
  /// matching the useful density of the 1080p Android TV guide.
  static const double _targetPixelsPerMinute = 5.12;

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
    final densityHeight = math.max(1.0, availableHeight) / scale;
    final heightProgress = ((densityHeight - 320) / 480).clamp(0.0, 1.0);
    // The rail is content-sized rather than taking a fifth of every display.
    // A bounded text-scale allowance preserves room for accessibility text
    // without allowing the rail to consume a wide browser or television.
    final baseChannelWidth = (width * 0.16).clamp(144.0, 168.0);
    final channelColumnWidth = (baseChannelWidth * scale.clamp(1.0, 1.2)).clamp(
      144.0,
      200.0,
    );
    final guideWidth = math.max(1.0, width - channelColumnWidth);
    final minSlots = minGuideWindow.inMinutes ~/ _slotMinutes;
    final maxSlots = maxGuideWindow.inMinutes ~/ _slotMinutes;
    final targetSlots = (guideWidth / (_targetPixelsPerMinute * _slotMinutes))
        .round()
        .clamp(minSlots, maxSlots);
    final guideWindow = Duration(minutes: targetSlots * _slotMinutes);

    return GuideLayoutProfile(
      rowHeight: 50 + (6 * heightProgress),
      channelColumnWidth: channelColumnWidth,
      pixelsPerMinute: guideWidth / guideWindow.inMinutes,
      timeHeaderHeight: 22 + (2 * heightProgress),
      targetSlots: targetSlots,
      guideWindow: guideWindow,
    );
  }
}
