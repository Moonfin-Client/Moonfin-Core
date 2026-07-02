import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

enum SleepTimerMode {
  off,
  duration,
  endOfChapter,
}

/// Coordinates an audiobook sleep timer: countdown, end-of-chapter watch,
/// and the final pause.
///
/// Lives as a singleton via GetIt so the same timer survives navigation in and
/// out of the audiobook player.
class SleepTimerController extends ChangeNotifier {
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
    _mode = SleepTimerMode.endOfChapter;
    _chapterTargetMs = targetMs;
    _remaining = Duration(milliseconds: targetMs - currentPositionMs);
    _totalRequested = _remaining;
    _lastActiveMode = SleepTimerMode.endOfChapter;
    _lastActiveDuration = _remaining;
    _positionSub = _manager.state.positionStream.listen(_onPositionTick);
    _queueSub = _manager.queueService.queueChangedStream.listen((_) => cancel());
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
