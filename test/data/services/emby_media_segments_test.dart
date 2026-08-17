import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:server_emby/server_emby.dart';

/// Serves one item body so the tests can vary only the chapter markers on it.
class _ItemAdapter implements HttpClientAdapter {
  _ItemAdapter(this.chapters, {this.runtimeTicks = 36000000000});

  final List<Map<String, dynamic>> chapters;
  final int? runtimeTicks;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode({
      'Id': 'ep1',
      'RunTimeTicks': runtimeTicks,
      'Chapters': chapters,
    }),
    200,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}

EmbyItemsApi _api(_ItemAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'http://server'))
    ..httpClientAdapter = adapter;
  return EmbyItemsApi(dio, () => 'user1');
}

Map<String, dynamic> _chapter(Object? marker, int ticks) => {
  'Name': 'Chapter',
  'StartPositionTicks': ticks,
  if (marker != null) 'MarkerType': marker,
};

void main() {
  group('Emby media segments', () {
    test('reads markers sent as their name', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('IntroStart', 0),
          _chapter('IntroEnd', 900000000),
          _chapter('CreditsStart', 30000000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.map((s) => s['Type']), ['Intro', 'Outro']);
      expect(segments.first['StartTicks'], 0);
      expect(segments.first['EndTicks'], 900000000);
      expect(segments.last['EndTicks'], 36000000000);
    });

    test('reads markers sent as their ordinal', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter(0, 0),
          _chapter(1, 300000000),
          _chapter(2, 900000000),
          _chapter(3, 30000000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.map((s) => s['Type']), ['Intro', 'Outro']);
      expect(segments.first['StartTicks'], 300000000);
      expect(segments.first['EndTicks'], 900000000);
    });

    test('reads a marker whatever case it arrives in', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('introStart', 0),
          _chapter('INTROEND', 900000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.single['Type'], 'Intro');
    });

    test('leaves plain chapters alone', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('Chapter', 0),
          _chapter(0, 900000000),
          _chapter(null, 1800000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments, isEmpty);
    });

    test('ends an unmarked intro at the chapter after it', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('Chapter', 0),
          _chapter('IntroStart', 300000000),
          _chapter('Chapter', 900000000),
          _chapter('Chapter', 1800000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.single['Type'], 'Intro');
      expect(segments.single['StartTicks'], 300000000);
      expect(segments.single['EndTicks'], 900000000);
    });

    test('takes the nearest chapter when they arrive out of order', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('Chapter', 1800000000),
          _chapter('IntroStart', 300000000),
          _chapter('Chapter', 900000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.single['EndTicks'], 900000000);
    });

    test('prefers a real end marker over the next chapter', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('IntroStart', 300000000),
          _chapter('Chapter', 600000000),
          _chapter('IntroEnd', 900000000),
        ]),
      ).getMediaSegments('ep1');

      expect(segments.single['EndTicks'], 900000000);
    });

    test('skips an intro with nothing after it to bound it', () async {
      final segments = await _api(
        _ItemAdapter([_chapter('IntroStart', 300000000)]),
      ).getMediaSegments('ep1');

      expect(segments, isEmpty);
    });

    test('skips credits when the runtime is unknown', () async {
      final segments = await _api(
        _ItemAdapter([
          _chapter('CreditsStart', 30000000000),
        ], runtimeTicks: null),
      ).getMediaSegments('ep1');

      expect(segments, isEmpty);
    });
  });
}
