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

  test('resume items page through StartIndex', () async {
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

    await JellyfinItemsApi(
      dio,
      () => 'user-1',
    ).getResumeItems(startIndex: 30, limit: 15);

    expect(request?.path, '/UserItems/Resume');
    expect(request?.queryParameters['StartIndex'], 30);
    expect(request?.queryParameters['Limit'], 15);
  });

  test('resume items send MediaTypes instead of a type list', () async {
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

    await JellyfinItemsApi(
      dio,
      () => 'user-1',
    ).getResumeItems(mediaTypes: 'Video', limit: 12);

    expect(request?.path, '/UserItems/Resume');
    expect(request?.queryParameters['MediaTypes'], 'Video');
    expect(request?.queryParameters.containsKey('IncludeItemTypes'), isFalse);
  });

  test('next up pages through StartIndex', () async {
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

    await JellyfinItemsApi(dio, () => 'user-1').getNextUp(startIndex: 15);

    expect(request?.path, '/Shows/NextUp');
    expect(request?.queryParameters['StartIndex'], 15);
  });

  test('an unpaged request sends no StartIndex', () async {
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

    await JellyfinItemsApi(dio, () => 'user-1').getResumeItems(limit: 15);

    expect(request?.queryParameters.containsKey('StartIndex'), isFalse);
  });

  test('seasons ask for the child count', () async {
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

    await JellyfinItemsApi(
      dio,
      () => 'user-1',
    ).getSeasons('series-1', fields: 'ChildCount');

    expect(request?.path, '/Shows/series-1/Seasons');
    expect(request?.queryParameters['Fields'], 'ChildCount');
  });

  test('seasons send no Fields when none are asked for', () async {
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

    await JellyfinItemsApi(dio, () => 'user-1').getSeasons('series-1');

    expect(request?.queryParameters.containsKey('Fields'), isFalse);
  });
}
