import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../diagnostics/server_log_sink.dart';
import 'client_certificates.dart';
import 'insecure_certificates.dart';
import 'server_moved.dart';
import 'server_user_agent.dart';

/// How many requests may be reaching the server at once.
///
/// dart:io speaks HTTP/1.1 with no ALPN, so every request in flight is its own
/// TCP and TLS handshake, where a browser multiplexes a whole screen over one
/// HTTP/2 connection. Six is what a browser allows itself per host without
/// multiplexing, and it keeps a screen from opening a burst that a reverse
/// proxy reads as a flood.
const _requestSlots = 6;

/// How long a connection may sit unused before the pool drops it.
///
/// dart:io hands out a pooled connection without checking it is still open, so
/// the longer one is held the better the odds the peer let go of it in the
/// meantime. Anything on screen keeps the pool warm inside this, and playback
/// reports progress every five seconds.
const _idleTimeout = Duration(seconds: 15);

/// [limitRequests] off is for requests that each go to a different host, like
/// probing a server's addresses, where the slots only queue them up.
void configureServerDio(
  Dio dio, {
  Duration? idleTimeout,
  bool limitRequests = true,
}) {
  dio.transformer = FusedTransformer(contentLengthIsolateThreshold: 50 * 1024);

  final adapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();

      client.userAgent = serverUserAgent;

      client.badCertificateCallback =
          (_, host, _) => acceptsUntrustedCertificate(host);

      // The app's HttpOverrides already do this, and replacing their
      // connection factory would undo any other override.
      if (HttpOverrides.current == null) applyClientCertificates(client);

      client.idleTimeout = idleTimeout ?? _idleTimeout;

      // Deliberately above the slot count. A slot frees as soon as the
      // headers land but dart:io keeps the connection until the body has
      // drained, so matching the two sends the overflow into a queue inside
      // dart:io that nothing times out and Dio bills to its connect timeout.
      client.maxConnectionsPerHost = _requestSlots * 2;

      return client;
    },
  );
  dio.httpClientAdapter = limitRequests
      ? _SlotLimitedAdapter(adapter, _requestSlots)
      : adapter;

  dio.interceptors.add(_retryDeadConnection(dio));
  dio.interceptors.add(_followMovedServer(dio));
}

const _retriedKey = 'moonfin.connectionRetry';

/// Asks again on a fresh connection when a pooled one died before answering.
///
/// dart:io reuses an idle connection without checking it is still alive, so a
/// socket the peer let go of is written to and only fails once TCP gives up,
/// which on a phone is around eighteen seconds. The failure takes that
/// connection out of the pool, so one more try is all it takes and a second
/// failure is a different problem.
Interceptor _retryDeadConnection(Dio dio) => InterceptorsWrapper(
  onError: (e, handler) async {
    final options = e.requestOptions;
    // A half received response surfaces as a parse failure rather than a
    // socket error, which is what keeps work the server already did out of
    // the retry.
    final connectionDied =
        e.type == DioExceptionType.unknown &&
        (e.error is HttpException || e.error is SocketException);

    // Only a read can go out a second time without changing anything.
    if (!connectionDied ||
        options.extra[_retriedKey] == true ||
        options.method.toUpperCase() != 'GET') {
      handler.next(e);
      return;
    }

    options.extra[_retriedKey] = true;
    ServerLog.network(
      'Connection died before answering, asking again: '
      '${options.method} ${options.uri}',
      level: ServerLogLevel.warning,
      error: e.error,
    );

    try {
      handler.resolve(await dio.fetch(options));
    } on DioException catch (retryFailure) {
      // The second attempt ran the whole chain, so it reported itself.
      handler.reject(retryFailure);
    }
  },
);

const _followedKey = 'moonfin.followedMove';

/// Sends a request that couldn't reach its server once more to the address
/// [ServerMoved.resolver] finds for it.
///
/// A server behind a redirect to a dynamic `host:port` stops answering on the
/// old port the moment the target moves, and every request in flight fails
/// to connect. Asking where it went right then lets the app switch over
/// without a restart or waiting for its reachability check. A request that
/// failed to connect never reached the server, so any method may go again;
/// one whose connection broke later only when it is a read.
Interceptor _followMovedServer(Dio dio) => InterceptorsWrapper(
  onError: (e, handler) async {
    final options = e.requestOptions;
    final resolver = ServerMoved.resolver;
    final notConnected =
        e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout;
    final droppedRead =
        e.type == DioExceptionType.unknown &&
        e.error is SocketException &&
        options.method.toUpperCase() == 'GET';
    final from = options.baseUrl;
    if (resolver == null ||
        !(notConnected || droppedRead) ||
        options.extra[_followedKey] == true ||
        from.isEmpty) {
      handler.next(e);
      return;
    }

    String? moved;
    try {
      moved = await resolver(from);
    } catch (_) {}
    if (moved == null || moved == from) {
      handler.next(e);
      return;
    }

    options.extra[_followedKey] = true;
    options.baseUrl = moved;
    if (options.path.startsWith(from)) {
      options.path = moved + options.path.substring(from.length);
    }
    ServerLog.network(
      'Server moved, asking its new address: ${options.method} ${options.uri}',
      level: ServerLogLevel.warning,
    );

    try {
      handler.resolve(await dio.fetch(options));
    } on DioException catch (failure) {
      handler.reject(failure);
    }
  },
);

/// Holds a request back until one of a fixed number of slots is free.
///
/// Dio starts its connect timeout only once the request is handed on, so the
/// wait sits outside it and a busy screen queues without any of it reading as
/// the host failing to answer. A slot covers the connect and the wait for the
/// headers. The body drains after that, bounded by the client's per host limit.
class _SlotLimitedAdapter implements HttpClientAdapter {
  _SlotLimitedAdapter(this._inner, this._free);

  final HttpClientAdapter _inner;
  int _free;
  final _waiting = Queue<Completer<void>>();

  Future<void> _acquire() {
    if (_free > 0) {
      _free--;
      return Future.value();
    }
    final waiter = Completer<void>();
    _waiting.add(waiter);
    return waiter.future;
  }

  void _release() {
    if (_waiting.isNotEmpty) {
      _waiting.removeFirst().complete();
    } else {
      _free++;
    }
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    await _acquire();
    try {
      return await _inner.fetch(options, requestStream, cancelFuture);
    } finally {
      _release();
    }
  }

  @override
  void close({bool force = false}) => _inner.close(force: force);
}
