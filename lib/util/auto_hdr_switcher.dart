import 'package:flutter/services.dart';

import '../preference/preference_constants.dart';
import 'platform_detection.dart';

class AutoHdrSwitcher {
  static const MethodChannel _channel = MethodChannel('moonfin/hdr_display');

  /// Whether the window's display is in HDR mode, or null when it could not be
  /// read. Passthrough depends on it: PQ on an SDR display washes the picture
  /// out. Unknown is kept apart from SDR because the query can fail mid-
  /// topology-change, exactly when a monitor crossing fires.
  static Future<bool?> displayHdrState() async {
    if (!PlatformDetection.isWindows) return false;
    try {
      final state = await _channel.invokeMapMethod<String, dynamic>(
        'getHdrState',
      );
      if (state == null) return null;
      return state['enabled'] == true;
    } on MissingPluginException {
      return false;
    } catch (_) {
      return null;
    }
  }

  bool _engaged = false;
  bool _restoreToSdr = false;
  bool _channelUnavailable = false;

  /// Returns whether the display's HDR mode was actually changed. Callers run
  /// this on every bringup phase and queue change, where it does nothing, so
  /// react to the return value rather than to the call.
  Future<bool> sync({
    required AutoHdrSwitchingBehavior behavior,
    required bool isHdrContent,
    required bool isDesktopFullscreen,
  }) async {
    if (!PlatformDetection.isWindows) {
      return false;
    }

    final shouldEnable = switch (behavior) {
      AutoHdrSwitchingBehavior.disabled => false,
      AutoHdrSwitchingBehavior.whenFullscreen =>
        isHdrContent && isDesktopFullscreen,
      AutoHdrSwitchingBehavior.always => isHdrContent,
    };

    if (shouldEnable) {
      return _engage();
    }

    return restore();
  }

  /// True only when it actually switched the display into HDR.
  Future<bool> _engage() async {
    if (_engaged || _channelUnavailable) return false;

    try {
      final state = await _channel.invokeMapMethod<String, dynamic>('getHdrState');
      if (state == null) return false;

      final supported = state['supported'] == true;
      final enabled = state['enabled'] == true;
      if (!supported) {
        return false;
      }

      _engaged = true;
      _restoreToSdr = !enabled;

      if (_restoreToSdr) {
        final ok = await _channel.invokeMethod<bool>('setHdrEnabled', true);
        if (ok != true) {
          _engaged = false;
          _restoreToSdr = false;
          return false;
        }
        return true;
      }
    } on MissingPluginException {
      _channelUnavailable = true;
    } catch (_) {}
    return false;
  }

  /// True only when it actually switched the display back to SDR.
  Future<bool> restore() async {
    if (!_engaged) return false;

    final restoreToSdr = _restoreToSdr;
    _engaged = false;
    _restoreToSdr = false;

    if (!restoreToSdr || !PlatformDetection.isWindows || _channelUnavailable) {
      return false;
    }

    try {
      // The runner reports a refusal (another process owning the output, a
      // config call that failed) rather than throwing, same as _engage.
      final ok = await _channel.invokeMethod<bool>('setHdrEnabled', false);
      return ok == true;
    } on MissingPluginException {
      _channelUnavailable = true;
    } catch (_) {}
    return false;
  }
}
