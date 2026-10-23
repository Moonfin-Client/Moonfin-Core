import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/plex_tv_service.dart';
import 'package:server_core/server_core.dart' show DeviceInfo;

void main() {
  group('PlexServer', () {
    Map<String, dynamic> connection(
      String address, {
      bool local = false,
      bool relay = false,
    }) => {
      'uri': 'https://${address.replaceAll('.', '-')}.hash.plex.direct:32400',
      'address': address,
      'port': 32400,
      'local': local,
      'relay': relay,
    };

    PlexServer server(List<Map<String, dynamic>> connections) =>
        PlexServer.fromJson({
          'clientIdentifier': 'machine',
          'name': 'Basement',
          'productVersion': '1.43.4.10903-e5521bd8c',
          'accessToken': 'token',
          'connections': connections,
        });

    test('orders local connections first and relay last', () {
      final basement = server([
        connection('10.0.0.1', relay: true),
        connection('203.0.113.7'),
        connection('192.168.50.45', local: true),
      ]);
      expect(basement.id, 'machine');
      expect(basement.version, '1.43.4.10903');
      expect(basement.accessToken, 'token');
      expect(basement.connections.map((c) => c.uri), [
        'https://192-168-50-45.hash.plex.direct:32400',
        'http://192.168.50.45:32400',
        'https://203-0-113-7.hash.plex.direct:32400',
        'https://10-0-0-1.hash.plex.direct:32400',
      ]);
      expect(basement.address, '192.168.50.45:32400');
    });

    test('leaves out the plain local address when the server requires a '
        'secure one', () {
      final basement = PlexServer.fromJson({
        'clientIdentifier': 'machine',
        'httpsRequired': true,
        'connections': [connection('192.168.50.45', local: true)],
      });
      expect(basement.connections.map((c) => c.uri), [
        'https://192-168-50-45.hash.plex.direct:32400',
      ]);
    });

    test('puts LAN addresses found by GDM ahead of plex.tv ones', () {
      final basement = server([
        connection('172.17.0.2', local: true),
      ]).withLanUris(['http://192.168.50.45:32400']);
      expect(basement.connections.first.uri, 'http://192.168.50.45:32400');
      expect(basement.address, '192.168.50.45:32400');
      expect(basement.connections, hasLength(3));
    });

    test('has no address without connections', () {
      expect(server(const []).address, isNull);
    });
  });

  group('firstAnswering', () {
    const local = 'http://192.168.50.45:32400';
    const container = 'https://172-17-0-2.hash.plex.direct:32400';
    const relay = 'https://relay.plex.direct:8443';

    Future<bool> Function(String) answering(Map<String, int?> afterMs) =>
        (uri) async {
          final ms = afterMs[uri];
          await Future<void>.delayed(Duration(milliseconds: ms ?? 4000));
          return ms != null;
        };

    test('keeps the best address even when a worse one answers first', () {
      fakeAsync((async) {
        String? picked;
        firstAnswering(
          [local, relay],
          answering({local: 300, relay: 50}),
        ).then((uri) => picked = uri);
        async.elapse(const Duration(milliseconds: 400));
        expect(picked, local);
      });
    });

    test("doesn't wait out a dead address once another answers", () {
      fakeAsync((async) {
        String? picked;
        firstAnswering(
          [container, relay],
          answering({container: null, relay: 50}),
        ).then((uri) => picked = uri);
        async.elapse(const Duration(milliseconds: 1100));
        expect(picked, relay);
      });
    });

    test('has nothing when no address answers', () {
      fakeAsync((async) {
        String? picked = 'unanswered';
        firstAnswering(
          [container, relay],
          answering({}),
        ).then((uri) => picked = uri);
        async.elapse(const Duration(seconds: 5));
        expect(picked, isNull);
      });
    });
  });

  group('findReachableUri', () {
    late HttpServer live;
    late HttpServer silent;

    setUp(() async {
      live = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      live.listen((request) {
        request.response
          ..headers.contentType = ContentType.json
          ..write('{"MediaContainer":{"machineIdentifier":"machine"}}')
          ..close();
      });
      // Accepts connections and never answers, so every request to it hangs.
      silent = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      silent.listen((_) {});
    });

    tearDown(() async {
      await live.close(force: true);
      await silent.close(force: true);
    });

    test('reaches a live address behind more dead ones than the request '
        'slots hold', () async {
      final service = PlexTvService(
        deviceInfo: const DeviceInfo(
          id: 'device',
          name: 'Test',
          appName: 'Moonfin',
          appVersion: '1.0.0',
        ),
      );
      final liveUri = 'http://127.0.0.1:${live.port}';
      final picked = await service.findReachableUri([
        for (var i = 0; i < 10; i++) 'http://127.0.0.1:${silent.port}/dead$i',
        liveUri,
      ], 'machine');
      expect(picked, liveUri);
    });
  });

  group('plex.tv refusals', () {
    DioException refused(int code) {
      final request = RequestOptions(path: '/api/v2/users/signin');
      return DioException(
        requestOptions: request,
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: request,
          statusCode: 401,
          data: {
            'errors': [
              {'code': code, 'message': 'refused', 'status': 401},
            ],
          },
        ),
      );
    }

    test("asks for the code only when plex.tv says it's missing", () {
      expect(plexNeedsVerificationCode(refused(1029)), isTrue);
      expect(plexNeedsVerificationCode(refused(1001)), isFalse);
      expect(plexNeedsVerificationCode(StateError('offline')), isFalse);
    });

    test('a Plex Home switch is a wrong PIN only when plex.tv says so', () {
      expect(plexWrongPin(refused(1041)), isTrue);
      expect(plexWrongPin(refused(1029)), isFalse);
      expect(plexWrongPin(StateError('offline')), isFalse);
    });
  });

  group('plexAddressCandidates', () {
    test('tries Plex port first over http when only a host is typed', () {
      expect(plexAddressCandidates('192.168.50.45'), [
        'http://192.168.50.45:32400',
        'http://192.168.50.45',
      ]);
    });

    test('keeps a typed port and scheme', () {
      expect(plexAddressCandidates('192.168.50.45:32400'), [
        'http://192.168.50.45:32400',
      ]);
      expect(plexAddressCandidates('https://plex.example.com/'), [
        'https://plex.example.com:32400',
        'https://plex.example.com',
      ]);
    });

    test('has nothing to try without a host', () {
      expect(plexAddressCandidates('http://'), isEmpty);
    });
  });
}
