import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The navigation semantics a gamepad can express, in the app's own terms.
enum GamepadNavKey { up, down, left, right, select, back, contextMenu }

/// Translates gamepad input into real key events and pushes them through
/// Flutter's key pipeline.
///
/// The governing principle is that a pad event should be indistinguishable
/// from the equivalent keyboard event. The app reads raw key events all over
/// the place, through Focus.onKeyEvent widgets and HardwareKeyboard handlers,
/// and has no central Actions map to target. Emitting keys reaches all of it,
/// including screens written later.
class GamepadKeySynthesizer {
  GamepadKeySynthesizer() : _physicalBase = _gamepadPhysicalBase;

  /// Server commands use separate physical keys from real and virtual pads.
  GamepadKeySynthesizer.remote() : _physicalBase = _remotePhysicalBase;

  /// Base of a private-use USB HID usage range.
  ///
  /// Emitting a distinct physical key matters, because HardwareKeyboard tracks
  /// which keys are down by physical key. PhysicalKeyboardKey.gameButton* would
  /// have been the obvious choice, but Android maps real pad buttons onto those
  /// same usages, so a real button press and a synthetic one would share an
  /// entry and clobber each other.
  static const int _gamepadPhysicalBase = 0x0FF00001;
  static const int _remotePhysicalBase = 0x0FF00101;
  final int _physicalBase;

  static const Map<GamepadNavKey, LogicalKeyboardKey> _logical = {
    GamepadNavKey.up: LogicalKeyboardKey.arrowUp,
    GamepadNavKey.down: LogicalKeyboardKey.arrowDown,
    GamepadNavKey.left: LogicalKeyboardKey.arrowLeft,
    GamepadNavKey.right: LogicalKeyboardKey.arrowRight,
    GamepadNavKey.select: LogicalKeyboardKey.select,
    GamepadNavKey.back: LogicalKeyboardKey.escape,
    GamepadNavKey.contextMenu: LogicalKeyboardKey.contextMenu,
  };

  /// Whether [key] came from this class rather than a real keyboard.
  ///
  /// We don't use KeyEvent.synthesized for this. In Flutter that flag means
  /// "invented to resynchronize key state, with no source native event", which
  /// isn't what these are. A pad press is real user input arriving over a
  /// different transport.
  static bool isSynthetic(PhysicalKeyboardKey key) =>
      (key.usbHidUsage >= _gamepadPhysicalBase &&
          key.usbHidUsage <
              _gamepadPhysicalBase + GamepadNavKey.values.length) ||
      isRemote(key);

  static bool isRemote(PhysicalKeyboardKey key) =>
      key.usbHidUsage >= _remotePhysicalBase &&
      key.usbHidUsage < _remotePhysicalBase + GamepadNavKey.values.length;

  /// The keyboard key [key] is emitted as.
  static LogicalKeyboardKey logicalKeyFor(GamepadNavKey key) => _logical[key]!;

  /// A Stopwatch rather than the current frame timestamp, because pad events
  /// arrive from a stream callback that may not be inside a frame.
  final Stopwatch _clock = Stopwatch()..start();

  final Set<GamepadNavKey> _down = <GamepadNavKey>{};

  @visibleForTesting
  Set<GamepadNavKey> get pressedKeys => Set.unmodifiable(_down);

  /// One complete press. Release even if an action throws or changes routes.
  bool tap(GamepadNavKey key) {
    if (!_down.add(key)) return false;
    var handled = false;
    try {
      handled = _emit(key, _EventKind.down);
    } finally {
      // Some controls activate on release. Count that as handled too so a
      // fallback action can't activate them a second time.
      handled = release(key) || handled;
    }
    return handled;
  }

  /// Begins a hold. Pressing an already-held key repeats it instead, which is
  /// what a real keyboard does.
  void press(GamepadNavKey key) {
    if (!_down.add(key)) {
      repeat(key);
      return;
    }
    _emit(key, _EventKind.down);
  }

  void repeat(GamepadNavKey key) {
    if (_down.contains(key)) _emit(key, _EventKind.repeat);
  }

  bool release(GamepadNavKey key) =>
      _down.remove(key) && _emit(key, _EventKind.up);

  /// Releases everything, so a key can't stay logically held after the pad
  /// stops reporting. Call when the app pauses, when a controller disconnects,
  /// and when something else takes over the pad.
  void releaseAll() {
    for (final key in _down.toList()) {
      release(key);
    }
  }

  bool _emit(GamepadNavKey key, _EventKind kind) {
    final physical = PhysicalKeyboardKey(_physicalBase + key.index);
    final logical = _logical[key]!;
    final time = _clock.elapsed;
    return _dispatch(switch (kind) {
      _EventKind.down => KeyDownEvent(
        physicalKey: physical,
        logicalKey: logical,
        timeStamp: time,
      ),
      _EventKind.repeat => KeyRepeatEvent(
        physicalKey: physical,
        logicalKey: logical,
        timeStamp: time,
      ),
      _EventKind.up => KeyUpEvent(
        physicalKey: physical,
        logicalKey: logical,
        timeStamp: time,
      ),
    });
  }

  bool _dispatch(KeyEvent event) {
    // Two stages, and the gating between them is the whole correctness
    // argument. First the HardwareKeyboard handlers, which run whether or not
    // anything is focused. Then the focus tree, reached only if no handler
    // claimed the event.
    //
    // Flutter's own pipeline works that way and we have to match it. Running
    // both unconditionally double-handles: pad B emits escape, the app's global
    // handler closes the top overlay sheet and reports it handled, and then the
    // focus tree pops the route as well, so one press does two things.
    if (HardwareKeyboard.instance.handleKeyEvent(event)) return true;

    // These are deprecated against the eventual removal of RawKeyEvent, but
    // they're still the only public way to reach the focus tree. The
    // deprecation suggests adding a HardwareKeyboard handler instead, which is
    // the stage above and doesn't reach focused widgets. Kept in one place so
    // the migration is a single edit.
    // ignore: deprecated_member_use
    return ServicesBinding.instance.keyEventManager.keyMessageHandler?.call(
          // ignore: deprecated_member_use
          KeyMessage([event], null),
        ) ??
        false;
  }
}

enum _EventKind { down, repeat, up }

/// Holds keys down and repeats them on a keyboard-like cadence.
///
/// Both input paths need this, the desktop event stream and the Android
/// channel, so the timer bookkeeping lives here rather than in each of them.
class GamepadKeyRepeater {
  GamepadKeyRepeater(this._synthesizer);

  static const Duration _initialDelay = Duration(milliseconds: 700);
  static const Duration _subsequentDelay = Duration(milliseconds: 200);

  final GamepadKeySynthesizer _synthesizer;
  final Map<GamepadNavKey, Timer> _timers = <GamepadNavKey, Timer>{};
  final Set<GamepadNavKey> _held = <GamepadNavKey>{};

  bool isHeld(GamepadNavKey key) => _held.contains(key);

  /// Presses [key]. Set [repeat] false for buttons that shouldn't auto-fire
  /// while held, like select and back. Does nothing if already held.
  void press(GamepadNavKey key, {bool repeat = true}) {
    if (!_held.add(key)) return;
    _synthesizer.press(key);
    if (repeat) {
      _timers[key] = Timer(_initialDelay, () => _onRepeat(key));
    }
  }

  void release(GamepadNavKey key) {
    if (!_held.remove(key)) return;
    _timers.remove(key)?.cancel();
    _synthesizer.release(key);
  }

  void releaseAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _held.clear();
    _synthesizer.releaseAll();
  }

  void _onRepeat(GamepadNavKey key) {
    _synthesizer.repeat(key);
    _timers[key] = Timer(_subsequentDelay, () => _onRepeat(key));
  }
}
