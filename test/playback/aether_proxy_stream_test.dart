import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_proxy_stream.dart';
import 'package:server_core/server_core.dart';

void main() {
  tearDown(resetServerNetworkOverrides);

  test('routes an Emby byte range through the configured HTTP proxy', () async {
    final proxy = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => proxy.close(force: true));
    gServerProxyUrl = '127.0.0.1:${proxy.port}';
    final source = Uri.parse(
      'http://media.example.test/emby/Videos/1/stream?Static=true&api_key=test',
    );
    final extra = ServerRequestHeader.tryCreate(
      serverUrl: source.origin,
      name: 'X-Video-Gateway',
      value: 'test-only',
    )!;
    gServerRequestHeaders = [extra];

    final requests = <(String, Uri, String?, String?, String?)>[];
    proxy.listen((request) async {
      requests.add((
        request.method,
        request.uri,
        request.headers.value('range'),
        request.headers.value('x-emby-authorization'),
        request.headers.value('x-video-gateway'),
      ));
      final response = request.response
        ..statusCode = HttpStatus.partialContent
        ..contentLength = 1;
      response.headers
        ..set('content-type', 'video/mp4')
        ..set('content-range', 'bytes 7-7/50')
        ..set('accept-ranges', 'bytes');
      if (request.method == 'GET') response.add([7]);
      await response.close();
    });

    const auth = 'MediaBrowser Token="test"';
    final relay = (await AetherProxyStream.open(source.toString(), {
      'X-Emby-Authorization': auth,
    }))!;
    addTearDown(relay.close);
    final localUrl = Uri.parse(relay.url);
    expect(localUrl.host, '127.0.0.1');
    expect(localUrl.hasQuery, isFalse);

    final player = HttpClient()..findProxy = (_) => 'DIRECT';
    addTearDown(() => player.close(force: true));
    for (final method in ['HEAD', 'GET']) {
      final request = await player.openUrl(method, localUrl);
      request.headers.set('range', 'bytes=7-7');
      final response = await request.close();
      expect(response.statusCode, HttpStatus.partialContent);
      expect(response.headers.value('content-range'), 'bytes 7-7/50');
      expect(response.headers.contentType?.mimeType, 'video/mp4');
      expect(await response.expand((chunk) => chunk).toList(), [
        if (method == 'GET') 7,
      ]);
    }
    expect(requests, [
      ('HEAD', source, 'bytes=7-7', auth, 'test-only'),
      ('GET', source, 'bytes=7-7', auth, 'test-only'),
    ]);
  });
}
