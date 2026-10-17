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
    expect(requests.first.queryParameters, {'query': 'des', 'limit': 24});
    expect((all['Items'] as List).map((i) => i['Name']), [
      'Despicable Me 3',
      'The Office (US)',
    ]);
    expect((movies['Items'] as List).map((i) => i['Name']), [
      'Despicable Me 3',
    ]);
  });

  test('a filter Plex has no answer for returns nothing', () async {
    final (dio, requests) = _recordingDio(const {});

    final result = await PlexItemsApi(
      dio,
    ).getItems(parentId: 'section-1', genres: ['Horror']);

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
