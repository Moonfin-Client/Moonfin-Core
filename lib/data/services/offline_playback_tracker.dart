import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../repositories/offline_repository.dart';

class OfflinePlaybackTracker {
  final OfflineRepository _repo;
  Timer? _progressTimer;
  StreamSubscription<Duration>? _positionSub;
  String? _activeItemId;
  Duration _lastPosition = Duration.zero;
  Duration _itemDuration = Duration.zero;
  bool _markedComplete = false;

  OfflinePlaybackTracker(this._repo);

  Future<void> startTracking({
    required String itemId,
    required Duration duration,
    required Stream<Duration> positionStream,
  }) async {
    // Await the previous session's cleanup (including its final DB write)
    // before setting up the new session.  Without this await, the old
    // stopTracking() would asynchronously null-out _activeItemId AFTER
    // we've already assigned the new one, causing every subsequent save
    // to silently no-op.
    await stopTracking();

    _activeItemId = itemId;
    _itemDuration = duration;
    _markedComplete = false;

    _positionSub = positionStream.listen((pos) => _lastPosition = pos);

    _progressTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      _saveProgress();
    });
  }

  Future<void> _saveProgress() async {
    if (_activeItemId == null) return;

    final manager = GetIt.instance<PlaybackManager>();
    final managerPos = manager.currentPlaybackPosition;
    final bestPosition =
        managerPos > _lastPosition ? managerPos : _lastPosition;

    if (bestPosition <= Duration.zero) return;

    if (!_markedComplete &&
        _itemDuration > Duration.zero &&
        bestPosition.inMilliseconds / _itemDuration.inMilliseconds > 0.9) {
      _markedComplete = true;
      await _repo.updatePlaybackPosition(_activeItemId!, 0);
      return;
    }

    if (!_markedComplete) {
      final ticks = bestPosition.inMicroseconds * 10;
      await _repo.updatePlaybackPosition(_activeItemId!, ticks);
    }
  }

  Future<void> stopTracking() async {
    _progressTimer?.cancel();
    _progressTimer = null;

    // Snapshot the best position BEFORE cancelling the stream subscription,
    // so _lastPosition is as fresh as possible for the final save.
    if (_activeItemId != null) {
      try {
        final manager = GetIt.instance<PlaybackManager>();
        final pos = manager.currentPlaybackPosition;
        if (pos > _lastPosition) {
          _lastPosition = pos;
        }
      } catch (_) {
        // GetIt may not have the manager registered yet during init.
      }
    }

    _positionSub?.cancel();
    _positionSub = null;

    await _saveProgress();
    _activeItemId = null;
    _lastPosition = Duration.zero;
    _itemDuration = Duration.zero;
    _markedComplete = false;
  }
}
