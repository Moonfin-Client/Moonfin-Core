import 'dart:async';

import 'package:flutter/services.dart';

import '../../platform_detection.dart';
import 'gamepad_key_synthesizer.dart';
import 'gamepad_suppressor.dart';

/// Sole owner of the native gamepad channel on Android.
///
/// The channel carries two unrelated conversations, onButton for the emulator
/// and onNavigate for UI focus, and a channel only allows one handler. Without
/// routing here, whichever registered last would silently starve the other.
class AndroidGamepadChannel {
  AndroidGamepadChannel._();

  static const MethodChannel _channel = MethodChannel(
    'org.moonfin.androidtv/gamepad',
  );

  // Handles both onButton (native RetroPad input) and onKeyboard (physical
  // keyboard forwarded from the overlay) — despite the name implied by the
  // old field, it is not button-only.
  static Future<dynamic> Function(MethodCall)? _emulatorInputHandler;
  static Future<dynamic> Function(MethodCall)? _controllerMappingKeyHandler;
  static AndroidStickNavigator? _navigator;
  static bool _installed = false;

  /// Start routing. Safe to call more than once.
  static void ensureInstalled() {
    if (_installed || !PlatformDetection.isAndroid) return;
    _installed = true;
    _channel.setMethodCallHandler(_dispatch);
    _navigator = AndroidStickNavigator();
  }

  /// Register the emulator's input handler (onButton and onKeyboard) for the
  /// lifetime of a game. Pass null on teardown.
  static void setEmulatorInputHandler(
    Future<dynamic> Function(MethodCall)? handler,
  ) => _emulatorInputHandler = handler;

  /// Tell the native side whether a game currently owns the pad.
  static Future<void> setGameActive(bool active) async {
    if (!PlatformDetection.isAndroid) return;
    _navigator?.reset();
    await _channel.invokeMethod('setActive', {'active': active});
  }

  static Future<void> setEmulatorControlsActive(bool active) async {
    if (!PlatformDetection.isAndroid) return;
    await _channel.invokeMethod('setEmulatorControlsActive', {
      'active': active,
    });
  }

  /// Applies per-controller native RetroPad overrides for the active session.
  static Future<void> setControllerMapping(String mappingJson) async {
    if (!PlatformDetection.isAndroid) return;
    await _channel.invokeMethod('setControllerMapping', {
      'mapping': mappingJson,
    });
  }

  /// Captures the next physical button from [deviceId] instead of forwarding
  /// it to libretro. Used only while the native mapping overlay is rebinding.
  static Future<void> setControllerMappingCapture(
    bool active, {
    String? deviceId,
  }) async {
    if (!PlatformDetection.isAndroid) return;
    await _channel.invokeMethod('setControllerMappingCapture', {
      'active': active,
      'deviceId': ?deviceId,
    });
  }

  static void setControllerMappingKeyHandler(
    Future<dynamic> Function(MethodCall)? handler,
  ) => _controllerMappingKeyHandler = handler;

  /// Tells NativePadInput whether the in-game pause overlay is showing.
  /// Native RetroPad Start uses this to decide between its short-press
  /// pulse/long-press-hold gesture (overlay closed) and closing/stepping
  /// back through the overlay on any press (overlay open); LibretroBridge
  /// uses it to gate the "button" EventChannel message to overlay navigation
  /// only, so nothing crosses the channel during gameplay.
  static Future<void> setOverlayOpen(bool open) async {
    if (!PlatformDetection.isAndroid) return;
    await _channel.invokeMethod('setOverlayOpen', {'open': open});
  }

  /// Physical pads known to Android. The native side returns privacy-safe,
  /// stable profile ids rather than raw device descriptors.
  static Future<List<Map<String, dynamic>>> getEmulatorGamepads() async {
    if (!PlatformDetection.isAndroid) return const [];
    final result = await _channel.invokeListMethod<dynamic>(
      'getGamepadDevices',
    );
    return result
            ?.whereType<Map>()
            .map((value) => value.cast<String, dynamic>())
            .toList(growable: false) ??
        const [];
  }

  static Future<dynamic> _dispatch(MethodCall call) async {
    switch (call.method) {
      case 'onButton':
      case 'onKeyboard':
        return _emulatorInputHandler?.call(call);
      case 'onControllerMappingKey':
        return _controllerMappingKeyHandler?.call(call);
      case 'onNavigate':
        final args = (call.arguments as Map).cast<String, dynamic>();
        _navigator?.handle(
          axis: args['axis'] as String? ?? '',
          direction: args['direction'] as String? ?? 'none',
        );
        return null;
      default:
        return null;
    }
  }
}

/// Turns Android left-stick motion into focus movement.
///
/// Pad buttons and the d-pad already arrive as real key events on Android, so
/// nothing else needs bridging. The analog stick is the one input that comes
/// through as a motion event, invisible to Flutter's key pipeline, so it gets
/// fed to the same synthesizer the desktop path uses.
class AndroidStickNavigator {
  final GamepadKeyRepeater _keys = GamepadKeyRepeater(GamepadKeySynthesizer());
  final Map<String, GamepadNavKey> _heldByAxis = <String, GamepadNavKey>{};

  void handle({required String axis, required String direction}) {
    // Let go of whatever this axis was holding first, so flicking straight
    // from left to right can't strand the left key down.
    final previous = _heldByAxis.remove(axis);
    if (previous != null) _keys.release(previous);

    if (direction == 'none' || GamepadSuppressor.suppressed) return;

    final key = switch (direction) {
      'up' => GamepadNavKey.up,
      'down' => GamepadNavKey.down,
      'left' => GamepadNavKey.left,
      'right' => GamepadNavKey.right,
      _ => null,
    };
    if (key == null) return;

    _heldByAxis[axis] = key;
    _keys.press(key);
  }

  /// Drops all held state, so a direction held while a game takes or releases
  /// the pad can't stay logically pressed.
  void reset() {
    _heldByAxis.clear();
    _keys.releaseAll();
  }
}
