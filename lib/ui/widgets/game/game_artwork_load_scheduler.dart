import 'dart:collection';

import 'package:flutter/foundation.dart';

/// Returns a row-aligned artwork queue with visible items first, followed by
/// surrounding rows expanding outward above and below the viewport.
List<int> gameArtworkLoadOrder({
  required int firstIndex,
  required int lastIndexExclusive,
  required int visibleFirstIndex,
  required int visibleLastIndexExclusive,
  required int crossAxisCount,
  required int surroundingRows,
}) {
  assert(crossAxisCount > 0);
  assert(surroundingRows >= 0);
  if (firstIndex >= lastIndexExclusive) return const [];

  final visibleStart = visibleFirstIndex
      .clamp(firstIndex, lastIndexExclusive - 1)
      .toInt();
  final visibleEnd = visibleLastIndexExclusive
      .clamp(visibleStart + 1, lastIndexExclusive)
      .toInt();
  final indexes = <int>[
    for (var index = visibleStart; index < visibleEnd; index++) index,
  ];

  for (var distance = 1; distance <= surroundingRows; distance++) {
    final aboveStart = visibleStart - distance * crossAxisCount;
    if (aboveStart >= firstIndex) {
      final aboveEnd = (aboveStart + crossAxisCount)
          .clamp(firstIndex, visibleStart)
          .toInt();
      for (var index = aboveStart; index < aboveEnd; index++) {
        indexes.add(index);
      }
    }

    final belowStart = visibleEnd + (distance - 1) * crossAxisCount;
    if (belowStart < lastIndexExclusive) {
      final belowEnd = (belowStart + crossAxisCount)
          .clamp(belowStart, lastIndexExclusive)
          .toInt();
      for (var index = belowStart; index < belowEnd; index++) {
        indexes.add(index);
      }
    }
  }
  return indexes;
}

/// Keeps game artwork ahead of the cache manager's non-cancellable FIFO.
///
/// Only a small active batch is submitted at once. Replacing the viewport
/// discards work that has not started, while callbacks from an older viewport
/// cannot advance the new queue.
class GameArtworkLoadScheduler extends ChangeNotifier {
  GameArtworkLoadScheduler({this.maxConcurrent = 4, this.maxFinished = 400})
    : assert(maxConcurrent > 0),
      assert(maxFinished > 0);

  final int maxConcurrent;

  /// Upper bound on remembered "already loaded" keys, so a long browse of a
  /// large library does not grow this set without limit. Only keys no longer in
  /// the viewport are evicted, so on-screen artwork is never dropped; a scrolled
  /// -back item simply re-requests (served from the image cache).
  final int maxFinished;
  final Set<String> _finished = <String>{};
  final Map<String, int> _active = <String, int>{};
  final Queue<String> _pending = Queue<String>();
  Set<String> _viewport = <String>{};
  int _generation = 0;

  bool get hasViewport => _viewport.isNotEmpty;

  @visibleForTesting
  int get finishedCount => _finished.length;

  bool isEnabled(String key) =>
      _viewport.contains(key) &&
      (_finished.contains(key) || _active.containsKey(key));

  int? generationFor(String key) => _active[key];

  void showViewport(Iterable<String> keys, {String? priorityKey}) {
    final viewport = LinkedHashSet<String>.of(keys);
    if (setEquals(_viewport, viewport)) return;

    _generation++;
    _viewport = viewport;
    _active.clear();
    _pending.clear();

    if (priorityKey != null &&
        viewport.contains(priorityKey) &&
        !_finished.contains(priorityKey)) {
      _pending.add(priorityKey);
    }
    for (final key in viewport) {
      if (key != priorityKey && !_finished.contains(key)) {
        _pending.add(key);
      }
    }

    _pump();
    notifyListeners();
  }

  void markFinished(String key, int generation) {
    if (_active[key] != generation) return;
    _active.remove(key);
    _finished.add(key);
    _pump();
    _trimFinished();
    notifyListeners();
  }

  /// Evicts the oldest finished keys that are no longer visible once the set
  /// exceeds [maxFinished]. Iterating a plain [Set] yields insertion order, so
  /// this drops the least-recently-finished off-screen entries first and never
  /// an entry still in the viewport.
  void _trimFinished() {
    final overflow = _finished.length - maxFinished;
    if (overflow <= 0) return;
    final toEvict = <String>[];
    for (final key in _finished) {
      if (_viewport.contains(key)) continue;
      toEvict.add(key);
      if (toEvict.length >= overflow) break;
    }
    _finished.removeAll(toEvict);
  }

  void clearViewport() {
    if (_viewport.isEmpty && _active.isEmpty && _pending.isEmpty) return;
    _generation++;
    _viewport = <String>{};
    _active.clear();
    _pending.clear();
    notifyListeners();
  }

  void _pump() {
    while (_active.length < maxConcurrent && _pending.isNotEmpty) {
      final key = _pending.removeFirst();
      _active[key] = _generation;
    }
  }
}
