import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gamepads/gamepads.dart';

import '../../native_controller_mapping.dart';
import '../../platform_detection.dart';
import 'android_gamepad_channel.dart';

/// Reads the next raw button press from a specific controller so the remapping
/// panel can bind it.
///
/// This exists because the two platforms that support remapping learn about a
/// button press in completely different ways. Android routes an unfiltered
/// KeyEvent up through its gamepad channel, and only while capture is armed --
/// the rest of the time those events belong to the running core. Windows and
/// Linux never involve native code at all: the gamepads package is already
/// streaming every controller event into Dart, so capture is a matter of
/// watching the stream that is running anyway.
///
/// The panel only needs "tell me the next button from this device", so that is
/// the whole interface. Keeping the difference behind it is what lets one
/// remapping screen serve both instead of growing platform branches.
abstract class ControllerMappingCapture {
  /// The capture implementation for the current platform, or null where
  /// remapping is unsupported (Apple platforms bind their buttons in Swift).
  static ControllerMappingCapture? forPlatform() {
    if (PlatformDetection.isAndroid) return _AndroidControllerMappingCapture();
    if (PlatformDetection.isWindows || PlatformDetection.isLinux) {
      return _GamepadsControllerMappingCapture();
    }
    return null;
  }

  /// Registers the sink for captured bindings. [code] is an Android keycode or
  /// a [desktopGamepadButtonCodes] value depending on the implementation; it is
  /// only ever handed back to a [NativeControllerMapping] for the same device,
  /// so the caller never has to care which.
  void attach(void Function(String deviceId, int code) onCaptured);

  /// Starts listening for the next button from [deviceId].
  Future<void> begin(String deviceId);

  /// Stops listening. Safe to call when capture was never armed.
  Future<void> end();

  /// Releases anything [attach] or [begin] set up.
  void dispose();
}

/// Android: arms the native channel's capture mode and reads the raw KeyEvent
/// it sends back.
class _AndroidControllerMappingCapture implements ControllerMappingCapture {
  void Function(String deviceId, int code)? _onCaptured;
  String? _armedDeviceId;

  @override
  void attach(void Function(String deviceId, int code) onCaptured) {
    _onCaptured = onCaptured;
    AndroidGamepadChannel.ensureInstalled();
    AndroidGamepadChannel.setControllerMappingKeyHandler(_onRawKey);
  }

  Future<dynamic> _onRawKey(MethodCall call) async {
    if (call.method != 'onControllerMappingKey') return;
    final armed = _armedDeviceId;
    if (armed == null) return;
    final args = (call.arguments as Map).cast<String, dynamic>();
    final keycode = (args['keyCode'] as num?)?.toInt();
    final device = (args['device'] as Map?)?.cast<String, dynamic>();
    // A press from a controller other than the one being remapped is not the
    // binding the user is making, and must not be swallowed as one.
    if (keycode == null || device?['id'] != armed) return;
    _onCaptured?.call(armed, keycode);
  }

  @override
  Future<void> begin(String deviceId) async {
    _armedDeviceId = deviceId;
    await AndroidGamepadChannel.setControllerMappingCapture(
      true,
      deviceId: deviceId,
    );
  }

  @override
  Future<void> end() async {
    _armedDeviceId = null;
    await AndroidGamepadChannel.setControllerMappingCapture(false);
  }

  @override
  void dispose() {
    _armedDeviceId = null;
    unawaited(AndroidGamepadChannel.setControllerMappingCapture(false));
    AndroidGamepadChannel.setControllerMappingKeyHandler(null);
    _onCaptured = null;
  }
}

/// Windows and Linux: watches the gamepads stream the player screen is already
/// consuming.
class _GamepadsControllerMappingCapture implements ControllerMappingCapture {
  void Function(String deviceId, int code)? _onCaptured;
  StreamSubscription<NormalizedGamepadEvent>? _subscription;
  String? _armedDeviceId;

  @override
  void attach(void Function(String deviceId, int code) onCaptured) {
    _onCaptured = onCaptured;
  }

  @override
  Future<void> begin(String deviceId) async {
    _armedDeviceId = deviceId;
    // Subscribed per capture rather than for the panel's lifetime so a pad
    // being waggled while the user reads the list can never be mistaken for a
    // binding.
    await _subscription?.cancel();
    _subscription = Gamepads.normalizedEvents.listen(_onEvent);
  }

  void _onEvent(NormalizedGamepadEvent event) {
    final armed = _armedDeviceId;
    final button = event.button;
    // Axis events carry a null button, and the release edge of a press would
    // otherwise bind whichever button the user just let go of.
    if (armed == null || button == null || event.value == 0) return;
    if (desktopControllerDeviceId(event.gamepadId) != armed) return;
    final code = desktopGamepadButtonCodes[button];
    if (code == null) return;
    _onCaptured?.call(armed, code);
  }

  @override
  Future<void> end() async {
    _armedDeviceId = null;
    await _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    _armedDeviceId = null;
    unawaited(_subscription?.cancel());
    _subscription = null;
    _onCaptured = null;
  }
}
