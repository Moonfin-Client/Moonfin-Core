import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/server_pin_service.dart';
import 'package:server_core/server_core.dart';

/// Answers each request with whatever the test queued, and remembers it.
class _Adapter implements HttpClientAdapter {
  final requests = <RequestOptions>[];
  final bodies = <String>[];
  int status = 200;
  Object? json;

  /// What a Moonbase ping gets, when set.
  Object? ping;
  Map<String, List<String>> headers = {};
  bool unreachable = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    if (requestStream != null) {
      bodies.add(utf8.decode(await requestStream.expand((c) => c).toList()));
    }
    if (unreachable) {
      throw DioException.connectionError(
        requestOptions: options,
        reason: 'unreachable',
      );
    }
    if (ping != null && options.uri.path == '/Moonfin/Ping') {
      return ResponseBody.fromString(
        jsonEncode(ping),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    return ResponseBody.fromString(
      json == null ? '' : jsonEncode(json),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
        ...headers,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  const account = ServerPinAccount(
    baseUrl: 'https://media.test',
    accessToken: 'token-1',
  );
  late _Adapter adapter;
  late ServerPinService service;

  setUp(() {
    adapter = _Adapter();
    final dio = Dio(BaseOptions(validateStatus: (_) => true))
      ..httpClientAdapter = adapter;
    service = ServerPinService(
      deviceInfo: const DeviceInfo(
        id: 'tv',
        name: 'TV',
        appName: 'Moonfin',
        appVersion: 'test',
      ),
      dio: dio,
    );
  });

  group('status', () {
    test('reads whether the server keeps a PIN', () async {
      adapter.json = {'enabled': true};
      expect(await service.status(account), ServerPinAvailability.enabled);
      adapter.json = {'enabled': false};
      expect(await service.status(account), ServerPinAvailability.disabled);
    });

    test('asks the plugin with the account token', () async {
      adapter.json = {'enabled': true};
      await service.status(account);

      final request = adapter.requests.single;
      expect(request.uri.toString(), 'https://media.test/Moonfin/Pin');
      expect(request.headers['Authorization'], contains('Token="token-1"'));
    });

    test('is unavailable without the plugin, a token or a server', () async {
      adapter.status = 404;
      expect(await service.status(account), ServerPinAvailability.unavailable);
      adapter.status = 401;
      expect(await service.status(account), ServerPinAvailability.unavailable);
      adapter.status = 200;
      adapter.json = {'unexpected': true};
      expect(await service.status(account), ServerPinAvailability.unavailable);
      adapter.unreachable = true;
      expect(await service.status(account), ServerPinAvailability.unavailable);
    });
  });

  group('verify', () {
    test('says right or wrong', () async {
      adapter.json = {'valid': true};
      expect(await service.verify(account, '4821'), isA<ServerPinValid>());
      adapter.json = {'valid': false};
      expect(await service.verify(account, '0000'), isA<ServerPinWrong>());
      expect(adapter.bodies.first, jsonEncode({'pin': '4821'}));
    });

    test('says when the server keeps no PIN', () async {
      adapter.status = 404;
      adapter.json = {'error': 'No PIN is set'};
      expect(await service.verify(account, '4821'), isA<ServerPinNone>());
    });

    test('a 404 from anything else is not the plugin speaking', () async {
      adapter.status = 404;
      adapter.json = {'message': 'Not Found'};
      expect(
        await service.verify(account, '4821'),
        isA<ServerPinUnavailable>(),
      );
    });

    test('reads the wait from the body, or else the header', () async {
      adapter.status = 429;
      adapter.json = {'error': 'Too many attempts', 'retryAfterSeconds': 45};
      var verdict = await service.verify(account, '0000');
      expect((verdict as ServerPinLocked).retryAfter, const Duration(seconds: 45));

      adapter.json = {'error': 'Too many attempts'};
      adapter.headers = {
        'retry-after': ['90'],
      };
      verdict = await service.verify(account, '0000');
      expect((verdict as ServerPinLocked).retryAfter, const Duration(seconds: 90));
    });

    test('an unreachable or failing server leaves it to the device', () async {
      adapter.unreachable = true;
      expect(
        await service.verify(account, '4821'),
        isA<ServerPinUnavailable>(),
      );
      adapter.unreachable = false;
      adapter.status = 500;
      expect(
        await service.verify(account, '4821'),
        isA<ServerPinUnavailable>(),
      );
    });
  });

  group('writing', () {
    test('sets a PIN, naming the current one when there is one', () async {
      adapter.json = {'enabled': true};
      expect(
        await service.setPin(account, '1111', currentPin: '4821'),
        isA<ServerPinValid>(),
      );
      expect(
        adapter.bodies.single,
        jsonEncode({'pin': '1111', 'currentPin': '4821'}),
      );

      await service.setPin(account, '2222');
      expect(adapter.bodies.last, jsonEncode({'pin': '2222'}));
    });

    test('a wrong current PIN is told apart from a failure', () async {
      adapter.status = 403;
      adapter.json = {'error': 'The current PIN is wrong'};
      expect(await service.setPin(account, '1111'), isA<ServerPinWrong>());

      adapter.json = {'error': 'Forbidden'};
      expect(
        await service.setPin(account, '1111'),
        isA<ServerPinUnavailable>(),
      );
    });

    test('removes a PIN with the current one in the body', () async {
      adapter.json = {'enabled': false};
      expect(
        await service.removePin(account, currentPin: '4821'),
        isA<ServerPinValid>(),
      );
      expect(adapter.requests.single.method, 'DELETE');
      expect(adapter.bodies.single, jsonEncode({'currentPin': '4821'}));
    });

    test('an administrator removes a PIN by user id', () async {
      adapter.json = {'enabled': false};
      expect(
        await service.removePinFor(account, 'abc'),
        isA<ServerPinValid>(),
      );
      expect(
        adapter.requests.single.uri.toString(),
        'https://media.test/Moonfin/Users/abc/Pin',
      );

      adapter.status = 403;
      expect(
        await service.removePinFor(account, 'abc'),
        isA<ServerPinUnavailable>(),
      );
    });
  });

  group('Plex', () {
    // Where Moonbase was found is kept per server, so each test has its own.
    ServerPinAccount plex(String host) => ServerPinAccount(
      baseUrl: 'http://$host:32400',
      accessToken: 'pms-token',
      plexServerId: 'plex-$host',
    );

    test('asks the Moonbase companion with the PMS token', () async {
      adapter.ping = {'installed': true};
      adapter.json = {'enabled': true};

      expect(
        await service.status(plex('192.168.50.71')),
        ServerPinAvailability.enabled,
      );

      final request = adapter.requests.last;
      expect(request.uri.toString(), 'http://192.168.50.71:32500/Moonfin/Pin');
      expect(request.headers['X-Plex-Token'], 'pms-token');
      expect(request.headers.containsKey('Authorization'), isFalse);
    });

    test('every PIN route goes to the companion', () async {
      adapter.ping = {'installed': true};
      adapter.json = {'valid': true};
      final account = plex('192.168.50.73');

      await service.verify(account, '4821');
      await service.setPin(account, '1111');
      await service.removePin(account, currentPin: '1111');
      await service.removePinFor(account, 'abc');

      expect(
        [
          for (final r in adapter.requests.skip(1))
            '${r.method} ${r.uri}',
        ],
        [
          'POST http://192.168.50.73:32500/Moonfin/Pin/Verify',
          'PUT http://192.168.50.73:32500/Moonfin/Pin',
          'DELETE http://192.168.50.73:32500/Moonfin/Pin',
          'DELETE http://192.168.50.73:32500/Moonfin/Users/abc/Pin',
        ],
      );
    });

    test('without the companion the device decides and Plex is not asked',
        () async {
      // What Plex itself answers on a path it doesn't know.
      adapter.ping = {
        'MediaContainer': {'size': 0},
      };
      final account = plex('192.168.50.72');

      expect(await service.status(account), ServerPinAvailability.unavailable);
      expect(
        await service.verify(account, '4821'),
        isA<ServerPinUnavailable>(),
      );
      expect(
        await service.setPin(account, '1111'),
        isA<ServerPinUnavailable>(),
      );
      expect(
        adapter.requests.map((r) => r.uri.toString()),
        ['http://192.168.50.72:32500/Moonfin/Ping'],
        reason: 'a companion known to be missing is not asked again',
      );
    });
  });
}
