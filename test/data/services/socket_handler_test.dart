import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:server_core/server_core.dart';

class _FakeClient implements MediaServerClient {
  @override
  String get baseUrl => 'http://server';

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
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
}
