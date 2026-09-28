import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_user_library_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

void main() {
  test('numeric rating posts only Rating to UserData', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(Response(requestOptions: options, statusCode: 204));
        }),
      );

    final api = JellyfinUserLibraryApi(dio);
    await api.updateNumericUserRating('movie-1', rating: 8.5);

    expect(api.supportsNumericUserRatings, isTrue);
    expect(request?.method, 'POST');
    expect(request?.path, '/UserItems/movie-1/UserData');
    expect(request?.queryParameters, isEmpty);
    expect(request?.data, {'Rating': 8.5});
  });

  test('thumb rating continues to use the legacy Likes endpoint', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(Response(requestOptions: options, statusCode: 204));
        }),
      );

    await JellyfinUserLibraryApi(dio).updateUserRating('movie-1', likes: true);

    expect(request?.method, 'POST');
    expect(request?.path, '/UserItems/movie-1/Rating');
    expect(request?.queryParameters, {'Likes': true});
  });

  test('clearing a rating uses the Rating delete endpoint', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(Response(requestOptions: options, statusCode: 204));
        }),
      );

    await JellyfinUserLibraryApi(dio).deleteUserRating('movie-1');

    expect(request?.method, 'DELETE');
    expect(request?.path, '/UserItems/movie-1/Rating');
  });

  test('marking played sends datePlayed only when one is given', () async {
    final requests = <RequestOptions>[];
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          requests.add(options);
          handler.resolve(Response(requestOptions: options, statusCode: 200));
        }),
      );

    final api = JellyfinUserLibraryApi(dio);
    await api.markPlayed('ep-1');
    await api.markPlayed(
      'ep-1',
      datePlayed: DateTime.utc(2026, 8, 23, 18, 5, 9),
    );

    expect(requests[0].method, 'POST');
    expect(requests[0].path, '/UserPlayedItems/ep-1');
    expect(requests[0].queryParameters, isEmpty);
    expect(requests[1].queryParameters, {
      'datePlayed': '2026-08-23T18:05:09.000Z',
    });
  });
}
