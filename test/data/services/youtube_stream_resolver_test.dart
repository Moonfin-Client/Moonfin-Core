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

  test('passes a trailer that isnt on YouTube through untouched', () async {
    final stream = await YouTubeStreamResolver.resolveFromUrl(
      'https://example.com/trailer.mp4',
    );

    expect(stream?.url, 'https://example.com/trailer.mp4');
    expect(stream?.audioLanguage, isNull);
  });
}
