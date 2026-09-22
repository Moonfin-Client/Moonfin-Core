import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_client_log_api.dart';
import 'package:test/test.dart';

/// Intercepts requests before they hit the network so we can assert on the
/// exact request sent and reply with a chosen body.
class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler h)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) =>
      handle(options, h);
}

(Dio, RequestOptions? Function()) _recordingDio({Object? data}) {
  RequestOptions? request;
  final dio = Dio()
    ..interceptors.add(
      _FakeServer((options, h) {
        request = options;
        h.resolve(Response(requestOptions: options, data: data));
      }),
    );
  return (dio, () => request);
}

void main() {
  group('EmbyClientLogApi.uploadDocument', () {
    test('posts the report to the plugin route as plain text', () async {
      final (dio, request) = _recordingDio(
        data: {'FileName': 'upload_Moonfin_2.5.1_20260913T101500123.txt'},
      );

      final fileName = await EmbyClientLogApi(dio).uploadDocument('the report');

      expect(request()?.method, 'POST');
      expect(request()?.path, '/Moonfin/ClientLog/Document');
      expect(request()?.data, 'the report');
      expect(request()?.contentType, startsWith('text/plain'));
      expect(fileName, 'upload_Moonfin_2.5.1_20260913T101500123.txt');
    });

    test('returns null when the server names no file', () async {
      final (dio, _) = _recordingDio(data: {'Success': true});

      expect(await EmbyClientLogApi(dio).uploadDocument('the report'), isNull);
    });

    test('returns null when the body is not a map', () async {
      final (dio, _) = _recordingDio(data: 'accepted');

      expect(await EmbyClientLogApi(dio).uploadDocument('the report'), isNull);
    });

    test('lets a rejection reach the caller', () async {
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, h) {
            h.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.badResponse,
                response: Response(
                  requestOptions: options,
                  statusCode: 503,
                  data: {'Error': 'Client log upload is disabled'},
                ),
              ),
            );
          }),
        );

      await expectLater(
        EmbyClientLogApi(dio).uploadDocument('the report'),
        throwsA(isA<DioException>()),
      );
    });
  });
}
