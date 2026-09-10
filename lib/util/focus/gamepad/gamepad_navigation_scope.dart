import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gamepads/gamepads.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/user_preferences.dart';
import '../../platform_detection.dart';
import 'android_gamepad_channel.dart';
import 'gamepad_axis_gate.dart';
import 'gamepad_key_synthesizer.dart';
import 'gamepad_suppressor.dart';

/// Drives the UI from a game controller by turning pad input into the same key
/// events a keyboard or TV remote would produce.
///
/// Mount once, inside MaterialApp and above the router's Navigator. Android
/// goes through the native channel instead, since pad buttons already arrive
/// there as real key events and only the left stick needs bridging.
///
/// Everything here answers to [UserPreferences.gamepadNavigationEnabled], which
/// is off by default everywhere but Apple TV. The stream is only listened to
/// while it's on, and the platforms that gate the pad natively are told
/// whenever it changes.
///
/// This reads the normalized event stream directly rather than using the
/// companion flutter_gamepads widget layer, which resolves its intents against
/// the focused widget and drops them when nothing has focus, and which reports
/// one-shot activations so a held direction never repeats. Axis edge detection
/// and repeat timing are all it would have contributed, and both are here.
class GamepadNavigationScope extends StatefulWidget {
  const GamepadNavigationScope({super.key, required this.child, this.events});

  final Widget child;

  /// Stands in for the plugin stream in tests.
  final Stream<NormalizedGamepadEvent>? events;

  static bool get isSupported =>
      (PlatformDetection.isDesktop || PlatformDetection.isIOS) &&
      !PlatformDetection.isTV;

  /// Whether a pad can reach the UI here at all, so the settings know whether
  /// to offer the switch. Android and Apple TV hand pad input to Flutter
  /// natively and are gated there instead.
  static bool get isConfigurable =>
      isSupported || PlatformDetection.isAndroid || PlatformDetection.isAppleTV;

  @override
  State<GamepadNavigationScope> createState() => _GamepadNavigationScopeState();
}

class _GamepadNavigationScopeState extends State<GamepadNavigationScope> {
  /// Below this the stick counts as centred.
  static const double _deadzone = 0.5;

  static const MethodChannel _appleTvSystem = MethodChannel(
    'moonfin/appletv_system',
  );

  final GamepadKeyRepeater _keys = GamepadKeyRepeater(GamepadKeySynthesizer());
  final GamepadDuplicateGuard _duplicateGuard = GamepadDuplicateGuard();
  final GamepadAxisGate _axisGate = GamepadAxisGate(deadzone: _deadzone);
  late final GamepadScrollRepeater _scroll = GamepadScrollRepeater(
    deadzone: _deadzone,
    onStep: _fireScroll,
  );

  late final UserPreferences _prefs;
  bool _enabled = false;

  StreamSubscription<NormalizedGamepadEvent>? _subscription;

  /// Last quantised direction per axis, one of -1, 0 or 1.
  final Map<GamepadAxis, int> _axisDirection = <GamepadAxis, int>{};

  @override
  void initState() {
    super.initState();
    // Installed here rather than when a game opens, so stick navigation works
    // from launch.
    AndroidGamepadChannel.ensureInstalled();
    _prefs = GetIt.instance<UserPreferences>();
    _prefs.addListener(_onPreferencesChanged);
    _apply(_prefs.get(UserPreferences.gamepadNavigationEnabled));
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPreferencesChanged);
    _stopListening();
    super.dispose();
  }

  void _onPreferencesChanged() {
    final enabled = _prefs.get(UserPreferences.gamepadNavigationEnabled);
    if (enabled != _enabled) _apply(enabled);
  }

  void _apply(bool enabled) {
    _enabled = enabled;
    unawaited(_tellNative(enabled));
    if (!GamepadNavigationScope.isSupported) return;
    if (enabled) {
      _startListening();
    } else {
      _stopListening();
    }
  }

  /// A channel failure shouldn't take the app down. The user is left with
  /// whatever the native side last heard, and the preference default matches
  /// what it starts with.
  Future<void> _tellNative(bool enabled) async {
    try {
      if (PlatformDetection.isAndroid) {
        await AndroidGamepadChannel.setNavigationEnabled(enabled);
      } else if (PlatformDetection.isAppleTV) {
        await _appleTvSystem.invokeMethod(
          'setGamepadNavigationEnabled',
          enabled,
        );
      }
    } catch (_) {}
  }

  void _startListening() {
    if (_subscription != null) return;
    _duplicateGuard.start();
    GamepadSuppressor.depth.addListener(_onSuppressionChanged);
    _subscription = (widget.events ?? Gamepads.normalizedEvents).listen(
      _onGamepadEvent,
      // A plugin-side failure shouldn't take the app down. The user falls back
      // to keyboard and pointer input.
      onError: (Object _) {},
    );
  }

  void _stopListening() {
    if (_subscription == null) return;
    _subscription!.cancel();
    _subscription = null;
    GamepadSuppressor.depth.removeListener(_onSuppressionChanged);
    _duplicateGuard.stop();
    _releaseEverything();
  }

  void _onSuppressionChanged() {
    if (!GamepadSuppressor.suppressed) return;
    // Something else took the pad mid-hold, so drop everything we think is
    // down rather than leaving a key stuck or a scroll running.
    _releaseEverything();
  }

  void _releaseEverything() {
    _axisDirection.clear();
    _keys.releaseAll();
    _scroll.stop();
  }

  void _onGamepadEvent(NormalizedGamepadEvent event) {
    if (GamepadSuppressor.suppressed) return;
    final button = event.button;
    if (button != null) {
      _onButton(button, pressed: event.value != 0);
      return;
    }
    final axis = event.axis;
    if (axis == null) return;
    if (!_axisGate.admit(event.gamepadId, axis, event.value)) return;
    _onAxis(axis, event.value);
  }

  void _onButton(GamepadButton button, {required bool pressed}) {
    final navKey = _navKeyForButton(button);
    if (navKey == null) return;
    if (pressed) {
      _press(navKey);
    } else {
      _release(navKey);
    }
  }

  /// The event stream reports buttons by position on an Xbox-style layout, so
  /// A is always the bottom face button whatever the pad prints on it.
  GamepadNavKey? _navKeyForButton(GamepadButton button) => switch (button) {
    GamepadButton.dpadUp => GamepadNavKey.up,
    GamepadButton.dpadDown => GamepadNavKey.down,
    GamepadButton.dpadLeft => GamepadNavKey.left,
    GamepadButton.dpadRight => GamepadNavKey.right,
    GamepadButton.a => GamepadNavKey.select,
    GamepadButton.b => GamepadNavKey.back,
    GamepadButton.x => GamepadNavKey.contextMenu,
    _ => null,
  };

  void _onAxis(GamepadAxis axis, double value) {
    // The right stick scrolls rather than moving focus, and Scrollable already
    // handles ScrollIntent, so no key synthesis is needed for it.
    if (axis == GamepadAxis.rightStickX || axis == GamepadAxis.rightStickY) {
      _scroll.onAxis(axis, value);
      return;
    }
    // Triggers are unmapped.
    if (axis != GamepadAxis.leftStickX && axis != GamepadAxis.leftStickY) {
      return;
    }

    final direction = quantiseAxis(value, _deadzone);
    final previous = _axisDirection[axis] ?? 0;
    if (direction == previous) return;
    _axisDirection[axis] = direction;

    // Stick Y reports +1 as up, which is the negative screen direction, so the
    // vertical pair is deliberately inverted relative to the horizontal one.
    final (negative, positive) = axis == GamepadAxis.leftStickX
        ? (GamepadNavKey.left, GamepadNavKey.right)
        : (GamepadNavKey.down, GamepadNavKey.up);
    // Let go of the old direction first, so flicking straight across can't
    // strand a key down.
    if (previous == -1) _release(negative);
    if (previous == 1) _release(positive);
    if (direction == -1) _press(negative);
    if (direction == 1) _press(positive);
  }

  void _fireScroll(GamepadAxis axis, int direction) {
    final axisDirection = axis == GamepadAxis.rightStickX
        ? (direction < 0 ? AxisDirection.left : AxisDirection.right)
        : (direction < 0 ? AxisDirection.down : AxisDirection.up);
    Actions.maybeInvoke(
      primaryFocus?.context ?? context,
      ScrollIntent(direction: axisDirection),
    );
  }

  void _press(GamepadNavKey key) {
    if (_shouldDropAsDuplicate(key)) return;
    _keys.press(key, repeat: _repeats(key));
  }

  void _release(GamepadNavKey key) => _keys.release(key);

  /// Only directions auto-repeat. Repeating select or back would fire long
  /// presses and unwind the navigation stack on a single held button.
  bool _repeats(GamepadNavKey key) => switch (key) {
    GamepadNavKey.up ||
    GamepadNavKey.down ||
    GamepadNavKey.left ||
    GamepadNavKey.right => true,
    _ => false,
  };

  /// Directions only. Where a pad is mirrored to a virtual keyboard the d-pad
  /// shows up as arrow keys, but the face buttons become mouse clicks, so they
  /// can't collide with our select and back keys.
  bool _shouldDropAsDuplicate(GamepadNavKey key) =>
      _repeats(key) &&
      !_keys.isHeld(key) &&
      _duplicateGuard.shouldDrop(GamepadKeySynthesizer.logicalKeyFor(key));

  @override
  Widget build(BuildContext context) => widget.child;
}
