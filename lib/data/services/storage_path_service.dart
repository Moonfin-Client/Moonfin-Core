import 'dart:io';
import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'macos_download_dir.dart';
import 'media_store_service.dart';

class StoragePathService {
  Directory? _cachedRoot;

  bool _useMediaStore = false;

  bool get isUsingMediaStore => _useMediaStore;

  void clearCache() => _cachedRoot = null;

  Future<Directory> getOfflineRoot() async {
    if (_cachedRoot != null) return _cachedRoot!;

    _useMediaStore = false;

    if (PlatformDetection.isDesktop || PlatformDetection.isAndroid) {
      final prefs = GetIt.instance<UserPreferences>();
      final customPath = prefs.get(UserPreferences.customDownloadPath);
      if (customPath.isNotEmpty) {
        if (PlatformDetection.isAndroid && customPath == 'mediastore') {
          final msPath = await MediaStoreService.getMediaStorePath();
          _useMediaStore = true;
          _cachedRoot = Directory(msPath);
          return _cachedRoot!;
        }
        // macOS is sandboxed: regain write access to the user-picked folder via
        // its security-scoped bookmark before touching it.
        if (PlatformDetection.isMacOS) {
          final bookmark = prefs.get(UserPreferences.customDownloadPathBookmark);
          if (bookmark.isNotEmpty) {
            final access = await MacosDownloadDir.startAccess(bookmark);
            if (access != null) {
              if (access.refreshedBookmark != null) {
                await prefs.set(
                  UserPreferences.customDownloadPathBookmark,
                  access.refreshedBookmark!,
                );
              }
              final dir = Directory(access.path);
              if (await _canWrite(dir)) {
                _cachedRoot = dir;
                return dir;
              }
            }
          }
          // Bookmark missing/stale or folder gone: fall back to the default.
          await prefs.set(UserPreferences.customDownloadPath, '');
          await prefs.set(UserPreferences.customDownloadPathBookmark, '');
        } else {
          final dir = Directory(customPath);
          if (await _canWrite(dir)) {
            _cachedRoot = dir;
            return dir;
          }
          await prefs.set(UserPreferences.customDownloadPath, '');
        }
      }
    }

    Directory dir;
    if (PlatformDetection.isAndroid) {
      final extDir = await getExternalStorageDirectory();
      final base = extDir ?? await getApplicationDocumentsDirectory();
      dir = Directory('${base.path}/Moonfin');
    } else if (PlatformDetection.isIOS) {
      final docs = await getApplicationDocumentsDirectory();
      dir = Directory('${docs.path}/Moonfin');
    } else {
      final support = PlatformDetection.isAppleTV
          ? await getApplicationCacheDirectory()
          : await getApplicationSupportDirectory();
      dir = Directory('${support.path}/Downloads');
    }

    if (!await dir.exists()) await dir.create(recursive: true);
    _cachedRoot = dir;
    return dir;
  }

  /// Verify an existing (or creatable) directory is actually writable by
  /// writing and deleting a probe file. Returns false on any failure.
  Future<bool> _canWrite(Directory dir) async {
    try {
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      final probe = File(
        '${dir.path}/.moonfin_write_test_${Random().nextInt(1 << 30)}',
      );
      await probe.writeAsString('');
      await probe.delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Check if [path] is writable.
  Future<bool> canWriteTo(String path) => _canWrite(Directory(path));

  Future<File> getDatabaseFile() async {
    final docs = await getApplicationDocumentsDirectory();
    final dbDir = Directory('${docs.path}/Moonfin/DB');
    if (!await dbDir.exists()) await dbDir.create(recursive: true);
    return File('${dbDir.path}/offline.db');
  }

  Future<Directory> getImageCacheDir() async {
    if (PlatformDetection.isAndroid && _useMediaStore) {
      final support = await getApplicationSupportDirectory();
      final dir = Directory('${support.path}/Moonfin/images');
      if (!await dir.exists()) await dir.create(recursive: true);
      return dir;
    }

    final root = await getOfflineRoot();
    final dir = Directory('${root.path}/images');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<Directory> getThemeCacheDir() async {
    if (PlatformDetection.isAndroid && _useMediaStore) {
      final support = await getApplicationSupportDirectory();
      final dir = Directory('${support.path}/Moonfin/themes');
      if (!await dir.exists()) await dir.create(recursive: true);
      return dir;
    }

    final root = await getOfflineRoot();
    final dir = Directory('${root.path}/themes');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }
}
