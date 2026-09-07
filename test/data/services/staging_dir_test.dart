import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/storage_path_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.supportPath);

  final String supportPath;

  @override
  Future<String?> getApplicationSupportPath() async => supportPath;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory support;
  late Directory custom;
  late StoragePathService service;

  setUp(() async {
    support = Directory.systemTemp.createTempSync('moonfin_support');
    custom = Directory.systemTemp.createTempSync('moonfin_custom');
    PathProviderPlatform.instance = _FakePathProvider(support.path);
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    service = StoragePathService();
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    GetIt.instance.unregister<UserPreferences>();
    support.deleteSync(recursive: true);
    custom.deleteSync(recursive: true);
  });

  test('staging dir lives inside the default offline root', () async {
    final staging = await service.getStagingDir();
    expect(
      staging.path,
      '${support.path}/Downloads/${StoragePathService.stagingDirName}',
    );
    expect(staging.existsSync(), isTrue);
  });

  test('staging dir follows a custom download location', () async {
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(UserPreferences.customDownloadPath, custom.path);
    final staging = await service.getStagingDir();
    expect(
      staging.path,
      '${custom.path}/${StoragePathService.stagingDirName}',
    );
    expect(staging.existsSync(), isTrue);
  });
}
