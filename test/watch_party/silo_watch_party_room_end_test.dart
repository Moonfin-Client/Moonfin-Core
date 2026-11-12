import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

const _room = {
  'room_id': 'r1',
  'phase': 'lobby',
  'playback_state': 'idle',
  'selection_mode': 'host_pick',
  'selection_revision': 1,
  'code': 'L2NVBPNE',
  'guest_control_policy': 'host_only',
  'is_paused': true,
  'anchor_position_seconds': 0.0,
  'generation': 1,
  'member_count': 1,
  'host_connected': true,
  'self_role': 'host',
  'self_can_control_transport': true,
  'self_can_manage_room': true,
  'members': [
    {
      'user_id': 2,
      'profile_id': 'p1',
      'display_name': 'Host',
      'is_host': true,
      'is_self': true,
      'connected': true,
    },
  ],
};

ResponseBody _json(Object body, [int status = 200]) => ResponseBody.fromString(
  jsonEncode(body),
  status,
  headers: {
    Headers.contentTypeHeader: ['application/json'],
  },
);

/// Silo's room routes.
class _Silo implements HttpClientAdapter {
  int ticketStatus = 200;
  int closeStatus = 204;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return switch ((options.method, options.uri.path)) {
      ('POST', '/api/v2/watch-together/rooms') => _json({
        'room': _room,
        'room_access_token': 'proof',
      }, 201),
      ('POST', '/api/v2/watch-together/rooms/r1/ws-ticket') =>
        ticketStatus == 200
            ? _json({'ticket': 't', 'protocol': 'silo.room.v2'})
            : _json({'code': 'refused'}, ticketStatus),
      ('DELETE', '/api/v2/watch-together/rooms/r1') => ResponseBody.fromString(
        '',
        closeStatus,
      ),
      _ => _json({'code': 'not_found'}, 404),
    };
  }

  @override
  void close({bool force = false}) {}
}

/// Moonbase for Silo, which records the rooms it's asked to drop.
class _Moonbase implements HttpClientAdapter {
  final List<String> drops = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    if (path == '/api/v2/settings/plugins') {
      return _json({
        'items': [
          {'id': 'mb', 'plugin_id': 'moonfin.moonbase'},
        ],
      });
    }
    if (options.method == 'DELETE') {
      drops.add(path);
      return ResponseBody.fromString('', 204);
    }
    return _json({'code': 'not_found'}, 404);
  }

  @override
  void close({bool force = false}) {}
}

class _Player extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();
  @override
  PlaybackBringupState bringupState = const PlaybackBringupState.idle();
  @override
  StreamResolutionResult? get currentResolution => null;
  @override
  void setTransportInterceptor(
    Future<bool> Function(TransportAction action, {Duration? position})?
    interceptor,
  ) {}
}

Future<void> _until(bool Function() done) async {
  final deadline = DateTime.now().add(const Duration(seconds: 5));
  while (!done()) {
    if (DateTime.now().isAfter(deadline)) fail('timed out');
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
}

void main() {
  const dropped = '/api/v2/plugin-content/plugins/mb/Moonfin/WatchParty/r1';
  late HttpServer server;
  late List<WebSocket> sockets;
  late _Silo silo;
  late _Moonbase moonbase;
  late SiloWatchPartyManager manager;

  setUp(() async {
    sockets = [];
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      sockets.add(
        await WebSocketTransformer.upgrade(
          request,
          protocolSelector: (_) => SiloWatchPartyApi.socketProtocol,
        ),
      );
    });
    silo = _Silo();
    final client =
        SiloMediaServerClient(
            baseUrl: 'http://127.0.0.1:${server.port}',
            deviceInfo: _device,
            platform: 'macOS',
            httpClientAdapter: silo,
          )
          ..session.setTokens(
            SiloTokens(
              accessToken: 'access',
              refreshToken: 'refresh',
              expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
              lifetime: const Duration(hours: 1),
            ),
          )
          ..profileId = 'p1';
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    moonbase = _Moonbase();
    manager = SiloWatchPartyManager(
      _Player(),
      dio: Dio()..httpClientAdapter = moonbase,
    );
    expect(await manager.create(), isTrue);
    await _until(() => manager.connected);
  });

  tearDown(() async {
    manager.dispose();
    for (final socket in sockets) {
      await socket.close();
    }
    await server.close(force: true);
    await GetIt.instance.reset();
  });

  test('a room Silo closes is dropped from Moonbase', () async {
    sockets.last.add(jsonEncode({'type': 'room_closed'}));
    await _until(() => moonbase.drops.isNotEmpty);
    expect(manager.inRoom, isFalse);
    expect(moonbase.drops, [dropped]);
  });

  test('ending the room drops it once Silo has closed it', () async {
    await manager.end();
    await _until(() => moonbase.drops.isNotEmpty);
    expect(manager.inRoom, isFalse);
    expect(moonbase.drops, [dropped]);
  });

  test('a close Silo refused leaves the stored room alone', () async {
    silo.closeStatus = 500;
    await manager.end();
    await Future<void>.delayed(const Duration(milliseconds: 200));
    expect(manager.inRoom, isFalse);
    expect(moonbase.drops, isEmpty);
  });

  for (final status in [403, 409]) {
    test(
      'a reconnect refused with $status leaves the stored room alone',
      () async {
        silo.ticketStatus = status;
        await sockets.last.close();
        await _until(() => !manager.inRoom);
        await Future<void>.delayed(const Duration(milliseconds: 200));
        expect(moonbase.drops, isEmpty);
      },
    );
  }

  test('a reconnect that finds no room drops it', () async {
    silo.ticketStatus = 404;
    await sockets.last.close();
    await _until(() => moonbase.drops.isNotEmpty);
    expect(manager.inRoom, isFalse);
    expect(moonbase.drops, [dropped]);
  });
}
