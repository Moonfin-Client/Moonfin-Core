import 'trickplay_info.dart';

class TrickplayPrefetchPlanner {
  const TrickplayPrefetchPlanner._();

  /// Scrubbing carries on the way it started, so the run ahead is the longer.
  static const _stepsAhead = 6;
  static const _stepsBehind = 2;

  /// Resolve actual seek destinations, including irregular timestamped frames.
  /// A set keeps sprite sheets shared by multiple destinations from repeating.
  static List<int> planSeekImageIndexes({
    required TrickplayInfo info,
    required Duration position,
    required Duration totalDuration,
    required int forwardStepMs,
    required int backwardStepMs,
    required bool directionForward,
  }) {
    if (!info.isValid || totalDuration <= Duration.zero) return const [];
    final lastMs = totalDuration.inMilliseconds - 1;
    final indexes = <int>{};
    void addPosition(int offsetMs) {
      final target = (position.inMilliseconds + offsetMs).clamp(0, lastMs);
      indexes.add(info.resolveTile(Duration(milliseconds: target)).imageIndex);
    }

    final forward = forwardStepMs < 1 ? 1 : forwardStepMs;
    final backward = backwardStepMs < 1 ? 1 : backwardStepMs;
    addPosition(0);
    for (var step = 1; step <= _stepsAhead; step++) {
      addPosition(step * (directionForward ? forward : -backward));
    }
    for (var step = 1; step <= _stepsBehind; step++) {
      addPosition(step * (directionForward ? -backward : forward));
    }
    return indexes.toList();
  }

  static int _lastSheetIndex(TrickplayInfo info, Duration totalDuration) {
    final lastMs = (totalDuration.inMilliseconds - 1).clamp(
      0,
      totalDuration.inMilliseconds,
    );
    return info.resolveTile(Duration(milliseconds: lastMs)).imageIndex;
  }

  static List<int> planImageIndexes({
    required TrickplayInfo info,
    required Duration position,
    required Duration totalDuration,
    required bool directionForward,
    int sheetsAhead = 2,
  }) {
    final currentIndex = info.resolveTile(position).imageIndex;
    final lastIndex = _lastSheetIndex(info, totalDuration);
    final indexes = <int>[];
    for (var i = 1; i <= sheetsAhead; i++) {
      final target = directionForward ? currentIndex + i : currentIndex - i;
      if (target < 0 || target > lastIndex) break;
      indexes.add(target);
    }
    return indexes;
  }

  static List<int> planAllImageIndexes({
    required TrickplayInfo info,
    required Duration position,
    required Duration totalDuration,
    int maxSheets = 128,
  }) {
    final currentIndex = info.resolveTile(position).imageIndex;
    final lastIndex = _lastSheetIndex(info, totalDuration);
    final all = List.generate(lastIndex + 1, (i) => i);
    all.sort(
      (a, b) => (a - currentIndex).abs().compareTo((b - currentIndex).abs()),
    );
    return all.length > maxSheets ? all.sublist(0, maxSheets) : all;
  }

  /// The size to decode a trickplay sheet at so that two sheets fit in an
  /// image cache of [cacheBytes]: the current one and the one a scrub heads
  /// into. JPEG decodes directly at whole eighths, so only those are tried;
  /// any other size would add a full resize after the decode.
  ///
  /// Returns null when an input is below 1, or when not even one eighth fits.
  /// The full size is returned when two full sheets fit.
  static ({int width, int height})? planSheetDecodeSize({
    required int sheetWidth,
    required int sheetHeight,
    required int cacheBytes,
  }) {
    if (sheetWidth < 1 || sheetHeight < 1 || cacheBytes < 1) return null;
    for (var eighths = 8; eighths >= 1; eighths--) {
      if ((sheetWidth * eighths) % 8 != 0 || (sheetHeight * eighths) % 8 != 0) {
        continue;
      }
      final width = sheetWidth * eighths ~/ 8;
      final height = sheetHeight * eighths ~/ 8;
      if (2 * width * height * 4 <= cacheBytes) {
        return (width: width, height: height);
      }
    }
    return null;
  }

  /// Whether the playback keep should hold the next sheet rather than the
  /// previous one. Only two sheets fit, so one neighbor of the current sheet
  /// is always unheld. A held key moves one skip step per key repeat in either
  /// direction, so the keep holds the neighbor a held key would reach in fewer
  /// repeats: the previous sheet while the previous boundary is fewer back
  /// steps away than the next boundary is forward steps away, and the next
  /// sheet from there on. Both directions then get the same time for a load.
  ///
  /// Returns true, the way playback looked before this rule, when there are
  /// no sheets to hold or a step is below 1. The first sheet holds the next
  /// one and the last sheet holds the previous one.
  static bool planPlaybackKeepForward({
    required TrickplayInfo info,
    required Duration position,
    required Duration totalDuration,
    required int forwardStepMs,
    required int backwardStepMs,
  }) {
    if (!info.isValid ||
        info.usesIndividualFrames ||
        totalDuration <= Duration.zero ||
        forwardStepMs < 1 ||
        backwardStepMs < 1) {
      return true;
    }
    final lastMs = totalDuration.inMilliseconds - 1;
    final positionMs = position.inMilliseconds.clamp(0, lastMs);
    final index = info
        .resolveTile(Duration(milliseconds: positionMs))
        .imageIndex;
    final sheetMs = info.interval * info.tilesPerImage;
    final lastIndex = _lastSheetIndex(info, totalDuration);
    if (index == 0) return true;
    if (index >= lastIndex) return false;
    final sincePreviousMs = positionMs - index * sheetMs;
    final toNextMs = (index + 1) * sheetMs - positionMs;
    // Back steps to the previous boundary against forward steps to the next,
    // compared without dividing.
    return sincePreviousMs * forwardStepMs >= toNextMs * backwardStepMs;
  }
}
