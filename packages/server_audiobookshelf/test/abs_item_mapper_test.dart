import 'package:server_audiobookshelf/src/abs_ids.dart';
import 'package:server_audiobookshelf/src/abs_item_mapper.dart';
import 'package:test/test.dart';

Map<String, dynamic> _minified({
  String id = 'book-1',
  int numTracks = 1,
  num duration = 600,
  String? ebookFormat,
  String seriesName = 'Mock Series #2',
}) => {
  'id': id,
  'libraryId': 'lib-a',
  'addedAt': 1795759778814,
  'updatedAt': 1795759778814,
  'mediaType': 'book',
  'relPath': 'Test Author/Mock Series/Book 2 - Chapter Test',
  'media': {
    'metadata': {
      'title': 'Chapter Test',
      'titleIgnorePrefix': 'Chapter Test',
      'authorName': 'Test Author',
      'narratorName': 'Test Narrator',
      'seriesName': seriesName,
      'genres': ['Test'],
      'publishedYear': '2024',
      'description': 'Five chapters.',
    },
    'coverPath': '/mock/cover.jpg',
    'tags': [],
    'numTracks': numTracks,
    'duration': duration,
    'ebookFormat': ?ebookFormat,
  },
};

void main() {
  test('a minified audiobook reads as an AudioBook with its series and people', () {
    final item = absBookToJellyfin(_minified());

    expect(item['Type'], 'AudioBook');
    expect(item['MediaType'], 'Audio');
    expect(item['ParentId'], absLibraryId('lib-a'));
    expect(item['SeriesName'], 'Mock Series');
    expect(item['IndexNumber'], 2);
    expect(item['AlbumArtist'], 'Test Author');
    expect(item['People'], [
      {'Name': 'Test Author', 'Type': 'Author'},
      {'Name': 'Test Narrator', 'Type': 'Narrator', 'Role': 'Narrator'},
    ]);
    expect(item['RunTimeTicks'], 600 * absTicksPerSecond);
    expect(item['ProductionYear'], 2024);
    expect((item['ImageTags'] as Map)['Primary'], '1795759778814');
    expect(item['CanDownload'], isTrue);
  });

  test('an expanded book takes ids, narrators and chapters from the lists', () {
    final item = absBookToJellyfin({
      ..._minified(numTracks: 3, duration: 540),
      'media': {
        'metadata': {
          'title': 'Multi File Test',
          'authors': [
            {'id': 'author-x', 'name': 'Test Author'},
          ],
          'narrators': ['Test Narrator'],
          'series': [
            {'id': 'series-x', 'name': 'Mock Series', 'sequence': '1'},
          ],
        },
        'coverPath': '/c.jpg',
        'numTracks': 3,
        'duration': 540,
        'chapters': [
          {'id': 0, 'start': 0, 'end': 180, 'title': 'Part 1'},
          {'id': 1, 'start': 180.5, 'end': 360, 'title': 'Part 2'},
        ],
        'tracks': [
          {
            'contentUrl': '/api/items/book-1/file/1',
            'duration': 180,
            'metadata': {'ext': '.mp3', 'size': 2000},
          },
          {'contentUrl': '/api/items/book-1/file/2', 'metadata': {'ext': '.mp3'}},
          {'contentUrl': '/api/items/book-1/file/3', 'metadata': {'ext': '.mp3'}},
        ],
      },
    });

    expect(item['SeriesId'], absSeriesId('series-x'));
    expect(item['IndexNumber'], 1);
    expect(item['AlbumArtists'], [
      {'Name': 'Test Author', 'Id': absAuthorId('author-x')},
    ]);
    expect(item['Chapters'], [
      {'StartPositionTicks': 0, 'Name': 'Part 1'},
      {'StartPositionTicks': 1805000000, 'Name': 'Part 2'},
    ]);
    // Several files download one by one.
    expect(item['CanDownload'], isTrue);
    expect((item['MediaSources'] as List).single['DirectStreamUrl'], isNull);
    final tracks = item['AbsTracks'] as List;
    expect(tracks, hasLength(3));
    expect(tracks.first, {
      'Url': '/api/items/book-1/file/1',
      'Duration': 180,
      'Size': 2000,
      'Container': 'mp3',
    });
  });

  test('a single file book names its file for downloads', () {
    final item = absBookToJellyfin({
      ..._minified(),
      'media': {
        ...(_minified()['media'] as Map<String, dynamic>),
        'tracks': [
          {
            'contentUrl': '/api/items/book-1/file/930136',
            'codec': 'aac',
            'metadata': {'ext': '.m4b', 'filename': 'Chapter Test.m4b', 'size': 4934967},
          },
        ],
      },
    });

    final source = (item['MediaSources'] as List).single as Map;
    expect(source['DirectStreamUrl'], '/api/items/book-1/file/930136');
    expect(source['Container'], 'm4b');
    expect(source['Size'], 4934967);
    expect(item['Container'], 'm4b');
  });

  test('an ebook only item is a Book the reader can open', () {
    final item = absBookToJellyfin({
      ..._minified(numTracks: 0, duration: 0, ebookFormat: 'epub', seriesName: ''),
      'media': {
        'metadata': {'title': 'Ebook Test', 'authorName': 'Ebook Author'},
        'coverPath': '/c.jpg',
        'numTracks': 0,
        'duration': 0,
        'ebookFormat': 'epub',
        'ebookFile': {
          'metadata': {'filename': 'Ebook Test.epub', 'size': 4127},
          'ebookFormat': 'epub',
        },
      },
    });

    expect(item['Type'], 'Book');
    expect(item['MediaType'], 'Book');
    expect(item['Path'], 'Ebook Test.epub');
    expect(item['RunTimeTicks'], absEbookRunTimeTicks);
    expect(item.containsKey('SeriesName'), isFalse);
    expect(
      (item['MediaSources'] as List).single['DirectStreamUrl'],
      '/api/items/book-1/ebook',
    );
  });

  group('user data', () {
    test('audio progress becomes the resume position', () {
      final data = absUserData({
        'currentTime': 210,
        'progress': 0.3888,
        'isFinished': false,
        'lastUpdate': 1795759816261,
      }, ebook: false);

      expect(data['PlaybackPositionTicks'], 210 * absTicksPerSecond);
      expect(data['PlayedPercentage'], closeTo(38.88, 0.001));
      expect(data['Played'], isFalse);
      expect(data['LastPlayedDate'], startsWith('2026-'));
    });

    test('an EPUB position is its share of the reader runtime', () {
      final data = absUserData({'ebookProgress': 0.4}, ebook: true, ebookFormat: 'epub');
      expect(data['PlaybackPositionTicks'], (0.4 * absEbookRunTimeTicks).floor());
    });

    test('a PDF position is the page the location names', () {
      final data = absUserData({'ebookLocation': '3', 'ebookProgress': 0.5}, ebook: true, ebookFormat: 'pdf');
      expect(data['PlaybackPositionTicks'], 2 * absTicksPerPage);
    });

    test('a finished book has no resume position', () {
      final data = absUserData({'currentTime': 500, 'isFinished': true}, ebook: false);
      expect(data['Played'], isTrue);
      expect(data['PlaybackPositionTicks'], 0);
    });
  });

  test('a series borrows its first book cover through its tag', () {
    final series = absSeriesToJellyfin({
      'id': 's1',
      'name': 'Mock Series',
      'libraryId': 'lib-a',
      'books': [
        {'id': 'b1', 'updatedAt': 7, 'media': {'coverPath': '/c.jpg'}},
      ],
    });
    final tag = (series['ImageTags'] as Map)['Primary'] as String;
    expect(absBorrowedCover(tag), (itemId: 'b1', tag: '7'));
    expect(series['Id'], absSeriesId('s1'));
  });

  test('a podcast is an album and its episodes are tracks', () {
    final podcast = {
      'id': 'pod',
      'libraryId': 'lib-p',
      'mediaType': 'podcast',
      'updatedAt': 9,
      'media': {
        'metadata': {'title': 'Mock Podcast', 'author': 'Host'},
        'coverPath': '/p.jpg',
        'episodes': [
          {'id': 'ep1', 'title': 'Episode 1', 'duration': 60, 'publishedAt': 1795759778814},
        ],
      },
    };
    expect(absItemToJellyfin(podcast)['Type'], 'MusicAlbum');
    final episode = absEpisodeToJellyfin(podcast, {
      'id': 'ep1',
      'title': 'Episode 1',
      'audioFile': {'duration': 60},
    });
    expect(episode['Id'], absEpisodeId('pod', 'ep1'));
    expect(episode['AlbumId'], 'pod');
    expect(episode['RunTimeTicks'], 60 * absTicksPerSecond);
    expect(absEpisodeKey(episode['Id'] as String), (itemId: 'pod', episodeId: 'ep1'));
  });

  test('ids keep library items bare and tell the other kinds apart', () {
    expect(absIsLibraryItemId('8db5a0b9-578a-4a46-a2f4-fb6958e3a244'), isTrue);
    expect(absIsLibraryItemId(absSeriesId('x')), isFalse);
    expect(absGenreKey(absGenreId('Sci-Fi & Fantasy')), 'Sci-Fi & Fantasy');
    expect(absItemIdOf(absEpisodeId('pod', 'ep')), 'pod');
  });
}
