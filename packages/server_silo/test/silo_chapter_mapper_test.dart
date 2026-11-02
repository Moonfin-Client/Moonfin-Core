import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

List<Map<String, dynamic>> _chapters(Object? item) =>
    ((item as Map)['Chapters'] as List).cast<Map<String, dynamic>>();

void main() {
  late SiloImageRegistry images;

  setUp(() => images = SiloImageRegistry(() => 'https://silo.example'));

  group('golden against Emby', () {
    test('xXx: 16 chapters at the same times', () {
      final silo = _chapters(
        siloItemToBaseItemDto(
          _json('silo/catalog_item_movie.json'),
          images: images,
        ),
      );
      final emby = _chapters(_json('emby/item_movie.json'));
      expect(silo, hasLength(16));
      expect(
        silo.map((c) => c['StartPositionTicks']),
        emby.map((c) => c['StartPositionTicks']),
      );
      expect(
        silo.map((c) => c['ChapterIndex']),
        emby.map((c) => c['ChapterIndex']),
      );
      expect(silo.every((c) => c['MarkerType'] == 'Chapter'), isTrue);
      // The file's own chapter names ("01"), while Emby makes up "Chapter 1".
      expect(silo.first['Name'], '01');
    });

    test(
      'Young Justice 1x01: the real chapters, without Emby\'s intro marks',
      () {
        final silo = _chapters(
          siloItemToBaseItemDto(
            _json('silo/catalog_item_episode.json'),
            images: images,
          ),
        );
        final emby = _chapters(
          _json('emby/item_episode.json'),
        ).where((c) => c['MarkerType'] == 'Chapter').toList();
        expect(silo.map((c) => c['Name']), emby.map((c) => c['Name']));
        expect(
          silo.map((c) => c['StartPositionTicks']),
          emby.map((c) => c['StartPositionTicks']),
        );
      },
    );

    test('from /watch too', () {
      expect(
        _chapters(siloItemToBaseItemDto(_json('silo/watch_episode.json'))),
        hasLength(6),
      );
    });
  });

  group('thumbnails', () {
    test('registered per chapter, tag on the chapter', () {
      final item = siloItemToBaseItemDto(
        _json('silo/catalog_item_movie.json'),
        images: images,
      )!;
      final chapters = _chapters(item);
      for (final (i, c) in chapters.indexed) {
        expect(c['ImageTag'], isNotNull);
        expect(
          c['ImageTag'],
          images.tagFor(item['Id'] as String, SiloImageType.chapter, index: i),
        );
      }
      expect(
        images.urlFor(item['Id'] as String, SiloImageType.chapter, index: 3),
        contains('/chapter-images/4598/3-'),
      );
      // Each chapter picture has its own tag.
      expect(chapters.map((c) => c['ImageTag']).toSet(), hasLength(16));
    });

    test('no thumbnail or no registry, no tag', () {
      final version = {
        'chapters': [
          {'index': 0, 'title': 'A', 'start_seconds': 0},
        ],
      };
      expect(
        siloChaptersToJellyfin(version, itemId: 'm', images: images).single,
        isNot(contains('ImageTag')),
      );
      expect(
        siloChaptersToJellyfin(
          _json('silo/catalog_item_movie.json')['versions'][0]
              as Map<String, dynamic>,
          itemId: 'm',
        ).first,
        isNot(contains('ImageTag')),
      );
    });
  });

  group('rules', () {
    List<Map<String, dynamic>> map(List<Object?> chapters) =>
        siloChaptersToJellyfin({'chapters': chapters}, itemId: 'm');

    test('in start order, keeping Silo order for equal starts', () {
      final c = map([
        {'title': 'C', 'start_seconds': 20},
        {'title': 'A', 'start_seconds': 0},
        {'title': 'B1', 'start_seconds': 10},
        {'title': 'B2', 'start_seconds': 10},
      ]);
      expect(c.map((x) => x['Name']), ['A', 'B1', 'B2', 'C']);
      expect(c.map((x) => x['ChapterIndex']), [0, 1, 2, 3]);
      expect(c[2]['StartPositionTicks'], 100000000);
    });

    test('no start is skipped; no title has no Name; negative starts at 0', () {
      final c = map([
        {'title': 'nowhere'},
        'junk',
        {'start_seconds': -1},
        {'title': '  ', 'start_seconds': 5.5},
      ]);
      expect(c, hasLength(2));
      expect(c.first['StartPositionTicks'], 0);
      expect(c.last, isNot(contains('Name')));
      expect(c.last['StartPositionTicks'], 55000000);
    });

    test('no chapter list is an empty list', () {
      expect(siloChaptersToJellyfin({}, itemId: 'm'), isEmpty);
    });

    test('the item takes the default version\'s chapters', () {
      // The Salt Path: the 4K default has none, the 1080p file has 12.
      final item = siloItemToBaseItemDto(
        _json('silo/catalog_item_movie_multi.json'),
      )!;
      expect(item['Chapters'], isEmpty);
    });

    test('each version carries its own on its media source', () {
      final item = siloItemToBaseItemDto(
        _json('silo/catalog_item_movie_multi.json'),
        images: images,
      )!;
      final sources = (item['MediaSources'] as List).cast<Map>();
      final byId = {for (final s in sources) '${s['Id']}': s['Chapters']};
      expect(byId['4603'], isEmpty);
      final hd = (byId['4602'] as List).cast<Map<String, dynamic>>();
      expect(hd, hasLength(12));
      // Their thumbnails are found by tag, whichever version they belong to.
      final tag = hd.first['ImageTag'] as String;
      expect(images.urlForTag(tag), contains('/chapter-images/4602/0-'));
      expect(identical(item['Chapters'], sources.first['Chapters']), isTrue);
    });

    test('season list entries carry no chapter field', () {
      final entry =
          (_json('silo/season_episodes.json')['items'] as List).first
              as Map<String, dynamic>;
      expect(
        siloItemToBaseItemDto(entry, type: 'episode'),
        isNot(contains('Chapters')),
      );
    });
  });
}
