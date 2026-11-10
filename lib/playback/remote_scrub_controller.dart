import 'dart:async';
import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../util/focus/dpad_keys.dart';

/// Which way a scrub runs.
enum RemoteScrubDirection { forward, backward }

/// Scrubs with a TV remote's Left and Right keys, at rising speeds.
///
/// A press released before [holdDelay] is a click: it skips by the set length
/// and playback goes on, whether the controls were up or hidden. A press held
/// past it starts a scrub at level 1, and while the key stays down the scrub
/// climbs one level every [stepEvery], up to the top level. At the start or
/// the end the scrub stops.
///
/// Every step moves the scrub target by [step], which is one preview picture,
/// so the preview shows every picture even at the top level. The level only
/// sets how often a step lands: [step] divided by the level's speed. One step
/// lands at once when the scrub starts. A level change keeps the clock's
/// phase: the first step at the new level lands one new period after the last
/// step, or at once if that time has passed, then one every period. A clock
/// that runs late catches up the periods it missed, one picture each.
///
/// Letting go of the key stops the scrub and the player treats the release as
/// it does today, unless [runOn] is set. Then the scrub keeps running after
/// release. Each further press the same way goes one level faster, the other
/// way one level slower, and from level 1 it turns around. A key kept down
/// counts as another press every [stepEvery], so a hold climbs a level a
/// second. Letting go keeps the scrub running at its level, unless the key was
/// held until it reached the top level: then the release stops the scrub where
/// it is, and the player treats the release as it does today. Presses that
/// reach the top level keep it running there. Fast forward and Rewind change
/// the level too. At the start or the end the scrub stops and waits. OK or Play
/// finishes it and plays, Pause finishes it paused, and the player drops it on
/// Back.
///
/// It never seeks: a scrub moves the player's pending scrub target through
/// [onStep], so the player seeks once, when the scrub ends. A click goes
/// through [onSkip].
class RemoteScrubController extends ChangeNotifier {
  RemoteScrubController({
    required this.enabled,
    required this.runOn,
    required this.step,
    required this.skipForward,
    required this.skipBack,
    required this.position,
    required this.duration,
    required this.onReveal,
    required this.onSkip,
    required this.onStep,
    required this.onFinish,
  });

  /// Longer than Android's 400 ms long press, so a quick click never scrubs.
  static const holdDelay = Duration(milliseconds: 600);

  /// Seconds of video per second at each level.
  static const speeds = <int>[32, 64, 128, 256, 400];

  /// How long a key stays down for each level climbed.
  static const stepEvery = Duration(seconds: 1);

  static const _fastestPeriod = Duration(milliseconds: 1);

  /// Whether the scrub applies.
  final ValueGetter<bool> enabled;

  /// Whether a scrub keeps running after release. Read at each press and
  /// release.
  final ValueGetter<bool> runOn;

  /// Milliseconds of video per step: one preview picture.
  final ValueGetter<int> step;
  final ValueGetter<int> skipForward;
  final ValueGetter<int> skipBack;

  /// Where the scrub target is.
  final ValueGetter<Duration> position;
  final ValueGetter<Duration> duration;

  /// Shows the controls for a press that began with them hidden.
  final VoidCallback onReveal;

  /// Skips by a click's milliseconds.
  final ValueChanged<int> onSkip;

  /// Moves the scrub target by milliseconds, for a scrub only.
  final ValueChanged<int> onStep;

  /// Finishes the scrub and plays, or stays paused when false.
  final ValueChanged<bool> onFinish;

  RemoteScrubDirection? _direction;
  int _level = 0;
  Duration _length = Duration.zero;
  Timer? _clock;
  Stopwatch? _watch;
  Duration _period = _fastestPeriod;

  /// Where the last step of the previous level sat on [_watch], in
  /// microseconds. The steps of the current level fall one period apart from
  /// here: step n + 1 is due at `_origin + (n + 1) * _period`.
  int _origin = 0;

  /// Steps taken at the current level since [_origin].
  int _taken = 0;
  Timer? _holdTimer;
  Timer? _stepTimer;
  RemoteScrubDirection? _pressed;
  bool _pressIsClick = false;
  bool _pressHitTop = false;

  bool get isScrubbing => _direction != null;
  RemoteScrubDirection? get direction => _direction;

  /// 1 to [speeds].length, or 0 while stopped.
  int get level => _level;

  /// Whether the scrub is stopped at the start or the end.
  bool get atEnd =>
      isScrubbing &&
      _level == 0 &&
      (position() <= Duration.zero || position() >= _length);

  /// Whether the player should leave [event] to [handleKey].
  bool takes(KeyEvent event) =>
      enabled() &&
      ((isScrubbing && runOn()) ||
          event.logicalKey.isLeftKey ||
          event.logicalKey.isRightKey);

  /// Acts on [event] and says whether the scrub took it.
  bool handleKey(
    KeyEvent event, {
    required bool onSeekbar,
    required bool controlsVisible,
  }) {
    if (!enabled()) return false;
    final key = event.logicalKey;
    final direction = key.isRightKey
        ? RemoteScrubDirection.forward
        : key.isLeftKey
        ? RemoteScrubDirection.backward
        : null;

    if (direction != null) {
      if (event is KeyUpEvent) {
        // A stray release, of a key pressed during another's hold.
        if (_pressed != direction) return isScrubbing;
        _cancelPress();
        if (_pressIsClick) {
          final forward = direction == RemoteScrubDirection.forward;
          final ms = forward ? skipForward() : -skipBack();
          onSkip(ms);
          return false;
        }
        if (runOn() && isScrubbing) {
          if (_pressHitTop) {
            // A hold that reached the top level stops where it is; the player
            // treats the release as today.
            _stopClock();
            return false;
          }
          return true;
        }
        // The player's release logic decides what follows.
        stop();
        return false;
      }
      if (event is KeyRepeatEvent) return _pressed == direction || isScrubbing;
      if (!runOn() && _pressed != null) return true;
      if (!isScrubbing && controlsVisible && !onSeekbar) return false;
      _pressed = direction;
      if (isScrubbing) {
        _pressIsClick = false;
        _changeLevel(direction);
        _startSteps();
        return true;
      }
      _pressIsClick = true;
      _holdTimer?.cancel();
      _holdTimer = Timer(holdDelay, _startHold);
      if (!controlsVisible) onReveal();
      return true;
    }

    if (!isScrubbing || !runOn()) return false;
    final play =
        key.isSelectKey ||
        key == LogicalKeyboardKey.mediaPlay ||
        key == LogicalKeyboardKey.mediaPlayPause ||
        key == LogicalKeyboardKey.space;
    final owned =
        play ||
        key == LogicalKeyboardKey.mediaPause ||
        key == LogicalKeyboardKey.mediaFastForward ||
        key == LogicalKeyboardKey.mediaRewind ||
        key.isUpKey ||
        key.isDownKey;
    // Back is left to the player, which drops the scrub.
    if (!owned || event is KeyUpEvent) return false;
    if (event is KeyRepeatEvent) return true;
    if (key == LogicalKeyboardKey.mediaFastForward) {
      _changeLevel(RemoteScrubDirection.forward);
    } else if (key == LogicalKeyboardKey.mediaRewind) {
      _changeLevel(RemoteScrubDirection.backward);
    } else if (play || key == LogicalKeyboardKey.mediaPause) {
      onFinish(play);
    }
    return true;
  }

  /// Ends the scrub and any press in progress. Safe to call at any time.
  void stop() {
    final was = isScrubbing;
    _cancelPress();
    _stopTimers();
    _direction = null;
    _level = 0;
    if (was) notifyListeners();
  }

  @override
  void dispose() {
    _cancelPress();
    _stopTimers();
    super.dispose();
  }

  void _cancelPress() {
    _holdTimer?.cancel();
    _holdTimer = null;
    _stepTimer?.cancel();
    _stepTimer = null;
    _pressed = null;
  }

  void _stopTimers() {
    _clock?.cancel();
    _clock = null;
    _watch = null;
  }

  void _startHold() {
    _holdTimer = null;
    final pressed = _pressed;
    final length = duration();
    // With no length there is nothing to scrub, so the press stays a click.
    if (pressed == null || length <= Duration.zero || !enabled()) return;
    _pressIsClick = false;
    _direction = pressed;
    _length = length;
    _begin();
    _startSteps();
    notifyListeners();
  }

  /// Starts moving at level 1: one step at once, then the clock. A fresh
  /// stopwatch and origin, so no earlier scrub's phase makes steps catch up.
  void _begin() {
    _level = 1;
    _watch = clock.stopwatch()..start();
    _origin = 0;
    _taken = 0;
    _stepOnce();
    if (_level > 0) _startClock();
  }

  /// Counts the key held down: every [stepEvery] is one more press.
  void _startSteps() {
    _pressHitTop = false;
    _stepTimer?.cancel();
    _stepTimer = Timer.periodic(stepEvery, (_) {
      final pressed = _pressed;
      // A key held into an end changes nothing, so the pill does not flicker.
      if (pressed == null || _level == 0) return;
      _changeLevel(pressed);
      if (_level == speeds.length) _pressHitTop = true;
    });
  }

  void _changeLevel(RemoteScrubDirection to) {
    final was = (_direction, _level);
    if (_level == 0) {
      _direction = to;
      _begin();
    } else if (to == _direction) {
      _level = min(_level + 1, speeds.length);
    } else if (_level > 1) {
      _level -= 1;
    } else {
      _direction = to;
    }
    final moved = _level != was.$2;
    if (moved && was.$2 != 0 && _level > 0) _startClock();
    if ((_direction, _level) != was) notifyListeners();
  }

  /// Moves the clock to the current level's period, keeping its phase: the
  /// last step stays where it was, and the next lands one new period after it.
  void _startClock() {
    _clock?.cancel();
    _origin += _taken * _period.inMicroseconds;
    _taken = 0;
    final micros = _stepMs() * 1000 ~/ speeds[_level - 1];
    _period = Duration(
      microseconds: max(micros, _fastestPeriod.inMicroseconds),
    );
    // A step that fell due before the change lands now.
    _onTick();
    _arm();
  }

  /// Wakes the clock for the next due step, rounded up to a whole millisecond
  /// so a timer never wakes early.
  void _arm() {
    final watch = _watch;
    if (watch == null || _level == 0) return;
    final nextAt = _origin + (_taken + 1) * _period.inMicroseconds;
    final wait = max(nextAt - watch.elapsedMicroseconds, 0);
    _clock = Timer(Duration(milliseconds: (wait + 999) ~/ 1000), () {
      _onTick();
      _arm();
    });
  }

  void _stopClock() {
    _level = 0;
    _stopTimers();
    notifyListeners();
  }

  int _stepMs() {
    final ms = step();
    return ms > 0 ? ms : 10000;
  }

  void _onTick() {
    final watch = _watch;
    if (watch == null || _level == 0) return;
    // Counting periods from the origin, not timer fires, so a timer that ran
    // late takes the steps it missed.
    final due =
        (watch.elapsedMicroseconds - _origin) ~/ _period.inMicroseconds -
        _taken;
    for (var i = 0; i < due && _level > 0; i++) {
      _taken += 1;
      _stepOnce();
    }
  }

  /// Moves the target by one step and stops at the start or the end.
  void _stepOnce() {
    final forward = _direction == RemoteScrubDirection.forward;
    final ms = _stepMs();
    onStep(forward ? ms : -ms);
    if (!isScrubbing) return;
    final at = position();
    // The scrub stays open at an end, waiting for a press or a finish key.
    if (forward ? at >= _length : at <= Duration.zero) _stopClock();
  }
}
