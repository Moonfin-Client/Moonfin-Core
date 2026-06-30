import 'package:flutter/services.dart';

/// Bridges the macOS native folder picker and security-scoped bookmarks, so the
/// sandboxed app can write downloads to a user-chosen folder across launches.
class MacosDownloadDir {
  static const _channel = MethodChannel('moonfin/macos_download_dir');

  /// Opens the native folder picker. Returns the chosen path and a base64
  /// security-scoped bookmark, or null if the user cancelled.
  static Future<({String path, String bookmark})?> pick() async {
    try {
      final res =
          await _channel.invokeMapMethod<String, dynamic>('pickDirectory');
      final path = res?['path'] as String?;
      final bookmark = res?['bookmark'] as String?;
      if (path == null || bookmark == null) return null;
      return (path: path, bookmark: bookmark);
    } catch (_) {
      return null;
    }
  }

  /// Resolves [bookmark] and starts security-scoped access for the session.
  /// Returns the resolved path plus a refreshed bookmark when the stored one
  /// went stale (persist it), or null on failure.
  static Future<({String path, String? refreshedBookmark})?> startAccess(
    String bookmark,
  ) async {
    try {
      final res = await _channel.invokeMapMethod<String, dynamic>(
        'startAccess',
        {'bookmark': bookmark},
      );
      final path = res?['path'] as String?;
      if (path == null) return null;
      return (path: path, refreshedBookmark: res?['bookmark'] as String?);
    } catch (_) {
      return null;
    }
  }
}
