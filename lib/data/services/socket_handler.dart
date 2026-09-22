import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:server_core/server_core.dart';

import 'log_service.dart';
import 'websocket_message_parser.dart';

abstract class ServerWebSocketClient {
  Stream<ServerWebSocketMessage> get messages;

  /// Fires every time the socket opens, the first time and on each reconnect.
  Stream<void> get connections;
  Future<void> connect();
  Future<void> disconnect();

  /// Reconnects straight away instead of waiting out the backoff, for when
  /// the app or the network comes back.
  void retryNow();
  void dispose();

  factory ServerWebSocketClient.forServer(MediaServerClient client) {
    return switch (client.serverType) {
      ServerType.jellyfin => JellyfinWebSocketClient(client),
      ServerType.emby => EmbyWebSocketClient(client),
    };
  }
}

/// The reconnect, keep alive and logging machinery both server types share.
/// Only the handshake and what counts as a keep alive differ between them.
abstract class _ReconnectingWebSocketClient implements ServerWebSocketClient {
  _ReconnectingWebSocketClient(
    this.client,
    this.label, {
    Duration? connectTimeout,
  }) : _connectTimeout = connectTimeout ?? _defaultConnectTimeout;

  /// A connect attempt has no timeout of its own, and a server can accept the
  /// connection and then never answer the upgrade. An attempt left waiting on
  /// that holds the connecting flag, which blocks every later attempt and
  /// every immediate retry until the app restarts.
  static const _defaultConnectTimeout = Duration(seconds: 15);

  static const _closeTimeout = Duration(seconds: 5);

  final Duration _connectTimeout;

  final MediaServerClient client;

  /// Names the server type in the log, since a report only shows the text.
  final String label;

  final _logger = Logger();

  WebSocketChannel? channel;
  StreamSubscription? _subscription;
  Timer? keepAliveTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempt = 0;
  bool _disposed = false;
  bool _connecting = false;

  final _messageController =
      StreamController<ServerWebSocketMessage>.broadcast();
  final _connectionController = StreamController<void>.broadcast();

  @override
  Stream<ServerWebSocketMessage> get messages => _messageController.stream;

  @override
  Stream<void> get connections => _connectionController.stream;

  /// The url to open, or null when the client has nothing to connect with.
  Uri? buildUri();

  /// What to do with each frame the server sends.
  void handleMessage(dynamic data);

  /// Called once the socket is open, for the types that start their keep alive
  /// straight away rather than waiting to be told an interval.
  void onConnected() {}

  @override
  Future<void> connect() async {
    if (_connecting) return;
    _connecting = true;
    try {
      await disconnect();
      if (_disposed) return;

      final uri = buildUri();
      if (uri == null) return;

      final socket = WebSocketChannel.connect(uri);
      channel = socket;
      await socket.ready.timeout(_connectTimeout);
      _reconnectAttempt = 0;
      onConnected();
      logLifecycle('$label WebSocket connected');
      _connectionController.add(null);

      _subscription = socket.stream.listen(
        handleMessage,
        onError: (error) {
          logFailure('$label WebSocket error, reconnecting', error);
          _dropAndReconnect();
        },
        onDone: () {
          logLifecycle('$label WebSocket closed, reconnecting');
          _dropAndReconnect();
        },
      );
    } catch (e) {
      logFailure('$label WebSocket connection failed, retrying', e);
      _dropAndReconnect();
    } finally {
      _connecting = false;
    }
  }

  /// Clearing the channel is what lets an immediate retry through, since a
  /// stale one left in place reads as a live connection.
  void _dropAndReconnect() {
    keepAliveTimer?.cancel();
    keepAliveTimer = null;
    final stale = channel;
    channel = null;
    unawaited(_closeQuietly(stale));
    scheduleReconnect();
  }

  /// Closes without letting the close itself hang, which it can when the
  /// other end never answered.
  Future<void> _closeQuietly(WebSocketChannel? socket) async {
    if (socket == null) return;
    try {
      await socket.sink.close().timeout(_closeTimeout);
    } catch (_) {}
  }

  /// Keeps trying for as long as the session lasts. A server can be down far
  /// longer than any fixed run of attempts, and giving up leaves the client
  /// unreachable until it is signed in again.
  void scheduleReconnect() {
    if (_disposed) return;

    final baseDelay = min(30000, 1000 * (1 << min(_reconnectAttempt, 5)));
    final jitter = Random().nextInt(baseDelay ~/ 2 + 1);
    _reconnectAttempt++;

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(
      Duration(milliseconds: baseDelay + jitter),
      () => connect(),
    );
  }

  @override
  void retryNow() {
    if (_disposed || _connecting || channel != null) return;
    _reconnectAttempt = 0;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    unawaited(connect());
  }

  void logLifecycle(String message) {
    _logger.i(message);
    _record(message, LogLevel.info);
  }

  /// Without this a report shows the socket closing and then nothing at all,
  /// whether the retries are running or not.
  void logFailure(String message, Object error) {
    _logger.e(message, error: error);
    _record(message, LogLevel.warning, error);
  }

  void _record(String message, LogLevel level, [Object? error]) {
    if (!GetIt.instance.isRegistered<LogService>()) return;
    GetIt.instance<LogService>().network(message, level: level, error: error);
  }

  void warn(String message, Object error) =>
      _logger.w(message, error: error);

  void emit(ServerWebSocketMessage message) => _messageController.add(message);

  void sendKeepAlive() => channel?.sink.add('{"MessageType":"KeepAlive"}');

  @override
  Future<void> disconnect() async {
    keepAliveTimer?.cancel();
    keepAliveTimer = null;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    // Cleared before the waiting below, so a teardown that drags leaves the
    // client looking disconnected rather than half connected.
    final subscription = _subscription;
    final open = channel;
    _subscription = null;
    channel = null;

    try {
      await subscription?.cancel().timeout(_closeTimeout);
    } catch (_) {}
    await _closeQuietly(open);
  }

  @override
  void dispose() {
    _disposed = true;
    disconnect();
    _messageController.close();
    _connectionController.close();
  }
}

class JellyfinWebSocketClient extends _ReconnectingWebSocketClient {
  JellyfinWebSocketClient(MediaServerClient client, {Duration? connectTimeout})
    : super(client, 'Jellyfin', connectTimeout: connectTimeout);

  static const _keepAliveIntervalSeconds = 30;

  @override
  Uri? buildUri() {
    final wsUrl = client.baseUrl.replaceFirst('http', 'ws');
    final token = client.accessToken ?? '';
    return Uri.parse('$wsUrl/socket?ApiKey=$token');
  }

  @override
  void onConnected() {
    keepAliveTimer?.cancel();
    keepAliveTimer = Timer.periodic(
      const Duration(seconds: _keepAliveIntervalSeconds),
      (_) => sendKeepAlive(),
    );
  }

  @override
  void handleMessage(dynamic data) {
    try {
      final msg = WebSocketMessageParser.parse(data.toString());
      if (msg != null) emit(msg);
    } catch (e) {
      warn('Jellyfin WebSocket message could not be parsed', e);
    }
  }
}

class EmbyWebSocketClient extends _ReconnectingWebSocketClient {
  EmbyWebSocketClient(MediaServerClient client, {Duration? connectTimeout})
    : super(client, 'Emby', connectTimeout: connectTimeout);

  @override
  Uri? buildUri() {
    final token = client.accessToken;
    if (token == null) return null;
    final wsUrl = client.baseUrl.replaceFirst('http', 'ws');
    final deviceId = Uri.encodeComponent(client.deviceInfo.id);
    return Uri.parse('$wsUrl/embywebsocket?api_key=$token&deviceId=$deviceId');
  }

  @override
  void handleMessage(dynamic data) {
    try {
      final json = jsonDecode(data.toString()) as Map<String, dynamic>;
      final messageType = json['MessageType'] as String?;

      // Emby names the interval it wants rather than taking a fixed one.
      if (messageType == 'ForceKeepAlive') {
        final intervalSeconds = (json['Data'] as num?)?.toInt() ?? 60;
        keepAliveTimer?.cancel();
        keepAliveTimer = Timer.periodic(
          Duration(seconds: intervalSeconds ~/ 2),
          (_) => sendKeepAlive(),
        );
        return;
      }

      final msg = WebSocketMessageParser.parseJson(json);
      if (msg != null) emit(msg);
    } catch (e) {
      warn('Emby WebSocket message could not be parsed', e);
    }
  }
}

class SocketHandler {
  /// How a client is built for a server. Overridden in tests, where there is
  /// no server to open a socket against.
  final ServerWebSocketClient Function(MediaServerClient) _clientFactory;

  SocketHandler({
    ServerWebSocketClient Function(MediaServerClient)? clientFactory,
  }) : _clientFactory = clientFactory ?? ServerWebSocketClient.forServer;

  ServerWebSocketClient? _wsClient;
  final _eventController =
      StreamController<ServerWebSocketMessage>.broadcast();
  final _connectionController = StreamController<void>.broadcast();
  StreamSubscription? _forwardSub;
  StreamSubscription? _connectionSub;

  Stream<ServerWebSocketMessage> get events => _eventController.stream;

  Stream<void> get connections => _connectionController.stream;

  void connectTo(MediaServerClient client) {
    disconnect();
    _wsClient = _clientFactory(client);
    _forwardSub = _wsClient!.messages.listen(_eventController.add);
    _connectionSub = _wsClient!.connections.listen(_connectionController.add);
    _wsClient!.connect();
  }

  void retryNow() => _wsClient?.retryNow();

  void disconnect() {
    _forwardSub?.cancel();
    _forwardSub = null;
    _connectionSub?.cancel();
    _connectionSub = null;
    _wsClient?.dispose();
    _wsClient = null;
  }

  void dispose() {
    disconnect();
    _eventController.close();
    _connectionController.close();
  }
}
