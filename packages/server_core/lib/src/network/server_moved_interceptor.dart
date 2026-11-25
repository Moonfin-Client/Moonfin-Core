// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// A server added through a stable name that redirects to a dynamic
// `host:port` stops answering when the target moves. This interceptor sends
// a request that couldn't reach it once more to the address
// [ServerMoved.resolver] finds. Hooked into [configureServerDio] by one line.
import 'dart:io';

import 'package:dio/dio.dart';

import '../diagnostics/server_log_sink.dart';
import 'server_moved.dart';

const _followedKey = 'moonfin.followedMove';
const _serverKey = 'moonfin.requestServer';

/// Sends a request that couldn't reach its server once more to the address
/// [ServerMoved.resolver] finds for it.
///
/// A server behind a redirect to a dynamic `host:port` stops answering on the
/// old port the moment the target moves, and every request in flight fails
/// to connect. Asking where it went right then lets the app switch over
/// without a restart or waiting for its reachability check. A request that
/// failed to connect never reached the server, so any method may go again;
/// one whose connection broke later only when it is a read.
///
/// Dio also files a connection that closed before the response headers under
/// [DioExceptionType.connectionError], but that one already sent its body, so
/// only the [SocketException] the adapter raises while opening the connection
/// (or a connect timeout) proves a write never arrived.
Interceptor followMovedServer(Dio dio) => InterceptorsWrapper(
  onRequest: (options, handler) {
    final serverAt = ServerMoved.serverAt;
    if (serverAt != null && !options.extra.containsKey(_serverKey)) {
      options.extra[_serverKey] = serverAt(options.baseUrl);
    }
    final canMove = ServerMoved.canMove;
    final timeout = options.connectTimeout;
    if (canMove != null &&
        (timeout == null || timeout > ServerMoved.connectTimeout) &&
        canMove(options.baseUrl)) {
      options.connectTimeout = ServerMoved.connectTimeout;
    }
    handler.next(options);
  },
  onError: (e, handler) async {
    final options = e.requestOptions;
    final resolver = ServerMoved.resolver;
    final method = options.method.toUpperCase();
    final isRead = method == 'GET' || method == 'HEAD';
    final neverConnected =
        e.type == DioExceptionType.connectionTimeout ||
        (e.type == DioExceptionType.connectionError &&
            e.error is SocketException);
    final droppedRead =
        isRead &&
        (e.type == DioExceptionType.connectionError ||
            (e.type == DioExceptionType.unknown && e.error is SocketException));
    final from = options.baseUrl;
    if (resolver == null ||
        !(neverConnected || droppedRead) ||
        options.extra[_followedKey] == true ||
        from.isEmpty) {
      handler.next(e);
      return;
    }

    String? moved;
    try {
      moved = await resolver(
        from,
        serverId: options.extra[_serverKey] as String?,
      );
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

    // Dio finalized a multipart body before it tried to connect, and one
    // can only be finalized once.
    final data = options.data;
    if (data is FormData) options.data = data.clone();

    try {
      handler.resolve(await dio.fetch(options));
    } on DioException catch (failure) {
      handler.reject(failure);
    }
  },
);
