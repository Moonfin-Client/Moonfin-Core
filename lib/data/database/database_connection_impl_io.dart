import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/open.dart';

import '../../util/platform_detection.dart';
import 'offline_database_location.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final file = await offlineDatabaseFile();

    if (PlatformDetection.isAppleTV) {
      open.overrideForAll(_openAppleSqlite);
      return NativeDatabase(file);
    }

    if (PlatformDetection.isLinux) {
      // Desktop libraries (KDE/GNOME) load the system libsqlite3 at startup,
      // which collides with the bundled sqlite and crashes sqlite3_initialize.
      // Point the database isolate at the system library so only one sqlite is
      // active in the process.
      return NativeDatabase.createInBackground(
        file,
        isolateSetup: _useSystemSqlite,
      );
    }

    return NativeDatabase.createInBackground(file);
  });
}

Future<void> _useSystemSqlite() async {
  open.overrideForAll(_openSystemSqlite);
}

DynamicLibrary _openSystemSqlite() {
  for (final name in const ['libsqlite3.so.0', 'libsqlite3.so']) {
    try {
      return DynamicLibrary.open(name);
    } catch (_) {
      // Try the next candidate name.
    }
  }
  // Last resort: symbols may be statically available in the process.
  return DynamicLibrary.process();
}

DynamicLibrary _openAppleSqlite() {
  for (final name in const ['libsqlite3.dylib', 'libsqlite3.0.dylib']) {
    try {
      return DynamicLibrary.open(name);
    } catch (_) {}
  }
  return DynamicLibrary.process();
}
