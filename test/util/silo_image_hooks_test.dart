import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/silo_image_hooks.dart';

const _poster =
    'https://silo.example/api/v2/artwork/tmdb/movies/7451/poster/w500.f6c3.webp';

void main() {
  tearDown(() {
    CachedNetworkImageProvider.cacheKeyFor = null;
    CachedNetworkImageProvider.urlResolver = null;
  });

  test('without the hooks, a new signature is a new image', () {
    expect(
      CachedNetworkImageProvider('$_poster?exp=1&sig=a'),
      isNot(CachedNetworkImageProvider('$_poster?exp=2&sig=b')),
    );
  });

  test('with them, the same Silo picture is one cache entry', () {
    installSiloImageHooks();
    final today = CachedNetworkImageProvider('$_poster?exp=1&sig=a');
    final tomorrow = CachedNetworkImageProvider('$_poster?exp=2&sig=b');
    expect(today, tomorrow);
    expect(today.hashCode, tomorrow.hashCode);
  });

  test('other URLs and explicit keys are untouched', () {
    installSiloImageHooks();
    expect(
      CachedNetworkImageProvider('https://emby.example/a.jpg?tag=1'),
      isNot(CachedNetworkImageProvider('https://emby.example/a.jpg?tag=2')),
    );
    expect(
      CachedNetworkImageProvider('$_poster?sig=a', cacheKey: 'one'),
      isNot(CachedNetworkImageProvider('$_poster?sig=a', cacheKey: 'two')),
    );
  });

  test('Silo placeholders are resolved and other URLs load directly', () {
    installSiloImageHooks();
    final resolve = CachedNetworkImageProvider.urlResolver!;
    expect(resolve('https://emby.example/a.jpg'), isNull);
    expect(resolve('$_poster?sig=a'), isNull);
    expect(
      resolve('https://silo.example/api/v2/__moonfin/image?item=m&type=logo'),
      isNotNull,
    );
  });
}
