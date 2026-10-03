import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_user_library_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

/// Runs [call] against a server that records the request and answers with
/// [status], and hands back what it recorded.
Future<RequestOptions?> record(
  Future<void> Function(EmbyUserLibraryApi api) call, {
  int status = 200,
}) async {
  RequestOptions? request;
  final dio = Dio()
    ..interceptors.add(
      _FakeServer((options, handler) {
        request = options;
        final response = Response<dynamic>(
          requestOptions: options,
          statusCode: status,
        );
        if (status >= 400) {
          handler.reject(
            DioException(requestOptions: options, response: response),
          );
          return;
        }
        handler.resolve(response);
      }),
    );

  await call(EmbyUserLibraryApi(dio, () => 'user-1'));
  return request;
}

void main() {
  test('marking played sends DatePlayed in UTC yyyyMMddHHmmss', () async {
    final plain = await record((api) => api.markPlayed('ep-1'));
    expect(plain?.method, 'POST');
    expect(plain?.path, '/Users/user-1/PlayedItems/ep-1');
    expect(plain?.queryParameters, isEmpty);

    final dated = await record(
      (api) => api.markPlayed(
        'ep-1',
        datePlayed: DateTime.utc(2026, 8, 3, 8, 5, 9),
      ),
    );
    expect(dated?.queryParameters, {'DatePlayed': '20260803080509'});
  });

  test('a numeric rating goes to Moonbase', () async {
    final request = await record(
      (api) => api.updateNumericUserRating('movie-1', rating: 8.5),
    );

    expect(request?.method, 'POST');
    expect(request?.path, '/Moonfin/UserRatings/movie-1');
    expect(request?.queryParameters, {'Rating': 8.5});
  });

  test('a thumb goes to Moonbase', () async {
    final request = await record(
      (api) => api.updateUserRating('movie-1', likes: true),
    );

    expect(request?.method, 'POST');
    expect(request?.path, '/Moonfin/UserRatings/movie-1');
    expect(request?.queryParameters, {'Likes': true});
  });

  test('clearing a rating goes to Moonbase', () async {
    final request = await record((api) => api.deleteUserRating('movie-1'));

    expect(request?.method, 'DELETE');
    expect(request?.path, '/Moonfin/UserRatings/movie-1');
  });

  test('numeric ratings are offered', () {
    expect(
      EmbyUserLibraryApi(Dio(), () => 'user-1').supportsNumericUserRatings,
      isTrue,
    );
  });

  group('a server with no Moonbase on it', () {
    test('does not fail a rating', () async {
      await expectLater(
        record(
          (api) => api.updateNumericUserRating('movie-1', rating: 8.5),
          status: 404,
        ),
        completes,
      );
    });

    test('does not fail a thumb or a clear', () async {
      await expectLater(
        record(
          (api) => api.updateUserRating('movie-1', likes: false),
          status: 404,
        ),
        completes,
      );
      await expectLater(
        record((api) => api.deleteUserRating('movie-1'), status: 404),
        completes,
      );
    });
  });

  test('a real failure is still a failure', () async {
    await expectLater(
      record(
        (api) => api.updateNumericUserRating('movie-1', rating: 8.5),
        status: 500,
      ),
      throwsA(isA<DioException>()),
    );
  });
}
