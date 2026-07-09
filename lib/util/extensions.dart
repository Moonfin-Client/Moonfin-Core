extension StringExtensions on String {
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

extension DurationExtensions on Duration {
  /// Formats as HH:MM:SS or MM:SS.
  String get formatted {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}

extension ListExtensions<T> on List<T> {
  /// Pulls all items matching [test] (enabled) above items that don't (disabled),
  /// preserving their relative order.
  List<T> sortedEnabledAboveDisabled(bool Function(T) test) {
    final enabled = where(test).toList();
    final disabled = where((x) => !test(x)).toList();
    return [...enabled, ...disabled];
  }
}

