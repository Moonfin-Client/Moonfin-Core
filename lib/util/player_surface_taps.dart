import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

/// Tells a single tap on the player surface from a double tap without a
/// [DoubleTapGestureRecognizer].
///
/// That recognizer holds the gesture arena after every first tap, so each
/// button under it only fires once the double-tap timeout runs out. Here the
/// controls win their taps straight away, and only a tap that reached the
/// surface waits to see whether a second one follows.
///
/// A two-finger tap only counts when the first finger's tap reaches the
/// surface, so a press that starts on a control stays with that control.
///
/// Every pointer down, up and cancel under the surface goes to [pointerDown]
/// and [pointerUp] through a [Listener], and the surface's own taps go to
/// [tapUp].
class PlayerSurfaceTaps {
  PlayerSurfaceTaps({
    required this.onSingleTap,
    required this.onDoubleTap,
    required this.onTwoFingerTap,
  });

  final VoidCallback onSingleTap;

  /// Gets the second tap's position, local to the surface.
  final ValueChanged<Offset> onDoubleTap;

  final VoidCallback onTwoFingerTap;

  Timer? _timer;
  Offset? _firstTap;
  bool _secondDown = false;

  final _fingers = <int, Offset>{};
  Duration _pressStart = Duration.zero;
  bool _twoFingers = false;
  bool _twoFingerMissed = false;
  bool _twoFingerReachedSurface = false;

  void pointerDown(PointerDownEvent event) {
    if (_fingers.isEmpty) {
      _pressStart = event.timeStamp;
      _twoFingers = false;
      _twoFingerMissed = false;
      _twoFingerReachedSurface = false;
    }
    _fingers[event.pointer] = event.position;
    if (_fingers.length > 1) {
      if (_fingers.length > 2) _twoFingerMissed = true;
      if (!_twoFingers) {
        _twoFingers = true;
        // A tap still waiting on a second one settles as a single tap.
        _secondDown = false;
        _resolveSingle();
      }
      return;
    }
    final first = _firstTap;
    if (first == null || _secondDown) return;
    // Same rule as the recognizer: a press near the first tap stops the clock
    // and the first tap waits on how it ends. One further away doesn't count.
    if ((event.position - first).distance > kDoubleTapSlop) return;
    _timer?.cancel();
    _timer = null;
    _secondDown = true;
  }

  void pointerUp(PointerEvent event) {
    final down = _fingers.remove(event.pointer);
    if (_twoFingers) {
      if (event is PointerCancelEvent ||
          down == null ||
          (event.position - down).distance > kTouchSlop) {
        _twoFingerMissed = true;
      }
      if (_fingers.isNotEmpty) return;
      if (event.timeStamp - _pressStart > kLongPressTimeout) {
        _twoFingerMissed = true;
      }
      // The surface's tap for the first finger, if it got one, can still
      // arrive later in this same dispatch.
      scheduleMicrotask(() {
        if (_twoFingerReachedSurface && !_twoFingerMissed) onTwoFingerTap();
      });
      return;
    }
    if (!_secondDown) return;
    // A press that ends as a surface tap reaches tapUp later in this same
    // dispatch. One that went to a control or turned into a drag never does,
    // which leaves the first tap a single tap.
    scheduleMicrotask(() {
      if (!_secondDown) return;
      _secondDown = false;
      _resolveSingle();
    });
  }

  void tapUp(TapUpDetails details) {
    if (_twoFingers) {
      _twoFingerReachedSurface = true;
      return;
    }
    if (_secondDown) {
      _secondDown = false;
      _firstTap = null;
      onDoubleTap(details.localPosition);
      return;
    }
    // A tap too far from a waiting one settles that one and starts over.
    _resolveSingle();
    _firstTap = details.globalPosition;
    _timer = Timer(kDoubleTapTimeout, _resolveSingle);
  }

  /// Drops a tap that is still waiting on a second one.
  void cancel() {
    _timer?.cancel();
    _timer = null;
    _firstTap = null;
    _secondDown = false;
  }

  void _resolveSingle() {
    _timer?.cancel();
    _timer = null;
    if (_firstTap == null) return;
    _firstTap = null;
    onSingleTap();
  }
}
