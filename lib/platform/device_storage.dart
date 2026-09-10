import 'package:flutter/services.dart';

/// Free space on the volume that holds the downloads, from the platform
/// (`StatFs` on Android, the volume capacity keys on iOS). Unknown where
/// the native side is absent, in which case callers skip the check.
class DeviceStorage {
  DeviceStorage({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel(channelName);

  static const channelName = 'com.moonfin/device_storage';

  static final instance = DeviceStorage();

  final MethodChannel _channel;

  Future<int?> freeBytes(String path) async {
    try {
      return await _channel.invokeMethod<int>('freeBytes', {'path': path});
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }
}
