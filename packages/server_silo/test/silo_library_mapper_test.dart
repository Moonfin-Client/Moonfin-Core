import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

void main() {
  late SiloImageRegistry images;

  setUp(() => images = SiloImageRegistry(() => 'https://silo.example'));

  group('golden: the same libraries on Emby', () {
    late List<Map<String, dynamic>> silo;
    late List<Map<String, dynamic>> emby;

    setUp(() {
      silo = siloLibrariesToUserViews(
        _json('silo/user_libraries.json')['items'] as List,
        images: images,
      );
      emby = (_json('emby/user_views.json')['Items'] as List)
          .cast<Map<String, dynamic>>();
    });

    test('movies and TV, in order, with Emby\'s collection types', () {
      expect(silo.map((v) => v['Name']), ['Movies', 'TV Shows']);
      expect(silo.map((v) => v['CollectionType']), [
        emby[0]['CollectionType'],
        emby[1]['CollectionType'],
      ]);
      expect(silo.map((v) => v['Id']), ['1', '3']);
    });

    test('the fields Moonfin reads have Emby\'s shape', () {
      for (final (i, view) in silo.indexed) {
        for (final key in ['Type', 'IsFolder', 'UserData']) {
          expect(view[key], emby[i][key], reason: '${view['Name']} $key');
        }
        expect(view['SortName'], view['Name']);
        expect(view['BackdropImageTags'], isEmpty);
      }
    });

    test('the poster is registered under the library', () {
      for (final view in silo) {
        final id = view['Id'] as String;
        final tag = (view['ImageTags'] as Map)['Primary'];
        expect(tag, isNotNull);
        expect(tag, images.tagFor(id, SiloImageType.primary));
        expect(
          images.urlFor(id, SiloImageType.primary),
          startsWith('https://silo.example/api/v2/artwork/library-posters/'),
        );
      }
    });

    test('the Silo library is kept for later steps', () {
      expect((silo.first[siloOriginalKey] as Map)['type'], 'movies');
    });
  });

  group('collection types', () {
    Map<String, dynamic>? view(String type) => siloLibraryToCollectionFolder({
      'id': '9',
      'name': 'L',
      'type': type,
      'sort_order': 1,
    });

    test('each Silo type', () {
      expect(view('movies')!['CollectionType'], 'movies');
      expect(view('series')!['CollectionType'], 'tvshows');
      expect(view('audiobooks')!['CollectionType'], 'audiobooks');
      expect(view('ebooks')!['CollectionType'], 'books');
      expect(view('Movies')!['CollectionType'], 'movies');
    });

    test('a mixed library has none, as on Jellyfin', () {
      final mixed = view('mixed')!;
      expect(mixed, isNot(contains('CollectionType')));
      expect(mixed['Type'], 'CollectionFolder');
    });

    test('podcasts, manga and unknown types do not map', () {
      expect(view('podcasts'), isNull);
      expect(view('manga'), isNull);
      expect(view('holograms'), isNull);
      expect(siloLibraryToCollectionFolder({'id': '9', 'name': 'L'}), isNull);
    });

    test('a numeric id becomes a string; no id does not map', () {
      expect(
        siloLibraryToCollectionFolder({'id': 4, 'type': 'movies'})!['Id'],
        '4',
      );
      expect(siloLibraryToCollectionFolder({'type': 'movies'}), isNull);
    });

    test('no poster or no registry gives no image tag', () {
      expect(view('movies')!['ImageTags'], isEmpty);
      final noPoster = siloLibraryToCollectionFolder({
        'id': '9',
        'type': 'movies',
      }, images: images)!;
      expect(noPoster['ImageTags'], isEmpty);
    });
  });

  group('user views', () {
    List<String> names(List<Object?> libraries) => [
      for (final v in siloLibrariesToUserViews(libraries)) v['Name'] as String,
    ];

    test('only libraries Moonfin can open today', () {
      expect(
        names([
          {'id': '1', 'name': 'Movies', 'type': 'movies', 'sort_order': 1},
          {'id': '2', 'name': 'Books', 'type': 'ebooks', 'sort_order': 2},
          {'id': '3', 'name': 'Listen', 'type': 'audiobooks', 'sort_order': 3},
          {'id': '4', 'name': 'Pods', 'type': 'podcasts', 'sort_order': 4},
          {'id': '5', 'name': 'Comics', 'type': 'manga', 'sort_order': 5},
          {'id': '6', 'name': 'Home', 'type': 'mixed', 'sort_order': 6},
          {'id': '7', 'name': 'TV', 'type': 'series', 'sort_order': 7},
        ]),
        ['Movies', 'Home', 'TV'],
      );
    });

    test('books show once supported', () {
      final views = siloLibrariesToUserViews(
        [
          {'id': '2', 'name': 'Books', 'type': 'ebooks'},
          {'id': '3', 'name': 'Listen', 'type': 'audiobooks'},
        ],
        supported: {...siloSupportedLibraryTypes, 'ebooks', 'audiobooks'},
      );
      expect(views.map((v) => v['CollectionType']), ['books', 'audiobooks']);
    });

    test('sort_order, keeping Silo order among equals, unnumbered last', () {
      expect(
        names([
          {'id': 'c', 'name': 'C', 'type': 'movies', 'sort_order': 2},
          {'id': 'x', 'name': 'X', 'type': 'movies'},
          {'id': 'a', 'name': 'A', 'type': 'movies', 'sort_order': 0},
          {'id': 'b1', 'name': 'B1', 'type': 'movies', 'sort_order': 1},
          {'id': 'b2', 'name': 'B2', 'type': 'movies', 'sort_order': 1},
          {'id': 'y', 'name': 'Y', 'type': 'movies'},
        ]),
        ['A', 'B1', 'B2', 'C', 'X', 'Y'],
      );
    });

    test('entries that are not libraries are skipped', () {
      expect(
        names([
          null,
          'oops',
          {'name': 'No id', 'type': 'movies'},
          {'id': '1', 'name': 'Movies', 'type': 'movies'},
        ]),
        ['Movies'],
      );
    });

    test('an empty list is empty', () {
      expect(siloLibrariesToUserViews(const []), isEmpty);
    });
  });
}
