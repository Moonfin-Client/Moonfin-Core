import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

/// Manages the Skip button for Cinema Mode trailers.
class CinemaSkipController extends ChangeNotifier {
  CinemaSkipController({required Future<void> Function() onSkip})
      : _onSkip = onSkip;

  /// The button shows for this long, so only clips longer than that get one.
  static const _showFor = Duration(seconds: 10);

  final Future<void> Function() _onSkip;
  Timer? _hideTimer;
  Timer? _skipCooldown;
  Object? _queueItem;
  int _queueIndex = -1;
  int? _lastReadyToken;
  int? _previousReadyToken;
  Duration _duration = Duration.zero;
  int _generation = 0;
  bool _active = false;
  bool _enabled = false;
  bool _wanted = false;
  bool _playing = false;
  bool _skipping = false;

  int get generation => _generation;
  bool get enabled => _enabled;
  Duration get duration => _duration;
  bool get eligible => _active && _enabled && duration > _showFor;
  bool get visible => eligible && _wanted && !_skipping;

  void configure({required bool enabled}) {
    if (_enabled == enabled) return;
    _enabled = enabled;
    _restartTimer();
    notifyListeners();
  }

  /// Keeps the Skip button in sync with playback on Flutter and Apple TV.
  void synchronize({
    required Object? item,
    required int index,
    required Map<String, dynamic>? preroll,
    required String? itemId,
    required PlaybackBringupState source,
    required Duration duration,
    required bool playing,
  }) {
    // Changing the queue order shouldn't reset the current trailer.
    final playbackChanged =
        index != _queueIndex &&
        source.sessionToken != null &&
        source.sessionToken != _lastReadyToken &&
        source.itemId == itemId;
    if (!identical(item, _queueItem) || playbackChanged) {
      _previousReadyToken = _lastReadyToken;
      _queueItem = item;
      enter(preroll);
    }
    _queueIndex = index;
    // Ignore late ready events from the previous trailer, even if both
    // trailers have the same ID.
    if (preroll == null ||
        source.phase != PlaybackBringupPhase.ready ||
        source.itemId != itemId ||
        source.sessionToken == _previousReadyToken) {
      return;
    }
    _lastReadyToken = source.sessionToken;
    updatePlayback(duration: duration, playing: playing);
  }

  void enter(Map<String, dynamic>? item) {
    ++_generation;
    _hideTimer?.cancel();
    _hideTimer = null;
    _active = item != null;
    _wanted = _active;
    _playing = false;
    _skipping = false;
    final ticks = int.tryParse(item?['RunTimeTicks']?.toString() ?? '') ?? 0;
    _duration = ticks > 0
        ? Duration(microseconds: ticks ~/ 10)
        : Duration.zero;
    notifyListeners();
  }

  /// Only update playback when the ready event belongs to the current trailer.
  void updatePlayback({
    required Duration duration,
    required bool playing,
  }) {
    if (!_active) return;
    final wasVisible = visible;
    final wasPlaying = _playing;
    final oldDuration = _duration;
    if (duration > Duration.zero) _duration = duration;
    _playing = playing;
    if (wasVisible != visible || wasPlaying != playing) _restartTimer();
    if (oldDuration != this.duration || wasVisible != visible) {
      notifyListeners();
    }
  }

  void reveal() {
    if (!eligible || _skipping) return;
    final wasVisible = visible;
    _wanted = true;
    _restartTimer();
    if (!wasVisible) notifyListeners();
  }

  void hide() {
    if (!_wanted) return;
    _wanted = false;
    _hideTimer?.cancel();
    _hideTimer = null;
    notifyListeners();
  }

  void activate() {
    if (!eligible) return;
    if (visible) {
      skip();
    } else {
      reveal();
    }
  }

  /// Fast Forward still works when the trailer is too short for a Skip button
  /// or the button is hidden.
  void skip({bool requireVisible = true}) {
    if (!_active ||
        !_enabled ||
        _skipping ||
        (requireVisible && !visible) ||
        _skipCooldown?.isActive == true) {
      return;
    }
    // Keep the cooldown between trailers so two quick presses don't skip both.
    _skipCooldown = Timer(const Duration(milliseconds: 400), () {});
    _skipping = true;
    _hideTimer?.cancel();
    _hideTimer = null;
    final ticket = _generation;
    notifyListeners();
    unawaited(
      Future<void>.sync(_onSkip).catchError((Object _) {}).whenComplete(() {
        // Don't let a late Skip result affect the next trailer.
        if (ticket != _generation) return;
        _skipping = false;
        _restartTimer();
        notifyListeners();
      }),
    );
  }

  void _restartTimer() {
    _hideTimer?.cancel();
    _hideTimer = null;
    if (!visible || !_playing) return;
    _hideTimer = Timer(_showFor, hide);
  }

  @override
  void dispose() {
    ++_generation;
    _hideTimer?.cancel();
    _skipCooldown?.cancel();
    super.dispose();
  }
}
