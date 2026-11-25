import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';

enum SleepTimerMode {
  off,
  duration,
  endOfChapter,
  endOfItem,

  /// Lets the current video play out and autoplay into the next one, then
  /// becomes [endOfItem] for that one.
  endOfNextItem,
}

/// Coordinates the sleep timer shared by the audiobook, video and Live TV
/// players: countdown, end-of-chapter, end-of-item or end-of-next-item watch,
/// and the final pause.
///
/// Lives as a singleton via GetIt so the same timer survives navigation in and
/// out of a player, and keeps counting through next-episode autoplay.
class SleepTimerController extends ChangeNotifier {
  /// How far before the end an end-of-item timer pauses. Pausing on the last
  /// frame races the player's own completion, which autoplays the next
  /// episode and cancels this timer before it fires.
  static const endOfItemLeadMs = 2000;
  SleepTimerController(this._manager);

  final PlaybackManager _manager;
  final _expiryController = StreamController<void>.broadcast();

  Stream<void> get onExpired => _expiryController.stream;

  SleepTimerMode _mode = SleepTimerMode.off;
  Duration _remaining = Duration.zero;
  Duration _totalRequested = Duration.zero;
  Timer? _tick;
  StreamSubscription? _positionSub;
  StreamSubscription? _queueSub;
  int? _chapterTargetMs;

  SleepTimerMode _lastActiveMode = SleepTimerMode.off;
  Duration _lastActiveDuration = Duration.zero;

  bool _isPaused = false;

  SleepTimerMode get mode => _mode;
  Duration get remaining => _remaining;
  Duration get totalRequested => _totalRequested;
  bool get isActive => _mode != SleepTimerMode.off;
  bool get isPaused => _isPaused;

  SleepTimerMode get lastActiveMode => _lastActiveMode;
  Duration get lastActiveDuration => _lastActiveDuration;

  /// Start a countdown timer of [duration]; on expiry pauses playback.
  void startDuration(Duration duration) {
    cancel();
    if (duration <= Duration.zero) return;
    _mode = SleepTimerMode.duration;
    _totalRequested = duration;
    _remaining = duration;
    _lastActiveMode = SleepTimerMode.duration;
    _lastActiveDuration = duration;
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => _onTick());
    notifyListeners();
  }

  /// Stop playback when the current chapter ends.
  void startEndOfChapter({
    required List<int> chapterStartMsAscending,
    required int currentPositionMs,
    required int totalDurationMs,
  }) {
    cancel();
    final targetMs = _resolveNextChapterEndMs(
      chapterStartMsAscending,
      currentPositionMs,
      totalDurationMs,
    );
    if (targetMs == null || targetMs <= currentPositionMs) return;
    _watchUntil(SleepTimerMode.endOfChapter, targetMs, currentPositionMs);
  }

  /// Stop playback just before the current video ends, so autoplay never
  /// starts the next one. Does nothing when the item is already that close
  /// to its end.
  void startEndOfItem({
    required int currentPositionMs,
    required int totalDurationMs,
  }) {
    cancel();
    final targetMs = endOfItemTargetMs(currentPositionMs, totalDurationMs);
    if (targetMs == null) return;
    _watchUntil(
      SleepTimerMode.endOfItem,
      targetMs,
      currentPositionMs,
      itemId: _queueItemId(_manager.queueService.currentItem),
    );
  }

  /// Whether there's a next item queued for [startEndOfNextItem] to wait for.
  bool get canStopAtEndOfNextItem {
    final queue = _manager.queueService;
    // Repeat-all wrapping back to the first item isn't a next video.
    if (queue.currentIndex < 0 || queue.currentIndex >= queue.length - 1) {
      return false;
    }
    final nextId = _queueItemId(queue.peekNext);
    return nextId != null && nextId != _queueItemId(queue.currentItem);
  }

  /// Let the current video finish and autoplay into the next one, then stop
  /// just before that one ends. Moving anywhere but the next item cancels.
  void startEndOfNextItem({
    required int currentPositionMs,
    required int totalDurationMs,
  }) {
    cancel();
    if (!canStopAtEndOfNextItem) return;
    final currentId = _queueItemId(_manager.queueService.currentItem);
    final next = _manager.queueService.peekNext;
    final nextId = _queueItemId(next)!;
    final nextMs = _runtimeMs(next);
    _mode = SleepTimerMode.endOfNextItem;
    _lastActiveMode = SleepTimerMode.endOfNextItem;
    void estimate(int positionMs) {
      final left = totalDurationMs - positionMs + (nextMs ?? 0) - endOfItemLeadMs;
      _remaining = Duration(milliseconds: left < 0 ? 0 : left);
    }

    estimate(currentPositionMs);
    _totalRequested = _remaining;
    _lastActiveDuration = _remaining;
    _positionSub = _manager.state.positionStream.listen((pos) {
      if (_mode != SleepTimerMode.endOfNextItem) return;
      estimate(pos.inMilliseconds);
      notifyListeners();
    });
    _queueSub = _manager.queueService.queueChangedStream.listen((_) {
      final nowId = _queueItemId(_manager.queueService.currentItem);
      if (nowId == currentId) return;
      if (nowId != nextId) {
        cancel();
        return;
      }
      _watchNextItem(nextId, nextMs);
    });
    notifyListeners();
  }

  /// The next item is playing: stop at its end, from its runtime when the
  /// queue knows it, otherwise from the first duration the player reports.
  void _watchNextItem(String itemId, int? runtimeMs) {
    _positionSub?.cancel();
    _positionSub = null;
    _queueSub?.cancel();
    _queueSub = null;
    if (runtimeMs != null && runtimeMs > endOfItemLeadMs) {
      _watchUntil(
        SleepTimerMode.endOfItem,
        runtimeMs - endOfItemLeadMs,
        _manager.state.position.inMilliseconds,
        itemId: itemId,
      );
      return;
    }
    _positionSub = _manager.state.durationStream.listen((duration) {
      if (duration <= Duration.zero) return;
      _positionSub?.cancel();
      _positionSub = null;
      _watchUntil(
        SleepTimerMode.endOfItem,
        duration.inMilliseconds - endOfItemLeadMs,
        _manager.state.position.inMilliseconds,
        itemId: itemId,
      );
    });
  }

  /// Queue items are [AggregatedItem]s in the app and raw server maps in
  /// some callers, so both are read.
  static String? _queueItemId(dynamic item) {
    final id = switch (item) {
      AggregatedItem() => item.id,
      Map() => (item['Id'] ?? item['id'])?.toString(),
      _ => null,
    };
    return id == null || id.isEmpty ? null : id;
  }

  static int? _runtimeMs(dynamic item) {
    final ticks = switch (item) {
      AggregatedItem() => item.runTimeTicks,
      Map() => item['RunTimeTicks'],
      _ => null,
    };
    return ticks is num && ticks > 0 ? ticks ~/ 10000 : null;
  }

  /// Where an end-of-item timer pauses, or null when there's no room left
  /// before the end to set one.
  static int? endOfItemTargetMs(int currentPositionMs, int totalDurationMs) {
    final targetMs = totalDurationMs - endOfItemLeadMs;
    return targetMs > currentPositionMs ? targetMs : null;
  }

  /// Follows the playback position until it reaches [targetMs]. A queue
  /// change means the viewer moved on to something else, so it cancels,
  /// unless [itemId] is given and is still the item playing (a queue edit
  /// such as more episodes being added).
  void _watchUntil(
    SleepTimerMode mode,
    int targetMs,
    int currentPositionMs, {
    String? itemId,
  }) {
    _mode = mode;
    _chapterTargetMs = targetMs;
    _remaining = Duration(milliseconds: targetMs - currentPositionMs);
    _totalRequested = _remaining;
    _lastActiveMode = mode;
    _lastActiveDuration = _remaining;
    _positionSub = _manager.state.positionStream.listen(_onPositionTick);
    _queueSub = _manager.queueService.queueChangedStream.listen((_) {
      if (itemId != null &&
          _queueItemId(_manager.queueService.currentItem) == itemId) {
        return;
      }
      cancel();
    });
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isPaused || !_manager.state.isPlaying) return;
      final next = _remaining - const Duration(seconds: 1);
      _remaining = next < Duration.zero ? Duration.zero : next;
      notifyListeners();
    });
    notifyListeners();
  }

  void cancel() {
    _tick?.cancel();
    _tick = null;
    _positionSub?.cancel();
    _positionSub = null;
    _queueSub?.cancel();
    _queueSub = null;
    _chapterTargetMs = null;
    _mode = SleepTimerMode.off;
    _remaining = Duration.zero;
    _totalRequested = Duration.zero;
    _isPaused = false;
    notifyListeners();
  }

  void pauseTimer() {
    if (!isActive) return;
    _isPaused = true;
    notifyListeners();
  }

  void resumeTimer() {
    if (!isActive) return;
    _isPaused = false;
    notifyListeners();
  }

  void addMinutes(int minutes) {
    if (_mode != SleepTimerMode.duration) return;
    _remaining += Duration(minutes: minutes);
    _totalRequested += Duration(minutes: minutes);
    notifyListeners();
  }

  static int? _resolveNextChapterEndMs(
    List<int> chapterStartMsAscending,
    int currentPositionMs,
    int totalDurationMs,
  ) {
    if (chapterStartMsAscending.isEmpty) return totalDurationMs;
    for (final start in chapterStartMsAscending) {
      if (start > currentPositionMs + 1500) return start;
    }
    return totalDurationMs;
  }

  void _onTick() {
    if (_isPaused || !_manager.state.isPlaying) return;
    _remaining = _remaining - const Duration(seconds: 1);
    if (_remaining <= Duration.zero) {
      _completeAndStop();
      return;
    }
    notifyListeners();
  }

  void _onPositionTick(Duration pos) {
    if (_isPaused || !_manager.state.isPlaying) return;
    final target = _chapterTargetMs;
    if (target == null) return;
    final remainingMs = target - pos.inMilliseconds;
    _remaining = Duration(milliseconds: remainingMs < 0 ? 0 : remainingMs);
    notifyListeners();
    if (remainingMs <= 0) {
      _completeAndStop();
    }
  }

  void _completeAndStop() {
    try {
      unawaited(_manager.pause());
    } catch (_) {}
    _expiryController.add(null);
    cancel();
  }

  @override
  void dispose() {
    cancel();
    _expiryController.close();
    super.dispose();
  }
}
