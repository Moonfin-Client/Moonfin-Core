import 'dart:async';

import 'package:gamepads/gamepads.dart';

import 'focus/gamepad/gamepad_axis_gate.dart';

typedef ConnectedPads = Future<List<({String id, String name})>> Function();

/// Feeds a desktop controller to the EmulatorJS page over the bridge's
/// registered-gamepad route.
///
/// No desktop WebView hands the page a usable browser Gamepad API. Chromium
/// only exposes pads to a secure context, which a server reached over plain
/// http is not, and the embedded WebKit views return an empty list of their
/// own accord. So the page never sees the controller, never lists it, and every
/// button does nothing.
///
/// Flutter does see the pad, since it is what drives the rest of the app, so it
/// is forwarded into the page as one registered gamepad. That is the same
/// arrangement Android uses, down to the label vocabulary, which leaves
/// EmulatorJS in charge of mapping and of its own saved settings.
class DesktopEmulatorGamepad {
  /// Matches the threshold the navigation reader uses, so a stick feels the
  /// same in a game as it does in the UI.
  static const double _deadzone = 0.5;

  static const String _leftTrigger = 'LEFT_BOTTOM_SHOULDER';
  static const String _rightTrigger = 'RIGHT_BOTTOM_SHOULDER';

  /// EmulatorJS's own button names, laid out the way its Android counterpart
  /// lays them out. The stream reports buttons by position on an Xbox-style
  /// pad, so A is the bottom face button whatever the pad prints on it.
  static const Map<GamepadButton, String> _labels = {
    GamepadButton.a: 'BUTTON_2',
    GamepadButton.b: 'BUTTON_1',
    GamepadButton.x: 'BUTTON_4',
    GamepadButton.y: 'BUTTON_0',
    GamepadButton.leftBumper: 'BUTTON_6',
    GamepadButton.rightBumper: 'BUTTON_7',
    GamepadButton.leftTrigger: _leftTrigger,
    GamepadButton.rightTrigger: _rightTrigger,
    GamepadButton.back: 'SELECT',
    GamepadButton.start: 'START',
    GamepadButton.leftStick: 'BUTTON_10',
    GamepadButton.rightStick: 'BUTTON_11',
  };

  static const Map<GamepadButton, int> _dpadX = {
    GamepadButton.dpadLeft: -1,
    GamepadButton.dpadRight: 1,
  };

  static const Map<GamepadButton, int> _dpadY = {
    GamepadButton.dpadUp: -1,
    GamepadButton.dpadDown: 1,
  };

  DesktopEmulatorGamepad({
    required this.onButton,
    Stream<NormalizedGamepadEvent>? events,
    ConnectedPads? listGamepads,
  }) : _events = events,
       _listGamepads = listGamepads ?? _connectedPads;

  /// Called with an EmulatorJS button name, whether it went down, and the pad
  /// it came from in the shape the bridge registers.
  final void Function(String label, bool pressed, Map<String, dynamic> device)
  onButton;

  final Stream<NormalizedGamepadEvent>? _events;
  final ConnectedPads _listGamepads;

  final Map<String, String> _names = {};
  final Map<String, _PadState> _pads = {};
  StreamSubscription<NormalizedGamepadEvent>? _subscription;

  /// Whether a pad has said anything yet. The page forwards its own Gamepad
  /// API readings, and where those work too both routes report the same press.
  bool get hasReportedInput => _pads.isNotEmpty;

  /// The pads to register with the page. Ask again whenever a controller may
  /// have been plugged in.
  Future<List<Map<String, dynamic>>> refreshDevices() async {
    final List<({String id, String name})> pads;
    try {
      pads = await _listGamepads();
    } catch (_) {
      // Nothing to report, or the plugin failed outright. Either way the page
      // keeps whatever it was last told.
      return const [];
    }
    _names
      ..clear()
      ..addEntries(pads.map((pad) => MapEntry(pad.id, pad.name)));
    return [
      for (final pad in pads) {'id': pad.id, 'name': pad.name},
    ];
  }

  void start() {
    _subscription ??= (_events ?? Gamepads.normalizedEvents).listen(
      _onEvent,
      // A plugin-side failure shouldn't take the game down. The player falls
      // back to the keyboard.
      onError: (Object _) {},
    );
  }

  /// The page this feeds is torn down with the game, so anything still held
  /// goes with it rather than being released here.
  void stop() {
    unawaited(_subscription?.cancel());
    _subscription = null;
    _pads.clear();
  }

  static Future<List<({String id, String name})>> _connectedPads() async {
    final pads = await Gamepads.list();
    return [
      for (final pad in pads) (id: pad.id, name: pad.name),
    ];
  }

  void _onEvent(NormalizedGamepadEvent event) {
    final state = _pads.putIfAbsent(event.gamepadId, _PadState.new);
    final button = event.button;
    if (button != null) {
      final pressed = event.value != 0;
      if (_dpadX.containsKey(button) || _dpadY.containsKey(button)) {
        if (pressed) {
          state.dpad.add(button);
        } else {
          state.dpad.remove(button);
        }
        _updateDpad(event.gamepadId, state);
        return;
      }
      final label = _labels[button];
      if (label != null) _emit(event.gamepadId, label, pressed);
      return;
    }

    switch (event.axis) {
      case GamepadAxis.leftStickX:
        final next = quantiseAxis(event.value, _deadzone);
        if (next == state.stickX) return;
        state.stickX = next;
        _updateDpad(event.gamepadId, state);
      case GamepadAxis.leftStickY:
        final next = quantiseAxis(event.value, _deadzone);
        if (next == state.stickY) return;
        state.stickY = next;
        _updateDpad(event.gamepadId, state);
      case GamepadAxis.leftTrigger:
        _updateTrigger(event, state, _leftTrigger);
      case GamepadAxis.rightTrigger:
        _updateTrigger(event, state, _rightTrigger);
      // The right stick has nothing to drive on a retro pad.
      case GamepadAxis.rightStickX || GamepadAxis.rightStickY || null:
        return;
    }
  }

  void _updateTrigger(
    NormalizedGamepadEvent event,
    _PadState state,
    String label,
  ) {
    final held = event.value >= _deadzone;
    if ((state.triggers[label] ?? false) == held) return;
    state.triggers[label] = held;
    _emit(event.gamepadId, label, held);
  }

  /// The d-pad and the left stick drive the same four directions, which is how
  /// a stick reaches a core that only knows about a d-pad. A held d-pad wins,
  /// so the two can't fight over one direction.
  void _updateDpad(String gamepadId, _PadState state) {
    var x = 0;
    var y = 0;
    for (final button in state.dpad) {
      x = _dpadX[button] ?? x;
      y = _dpadY[button] ?? y;
    }
    // Stick Y reports +1 as up, the opposite of the screen direction the d-pad
    // pair is written in.
    if (x == 0) x = state.stickX;
    if (y == 0) y = -state.stickY;

    if (x != state.heldX) {
      _transition(gamepadId, state.heldX, x, 'DPAD_LEFT', 'DPAD_RIGHT');
      state.heldX = x;
    }
    if (y != state.heldY) {
      _transition(gamepadId, state.heldY, y, 'DPAD_UP', 'DPAD_DOWN');
      state.heldY = y;
    }
  }

  void _transition(
    String gamepadId,
    int previous,
    int next,
    String negative,
    String positive,
  ) {
    // Let go of the old direction first, so flicking straight across can't
    // strand one of them down.
    if (previous == -1) _emit(gamepadId, negative, false);
    if (previous == 1) _emit(gamepadId, positive, false);
    if (next == -1) _emit(gamepadId, negative, true);
    if (next == 1) _emit(gamepadId, positive, true);
  }

  void _emit(String gamepadId, String label, bool pressed) {
    onButton(label, pressed, {
      'id': gamepadId,
      'name': _names[gamepadId] ?? 'Controller',
    });
  }
}

class _PadState {
  final Set<GamepadButton> dpad = {};
  final Map<String, bool> triggers = {};
  int stickX = 0;
  int stickY = 0;
  int heldX = 0;
  int heldY = 0;
}
