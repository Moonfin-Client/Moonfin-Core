import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_users_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.status, [this.body]);

  final int status;
  final Object? body;
  final requests = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requests.add(options);
    final response = Response(
      requestOptions: options,
      statusCode: status,
      data: body,
    );
    if (status >= 400) {
      handler.reject(
        DioException.badResponse(
          statusCode: status,
          requestOptions: options,
          response: response,
        ),
      );
    } else {
      handler.resolve(response);
    }
  }
}

Dio _dio(_FakeServer server) => Dio()..interceptors.add(server);

void main() {
  group('getAccessSchedules', () {
    test(
      'reads the user by id, which still answers outside the schedule',
      () async {
        final server = _FakeServer(200, {
          'Id': 'abc',
          'Policy': {'IsAdministrator': false, 'AccessSchedules': []},
        });

        await JellyfinUsersApi(_dio(server)).getAccessSchedules('abc');

        expect(server.requests.single.method, 'GET');
        expect(server.requests.single.path, '/Users/abc');
      },
    );

    test('returns the entries the server sent', () async {
      final server = _FakeServer(200, {
        'Id': 'abc',
        'Policy': {
          'AccessSchedules': [
            {
              'Id': 1,
              'UserId': 'abc',
              'DayOfWeek': 'Weekday',
              'StartHour': 8,
              'EndHour': 20.5,
            },
          ],
        },
      });

      final schedules = await JellyfinUsersApi(
        _dio(server),
      ).getAccessSchedules('abc');

      expect(schedules, hasLength(1));
      expect(schedules!.single.dayOfWeek, 'Weekday');
      expect(schedules.single.startHour, 8.0);
      expect(schedules.single.endHour, 20.5);
    });

    test('is empty for a user with no limit', () async {
      final server = _FakeServer(200, {
        'Id': 'abc',
        'Policy': {'AccessSchedules': []},
      });

      expect(
        await JellyfinUsersApi(_dio(server)).getAccessSchedules('abc'),
        isEmpty,
      );
    });

    test('is null when the server sent no policy', () async {
      final server = _FakeServer(200, {'Id': 'abc'});

      expect(
        await JellyfinUsersApi(_dio(server)).getAccessSchedules('abc'),
        isNull,
      );
    });

    test('lets a failure through for the caller to deal with', () async {
      final server = _FakeServer(403, 'Error processing request.');

      expect(
        JellyfinUsersApi(_dio(server)).getAccessSchedules('abc'),
        throwsA(isA<DioException>()),
      );
    });
  });
}
