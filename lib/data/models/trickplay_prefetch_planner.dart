import 'trickplay_info.dart';

class TrickplayPrefetchPlanner {
  const TrickplayPrefetchPlanner._();

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

    final forward = forwardStepMs.clamp(1, 1 << 31);
    final backward = backwardStepMs.clamp(1, 1 << 31);
    addPosition(0);
    for (var step = 1; step <= 6; step++) {
      addPosition(step * (directionForward ? forward : -backward));
    }
    for (var step = 1; step <= 2; step++) {
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
}
