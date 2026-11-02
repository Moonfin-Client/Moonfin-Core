import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import '../../../preference/user_preferences.dart';

/// One focus position for a row whose focused card grows. Every card's width
/// and the row's scroll come from it, so the two can't pull against each
/// other. It moves on a critically damped spring, so a press in the middle of
/// a move keeps its speed instead of starting over. Holding a direction folds
/// the row back to plain cards until the key comes up.
class RowGlide extends ChangeNotifier {
  RowGlide(this._prefs);

  final UserPreferences _prefs;

  /// How much wider a fully grown card is than the others.
  double growth = 0;

  final _position = _Spring();
  final _open = _Spring();
  final _gap = _Spring();
  int _target = 0;
  bool _held = false;
  bool _active = false;

  /// How far the card at [index] has grown, from 0 to 1. Only the cards on
  /// either side of the focus position are ever above 0.
  double openness(int index) =>
      _open.value * math.max(0.0, 1 - (index - _position.value).abs());

  /// Whether the row has focus. Its card only grows while it does.
  set active(bool value) => _active = value;

  /// Set while a direction key repeats, which folds the row.
  set held(bool value) => _held = value;

  void moveTo(int index) => _target = index;

  void jumpTo(int index) {
    _target = index;
    _position
      ..value = index.toDouble()
      ..velocity = 0;
  }

  /// Takes over from a scroll the row got some other way, such as the mouse
  /// wheel, and eases it out rather than jumping.
  void catchUp(double gap) {
    _gap
      ..value = gap
      ..velocity = 0;
  }

  /// The scroll offset that keeps the focus position at the row's leading
  /// edge. Cards before the focused one are never grown, so they all sit one
  /// [stride] apart.
  double scrollOffset({required double leading, required double stride}) {
    final index = _position.value.floor();
    final fraction = _position.value - index;
    return leading +
        index * stride +
        fraction * (stride + growth * openness(index)) +
        _gap.value;
  }

  /// Moves the springs on by [dt] seconds and returns whether anything is
  /// still moving.
  bool tick(double dt) {
    final cardSpeed =
        _prefs.get(UserPreferences.modernCardTransitionSpeed).duration;
    final navSpeed = _prefs.get(UserPreferences.navigationAnimationSpeed).duration;
    final settle = (cardSpeed > navSpeed ? cardSpeed : navSpeed) * 1.5;
    // A critically damped spring is within 5% of its target after
    // 4.74 / stiffness seconds.
    final stiffness =
        4.74 * Duration.microsecondsPerSecond / settle.inMicroseconds;
    final openTarget = _active && !_held ? 1.0 : 0.0;
    _position.step(_target.toDouble(), stiffness, dt);
    _open.step(
      openTarget,
      cardSpeed == Duration.zero ? double.infinity : stiffness,
      dt,
    );
    _gap.step(0, stiffness, dt);
    notifyListeners();
    return !_position.isAt(_target.toDouble()) ||
        !_open.isAt(openTarget) ||
        !_gap.isAt(0);
  }
}

class _Spring {
  double value = 0;
  double velocity = 0;

  bool isAt(double target) => value == target && velocity == 0;

  /// Solves a critically damped spring exactly, so it never overshoots and
  /// keeps its velocity when the target moves.
  void step(double target, double stiffness, double dt) {
    if (stiffness.isInfinite) {
      value = target;
      velocity = 0;
      return;
    }
    final offset = value - target;
    final decay = math.exp(-stiffness * dt);
    final drift = (velocity + stiffness * offset) * dt;
    value = target + (offset + drift) * decay;
    velocity = (velocity - stiffness * drift) * decay;
    if ((value - target).abs() < 1e-4 && velocity.abs() < 1e-3) {
      value = target;
      velocity = 0;
    }
  }
}
