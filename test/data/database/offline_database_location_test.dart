import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database_location.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.supportPath, this.documentsPath);

  final String supportPath;
  final String documentsPath;

  @override
  Future<String?> getApplicationSupportPath() async => supportPath;

  @override
  Future<String?> getApplicationDocumentsPath() async => documentsPath;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory root;

  setUp(() {
    root = Directory.systemTemp.createTempSync('moonfin_offline_db');
    PathProviderPlatform.instance = _FakePathProvider(
      '${root.path}/support',
      '${root.path}/home',
    );
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    root.deleteSync(recursive: true);
  });

  test(
    'keeps the old database for the whole launch after a hot journal',
    () async {
      final old = File('${root.path}/home/Moonfin/DB/offline.db')
        ..createSync(recursive: true)
        ..writeAsStringSync('old');
      final journal = File('${old.path}-journal')..writeAsStringSync('journal');

      expect((await offlineDatabaseFile()).path, old.path);

      // SQLite rolls the journal back and deletes it once the database opens,
      // and the Downloads screen then asks for the file again.
      journal.deleteSync();
      expect((await offlineDatabaseFile()).path, old.path);
      expect(
        File('${root.path}/support/Moonfin/DB/offline.db').existsSync(),
        isFalse,
      );
    },
  );
}
