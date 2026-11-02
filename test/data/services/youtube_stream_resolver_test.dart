import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/youtube_stream_resolver.dart';

const _hlsUrl =
    'https://manifest.googlevideo.com/api/manifest/hls_variant/id/abc/file/index.m3u8';

/// The shape of a Vision Pro answer for a trailer YouTube has machine dubbed.
Map<String, dynamic> _dubbedAnswer() => {
  'playabilityStatus': {'status': 'OK'},
  'responseContext': {'visitorData': 'visitor-1'},
  'streamingData': {
    'hlsManifestUrl': _hlsUrl,
    'adaptiveFormats': [
      {
        'itag': 137,
        'mimeType': 'video/mp4; codecs="avc1.640028"',
        'url': 'https://v/137',
      },
      {
        'itag': 140,
        'mimeType': 'audio/mp4; codecs="mp4a.40.2"',
        'url': 'https://v/140-de',
        'audioTrack': {'id': 'de-DE.10', 'audioIsDefault': false},
      },
      {
        'itag': 140,
        'mimeType': 'audio/mp4; codecs="mp4a.40.2"',
        'url': 'https://v/140-en',
        'audioTrack': {'id': 'en-US.4', 'audioIsDefault': true},
      },
    ],
  },
};

Map<String, dynamic> _turnedAway(String visitor) => {
  'playabilityStatus': {'status': 'LOGIN_REQUIRED'},
  'responseContext': {'visitorData': visitor},
};

/// Answers each player request with the next queued body and keeps what was
/// asked.
class _PlayerAdapter implements HttpClientAdapter {
  _PlayerAdapter(this.answers);

  final List<Map<String, dynamic>> answers;
  final List<Uri> urls = [];
  final List<Map<String, dynamic>> bodies = [];
  final List<Map<String, dynamic>> headers = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    urls.add(options.uri);
    bodies.add(Map<String, dynamic>.from(options.data as Map));
    headers.add(options.headers);
    return ResponseBody.fromString(
      jsonEncode(answers.removeAt(0)),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

String? _clientName(Map<String, dynamic> body) =>
    (body['context'] as Map)['client']['clientName'] as String?;

String? _visitor(Map<String, dynamic> body) =>
    (body['context'] as Map)['client']['visitorData'] as String?;

void main() {
  group('buildPlayerRequest', () {
    test('sends the visitor id and leaves out a missing platform', () {
      final body = YouTubeStreamResolver.buildPlayerRequest(
        'vid',
        clientName: 'VISIONOS',
        clientVersion: '1.02',
        extra: {'osName': 'visionOS'},
        visitorData: 'visitor-1',
      );

      expect((body['context'] as Map)['client'], {
        'clientName': 'VISIONOS',
        'clientVersion': '1.02',
        'hl': 'en',
        'gl': 'US',
        'visitorData': 'visitor-1',
        'osName': 'visionOS',
      });
    });
  });

  group('freshVisitorData', () {
    test('hands back the id a turned away request came with', () {
      expect(
        YouTubeStreamResolver.freshVisitorData(_turnedAway('visitor-2'), null),
        'visitor-2',
      );
    });

    test('doesnt retry with the id that was already sent', () {
      expect(
        YouTubeStreamResolver.freshVisitorData(
          _turnedAway('visitor-2'),
          'visitor-2',
        ),
        isNull,
      );
    });

    test('doesnt retry an answer that played', () {
      expect(
        YouTubeStreamResolver.freshVisitorData(_dubbedAnswer(), null),
        isNull,
      );
    });
  });

  group('isStaleVisitor', () {
    test('marks a sent id YouTube handed back on a bot check', () {
      expect(
        YouTubeStreamResolver.isStaleVisitor(
          _turnedAway('visitor-2'),
          'visitor-2',
        ),
        isTrue,
      );
    });

    test('leaves a fresh id, an unplayable video and a missing id alone', () {
      expect(
        YouTubeStreamResolver.isStaleVisitor(
          _turnedAway('visitor-2'),
          'visitor-1',
        ),
        isFalse,
      );
      expect(
        YouTubeStreamResolver.isStaleVisitor({
          'playabilityStatus': {'status': 'UNPLAYABLE'},
          'responseContext': {'visitorData': 'visitor-2'},
        }, 'visitor-2'),
        isFalse,
      );
      expect(
        YouTubeStreamResolver.isStaleVisitor(_turnedAway('visitor-2'), null),
        isFalse,
      );
    });
  });

  group('originalAudioLanguage', () {
    test('names the soundtrack YouTube flags as the default', () {
      expect(
        YouTubeStreamResolver.originalAudioLanguage(_dubbedAnswer()),
        'en-US',
      );
    });

    test('is null for a trailer with only its own soundtrack', () {
      expect(
        YouTubeStreamResolver.originalAudioLanguage({
          'streamingData': {
            'adaptiveFormats': [
              {'itag': 140, 'mimeType': 'audio/mp4'},
            ],
          },
        }),
        isNull,
      );
    });
  });

  group('extractInnertubeStreamUrl', () {
    test('takes the manifest over the muxed file', () {
      final answer = _dubbedAnswer();
      (answer['streamingData'] as Map)['formats'] = [
        {
          'itag': 18,
          'qualityLabel': '360p',
          'mimeType': 'video/mp4; codecs="avc1.42001E, mp4a.40.2"',
          'url': 'https://v/18',
        },
      ];

      expect(YouTubeStreamResolver.extractInnertubeStreamUrl(answer), _hlsUrl);
    });

    test('falls back to the muxed file when there is no manifest', () {
      expect(
        YouTubeStreamResolver.extractInnertubeStreamUrl({
          'playabilityStatus': {'status': 'OK'},
          'streamingData': {
            'formats': [
              {
                'itag': 18,
                'qualityLabel': '360p',
                'mimeType': 'video/mp4; codecs="avc1.42001E, mp4a.40.2"',
                'url': 'https://v/18',
              },
            ],
          },
        }),
        'https://v/18',
      );
    });
  });

  group('resolve', () {
    test(
      'asks again with the visitor id it was turned away with, then keeps using it',
      () async {
        final adapter = _PlayerAdapter([
          _turnedAway('visitor-2'),
          _dubbedAnswer(),
          _dubbedAnswer(),
        ]);
        YouTubeStreamResolver.setDioForTesting(
          Dio()..httpClientAdapter = adapter,
        );

        final first = await YouTubeStreamResolver.resolve('vid');
        final second = await YouTubeStreamResolver.resolve('vid');

        expect(first?.url, _hlsUrl);
        expect(first?.audioLanguage, 'en-US');
        expect(second?.url, _hlsUrl);
        expect(
          adapter.bodies.map((b) => [_clientName(b), _visitor(b)]).toList(),
          [
            ['VISIONOS', null],
            ['VISIONOS', 'visitor-2'],
            ['VISIONOS', 'visitor-2'],
          ],
        );
        expect(
          adapter.urls.first.toString(),
          'https://www.youtube.com/youtubei/v1/player?prettyPrint=false',
        );
        expect(adapter.headers[1]['X-Goog-Visitor-Id'], 'visitor-2');
      },
    );

    test('drops a kept id YouTube stops taking, so the next lookup starts over', () async {
      final adapter = _PlayerAdapter([
        _turnedAway('visitor-3'),
        _dubbedAnswer(),
        _turnedAway('visitor-3'),
        {
          'playabilityStatus': {'status': 'UNPLAYABLE'},
        },
        _turnedAway('visitor-4'),
        _dubbedAnswer(),
      ]);
      YouTubeStreamResolver.setDioForTesting(
        Dio()..httpClientAdapter = adapter,
      );

      await YouTubeStreamResolver.resolve('vid');
      await YouTubeStreamResolver.resolve('vid');
      final recovered = await YouTubeStreamResolver.resolve('vid');

      expect(recovered?.url, _hlsUrl);
      expect(
        adapter.bodies.map((b) => [_clientName(b), _visitor(b)]).toList(),
        [
          ['VISIONOS', null],
          ['VISIONOS', 'visitor-3'],
          ['VISIONOS', 'visitor-3'],
          ['ANDROID', null],
          ['VISIONOS', null],
          ['VISIONOS', 'visitor-4'],
        ],
      );
    });

    test('falls back to the Android app when the Vision Pro one refuses', () async {
      final adapter = _PlayerAdapter([
        {
          'playabilityStatus': {'status': 'UNPLAYABLE'},
        },
        {
          'playabilityStatus': {'status': 'OK'},
          'streamingData': {
            'formats': [
              {
                'itag': 18,
                'qualityLabel': '360p',
                'mimeType': 'video/mp4; codecs="avc1.42001E, mp4a.40.2"',
                'url': 'https://v/18',
              },
            ],
          },
        },
      ]);
      YouTubeStreamResolver.setDioForTesting(
        Dio()..httpClientAdapter = adapter,
      );

      final stream = await YouTubeStreamResolver.resolve('vid');

      expect(stream?.url, 'https://v/18');
      expect(stream?.audioLanguage, isNull);
      expect(adapter.bodies.map(_clientName).toList(), ['VISIONOS', 'ANDROID']);
      expect(adapter.urls.last.queryParameters['key'], isNotEmpty);
    });
  });

  test('a trailer search links the top hit, once per title', () async {
    Map<String, dynamic> section(List<Map<String, dynamic>> contents) => {
      'itemSectionRenderer': {'contents': contents},
    };
    final adapter = _PlayerAdapter([
      {
        'contents': {
          'twoColumnSearchResultsRenderer': {
            'primaryContents': {
              'sectionListRenderer': {
                'contents': [
                  section([
                    {
                      'channelRenderer': {'channelId': 'UCillumination'},
                    },
                    {
                      'videoRenderer': {'videoId': '6DBi41reeF0'},
                    },
                  ]),
                  section([
                    {
                      'videoRenderer': {'videoId': 'uApRZVgOvxc'},
                    },
                  ]),
                ],
              },
            },
          },
        },
      },
    ]);
    YouTubeStreamResolver.setDioForTesting(Dio()..httpClientAdapter = adapter);

    final first = await YouTubeStreamResolver.searchTrailer(
      'Despicable Me 3',
      year: 2017,
    );
    final again = await YouTubeStreamResolver.searchTrailer(
      'Despicable Me 3',
      year: 2017,
    );

    expect(first, 'https://www.youtube.com/watch?v=6DBi41reeF0');
    expect(again, first);
    expect(adapter.urls.single.path, '/youtubei/v1/search');
    expect(adapter.bodies.single['query'], 'Despicable Me 3 2017 trailer');
    expect(_clientName(adapter.bodies.single), 'WEB');
  });

  test('a trailer search that found nothing asks again next time', () async {
    final adapter = _PlayerAdapter([
      const {'contents': {}},
      {
        'videoRenderer': {'videoId': 'eqPrO-ZZqCI'},
      },
    ]);
    YouTubeStreamResolver.setDioForTesting(Dio()..httpClientAdapter = adapter);

    final missed = await YouTubeStreamResolver.searchTrailer('Good Morning');
    final found = await YouTubeStreamResolver.searchTrailer('Good Morning');

    expect(missed, isNull);
    expect(found, 'https://www.youtube.com/watch?v=eqPrO-ZZqCI');
    expect(adapter.urls, hasLength(2));
  });

  test('reads the title, length and channel of a video once', () async {
    final adapter = _PlayerAdapter([
      {
        'playabilityStatus': {'status': 'OK'},
        'videoDetails': {
          'title': 'Cyberpunk: Edgerunners | Official Teaser | Netflix',
          'lengthSeconds': '77',
          'author': 'Netflix',
        },
      },
    ]);
    YouTubeStreamResolver.setDioForTesting(Dio()..httpClientAdapter = adapter);

    final details = await YouTubeStreamResolver.details('x4ztgjvfU60');
    final again = await YouTubeStreamResolver.details('x4ztgjvfU60');

    expect(details?.title, 'Cyberpunk: Edgerunners | Official Teaser | Netflix');
    expect(details?.length, const Duration(seconds: 77));
    expect(details?.channel, 'Netflix');
    expect(again, details);
    expect(adapter.urls.single.path, '/youtubei/v1/player');
  });

  test('reads nothing from an answer without usable video details', () {
    expect(YouTubeStreamResolver.videoDetailsOf(null), isNull);
    expect(
      YouTubeStreamResolver.videoDetailsOf({
        'playabilityStatus': {'status': 'UNPLAYABLE'},
      }),
      isNull,
    );
    expect(
      YouTubeStreamResolver.videoDetailsOf({
        'videoDetails': {'lengthSeconds': '0', 'author': ''},
      }),
      (title: null, length: null, channel: null),
    );
  });

  test('passes a trailer that isnt on YouTube through untouched', () async {
    final stream = await YouTubeStreamResolver.resolveFromUrl(
      'https://example.com/trailer.mp4',
    );

    expect(stream?.url, 'https://example.com/trailer.mp4');
    expect(stream?.audioLanguage, isNull);
  });

  group('pickVariant', () {
    const master = """#EXTM3U
#EXT-X-MEDIA:URI="https://cdn/a/de",TYPE=AUDIO,GROUP-ID="234",LANGUAGE="de",NAME="German (dubbed)",DEFAULT=NO
#EXT-X-MEDIA:URI="https://cdn/a/en",TYPE=AUDIO,GROUP-ID="234",LANGUAGE="en",NAME="English - original",DEFAULT=NO
#EXT-X-MEDIA:URI="https://cdn/a/low",TYPE=AUDIO,GROUP-ID="233",LANGUAGE="en",NAME="English",DEFAULT=NO
#EXT-X-STREAM-INF:BANDWIDTH=263086,CODECS="avc1.4D400D,mp4a.40.5",RESOLUTION=426x178,AUDIO="233"
https://cdn/v/240
#EXT-X-STREAM-INF:BANDWIDTH=1905744,CODECS="avc1.64001F,mp4a.40.2",RESOLUTION=1280x534,AUDIO="234"
https://cdn/v/720
#EXT-X-STREAM-INF:BANDWIDTH=3993245,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,AUDIO="234"
https://cdn/v/1080
#EXT-X-STREAM-INF:BANDWIDTH=2213928,CODECS="vp09.00.40.08,mp4a.40.2",RESOLUTION=1920x1080,AUDIO="234"
https://cdn/v/1080vp9
#EXT-X-STREAM-INF:BANDWIDTH=18663073,CODECS="vp09.00.50.08,mp4a.40.2",RESOLUTION=3840x2160,AUDIO="234"
https://cdn/v/2160
""";
    final base = Uri.parse('https://manifest/api/manifest/hls_variant/x');

    test('takes the best H.264 variant that fits, with the original audio', () {
      final picked = YouTubeStreamResolver.pickVariant(master, base, maxHeight: 1080);
      expect(picked?.video, 'https://cdn/v/1080');
      expect(picked?.audio, 'https://cdn/a/en');
    });

    test('stays under a smaller cap', () {
      final picked = YouTubeStreamResolver.pickVariant(master, base, maxHeight: 720);
      expect(picked?.video, 'https://cdn/v/720');
    });

    test('takes the smallest variant when nothing fits and reads nothing from a playlist that has none', () {
      expect(YouTubeStreamResolver.pickVariant(master, base, maxHeight: 100)?.video, 'https://cdn/v/240');
      expect(YouTubeStreamResolver.pickVariant('#EXTM3U\n#EXTINF:5,\nseg.ts', base, maxHeight: 1080), isNull);
    });
  });
}
