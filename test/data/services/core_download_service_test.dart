import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
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

class _MockDirectory extends Mock implements Directory {}

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

  test('prompt decisions persist per core across service instances', () async {
    expect(service.downloadPromptChoice('snes9x'), isNull);
    await service.recordDownloadPromptChoice('snes9x', CoreDownloadPromptChoice.download);
    expect(CoreDownloadService(store).downloadPromptChoice('snes9x'),
        CoreDownloadPromptChoice.download);
    await service.recordDownloadPromptChoice('snes9x', CoreDownloadPromptChoice.emulatorJs);
    final reopenedStore = PreferenceStore();
    await reopenedStore.init();
    expect(CoreDownloadService(reopenedStore).downloadPromptChoice('snes9x'),
        CoreDownloadPromptChoice.emulatorJs);
    expect(service.downloadPromptChoice('mupen64plus_next'), isNull);
    expect(adapter.requests, isEmpty);
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

  test('cancellation after publication still records the installed core', () async {
    final token = CancelToken();
    final directory = await coresDirectory();
    await directory.create(recursive: true);
    final staging = await directory.createTemp('.fbneo-');
    final coreDirectory = _MockDirectory();
    final stagingDirectory = _MockDirectory();
    when(() => coreDirectory.path).thenReturn(directory.path);
    when(() => coreDirectory.exists()).thenAnswer((_) async => true);
    when(() => coreDirectory.createTemp(any())).thenAnswer((_) async => stagingDirectory);
    when(() => stagingDirectory.path).thenReturn(staging.path);
    when(() => stagingDirectory.delete(recursive: true)).thenAnswer((_) async {
      // The binary has been published, but final bookkeeping has not run.
      final result = await staging.delete(recursive: true);
      token.cancel('Player closed');
      return result;
    });
    adapter.respond = (_) => ResponseBody.fromBytes(_zip('fbneo_libretro.so', [1]), 200);

    await IOOverrides.runZoned(
      () => service.download('fbneo', cancelToken: token),
      createDirectory: (path) {
        if (path == directory.path) return coreDirectory;
        if (path == root.path) return root;
        throw StateError('Unexpected directory: $path');
      },
    );

    expect(token.isCancelled, isTrue);
    expect(await installedCorePath('fbneo'), isNotNull);
    expect(service.isInstalled('fbneo'), isTrue);
  });

  for (final publish in [true, false]) {
    test('cleanup failure ${publish ? "after" : "before"} publication preserves install state', () async {
      final directory = await coresDirectory();
      await directory.create(recursive: true);
      final staging = await directory.createTemp('.fbneo-');
      final coreDirectory = _MockDirectory();
      final stagingDirectory = _MockDirectory();
      when(() => coreDirectory.path).thenReturn(directory.path);
      when(() => coreDirectory.exists()).thenAnswer((_) async => true);
      when(() => coreDirectory.createTemp(any())).thenAnswer((_) async => stagingDirectory);
      // An absent directory forces the write to fail before publication.
      when(() => stagingDirectory.path).thenReturn(publish ? staging.path : '${staging.path}/missing');
      when(() => stagingDirectory.delete(recursive: true)).thenThrow(const FileSystemException('Cleanup failed'));
      adapter.respond = (_) => ResponseBody.fromBytes(_zip('fbneo_libretro.so', [1]), 200);
      final progress = <double>[];

      final install = IOOverrides.runZoned(
        () => service.download('fbneo', onProgress: progress.add),
        createDirectory: (path) {
          if (path == directory.path) return coreDirectory;
          if (path == root.path) return root;
          throw StateError('Unexpected directory: $path');
        },
      );
      if (publish) {
        await install;
        expect(await installedCorePath('fbneo'), isNotNull);
        expect(service.isInstalled('fbneo'), isTrue);
        expect(progress.last, 1);
      } else {
        await expectLater(install, throwsA(isA<FileSystemException>().having(
          (error) => error.message, 'message', 'Cleanup failed',
        )));
        expect(await installedCorePath('fbneo'), isNull);
        expect(service.isInstalled('fbneo'), isFalse);
      }
    });
  }

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
