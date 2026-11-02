import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_info.dart';
import 'package:moonfin/data/utils/server_trickplay.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

const _episode = 'episode-imdb-tt1641384-1-1';

/// Answers Young Justice 1x01's captured previews, and counts the reads.
class _Silo implements HttpClientAdapter {
  int reads = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.uri.path != '/api/v2/watch/$_episode/trickplay') {
      return ResponseBody.fromString('{}', 404);
    }
    reads++;
    return ResponseBody.fromString(
      File(
        'packages/server_silo/test/fixtures/silo/watch_trickplay_episode.json',
      ).readAsStringSync(),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _client(_Silo server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'device-1',
          name: 'Test Mac',
          appName: 'Moonfin',
          appVersion: '1.9.0',
        ),
        httpClientAdapter: server,
        clock: () => DateTime.utc(2026, 10, 15, 12),
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.utc(2027),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

void main() {
  test('a Silo file\'s previews become the item\'s Trickplay', () async {
    final server = _Silo();
    final client = _client(server);
    final raw = <String, dynamic>{'Id': _episode};
    await mergeServerTrickplay(client, _episode, raw, '89618');
    final info = TrickplayInfo.fromItemData(raw, mediaSourceId: '89618')!;
    expect(info.isValid, isTrue);
    expect(info.width, 300);
    expect(info.tilesPerImage, 80);
    final tile = info.resolveTile(const Duration(minutes: 14));
    // Thumbnail 84 is on the second sheet.
    expect(tile.imageIndex, 1);
    expect(
      client.imageApi.getTrickplayTileImageUrl(
        _episode,
        width: info.width,
        index: tile.imageIndex,
        mediaSourceId: '89618',
      ),
      contains('/api/v2/artwork/trickplay/89618/'),
    );

    // Already there: not read again.
    await mergeServerTrickplay(client, _episode, raw, '89618');
    expect(server.reads, 1);
  });

  test('nothing to do without a file, or without the API', () async {
    final server = _Silo();
    final raw = <String, dynamic>{'Id': _episode};
    await mergeServerTrickplay(_client(server), _episode, raw, null);
    expect(raw, isNot(contains('Trickplay')));
    expect(server.reads, 0);
  });
}
