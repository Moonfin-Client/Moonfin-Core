import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_http_client.dart';
import 'package:moonfin/data/services/seerr/seerr_models.dart';

/// Moonbase answers a queue removal with 404 both when the download has
/// already left the queue and when it can't find the arr at all.
void main() {
  late HttpServer server;
  late String error;

  setUp(() async {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      await request.drain<void>();
      request.response
        ..statusCode = 404
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({'error': error}));
      await request.response.close();
    });
  });

  tearDown(() => server.close(force: true));

  SeerrHttpClient client() => SeerrHttpClient(
    proxyConfig: MoonfinProxyConfig(
      jellyfinBaseUrl: 'http://${server.address.host}:${server.port}',
      jellyfinToken: 'token',
    ),
  );

  test('a download already gone from the queue counts as removed', () async {
    error = 'That download is no longer in the Radarr queue';
    final c = client();
    await c.removeArrQueueItem(radarr: true, queueId: 41);
    c.close();
  });

  test('a missing arr is a failure', () async {
    error = 'No radarr server is configured in Seerr';
    final c = client();
    await expectLater(
      c.removeArrQueueItem(radarr: true, queueId: 41),
      throwsA(anything),
    );
    c.close();
  });
}
