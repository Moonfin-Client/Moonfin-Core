import 'package:dio/dio.dart';
import 'package:server_emby/server_emby.dart';
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
  test('loads and parses an Emby thumbnail set', () async {
    RequestOptions? request;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(
            Response(
              requestOptions: options,
              data: const <String, dynamic>{
                'AspectRatio': 16 / 9,
                'Thumbnails': [
                  {'PositionTicks': 0, 'ImageTag': 'bif-tag'},
                  {'PositionTicks': 100000000, 'ImageTag': 'bif-tag'},
                ],
              },
            ),
          );
        }),
      );

    final result = await EmbyTrickplayApi(
      dio,
      () => 'https://emby.example',
      () => null,
    ).getThumbnailSet('item-1', width: 320, mediaSourceId: 'source-1');

    expect(request?.path, '/Items/item-1/ThumbnailSet');
    expect(request?.queryParameters, {
      'Width': 320,
      'MediaSourceId': 'source-1',
    });
    expect(result?.aspectRatio, closeTo(16 / 9, 0.0001));
    expect(result?.thumbnails, hasLength(2));
    expect(result?.thumbnails.last.positionTicks, 100000000);
    expect(result?.thumbnails.last.imageTag, 'bif-tag');
  });

  test('returns null for a missing BIF', () async {
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          handler.reject(
            DioException(
              requestOptions: options,
              response: Response(requestOptions: options, statusCode: 404),
              type: DioExceptionType.badResponse,
            ),
          );
        }),
      );

    final result = await EmbyTrickplayApi(
      dio,
      () => 'https://emby.example',
      () => null,
    ).getThumbnailSet('missing', width: 320);

    expect(result, isNull);
  });

  test('returns null for malformed thumbnail metadata', () async {
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          handler.resolve(
            Response(
              requestOptions: options,
              data: const <String, dynamic>{'AspectRatio': 0, 'Thumbnails': []},
            ),
          );
        }),
      );

    final result = await EmbyTrickplayApi(
      dio,
      () => 'https://emby.example',
      () => null,
    ).getThumbnailSet('bad', width: 320);

    expect(result, isNull);
  });

  test('returns null when the server has generated no previews', () async {
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          handler.resolve(
            Response(
              requestOptions: options,
              // A library with no generated previews sends no AspectRatio
              // at all, not an empty one.
              data: const <String, dynamic>{'Thumbnails': <dynamic>[]},
            ),
          );
        }),
      );

    final result = await EmbyTrickplayApi(
      dio,
      () => 'https://emby.example',
      () => null,
    ).getThumbnailSet('no-previews', width: 320);

    expect(result, isNull);
  });

  test('builds an individually addressable Emby BIF frame URL', () {
    final api = EmbyTrickplayApi(
      Dio(),
      () => 'https://emby.example/emby',
      () => 'secret-token',
    );

    final uri = Uri.parse(
      api.getFrameImageUrl(
        'item-1',
        width: 320,
        positionTicks: 200000000,
        imageTag: 'bif-tag',
        mediaSourceId: 'source-1',
      ),
    );

    expect(uri.path, '/emby/Items/item-1/Images/Thumbnail');
    expect(uri.queryParameters, {
      'maxWidth': '320',
      'tag': 'bif-tag',
      'PositionTicks': '200000000',
      'MediaSourceId': 'source-1',
      'quality': '90',
      'api_key': 'secret-token',
    });
  });
}
