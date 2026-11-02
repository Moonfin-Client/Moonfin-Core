import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:server_core/server_core.dart';

class _FakeClient implements MediaServerClient {
  _FakeClient({this.baseUrl = 'http://server'});

  @override
  final String baseUrl;

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  String? get accessToken => 'token';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Answers `getItems` with an episode that has a season and show above it.
class _FakeItems implements ItemsApi {
  final asked = <List<String>>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName != #getItems) {
      return super.noSuchMethod(invocation);
    }
    final ids = invocation.namedArguments[#ids] as List<String>? ?? const [];
    asked.add(ids);
    return Future.value(<String, dynamic>{
      'Items': [
        for (final id in ids)
          {
            'Id': id,
            if (id == '18799') ...{'SeasonId': '18798', 'SeriesId': '18797'},
            'UserData': {'Played': id == '18799'},
          },
      ],
    });
  }
}

class _FakePlexClient extends _FakeClient {
  _FakePlexClient(String baseUrl) : super(baseUrl: baseUrl);

  @override
  final _FakeItems itemsApi = _FakeItems();

  @override
  ServerType get serverType => ServerType.plex;

  @override
  String? get userId => 'user';
}

class _FakeSocket implements ServerWebSocketClient {
  final _messages = StreamController<ServerWebSocketMessage>.broadcast();
  final _connections = StreamController<void>.broadcast();

  int connectCalls = 0;
  int retryCalls = 0;
  bool disposed = false;

  @override
  Stream<ServerWebSocketMessage> get messages => _messages.stream;

  @override
  Stream<void> get connections => _connections.stream;

  @override
  Future<void> connect() async => connectCalls++;

  @override
  Future<void> disconnect() async {}

  @override
  void retryNow() => retryCalls++;

  final sent = <(String, Object?)>[];

  @override
  void send(String messageType, [Object? data]) =>
      sent.add((messageType, data));

  @override
  void dispose() {
    disposed = true;
    _messages.close();
    _connections.close();
  }

  void announceConnected() => _connections.add(null);
}

void main() {
  late _FakeSocket socket;
  late SocketHandler handler;

  setUp(() {
    socket = _FakeSocket();
    handler = SocketHandler(clientFactory: (_) => socket);
  });

  test('connecting opens the socket', () {
    handler.connectTo(_FakeClient());
    expect(socket.connectCalls, 1);
  });

  test('every open reaches the listeners, not just the first', () async {
    var opens = 0;
    handler.connectTo(_FakeClient());
    handler.connections.listen((_) => opens++);

    socket.announceConnected();
    socket.announceConnected();
    await Future<void>.delayed(Duration.zero);

    expect(opens, 2);
  });

  test('an immediate retry reaches the socket', () {
    handler.connectTo(_FakeClient());
    handler.retryNow();
    expect(socket.retryCalls, 1);
  });

  test('a retry with no socket does nothing rather than throwing', () {
    expect(handler.retryNow, returnsNormally);
  });

  test('disconnecting drops the socket and stops forwarding', () async {
    var opens = 0;
    handler.connectTo(_FakeClient());
    handler.connections.listen((_) => opens++);
    handler.disconnect();

    expect(socket.disposed, isTrue);
    await Future<void>.delayed(Duration.zero);
    expect(opens, 0);
  });

  test('a feed starts once and stops when its last holder lets go', () {
    handler.connectTo(_FakeClient());
    handler.subscribe('Sessions');
    handler.subscribe('Sessions');
    handler.unsubscribe('Sessions');
    expect(socket.sent, [('SessionsStart', '0,1000')]);

    handler.unsubscribe('Sessions');
    expect(socket.sent.last, ('SessionsStop', null));
  });

  test('held feeds are asked for again on every reconnect', () async {
    handler.connectTo(_FakeClient());
    handler.subscribe('ScheduledTasksInfo');
    socket.sent.clear();

    socket.announceConnected();
    await Future<void>.delayed(Duration.zero);

    expect(socket.sent, [('ScheduledTasksInfoStart', '0,1000')]);
  });

  test('a feed taken before connecting is sent once the socket opens', () async {
    handler.subscribe('Sessions');
    handler.connectTo(_FakeClient());
    socket.announceConnected();
    await Future<void>.delayed(Duration.zero);

    expect(socket.sent, [('SessionsStart', '0,1000')]);
  });

  test('a message sent while the socket is still opening is dropped', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    final received = <String>[];
    server.listen((request) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      final socket = await WebSocketTransformer.upgrade(request);
      socket.listen((frame) =>
          received.add((jsonDecode('$frame') as Map)['MessageType'] as String));
    });
    final client = JellyfinWebSocketClient(
      _FakeClient(baseUrl: 'http://127.0.0.1:${server.port}'),
    );
    addTearDown(client.dispose);

    final opened = client.connect();
    await Future<void>.delayed(const Duration(milliseconds: 50));
    client.send('SessionsStart', '0,1000');
    await opened;
    client.send('ScheduledTasksInfoStart', '0,1000');
    await Future<void>.delayed(const Duration(milliseconds: 200));

    expect(received, ['ScheduledTasksInfoStart']);
  });

  test('a Plex pause or stop anywhere refreshes that item and its parents', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    Uri? opened;
    String playing(String state) => jsonEncode({
      'NotificationContainer': {
        'type': 'playing',
        'PlaySessionStateNotification': [
          {'sessionKey': '5', 'ratingKey': '18799', 'state': state},
        ],
      },
    });
    server.listen((request) async {
      opened = request.uri;
      final socket = await WebSocketTransformer.upgrade(request);
      for (final state in ['playing', 'paused', 'paused', 'stopped']) {
        socket.add(playing(state));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
    });
    final plex = _FakePlexClient('http://127.0.0.1:${server.port}');
    final client = PlexWebSocketClient(plex);
    addTearDown(client.dispose);
    final changes = <UserDataChangedMessage>[];
    client.messages.listen((m) => changes.add(m as UserDataChangedMessage));

    await client.connect();
    await Future<void>.delayed(const Duration(milliseconds: 400));

    expect(opened?.path, '/:/websockets/notifications');
    expect(opened?.queryParameters['filters'], 'playing');
    expect(opened?.queryParameters['X-Plex-Token'], 'token');
    expect(changes, hasLength(2), reason: 'a repeated pause asks only once');
    expect(changes.first.userId, 'user');
    expect(changes.first.itemIds, ['18799', '18798', '18797']);
    expect(
      changes.first.userDataList.first,
      allOf(containsPair('Played', true), containsPair('PlayedPercentage', null)),
    );
    expect(plex.itemsApi.asked.first, ['18799']);
  });

  group('a server that accepts and never answers', () {
    late ServerSocket server;
    late List<Socket> accepted;

    setUp(() async {
      accepted = [];
      server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      server.listen(accepted.add);
    });

    tearDown(() async {
      for (final socket in accepted) {
        socket.destroy();
      }
      await server.close();
    });

    JellyfinWebSocketClient buildClient() {
      final client = JellyfinWebSocketClient(
        _FakeClient(baseUrl: 'http://127.0.0.1:${server.port}'),
        connectTimeout: const Duration(milliseconds: 100),
      );
      addTearDown(client.dispose);
      return client;
    }

    test('a stalled attempt is given up on and another follows', () async {
      unawaited(buildClient().connect());
      await Future<void>.delayed(const Duration(seconds: 2));

      expect(
        accepted.length,
        greaterThan(1),
        reason:
            'one attempt that never answered used to stop the client for '
            'the life of the process',
      );
    });

    test('an immediate retry lands once a stalled attempt gave up', () async {
      final client = buildClient();
      unawaited(client.connect());
      await Future<void>.delayed(const Duration(milliseconds: 400));
      final beforeRetry = accepted.length;

      client.retryNow();
      await Future<void>.delayed(const Duration(milliseconds: 300));

      expect(
        accepted.length,
        greaterThan(beforeRetry),
        reason: 'a stale channel left behind reads as a live connection',
      );
    });
  });
}
