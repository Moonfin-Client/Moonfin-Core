import 'dart:convert';

import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

const _poster =
    '/api/v2/artwork/tmdb/movies/7451/poster/w500.f6c34680654fa5db5d49830a7c9f889ece854c44173abdb68ad72e2f9d93d06d.webp';

void main() {
  group('siloImageTag', () {
    test('stays the same when the signature rotates', () {
      final today = siloImageTag('$_poster?exp=1792000000&sig=aaaa');
      final tomorrow = siloImageTag('$_poster?exp=1792086400&sig=bbbb');
      expect(today, tomorrow);
      expect(siloImageTag(_poster), today);
      expect(today, hasLength(16));
    });

    test('changes when the picture changes', () {
      final other = _poster.replaceFirst('f6c3', '0000');
      expect(siloImageTag(other), isNot(siloImageTag(_poster)));
    });

    test('ignores a fragment like a query', () {
      expect(siloImageTag('$_poster#x'), siloImageTag(_poster));
    });
  });

  group('resolveSiloUrl', () {
    const base = 'https://silo.example';

    test('a server path gets the base URL', () {
      expect(
        resolveSiloUrl('$_poster?exp=1&sig=2', base),
        'https://silo.example$_poster?exp=1&sig=2',
      );
      expect(resolveSiloUrl(_poster, '$base/'), '$base$_poster');
    });

    test('a reverse-proxy sub-path is kept', () {
      expect(
        resolveSiloUrl(_poster, 'https://host.example/silo'),
        'https://host.example/silo$_poster',
      );
    });

    test('absolute URLs pass through untouched, with no token', () {
      const tmdb = 'https://image.tmdb.org/t/p/w500/abc.jpg';
      expect(resolveSiloUrl(tmdb, base), tmdb);
      expect(
        resolveSiloUrl('//cdn.example/a.webp', base),
        'https://cdn.example/a.webp',
      );
      expect(
        resolveSiloUrl('//cdn.example/a.webp', 'http://lan:8090'),
        'http://cdn.example/a.webp',
      );
    });

    test('nothing gives null', () {
      expect(resolveSiloUrl(null, base), isNull);
      expect(resolveSiloUrl('  ', base), isNull);
    });
  });

  group('SiloImageRegistry', () {
    late String baseUrl;
    late SiloImageRegistry registry;

    setUp(() {
      baseUrl = 'https://silo.example';
      registry = SiloImageRegistry(() => baseUrl);
    });

    test('registers a URL and answers it by item, type and index', () {
      final tag = registry.register(
        'movie-1',
        SiloImageType.primary,
        '$_poster?exp=1&sig=a',
      );
      expect(tag, siloImageTag(_poster));
      expect(
        registry.urlFor('movie-1', SiloImageType.primary),
        'https://silo.example$_poster?exp=1&sig=a',
      );
      expect(registry.tagFor('movie-1', SiloImageType.primary), tag);
      expect(registry.urlFor('movie-1', SiloImageType.backdrop), isNull);
      expect(registry.urlFor('movie-2', SiloImageType.primary), isNull);
    });

    test('backdrops are kept per index', () {
      registry.register('s', SiloImageType.backdrop, '/a.webp');
      registry.register('s', SiloImageType.backdrop, '/b.webp', index: 1);
      expect(
        registry.urlFor('s', SiloImageType.backdrop),
        'https://silo.example/a.webp',
      );
      expect(
        registry.urlFor('s', SiloImageType.backdrop, index: 1),
        'https://silo.example/b.webp',
      );
    });

    test('a fresher signature replaces the old URL and keeps the tag', () {
      final first = registry.register(
        'm',
        SiloImageType.primary,
        '$_poster?sig=old',
      );
      final second = registry.register(
        'm',
        SiloImageType.primary,
        '$_poster?sig=new',
      );
      expect(second, first);
      expect(registry.urlFor('m', SiloImageType.primary), endsWith('sig=new'));
      expect(registry.length, 1);
    });

    test('an empty URL registers nothing', () {
      expect(registry.register('m', SiloImageType.logo, ''), isNull);
      expect(registry.register('m', SiloImageType.logo, null), isNull);
      expect(registry.length, 0);
    });

    test('the tag does not depend on the server address', () {
      final lan = registry.register('m', SiloImageType.primary, _poster);
      baseUrl = 'https://public.example';
      final public = registry.register('m', SiloImageType.primary, _poster);
      expect(public, lan);
    });

    test('the base URL is read when registering', () {
      baseUrl = 'https://new.example';
      registry.register('m', SiloImageType.primary, '/p.webp');
      expect(
        registry.urlFor('m', SiloImageType.primary),
        'https://new.example/p.webp',
      );
    });

    test('every artwork URL in the movie fixture registers', () {
      final movie =
          jsonDecode(fixture('silo/catalog_item_movie.json'))
              as Map<String, dynamic>;
      final id = movie['content_id'] as String;
      expect(
        registry.register(id, SiloImageType.primary, movie['poster_url']),
        isNotNull,
      );
      expect(
        registry.register(id, SiloImageType.backdrop, movie['backdrop_url']),
        isNotNull,
      );
      expect(
        registry.register(id, SiloImageType.logo, movie['logo_url']),
        isNotNull,
      );
      expect(
        registry.urlFor(id, SiloImageType.primary),
        startsWith('https://silo.example/api/v2/artwork/'),
      );
      registry.clear();
      expect(registry.length, 0);
    });

    test('Jellyfin names for ImageTags', () {
      expect(SiloImageType.primary.jellyfinName, 'Primary');
      expect(SiloImageType.art.jellyfinName, 'Art');
    });
  });

  group('SiloImageCapabilities', () {
    final caps = SiloImageCapabilities.fromJson(
      jsonDecode(fixture('silo/images_capabilities.json'))
          as Map<String, dynamic>,
    );

    test('reads the fixture', () {
      expect(caps.param, 'image_size');
      expect(caps.sizes, ['small', 'medium', 'large', 'original']);
      expect(caps.widths['poster'], {
        'small': 300,
        'medium': 500,
        'large': 780,
      });
      expect(caps.originalMaxWidth, 1920);
    });

    test('picks the smallest bucket that is wide enough', () {
      expect(caps.sizeFor('poster', 200), 'small');
      expect(caps.sizeFor('poster', 300), 'small');
      expect(caps.sizeFor('poster', 301), 'medium');
      expect(caps.sizeFor('poster', 700), 'large');
      expect(caps.sizeFor('backdrop', 1280), 'medium');
      expect(caps.sizeFor('logo', 900), 'large');
    });

    test('wider than every bucket takes original', () {
      expect(caps.sizeFor('poster', 1000), 'original');
      expect(caps.sizeFor('backdrop', 3840), 'original');
    });

    test('no width means medium; an unknown kind reads like a poster', () {
      expect(caps.sizeFor('poster', null), 'medium');
      expect(caps.sizeFor('hologram', 400), 'medium');
    });

    test('fetched from GET /images/capabilities', () async {
      final server = FixtureServer({
        '/api/v2/images/capabilities': FixtureServer.file(
          'silo/images_capabilities.json',
        ),
      });
      final client = SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'd',
          name: 'Test',
          appName: 'Moonfin',
          appVersion: '1',
        ),
        httpClientAdapter: server,
      );

      final fetched = await client.imagesApi.capabilities();

      expect(fetched.sizeFor('poster', 301), 'medium');
      expect(server.requests.single.uri.path, '/api/v2/images/capabilities');
    });
  });
}
