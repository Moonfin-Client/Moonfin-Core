import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

const _poster =
    'https://silo.example/api/v2/artwork/tmdb/movies/7451/poster/w500.f6c3.webp';

void main() {
  test('signed artwork is keyed by its path', () {
    final today = siloImageCacheKey('$_poster?exp=1&sig=a');
    final tomorrow = siloImageCacheKey('$_poster?exp=2&sig=b');
    expect(today, 'silo-artwork:$_poster');
    expect(tomorrow, today);
  });

  test('a different picture or server gets a different key', () {
    expect(
      siloImageCacheKey('${_poster.replaceFirst('f6c3', '0000')}?sig=a'),
      isNot(siloImageCacheKey('$_poster?sig=a')),
    );
    expect(
      siloImageCacheKey(
        '${_poster.replaceFirst('silo.example', 'other.example')}?sig=a',
      ),
      isNot(siloImageCacheKey('$_poster?sig=a')),
    );
  });

  test('anything else keeps its usual key', () {
    expect(siloImageCacheKey(_poster), isNull);
    expect(siloImageCacheKey('https://image.tmdb.org/t/p/w500/a.jpg'), isNull);
    expect(
      siloImageCacheKey('https://emby.example/Items/1/Images/Primary?tag=x'),
      isNull,
    );
    expect(
      siloImageCacheKey('https://silo.example/api/v2/artwork/a.webp?w=3'),
      isNull,
    );
  });

  test('an avatar replaced at the same path keys by its version', () {
    const avatar =
        'https://silo.example/api/v2/artwork/profile-avatars/1/p1/w256.webp';
    expect(
      siloImageCacheKey('$avatar?exp=1&sig=a#v=2026-11-24T19:54:29.000Z'),
      siloImageCacheKey('$avatar?exp=2&sig=b#v=2026-11-24T19:54:29.000Z'),
    );
    expect(
      siloImageCacheKey('$avatar?exp=1&sig=a#v=2026-11-24T19:54:29.000Z'),
      isNot(
        siloImageCacheKey('$avatar?exp=1&sig=a#v=2026-11-24T20:00:00.000Z'),
      ),
    );
  });
}
