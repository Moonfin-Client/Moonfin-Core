import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/tv_image_cache_io.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// A path provider that never answers, the shape of a plugin whose channel
/// has stopped replying.
class _HangingPathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  @override
  Future<String?> getTemporaryPath() => Completer<String?>().future;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // A throw here used to leave the image provider on its library default,
  // which is sqflite on Apple platforms.
  test(
    'a path provider that never answers still yields a working manager',
    () async {
      final original = PathProviderPlatform.instance;
      PathProviderPlatform.instance = _HangingPathProvider();
      addTearDown(() => PathProviderPlatform.instance = original);

      final stopwatch = Stopwatch()..start();
      await configureImageDiskCache().timeout(const Duration(seconds: 10));
      expect(stopwatch.elapsed, lessThan(const Duration(seconds: 5)));

      final manager = CachedNetworkImageProvider.defaultCacheManager;
      expect(manager, isA<CacheManager>());
      expect(manager, isNot(isA<DefaultCacheManager>()));

      // Goes through the store, which waits on the repository's open.
      final cached = await (manager as CacheManager)
          .getFileFromCache('http://127.0.0.1/never.jpg')
          .timeout(const Duration(seconds: 5));
      expect(cached, isNull);
      await flushImageCacheIndex();
    },
  );
}
