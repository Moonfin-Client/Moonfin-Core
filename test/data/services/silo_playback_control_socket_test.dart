import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/silo_playback_control_socket.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// Silo's control socket on the loopback, recording what the client sent.
class _FakeLane {
  late HttpServer _server;
  final sockets = <WebSocket>[];
  final offeredProtocols = <List<String>>[];
  final paths = <String>[];
  final received = <Map<String, dynamic>>[];
  final _frames = StreamController<Map<String, dynamic>>.broadcast();

  Uri uri(String sessionId) => Uri.parse(
    'ws://127.0.0.1:${_server.port}/api/v2/playback/sessions/$sessionId/control/ws',
  );

  Future<void> start() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _server.listen((request) async {
      paths.add(request.uri.path);
      final socket = await WebSocketTransformer.upgrade(
        request,
        protocolSelector: (protocols) {
          offeredProtocols.add(protocols);
          return SiloPlaybackControlApi.protocol;
        },
      );
      sockets.add(socket);
      socket.listen((data) {
        final frame = jsonDecode(data as String) as Map<String, dynamic>;
        received.add(frame);
        _frames.add(frame);
      });
    });
  }

  /// Sends a command frame on the newest connection.
  void command(
    String name, {
    String id = 'c1',
    String session = 's1',
    Map<String, Object?>? payload,
  }) => sockets.last.add(
    jsonEncode({
      'type': 'command',
      'command_id': id,
      'session_id': session,
      'name': name,
      'payload': ?payload,
    }),
  );

  Future<Map<String, dynamic>> next(bool Function(Map<String, dynamic>) test) {
    for (final frame in received) {
      if (test(frame)) return Future.value(frame);
    }
    return _frames.stream.firstWhere(test).timeout(const Duration(seconds: 5));
  }

  Iterable<Map<String, dynamic>> of(String type) =>
      received.where((frame) => frame['type'] == type);

  Future<void> close() async {
    for (final socket in sockets) {
      await socket.close();
    }
    await _server.close(force: true);
    await _frames.close();
  }
}

SiloEventsTicket _ticket(int n) => SiloEventsTicket.fromJson({
  'ticket': 'ticket$n',
  'expires_in': 30,
  'max_connection_seconds': 14400,
  'protocol': SiloPlaybackControlApi.protocol,
});

DioException _refused(int status) => DioException(
  requestOptions: RequestOptions(path: '/'),
  response: Response(
    requestOptions: RequestOptions(path: '/'),
    statusCode: status,
  ),
);

const _playing = SiloPlaybackLifecycle(
  sessionId: 's1',
  installationId: 'inst',
  playing: true,
);
const _ended = SiloPlaybackLifecycle(
  sessionId: 's1',
  installationId: 'inst',
  playing: false,
);

Future<void> _until(bool Function() done) async {
  final deadline = DateTime.now().add(const Duration(seconds: 5));
  while (!done()) {
    if (DateTime.now().isAfter(deadline)) fail('timed out');
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
}

void main() {
  late _FakeLane lane;
  late StreamController<SiloPlaybackLifecycle> lifecycle;
  late List<ServerWebSocketMessage> handled;
  late Future<void> Function(ServerWebSocketMessage) handler;
  late bool usable;
  late List<String> ticketsFor;
  late Object? ticketError;
  late SiloPlaybackControlSocket socket;

  setUp(() async {
    lane = _FakeLane();
    await lane.start();
    lifecycle = StreamController<SiloPlaybackLifecycle>.broadcast();
    handled = [];
    handler = (message) async => handled.add(message);
    usable = true;
    ticketsFor = [];
    ticketError = null;
    socket = SiloPlaybackControlSocket(
      lifecycle: lifecycle.stream,
      capabilities: () async =>
          SiloPlaybackControlCapabilities(available: usable, allowed: true),
      ticket: (sessionId, installationId) async {
        ticketsFor.add('$sessionId/$installationId');
        final error = ticketError;
        if (error != null) throw error;
        return _ticket(ticketsFor.length);
      },
      uri: lane.uri,
      handle: (message) => handler(message),
      clientVersion: '1.2.3',
      closeGrace: const Duration(seconds: 2),
      retryDelay: (_) => const Duration(milliseconds: 20),
    );
  });

  tearDown(() async {
    socket.dispose();
    await lifecycle.close();
    await lane.close();
  });

  test(
    'a playing session opens its lane with a ticket and says hello',
    () async {
      lifecycle.add(_playing);
      final hello = await lane.next((f) => f['type'] == 'hello');

      expect(ticketsFor, ['s1/inst']);
      expect(lane.paths.single, '/api/v2/playback/sessions/s1/control/ws');
      expect(lane.offeredProtocols.single, [
        SiloPlaybackControlApi.protocol,
        'silo.ticket.ticket1',
      ]);
      expect(hello['session_id'], 's1');
      expect(hello['client'], {'name': 'Moonfin', 'version': '1.2.3'});
      expect(
        (hello['capabilities'] as Map)['commands'],
        containsAll(['display_message', 'pause', 'unpause', 'stop']),
      );
    },
  );

  test('a message is acknowledged, shown and completed', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command(
      'display_message',
      payload: {'title': 'Heads up', 'message': 'Restarting at 9'},
    );
    final result = await lane.next((f) => f['type'] == 'result');

    expect(lane.of('ack').single, {
      'type': 'ack',
      'command_id': 'c1',
      'session_id': 's1',
      'status': 'accepted',
    });
    expect(result['status'], 'completed');
    final message = handled.single as GeneralCommandMessage;
    expect(message.name, 'DisplayMessage');
    expect(message.arguments, {
      'Text': 'Restarting at 9',
      'Header': 'Heads up',
    });
  });

  test('pause and resume reach the player as Playstate commands', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('pause', id: 'p');
    await lane.next((f) => f['type'] == 'result' && f['command_id'] == 'p');
    lane.command('unpause', id: 'u');
    await lane.next((f) => f['type'] == 'result' && f['command_id'] == 'u');

    expect(handled.map((m) => (m as PlaystateMessage).command), [
      'Pause',
      'Unpause',
    ]);
  });

  test(
    'a command Moonfin does not run is rejected without being run',
    () async {
      lifecycle.add(_playing);
      await lane.next((f) => f['type'] == 'hello');

      lane.command('seek', payload: {'position': 10});
      final result = await lane.next((f) => f['type'] == 'result');

      expect(result['status'], 'rejected');
      expect(lane.of('ack'), isEmpty);
      expect(handled, isEmpty);
    },
  );

  test('a command for another session is ignored', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('pause', session: 'other');
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(handled, isEmpty);
    expect(lane.of('ack'), isEmpty);
  });

  test('a command that fails is rejected', () async {
    handler = (_) async => throw StateError('no player');
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('pause');
    final result = await lane.next((f) => f['type'] == 'result');

    expect(result['status'], 'rejected');
  });

  test('a stop that ends the session still sends its result', () async {
    handler = (message) async {
      handled.add(message);
      // The player's stop ends the Silo session before the handler returns.
      lifecycle.add(_ended);
      await Future<void>.delayed(const Duration(milliseconds: 50));
    };
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('stop');
    final result = await lane.next((f) => f['type'] == 'result');

    expect(result['status'], 'completed');
    expect((handled.single as PlaystateMessage).command, 'Stop');
    await _until(() => !socket.connected && socket.sessionId == null);
  });

  test('an ended session closes the lane; a replan keeps it', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lifecycle.add(_playing);
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(ticketsFor, hasLength(1));

    lifecycle.add(_ended);
    await _until(() => lane.sockets.single.closeCode != null);
    expect(socket.connected, isFalse);
  });

  test('a server without the lane gets no ticket', () async {
    usable = false;
    lifecycle.add(_playing);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(ticketsFor, isEmpty);
    expect(lane.sockets, isEmpty);
  });

  test('a session Silo has ended is not asked about again', () async {
    ticketError = _refused(410);
    lifecycle.add(_playing);
    await Future<void>.delayed(const Duration(milliseconds: 200));

    expect(ticketsFor, hasLength(1));
    expect(lane.sockets, isEmpty);
  });

  test('a session the server is still rebuilding is tried again', () async {
    ticketError = _refused(503);
    lifecycle.add(_playing);
    await _until(() => ticketsFor.length >= 2);

    ticketError = null;
    await lane.next((f) => f['type'] == 'hello');
  });

  test('a dropped connection comes back with a fresh ticket', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    await lane.sockets.single.close();
    await _until(() => lane.sockets.length == 2);

    expect(lane.offeredProtocols.last.last, 'silo.ticket.ticket2');
  });

  group('commandMessage', () {
    test('a restart notice is shown like a message', () {
      final message = SiloPlaybackControlSocket.commandMessage(
        'server_restarting',
        {'title': 'Server restarting', 'message': 'Back in a minute'},
      ) as GeneralCommandMessage;
      expect(message.arguments, {
        'Text': 'Back in a minute',
        'Header': 'Server restarting',
      });
    });

    test('an untitled message has no header', () {
      final message = SiloPlaybackControlSocket.commandMessage(
        'display_message',
        {'message': 'Hello'},
      ) as GeneralCommandMessage;
      expect(message.arguments, {'Text': 'Hello'});
    });

    test('a notice with only a title shows the title', () {
      final message = SiloPlaybackControlSocket.commandMessage(
        'server_shutting_down',
        {'title': 'Shutting down'},
      ) as GeneralCommandMessage;
      expect(message.arguments, {'Text': 'Shutting down'});
    });

    test('an empty message is not run', () {
      expect(
        SiloPlaybackControlSocket.commandMessage('display_message', {}),
        isNull,
      );
    });
  });
}
