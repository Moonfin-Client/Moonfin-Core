/// A subtitle the viewer picked before its file was added to the player,
/// held until the add for the same source finishes.
class PendingSubtitleChoice {
  int _source = 0;
  ({String url, bool Function() isCurrent, Future<void> Function() select})?
  _held;

  /// Counts sources, so an add can say which one registered its file.
  int get source => _source;

  /// A new source drops whatever the last one was still waiting for.
  void nextSource() {
    _source++;
    _held = null;
  }

  void hold(
    String url, {
    required bool Function() isCurrent,
    required Future<void> Function() select,
  }) {
    _held = (url: url, isCurrent: isCurrent, select: select);
  }

  /// Applies the held choice once [url] has been added for [source]. An add
  /// from an earlier source can finish after the next one starts, and that
  /// one must not consume a choice it never registered.
  Future<void> added(String url, int source) async {
    if (source != _source) return;
    final held = _held;
    if (held == null || held.url != url) return;
    _held = null;
    if (held.isCurrent()) await held.select();
  }
}
