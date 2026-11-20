import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../util/platform_detection.dart';

const _databasePath = 'Moonfin/DB/offline.db';

/// The offline database file, with its folder created.
///
/// Other native builds keep it under Documents. Linux keeps it in its own data
/// folder under $XDG_DATA_HOME, like the rest of its files. Documents there is
/// whatever xdg-user-dir answers, which is $HOME itself when no Documents
/// folder is set up, and in a Flatpak without home access that $HOME is a
/// tmpfs wiped on exit.
Future<File> offlineDatabaseFile() async {
  if (PlatformDetection.isAppleTV) {
    return _fileUnder(await getApplicationCacheDirectory());
  }
  if (!PlatformDetection.isLinux) {
    return _fileUnder(await getApplicationDocumentsDirectory());
  }

  final file = await _fileUnder(await getApplicationSupportDirectory());
  if (await file.exists()) return file;
  return await _copyFromDocuments(file) ?? file;
}

Future<File> _fileUnder(Directory base) async {
  final file = File('${base.path}/$_databasePath');
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
    source = File('${docs.path}/$_databasePath');
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
