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
        frame['_on'] = sockets.indexOf(socket);
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
    String? reason,
  }) => sockets.last.add(
    jsonEncode({
      'type': 'command',
      'command_id': id,
      'session_id': session,
      'name': name,
      'payload': ?payload,
      'reason': ?reason,
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

/// A server's client, as the lifecycle names it.
class _Server extends Fake implements MediaServerClient {
  _Server(this.name);

  final String name;
}

final _serverA = _Server('a');
final _serverB = _Server('b');

/// A client that isn't Silo's: no endpoint.
final _notSilo = _Server('jellyfin');

SiloPlaybackLifecycle _change(
  MediaServerClient client, {
  String session = 's1',
  bool playing = true,
}) => SiloPlaybackLifecycle(
  client: client,
  sessionId: session,
  installationId: 'inst',
  playing: playing,
);

final _playing = _change(_serverA);
final _ended = _change(_serverA, playing: false);

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
  late List<String> ticketServers;
  late Object? ticketError;
  late SiloPlaybackControlSocket socket;
  late bool playedHere;
  late List<String> terminated;

  SiloPlaybackControlSocket build({SiloPlaybackLifecycle? playingNow}) =>
      SiloPlaybackControlSocket(
        lifecycle: lifecycle.stream,
        playingNow: playingNow,
        endpointFor: (change) {
          final server = change.client as _Server;
          if (identical(server, _notSilo)) return null;
          return SiloControlEndpoint(
            capabilities: () async => SiloPlaybackControlCapabilities(
              available: usable,
              allowed: true,
            ),
            ticket: (sessionId, installationId) async {
              ticketsFor.add('$sessionId/$installationId');
              ticketServers.add(server.name);
              final error = ticketError;
              if (error != null) throw error;
              return _ticket(ticketsFor.length);
            },
            uri: lane.uri,
            clientVersion: '1.2.3',
          );
        },
        handle: (message) => handler(message),
        terminate: (sessionId, reason) async =>
            terminated.add('$sessionId|$reason'),
        playedHere: (_) => playedHere,
        closeGrace: const Duration(seconds: 2),
        retryDelay: (_) => const Duration(milliseconds: 20),
      );

  setUp(() async {
    lane = _FakeLane();
    await lane.start();
    lifecycle = StreamController<SiloPlaybackLifecycle>.broadcast();
    handled = [];
    handler = (message) async => handled.add(message);
    usable = true;
    ticketsFor = [];
    ticketServers = [];
    ticketError = null;
    playedHere = true;
    terminated = [];
    socket = build();
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

    expect(Map.of(lane.of('ack').single)..remove('_on'), {
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

  test('a terminate ends the session with the admin\'s reason', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('terminate', reason: 'Bandwidth');
    final result = await lane.next((f) => f['type'] == 'result');

    expect(lane.of('ack').single['status'], 'accepted');
    expect(result['status'], 'completed');
    expect(terminated, ['s1|Bandwidth']);
    expect(handled, isEmpty);
  });

  test(
    'a command for a session the player has moved on from is rejected',
    () async {
      lifecycle.add(_playing);
      await lane.next((f) => f['type'] == 'hello');
      playedHere = false;

      lane.command('pause');
      final result = await lane.next((f) => f['type'] == 'result');

      expect(result['status'], 'rejected');
      expect(result['error'], 'not_playing');
      expect(handled, isEmpty);
    },
  );

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

  test('a session on another server opens its lane on that server, '
      'and lets the first one go', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    // Played from a second server mid-session (not the signed-in one).
    lifecycle.add(_change(_serverB, session: 's2'));
    final hello = await lane.next(
      (f) => f['type'] == 'hello' && f['session_id'] == 's2',
    );
    expect(hello['_on'], 1);
    expect(ticketServers, ['a', 'b']);
    await _until(() => lane.sockets.first.closeCode != null);

    // The same session id on the other server is another session.
    lifecycle.add(_change(_serverA, session: 's2', playing: false));
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(socket.connected, isTrue);

    lane.command('pause', session: 's2');
    await lane.next((f) => f['type'] == 'result');
    expect(handled.single, isA<PlaystateMessage>());

    lifecycle.add(_change(_serverB, session: 's2', playing: false));
    await _until(() => lane.sockets.last.closeCode != null);
    expect(socket.connected, isFalse);
  });

  test('signing out of a server lets only its session\'s lane go', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    socket.forget(_serverB);
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(socket.connected, isTrue);

    socket.forget(_serverA);
    await _until(() => lane.sockets.single.closeCode != null);
    expect(socket.sessionId, isNull);
  });

  test('a session on a server that isn\'t Silo gets no lane', () async {
    lifecycle.add(_change(_notSilo));
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(ticketsFor, isEmpty);
    expect(socket.sessionId, isNull);
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

  test('a renewal opens the new connection before letting the old one go, '
      'and a command running on the old one still answers', () async {
    final release = Completer<void>();
    handler = (message) async {
      handled.add(message);
      await release.future;
    };
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');

    lane.command('pause', id: 'slow');
    await lane.next((f) => f['type'] == 'ack');
    socket.renewNow();
    await _until(() => lane.sockets.length == 2);
    await lane.next(
      (f) => f['type'] == 'hello' && lane.received.indexOf(f) > 0,
    );
    expect(lane.sockets.first.closeCode, isNull);

    release.complete();
    final result = await lane.next((f) => f['type'] == 'result');
    expect(result['command_id'], 'slow');
    expect(result['status'], 'completed');
    // Silo takes answers only from the connection holding the lane.
    expect(result['_on'], 1);
    await _until(() => lane.sockets.first.closeCode != null);
    expect(socket.connected, isTrue);
  });

  test('a socket made while a session plays opens its lane', () async {
    socket.dispose();
    socket = build(playingNow: _playing);
    await lane.next((f) => f['type'] == 'hello');

    expect(ticketsFor, ['s1/inst']);
  });

  test(
    'a lane given up on gets another try on the session\'s replan',
    () async {
      ticketError = _refused(503);
      lifecycle.add(_playing);
      await _until(
        () => ticketsFor.length == SiloPlaybackControlSocket.maxAttempts + 1,
      );
      await Future<void>.delayed(const Duration(milliseconds: 100));

      ticketError = null;
      lifecycle.add(_playing);
      await lane.next((f) => f['type'] == 'hello');
    },
  );

  test(
    'a renewal that fails tries again while the old connection holds',
    () async {
      lifecycle.add(_playing);
      await lane.next((f) => f['type'] == 'hello');
      ticketError = _refused(503);
      socket.renewNow();
      await _until(() => ticketsFor.length >= 3);
      expect(lane.sockets.single.closeCode, isNull);

      ticketError = null;
      await lane.next((f) => f['type'] == 'hello' && f['_on'] == 1);
      await _until(() => lane.sockets.first.closeCode != null);
    },
  );

  test('a renewal Silo refuses for good asks no more tickets', () async {
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');
    ticketError = _refused(410);
    socket.renewNow();
    await _until(() => ticketsFor.length == 2);

    await lane.sockets.single.close();
    await Future<void>.delayed(const Duration(milliseconds: 200));

    expect(ticketsFor, hasLength(2));
  });

  test('a connection being let go takes no new command', () async {
    final release = Completer<void>();
    handler = (message) async {
      handled.add(message);
      await release.future;
    };
    lifecycle.add(_playing);
    await lane.next((f) => f['type'] == 'hello');
    lane.command('pause', id: 'first');
    await lane.next((f) => f['type'] == 'ack');

    // The session ends; its connection stays open for the running pause.
    lifecycle.add(_ended);
    lane.sockets.single.add(
      jsonEncode({
        'type': 'command',
        'command_id': 'late',
        'session_id': 's1',
        'name': 'stop',
      }),
    );
    await Future<void>.delayed(const Duration(milliseconds: 100));
    release.complete();
    await lane.next((f) => f['type'] == 'result');

    expect(handled, hasLength(1));
    expect(lane.received.where((f) => f['command_id'] == 'late'), isEmpty);
  });

  test('a session the app\'s own player is not playing gets no lane', () async {
    playedHere = false;
    lifecycle.add(_playing);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(ticketsFor, isEmpty);
    expect(socket.sessionId, isNull);
  });

  test('a lane that keeps failing is given up on', () async {
    ticketError = _refused(503);
    lifecycle.add(_playing);
    await _until(
      () => ticketsFor.length == SiloPlaybackControlSocket.maxAttempts + 1,
    );
    await Future<void>.delayed(const Duration(milliseconds: 200));

    expect(ticketsFor, hasLength(SiloPlaybackControlSocket.maxAttempts + 1));
  });

  group('renewalDelay', () {
    final now = DateTime.utc(2026, 11, 23, 12);
    Duration delay(DateTime? expires) => SiloPlaybackControlSocket.renewalDelay(
      maxConnection: const Duration(hours: 4),
      accessExpiresAt: expires,
      now: now,
      margin: const Duration(minutes: 1),
    );

    test('the ticket\'s limit when the token lasts longer', () {
      expect(
        delay(now.add(const Duration(hours: 8))),
        const Duration(hours: 3, minutes: 59),
      );
      expect(delay(null), const Duration(hours: 3, minutes: 59));
    });

    test('before the token expires, since Silo closes the lane then', () {
      expect(
        delay(now.add(const Duration(hours: 2))),
        const Duration(hours: 1, minutes: 59),
      );
    });

    test('a token about to expire renews at the floor', () {
      expect(
        delay(now.add(const Duration(seconds: 30))),
        const Duration(seconds: 5),
      );
    });

    test('never sooner than five seconds', () {
      expect(
        SiloPlaybackControlSocket.renewalDelay(
          maxConnection: const Duration(seconds: 30),
          accessExpiresAt: null,
          now: now,
          margin: const Duration(minutes: 1),
        ),
        const Duration(seconds: 5),
      );
    });
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
