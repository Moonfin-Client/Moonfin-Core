import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database_location.dart';
import 'package:path/path.dart' as p;
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
  late String support;
  late String home;

  setUp(() {
    root = Directory.systemTemp.createTempSync('moonfin_offline_db');
    support = '${root.path}/support';
    home = '${root.path}/home';
    PathProviderPlatform.instance = _FakePathProvider(support, home);
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

      expect(
        p.normalize((await offlineDatabaseFile()).path),
        p.normalize(old.path),
      );

      // SQLite rolls the journal back and deletes it once the database opens,
      // and the Downloads screen then asks for the file again.
      journal.deleteSync();
      expect(
        p.normalize((await offlineDatabaseFile()).path),
        p.normalize(old.path),
      );
      expect(
        File('${root.path}/support/Moonfin/DB/offline.db').existsSync(),
        isFalse,
      );
    },
  );

  test('keeps the database in the data folder without MOONFIN_DIR', () async {
    final file = await offlineDatabaseFileFor({});

    expect(
      p.normalize(file.path),
      p.normalize('$support/Moonfin/DB/offline.db'),
    );
    expect(file.parent.existsSync(), isTrue);
  });

  test('keeps the database under MOONFIN_DIR', () async {
    final file = await offlineDatabaseFileFor({
      'MOONFIN_DIR': '$home/.local/state/Moonfin',
    });

    expect(
      p.normalize(file.path),
      p.normalize('$home/.local/state/Moonfin/DB/offline.db'),
    );
    expect(file.parent.existsSync(), isTrue);
  });

  test('ignores a MOONFIN_DIR that is not an absolute path', () async {
    for (final value in [
      '',
      '   ',
      '.local/state/Moonfin',
      '~/.local/state/Moonfin',
    ]) {
      final file = await offlineDatabaseFileFor({'MOONFIN_DIR': value});

      expect(
        p.normalize(file.path),
        p.normalize('$support/Moonfin/DB/offline.db'),
        reason: value,
      );
    }
  });
}
