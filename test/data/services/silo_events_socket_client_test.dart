import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// Silo's events endpoints on the loopback: the capability, the ticket and
/// the socket, recording what the client sent.
class _FakeSilo {
  late HttpServer _server;

  Map<String, dynamic> capabilities = {
    'state': 'available',
    'allowed': true,
    'declared_channels': true,
    'channels': ['catalog', 'user_state'],
  };
  int maxConnectionSeconds = 300;
  String requiredAction = 'none';

  /// Holds the ticket's answer until completed.
  Completer<void>? ticketGate;

  /// A problem code to refuse tickets with (403).
  String? ticketRefusal;

  int capabilityReads = 0;
  final ticketAuthorizations = <String?>[];
  final offeredProtocols = <List<String>>[];
  final socketQueries = <String>[];
  final sockets = <WebSocket>[];
  final received = <String>[];

  int get tickets => ticketAuthorizations.length;

  /// Catalog item details by content id, for the read-back of a change.
  final items = <String, Map<String, dynamic>>{};
  int itemReads = 0;

  /// Sends [frame] on the newest connection.
  void push(Map<String, Object?> frame) => sockets.last.add(jsonEncode(frame));

  String get baseUrl => 'http://127.0.0.1:${_server.port}';

  Future<void> start() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _server.listen(_handle);
  }

  Future<void> close() async {
    for (final socket in sockets) {
      await socket.close();
    }
    await _server.close(force: true);
  }

  Future<void> _handle(HttpRequest request) async {
    switch (request.uri.path) {
      case '/api/v2/events/capabilities':
        capabilityReads++;
        _json(request, capabilities);
      case '/api/v2/events/ws-ticket':
        ticketAuthorizations.add(
          request.headers.value(HttpHeaders.authorizationHeader),
        );
        final number = tickets;
        await ticketGate?.future;
        if (ticketRefusal case final code?) {
          request.response
            ..statusCode = HttpStatus.forbidden
            ..headers.contentType = ContentType('application', 'problem+json')
            ..write(
              jsonEncode({
                'type': 'https://siloserver.org/docs/api/v2/problems/$code',
                'title': code,
                'status': 403,
              }),
            );
          await request.response.close();
          return;
        }
        _json(request, {
          'ticket': 'ticket$number',
          'expires_in': 30,
          'max_connection_seconds': maxConnectionSeconds,
          'protocol': 'silo.events.v2',
        });
      case '/api/v2/events/ws':
        offeredProtocols.add([
          for (final value
              in request.headers['sec-websocket-protocol'] ?? const <String>[])
            for (final protocol in value.split(',')) protocol.trim(),
        ]);
        socketQueries.add(request.uri.query);
        final socket = await WebSocketTransformer.upgrade(
          request,
          protocolSelector: (_) => 'silo.events.v2',
        );
        sockets.add(socket);
        socket.add(
          jsonEncode({
            'type': 'hello',
            'schema_version': 1,
            'connection_id': 'c${sockets.length}',
            'available_channels': ['catalog', 'user_state'],
            'required_action': requiredAction,
          }),
        );
        socket.listen((frame) => received.add('$frame'));
      case final path when path.startsWith('/api/v2/catalog/items/'):
        itemReads++;
        final item = items[path.substring('/api/v2/catalog/items/'.length)];
        if (item != null) {
          _json(request, item);
          return;
        }
        request.response.statusCode = HttpStatus.notFound;
        await request.response.close();
      default:
        request.response.statusCode = HttpStatus.notFound;
        await request.response.close();
    }
  }

  void _json(HttpRequest request, Map<String, dynamic> body) {
    request.response
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(body));
    unawaited(request.response.close());
  }
}

Future<void> _until(
  bool Function() done, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (!done() && DateTime.now().isBefore(deadline)) {
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
}

void main() {
  late _FakeSilo silo;
  late SiloMediaServerClient client;

  setUp(() async {
    silo = _FakeSilo();
    await silo.start();
    client =
        SiloMediaServerClient(
            baseUrl: silo.baseUrl,
            deviceInfo: const DeviceInfo(
              id: 'device',
              name: 'Device',
              appName: 'Moonfin',
              appVersion: '1.0.0',
            ),
          )
          ..session.setTokens(
            SiloTokens(
              accessToken: 'access',
              refreshToken: 'refresh',
              expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
              lifetime: const Duration(hours: 1),
            ),
          )
          ..profileId = 'profile';
  });

  tearDown(() => silo.close());

  SiloEventsSocketClient socketFor({
    Duration renewMargin = const Duration(seconds: 15),
  }) {
    final socket = SiloEventsSocketClient(client, renewMargin: renewMargin);
    addTearDown(socket.dispose);
    return socket;
  }

  test('a Silo server gets the events socket', () {
    final socket = ServerWebSocketClient.forServer(client);
    addTearDown(socket.dispose);
    expect(socket, isA<SiloEventsSocketClient>());
  });

  test(
    'connects with a ticket in the subprotocols, never in the URL',
    () async {
      final socket = socketFor();
      var connections = 0;
      final sub = socket.connections.listen((_) => connections++);
      addTearDown(sub.cancel);

      await socket.connect();
      await _until(() => connections == 1);

      expect(silo.ticketAuthorizations, ['Bearer access']);
      expect(silo.offeredProtocols.single, [
        'silo.events.v2',
        'silo.ticket.ticket1',
      ]);
      expect(silo.socketQueries.single, 'channels=user_state,catalog');
      expect(connections, 1);
    },
  );

  test(
    "renews the connection before Silo's limit, with a fresh ticket",
    () async {
      silo.maxConnectionSeconds = 2;
      // Due one second in (the shortest the client waits).
      final socket = socketFor(renewMargin: const Duration(milliseconds: 1500));
      var connections = 0;
      final sub = socket.connections.listen((_) => connections++);
      addTearDown(sub.cancel);

      await socket.connect();
      await _until(() => silo.sockets.length == 2);

      expect(silo.tickets, 2);
      expect(silo.offeredProtocols.last.last, 'silo.ticket.ticket2');
      await _until(() => silo.sockets.first.closeCode != null);
      expect(silo.sockets.first.closeCode, isNotNull);
      expect(connections, 2);
      // The capability is read once per client, not per connection.
      expect(silo.capabilityReads, 1);
    },
  );

  group('snapshots', () {
    final snapshot = {
      'type': 'snapshot',
      'channel': 'catalog',
      'timestamp': '2026-10-20T12:00:00Z',
      'data': null,
    };

    setUp(() {
      silo.items['movie-1'] = {
        'content_id': 'movie-1',
        'type': 'movie',
        'title': 'A film',
        'versions': <Object>[],
      };
    });

    test('after a renewal on schedule, what was read is kept', () async {
      silo.maxConnectionSeconds = 2;
      final socket = socketFor(renewMargin: const Duration(milliseconds: 1500));

      await socket.connect();
      await _until(() => silo.sockets.length == 1);
      await client.itemsApi.getItem('movie-1');
      await _until(() => silo.sockets.length == 2);
      silo.push(snapshot);
      await Future<void>.delayed(const Duration(milliseconds: 600));
      await client.itemsApi.getItem('movie-1');

      expect(silo.itemReads, 1);
      expect(silo.tickets, 2, reason: 'the renewal fetched its ticket once');
    });

    test('after a dropped connection, it is read again', () async {
      final socket = socketFor();

      await socket.connect();
      await _until(() => silo.sockets.length == 1);
      await client.itemsApi.getItem('movie-1');
      await silo.sockets.first.close(1000, 'gone');
      await _until(() => silo.sockets.length == 2);
      silo.push(snapshot);
      await Future<void>.delayed(const Duration(milliseconds: 600));
      await client.itemsApi.getItem('movie-1');

      expect(silo.itemReads, 2);
    });
  });

  test('a connection Silo closes comes back with a fresh ticket', () async {
    final socket = socketFor();
    await socket.connect();
    await _until(() => silo.sockets.length == 1);

    await silo.sockets.first.close(1000, 'lifetime');
    await _until(() => silo.sockets.length == 2);

    expect(silo.tickets, 2);
    expect(silo.offeredProtocols.last.last, 'silo.ticket.ticket2');
  });

  test('a server with the socket off gets no ticket and no connection, '
      'until it turns it on', () async {
    silo.capabilities = {
      'state': 'not_configured',
      'allowed': false,
      'declared_channels': false,
      'channels': <String>[],
    };
    final socket = socketFor();

    await socket.connect();
    await Future<void>.delayed(const Duration(milliseconds: 300));
    expect(silo.tickets, 0);
    expect(silo.sockets, isEmpty);

    silo.capabilities = {
      'state': 'available',
      'allowed': true,
      'declared_channels': true,
      'channels': ['catalog', 'user_state'],
    };
    socket.retryNow();
    await _until(() => silo.sockets.length == 1);
    expect(silo.capabilityReads, 2);
    expect(silo.sockets, hasLength(1));
  });

  test('a subscribe frame goes out when Silo still asks for one', () async {
    silo.requiredAction = 'subscribe';
    final socket = socketFor();

    await socket.connect();
    await _until(() => silo.received.isNotEmpty);

    expect(jsonDecode(silo.received.single), {
      'type': 'subscribe',
      'channels': ['user_state', 'catalog'],
    });
  });

  test('a disconnect while the ticket is on its way opens nothing', () async {
    silo.ticketGate = Completer<void>();
    final socket = socketFor();
    var connections = 0;
    final sub = socket.connections.listen((_) => connections++);
    addTearDown(sub.cancel);

    final connecting = socket.connect();
    await _until(() => silo.tickets == 1);
    await socket.disconnect();
    silo.ticketGate!.complete();
    await connecting;
    await Future<void>.delayed(const Duration(milliseconds: 300));

    expect(silo.sockets, isEmpty);
    expect(connections, 0);
  });

  test('a change on the web comes out as UserDataChanged with what Silo '
      'now holds', () async {
    client.userId = 'profile';
    silo.items['movie-1'] = {
      'content_id': 'movie-1',
      'type': 'movie',
      'title': 'A film',
      'user_state': {'played': true, 'is_favorite': false},
      'versions': <Object>[],
    };
    final socket = socketFor();
    final messages = <ServerWebSocketMessage>[];
    final sub = socket.messages.listen(messages.add);
    addTearDown(sub.cancel);

    await socket.connect();
    await _until(() => silo.sockets.length == 1);
    for (final profile in ['other-profile', 'profile']) {
      silo.push({
        'type': 'event',
        'channel': 'user_state',
        'event': 'user_state.changed',
        'event_id': 'e-$profile',
        'timestamp': '2026-10-18T12:00:00Z',
        'data': {
          'profile_id': profile,
          'content_id': 'movie-1',
          'change': 'watched',
          'played': true,
        },
      });
    }
    silo.push({
      'type': 'event',
      'channel': 'catalog',
      'event': 'catalog.item.changed',
      'event_id': 'c1',
      'timestamp': '2026-10-18T12:00:00Z',
      'data': {'library_id': 1, 'content_id': 'movie-2', 'change': 'x'},
    });
    await _until(() => messages.length == 2);

    final userData = messages.whereType<UserDataChangedMessage>().single;
    expect(userData.userId, 'profile');
    expect(userData.userDataList.single['ItemId'], 'movie-1');
    expect(userData.userDataList.single['Played'], isTrue);
    expect(userData.userDataList.single['PlaybackPositionTicks'], 0);
    expect(messages.whereType<LibraryChangedMessage>().single.itemsUpdated, [
      'movie-2',
    ]);
  });

  test('an access change reaches the app and reconnects at once', () async {
    final socket = socketFor();
    final messages = <ServerWebSocketMessage>[];
    final sub = socket.messages.listen(messages.add);
    addTearDown(sub.cancel);

    await socket.connect();
    await _until(() => silo.sockets.length == 1);
    silo.push({'type': 'access_changed'});
    final closed = DateTime.now();
    await silo.sockets.first.close(4001, 'access_changed');
    await _until(() => silo.sockets.length == 2);

    // The shared backoff waits at least a second, and this doesn't.
    expect(
      DateTime.now().difference(closed),
      lessThan(const Duration(milliseconds: 900)),
    );
    expect(silo.tickets, 2);
    expect(
      messages.whereType<ServerEventMessage>().single.type,
      siloAccessChangedEvent,
    );
  });

  test('the close code alone is enough', () async {
    final socket = socketFor();
    final messages = <ServerWebSocketMessage>[];
    final sub = socket.messages.listen(messages.add);
    addTearDown(sub.cancel);

    await socket.connect();
    await _until(() => silo.sockets.length == 1);
    await silo.sockets.first.close(4001, 'access_changed');
    await _until(() => messages.isNotEmpty);

    expect(
      (messages.single as ServerEventMessage).type,
      siloAccessChangedEvent,
    );
  });

  test('an ordinary close is not an access change', () async {
    final socket = socketFor();
    final messages = <ServerWebSocketMessage>[];
    final sub = socket.messages.listen(messages.add);
    addTearDown(sub.cancel);

    await socket.connect();
    await _until(() => silo.sockets.length == 1);
    await silo.sockets.first.close(1000, 'lifetime');
    await _until(() => silo.sockets.length == 2);

    expect(messages, isEmpty);
  });

  test('a profile that needs its PIN again stops the socket', () async {
    silo.ticketRefusal = 'profile_verification_required';
    final socket = socketFor();

    await socket.connect();
    await Future<void>.delayed(const Duration(milliseconds: 2500));

    expect(silo.tickets, 1, reason: 'no retries on the backoff');
    expect(silo.sockets, isEmpty);
  });

  test('another refused ticket is retried', () async {
    silo.ticketRefusal = 'permission_denied';
    final socket = socketFor();

    await socket.connect();
    await _until(() => silo.tickets == 2);

    expect(silo.tickets, 2);
  });

  test('no login, no connection', () async {
    client.session.clear();
    final socket = socketFor();

    await socket.connect();
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(silo.capabilityReads, 0);
    expect(silo.sockets, isEmpty);
  });

  test('this client\'s own finished playback comes out as UserDataChanged, '
      'connected or not (fix 13.3a)', () async {
    client.userId = 'profile';
    silo.items['episode-1'] = {
      'content_id': 'episode-1',
      'type': 'episode',
      'title': 'Pilot',
      'user_state': {'played': true, 'is_favorite': false},
      'versions': <Object>[],
    };
    final socket = socketFor();
    final messages = <ServerWebSocketMessage>[];
    final sub = socket.messages.listen(messages.add);
    addTearDown(sub.cancel);

    // Silo says nothing on its socket when a session stops.
    client.notePlaybackEnded('episode-1');
    await _until(() => messages.isNotEmpty);

    final userData = messages.whereType<UserDataChangedMessage>().single;
    expect(userData.userId, 'profile');
    expect(userData.userDataList.single['ItemId'], 'episode-1');
    expect(userData.userDataList.single['Played'], isTrue);
    expect(silo.sockets, isEmpty);
  });

  test('a disposed socket passes on nothing more', () async {
    final socket = SiloEventsSocketClient(client);
    final messages = <ServerWebSocketMessage>[];
    socket.messages.listen(messages.add);
    socket.dispose();

    client.notePlaybackEnded('episode-1');
    await Future<void>.delayed(const Duration(milliseconds: 500));

    expect(messages, isEmpty);
  });
}
