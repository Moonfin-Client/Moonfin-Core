import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter_tvos/flutter_tvos.dart'
    show TvRemoteController, TvRemoteTouchEvent, TvRemoteTouchPhase;

import 'gamepad/gamepad_key_synthesizer.dart';

/// Turns Siri Remote touchpad gestures into focus navigation. Focus steps one
/// item at a time as the finger travels and stops when the finger does, so a
/// drag moves the same number of items however fast it was made.
///
/// The engine's own swipe detectors are switched off by config, since one
/// emits a single arrow per gesture and the other latches while the finger
/// rests and runs focus away. Clicks and buttons stay native. Steps go out as
/// real arrow key events through [GamepadKeySynthesizer], so every existing
/// key handler and focus widget behaves exactly as it does for a click.
///
/// While a native view controller covers Flutter the engine stops forwarding
/// touches, so this layer goes quiet on its own.
class SiriRemoteGlide {
  SiriRemoteGlide._();

  static final SiriRemoteGlide instance = SiriRemoteGlide._();

  /// Finger travel in normalized pad units before the first focus step. The
  /// pad is 2.0 units across, so a full slow drag moves about five items.
  static const double _firstStepTravel = 0.28;

  /// Travel between steps after the first.
  static const double _stepTravel = 0.36;

  final GamepadKeySynthesizer _synthesizer = GamepadKeySynthesizer();

  bool _attached = false;
  bool _touching = false;
  double _lastX = 0;
  double _lastY = 0;
  double _accX = 0;
  double _accY = 0;
  bool _steppedThisGesture = false;

  void attach() {
    if (_attached) return;
    _attached = true;
    TvRemoteController.instance.addRawListener(_onTouch);
  }

  @visibleForTesting
  void debugReset() {
    _synthesizer.releaseAll();
    _touching = false;
  }

  @visibleForTesting
  void debugHandleTouch(TvRemoteTouchEvent event) => _onTouch(event);

  void _onTouch(TvRemoteTouchEvent event) {
    switch (event.phase) {
      case TvRemoteTouchPhase.started:
        _beginGesture(event.x, event.y);
      case TvRemoteTouchPhase.move:
        if (!_touching) {
          _beginGesture(event.x, event.y);
          return;
        }
        _onMove(event.x, event.y);
      case TvRemoteTouchPhase.ended:
      case TvRemoteTouchPhase.cancelled:
        _touching = false;
      case TvRemoteTouchPhase.loc:
      case TvRemoteTouchPhase.clickStart:
      case TvRemoteTouchPhase.clickEnd:
        break;
    }
  }

  void _beginGesture(double x, double y) {
    _touching = true;
    _lastX = x;
    _lastY = y;
    _accX = 0;
    _accY = 0;
    _steppedThisGesture = false;
  }

  void _onMove(double x, double y) {
    final dx = x - _lastX;
    final dy = y - _lastY;
    _lastX = x;
    _lastY = y;

    // A reversal replaces the accumulator instead of unwinding it, so
    // changing direction mid drag responds immediately.
    _accX = dx.sign != 0 && dx.sign != _accX.sign ? dx : _accX + dx;
    _accY = dy.sign != 0 && dy.sign != _accY.sign ? dy : _accY + dy;

    final threshold = _steppedThisGesture ? _stepTravel : _firstStepTravel;
    final horizontal = _accX.abs() >= _accY.abs();
    final travel = horizontal ? _accX : _accY;
    if (travel.abs() < threshold) return;

    final direction = horizontal
        ? (travel > 0 ? GamepadNavKey.right : GamepadNavKey.left)
        // The pad reports up as negative y, so travelling positive is a
        // finger moving down the surface.
        : (travel > 0 ? GamepadNavKey.down : GamepadNavKey.up);
    _step(direction);
    _steppedThisGesture = true;
    if (horizontal) {
      _accX -= travel.sign * threshold;
      _accY = 0;
    } else {
      _accY -= travel.sign * threshold;
      _accX = 0;
    }
  }

  void _step(GamepadNavKey direction) {
    _synthesizer.press(direction);
    _synthesizer.release(direction);
  }
}
