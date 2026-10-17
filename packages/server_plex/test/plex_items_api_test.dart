import 'package:dio/dio.dart';
import 'package:server_plex/src/api/plex_apis.dart';
import 'package:server_plex/src/api/plex_items_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

(Dio, List<RequestOptions>) _recordingDio(Map<String, dynamic> container) {
  final requests = <RequestOptions>[];
  final dio = Dio()
    ..interceptors.add(
      _FakeServer((options, handler) {
        requests.add(options);
        handler.resolve(
          Response(
            requestOptions: options,
            data: {'MediaContainer': container},
          ),
        );
      }),
    );
  return (dio, requests);
}

void main() {
  test(
    'a library page asks Plex for the type, sort, filter and window',
    () async {
      final (dio, requests) = _recordingDio({
        'totalSize': 572,
        'Metadata': [
          {'ratingKey': '1', 'type': 'movie', 'title': 'Zootopia 2'},
        ],
      });

      final result = await PlexItemsApi(dio).getItems(
        parentId: 'section-1',
        includeItemTypes: ['Movie'],
        sortBy: 'SortName,ProductionYear',
        sortOrder: 'Descending',
        filters: ['IsUnplayed'],
        recursive: true,
        startIndex: 75,
        limit: 48,
      );

      final request = requests.single;
      expect(request.path, '/library/sections/1/all');
      expect(request.queryParameters, {
        'type': '1',
        'sort': 'titleSort:desc,year:desc',
        'unwatched': '1',
        'X-Plex-Container-Start': 75,
        'X-Plex-Container-Size': 48,
      });
      expect(result['TotalRecordCount'], 572);
      expect(result['StartIndex'], 75);
      expect((result['Items'] as List).single['Name'], 'Zootopia 2');
    },
  );

  test('an album keeps Plex track order over a title sort', () async {
    final (dio, requests) = _recordingDio(const {'Metadata': []});

    await PlexItemsApi(dio).getItems(
      parentId: '22999',
      sortBy: 'ParentIndexNumber,IndexNumber,SortName',
    );

    expect(requests.single.path, '/library/metadata/22999/children');
    expect(requests.single.queryParameters.containsKey('sort'), isFalse);
  });

  test('a search across libraries keeps only titles that match', () async {
    final (dio, requests) = _recordingDio({
      'Hub': [
        {
          'type': 'movie',
          'Metadata': [
            {'ratingKey': '1804', 'type': 'movie', 'title': 'Despicable Me 3'},
            {
              'ratingKey': '139',
              'type': 'movie',
              'title': 'Bruce Almighty',
              'reason': 'actor',
            },
          ],
        },
        {
          'type': 'show',
          'Metadata': [
            {'ratingKey': '15887', 'type': 'show', 'title': 'The Office (US)'},
          ],
        },
        {
          'type': 'actor',
          'Directory': [
            {'id': 2027, 'tag': 'Steve Carell'},
          ],
        },
      ],
    });
    final api = PlexItemsApi(dio);

    final all = await api.getItems(searchTerm: 'des', limit: 24);
    final movies = await api.getItems(
      searchTerm: 'des',
      includeItemTypes: ['Movie'],
    );

    expect(requests.first.path, '/hubs/search');
    expect(requests.first.queryParameters, {
      'query': 'des',
      'includeCollections': 1,
      'limit': 24,
    });
    expect((all['Items'] as List).map((i) => i['Name']), [
      'Despicable Me 3',
      'The Office (US)',
    ]);
    expect((movies['Items'] as List).map((i) => i['Name']), [
      'Despicable Me 3',
    ]);
  });

  test('an artist lists its albums and all its tracks', () async {
    final (dio, requests) = _recordingDio(const {'Metadata': []});
    final api = PlexItemsApi(dio);

    await api.getItems(
      artistIds: ['23023'],
      includeItemTypes: ['MusicAlbum'],
      recursive: true,
    );
    await api.getItems(
      artistIds: ['23023'],
      includeItemTypes: ['Audio'],
      recursive: true,
    );
    final both = await api.getItems(artistIds: ['23023', '22998']);

    expect(requests.map((r) => r.path), [
      '/library/metadata/23023/children',
      '/library/metadata/23023/allLeaves',
    ]);
    expect(both['Items'], isEmpty);
  });

  test('library filters become Plex filters', () async {
    final (dio, requests) = _recordingDio(const {'Metadata': []});
    final api = PlexItemsApi(dio);

    await api.getItems(
      parentId: 'section-1',
      includeItemTypes: ['Movie'],
      genres: ['Action', 'Comedy'],
      years: [2009],
      officialRatings: ['PG-13'],
      tags: ['Kids'],
      studios: ['Columbia Pictures'],
      audioLanguages: ['ja'],
      subtitleLanguages: ['es'],
      isHd: true,
      isFavorite: true,
    );
    await api.getItems(parentId: 'section-1', isHd: false);
    await api.getItems(parentId: 'section-1', is4K: true, isHd: true);
    final contradiction = await api.getItems(
      parentId: 'section-1',
      is4K: true,
      isHd: false,
    );

    expect(requests.first.queryParameters, {
      'type': '1',
      'genre': ['Action,Comedy'],
      'year': '2009',
      'contentRating': 'PG-13',
      'label': 'Kids',
      'studio': 'Columbia Pictures',
      'audioLanguage': 'ja',
      'subtitleLanguage': 'es',
      'resolution': '720,1080,4k',
      'userRating': '10',
    });
    expect(requests[1].queryParameters['resolution'], 'sd,480,576');
    expect(requests[2].queryParameters['resolution'], '4k');
    expect(requests, hasLength(3));
    expect(contradiction['Items'], isEmpty);
  });

  test('favorites of every kind name every kind for Plex', () async {
    final (dio, requests) = _recordingDio(const {'Metadata': []});

    await PlexItemsApi(dio).getItems(isFavorite: true, recursive: true);

    expect(requests.single.path, '/library/all');
    expect(requests.single.queryParameters, {
      'type': '1,2,3,4,8,9,10,18',
      'userRating': '10',
    });
  });

  test("a library's filter values come from Plex's own lists", () async {
    final dio = Dio()
      ..interceptors.add(
        _FakeServer(
          (options, handler) => handler.resolve(
            Response(
              requestOptions: options,
              data: {
                'MediaContainer': switch (options.path) {
                  '/library/sections/1/genre' => {
                    'Directory': [
                      {'key': '7', 'title': 'Action'},
                    ],
                  },
                  '/library/sections/1/year' => {
                    'Directory': [
                      {'key': '2009', 'title': '2009'},
                    ],
                  },
                  '/library/sections/1/contentRating' => {
                    'Directory': [
                      {'key': 'Not%20Rated', 'title': 'Not Rated'},
                    ],
                  },
                  '/library/sections/1/audioLanguage' => {
                    'Directory': [
                      {'key': 'ja', 'title': '日本語'},
                    ],
                  },
                  _ => const <String, dynamic>{},
                },
              },
            ),
          ),
        ),
      );

    final values = await PlexItemsApi(
      dio,
    ).getQueryFilters(parentId: 'section-1', includeItemTypes: ['Movie']);

    expect(values.genres, ['Action']);
    expect(values.years, [2009]);
    expect(values.officialRatings, ['Not Rated']);
    expect(values.tags, isEmpty);
    expect(values.audioLanguages.single.value, 'ja');
    expect(values.audioLanguages.single.name, '日本語');
  });

  test(
    'a favorite is a 10 rating, and clearing it clears the rating',
    () async {
      final (dio, requests) = _recordingDio(const {});
      final library = PlexUserLibraryApi(dio, PlexItemsApi(dio));

      await library.markFavorite('1715');
      await library.unmarkFavorite('1715');

      expect(requests.map((r) => (r.method, r.path)), [
        ('PUT', '/:/rate'),
        ('PUT', '/:/rate'),
      ]);
      expect(requests.map((r) => r.queryParameters['rating']), [10, -1]);
      expect(requests.first.queryParameters['key'], '1715');
    },
  );

  group('people', () {
    (Dio, List<RequestOptions>) server() {
      final requests = <RequestOptions>[];
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, handler) {
            requests.add(options);
            handler.resolve(
              Response(
                requestOptions: options,
                data: {
                  'MediaContainer': switch (options.path) {
                    '/library/people/2027' => {
                      'Directory': [
                        {
                          'id': 2027,
                          'tag': 'Steve Carell',
                          'thumb': 'https://metadata-static.plex.tv/carell.jpg',
                        },
                      ],
                    },
                    '/library/people/2027/media' => {
                      'Metadata': [
                        {
                          'ratingKey': '139',
                          'type': 'movie',
                          'title': 'Bruce Almighty',
                          'year': 2003,
                        },
                        {
                          'ratingKey': '863',
                          'type': 'movie',
                          'title': 'Despicable Me 4',
                          'year': 2024,
                        },
                        {
                          'ratingKey': '15887',
                          'type': 'show',
                          'title': 'The Office (US)',
                          'year': 2005,
                        },
                      ],
                    },
                    '/hubs/search' => {
                      'Hub': [
                        {
                          'type': 'movie',
                          'Metadata': [
                            {
                              'ratingKey': '139',
                              'type': 'movie',
                              'title': 'Bruce Almighty',
                            },
                          ],
                        },
                        {
                          'type': 'actor',
                          'Directory': [
                            {'id': 2027, 'tag': 'Steve Carell'},
                            {'id': 2027, 'tag': 'Steve Carell'},
                          ],
                        },
                        {
                          'type': 'director',
                          'Directory': [
                            {'id': 16991, 'tag': 'Kyle Balda'},
                          ],
                        },
                      ],
                    },
                    _ => const <String, dynamic>{'Metadata': []},
                  },
                },
              ),
            );
          }),
        );
      return (dio, requests);
    }

    test('a person opens as a Person item', () async {
      final (dio, _) = server();

      final person = await PlexItemsApi(dio).getItem('person-2027');

      expect(person, {
        'Id': 'person-2027',
        'Name': 'Steve Carell',
        'Type': 'Person',
        'ImageTags': {'Primary': 'https://metadata-static.plex.tv/carell.jpg'},
      });
    });

    test('a person lists their titles newest first', () async {
      final (dio, _) = server();

      final result = await PlexItemsApi(dio).getItems(
        personIds: ['person-2027'],
        includeItemTypes: ['Movie', 'Series'],
        recursive: true,
      );

      expect((result['Items'] as List).map((i) => i['Name']), [
        'Despicable Me 4',
        'The Office (US)',
        'Bruce Almighty',
      ]);
    });

    test('people inside a library filter on Plex actors', () async {
      final (dio, requests) = server();
      final api = PlexItemsApi(dio);

      await api.getItems(
        parentId: 'section-1',
        personIds: ['person-2027', 'person-16991'],
      );
      final unknown = await api.getItems(personIds: ['2027']);

      expect(requests.single.queryParameters['actor'], '2027,16991');
      expect(unknown['Items'], isEmpty);
    });

    test('search finds each person once', () async {
      final (dio, _) = server();

      final result = await PlexItemsApi(dio).getPersons(searchTerm: 'carell');

      expect((result['Items'] as List).map((i) => (i['Id'], i['Type'])), [
        ('person-2027', 'Person'),
        ('person-16991', 'Person'),
      ]);
    });
  });

  group('genres and studios', () {
    (Dio, List<RequestOptions>) server() {
      final requests = <RequestOptions>[];
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, handler) {
            requests.add(options);
            handler.resolve(
              Response(
                requestOptions: options,
                data: {
                  'MediaContainer': switch (options.path) {
                    '/library/sections' => {
                      'Directory': [
                        {'key': '1'},
                        {'key': '2'},
                      ],
                    },
                    '/library/sections/1/genre' => {
                      'Directory': [
                        {'key': '7', 'title': 'Action'},
                        {'key': '6', 'title': 'Comedy'},
                      ],
                    },
                    '/library/sections/2/genre' => {
                      'Directory': [
                        {'key': '49839', 'title': 'Action/Adventure'},
                        {'key': '6', 'title': 'Comedy'},
                      ],
                    },
                    '/library/sections/1/studio' => {
                      'Directory': [
                        {'key': 'Illumination', 'title': 'Illumination'},
                        {
                          'key': 'Universal%2520Pictures',
                          'title': 'Universal Pictures',
                        },
                      ],
                    },
                    _ => const <String, dynamic>{'Metadata': []},
                  },
                },
              ),
            );
          }),
        );
      return (dio, requests);
    }

    test("every library's genres merge into one list", () async {
      final (dio, requests) = server();

      final result = await PlexItemsApi(dio).getGenres(
        includeItemTypes: ['Movie', 'Series'],
        startIndex: 1,
        limit: 2,
      );

      expect(
        requests.where((r) => r.path.endsWith('/genre')).map((r) => r.uri),
        everyElement(
          predicate<Uri>((uri) => uri.queryParameters['type'] == '1,2'),
        ),
      );
      expect(result['TotalRecordCount'], 3);
      expect(result['Items'], [
        {'Id': 'genre-49839', 'Name': 'Action/Adventure', 'Type': 'Genre'},
        {'Id': 'genre-6', 'Name': 'Comedy', 'Type': 'Genre'},
      ]);
    });

    test("a library's studios come from that library alone", () async {
      final (dio, requests) = server();
      final api = PlexItemsApi(dio);

      final result = await api.getStudios(
        parentId: 'section-1',
        sortOrder: 'Descending',
      );
      final collection = await api.getStudios(parentId: '4410');

      expect(requests.single.path, '/library/sections/1/studio');
      expect((result['Items'] as List).map((i) => (i['Id'], i['Name'])), [
        ('studio-Universal%2520Pictures', 'Universal Pictures'),
        ('studio-Illumination', 'Illumination'),
      ]);
      expect(collection['Items'], isEmpty);
    });

    test('a genre id must match on top of any picked genres', () async {
      final (dio, requests) = server();
      final api = PlexItemsApi(dio);

      await api.getItems(
        parentId: 'section-1',
        genreIds: ['genre-6'],
        genres: ['Action', 'Horror'],
      );
      final unknown = await api.getItems(genreIds: ['6']);

      expect(requests.single.uri.queryParametersAll['genre'], [
        'Action,Horror',
        '6',
      ]);
      expect(unknown['Items'], isEmpty);
    });
  });

  group('playlists and collections', () {
    (PlexItemsApi, List<RequestOptions>) server() {
      final requests = <RequestOptions>[];
      Map<String, dynamic> item(
        String key,
        String type, [
        Map<String, dynamic>? extra,
      ]) => {
        'Metadata': [
          {'ratingKey': key, 'type': type, ...?extra},
        ],
      };
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, handler) {
            requests.add(options);
            handler.resolve(
              Response(
                requestOptions: options,
                data: {
                  'MediaContainer': switch (options.path) {
                    '/identity' => {'machineIdentifier': 'abc'},
                    '/playlists' => item('23065', 'playlist', {
                      'title': 'Road Trip',
                      'playlistType': 'audio',
                      'leafCount': 4,
                      'composite': '/playlists/23065/composite/1',
                    }),
                    '/library/collections' => item('23069', 'collection'),
                    '/playlists/9/items' => {
                      'Metadata': [
                        for (final entry in [1, 2, 3])
                          {
                            'ratingKey': '$entry',
                            'type': 'movie',
                            'playlistItemID': entry,
                          },
                      ],
                    },
                    '/library/metadata/23010' => item('23010', 'track'),
                    '/library/metadata/863' => item('863', 'movie', {
                      'librarySectionID': 1,
                    }),
                    '/library/metadata/23065' => item('23065', 'playlist'),
                    '/library/metadata/23062' => item('23062', 'collection'),
                    _ => const <String, dynamic>{},
                  },
                },
              ),
            );
          }),
        );
      return (PlexItemsApi(dio), requests);
    }

    test("a library's playlists come from Plex's playlist list", () async {
      final (api, requests) = server();

      final result = await api.getItems(
        parentId: 'section-3',
        includeItemTypes: ['Playlist'],
        sortBy: 'SortName',
      );

      expect(requests.single.path, '/playlists');
      expect(requests.single.queryParameters, {
        'sectionID': '3',
        'sort': 'titleSort',
      });
      final playlist = (result['Items'] as List).single as Map;
      expect(playlist['MediaType'], 'Audio');
      expect(playlist['ChildCount'], 4);
      expect(playlist['CanDelete'], isTrue);
      expect(playlist['ImageTags'], {
        'Primary': '/playlists/23065/composite/1',
      });
      expect(playlist['UserData'], isNot(contains('UnplayedItemCount')));
    });

    test('a new playlist takes its kind from its first item', () async {
      final (api, requests) = server();

      final created = await api.createPlaylist(
        name: 'Road Trip',
        itemIds: ['23010', '23011'],
      );

      final post = requests.last;
      expect((post.method, post.path), ('POST', '/playlists'));
      expect(post.queryParameters, {
        'type': 'audio',
        'title': 'Road Trip',
        'smart': 0,
        'uri':
            'server://abc/com.plexapp.plugins.library/library/metadata/23010,23011',
      });
      expect(created['Id'], '23065');
    });

    test('an entry moves to just after the one before its new spot', () async {
      final (api, requests) = server();

      await api.movePlaylistItem('9', '3', 1);
      await api.movePlaylistItem('9', '2', 0);

      final moves = requests.where((r) => r.method == 'PUT').toList();
      expect(moves.map((r) => r.path), [
        '/playlists/9/items/3/move',
        '/playlists/9/items/2/move',
      ]);
      expect(moves.map((r) => r.queryParameters), [
        {'after': '1'},
        isEmpty,
      ]);
    });

    test('an empty collection is made once its first items arrive', () async {
      final (api, requests) = server();

      final pending = await api.createCollection(name: 'Scratch Set');
      expect(requests, isEmpty);
      await api.addToCollection(pending['Id'] as String, ['863']);

      final post = requests.last;
      expect((post.method, post.path), ('POST', '/library/collections'));
      expect(post.queryParameters, {
        'type': 1,
        'title': 'Scratch Set',
        'smart': 0,
        'sectionId': 1,
        'uri': 'server://abc/com.plexapp.plugins.library/library/metadata/863',
      });
    });

    test('only playlists and collections can be deleted', () async {
      final (api, requests) = server();

      await api.deleteItem('23065');
      await api.deleteItem('23062');
      await expectLater(api.deleteItem('863'), throwsUnsupportedError);

      expect(requests.where((r) => r.method == 'DELETE').map((r) => r.path), [
        '/playlists/23065',
        '/library/collections/23062',
      ]);
    });
  });

  test('a filter Plex has no answer for returns nothing', () async {
    final (dio, requests) = _recordingDio(const {});

    final result = await PlexItemsApi(
      dio,
    ).getItems(parentId: 'section-1', hasTrailer: true);

    expect(requests, isEmpty);
    expect(result['Items'], isEmpty);
  });

  test('a season lists its episodes and a series all of them', () async {
    final (dio, requests) = _recordingDio(const {'Metadata': []});
    final api = PlexItemsApi(dio);

    await api.getEpisodes('17098', seasonId: '17099');
    await api.getEpisodes('17098');

    expect(requests.map((r) => r.path), [
      '/library/metadata/17099/children',
      '/library/metadata/17098/allLeaves',
    ]);
  });

  test('Continue Watching splits into resume and next up', () async {
    final (dio, _) = _recordingDio({
      'Metadata': [
        {
          'ratingKey': '17101',
          'type': 'episode',
          'title': 'Red Coast',
          'librarySectionID': 2,
        },
        {
          'ratingKey': '1715',
          'type': 'movie',
          'title': '10 Cloverfield Lane',
          'viewOffset': 1800000,
          'librarySectionID': 1,
        },
      ],
    });
    final api = PlexItemsApi(dio);

    final resume = await api.getResumeItems(limit: 15);
    final nextUp = await api.getNextUp(limit: 15);
    final moviesNextUp = await api.getNextUp(parentId: 'section-1');

    expect((resume['Items'] as List).map((i) => i['Name']), [
      '10 Cloverfield Lane',
    ]);
    expect((nextUp['Items'] as List).map((i) => i['Name']), ['Red Coast']);
    expect(moviesNextUp['Items'], isEmpty);
  });

  test('a library id reads back as its view', () async {
    final (dio, _) = _recordingDio({
      'Directory': [
        {'key': '1', 'type': 'movie', 'title': 'Movies'},
        {'key': '2', 'type': 'show', 'title': 'TV Shows'},
      ],
    });

    final view = await PlexItemsApi(dio).getItem('section-2');

    expect(view['Name'], 'TV Shows');
    expect(view['CollectionType'], 'tvshows');
  });

  test('lyrics turn into timed lines, and none into an empty list', () async {
    Map<String, dynamic> track(List<Map<String, dynamic>> streams) => {
      'Metadata': [
        {
          'Media': [
            {
              'Part': [
                {'Stream': streams},
              ],
            },
          ],
        },
      ],
    };
    final dio = Dio()
      ..interceptors.add(
        _FakeServer(
          (options, handler) => handler.resolve(
            Response(
              requestOptions: options,
              data: {
                'MediaContainer': switch (options.path) {
                  '/library/metadata/23025' => track([
                    {'streamType': 2, 'codec': 'mp3'},
                    {'streamType': 4, 'key': '/library/streams/149652'},
                  ]),
                  '/library/streams/149652' => {
                    'Lyrics': [
                      {
                        'timed': true,
                        'Line': [
                          {
                            'startOffset': 1070,
                            'Span': [
                              {'text': 'Yo, yo, your dog is here'},
                            ],
                          },
                          {
                            'startOffset': 9820,
                            'Span': [
                              {'text': 'Where '},
                              {'text': 'the hood at'},
                            ],
                          },
                        ],
                      },
                    ],
                  },
                  _ => track([
                    {'streamType': 2, 'codec': 'mp3'},
                  ]),
                },
              },
            ),
          ),
        ),
      );
    final api = PlexItemsApi(dio);

    expect((await api.getLyrics('23025'))['Lyrics'], [
      {'Start': 10700000, 'Text': 'Yo, yo, your dog is here'},
      {'Start': 98200000, 'Text': 'Where the hood at'},
    ]);
    expect((await api.getLyrics('23010'))['Lyrics'], isEmpty);
  });

  test(
    "a music library's artists and album artists are its Plex artists",
    () async {
      final (dio, requests) = _recordingDio({
        'Metadata': [
          {'ratingKey': '22990', 'type': 'artist', 'title': 'DMX'},
        ],
      });
      final api = PlexItemsApi(dio);

      final artists = await api.getArtists(
        parentId: 'section-3',
        sortBy: 'SortName',
      );
      final albumArtists = await api.getAlbumArtists(parentId: 'section-3');

      expect(requests.map((r) => (r.path, r.queryParameters['type'])), [
        ('/library/sections/3/all', '8'),
        ('/library/sections/3/all', '8'),
      ]);
      expect(requests.first.queryParameters['sort'], 'titleSort');
      for (final result in [artists, albumArtists]) {
        expect((result['Items'] as List).single['Type'], 'MusicArtist');
      }
    },
  );

  test('intro and credits markers become skip segments', () async {
    final (dio, requests) = _recordingDio({
      'Metadata': [
        {
          'Marker': [
            {'type': 'intro', 'startTimeOffset': 5000, 'endTimeOffset': 60000},
            {'type': 'bookmark', 'startTimeOffset': 70000},
            {'type': 'commercial', 'startTimeOffset': 90000},
            {
              'type': 'credits',
              'startTimeOffset': 1380000,
              'endTimeOffset': 1420512,
              'final': true,
            },
          ],
        },
      ],
    });
    final api = PlexItemsApi(dio);

    final segments = await api.getMediaSegments('3060');

    expect(requests.single.queryParameters, {'includeMarkers': 1});
    expect(segments.map((s) => (s['Type'], s['StartTicks'], s['EndTicks'])), [
      ('Intro', 50000000, 600000000),
      ('Outro', 13800000000, 14205120000),
    ]);
    expect(await api.getMediaSegments('part-23070-0-1'), isEmpty);
    expect(requests, hasLength(1));
  });

  group('PlexImageApi', () {
    final images = PlexImageApi(() => 'http://plex:32400', () => 'tok');

    test('resizes the stored image path through the transcoder', () {
      expect(
        images.getPrimaryImageUrl(
          '17100',
          maxWidth: 300,
          tag: '/library/metadata/17098/thumb/1',
        ),
        'http://plex:32400/photo/:/transcode?width=300&height=1200'
        '&url=%2Flibrary%2Fmetadata%2F17098%2Fthumb%2F1&X-Plex-Token=tok',
      );
    });

    test('passes a full image URL through', () {
      expect(
        images.getPrimaryImageUrl('3053', tag: 'https://plex.tv/a.jpg'),
        'https://plex.tv/a.jpg',
      );
    });

    test('falls back to the item path without a tag or size', () {
      expect(
        images.getLogoImageUrl('1715'),
        'http://plex:32400/library/metadata/1715/clearLogo?X-Plex-Token=tok',
      );
    });
  });
}
