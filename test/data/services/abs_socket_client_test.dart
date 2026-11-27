import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:server_audiobookshelf/server_audiobookshelf.dart';
import 'package:server_core/server_core.dart';

void main() {
  test('Audiobookshelf progress from another app reaches the user data', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    final fromApp = <String>[];
    final progress = {
      'libraryItemId': 'book-1',
      'episodeId': null,
      'currentTime': 42,
      'duration': 100,
      'progress': 0.42,
      'isFinished': false,
      'lastUpdate': 2,
    };
    server.listen((request) async {
      if (request.uri.path == '/socket.io/') {
        final socket = await WebSocketTransformer.upgrade(request);
        socket.add('0{"sid":"a","pingInterval":25000,"pingTimeout":20000}');
        socket.listen((frame) {
          fromApp.add('$frame');
          if (frame == '40') socket.add('40{"sid":"b"}');
          if ('$frame'.startsWith('42["auth"')) {
            socket.add('42["init",{"userId":"user-1"}]');
            socket.add('2');
            socket.add(
              '42${jsonEncode([
                'user_item_progress_updated',
                {'id': 'p1', 'sessionId': 's1', 'data': progress},
              ])}',
            );
          }
        });
        return;
      }
      final body = switch (request.uri.path) {
        '/api/items/batch/get' => {
          'libraryItems': [
            {
              'id': 'book-1',
              'libraryId': 'lib-a',
              'mediaType': 'book',
              'media': {
                'metadata': {'title': 'Book'},
                'numTracks': 1,
                'duration': 100,
              },
            },
          ],
        },
        '/api/me' => {
          'id': 'user-1',
          'mediaProgress': [progress],
        },
        _ => <String, dynamic>{},
      };
      request.response
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(body));
      await request.response.close();
    });

    final abs = AbsMediaServerClient(
      baseUrl: 'http://127.0.0.1:${server.port}',
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Test',
        appName: 'Moonfin',
        appVersion: '1',
      ),
    )
      ..accessToken = 'token-1'
      ..userId = 'user-1';
    final client = AbsSocketClient(abs);
    addTearDown(client.dispose);
    final change = client.messages
        .firstWhere((m) => m is UserDataChangedMessage)
        .timeout(const Duration(seconds: 5));

    await client.connect();
    final message = await change as UserDataChangedMessage;

    expect(fromApp, containsAllInOrder(['40', '42["auth","token-1"]', '3']));
    expect(message.userId, 'user-1');
    expect(
      message.userDataList.single,
      allOf(
        containsPair('ItemId', 'book-1'),
        containsPair('PlaybackPositionTicks', 420000000),
        containsPair('Played', false),
      ),
    );
  });
}
