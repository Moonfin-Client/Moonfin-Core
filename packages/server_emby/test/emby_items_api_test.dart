import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_items_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

(Dio, RequestOptions? Function()) _recordingDio({
  Object? data = const <String, dynamic>{},
}) {
  RequestOptions? request;
  final dio = Dio()
    ..interceptors.add(
      _FakeServer((options, handler) {
        request = options;
        handler.resolve(Response(requestOptions: options, data: data));
      }),
    );
  return (dio, () => request);
}

void main() {
  test('genres drop the ItemCounts field Emby has no name for', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(dio, () => 'user-1').getGenres(
      fields: 'ItemCounts,PrimaryImageAspectRatio',
      recursive: true,
    );

    expect(request()?.path, '/Genres');
    expect(request()?.queryParameters['Fields'], 'PrimaryImageAspectRatio');
  });

  test('resume items send MediaTypes instead of a type list', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(
      dio,
      () => 'user-1',
    ).getResumeItems(mediaTypes: 'Audio', limit: 12);

    expect(request()?.path, '/Users/user-1/Items/Resume');
    expect(request()?.queryParameters['MediaTypes'], 'Audio');
    expect(request()?.queryParameters.containsKey('IncludeItemTypes'), isFalse);
  });

  test('studios drop ItemCounts too', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(
      dio,
      () => 'user-1',
    ).getStudios(fields: 'ChildCount,ItemCounts,PrimaryImageTag');

    expect(request()?.queryParameters['Fields'], 'ChildCount,PrimaryImageTag');
  });

  test('a request asking only for it sends no Fields at all', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(dio, () => 'user-1').getGenres(fields: 'ItemCounts');

    expect(request()?.queryParameters.containsKey('Fields'), isFalse);
  });

  test('fields Emby does know are passed through untouched', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(
      dio,
      () => 'user-1',
    ).getGenres(fields: 'PrimaryImageTag,ImageTags');

    expect(request()?.queryParameters['Fields'], 'PrimaryImageTag,ImageTags');
  });

  // Emby serves the same remote subtitle routes as Jellyfin. It ignores
  // MediaSourceId, so sending one buys nothing.
  group('remote subtitles', () {
    test('a search asks the shared route and skips MediaSourceId', () async {
      final (dio, request) = _recordingDio(data: const []);

      await EmbyItemsApi(
        dio,
        () => 'user-1',
      ).searchRemoteSubtitles('28866', language: 'eng');

      expect(request()?.path, '/Items/28866/RemoteSearch/Subtitles/eng');
      expect(request()?.method, 'GET');
      expect(request()?.queryParameters.containsKey('MediaSourceId'), isFalse);
      expect(request()?.queryParameters.containsKey('IsPerfectMatch'), isFalse);
    });

    test('a perfect match request carries the flag', () async {
      final (dio, request) = _recordingDio(data: const []);

      await EmbyItemsApi(
        dio,
        () => 'user-1',
      ).searchRemoteSubtitles('28866', language: 'eng', isPerfectMatch: true);

      expect(request()?.queryParameters['IsPerfectMatch'], isTrue);
    });

    test('results come back as the bare list Emby sends', () async {
      final (dio, _) = _recordingDio(
        data: const [
          {
            'Id': 'e02a34f5_en_srt',
            'ProviderName': 'Open Subtitles',
            'Format': 'srt',
          },
        ],
      );

      final results = await EmbyItemsApi(
        dio,
        () => 'user-1',
      ).searchRemoteSubtitles('28866', language: 'eng');

      expect(results, hasLength(1));
      expect(results.first['Id'], 'e02a34f5_en_srt');
      expect(results.first['ProviderName'], 'Open Subtitles');
      expect(results.first['Format'], 'srt');
    });

    test('a download posts to the subtitle it was given', () async {
      final (dio, request) = _recordingDio();

      await EmbyItemsApi(
        dio,
        () => 'user-1',
      ).downloadRemoteSubtitle('28866', 'e02a34f5_en_srt');

      expect(
        request()?.path,
        '/Items/28866/RemoteSearch/Subtitles/e02a34f5_en_srt',
      );
      expect(request()?.method, 'POST');
    });
  });

  test('seasons ask for the child count', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(
      dio,
      () => 'user-1',
    ).getSeasons('series-1', fields: 'ChildCount');

    expect(request()?.path, '/Shows/series-1/Seasons');
    expect(request()?.queryParameters['Fields'], 'ChildCount');
  });

  test('seasons send no Fields when none are asked for', () async {
    final (dio, request) = _recordingDio();

    await EmbyItemsApi(dio, () => 'user-1').getSeasons('series-1');

    expect(request()?.queryParameters.containsKey('Fields'), isFalse);
  });
}
