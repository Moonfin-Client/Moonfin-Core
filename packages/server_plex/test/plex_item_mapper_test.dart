import 'package:server_plex/src/plex_item_mapper.dart';
import 'package:test/test.dart';

void main() {
  test('maps a movie with its images, ratings and progress', () {
    final movie = plexItemToJellyfin({
      'ratingKey': '1715',
      'type': 'movie',
      'title': '10 Cloverfield Lane',
      'contentRating': 'PG-13',
      'rating': 9.1,
      'ratingImage': 'rottentomatoes://image.rating.ripe',
      'audienceRating': 7.9,
      'year': 2016,
      'thumb': '/library/metadata/1715/thumb/1792104771',
      'art': '/library/metadata/1715/art/1792104771',
      'duration': 6213916,
      'viewOffset': 1800000,
      'lastViewedAt': 1792123617,
      'originallyAvailableAt': '2016-03-10',
      'Image': [
        {'type': 'clearLogo', 'url': '/library/metadata/1715/clearLogo/1'},
      ],
      'Guid': [
        {'id': 'imdb://tt1179933'},
        {'id': 'tmdb://333371'},
      ],
      'Role': [
        {
          'id': 3053,
          'tag': 'John Goodman',
          'role': 'Howard',
          'thumb': 'https://metadata-static.plex.tv/people/goodman.jpg',
        },
      ],
      'Media': [
        {
          'id': 3720,
          'container': 'mkv',
          'bitrate': 9536,
          'Part': [
            {
              'key': '/library/parts/3721/1700000000/file.mkv',
              'size': 7407252142,
              'file': '/media/Movies/10 Cloverfield Lane (2016).mkv',
              'Stream': [
                {'streamType': 1, 'index': 0, 'codec': 'h264', 'width': 1920},
                {'streamType': 2, 'index': 1, 'codec': 'eac3', 'channels': 6},
              ],
            },
          ],
        },
      ],
    });

    expect(movie['Id'], '1715');
    expect(movie['Type'], 'Movie');
    expect(movie['IsFolder'], isFalse);
    expect(movie['RunTimeTicks'], 62139160000);
    expect(movie['CommunityRating'], 7.9);
    expect(movie['CriticRating'], 91);
    expect(movie['PremiereDate'], '2016-03-10T00:00:00.000Z');
    expect(movie['ImageTags'], {
      'Primary': '/library/metadata/1715/thumb/1792104771',
      'Logo': '/library/metadata/1715/clearLogo/1',
    });
    expect(movie['BackdropImageTags'], [
      '/library/metadata/1715/art/1792104771',
    ]);
    expect(movie['ProviderIds'], {'Imdb': 'tt1179933', 'Tmdb': '333371'});
    expect(movie['People'], [
      {
        'Id': 'person-3053',
        'Name': 'John Goodman',
        'Type': 'Actor',
        'Role': 'Howard',
        'PrimaryImageTag': 'https://metadata-static.plex.tv/people/goodman.jpg',
      },
    ]);
    final userData = movie['UserData'] as Map;
    expect(userData['PlaybackPositionTicks'], 18000000000);
    expect(userData['Played'], isFalse);
    expect(userData['PlayedPercentage'], closeTo(28.97, 0.01));
    expect(userData['LastPlayedDate'], '2026-10-16T04:06:57.000Z');
    expect(userData['IsFavorite'], isFalse);
    final source = (movie['MediaSources'] as List).single as Map;
    expect(source['Id'], '1715-0');
    expect(source['Bitrate'], 9536000);
    expect(source['Path'], '/media/Movies/10 Cloverfield Lane (2016).mkv');
    expect(
      source['DirectStreamUrl'],
      '/library/parts/3721/1700000000/file.mkv',
    );
    expect((movie['MediaStreams'] as List).map((s) => (s as Map)['Type']), [
      'Video',
      'Audio',
    ]);
  });

  test('points an episode at its show for series art and logo', () {
    final episode = plexItemToJellyfin({
      'ratingKey': '17100',
      'parentRatingKey': '17099',
      'grandparentRatingKey': '17098',
      'type': 'episode',
      'title': 'Countdown',
      'grandparentTitle': '3 Body Problem',
      'parentTitle': 'Season 1',
      'index': 1,
      'parentIndex': 1,
      'thumb': '/library/metadata/17100/thumb/1',
      'art': '/library/metadata/17098/art/1',
      'grandparentThumb': '/library/metadata/17098/thumb/1',
      'viewCount': 1,
      'Image': [
        {'type': 'clearLogo', 'url': '/library/metadata/17098/clearLogo/1'},
      ],
    });

    expect(episode['Type'], 'Episode');
    expect(episode['IsFolder'], isFalse);
    expect(episode['SeriesId'], '17098');
    expect(episode['SeriesName'], '3 Body Problem');
    expect(episode['SeasonId'], '17099');
    expect(episode['IndexNumber'], 1);
    expect(episode['ParentIndexNumber'], 1);
    expect(episode['SeriesPrimaryImageTag'], '/library/metadata/17098/thumb/1');
    expect(episode['ImageTags'], {
      'Primary': '/library/metadata/17100/thumb/1',
    });
    expect(episode['BackdropImageTags'], isEmpty);
    expect(episode['ParentBackdropItemId'], '17098');
    expect(episode['ParentBackdropImageTags'], [
      '/library/metadata/17098/art/1',
    ]);
    expect(episode['ParentLogoItemId'], '17098');
    expect(
      episode['ParentLogoImageTag'],
      '/library/metadata/17098/clearLogo/1',
    );
    expect((episode['UserData'] as Map)['Played'], isTrue);
    expect(episode.containsKey('MediaSources'), isFalse);
  });

  test('counts a show as a folder of unplayed episodes', () {
    final show = plexItemToJellyfin({
      'ratingKey': '17098',
      'type': 'show',
      'title': '3 Body Problem',
      'childCount': 1,
      'leafCount': 8,
      'viewedLeafCount': 1,
      'userRating': 10.0,
      'art': '/library/metadata/17098/art/1',
    });

    expect(show['Type'], 'Series');
    expect(show['IsFolder'], isTrue);
    expect(show['ChildCount'], 1);
    expect(show['RecursiveItemCount'], 8);
    expect(show['BackdropImageTags'], ['/library/metadata/17098/art/1']);
    final userData = show['UserData'] as Map;
    expect(userData['UnplayedItemCount'], 7);
    expect(userData['IsFavorite'], isTrue);
    expect(userData['Played'], isFalse);
  });

  test('leaves out closed captions carried in the video', () {
    final movie = plexItemToJellyfin({
      'ratingKey': '1804',
      'type': 'movie',
      'title': 'Despicable Me 3',
      'Media': [
        {
          'id': 3720,
          'Part': [
            {
              'Stream': [
                {'id': 9480, 'index': 0, 'streamType': 1, 'codec': 'h264'},
                {'id': 9481, 'index': 1, 'streamType': 2, 'codec': 'eac3'},
                {
                  'id': 9482,
                  'index': 0,
                  'streamType': 3,
                  'codec': 'eia_608',
                  'embeddedInVideo': '1',
                },
                {'id': 9483, 'index': 2, 'streamType': 3, 'codec': 'srt'},
              ],
            },
          ],
        },
      ],
    });

    expect(
      (movie['MediaStreams'] as List).map((s) => (s['Index'], s['Codec'])),
      [(0, 'h264'), (1, 'eac3'), (2, 'srt')],
    );
  });

  group('video details', () {
    Map<String, dynamic> video(Map<String, dynamic> stream) {
      final item = plexItemToJellyfin({
        'ratingKey': '55',
        'type': 'movie',
        'title': 'Avatar',
        'Media': [
          {
            'id': 1,
            'Part': [
              {
                'Stream': [
                  {'id': 1, 'index': 0, 'streamType': 1, ...stream},
                ],
              },
            ],
          },
        ],
      });
      return (item['MediaStreams'] as List).single as Map<String, dynamic>;
    }

    const dolbyVision81 = {
      'codec': 'hevc',
      'DOVIPresent': true,
      'DOVIProfile': 8,
      'DOVIBLCompatID': 1,
      'DOVIBLPresent': true,
      'DOVIRPUPresent': true,
      'colorPrimaries': 'bt2020',
      'colorSpace': 'bt2020nc',
      'colorTrc': 'smpte2084',
    };

    test('carries frame rate, bit depth, level and scan type', () {
      final stream = video({
        'codec': 'h264',
        'frameRate': 23.976,
        'bitDepth': 8,
        'level': 40,
        'scanType': 'progressive',
        'colorTrc': 'bt709',
      });

      expect(stream['RealFrameRate'], 23.976);
      expect(stream['AverageFrameRate'], 23.976);
      expect(stream['BitDepth'], 8);
      expect(stream['Level'], 40);
      expect(stream['IsInterlaced'], isFalse);
      expect(stream['VideoRange'], 'SDR');
      expect(stream['VideoRangeType'], 'SDR');
    });

    test('names the HDR type the way Jellyfin does', () {
      String type(Map<String, dynamic> stream) =>
          video(stream)['VideoRangeType'] as String;

      expect(type({'colorTrc': 'smpte2084'}), 'HDR10');
      expect(
        type({'colorTrc': 'smpte2084', 'HDR10PlusPresent': true}),
        'HDR10Plus',
      );
      expect(type({'colorTrc': 'arib-std-b67'}), 'HLG');
      expect(type(dolbyVision81), 'DOVIWithHDR10');
      expect(
        type({...dolbyVision81, 'HDR10PlusPresent': true}),
        'DOVIWithHDR10Plus',
      );
      expect(
        type({
          'DOVIProfile': 5,
          'DOVIBLCompatID': 0,
          'DOVIBLPresent': true,
          'DOVIRPUPresent': true,
        }),
        'DOVI',
      );
      expect(type({...dolbyVision81, 'colorSpace': 'bt709'}), 'DOVIInvalid');
      expect(video(dolbyVision81)['DvProfile'], 8);
      expect(video(dolbyVision81)['DvBlSignalCompatibilityId'], 1);
      expect(video(dolbyVision81)['VideoRange'], 'HDR');
    });
  });

  test('gives a track its album and artists, and an album its artist', () {
    final track = plexItemToJellyfin({
      'ratingKey': '23100',
      'type': 'track',
      'title': 'What These Bitches Want',
      'parentRatingKey': '23090',
      'grandparentRatingKey': '23089',
      'parentTitle': 'The Best of DMX',
      'grandparentTitle': 'DMX',
      'originalTitle': 'DMX feat. Sisqó',
      'parentThumb': '/library/metadata/23090/thumb/1',
    });
    final album = plexItemToJellyfin({
      'ratingKey': '23090',
      'type': 'album',
      'title': 'The Best of DMX',
      'parentRatingKey': '23089',
      'parentTitle': 'DMX',
    });

    expect(track['Album'], 'The Best of DMX');
    expect(track['AlbumId'], '23090');
    expect(track['AlbumPrimaryImageTag'], '/library/metadata/23090/thumb/1');
    expect(track['AlbumArtist'], 'DMX');
    expect(track['Artists'], ['DMX feat. Sisqó']);
    expect(album['AlbumArtists'], [
      {'Name': 'DMX', 'Id': '23089'},
    ]);
    expect(album['Artists'], ['DMX']);
    expect(album.containsKey('Album'), isFalse);
  });

  test('turns a library section into a view', () {
    expect(plexSectionToView({'key': '2', 'type': 'show', 'title': 'TV'}), {
      'Id': 'section-2',
      'Name': 'TV',
      'Type': 'CollectionFolder',
      'CollectionType': 'tvshows',
      'IsFolder': true,
      'ImageTags': <String, dynamic>{},
    });
  });

  test('a split movie counts its files and lists the later ones as parts', () {
    const movie = <String, dynamic>{
      'ratingKey': '23070',
      'type': 'movie',
      'title': 'Stack Test',
      'duration': 180046,
      'Media': [
        {
          'id': 31042,
          'duration': 180046,
          'Part': [
            {'id': 31042, 'duration': 90023, 'file': '/m/Stack - pt1.mkv'},
            {'id': 31043, 'duration': 90023, 'file': '/m/Stack - pt2.mkv'},
          ],
        },
      ],
    };

    final item = plexItemToJellyfin(movie);
    final part = plexAdditionalParts(movie, 0).single;

    expect(item['PartCount'], 2);
    expect(item['RunTimeTicks'], 1800460000);
    expect(part['Id'], 'part-23070-0-1');
    expect(part['Name'], 'Stack - pt2');
    expect(part['RunTimeTicks'], 900230000);
    expect(part, isNot(contains('PartCount')));
    expect((part['MediaSources'] as List).single['Path'], '/m/Stack - pt2.mkv');
    expect(plexPartOf('part-23070-0-1'), ('23070', 0, 1));
    expect(plexPartOf('23070'), isNull);
    expect(plexSourceOf('23070-1'), ('23070', 1));
    expect(plexSourceOf('23070'), ('23070', 0));
  });

  test('a second version split over files still has them queued', () {
    const movie = <String, dynamic>{
      'ratingKey': '23071',
      'type': 'movie',
      'title': 'Extras Test',
      'Media': [
        {
          'id': 31044,
          'Part': [
            {'id': 31044, 'file': '/m/Extras.mkv'},
          ],
        },
        {
          'id': 31042,
          'Part': [
            {'id': 31042, 'file': '/m/Stack - pt1.mkv'},
            {'id': 31043, 'file': '/m/Stack - pt2.mkv'},
          ],
        },
      ],
    };

    expect(plexItemToJellyfin(movie)['PartCount'], 2);
    expect(plexAdditionalParts(movie, 0), isEmpty);
    expect(plexAdditionalParts(movie, 1).single['Id'], 'part-23071-1-1');
  });

  test('chapters keep names and pictures and never start before zero', () {
    final movie = plexItemToJellyfin({
      'ratingKey': '823',
      'type': 'movie',
      'Chapter': [
        {'tag': 'Chapter 1 Opening Titles', 'startTimeOffset': -1},
        {
          'startTimeOffset': 61853,
          'thumb': '/library/media/1773/chapterImages/2',
        },
      ],
    });

    expect(movie['Chapters'], [
      {'StartPositionTicks': 0, 'Name': 'Chapter 1 Opening Titles'},
      {
        'StartPositionTicks': 618530000,
        'ImageTag': '/library/media/1773/chapterImages/2',
      },
    ]);
  });
}
