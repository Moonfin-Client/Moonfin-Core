import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/settings_save_retry.dart';

DioException _dio(DioExceptionType type, {int? status}) => DioException(
  requestOptions: RequestOptions(path: '/Moonfin/Games/Saves/x'),
  type: type,
  response: status == null
      ? null
      : Response<void>(
          requestOptions: RequestOptions(path: '/Moonfin/Games/Saves/x'),
          statusCode: status,
        ),
);

void main() {
  group('isTransientTransportFailure', () {
    test('transport failures are worth retrying', () {
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.connectionError)),
        isTrue,
      );
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.sendTimeout)),
        isTrue,
      );
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.receiveTimeout)),
        isTrue,
      );
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.connectionTimeout)),
        isTrue,
      );
    });

    test('server-side "try later" responses are worth retrying', () {
      for (final status in [408, 429, 500, 502, 503]) {
        expect(
          isTransientTransportFailure(
            _dio(DioExceptionType.badResponse, status: status),
          ),
          isTrue,
          reason: '$status should be retried',
        );
      }
    });

    test('a rejected request is not retried', () {
      // Repeating a 401/404 verbatim fails identically and only delays the
      // message the user needs to see.
      for (final status in [400, 401, 403, 404]) {
        expect(
          isTransientTransportFailure(
            _dio(DioExceptionType.badResponse, status: status),
          ),
          isFalse,
          reason: '$status should not be retried',
        );
      }
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.cancel)),
        isFalse,
      );
    });

    test('a slow decode is local work, not a transport failure', () {
      expect(
        isTransientTransportFailure(_dio(DioExceptionType.transformTimeout)),
        isFalse,
      );
    });

    test('a non-Dio error is an unknown, and unknowns are not retried', () {
      expect(isTransientTransportFailure(StateError('bug')), isFalse);
    });
  });

  group('retryOnTransientFailure', () {
    test('does not retry a call that succeeds', () async {
      var calls = 0;
      final result = await retryOnTransientFailure(() async {
        calls++;
        return 'ok';
      }, delay: (_) async {});

      expect(result, 'ok');
      expect(calls, 1);
    });

    test(
      'retries a dropped connection and returns the later success',
      () async {
        var calls = 0;
        final waited = <Duration>[];

        final result = await retryOnTransientFailure(() async {
          calls++;
          if (calls < 3) throw _dio(DioExceptionType.connectionError);
          return 'saved';
        }, delay: (duration) async => waited.add(duration));

        expect(result, 'saved');
        expect(calls, 3);
        expect(waited, defaultSettingsSaveBackoff.take(2));
      },
    );

    test('gives up after the backoff is exhausted and rethrows', () async {
      var calls = 0;

      await expectLater(
        retryOnTransientFailure(() async {
          calls++;
          throw _dio(DioExceptionType.connectionError);
        }, delay: (_) async {}),
        throwsA(isA<DioException>()),
      );

      // The failure must reach the caller: retrying quietly and then
      // swallowing the result is the same silent data loss with extra steps.
      expect(calls, defaultSettingsSaveBackoff.length + 1);
    });

    test('a non-transient failure fails immediately', () async {
      var calls = 0;

      await expectLater(
        retryOnTransientFailure(() async {
          calls++;
          throw _dio(DioExceptionType.badResponse, status: 401);
        }, delay: (_) async {}),
        throwsA(isA<DioException>()),
      );

      expect(calls, 1);
    });
  });
}
