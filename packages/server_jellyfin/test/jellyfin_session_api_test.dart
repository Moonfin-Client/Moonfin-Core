import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_session_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

/// A Dio that answers everything, handing back whatever request it was given.
(Dio, RequestOptions? Function()) _recordingDio() {
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
  return (dio, () => request);
}

void main() {
  group('playstate commands', () {
    test('the command rides in the path, not the body', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(dio).sendPlayStateCommand('sess-1', 'PlayPause');

      expect(request()?.method, 'POST');
      expect(request()?.path, '/Sessions/sess-1/Playing/PlayPause');
      expect(request()?.data, isNull);
    });

    test('a seek carries its position as a query parameter', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(
        dio,
      ).sendPlayStateCommand('sess-1', 'Seek', seekPositionTicks: 300000000);

      expect(request()?.path, '/Sessions/sess-1/Playing/Seek');
      expect(request()?.queryParameters['seekPositionTicks'], 300000000);
    });

    test('a command with no position sends no empty parameter', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(dio).sendPlayStateCommand('sess-1', 'Stop');

      expect(
        request()?.queryParameters.containsKey('seekPositionTicks'),
        isFalse,
      );
    });
  });

  group('general commands', () {
    test('the name rides in the body', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(dio).sendGeneralCommand('sess-1', 'GoHome');

      expect(request()?.method, 'POST');
      expect(request()?.path, '/Sessions/sess-1/Command');
      expect((request()?.data as Map)['Name'], 'GoHome');
    });

    test('arguments are nested under Arguments', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(
        dio,
      ).sendGeneralCommand('sess-1', 'SetVolume', arguments: {'Volume': '25'});

      final body = request()?.data as Map;
      expect(body['Name'], 'SetVolume');
      expect(body['Arguments'], {'Volume': '25'});
    });

    test('no arguments means no Arguments key at all', () async {
      final (dio, request) = _recordingDio();

      await JellyfinSessionApi(dio).sendGeneralCommand('sess-1', 'VolumeUp');

      expect((request()?.data as Map).containsKey('Arguments'), isFalse);
    });
  });

  test('a message posts its text to the session', () async {
    final (dio, request) = _recordingDio();

    await JellyfinSessionApi(dio).sendMessage('sess-1', 'dinner', header: 'Hi');

    expect(request()?.method, 'POST');
    expect(request()?.path, '/Sessions/sess-1/Message');
    expect((request()?.data as Map)['Text'], 'dinner');
    expect((request()?.data as Map)['Header'], 'Hi');
  });

  test('capabilities go up as the body of one post', () async {
    final (dio, request) = _recordingDio();

    await JellyfinSessionApi(dio).reportCapabilities({
      'SupportedCommands': ['GoHome'],
    });

    expect(request()?.path, '/Sessions/Capabilities/Full');
    expect((request()?.data as Map)['SupportedCommands'], ['GoHome']);
  });
}
