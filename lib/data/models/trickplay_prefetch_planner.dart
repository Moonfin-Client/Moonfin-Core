import 'trickplay_info.dart';

class TrickplayPrefetchPlanner {
  const TrickplayPrefetchPlanner._();

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
    all.sort((a, b) => (a - currentIndex).abs().compareTo((b - currentIndex).abs()));
    return all.length > maxSheets ? all.sublist(0, maxSheets) : all;
  }
}
