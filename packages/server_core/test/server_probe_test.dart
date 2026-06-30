import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

/// Returns a canned [ResponseBody] for each requested URI path.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.responder);

  final ResponseBody Function(Uri uri) responder;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => responder(options.uri);

  @override
  void close({bool force = false}) {}
}

Dio _dioWith(ResponseBody Function(Uri uri) responder) {
  final dio = Dio(
    BaseOptions(
      // Mirror the native probe: 4xx/5xx throw, redirects are returned not followed.
      validateStatus: (status) => status != null && status < 400,
      followRedirects: false,
    ),
  );
  dio.httpClientAdapter = _FakeAdapter(responder);
  return dio;
}

ResponseBody _json(Map<String, dynamic> body) => ResponseBody.fromString(
  jsonEncode(body),
  200,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  },
);

ResponseBody _status(int code, {String? location}) => ResponseBody.fromString(
  '',
  code,
  headers: location == null
      ? null
      : {
          'location': [location],
        },
);

void main() {
  group('probeServerPublicInfo', () {
    test('finds Emby served only under /emby and keeps the prefix', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/emby/System/Info/Public') {
          return _json({'ProductName': 'Emby Server', 'Version': '4.9.3.30'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://host');

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.emby);
      expect(result.resolvedBaseUrl, 'https://host/emby');
    });

    test('finds a root server and keeps the bare base url', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server', 'Version': '10.10.0'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://host');

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.jellyfin);
      expect(result.resolvedBaseUrl, 'https://host');
    });

    test('follows a redirect and resolves the final base url', () async {
      final dio = _dioWith((uri) {
        if (uri.host == 'old.host') {
          return _status(301, location: 'https://new.host/System/Info/Public');
        }
        if (uri.host == 'new.host' && uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://old.host');

      expect(result, isNotNull);
      expect(result!.resolvedBaseUrl, 'https://new.host');
    });

    test('rethrows when neither path answers', () async {
      final dio = _dioWith((_) => _status(404));

      expect(
        () => probeServerPublicInfo(dio, 'https://host'),
        throwsA(isA<DioException>()),
      );
    });
  });
}
