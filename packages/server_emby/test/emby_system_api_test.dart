import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/src/api/emby_system_api.dart';
import 'package:test/test.dart';

/// Answers every request with [status] and records it.
Dio _answering(int status, List<RequestOptions> sent, {Object? body}) =>
    Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            sent.add(options);
            final response = Response<dynamic>(
              requestOptions: options,
              statusCode: status,
              data: body,
            );
            if (status >= 200 && status < 300) {
              handler.resolve(response);
            } else {
              handler.reject(
                DioException.badResponse(
                  statusCode: status,
                  requestOptions: options,
                  response: response,
                ),
              );
            }
          },
        ),
      );

void main() {
  group('EmbySystemApi.ping', () {
    test('asks /System/Ping for plain text within the ping timeout', () async {
      final sent = <RequestOptions>[];
      final api = EmbySystemApi(_answering(200, sent, body: 'Emby Server'));

      expect(await api.ping(), isTrue);
      expect(sent.single.path, '/System/Ping');
      expect(sent.single.responseType, ResponseType.plain);
      expect(sent.single.receiveTimeout, SystemApi.pingTimeout);
    });

    // Emby turns down a remote ping without a valid token, but it answered.
    test('a 401 counts as an answer', () async {
      final api = EmbySystemApi(_answering(401, []));
      expect(await api.ping(), isTrue);
    });

    test('any other refusal counts as down', () async {
      for (final status in [404, 502]) {
        final api = EmbySystemApi(_answering(status, []));
        expect(await api.ping(), isFalse, reason: '$status');
      }
    });
  });
}
