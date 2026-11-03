import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

void main() {
  late SiloImageRegistry images;

  setUp(() => images = SiloImageRegistry(() => 'https://silo.example'));

  group('the episode sample', () {
    // Written from the schema, not captured from a server. Every
    // expectation is read from the file itself.
    late Map<String, dynamic> silo;
    late Map<String, dynamic> mapped;

    setUp(() {
      silo = _json('silo/watch_trickplay_episode.json');
      mapped = siloTrickplayToJellyfin(silo, images: images)!;
    });

    test('keyed by file id, then width', () {
      final fileId = silo['file_id'] as String;
      expect(mapped.keys, [fileId]);
      final widths = mapped[fileId] as Map;
      expect(widths.keys, ['${silo['thumbnail_width']}']);
    });

    test('the entry Moonfin\'s TrickplayInfo reads', () {
      final entry =
          (mapped[silo['file_id']] as Map).values.single
              as Map<String, dynamic>;
      expect(entry, {
        'Width': silo['thumbnail_width'],
        'Height': silo['thumbnail_height'],
        'TileWidth': silo['tile_columns'],
        'TileHeight': silo['tile_rows'],
        'ThumbnailCount': silo['thumbnail_count'],
        'Interval': silo['interval_ms'],
        'Bandwidth': 0,
        siloTrickplayExpiresKey: silo['expires_at'],
      });
    });

    test('every sheet is registered under the file id by its index', () {
      final fileId = silo['file_id'] as String;
      for (final sheet in (silo['sheets'] as List).cast<Map>()) {
        expect(
          images.urlFor(
            fileId,
            SiloImageType.trickplay,
            index: sheet['index'] as int,
          ),
          'https://silo.example${sheet['url']}',
        );
      }
    });

    test('Jellyfin\'s tile arithmetic finds the right sheet', () {
      // TrickplayInfo: tile = ms ~/ Interval, sheet = tile ~/ (cols × rows).
      final entry = (mapped[silo['file_id']] as Map).values.single as Map;
      final perSheet =
          (entry['TileWidth'] as int) * (entry['TileHeight'] as int);
      final interval = entry['Interval'] as int;
      final lastThumbnail = (entry['ThumbnailCount'] as int) - 1;
      final sheet = (lastThumbnail * interval) ~/ interval ~/ perSheet;
      expect(sheet, (silo['sheets'] as List).length - 1);
    });
  });

  group('rules', () {
    Map<String, dynamic> base() => {
      'file_id': '7',
      'interval_ms': 5000,
      'thumbnail_width': 240,
      'thumbnail_height': 100,
      'tile_columns': 5,
      'tile_rows': 4,
      'thumbnail_count': 30,
      'sheets': [
        {'index': 0, 'url': '/s/0.jpg'},
        {'index': 1, 'url': '/s/1.jpg'},
      ],
      'expires_at': '2026-10-15T00:00:00.000Z',
    };

    test('incomplete answers give null', () {
      for (final key in [
        'file_id',
        'interval_ms',
        'thumbnail_width',
        'thumbnail_height',
        'tile_columns',
        'tile_rows',
        'sheets',
      ]) {
        expect(
          siloTrickplayToJellyfin(base()..remove(key)),
          isNull,
          reason: key,
        );
      }
      expect(siloTrickplayToJellyfin(base()..['sheets'] = []), isNull);
      expect(siloTrickplayToJellyfin(base()..['tile_rows'] = 0), isNull);
    });

    test('a numeric file id becomes a string', () {
      expect(siloTrickplayToJellyfin(base()..['file_id'] = 7)!.keys, ['7']);
    });

    test('no count: every tile of every sheet', () {
      final m = siloTrickplayToJellyfin(base()..remove('thumbnail_count'))!;
      expect((m['7']['240'] as Map)['ThumbnailCount'], 40);
    });

    test('a sheet without an index takes its place in the list', () {
      siloTrickplayToJellyfin(
        base()
          ..['sheets'] = [
            {'url': '/a.jpg'},
            {'url': '/b.jpg'},
          ],
        images: images,
      );
      expect(
        images.urlFor('7', SiloImageType.trickplay, index: 1),
        'https://silo.example/b.jpg',
      );
    });

    test('fresh URLs replace old ones', () {
      siloTrickplayToJellyfin(base(), images: images);
      siloTrickplayToJellyfin(
        base()
          ..['sheets'] = [
            {'index': 0, 'url': '/s/0.jpg?sig=new'},
          ],
        images: images,
      );
      expect(images.urlFor('7', SiloImageType.trickplay), endsWith('sig=new'));
    });
  });
}
