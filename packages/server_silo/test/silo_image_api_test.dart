import 'dart:convert';

import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

void main() {
  late SiloImageRegistry registry;
  late SiloImageApi api;

  setUp(() {
    registry = SiloImageRegistry(() => 'https://silo.example');
    api = SiloImageApi(registry);
  });

  group('from mapped items', () {
    late Map<String, dynamic> movie;

    setUp(() {
      movie = siloItemToBaseItemDto(
        _json('silo/catalog_item_movie.json'),
        images: registry,
      )!;
    });

    test('every tag the item carries gives its URL', () {
      final id = movie['Id'] as String;
      final tags = (movie['ImageTags'] as Map).cast<String, String>();
      expect(
        api.getPrimaryImageUrl(id, tag: tags['Primary']),
        startsWith('https://silo.example/api/v2/artwork/'),
      );
      expect(api.getLogoImageUrl(id, tag: tags['Logo']), isNotEmpty);
      final backdrop = (movie['BackdropImageTags'] as List).first as String;
      expect(
        api.getBackdropImageUrl(id, tag: backdrop),
        registry.urlFor(id, SiloImageType.backdrop),
      );
      final count = (movie['BackdropImageTags'] as List).length;
      expect(api.getBackdropImageUrl(id, index: count - 1), isNotEmpty);
      expect(api.getBackdropImageUrl(id, index: count), '');
    });

    test('without a tag: the latest URL for the slot', () {
      final id = movie['Id'] as String;
      expect(
        api.getPrimaryImageUrl(id),
        registry.urlFor(id, SiloImageType.primary),
      );
    });

    test('thumb and banner fall back to the backdrop', () {
      final id = movie['Id'] as String;
      final backdrop = registry.urlFor(id, SiloImageType.backdrop);
      expect(api.getThumbImageUrl(id), backdrop);
      expect(api.getBannerImageUrl(id), backdrop);
    });

    test('chapters by index', () {
      final id = movie['Id'] as String;
      final chapters = (movie['Chapters'] as List).cast<Map>();
      expect(
        api.getChapterImageUrl(id, index: 2, tag: chapters[2]['ImageTag']),
        contains('/chapter-images/4598/2-'),
      );
    });

    test('a person\'s photo by person id', () {
      final person = (movie['People'] as List).cast<Map>().firstWhere(
        (p) => p['PrimaryImageTag'] != null,
      );
      expect(
        api.getPrimaryImageUrl(
          person['Id'] as String,
          tag: person['PrimaryImageTag'] as String,
        ),
        startsWith('http'),
      );
    });
  });

  group('tags pick the exact size', () {
    test(
      'a grid URL and a detail URL of the same slot both stay reachable',
      () {
        final medium = registry.register(
          'm',
          SiloImageType.primary,
          '/api/v2/artwork/p/w500.aaa.webp?sig=1',
        )!;
        final large = registry.register(
          'm',
          SiloImageType.primary,
          '/api/v2/artwork/p/w780.bbb.webp?sig=2',
        )!;
        expect(api.getPrimaryImageUrl('m', tag: medium), contains('w500'));
        expect(api.getPrimaryImageUrl('m', tag: large), contains('w780'));
        expect(api.getPrimaryImageUrl('m'), contains('w780'));
        // An unknown tag falls back to the slot.
        expect(api.getPrimaryImageUrl('m', tag: 'nope'), contains('w780'));
      },
    );
  });

  group('misses', () {
    test('nothing registered: an empty URL (the placeholder)', () {
      expect(api.getPrimaryImageUrl('unknown'), '');
      expect(api.getBackdropImageUrl('unknown'), '');
      expect(api.getLogoImageUrl('unknown'), '');
      expect(api.getThumbImageUrl('unknown'), '');
      expect(api.getBannerImageUrl('unknown'), '');
      expect(api.getChapterImageUrl('unknown', index: 0), '');
      expect(api.getUserImageUrl('unknown'), '');
    });

    test('trickplay needs the file id', () {
      registry.register('4598', SiloImageType.trickplay, '/t/0.jpg', index: 0);
      expect(api.getTrickplayTileImageUrl('m', width: 320, index: 0), '');
      expect(
        api.getTrickplayTileImageUrl(
          'm',
          width: 320,
          index: 0,
          mediaSourceId: '4598',
        ),
        'https://silo.example/t/0.jpg',
      );
    });
  });

  group('the client', () {
    test('imageApi reads the client\'s registry', () {
      final client = SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'd',
          name: 'Test',
          appName: 'Moonfin',
          appVersion: '1',
        ),
      );
      client.images.register('m', SiloImageType.logo, '/l.png');
      expect(
        client.imageApi.getLogoImageUrl('m'),
        'https://silo.example/l.png',
      );
    });
  });
}
