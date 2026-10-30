import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:test/test.dart';

/// Captures the request the client is about to send, then stops it before it
/// reaches the network, so the auth headers can be asserted without a server.
Interceptor _capture(void Function(RequestOptions options) seen) {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      seen(options);
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
        ),
      );
    },
  );
}

void main() {
  const deviceInfo = DeviceInfo(
    id: 'device-1',
    name: 'Test Mac',
    appName: 'Moonfin',
    appVersion: '2.8.0',
  );

  test('the token rides in X-Emby-Token as well as the auth header', () async {
    RequestOptions? sent;
    final client = EmbyMediaServerClient(
      baseUrl: 'https://emby.invalid',
      deviceInfo: deviceInfo,
      interceptors: [_capture((options) => sent = options)],
    )..accessToken = 'tok-123';

    await expectLater(
      client.systemApi.getPublicSystemInfo(),
      throwsA(isA<DioException>()),
    );

    expect(sent, isNotNull);
    expect(sent!.headers['X-Emby-Token'], 'tok-123');
    expect(sent!.headers['Authorization'], contains('Token="tok-123"'));
  });

  test('no X-Emby-Token is sent before a token is known', () async {
    RequestOptions? sent;
    final client = EmbyMediaServerClient(
      baseUrl: 'https://emby.invalid',
      deviceInfo: deviceInfo,
      interceptors: [_capture((options) => sent = options)],
    );

    await expectLater(
      client.systemApi.getPublicSystemInfo(),
      throwsA(isA<DioException>()),
    );

    expect(sent, isNotNull);
    expect(sent!.headers.containsKey('X-Emby-Token'), isFalse);
    expect(sent!.headers['Authorization'], isNot(contains('Token=')));
  });
}
