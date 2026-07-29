import 'dart:async';

import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';

import '../../util/platform_detection.dart';

/// App-lifetime owner of the background_downloader [FileDownloader] singleton.
///
/// [FileDownloader] is a process singleton whose updates listener must be
/// registered exactly once, before `start()`, or events delivered while the
/// app was suspended are lost. DownloadService, by contrast, is torn down and
/// re-created on every server switch, so it can't own that lifecycle itself.
/// This coordinator initializes the plugin once and routes task events to
/// whichever DownloadService is currently attached, buffering events that
/// arrive while none is (e.g. downloads finishing during app startup before
/// a server becomes active).
class BackgroundDownloadCoordinator {
  /// Group for media file downloads. Side assets (posters, subtitles) are
  /// downloaded with dio and never reach the plugin.
  static const String mediaGroup = 'moonfinMedia';

  static bool get isSupported =>
      !kIsWeb && !PlatformDetection.isTizen && !PlatformDetection.isAppleTV;

  Future<void>? _initFuture;

  void Function(TaskStatusUpdate update)? _statusHandler;
  void Function(TaskProgressUpdate update)? _progressHandler;
  final List<TaskUpdate> _buffered = [];

  /// Initializes and starts the plugin. Safe to call multiple times because
  /// only the first call does work. No-op on platforms the plugin doesn't
  /// support.
  Future<void> ensureInitialized() {
    if (!isSupported) return Future.value();
    return _initFuture ??= _initialize();
  }

  Future<void> _initialize() async {
    await FileDownloader().configure(
      globalConfig: [
        // Bounds native concurrency and caps retry storms. DownloadService
        // serializes media downloads anyway.
        (Config.holdingQueue, (3, null, null)),
      ],
      androidConfig: [
        // Long downloads (notably server transcodes, which can't pause and
        // resume) must escape WorkManager's 9-minute background work limit.
        (Config.runInForeground, Config.always),
        (Config.useCacheDir, Config.whenAble),
      ],
      iOSConfig: [
        // Transcoded downloads run at server encode speed and can exceed the
        // default 4h background URLSession resource timeout.
        (Config.resourceTimeout, const Duration(hours: 8)),
      ],
      desktopConfig: [
        // Matches the legacy engine's accept-any-certificate behavior for
        // dev servers. The plugin refuses this in release mode, where bad-cert
        // servers instead fall back to the legacy engine.
        if (kDebugMode) (Config.bypassTLSCertificateValidation, true),
      ],
    );

    FileDownloader().configureNotificationForGroup(
      mediaGroup,
      running: const TaskNotification('Downloading', '{displayName}'),
      complete: null,
      error: const TaskNotification('Download failed', '{displayName}'),
      progressBar: true,
      groupNotificationId: 'moonfinMediaDownloads',
    );

    FileDownloader().updates.listen(_route);

    await FileDownloader().start(
      doRescheduleKilledTasks: true,
      autoCleanDatabase: true,
    );
  }

  void _route(TaskUpdate update) {
    if (update.task.group != mediaGroup) return;
    switch (update) {
      case TaskStatusUpdate():
        final handler = _statusHandler;
        if (handler == null) {
          _buffered.add(update);
        } else {
          handler(update);
        }
      case TaskProgressUpdate():
        // Progress is transient, so it's only delivered to a live handler.
        _progressHandler?.call(update);
    }
  }

  /// Routes media task events to [statusHandler]/[progressHandler] and replays
  /// any buffered status updates. Last attach wins: a previous handler pair is
  /// silently replaced, so a replaced DownloadService can't keep receiving
  /// events.
  void attach({
    required void Function(TaskStatusUpdate update) statusHandler,
    required void Function(TaskProgressUpdate update) progressHandler,
  }) {
    _statusHandler = statusHandler;
    _progressHandler = progressHandler;
    if (_buffered.isEmpty) return;
    final pending = List<TaskUpdate>.from(_buffered);
    _buffered.clear();
    for (final update in pending) {
      if (update is TaskStatusUpdate) statusHandler(update);
    }
  }

  /// Detaches the given handlers if they are still the active pair. Doesn't
  /// cancel any native tasks: in-flight downloads keep running and their
  /// events are buffered for the next attach.
  void detach({required void Function(TaskStatusUpdate update) statusHandler}) {
    if (_statusHandler == statusHandler) {
      _statusHandler = null;
      _progressHandler = null;
    }
  }
}
