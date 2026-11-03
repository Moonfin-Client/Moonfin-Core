import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

const _device = DeviceInfo(
  id: 'd',
  name: 'Test',
  appName: 'Moonfin',
  appVersion: '1',
);

SiloMediaServerClient _client(FixtureServer server) => SiloMediaServerClient(
  baseUrl: 'https://silo.example',
  deviceInfo: _device,
  httpClientAdapter: server,
);

void main() {
  group('placeholder URLs', () {
    test('round trip', () {
      final url = siloImagePlaceholderUrl(
        'https://silo.example/',
        'movie-imdb-tt0295701',
        SiloImageType.backdrop,
        index: 2,
      );
      expect(
        url,
        'https://silo.example/api/v2/__moonfin/image'
        '?item=movie-imdb-tt0295701&type=backdrop&index=2',
      );
      final r = parseSiloImagePlaceholder(url)!;
      expect(r.itemId, 'movie-imdb-tt0295701');
      expect(r.type, SiloImageType.backdrop);
      expect(r.index, 2);
    });

    test('ordinary URLs are not placeholders', () {
      expect(parseSiloImagePlaceholder('https://silo.example/a.webp'), isNull);
      expect(
        parseSiloImagePlaceholder(
          'https://silo.example/api/v2/__moonfin/image?type=primary',
        ),
        isNull,
      );
    });

    test('app-wide: ordinary URLs answer null synchronously', () {
      expect(SiloImageResolution.resolve('https://emby.example/a.jpg'), isNull);
    });
  });

  group('the image API hands them out only for unseen items', () {
    test('unseen → placeholder; seen without that image → empty', () {
      final client = _client(FixtureServer({}));
      final api = client.imageApi;
      expect(
        parseSiloImagePlaceholder(api.getLogoImageUrl('movie-x')),
        isNotNull,
      );
      siloItemToBaseItemDto({
        'type': 'movie',
        'content_id': 'movie-x',
        'poster_url': '/api/v2/artwork/p.webp?sig=1',
      }, images: client.images);
      expect(api.getLogoImageUrl('movie-x'), '');
      expect(api.getPrimaryImageUrl('movie-x'), contains('/artwork/p.webp'));
      client.dispose();
    });
  });

  group('resolving through the client', () {
    test('a catalog item is loaded once, at the large size', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/movie-imdb-tt0295701': FixtureServer.file(
          'silo/catalog_item_movie.json',
        ),
      });
      final client = _client(server);
      final poster = client.imageApi.getPrimaryImageUrl('movie-imdb-tt0295701');
      final logo = client.imageApi.getLogoImageUrl('movie-imdb-tt0295701');

      final results = await Future.wait([
        SiloImageResolution.resolve(poster)!,
        SiloImageResolution.resolve(logo)!,
      ]);

      expect(results[0], startsWith('https://silo.example/api/v2/artwork/'));
      expect(results[1], isNotNull);
      expect(server.requests, hasLength(1));
      expect(server.requests.single.uri.queryParameters['image_size'], 'large');
      // Now known: the API answers directly.
      expect(
        client.imageApi.getPrimaryImageUrl('movie-imdb-tt0295701'),
        results[0],
      );
      client.dispose();
    });

    test('a library poster, from the library list', () async {
      final server = FixtureServer({
        '/api/v2/user/libraries': FixtureServer.file(
          'silo/user_libraries.json',
        ),
      });
      final client = _client(server);
      final url = client.imageApi.getPrimaryImageUrl('3');

      expect(
        await SiloImageResolution.resolve(url),
        contains('/library-posters/3.png'),
      );
      client.dispose();
    });

    test('a person, when no library has the id', () async {
      final server = FixtureServer({
        '/api/v2/user/libraries': FixtureServer.file(
          'silo/user_libraries.json',
        ),
        '/api/v2/catalog/people/146552272560604468': FixtureServer.file(
          'silo/person.json',
        ),
      });
      final client = _client(server);
      final url = client.imageApi.getPrimaryImageUrl('146552272560604468');

      expect(await SiloImageResolution.resolve(url), startsWith('http'));
      expect(
        server.requests.last.uri.path,
        endsWith('/people/146552272560604468'),
      );
      client.dispose();
    });

    test('a profile avatar, from the profile list', () async {
      final server = FixtureServer({
        '/api/v2/user/libraries': FixtureServer.file(
          'silo/user_libraries.json',
        ),
        '/api/v2/profiles': (_) => FixtureServer.json(
          200,
          '{"items":[{"id":"aaaa-bbbb","name":"P","is_primary":true,'
          '"avatar_url":"/avatars/presets/fox.png"}]}',
        ),
      });
      final client = _client(server);

      expect(
        await SiloImageResolution.resolve(
          client.imageApi.getUserImageUrl('aaaa-bbbb'),
        ),
        'https://silo.example/avatars/presets/fox.png',
      );
      client.dispose();
    });

    test('a failed load gives null and is not retried for a while', () async {
      final server = FixtureServer({});
      final client = _client(server);
      final url = client.imageApi.getPrimaryImageUrl('movie-gone');

      expect(await SiloImageResolution.resolve(url), isNull);
      expect(await SiloImageResolution.resolve(url), isNull);
      expect(server.requests, hasLength(1));
      client.dispose();
    });

    test('an item without that image gives null', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/movie-y': (_) => FixtureServer.json(
          200,
          '{"type":"movie","content_id":"movie-y","title":"Y"}',
        ),
      });
      final client = _client(server);

      expect(
        await SiloImageResolution.resolve(
          client.imageApi.getBannerImageUrl('movie-y'),
        ),
        isNull,
      );
      client.dispose();
    });

    test('a disposed client\'s placeholders resolve to null', () async {
      final client = _client(FixtureServer({}));
      final url = client.imageApi.getPrimaryImageUrl('movie-z');
      client.dispose();
      expect(await SiloImageResolution.resolve(url), isNull);
    });
  });

  group('SiloImageResolver', () {
    test('retries after the wait', () async {
      var now = DateTime.utc(2026);
      var calls = 0;
      final registry = SiloImageRegistry(() => 'https://silo.example');
      final resolver = SiloImageResolver(
        registry: registry,
        baseUrl: () => 'https://silo.example',
        load: (_) async {
          calls++;
          throw StateError('offline');
        },
        clock: () => now,
      );
      final url = siloImagePlaceholderUrl(
        'https://silo.example',
        'm',
        SiloImageType.primary,
      );
      await resolver.resolve(url);
      await resolver.resolve(url);
      expect(calls, 1);
      now = now.add(const Duration(minutes: 11));
      await resolver.resolve(url);
      expect(calls, 2);
    });

    test('owns only its own server\'s placeholders', () {
      final resolver = SiloImageResolver(
        registry: SiloImageRegistry(() => 'https://a.example'),
        baseUrl: () => 'https://a.example/',
        load: (_) async {},
      );
      expect(
        resolver.owns(
          siloImagePlaceholderUrl('https://a.example', 'm', SiloImageType.logo),
        ),
        isTrue,
      );
      expect(
        resolver.owns(
          siloImagePlaceholderUrl('https://b.example', 'm', SiloImageType.logo),
        ),
        isFalse,
      );
    });
  });
}
