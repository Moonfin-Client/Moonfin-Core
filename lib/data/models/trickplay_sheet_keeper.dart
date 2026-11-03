/// Which trickplay sheets may be asked for now. A sheet whose load failed
/// is held back for [retryAfter], so a scrub sending twenty key events a
/// second does not resend a failing request on each one.
class TrickplaySheetKeeper {
  TrickplaySheetKeeper({this.retryAfter = const Duration(seconds: 15)});

  /// How long a sheet is held back after its load failed.
  final Duration retryAfter;

  /// The time of the last failed load for each sheet index.
  final Map<int, DateTime> _failedAt = {};

  /// Whether the sheet at [index] may be asked for at [now]. False for a
  /// negative index, or while a recent failure holds the sheet back; true
  /// exactly [retryAfter] after the failure.
  bool mayRequest(int index, DateTime now) {
    if (index < 0) return false;
    final failedAt = _failedAt[index];
    if (failedAt == null) return true;
    return !now.isBefore(failedAt.add(retryAfter));
  }

  /// Records that the load of the sheet at [index] failed at [now].
  void failed(int index, DateTime now) {
    _failedAt[index] = now;
  }

  /// Records that the sheet at [index] loaded, clearing any earlier failure.
  void loaded(int index) {
    _failedAt.remove(index);
  }

  /// Forgets every failure, for a new item.
  void reset() {
    _failedAt.clear();
  }
}
