import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/open.dart';

import '../../util/platform_detection.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final docs = await getApplicationDocumentsDirectory();
    final dbDir = Directory('${docs.path}/Moonfin/DB');
    if (!dbDir.existsSync()) {
      await dbDir.create(recursive: true);
    }
    final file = File('${dbDir.path}/offline.db');

    if (PlatformDetection.isTizen) {
      // Tizen does not ship sqlite3_flutter_libs, but the OS provides a system
      // libsqlite3. Point the sqlite3 package at it and open on the current
      // isolate (the `open` override does not propagate to background isolates).
      open.overrideForAll(_openTizenSqlite);
      return NativeDatabase(file);
    }

    return NativeDatabase.createInBackground(file);
  });
}

DynamicLibrary _openTizenSqlite() {
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
