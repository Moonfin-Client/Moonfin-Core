import 'dart:async';

import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'storage_path_service.dart';

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
  BackgroundDownloadCoordinator(this._prefs);

  /// Group for media file downloads. Side assets (posters, subtitles) are
  /// downloaded with dio and never reach the plugin.
  static const String mediaGroup = 'moonfinMedia';

  static bool get isSupported =>
      !kIsWeb && !PlatformDetection.isAppleTV;

  Future<void>? _initFuture;
  int? _configuredMaxConcurrentDownloads;

  final UserPreferences _prefs;

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

  int get _maxConcurrentDownloads =>
      _prefs.effectiveDownloadConcurrentCount;

  /// Applies a changed concurrency preference to the native task scheduler.
  /// [DownloadService] also applies this limit itself, so the same cap covers
  /// the legacy engine and any tasks started before the plugin receives this
  /// updated configuration.
  Future<void> configureMaximumConcurrentDownloads() async {
    if (!isSupported) return;
    await ensureInitialized();
    final maxConcurrent = _maxConcurrentDownloads;
    if (_configuredMaxConcurrentDownloads == maxConcurrent) return;
    await FileDownloader().configure(
      globalConfig: [(Config.holdingQueue, (maxConcurrent, null, null))],
    );
    _configuredMaxConcurrentDownloads = maxConcurrent;
  }

  /// Whether this platform stages plugin downloads in a directory Moonfin
  /// chooses. iOS URLSession stages inside the app container and finalizes
  /// with a same-volume rename, so it needs no override.
  static bool get _usesConfiguredStaging =>
      PlatformDetection.isDesktop || PlatformDetection.isAndroid;

  /// Points the plugin's staging directory at
  /// [StoragePathService.stagingDirName] inside the current offline root, so
  /// the staged file shares the destination volume and the completing move is
  /// a rename instead of a cross-volume copy.
  ///
  /// Call after the download location changes. No-op before the first
  /// [ensureInitialized], which applies the current root itself. Tasks
  /// already running keep the staging path they started with.
  Future<void> applyStagingDirectory() async {
    if (_initFuture == null) return;
    await _initFuture;
    final stagingPath = await _resolveStagingPath();
    if (stagingPath == null) return;
    await FileDownloader().configure(
      androidConfig: [(Config.tempFilePath, stagingPath)],
      desktopConfig: [(Config.tempFilePath, stagingPath)],
    );
  }

  /// Null when staging can't be resolved (e.g. the root is unwritable), so
  /// the plugin falls back to its default staging rather than downloads
  /// breaking outright.
  Future<String?> _resolveStagingPath() async {
    if (!_usesConfiguredStaging) return null;
    try {
      return (await GetIt.instance<StoragePathService>().getStagingDir()).path;
    } catch (_) {
      return null;
    }
  }

  Future<void> _initialize() async {
    final maxConcurrent = _maxConcurrentDownloads;
    // Staged files must share the destination volume so the completing move
    // is a rename (see applyStagingDirectory).
    final stagingPath = await _resolveStagingPath();
    await FileDownloader().configure(
      globalConfig: [
        // Mirrors the app-level scheduler so native tasks cannot exceed the
        // user's selected maximum when the app is suspended or restarted.
        (Config.holdingQueue, (maxConcurrent, null, null)),
      ],
      androidConfig: [
        // Long downloads (notably server transcodes, which can't pause and
        // resume) must escape WorkManager's 9-minute background work limit.
        (Config.runInForeground, Config.always),
        // Fallback staging choice. tempFilePath takes precedence when set.
        (Config.useCacheDir, Config.whenAble),
        if (stagingPath != null) (Config.tempFilePath, stagingPath),
      ],
      iOSConfig: [
        // Transcoded downloads run at server encode speed and can exceed the
        // default 4h background URLSession resource timeout.
        (Config.resourceTimeout, const Duration(hours: 8)),
        // The documents volume is the download destination on iOS, so the
        // plugin's own check measures the right filesystem there. Desktop and
        // Android are covered by the preflight in DownloadService instead.
        (Config.checkAvailableSpace, 512),
      ],
      desktopConfig: [
        // Matches the legacy engine's accept-any-certificate behavior for
        // dev servers. The plugin refuses this in release mode, where bad-cert
        // servers instead fall back to the legacy engine.
        if (kDebugMode) (Config.bypassTLSCertificateValidation, true),
        if (stagingPath != null) (Config.tempFilePath, stagingPath),
      ],
    );
    _configuredMaxConcurrentDownloads = maxConcurrent;

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
