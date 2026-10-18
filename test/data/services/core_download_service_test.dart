import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/core_download_service.dart';
import 'package:moonfin/util/game_cores.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _Paths extends PathProviderPlatform {
  _Paths(this.root);
  final String root;

  @override
  Future<String?> getApplicationSupportPath() async => root;
}

class _Adapter implements HttpClientAdapter {
  final List<Uri> requests = [];
  late ResponseBody Function(RequestOptions) respond;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options.uri);
    return respond(options);
  }

  @override
  void close({bool force = false}) {}
}

List<int> _zip(String name, List<int> bytes) =>
    ZipEncoder().encode(Archive()..add(ArchiveFile.bytes(name, bytes)));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory root;
  late PreferenceStore store;
  late _Adapter adapter;
  late CoreDownloadService service;
  late PathProviderPlatform previousPaths;

  setUp(() async {
    root = await Directory.systemTemp.createTemp('core_download_test');
    previousPaths = PathProviderPlatform.instance;
    PathProviderPlatform.instance = _Paths(root.path);
    SharedPreferences.setMockInitialValues({});
    store = PreferenceStore();
    await store.init();
    adapter = _Adapter();
    service = CoreDownloadService(
      store,
      dio: Dio()..httpClientAdapter = adapter,
    );
  });

  tearDown(() async {
    PathProviderPlatform.instance = previousPaths;
    await root.delete(recursive: true);
  });

  test(
    'installs the downloaded core and records it only when complete',
    () async {
      const core = 'fbneo';
      adapter.respond = (_) => ResponseBody.fromBytes(
        _zip('fbneo_libretro_android.so', [1, 2, 3]),
        200,
      );
      final progress = <double>[];

      await service.download(core, onProgress: progress.add);

      expect(adapter.requests.single.toString(), coreDownloadUrl(core));
      expect(await File((await installedCorePath(core))!).readAsBytes(), [
        1,
        2,
        3,
      ]);
      expect(service.isInstalled(core), isTrue);
      expect(progress.last, 1);
      final dir = await coresDirectory();
      expect(
        await dir.list().where((entry) => entry is Directory).isEmpty,
        isTrue,
      );
    },
  );

  test(
    'a failed download leaves no installed core and can be retried',
    () async {
      adapter.respond = (_) => ResponseBody.fromString('Unavailable', 503);
      await expectLater(
        service.download('fbneo'),
        throwsA(isA<DioException>()),
      );
      expect(await installedCorePath('fbneo'), isNull);
      expect(service.installed, isEmpty);

      adapter.respond = (_) =>
          ResponseBody.fromBytes(_zip('fbneo_libretro.so', [4]), 200);
      await service.download('fbneo');
      expect(service.isInstalled('fbneo'), isTrue);
      expect(await installedCorePath('fbneo'), isNotNull);
    },
  );

  test(
    'missing binary in an archive never becomes an installed core',
    () async {
      adapter.respond = (_) =>
          ResponseBody.fromBytes(_zip('README.txt', [1]), 200);
      await expectLater(service.download('fbneo'), throwsStateError);
      expect(await installedCorePath('fbneo'), isNull);
      expect(service.installed, isEmpty);
    },
  );

  test(
    'failed support files do not publish a partially installed core',
    () async {
      adapter.respond = (options) =>
          options.uri.toString() == coreDownloadUrl('ppsspp')
          ? ResponseBody.fromBytes(_zip('ppsspp_libretro.so', [1]), 200)
          : ResponseBody.fromString('Unavailable', 503);
      await expectLater(
        service.download('ppsspp'),
        throwsA(isA<DioException>()),
      );
      expect(adapter.requests, hasLength(2));
      expect(await installedCorePath('ppsspp'), isNull);
      expect(service.installed, isEmpty);
    },
  );

  test('cancellation does not publish or record a core', () async {
    final token = CancelToken();
    adapter.respond = (_) {
      token.cancel('Player closed');
      return ResponseBody.fromBytes(_zip('fbneo_libretro.so', [1]), 200);
    };
    await expectLater(
      service.download('fbneo', cancelToken: token),
      throwsA(
        isA<DioException>().having(
          (e) => e.type,
          'type',
          DioExceptionType.cancel,
        ),
      ),
    );
    expect(await installedCorePath('fbneo'), isNull);
    expect(service.installed, isEmpty);
  });

}
