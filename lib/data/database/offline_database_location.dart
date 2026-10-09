import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../util/platform_detection.dart';

const _databasePath = 'Moonfin/DB/offline.db';

/// The offline database file, with its folder created.
///
/// Native builds keep it under Documents. A Flatpak without home access can't
/// reach that folder, because xdg-user-dir answers $HOME there and that's a
/// tmpfs wiped on exit. The database would quietly start empty on every
/// launch, so a Flatpak keeps it in its own data folder instead.
Future<File> offlineDatabaseFile() async {
  if (PlatformDetection.isAppleTV) {
    return _fileUnder(await getApplicationCacheDirectory());
  }
  if (!PlatformDetection.isFlatpak) {
    return _fileUnder(await getApplicationDocumentsDirectory());
  }

  final file = await _fileUnder(await getApplicationSupportDirectory());
  if (!await file.exists()) await _copyFromDocuments(file);
  return file;
}

Future<File> _fileUnder(Directory base) async {
  final file = File('${base.path}/$_databasePath');
  await file.parent.create(recursive: true);
  return file;
}

// Earlier Flatpak builds had home access and kept the database under
// Documents. When the manifest still lets the app read that copy, take it over
// once so existing downloads survive. It's copied rather than moved because a
// native install may share it.
Future<void> _copyFromDocuments(File target) async {
  try {
    final docs = await getApplicationDocumentsDirectory();
    final source = File('${docs.path}/$_databasePath');
    if (!await source.exists()) return;
    // A temporary name keeps an interrupted copy from passing as a finished
    // database on the next launch.
    final partial = await source.copy('${target.path}.part');
    await partial.rename(target.path);
  } on Exception {
    // Nothing readable to copy, so start empty like a fresh install.
  }
}
