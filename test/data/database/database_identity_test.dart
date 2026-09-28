import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/database_connection_impl_io.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/util/app_distribution.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _DocumentsProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _DocumentsProvider(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory documents;
  late PathProviderPlatform previousProvider;

  setUp(() {
    documents = Directory.systemTemp.createTempSync('moonfin_identity_');
    previousProvider = PathProviderPlatform.instance;
    PathProviderPlatform.instance = _DocumentsProvider(documents.path);
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    PathProviderPlatform.instance = previousProvider;
    documents.deleteSync(recursive: true);
  });

  test('both database paths use the build-specific folder', () async {
    final folder = AppDistribution.isCustomBuild ? 'MoonfinBooks' : 'Moonfin';
    final other = AppDistribution.isCustomBuild ? 'Moonfin' : 'MoonfinBooks';
    final expected = '${documents.path}/$folder/DB/offline.db';

    final storageFile = await StoragePathService().getDatabaseFile();
    expect(storageFile.path, expected);

    final connection = OfflineDatabase(openConnection());
    try {
      await connection.customSelect('SELECT 1').get();
    } finally {
      await connection.close();
    }

    expect(File(expected).existsSync(), isTrue);
    expect(Directory('${documents.path}/$other').existsSync(), isFalse);
  });
}
