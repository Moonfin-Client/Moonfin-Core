import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// The last known-good hardware capability probes, persisted across launches.
///
/// The probes race the HDMI handshake on a cold boot: the app can be asking
/// what the display and audio chain support before either has finished
/// negotiating, and an answer taken then reports a device that can do nothing.
/// Seeding from the last good result means a launch that loses that race
/// still starts from what the hardware really said last time, instead of a
/// fallback that forces the server to transcode everything.
///
/// Only sound probe results are ever written, so the cache can never hold the
/// unenumerated state. A later probe that succeeds overwrites in either
/// direction, which is how a genuine downgrade, like a soundbar being
/// removed, still lands.
class DeviceCapabilityCache {
  DeviceCapabilityCache._();

  static const audioKey = 'device_capability_audio';
  static const displayHdrKey = 'device_capability_display_hdr';
  static const displayHdrRecordKey = 'device_capability_display_hdr_v2';
  static const codecKey = 'device_capability_codec';
  static const appleVideoKey = 'device_capability_apple_video';
  static const deviceMemoryKey = 'device_capability_device_memory';

  static Future<SharedPreferences> get _store =>
      SharedPreferences.getInstance();

  /// Reads a cached capability map. When [build] is given, the entry only
  /// counts if it was written under the same build, since a firmware update
  /// can change what the hardware decodes.
  static Future<Map<String, dynamic>?> readMap(
    String key, {
    String? build,
  }) async {
    try {
      final store = await _store;
      if (build != null && store.getString('$key.build') != build) {
        return null;
      }
      final raw = store.getString(key);
      if (raw == null) return null;
      final decoded = jsonDecode(raw);
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
  }

  static Future<void> writeMap(
    String key,
    Map<String, dynamic> values, {
    String? build,
  }) async {
    try {
      final store = await _store;
      await store.setString(key, jsonEncode(values));
      if (build != null) {
        await store.setString('$key.build', build);
      }
    } catch (_) {}
  }

  static Future<List<String>?> readStringList(String key) async {
    try {
      return (await _store).getStringList(key);
    } catch (_) {
      return null;
    }
  }

  static Future<void> writeStringList(String key, List<String> values) async {
    try {
      await (await _store).setStringList(key, values);
    } catch (_) {}
  }

  static Future<void> remove(String key) async {
    try {
      final store = await _store;
      await store.remove(key);
      await store.remove('$key.build');
    } catch (_) {}
  }
}
