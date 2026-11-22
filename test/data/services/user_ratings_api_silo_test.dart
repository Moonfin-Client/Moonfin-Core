import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/user_ratings_api.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// Answers `GET /api/v2/ratings` with two pages of the profile's ratings.
class _Ratings implements HttpClientAdapter {
  final List<Uri> asked = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    asked.add(options.uri);
    final second = options.uri.queryParameters['cursor'] == 'next';
    final body = second
        ? {
            'items': [
              {'item_id': 'episode:show-1-2', 'rating': 10},
            ],
          }
        : {
            'items': [
              {'item_id': 'movie:heat-1995', 'rating': 7},
            ],
            'page': {'has_more': true, 'next_cursor': 'next'},
          };
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('Silo ratings are already out of 10, so they are read as they are', () async {
    final server = _Ratings();
    final client = SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
      httpClientAdapter: server,
    );

    expect(await fetchMyUserRatings(client), {
      'movie:heat-1995': 7.0,
      'episode:show-1-2': 10.0,
    });
    expect(server.asked.map((u) => u.path).toSet(), {'/api/v2/ratings'});
  });
}
