import 'dart:async';

import 'package:flutter/services.dart';

import '../util/platform_detection.dart';

class IosSharedContextBridgeConfig {
  final String frameEventChannel;

  const IosSharedContextBridgeConfig({
    required this.frameEventChannel,
  });

  Map<String, dynamic> toJson() {
    return {
      'frameEventChannel': frameEventChannel,
    };
  }
}

class PipService {
  static const _androidChannel = MethodChannel('org.moonfin.androidtv/pip');
  static const _iosChannel = MethodChannel('org.moonfin.ios/pip');
  static const _iosSharedContextBridge = IosSharedContextBridgeConfig(
    frameEventChannel: 'org.moonfin.ios/pip_shared_frames',
  );

  MethodChannel? get _activeChannel {
    if (PlatformDetection.isAndroid) return _androidChannel;
    if (PlatformDetection.isIOS) return _iosChannel;
    return null;
  }

  bool _isInPiP = false;
  bool get isInPiP => _isInPiP;

  Object? _autoPiPOwner;

  bool _didConfigureIosBackend = false;
  bool _isIosPiPInitialized = false;

  bool _isScreenLocked = false;
  bool get isScreenLocked => _isScreenLocked;

  final _pipChangedController = StreamController<bool>.broadcast();
  Stream<bool> get onPiPChanged => _pipChangedController.stream;

  final _actionController = StreamController<String>.broadcast();
  Stream<String> get onPiPAction => _actionController.stream;

  final _screenLockController = StreamController<bool>.broadcast();
  Stream<bool> get onScreenLock => _screenLockController.stream;

  bool _disposed = false;

  PipService() {
    final channel = _activeChannel;
    if (channel != null) {
      channel.setMethodCallHandler(_handleMethod);
    }
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    if (_disposed) return null;
    switch (call.method) {
      case 'onPiPChanged':
        _isInPiP = call.arguments as bool;
        if (!_pipChangedController.isClosed) {
          _pipChangedController.add(_isInPiP);
        }
        return null;
      case 'onPiPAction':
        if (!_actionController.isClosed) {
          _actionController.add(call.arguments as String);
        }
        return null;
      case 'onScreenLock':
        _isScreenLocked = call.arguments as bool;
        if (!_screenLockController.isClosed) {
          _screenLockController.add(_isScreenLocked);
        }
        return null;
      default:
        return null;
    }
  }

  Future<void> enableAutoPiP(bool enabled, {Object? owner}) async {
    if (enabled) {
      _autoPiPOwner = owner;
    } else if (owner != null && !identical(_autoPiPOwner, owner)) {
      return;
    } else {
      _autoPiPOwner = null;
    }
    final channel = _activeChannel;
    if (channel == null) return;
    try {
      if (PlatformDetection.isAndroid) {
        await channel.invokeMethod('enableAutoPiP', {'enabled': enabled});
      } else if (PlatformDetection.isIOS && !enabled) {
        await channel.invokeMethod('dismissPiP');
      }
    } catch (_) {}
  }

  Future<void> initializeIos(int handle) async {
    if (!PlatformDetection.isIOS) return;
    try {
      await _ensureIosBackendConfigured();
      await _iosChannel.invokeMethod('initialize', {'handle': handle});
      _isIosPiPInitialized = true;
    } on PlatformException {
      _isIosPiPInitialized = false;
      rethrow;
    }
  }

  Future<void> _ensureIosBackendConfigured() async {
    if (_didConfigureIosBackend) return;
    await _iosChannel.invokeMethod(
      'configureSharedContextBridge',
      _iosSharedContextBridge.toJson(),
    );
    _didConfigureIosBackend = true;
  }

  Future<bool> startIosPiP() async {
    if (!PlatformDetection.isIOS) return false;
    if (!_isIosPiPInitialized) {
      return false;
    }
    try {
      await _iosChannel.invokeMethod('startPiP');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> updateIosTimeline({
    required int positionMs,
    required int durationMs,
    required bool isPlaying,
  }) async {
    if (!PlatformDetection.isIOS || !_isIosPiPInitialized) return;
    try {
      await _iosChannel.invokeMethod('updateTimeline', {
        'positionMs': positionMs,
        'durationMs': durationMs,
        'isPlaying': isPlaying,
      });
    } catch (_) {}
  }

  Future<void> updatePiPActions({required bool isPlaying}) async {
    if (PlatformDetection.isAndroid && !_isInPiP) return;
    try {
      final channel = _activeChannel;
      if (channel == null) return;
      if (PlatformDetection.isAndroid) {
        await channel.invokeMethod('updatePiPActions', {'isPlaying': isPlaying});
      } else if (PlatformDetection.isIOS) {
        await channel.invokeMethod('updatePlaybackState', {'isPlaying': isPlaying});
      }
    } catch (_) {}
  }

  void dispose() {
    _disposed = true;
    _activeChannel?.setMethodCallHandler(null);
    _pipChangedController.close();
    _actionController.close();
    _screenLockController.close();
  }
}
