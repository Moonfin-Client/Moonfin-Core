import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_items_api.dart';
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
  test('item details request UserData', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(
            Response(requestOptions: options, data: <String, dynamic>{}),
          );
        }),
      );

    await JellyfinItemsApi(dio, () => 'user-1').getItem('movie-1');

    expect(request?.method, 'GET');
    expect(request?.path, '/Users/user-1/Items/movie-1');
    expect(request?.queryParameters['Fields'], contains('UserData'));
  });
}
