import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/sponsorblock_service.dart';

/// Answers like SponsorBlock's hash prefix endpoint, with a second video that
/// shares the prefix.
class _PrefixAnswer implements HttpClientAdapter {
  final List<Uri> requested = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requested.add(options.uri);
    final body = [
      {
        'videoID': 'otherVideo1',
        'segments': [
          {'segment': [0, 5], 'category': 'sponsor', 'UUID': 'x'},
        ],
      },
      {
        'videoID': 'dQw4w9WgXcQ',
        'segments': [
          {'segment': [10, 20], 'category': 'intro', 'UUID': 'a'},
        ],
      },
    ];
    return ResponseBody.fromString(jsonEncode(body), 200, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    });
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('sends only a hash prefix and keeps the requested video', () async {
    final adapter = _PrefixAnswer();
    final service = SponsorBlockService(dio: Dio()..httpClientAdapter = adapter);

    final segments = await service.fetchSegments(
      'dQw4w9WgXcQ',
      categories: {'intro', 'sponsor'},
    );

    final prefix = sha256
        .convert(utf8.encode('dQw4w9WgXcQ'))
        .toString()
        .substring(0, 4);
    expect(adapter.requested.single.path, '/api/skipSegments/$prefix');
    expect(segments.map((s) => s.category), ['intro']);
    expect(segments.single.start, const Duration(seconds: 10));
  });
}
