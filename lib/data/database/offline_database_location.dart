import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../util/platform_detection.dart';

/// The folder Moonfin owns, below the Documents (or data) directory.
const _appFolder = 'Moonfin';

/// The database's path inside the folder Moonfin owns.
const _databasePath = 'DB/offline.db';

/// The offline database file, with its folder created.
///
/// Other native builds keep it under Documents. Linux keeps it in its own data
/// folder under $XDG_DATA_HOME, like the rest of its files. Documents there is
/// whatever xdg-user-dir answers, which is $HOME itself when no Documents
/// folder is set up, and in a Flatpak without home access that $HOME is a
/// tmpfs wiped on exit.
///
/// `MOONFIN_DIR` names the folder Moonfin owns, so the database lands in
/// `$MOONFIN_DIR/DB/offline.db` on every platform. It must be an absolute
/// path; anything else keeps the default above.
///
/// It's picked once per launch, so a later call can't take the old database
/// over while the open connection still writes to it.
Future<File> offlineDatabaseFile() =>
    _databaseFile ??= _pickDatabaseFile(Platform.environment);

Future<File>? _databaseFile;

/// [_pickDatabaseFile] with the environment passed in, for tests.
@visibleForTesting
Future<File> offlineDatabaseFileFor(Map<String, String> env) =>
    _pickDatabaseFile(env);

Future<File> _pickDatabaseFile(Map<String, String> env) async {
  final override = _moonfinDirOverride(env);
  if (override != null) return _fileUnder(override);

  if (PlatformDetection.isAppleTV) {
    return _fileUnder(await _appFolderUnder(getApplicationCacheDirectory));
  }
  if (!PlatformDetection.isLinux) {
    return _fileUnder(await _appFolderUnder(getApplicationDocumentsDirectory));
  }

  final file = await _fileUnder(
    await _appFolderUnder(getApplicationSupportDirectory),
  );
  if (await file.exists()) return file;
  return await _copyFromDocuments(file) ?? file;
}

String? _moonfinDirOverride(Map<String, String> env) {
  final raw = env['MOONFIN_DIR']?.trim();
  if (raw == null || raw.isEmpty) return null;
  if (!p.isAbsolute(raw)) return null;
  return p.normalize(raw);
}

Future<String> _appFolderUnder(Future<Directory> Function() base) async =>
    p.join((await base()).path, _appFolder);

Future<File> _fileUnder(String moonfinDir) async {
  final file = File(p.join(moonfinDir, _databasePath));
  await file.parent.create(recursive: true);
  return file;
}

// Earlier Linux builds kept the database under Documents. When the app can
// still read that copy, take it over once so existing downloads survive. It's
// copied rather than moved because an older build may still use it.
//
// Returns the old file when it can't be copied cleanly yet, so this launch
// opens it where it is and a later launch tries again. A journal left by a
// crash holds changes SQLite still has to undo, and a copy without it can be
// corrupt. Opening the old file lets SQLite finish that recovery first.
Future<File?> _copyFromDocuments(File target) async {
  final File source;
  try {
    final docs = await getApplicationDocumentsDirectory();
    source = File(p.join(docs.path, _appFolder, _databasePath));
    if (!await source.exists()) return null;
  } on Exception {
    // Nothing readable to copy, so start empty like a fresh install.
    return null;
  }
  if ((await File('${source.path}-journal').stat()).size > 0) return source;
  try {
    // A temporary name keeps an interrupted copy from passing as a finished
    // database on the next launch.
    final partial = await source.copy('${target.path}.part');
    await partial.rename(target.path);
    return null;
  } on Exception {
    return source;
  }
}
