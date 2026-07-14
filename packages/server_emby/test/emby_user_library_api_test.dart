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

void main() {
  test('numeric rating posts Rating to the Emby user data endpoint', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(Response(requestOptions: options, statusCode: 204));
        }),
      );

    final api = EmbyUserLibraryApi(dio, () => 'user-1');
    await api.updateNumericUserRating('movie-1', rating: 8.5);

    expect(api.supportsNumericUserRatings, isTrue);
    expect(request?.method, 'POST');
    expect(request?.path, '/Users/user-1/Items/movie-1/UserData');
    expect(request?.data, {'Rating': 8.5});
  });
}
