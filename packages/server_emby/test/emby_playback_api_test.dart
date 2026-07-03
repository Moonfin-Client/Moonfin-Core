import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_playback_api.dart';
import 'package:test/test.dart';

/// Intercepts requests before they hit the network so we can assert on the
/// exact body sent and reply with a chosen status, mimicking how a strict
/// Jellyfin/Emby-compatible server (e.g. remux) responds.
class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler h)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) =>
      handle(options, h);
}

void main() {
  group('EmbyPlaybackApi.getPlaybackInfo body-rejection fallback', () {
    test(
      '422 on full body retries without DeviceProfile and returns the 200 body',
      () async {
        final bodies = <Map<String, dynamic>>[];
        final dio = Dio()
          ..interceptors.add(
            _FakeServer((options, h) {
              final data = Map<String, dynamic>.from(
                options.data as Map<String, dynamic>,
              );
              bodies.add(data);
              if (data.containsKey('DeviceProfile')) {
                h.reject(
                  DioException(
                    requestOptions: options,
                    type: DioExceptionType.badResponse,
                    response: Response(
                      requestOptions: options,
                      statusCode: 422,
                      data: {'error': 'failed to deserialize device_profile'},
                    ),
                  ),
                );
              } else {
                h.resolve(
                  Response(
                    requestOptions: options,
                    statusCode: 200,
                    data: {
                      'MediaSources': <dynamic>[],
                      'PlaySessionId': 'session-1',
                    },
                  ),
                );
              }
            }),
          );

        final api = EmbyPlaybackApi(dio, () => 'http://remux.local');
        final result = await api.getPlaybackInfo(
          'channel-1',
          userId: 'user-1',
          requestBody: <String, dynamic>{
            'DeviceProfile': {'CodecProfiles': <dynamic>[]},
            'AutoOpenLiveStream': true,
            'EnableDirectPlay': true,
          },
        );

        expect(result['PlaySessionId'], 'session-1');
        expect(bodies.length, 2);
        expect(bodies[0].containsKey('DeviceProfile'), isTrue);
        expect(bodies[1].containsKey('DeviceProfile'), isFalse);
        expect(bodies[1]['AutoOpenLiveStream'], isTrue);
        expect(bodies[1]['UserId'], 'user-1');
      },
    );

    test('non-body-rejection status (401) is rethrown, no retry', () async {
      var attempts = 0;
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, h) {
            attempts++;
            h.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.badResponse,
                response: Response(
                  requestOptions: options,
                  statusCode: 401,
                ),
              ),
            );
          }),
        );

      final api = EmbyPlaybackApi(dio, () => 'http://emby.local');

      await expectLater(
        api.getPlaybackInfo(
          'item-1',
          userId: 'user-1',
          requestBody: <String, dynamic>{'DeviceProfile': <String, dynamic>{}},
        ),
        throwsA(isA<DioException>()),
      );
      expect(attempts, 1);
    });

    test('200 on the first try returns immediately with no retry', () async {
      var requests = 0;
      final dio = Dio()
        ..interceptors.add(
          _FakeServer((options, h) {
            requests++;
            h.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {'PlaySessionId': 'ok'},
              ),
            );
          }),
        );

      final api = EmbyPlaybackApi(dio, () => 'http://emby.local');
      final result = await api.getPlaybackInfo(
        'item-1',
        userId: 'user-1',
        requestBody: <String, dynamic>{
          'DeviceProfile': <String, dynamic>{},
          'AutoOpenLiveStream': true,
        },
      );

      // Happy path is untouched: one request, DeviceProfile intact, no fallback.
      expect(result['PlaySessionId'], 'ok');
      expect(requests, 1);
    });
  });
}
