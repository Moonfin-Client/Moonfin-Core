import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../diagnostics/server_log_sink.dart';
import 'insecure_certificates.dart';
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

void configureServerDio(Dio dio, {Duration? idleTimeout}) {
  dio.transformer = FusedTransformer(contentLengthIsolateThreshold: 50 * 1024);

  dio.httpClientAdapter = _SlotLimitedAdapter(
    IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();

        client.userAgent = serverUserAgent;

        client.badCertificateCallback = (_, _, _) =>
            gAllowSelfSignedCertificates;

        client.idleTimeout = idleTimeout ?? _idleTimeout;

        // Deliberately above the slot count. A slot frees as soon as the
        // headers land but dart:io keeps the connection until the body has
        // drained, so matching the two sends the overflow into a queue inside
        // dart:io that nothing times out and Dio bills to its connect timeout.
        client.maxConnectionsPerHost = _requestSlots * 2;

        return client;
      },
    ),
    _requestSlots,
  );

  dio.interceptors.add(_retryDeadConnection(dio));
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
