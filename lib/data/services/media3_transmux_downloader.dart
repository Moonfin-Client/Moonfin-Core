import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'log_service.dart';

/// What the native side reports when a transmux finishes.
class TransmuxResult {
  /// Media3's per-track verdicts: 1 means the track was re-encoded on
  /// device, 2 means the samples passed straight through.
  static const conversionTranscoded = 1;

  final int videoConversionProcess;
  final int audioConversionProcess;

  const TransmuxResult({
    required this.videoConversionProcess,
    required this.audioConversionProcess,
  });

  bool get wasReEncoded =>
      videoConversionProcess == conversionTranscoded ||
      audioConversionProcess == conversionTranscoded;
}

/// The transmux engine can't take this download, so use another engine.
class TransmuxUnavailableException implements Exception {
  final String reason;
  const TransmuxUnavailableException(this.reason);

  @override
  String toString() => 'TransmuxUnavailableException: $reason';
}

/// The transmux started and then failed. The partial file is already gone.
class TransmuxFailedException implements Exception {
  final String message;
  final int errorCode;
  const TransmuxFailedException(this.message, this.errorCode);

  @override
  String toString() => 'TransmuxFailedException($errorCode): $message';
}

/// The download was cancelled. The partial file is already gone.
class TransmuxCancelledException implements Exception {
  const TransmuxCancelledException();
}

/// Runs a transcoded download through the native Media3 Transformer, which
/// rewrites the server's fragmented stream into a seekable MP4 as it lands.
class Media3TransmuxDownloader {
  Media3TransmuxDownloader._();

  static final instance = Media3TransmuxDownloader._();

  static const _control = MethodChannel('moonfin/media3_transmux');
  static const _events = EventChannel('moonfin/media3_transmux_events');

  @visibleForTesting
  static Map<String, dynamic> buildStartPayload({
    required String taskId,
    required String url,
    required Map<String, String> headers,
    required String outputPath,
    required bool allowUntrustedTls,
  }) => {
    'taskId': taskId,
    'url': url,
    'headers': headers,
    'outputPath': outputPath,
    'allowUntrustedTls': allowUntrustedTls,
  };

  StreamSubscription<dynamic>? _eventSub;
  String? _activeTaskId;
  Completer<TransmuxResult>? _completer;
  void Function(int bytesWritten)? _onBytesWritten;

  void _ensureSubscribed() {
    _eventSub ??= _events.receiveBroadcastStream().listen(
      _handleEvent,
      onError: (_) {},
    );
  }

  void _handleEvent(dynamic event) {
    if (event is! Map) return;
    if (event['taskId'] != _activeTaskId) return;
    final completer = _completer;
    switch (event['event']) {
      case 'progress':
        final bytes = (event['bytesWritten'] as num?)?.toInt();
        if (bytes != null) _onBytesWritten?.call(bytes);
      case 'complete':
        _clearActive();
        completer?.complete(
          TransmuxResult(
            videoConversionProcess:
                (event['videoConversionProcess'] as num?)?.toInt() ?? 0,
            audioConversionProcess:
                (event['audioConversionProcess'] as num?)?.toInt() ?? 0,
          ),
        );
      case 'error':
        _clearActive();
        completer?.completeError(
          TransmuxFailedException(
            event['message'] as String? ?? 'Transmux failed',
            (event['errorCode'] as num?)?.toInt() ?? 0,
          ),
        );
      case 'cancelled':
        _clearActive();
        completer?.completeError(const TransmuxCancelledException());
    }
  }

  void _clearActive() {
    _activeTaskId = null;
    _onBytesWritten = null;
    _completer = null;
  }

  /// Starts the transmux and completes when it reaches a terminal state.
  ///
  /// Throws [TransmuxUnavailableException] when the engine can't run this
  /// download at all, which the caller should answer by falling back to a
  /// plain download.
  Future<TransmuxResult> start({
    required String taskId,
    required String url,
    required Map<String, String> headers,
    required String outputPath,
    required bool allowUntrustedTls,
    required void Function(int bytesWritten) onBytesWritten,
  }) async {
    if (_activeTaskId != null) {
      throw const TransmuxUnavailableException('A transmux is already running');
    }
    _ensureSubscribed();
    final completer = Completer<TransmuxResult>();
    _completer = completer;
    _activeTaskId = taskId;
    _onBytesWritten = onBytesWritten;
    try {
      await _control.invokeMethod<void>(
        'start',
        buildStartPayload(
          taskId: taskId,
          url: url,
          headers: headers,
          outputPath: outputPath,
          allowUntrustedTls: allowUntrustedTls,
        ),
      );
    } on MissingPluginException {
      _clearActive();
      throw const TransmuxUnavailableException('Native side not available');
    } on PlatformException catch (e) {
      _clearActive();
      _log('Transmux refused to start: ${e.code} ${e.message}');
      throw TransmuxUnavailableException(e.code);
    }
    return completer.future;
  }

  Future<void> cancel(String taskId) async {
    try {
      await _control.invokeMethod<void>('cancel', {'taskId': taskId});
    } on MissingPluginException {
      // Nothing native to cancel.
    } on PlatformException {
      // The job may already be gone. The terminal event settles the future.
    }
  }

  void _log(String message) {
    if (GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().media(message, level: LogLevel.warning);
    }
  }
}
