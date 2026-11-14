import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

Future<void> _downloadIsolateMain(Map<String, Object?> args) async {
  final sendPort = args['sendPort'] as SendPort;
  final url = args['url'] as String;
  final savePath = args['savePath'] as String;
  final headers = (args['headers'] as Map).cast<String, String>();
  final allowSelfSigned = args['allowSelfSigned'] == true;
  final clientCertificate =
      args['clientCertificate'] as ClientCertificateMaterial?;

  final cancelPort = ReceivePort();
  sendPort.send(<String, Object?>{'t': 'r', 'cp': cancelPort.sendPort});

  var cancelled = false;
  cancelPort.listen((_) => cancelled = true);

  HttpClient? client;
  RandomAccessFile? raf;
  try {
    client = HttpClient();
    // The isolate gets its own globals, so the preference has to travel with
    // the arguments rather than being read here. The download URL is the
    // server's own, so its host is the one the setting reaches.
    final serverHost = Uri.parse(url).host;
    client.badCertificateCallback =
        (_, host, _) => allowSelfSigned && host == serverHost;
    client.idleTimeout = const Duration(seconds: 120);
    if (clientCertificate != null) {
      // The connection factory reads these, and they start out empty in a new
      // isolate.
      gAllowSelfSignedCertificates = allowSelfSigned;
      gIsOwnServerHost = (host) => host == serverHost;
      setClientCertificates([clientCertificate]);
      applyClientCertificates(client);
    }

    final request = await client.getUrl(Uri.parse(url));
    headers.forEach(
      (k, v) => request.headers.set(k, v, preserveHeaderCase: true),
    );
    request.headers.set('accept-encoding', 'identity');

    final response = await request.close();
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300) {
      await response.drain<void>().catchError((_) {});
      client.close();
      cancelPort.close();
      sendPort.send(<String, Object?>{'t': 'e', 'sc': statusCode});
      return;
    }

    final contentLength = response.contentLength;
    final contentType = response.headers.value('content-type') ?? '';
    sendPort.send(<String, Object?>{
      't': 'h',
      'sc': statusCode,
      'cl': contentLength,
      'ct': contentType,
    });

    raf = await File(savePath).open(mode: FileMode.write);
    var received = 0;
    const flushAt = 32 * 1024 * 1024;
    final buf = BytesBuilder(copy: false);
    var lastPct = -1;
    var lastReportedBytes = 0;
    const bytesReportInterval = 1024 * 1024; // 1 MB for chunked streams

    await for (final chunk in response) {
      if (cancelled) break;
      buf.add(chunk);
      received += chunk.length;
      if (buf.length >= flushAt) await raf.writeFrom(buf.takeBytes());

      if (contentLength > 0) {
        final pct = received * 100 ~/ contentLength;
        if (pct != lastPct) {
          lastPct = pct;
          sendPort.send(<String, Object?>{
            't': 'p',
            'r': received,
            'l': contentLength,
          });
        }
      } else if (received - lastReportedBytes >= bytesReportInterval) {
        lastReportedBytes = received;
        sendPort.send(<String, Object?>{
          't': 'p',
          'r': received,
          'l': contentLength,
        });
      }
    }

    if (buf.length > 0) await raf.writeFrom(buf.takeBytes());
    await raf.close();
    raf = null;
    client.close();
    client = null;
    cancelPort.close();
    sendPort.send(<String, Object?>{'t': cancelled ? 'c' : 'd', 'r': received});
  } catch (e) {
    await raf?.close().catchError((_) {});
    client?.close(force: true);
    cancelPort.close();
    sendPort.send(<String, Object?>{'t': 'e', 'msg': e.toString()});
  }
}

/// The original in-process media download engine: a dedicated Dart Isolate
/// driving `dart:io` HttpClient with buffered file writes.
///
/// Media downloads normally run through the native background_downloader
/// plugin. This engine is the fallback for servers whose TLS certificate the
/// native engine rejects, which it can accept when the user has allowed self
/// signed certificates, and for tasks the native queue never starts.
class LegacyDownloadEngine {
  /// Cancel reason used when the hang guard force-finalizes a download whose
  /// HTTP connection stayed open after all expected bytes arrived.
  static const String guardCancelReason = 'download_guard_timeout';

  /// Downloads [url] to [savePath] using a dedicated Dart Isolate.
  Future<Response> _bufferedDownloadToFile(
    String url,
    String savePath, {
    required Options options,
    required CancelToken cancelToken,
    required void Function(int, int) onReceiveProgress,
    ClientCertificateMaterial? clientCertificate,
  }) async {
    final fromIsolate = ReceivePort();

    await Isolate.spawn<Map<String, Object?>>(_downloadIsolateMain, {
      'sendPort': fromIsolate.sendPort,
      'url': url,
      'savePath': savePath,
      'headers': Map<String, String>.from(
        (options.headers ?? <String, dynamic>{}).map(
          (k, v) => MapEntry(k.toString(), v?.toString() ?? ''),
        ),
      ),
      'allowSelfSigned': gAllowSelfSignedCertificates,
      'clientCertificate': clientCertificate,
    });

    SendPort? toIsolate;
    var responseStatus = 200;
    var responseContentLength = -1;
    var responseContentType = '';
    final done = Completer<void>();

    cancelToken.whenCancel.then((_) => toIsolate?.send(null)).ignore();

    fromIsolate.listen((dynamic raw) {
      if (done.isCompleted) return;
      final msg = raw as Map<String, Object?>;
      switch (msg['t'] as String) {
        case 'r':
          toIsolate = msg['cp'] as SendPort;
          if (cancelToken.isCancelled) toIsolate!.send(null);
          break;
        case 'h':
          responseStatus = msg['sc'] as int;
          responseContentLength = msg['cl'] as int;
          responseContentType = msg['ct'] as String? ?? '';
          break;
        case 'p':
          onReceiveProgress(msg['r'] as int, msg['l'] as int);
          break;
        case 'd':
          fromIsolate.close();
          done.complete();
          break;
        case 'c':
          fromIsolate.close();
          done.completeError(
            cancelToken.cancelError ??
                DioException(
                  type: DioExceptionType.cancel,
                  requestOptions: RequestOptions(path: url),
                ),
          );
          break;
        case 'e':
          fromIsolate.close();
          final sc = msg['sc'] as int?;
          done.completeError(
            DioException(
              type: sc != null
                  ? DioExceptionType.badResponse
                  : DioExceptionType.unknown,
              requestOptions: RequestOptions(path: url),
              message: msg['msg'] as String?,
              response: sc != null
                  ? Response(
                      requestOptions: RequestOptions(path: url),
                      statusCode: sc,
                    )
                  : null,
            ),
          );
          break;
      }
    });

    await done.future;

    final responseHeaders = Headers();
    if (responseContentLength >= 0) {
      responseHeaders.set('content-length', responseContentLength.toString());
    }
    if (responseContentType.isNotEmpty) {
      responseHeaders.set('content-type', responseContentType);
    }
    return Response(
      requestOptions: RequestOptions(path: url, method: 'GET'),
      statusCode: responseStatus,
      headers: responseHeaders,
    );
  }

  /// Wraps [_bufferedDownloadToFile] so that once all expected bytes have been
  /// received the future resolves after a short grace period, even if the HTTP
  /// connection hangs open (common behind reverse proxies / keep-alive).
  Future<Response> downloadWithHangGuard(
    String url,
    String savePath, {
    required Options options,
    required CancelToken cancelToken,
    required int estimatedSize,
    required void Function(int, int) onReceiveProgress,
    ClientCertificateMaterial? clientCertificate,
  }) async {
    final bytesComplete = Completer<void>();
    Timer? estimatedCompletionTimer;
    Timer? stallTimer;
    var lastReceived = 0;
    var lastTotal = -1;
    void markBytesCompleteIfPending() {
      if (!bytesComplete.isCompleted) {
        bytesComplete.complete();
      }
    }

    void armEstimatedCompletionTimer() {
      estimatedCompletionTimer?.cancel();
      estimatedCompletionTimer = Timer(
        const Duration(seconds: 5),
        markBytesCompleteIfPending,
      );
    }

    void armStallTimer() {
      stallTimer?.cancel();
      final socketTimeout = const Duration(seconds: 45);
      stallTimer = Timer(socketTimeout, () {
        if (lastReceived > 0 && !bytesComplete.isCompleted) {
          markBytesCompleteIfPending();
        }
      });
    }

    final downloadFuture = _bufferedDownloadToFile(
      url,
      savePath,
      options: options,
      cancelToken: cancelToken,
      clientCertificate: clientCertificate,
      onReceiveProgress: (received, total) {
        lastReceived = received;
        lastTotal = total;
        onReceiveProgress(received, total);
        if (total > 0 && received >= total && !bytesComplete.isCompleted) {
          markBytesCompleteIfPending();
          return;
        }

        if (total <= 0 && estimatedSize > 0 && received >= estimatedSize) {
          armEstimatedCompletionTimer();
        } else {
          estimatedCompletionTimer?.cancel();
        }

        if (total <= 0 && received > 0) {
          armStallTimer();
        }
      },
    );

    final completion = Completer<Response>();

    void completeIfPending(Response value) {
      if (!completion.isCompleted) {
        completion.complete(value);
      }
    }

    void completeErrorIfPending(Object error, [StackTrace? stackTrace]) {
      if (!completion.isCompleted) {
        completion.completeError(error, stackTrace);
      }
    }

    downloadFuture.then(completeIfPending).catchError(completeErrorIfPending);

    bytesComplete.future.then((_) async {
      if (completion.isCompleted) {
        return;
      }

      try {
        final graceTimeout = const Duration(seconds: 120);
        final settled = await downloadFuture.timeout(graceTimeout);
        completeIfPending(settled);
      } on TimeoutException {
        cancelToken.cancel(guardCancelReason);
        final headers = Headers.fromMap({
          if (lastTotal > 0) 'content-length': [lastTotal.toString()],
        });
        completeIfPending(
          Response(
            requestOptions: RequestOptions(
              path: url,
              method: options.method ?? 'GET',
              headers: options.headers,
            ),
            statusCode: 200,
            headers: headers,
            data: null,
            extra: {'guardFinalized': true, 'bytesReceived': lastReceived},
          ),
        );
      } catch (e, st) {
        completeErrorIfPending(e, st);
      }
    }).ignore();

    try {
      return await completion.future;
    } finally {
      estimatedCompletionTimer?.cancel();
      stallTimer?.cancel();
    }
  }
}
