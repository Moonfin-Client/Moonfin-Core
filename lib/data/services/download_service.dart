import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:background_downloader/background_downloader.dart' as bgd;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../../platform/ios_storage.dart';
import '../../playback/subtitle_formats.dart';
import '../../preference/user_preferences.dart';
import '../../util/download_utils.dart';
import '../../util/platform_detection.dart';
import '../database/offline_database.dart';
import '../models/aggregated_item.dart';
import '../models/download_quality.dart';
import '../repositories/offline_repository.dart';
import 'background_download_coordinator.dart';
import 'book_reader_service.dart';
import 'download_notification_service.dart';
import 'legacy_download_engine.dart';
import 'media_store_service.dart';
import 'storage_path_service.dart';
import 'web_download_helper.dart';

class DownloadProgress {
  final String itemId;
  final String fileName;
  final double progress;
  final int bytesReceived;
  final bool isComplete;
  final String? error;

  const DownloadProgress({
    required this.itemId,
    required this.fileName,
    this.progress = 0,
    this.bytesReceived = 0,
    this.isComplete = false,
    this.error,
  });

  /// True while the transfer has effectively finished but the file is still
  /// being moved to its final location and validated. Progress is clamped to
  /// 0.99 during this window, so without this the UI looks stuck at 99%.
  bool get isFinalizing => !isComplete && error == null && progress >= 0.99;
}

/// Per-attempt state for a media download running on the native
/// background_downloader engine. Keyed by itemId in
/// [DownloadService._pluginContexts]. The plugin task carries the itemId in
/// its metaData so status and progress events can be routed back here.
class _MediaDownloadContext {
  final String itemId;
  final String displayName;
  final DownloadQuality quality;
  final String savePath;
  final void Function(int received, int total) onReceiveProgress;
  final Completer<Response> completer = Completer<Response>();
  String currentTaskId = '';

  _MediaDownloadContext({
    required this.itemId,
    required this.displayName,
    required this.quality,
    required this.savePath,
    required this.onReceiveProgress,
  });
}

/// The native engine rejected the server's TLS certificate, so the download
/// should be retried on the legacy engine, which accepts any certificate.
class _TlsRejectedException implements Exception {}

enum _DownloadActivityPhase { start, progress, stop }

class DownloadService extends ChangeNotifier {
  final MediaServerClient _client;
  final DownloadNotificationService _notificationService;
  late final Dio _downloadDio;
  final LegacyDownloadEngine _legacyEngine = LegacyDownloadEngine();

  /// Contexts of media downloads running on the native plugin engine,
  /// keyed by itemId.
  final Map<String, _MediaDownloadContext> _pluginContexts = {};

  final Map<String, DownloadProgress> _activeDownloads = {};
  Map<String, DownloadProgress> get activeDownloads =>
      Map.unmodifiable(_activeDownloads);

  final Map<String, CancelToken> _cancelTokens = {};
  final Map<String, DateTime> _downloadStartTimes = {};
  final Map<String, double> _lastPersistedProgress = {};
  final Map<String, double> _lastNotifiedProgress = {};
  final Map<String, double> _lastCallbackProgress = {};
  bool _cancelAllRequested = false;

  int _totalQueued = 0;
  int _completedCount = 0;
  int get totalQueued => _totalQueued;
  int get completedCount => _completedCount;
  bool get isBatchDownloading =>
      _totalQueued > 0 && _completedCount < _totalQueued;

  final StreamController<String> _errorController =
      StreamController<String>.broadcast();
  Stream<String> get errors => _errorController.stream;

  void _emitError(String message) {
    if (!_errorController.isClosed) {
      _errorController.add(message);
    }
  }

  DownloadService(this._client, this._notificationService) {
    _downloadDio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(hours: 6),
      ),
    );
    configureServerDio(_downloadDio);
    _coordinator?.attach(
      statusHandler: _onTaskStatus,
      progressHandler: _onTaskProgress,
    );
  }

  bool isDownloading(String itemId) => _activeDownloads.containsKey(itemId);

  /// The app-lifetime coordinator for the native download engine, or null
  /// when it isn't registered (unsupported platform, tests).
  BackgroundDownloadCoordinator? get _coordinator =>
      GetIt.instance.isRegistered<BackgroundDownloadCoordinator>()
      ? GetIt.instance<BackgroundDownloadCoordinator>()
      : null;

  bool get _pluginEngineSupported =>
      BackgroundDownloadCoordinator.isSupported &&
      _coordinator != null &&
      (PlatformDetection.isIOS ||
          PlatformDetection.isAndroid ||
          PlatformDetection.isDesktop);

  /// Whether media downloads for the active server run on the native
  /// background_downloader engine.
  bool get _usesPluginEngine =>
      _pluginEngineSupported && !_serverNeedsLegacyTls;

  /// On iOS and Android the plugin posts its own download notifications.
  /// The desktop plugin engine and the legacy engine post none, so those
  /// keep the flutter_local_notifications path.
  bool get _usesPluginNotifications =>
      _usesPluginEngine &&
      (PlatformDetection.isIOS || PlatformDetection.isAndroid);

  // Memoized because this is checked from every progress callback.
  String? _legacyTlsRawCache;
  bool _legacyTlsResult = false;

  bool get _serverNeedsLegacyTls {
    final raw = _prefs.get(UserPreferences.legacyDownloadEngineServers);
    if (raw != _legacyTlsRawCache) {
      _legacyTlsRawCache = raw;
      try {
        _legacyTlsResult =
            raw.isNotEmpty &&
            (jsonDecode(raw) as List).contains(_client.baseUrl);
      } catch (_) {
        _legacyTlsResult = false;
      }
    }
    return _legacyTlsResult;
  }

  Future<void> _markServerNeedsLegacyTls() async {
    final raw = _prefs.get(UserPreferences.legacyDownloadEngineServers);
    List<dynamic> servers;
    try {
      servers = raw.isEmpty ? <dynamic>[] : jsonDecode(raw) as List;
    } catch (_) {
      servers = <dynamic>[];
    }
    if (!servers.contains(_client.baseUrl)) {
      servers.add(_client.baseUrl);
      await _prefs.set(
        UserPreferences.legacyDownloadEngineServers,
        jsonEncode(servers),
      );
    }
  }

  UserPreferences get _prefs => GetIt.instance<UserPreferences>();

  bool _canClearCancelAllGate() {
    return _cancelTokens.isEmpty &&
        _activeDownloads.values.every((d) => d.isComplete || d.error != null);
  }

  bool _shouldPersistProgress(String itemId, double progress) {
    final last = _lastPersistedProgress[itemId];
    if (last == null || progress >= 0.99 || (progress - last) >= 0.05) {
      _lastPersistedProgress[itemId] = progress;
      return true;
    }
    return false;
  }

  bool _shouldUpdateSystemNotification(String itemId, double progress) {
    final last = _lastNotifiedProgress[itemId];
    if (last == null || progress >= 0.99 || (progress - last) >= 0.02) {
      _lastNotifiedProgress[itemId] = progress;
      return true;
    }
    return false;
  }

  Future<bool> _checkWifiPolicy() async {
    if (!_prefs.get(UserPreferences.downloadWifiOnly)) return true;
    if (PlatformDetection.isAppleTV) return true;
    final results = await Connectivity().checkConnectivity();
    return results.any((r) => r == ConnectivityResult.wifi);
  }

  Future<bool> _checkStorageLimit(int estimatedBytes) async {
    final limitMb = _prefs.get(UserPreferences.downloadStorageLimitMb);
    if (limitMb <= 0) return true;
    final used = await _offlineRepo.getTotalStorageUsed();
    return (used + estimatedBytes) <= limitMb * 1024 * 1024;
  }

  StoragePathService get _storagePath => GetIt.instance<StoragePathService>();
  OfflineRepository get _offlineRepo => GetIt.instance<OfflineRepository>();

  String _fileNameBaseFromPath(String savePath) {
    return p.basenameWithoutExtension(savePath);
  }

  Future<void> _deleteSubtitleFiles(Directory dir, String fileNameBase) async {
    if (!await dir.exists()) {
      return;
    }

    final prefix = '${fileNameBase}_sub_';
    await for (final entity in dir.list()) {
      if (entity is! File) {
        continue;
      }

      final name = p.basename(entity.path);
      if (name.startsWith(prefix)) {
        await entity.delete();
      }
    }
  }

  Future<void> _deleteEmptyDirectoriesUpTo(
    Directory start,
    Directory root,
  ) async {
    var current = start;

    while (p.isWithin(root.path, current.path) &&
        !p.equals(current.path, root.path)) {
      if (!await current.exists()) {
        current = current.parent;
        continue;
      }

      if (!await current.list().isEmpty) {
        break;
      }

      final parent = current.parent;
      await current.delete();
      current = parent;
    }
  }

  Future<void> _deleteFileArtifacts(String savePath) async {
    final offlineRoot = await _storagePath.getOfflineRoot();
    await _deleteFileArtifactsWithinRoot(savePath, offlineRoot);
  }

  Future<void> _deleteFileArtifactsWithinRoot(
    String savePath,
    Directory offlineRoot,
  ) async {
    final file = File(savePath);
    if (await file.exists()) {
      await file.delete();
    }

    final parent = file.parent;
    await _deleteSubtitleFiles(parent, _fileNameBaseFromPath(savePath));
    await _deleteEmptyDirectoriesUpTo(parent, offlineRoot);
  }

  Future<void> _deleteCandidateFileArtifacts(
    Directory dir,
    AggregatedItem item,
    Directory offlineRoot,
  ) async {
    final candidatePaths = _candidateSavePaths(
      dir,
      item,
    ).toList(growable: false);
    final fileNameBases = candidatePaths.map(_fileNameBaseFromPath).toSet();

    for (final savePath in candidatePaths) {
      final file = File(savePath);
      if (await file.exists()) {
        await file.delete();
      }
    }

    for (final fileNameBase in fileNameBases) {
      await _deleteSubtitleFiles(dir, fileNameBase);
    }

    await _deleteEmptyDirectoriesUpTo(dir, offlineRoot);
  }

  Future<void> _deleteImagesForIds(
    Iterable<String> itemIds,
    Directory imageDir,
  ) async {
    for (final itemId in itemIds.toSet()) {
      await _deleteItemImages(itemId, imageDir);
    }
  }

  Future<void> _cleanupEpisodeContainers(
    AggregatedItem episode,
    Directory imageDir,
  ) async {
    if (episode.seasonId != null) {
      final seasonEpisodes = await _offlineRepo.getSeasonEpisodes(
        episode.seasonId!,
      );
      if (seasonEpisodes.isEmpty) {
        await _offlineRepo.deleteItem(episode.seasonId!);
        await _deleteItemImages(episode.seasonId!, imageDir);
      }
    }

    if (episode.seriesId != null) {
      final seriesEpisodes = await _offlineRepo.getSeriesEpisodes(
        episode.seriesId!,
      );
      if (seriesEpisodes.isEmpty) {
        await _offlineRepo.deleteItem(episode.seriesId!);
        await _deleteItemImages(episode.seriesId!, imageDir);
      }
    }
  }

  Iterable<String> _candidateSavePaths(
    Directory dir,
    AggregatedItem item,
  ) sync* {
    final seenPaths = <String>{};

    for (final quality in DownloadQuality.values) {
      final savePath = '${dir.path}/${_buildFileName(item, quality)}';
      if (seenPaths.add(savePath)) {
        yield savePath;
      }
    }
  }

  double _initialProgressForQuality(DownloadQuality quality) {
    return quality.isTranscoded ? -1.0 : 0.0;
  }

  double _clampProgress(double progress) {
    if (progress <= 0) {
      return 0.0;
    }

    if (progress >= 1) {
      return 1.0;
    }

    return progress;
  }

  double _storedProgress(double progress) {
    return progress < 0 ? 0.0 : _clampProgress(progress);
  }

  Future<Set<String>> _relatedImageIds(AggregatedItem item) async {
    final allItems = await _offlineRepo.getItems();

    switch (item.type) {
      case 'Season':
        return allItems
            .where((row) => row.itemId == item.id || row.seasonId == item.id)
            .map((row) => row.itemId)
            .toSet();

      case 'Series':
        return allItems
            .where((row) => row.itemId == item.id || row.seriesId == item.id)
            .map((row) => row.itemId)
            .toSet();

      default:
        return {item.id};
    }
  }

  double _calculateProgress({
    required int received,
    required int total,
    required int estimatedSize,
    required DownloadQuality quality,
  }) {
    if (total > 0) {
      return _clampProgress(received / total);
    }

    if (quality.isTranscoded) {
      return -1.0;
    }

    if (estimatedSize > 0) {
      return _clampProgress(received / estimatedSize);
    }

    return -1.0;
  }

  String _sanitizePath(String name) {
    return name.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();
  }

  String _buildSubFolder(AggregatedItem item) {
    switch (item.type) {
      case 'Movie':
        final year = item.productionYear;
        final title = _sanitizePath(item.name);
        return year != null ? 'Movies/$title ($year)' : 'Movies/$title';

      case 'Audio':
        final artist = _sanitizePath(
          item.albumArtist ??
              (item.artists.isNotEmpty ? item.artists.first : 'Unknown Artist'),
        );
        final album = _sanitizePath(item.album ?? 'Singles');
        return 'Music/$artist/$album';

      case 'AudioBook':
        final author = _sanitizePath(
          item.albumArtist ??
              (item.artists.isNotEmpty ? item.artists.first : 'Unknown Author'),
        );
        final collection = _sanitizePath(item.album ?? item.name);
        return 'Audiobooks/$author/$collection';

      case 'Book':
        return 'Books/${_sanitizePath(item.name)}';

      case 'Episode':
        final series = _sanitizePath(item.seriesName ?? 'Unknown Series');
        final season = item.parentIndexNumber;
        final seasonFolder = season != null
            ? 'Season ${season.toString().padLeft(2, '0')}'
            : 'Specials';
        return 'TV/$series/$seasonFolder';

      case 'MusicVideo':
        final artist =
            item.albumArtist ??
            (item.artists.isNotEmpty ? item.artists.first : null);
        return artist != null
            ? 'Music Videos/${_sanitizePath(artist)}'
            : 'Music Videos/${_sanitizePath(item.name)}';

      default:
        return 'Other/${_sanitizePath(item.name)}';
    }
  }

  String _buildFileName(AggregatedItem item, DownloadQuality quality) {
    final container = _getContainer(item, quality);
    switch (item.type) {
      case 'Audio':
      case 'AudioBook':
        final index = item.indexNumber;
        final prefix = index != null
            ? '${index.toString().padLeft(2, '0')} - '
            : '';
        return '$prefix${_sanitizePath(item.name)}.$container';

      case 'Episode':
        final s = item.parentIndexNumber;
        final e = item.indexNumber;
        final prefix = (s != null && e != null)
            ? 'S${s.toString().padLeft(2, '0')}E${e.toString().padLeft(2, '0')} - '
            : '';
        return '$prefix${_sanitizePath(item.name)}.$container';

      default:
        return '${_sanitizePath(item.name)}.$container';
    }
  }

  String _getContainer(AggregatedItem item, DownloadQuality quality) {
    if (item.type == 'Book') {
      final ext = BookReaderService.detectExtension(item);
      if (ext != null && ext.isNotEmpty) return ext.toLowerCase();
    }

    if (quality.isTranscoded) return quality.container;
    if (item.mediaSources.isNotEmpty) {
      final c = item.mediaSources.first['Container'] as String?;
      if (c != null && c.isNotEmpty) return c.toLowerCase();
    }
    return 'mkv';
  }

  Future<String?> _correctBookExtension(
    File savedFile,
    Response? response,
  ) async {
    final currentPath = savedFile.path;
    final currentExt = currentPath.contains('.')
        ? currentPath.substring(currentPath.lastIndexOf('.') + 1).toLowerCase()
        : '';

    String? detectedExt;

    if (response != null) {
      final disposition = response.headers.value('content-disposition');
      detectedExt = BookReaderService.extractExtensionFromContentDisposition(
        disposition,
      );

      if (detectedExt == null) {
        final contentType = response.headers.value('content-type');
        detectedExt = BookReaderService.extensionFromMime(contentType);
      }
    }

    if (detectedExt == null || detectedExt == currentExt) return null;
    if (!BookReaderService.supportedExtensions.contains(detectedExt))
      return null;

    final newPath = currentPath.contains('.')
        ? currentPath.replaceAll(RegExp(r'\.[^.]+$'), '.$detectedExt')
        : '$currentPath.$detectedExt';
    if (newPath == currentPath) return null;
    await savedFile.rename(newPath);
    return newPath;
  }

  Future<void> _populateOfflineAssets(AggregatedItem item) async {
    await _downloadImages(item);
    if (_usesAudioDownloadEndpoint(item)) {
      await _downloadLyrics(item);
    }
    await _ensureParentContainers(item);
  }

  Future<void> _runPostCompletionTasks({
    required AggregatedItem item,
    required String savePath,
    required Directory dir,
    required String fileName,
  }) async {
    Future<void> runBestEffort(Future<void> task, Duration timeout) async {
      try {
        await task.timeout(timeout);
      } catch (_) {}
    }

    final extensionIndex = fileName.lastIndexOf('.');
    final fileNameBase = extensionIndex > 0
        ? fileName.substring(0, extensionIndex)
        : fileName;

    await runBestEffort(
      _populateOfflineAssets(item),
      const Duration(seconds: 30),
    );

    if (PlatformDetection.isIOS) {
      await runBestEffort(
        IosStorage.excludeFromBackup(savePath),
        const Duration(seconds: 10),
      );
    }

    if (!_usesPluginNotifications &&
        (_totalQueued <= 1 || _completedCount >= _totalQueued)) {
      await runBestEffort(
        _notificationService.showComplete(
          itemName: item.name,
          batchTotal: _totalQueued > 1 ? _completedCount : 0,
        ),
        const Duration(seconds: 10),
      );
    }

    await runBestEffort(
      _downloadExternalSubtitles(item, dir, fileNameBase),
      const Duration(seconds: 30),
    );
  }

  String _newTaskId(String itemId) =>
      '$itemId::${DateTime.now().microsecondsSinceEpoch}';

  String? _itemIdForTask(bgd.Task task) {
    try {
      final meta = jsonDecode(task.metaData) as Map<String, dynamic>;
      return meta['itemId'] as String?;
    } catch (_) {
      return null;
    }
  }

  String? _savePathForTask(bgd.Task task) {
    try {
      final meta = jsonDecode(task.metaData) as Map<String, dynamic>;
      return meta['savePath'] as String?;
    } catch (_) {
      return null;
    }
  }

  Future<bgd.Task> _buildMediaTask({
    required String url,
    required _MediaDownloadContext ctx,
    required Map<String, String> headers,
  }) async {
    final (baseDirectory, directory, filename) = await bgd.Task.split(
      filePath: ctx.savePath,
    );
    final metaData = jsonEncode({
      'itemId': ctx.itemId,
      'quality': ctx.quality.name,
      'savePath': ctx.savePath,
    });
    final requiresWiFi = _prefs.get(UserPreferences.downloadWifiOnly);

    // Always a plain single-connection DownloadTask, which issues a direct
    // GET. ParallelDownloadTask first sends a HEAD request to size the file,
    // which Jellyfin rejects with 405 on its download and stream endpoints.
    //
    // A transcoded stream has an unknown length and no resume support, and a
    // retry would restart the whole server transcode, so errors surface to
    // the user instead of retrying automatically.
    final resumable = !ctx.quality.isTranscoded;
    return bgd.DownloadTask(
      taskId: _newTaskId(ctx.itemId),
      url: url,
      filename: filename,
      directory: directory,
      baseDirectory: baseDirectory,
      headers: headers,
      group: BackgroundDownloadCoordinator.mediaGroup,
      updates: bgd.Updates.statusAndProgress,
      requiresWiFi: requiresWiFi,
      retries: resumable ? 3 : 0,
      allowPause: resumable,
      metaData: metaData,
      displayName: ctx.displayName,
    );
  }

  /// Downloads [url] via the native background_downloader engine. Resolves
  /// with a synthesized dio [Response] on completion so the shared
  /// validation/fallback logic can stay engine-agnostic.
  Future<Response> _downloadWithPlugin(
    String url, {
    required AggregatedItem item,
    required DownloadQuality quality,
    required String savePath,
    required Map<String, String> headers,
    required CancelToken cancelToken,
    required void Function(int, int) onReceiveProgress,
  }) async {
    await _coordinator!.ensureInitialized();
    final ctx = _MediaDownloadContext(
      itemId: item.id,
      displayName: item.name,
      quality: quality,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
    );
    final task = await _buildMediaTask(url: url, ctx: ctx, headers: headers);
    ctx.currentTaskId = task.taskId;
    _pluginContexts[item.id] = ctx;
    cancelToken.whenCancel
        .then((_) => bgd.FileDownloader().cancelTaskWithId(ctx.currentTaskId))
        .ignore();
    try {
      if (cancelToken.isCancelled) {
        throw cancelToken.cancelError ??
            DioException(
              type: DioExceptionType.cancel,
              requestOptions: RequestOptions(path: url),
            );
      }
      final enqueued = await bgd.FileDownloader().enqueue(task);
      if (!enqueued) {
        throw DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: url),
          message: 'Failed to enqueue background download',
        );
      }
      return await ctx.completer.future;
    } finally {
      if (identical(_pluginContexts[item.id], ctx)) {
        _pluginContexts.remove(item.id);
      }
    }
  }

  bool _looksLikeTlsError(bgd.TaskException? exception) {
    if (exception is! bgd.TaskConnectionException) return false;
    final description = exception.description.toLowerCase();
    return description.contains('certificate') ||
        description.contains('handshake') ||
        description.contains('ssl') ||
        description.contains('trust anchor');
  }

  void _onTaskStatus(bgd.TaskStatusUpdate update) {
    final itemId = _itemIdForTask(update.task);
    if (itemId == null) return;
    final ctx = _pluginContexts[itemId];
    if (ctx == null || update.task.taskId != ctx.currentTaskId) {
      _handleUnattendedTaskUpdate(itemId, update);
      return;
    }
    switch (update.status) {
      case bgd.TaskStatus.complete:
        _completePluginDownload(ctx, update);
      case bgd.TaskStatus.notFound:
        _failPluginDownload(ctx, update, statusCode: 404);
      case bgd.TaskStatus.failed:
        final exception = update.exception;
        if (_looksLikeTlsError(exception)) {
          if (!ctx.completer.isCompleted) {
            ctx.completer.completeError(_TlsRejectedException());
          }
          return;
        }
        final statusCode = switch (exception) {
          bgd.TaskHttpException(:final httpResponseCode)
              when httpResponseCode > 0 =>
            httpResponseCode,
          _ => update.responseStatusCode,
        };
        _failPluginDownload(ctx, update, statusCode: statusCode);
      case bgd.TaskStatus.canceled:
        if (!ctx.completer.isCompleted) {
          ctx.completer.completeError(
            DioException(
              type: DioExceptionType.cancel,
              requestOptions: RequestOptions(path: update.task.url),
            ),
          );
        }
      case bgd.TaskStatus.enqueued:
      case bgd.TaskStatus.running:
      case bgd.TaskStatus.paused:
      case bgd.TaskStatus.waitingToRetry:
        break;
    }
  }

  void _onTaskProgress(bgd.TaskProgressUpdate update) {
    final itemId = _itemIdForTask(update.task);
    if (itemId == null) return;
    final ctx = _pluginContexts[itemId];
    if (ctx == null || update.task.taskId != ctx.currentTaskId) return;
    final progress = update.progress;
    // Negative values are the plugin's failed/paused/retrying sentinels.
    if (progress < 0 || progress > 1) return;
    final expected = update.expectedFileSize;
    if (expected > 0) {
      ctx.onReceiveProgress((progress * expected).round(), expected);
    }
  }

  void _completePluginDownload(
    _MediaDownloadContext ctx,
    bgd.TaskStatusUpdate update,
  ) {
    if (ctx.completer.isCompleted) return;
    final headers = Headers();
    final responseHeaders = update.responseHeaders;
    final contentType = update.mimeType ?? responseHeaders?['content-type'];
    if (contentType != null && contentType.isNotEmpty) {
      headers.set('content-type', contentType);
    }
    final disposition = responseHeaders?['content-disposition'];
    if (disposition != null && disposition.isNotEmpty) {
      headers.set('content-disposition', disposition);
    }
    // Deliberately no content-length header: the byte count reconstructed
    // from fractional progress updates is approximate, so an exact-match
    // validation against Content-Length would produce false failures.
    ctx.completer.complete(
      Response(
        requestOptions: RequestOptions(path: update.task.url, method: 'GET'),
        statusCode: update.responseStatusCode ?? 200,
        headers: headers,
      ),
    );
  }

  void _failPluginDownload(
    _MediaDownloadContext ctx,
    bgd.TaskStatusUpdate update, {
    int? statusCode,
  }) {
    if (ctx.completer.isCompleted) return;
    final url = update.task.url;
    final hasStatus = statusCode != null && statusCode > 0;
    ctx.completer.completeError(
      DioException(
        type: hasStatus
            ? DioExceptionType.badResponse
            : DioExceptionType.unknown,
        requestOptions: RequestOptions(path: url),
        message: update.exception?.description ?? 'Download failed',
        response: hasStatus
            ? Response(
                requestOptions: RequestOptions(path: url),
                statusCode: statusCode,
              )
            : null,
      ),
    );
  }

  /// Handles a status update for a media task no live download is awaiting:
  /// a task from a previous app run (finished while the app was dead, or
  /// rescheduled by the plugin at startup) or from before a server switch.
  void _handleUnattendedTaskUpdate(String itemId, bgd.TaskStatusUpdate update) {
    switch (update.status) {
      case bgd.TaskStatus.complete:
        unawaited(_finalizeUnattendedDownload(itemId, update.task));
      case bgd.TaskStatus.failed:
      case bgd.TaskStatus.notFound:
        unawaited(() async {
          final savePath = _savePathForTask(update.task);
          if (savePath != null) {
            try {
              await _deleteFileArtifacts(savePath);
            } catch (_) {}
          }
          await _offlineRepo.updateDownloadStatus(
            itemId,
            3,
            error: update.exception?.description ?? 'Download failed',
          );
          await bgd.FileDownloader().database.deleteRecordWithId(
            update.task.taskId,
          );
          notifyListeners();
        }());
      case bgd.TaskStatus.canceled:
        unawaited(
          bgd.FileDownloader().database.deleteRecordWithId(update.task.taskId),
        );
      case bgd.TaskStatus.enqueued:
      case bgd.TaskStatus.running:
      case bgd.TaskStatus.paused:
      case bgd.TaskStatus.waitingToRetry:
        break;
    }
  }

  /// Validates a finished file on disk and flips its drift row to complete.
  /// Throws when validation fails.
  Future<void> _persistCompletedFile(
    String itemId,
    String savePath,
    DownloadQuality quality,
  ) async {
    final file = File(savePath);
    await _validateDownloadedFile(file, quality, bytesReceived: 0);
    final finalSize = await file.length();
    await _offlineRepo.setLocalFilePath(itemId, savePath, fileSize: finalSize);
    await _offlineRepo.updateDownloadStatus(itemId, 2);
    if (PlatformDetection.isIOS) {
      try {
        await IosStorage.excludeFromBackup(savePath);
      } catch (_) {}
    }
  }

  /// Finalizes a media download that completed without a live
  /// [_MediaDownloadContext] (app was killed or the service was replaced):
  /// validates the file and flips the drift row to complete.
  Future<void> _finalizeUnattendedDownload(String itemId, bgd.Task task) async {
    try {
      final row = await _offlineRepo.getItem(itemId);
      if (row == null || row.downloadStatus == 2) return;
      final savePath = _savePathForTask(task) ?? await task.filePath();
      final quality = DownloadQuality.values.firstWhere(
        (q) => q.name == row.qualityPreset,
        orElse: () => DownloadQuality.original,
      );
      await _persistCompletedFile(itemId, savePath, quality);
      notifyListeners();
    } catch (e) {
      await _offlineRepo.updateDownloadStatus(itemId, 3, error: e.toString());
      notifyListeners();
    } finally {
      await bgd.FileDownloader().database.deleteRecordWithId(task.taskId);
    }
  }

  bool _hasAuthToken() {
    final token = _client.accessToken;
    return token != null && token.isNotEmpty;
  }

  bool _isGuardTimeoutCancel(DioException e) {
    final raw = e.error;
    return raw is String && raw == LegacyDownloadEngine.guardCancelReason;
  }

  bool _supportsTranscodedDownload(String? type) {
    return type == 'Movie' ||
        type == 'Episode' ||
        type == 'MusicVideo' ||
        type == 'Video';
  }

  Map<String, String> _buildAuthHeaders() {
    final token = _client.accessToken;
    if (token == null || token.isEmpty) {
      return const {};
    }

    return {
      'X-Emby-Token': token,
      'Authorization': 'MediaBrowser Token="$token"',
    };
  }

  Map<String, String> _buildDownloadRequestHeaders() {
    final token = _client.accessToken;
    if (token == null || token.isEmpty) {
      return {
        'Accept': 'application/octet-stream',
        'User-Agent': 'Moonfin/Flutter',
      };
    }
    return {
      'Accept': 'application/octet-stream',
      'User-Agent': 'Moonfin/Flutter',
      'X-Emby-Token': token,
      'Authorization': 'MediaBrowser Token="$token"',
    };
  }

  bool _usesAudioDownloadEndpoint(AggregatedItem item) {
    final mediaType = item.rawData['MediaType'] as String?;
    return item.type == 'Audio' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
  }

  bool _shouldRetryWithFallback(
    AggregatedItem item,
    DownloadQuality quality,
    DioException error,
  ) {
    final status = error.response?.statusCode;
    if (status != 401 && status != 403 && status != 404) {
      return false;
    }

    if (item.type == 'Book') {
      return true;
    }

    return !quality.isTranscoded;
  }

  String? _primaryMediaSourceId(AggregatedItem item) {
    return item.mediaSources.isNotEmpty
        ? item.mediaSources.first['Id']?.toString()
        : null;
  }

  String _encodeQuery(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  Map<String, String> _baseDownloadParams(
    AggregatedItem item, {
    bool isStatic = false,
    bool includeMediaSourceId = true,
  }) {
    final mediaSourceId = _primaryMediaSourceId(item);
    return <String, String>{
      if (isStatic) 'Static': 'true',
      if (includeMediaSourceId && mediaSourceId != null)
        'MediaSourceId': mediaSourceId,
      if (_client.accessToken != null) 'ApiKey': _client.accessToken!,
    };
  }

  String _buildDirectItemFileUrl(String itemId, AggregatedItem item) {
    final query = _encodeQuery(_baseDownloadParams(item));
    return '${_client.baseUrl}/Items/$itemId/File${query.isEmpty ? '' : '?$query'}';
  }

  String _buildStaticVideoStreamUrl(String itemId, AggregatedItem item) {
    final query = _encodeQuery(_baseDownloadParams(item, isStatic: true));
    return '${_client.baseUrl}/Videos/$itemId/stream?$query';
  }

  List<String> _buildDownloadFallbackUrls(
    AggregatedItem item, {
    required String primaryUrl,
  }) {
    final candidates = <String>[
      if (item.type == 'Book')
        ...BookReaderService.buildDownloadUris(
          _client,
          item,
        ).map((u) => u.toString())
      else ...[
        if (_usesAudioDownloadEndpoint(item))
          _buildAudioDownloadUrl(item.id, item),
        _buildDirectItemDownloadUrl(item.id, item),
        _buildDirectItemFileUrl(item.id, item),
        _buildStaticVideoStreamUrl(item.id, item),
      ],
    ];

    final fallbackUrls = <String>[];
    final primary = Uri.parse(primaryUrl).toString();
    final seen = <String>{primary};
    for (final candidate in candidates) {
      final normalized = Uri.parse(candidate).toString();
      if (seen.add(normalized)) {
        fallbackUrls.add(normalized);
      }
    }

    return fallbackUrls;
  }

  String _friendlyDioError(DioException e) {
    final status = e.response?.statusCode;
    if (status == 403) {
      return 'Download forbidden (403). Retried alternate endpoints but access was denied.';
    }
    if (status == 401) {
      return 'Download unauthorized (401). Please re-login and try again.';
    }
    if (status == 404) {
      return 'Download source not found (404). The file may no longer be available.';
    }
    return e.message ?? 'Download failed';
  }

  String _friendlyGenericError(Object e) {
    if (e is TimeoutException) {
      return 'Download timed out while waiting for transfer completion.';
    }

    return e.toString();
  }

  Future<Uint8List> _readPrefix(File file, {int maxBytes = 512}) async {
    final length = await file.length();
    final toRead = length < maxBytes ? length : maxBytes;
    final chunks = await file.openRead(0, toRead).toList();
    return Uint8List.fromList(chunks.expand((c) => c).toList(growable: false));
  }

  bool _looksLikeTextPayload(Uint8List bytes) {
    if (bytes.isEmpty) {
      return false;
    }

    final sample = String.fromCharCodes(bytes).toLowerCase();
    return sample.contains('<html') ||
        sample.contains('<!doctype') ||
        sample.contains('{"error"') ||
        sample.contains('cloudflare') ||
        sample.contains('nginx') ||
        sample.contains('forbidden') ||
        sample.contains('unauthorized');
  }

  bool _hasMp4Signature(Uint8List bytes) {
    if (bytes.length < 12) {
      return false;
    }

    for (var i = 0; i <= bytes.length - 4 && i < 32; i++) {
      if (bytes[i] == 0x66 &&
          bytes[i + 1] == 0x74 &&
          bytes[i + 2] == 0x79 &&
          bytes[i + 3] == 0x70) {
        return true;
      }
    }

    return false;
  }

  bool _signatureMatchesExtension(Uint8List bytes, String ext) {
    switch (ext) {
      case 'mp4':
      case 'm4v':
      case 'm4a':
        return _hasMp4Signature(bytes);
      case 'mkv':
      case 'webm':
        return bytes.length >= 4 &&
            bytes[0] == 0x1A &&
            bytes[1] == 0x45 &&
            bytes[2] == 0xDF &&
            bytes[3] == 0xA3;
      case 'mp3':
        return (bytes.length >= 3 &&
                bytes[0] == 0x49 &&
                bytes[1] == 0x44 &&
                bytes[2] == 0x33) ||
            (bytes.length >= 2 &&
                bytes[0] == 0xFF &&
                (bytes[1] & 0xE0) == 0xE0);
      case 'flac':
        return bytes.length >= 4 &&
            bytes[0] == 0x66 &&
            bytes[1] == 0x4C &&
            bytes[2] == 0x61 &&
            bytes[3] == 0x43;
      case 'ogg':
      case 'opus':
        return bytes.length >= 4 &&
            bytes[0] == 0x4F &&
            bytes[1] == 0x67 &&
            bytes[2] == 0x67 &&
            bytes[3] == 0x53;
      case 'wav':
        return bytes.length >= 12 &&
            bytes[0] == 0x52 &&
            bytes[1] == 0x49 &&
            bytes[2] == 0x46 &&
            bytes[3] == 0x46 &&
            bytes[8] == 0x57 &&
            bytes[9] == 0x41 &&
            bytes[10] == 0x56 &&
            bytes[11] == 0x45;
      case 'pdf':
        return bytes.length >= 5 &&
            bytes[0] == 0x25 &&
            bytes[1] == 0x50 &&
            bytes[2] == 0x44 &&
            bytes[3] == 0x46 &&
            bytes[4] == 0x2D;
      case 'epub':
      case 'cbz':
      case 'zip':
        return bytes.length >= 4 &&
            bytes[0] == 0x50 &&
            bytes[1] == 0x4B &&
            bytes[2] == 0x03 &&
            bytes[3] == 0x04;
      case 'cbr':
        return bytes.length >= 7 &&
            bytes[0] == 0x52 &&
            bytes[1] == 0x61 &&
            bytes[2] == 0x72 &&
            bytes[3] == 0x21 &&
            bytes[4] == 0x1A &&
            bytes[5] == 0x07;
      default:
        return true;
    }
  }

  Future<void> _validateDownloadedFile(
    File file,
    DownloadQuality quality, {
    required int bytesReceived,
    Response? response,
  }) async {
    if (!await file.exists()) {
      throw StateError('Downloaded file is missing on disk');
    }

    final fileSize = await file.length();
    if (fileSize <= 0) {
      throw StateError('Downloaded file is empty (0 bytes)');
    }

    final contentType = response?.headers.value('content-type')?.toLowerCase();
    if (contentType != null &&
        (contentType.startsWith('text/') ||
            contentType.contains('application/json') ||
            contentType.contains('text/html'))) {
      throw StateError(
        'Download returned non-media content-type: $contentType',
      );
    }

    final contentLength = response?.headers.value('content-length');
    if (contentLength != null) {
      final parsedLength = int.tryParse(contentLength);
      if (parsedLength != null &&
          parsedLength > 0 &&
          bytesReceived > 0 &&
          bytesReceived != parsedLength) {
        throw StateError(
          'Downloaded bytes do not match Content-Length (received=$bytesReceived expected=$parsedLength)',
        );
      }
    }

    final prefix = await _readPrefix(file);
    if (_looksLikeTextPayload(prefix)) {
      throw StateError(
        'Downloaded content appears to be an HTML/text error payload',
      );
    }

    final ext = file.path.contains('.')
        ? file.path.split('.').last.toLowerCase()
        : '';
    if (ext.isNotEmpty && !_signatureMatchesExtension(prefix, ext)) {
      throw StateError(
        'Downloaded file signature does not match extension .$ext',
      );
    }

    if (quality.isTranscoded &&
        !_signatureMatchesExtension(prefix, quality.container)) {
      throw StateError(
        'Transcoded file signature does not match expected container ${quality.container}',
      );
    }
  }

  String _buildAudioDownloadUrl(String itemId, AggregatedItem item) {
    final query = _encodeQuery(_baseDownloadParams(item, isStatic: true));
    return '${_client.baseUrl}/Audio/$itemId/stream?$query';
  }

  String _buildDirectItemDownloadUrl(String itemId, AggregatedItem item) {
    final query = _encodeQuery(
      _baseDownloadParams(item, includeMediaSourceId: false),
    );
    return '${_client.baseUrl}/Items/$itemId/Download${query.isEmpty ? '' : '?$query'}';
  }

  String _buildDownloadUrl(
    String itemId,
    AggregatedItem item,
    DownloadQuality quality, {
    String? playSessionId,
  }) {
    if (!quality.isTranscoded || !_supportsTranscodedDownload(item.type)) {
      return _buildDirectItemDownloadUrl(itemId, item);
    }

    final baseUrl = _client.baseUrl;
    final params = _baseDownloadParams(item);

    params['Static'] = 'false';
    params['videoCodec'] = quality.videoCodec;
    params['audioCodec'] = quality.audioCodec;
    if (quality.videoBitRate != null) {
      params['videoBitRate'] = quality.videoBitRate.toString();
    }
    if (quality.audioBitRate != null) {
      params['audioBitRate'] = quality.audioBitRate.toString();
    }
    if (quality.maxWidth != null) {
      params['maxWidth'] = quality.maxWidth.toString();
    }
    params['container'] = quality.container;
    if (quality.audioChannels != null) {
      params['audioChannels'] = quality.audioChannels.toString();
    }
    if (playSessionId != null) {
      params['PlaySessionId'] = playSessionId;
      params['DeviceId'] = _client.deviceInfo.id;
    }

    final query = _encodeQuery(params);
    return '$baseUrl/Videos/$itemId/stream?$query';
  }

  Future<AggregatedItem> _ensureFullItem(AggregatedItem item) async {
    // Items from row queries are missing fields like Overview and Chapters,
    // so always fetch the full item before persisting its metadata.
    try {
      final data = await _client.itemsApi.getItem(item.id);
      return AggregatedItem(
        id: item.id,
        serverId: item.serverId,
        rawData: data,
      );
    } catch (_) {
      if (item.mediaSources.isNotEmpty) return item;
      rethrow;
    }
  }

  Future<void> downloadItem(
    AggregatedItem item, {
    DownloadQuality quality = DownloadQuality.original,
  }) async {
    if (PlatformDetection.isWeb) {
      try {
        final fullItem = await _ensureFullItem(item);
        final url = _buildDownloadUrl(item.id, fullItem, quality);
        final fileName = _buildFileName(fullItem, quality);
        triggerBrowserDownload(url, fileName);
      } catch (e) {
        _emitError('Download failed: ${item.name} (${e.toString()})');
      }
      return;
    }
    if (_cancelAllRequested) {
      if (_canClearCancelAllGate()) {
        _cancelAllRequested = false;
      } else {
        return;
      }
    }
    // An entry with an error is a finished, failed download, so clear it and
    // let Retry start over. Anything else is genuinely in flight or complete
    // and must not be restarted.
    final existing = _activeDownloads[item.id];
    if (existing != null && existing.error == null) return;
    if (existing != null) _activeDownloads.remove(item.id);
    if (_cancelAllRequested) {
      if (_canClearCancelAllGate()) {
        _cancelAllRequested = false;
      } else {
        return;
      }
    }

    String? savePath;
    Timer? activityHeartbeat;
    String? activityPlaySessionId;
    String? activityMediaSourceId;
    var activityResumeTicks = 0;

    if (!await _checkWifiPolicy()) {
      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: item.name,
        error: 'WiFi-only mode enabled. Connect to WiFi to download.',
      );
      _emitError(
        '${item.name}: WiFi-only mode enabled. Connect to WiFi to download.',
      );
      notifyListeners();
      return;
    }

    try {
      final fullItem = await _ensureFullItem(item);
      final estimatedSize = estimateDownloadSizeBytes(fullItem, quality);
      if (!await _checkStorageLimit(estimatedSize)) {
        _activeDownloads[item.id] = DownloadProgress(
          itemId: item.id,
          fileName: item.name,
          error: 'Storage limit reached. Free up space or increase the limit.',
        );
        _emitError(
          '${item.name}: Storage limit reached. Free up space or increase the limit.',
        );
        notifyListeners();
        return;
      }
      final downloadsDir = await _storagePath.getOfflineRoot();
      final subFolder = _buildSubFolder(fullItem);
      final fileName = _buildFileName(fullItem, quality);
      late final Directory dir;
      if (PlatformDetection.isAndroid && _storagePath.isUsingMediaStore) {
        savePath = await MediaStoreService.getDownloadPath(
          fileName: fileName,
          relativePath: subFolder,
        );
        dir = File(savePath).parent;
      } else {
        dir = Directory('${downloadsDir.path}/$subFolder');
        if (!await dir.exists()) await dir.create(recursive: true);
        savePath = '${dir.path}/$fileName';
        final stale = File(savePath);
        if (await stale.exists()) await stale.delete();
      }

      await _offlineRepo.upsertItem(
        DownloadedItemsCompanion(
          itemId: Value(item.id),
          serverId: Value(item.serverId),
          type: Value(item.type ?? 'Unknown'),
          name: Value(item.name),
          metadataJson: Value(jsonEncode(fullItem.rawData)),
          downloadStatus: const Value(1),
          qualityPreset: Value(quality.name),
          seriesId: Value(item.seriesId),
          seasonId: Value(item.seasonId),
          seriesName: Value(item.seriesName),
          seasonName: Value(fullItem.rawData['SeasonName'] as String?),
          indexNumber: Value(item.indexNumber),
          parentIndexNumber: Value(item.parentIndexNumber),
          playbackPositionTicks: Value(fullItem.playbackPositionTicks ?? 0),
        ),
      );

      final cancelToken = CancelToken();
      _cancelTokens[item.id] = cancelToken;
      _downloadStartTimes[item.id] = DateTime.now();

      if (!_hasAuthToken()) {
        throw StateError(
          'Missing authentication token for download request. Please re-login and try again.',
        );
      }

      final initialProgress = _initialProgressForQuality(quality);

      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: fileName,
        progress: initialProgress,
      );
      if (!_usesPluginNotifications) {
        await _notificationService.showProgress(
          itemName: item.name,
          progress: initialProgress,
          batchTotal: _totalQueued,
          batchCompleted: _completedCount,
        );
      }
      notifyListeners();

      final reportActivity =
          quality.isTranscoded &&
          _supportsTranscodedDownload(fullItem.type) &&
          _prefs.get(UserPreferences.reportDownloadsAsActivity);
      if (reportActivity) {
        activityPlaySessionId = const Uuid().v4();
        activityMediaSourceId = _primaryMediaSourceId(fullItem);
        activityResumeTicks = fullItem.playbackPositionTicks ?? 0;
      }

      final url = _buildDownloadUrl(
        item.id,
        fullItem,
        quality,
        playSessionId: activityPlaySessionId,
      );
      final headers = _buildDownloadRequestHeaders();

      if (activityPlaySessionId != null) {
        _reportDownloadActivity(
          phase: _DownloadActivityPhase.start,
          itemId: item.id,
          mediaSourceId: activityMediaSourceId,
          playSessionId: activityPlaySessionId,
          positionTicks: activityResumeTicks,
        );
        final heartbeatSessionId = activityPlaySessionId;
        activityHeartbeat = Timer.periodic(const Duration(seconds: 10), (_) {
          _reportDownloadActivity(
            phase: _DownloadActivityPhase.progress,
            itemId: item.id,
            mediaSourceId: activityMediaSourceId,
            playSessionId: heartbeatSessionId,
            positionTicks: activityResumeTicks,
          );
        });
      }

      void onReceiveProgress(int received, int total) {
        final rawProgress = _calculateProgress(
          received: received,
          total: total,
          estimatedSize: estimatedSize,
          quality: quality,
        );
        final progress = rawProgress >= 1.0 ? 0.99 : rawProgress;
        if (progress >= 0 && progress < 0.99) {
          final lastCb = _lastCallbackProgress[item.id] ?? -1.0;
          if ((progress - lastCb) < 0.01) return;
        }
        _lastCallbackProgress[item.id] = progress;

        _activeDownloads[item.id] = DownloadProgress(
          itemId: item.id,
          fileName: fileName,
          progress: progress,
          bytesReceived: received,
        );
        if (_shouldPersistProgress(item.id, progress)) {
          unawaited(
            _offlineRepo.updateDownloadStatus(
              item.id,
              1,
              progress: _storedProgress(progress),
            ),
          );
        }
        if (!_usesPluginNotifications &&
            _shouldUpdateSystemNotification(item.id, progress)) {
          unawaited(
            _notificationService.showProgress(
              itemName: item.name,
              progress: progress,
              batchTotal: _totalQueued,
              batchCompleted: _completedCount,
            ),
          );
        }
        notifyListeners();
      }

      var usePluginEngine = _usesPluginEngine;

      Future<Response> engineDownload(String downloadUrl) async {
        if (usePluginEngine) {
          try {
            return await _downloadWithPlugin(
              downloadUrl,
              item: fullItem,
              quality: quality,
              savePath: savePath!,
              headers: headers,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );
          } on _TlsRejectedException {
            // The native engine can't accept this server's certificate,
            // typically self-signed. Remember that and fall back to the
            // legacy in-process engine, which accepts any certificate, for
            // this and all future downloads from this server.
            usePluginEngine = false;
            await _markServerNeedsLegacyTls();
          }
        }
        return _legacyEngine.downloadWithHangGuard(
          downloadUrl,
          savePath!,
          options: Options(headers: headers, method: 'GET'),
          cancelToken: cancelToken,
          estimatedSize: estimatedSize,
          onReceiveProgress: onReceiveProgress,
        );
      }

      Future<Response?> tryFallbackDownload() async {
        final fallbackUrls = _buildDownloadFallbackUrls(
          fullItem,
          primaryUrl: url,
        );

        for (final fallbackUrl in fallbackUrls) {
          try {
            final response = await engineDownload(fallbackUrl);
            return response;
          } on DioException {
            continue;
          } on TimeoutException {
            continue;
          }
        }

        return null;
      }

      Response? downloadResponse;
      try {
        downloadResponse = await engineDownload(url);
      } on DioException catch (e) {
        if (!_shouldRetryWithFallback(fullItem, quality, e)) {
          rethrow;
        }

        final fallbackResponse = await tryFallbackDownload();
        if (fallbackResponse == null) {
          rethrow;
        }
        downloadResponse = fallbackResponse;
      } on TimeoutException {
        final fallbackResponse = await tryFallbackDownload();
        if (fallbackResponse == null) {
          rethrow;
        }
        downloadResponse = fallbackResponse;
      }

      final savedFile = File(savePath);

      final currentProgress = _activeDownloads[item.id];
      final bytesReceived = currentProgress?.bytesReceived ?? 0;

      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: fileName,
        progress: 1.0,
        bytesReceived: bytesReceived,
      );
      await _offlineRepo.updateDownloadStatus(item.id, 1, progress: 1.0);
      notifyListeners();
      await _validateDownloadedFile(
        savedFile,
        quality,
        bytesReceived: bytesReceived,
        response: downloadResponse,
      );

      if (fullItem.type == 'Book') {
        final corrected = await _correctBookExtension(
          savedFile,
          downloadResponse,
        );
        if (corrected != null) {
          savePath = corrected;
        }
      }

      final finalSize = await File(savePath).length();
      await _offlineRepo.setLocalFilePath(
        item.id,
        savePath,
        fileSize: finalSize,
      );
      await _offlineRepo.updateDownloadStatus(item.id, 2);

      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: fileName,
        progress: 1.0,
        isComplete: true,
      );
      _completedCount++;
      notifyListeners();

      unawaited(
        _runPostCompletionTasks(
          item: fullItem,
          savePath: savePath,
          dir: dir,
          fileName: fileName,
        ),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel && !_isGuardTimeoutCancel(e)) {
        _activeDownloads.remove(item.id);
        final imageDir = await _storagePath.getImageCacheDir();
        if (savePath != null) {
          await _deleteFileArtifacts(savePath);
        }
        await _deleteItemImages(item.id, imageDir);
        await _offlineRepo.deleteItem(item.id);
        await _cleanupEpisodeContainers(item, imageDir);
        await _notificationService.dismiss();
      } else {
        final friendlyError = _friendlyDioError(e);
        if (savePath != null) {
          await _deleteFileArtifacts(savePath);
        }
        _activeDownloads[item.id] = DownloadProgress(
          itemId: item.id,
          fileName: item.name,
          error: friendlyError,
        );
        await _offlineRepo.updateDownloadStatus(
          item.id,
          3,
          error: friendlyError,
        );
        if (!_usesPluginNotifications) {
          await _notificationService.showError(
            itemName: item.name,
            error: friendlyError,
          );
        }
        _emitError('${item.name}: $friendlyError');
      }
    } on TimeoutException catch (e) {
      final friendlyError = _friendlyGenericError(e);
      if (savePath != null) {
        await _deleteFileArtifacts(savePath);
      }
      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: item.name,
        error: friendlyError,
      );
      await _offlineRepo.updateDownloadStatus(item.id, 3, error: friendlyError);
      if (!_usesPluginNotifications) {
        await _notificationService.showError(
          itemName: item.name,
          error: friendlyError,
        );
      }
      _emitError('${item.name}: $friendlyError');
    } catch (e) {
      final friendlyError = e is PathAccessException
          ? 'Cannot write to download folder. '
                'Please reset the download location in Settings → Downloads, '
                'or grant storage permissions.'
          : e.toString();
      if (savePath != null) {
        await _deleteFileArtifacts(savePath);
      }
      _activeDownloads[item.id] = DownloadProgress(
        itemId: item.id,
        fileName: item.name,
        error: friendlyError,
      );
      await _offlineRepo.updateDownloadStatus(item.id, 3, error: friendlyError);
      if (!_usesPluginNotifications) {
        await _notificationService.showError(
          itemName: item.name,
          error: friendlyError,
        );
      }
      _emitError('${item.name}: $friendlyError');
    } finally {
      activityHeartbeat?.cancel();
      if (activityPlaySessionId != null) {
        _reportDownloadActivity(
          phase: _DownloadActivityPhase.stop,
          itemId: item.id,
          mediaSourceId: activityMediaSourceId,
          playSessionId: activityPlaySessionId,
          positionTicks: activityResumeTicks,
        );
      }
      _downloadStartTimes.remove(item.id);
      _cancelTokens.remove(item.id);
      _lastPersistedProgress.remove(item.id);
      _lastNotifiedProgress.remove(item.id);
      _lastCallbackProgress.remove(item.id);
      notifyListeners();
    }
  }

  // Best effort reporting of a transcoded download as a server play session so
  // it shows up in the Jellyfin dashboard. This must never affect the download,
  // so every call is fire and forget and swallows its errors. The position is
  // held at the item's existing resume point across start, progress, and stop
  // so a download never moves the user's watch progress.
  void _reportDownloadActivity({
    required _DownloadActivityPhase phase,
    required String itemId,
    required String? mediaSourceId,
    required String playSessionId,
    required int positionTicks,
  }) {
    unawaited(() async {
      try {
        final api = _client.playbackApi;
        switch (phase) {
          case _DownloadActivityPhase.start:
            await api.reportPlaybackStart(
              PlaybackStartReport(
                itemId: itemId,
                mediaSourceId: mediaSourceId,
                playSessionId: playSessionId,
                playMethod: PlayMethod.transcode,
                positionTicks: positionTicks,
              ).toJson(),
            );
          case _DownloadActivityPhase.progress:
            await api.reportPlaybackProgress(
              PlaybackProgressReport(
                itemId: itemId,
                mediaSourceId: mediaSourceId,
                playSessionId: playSessionId,
                positionTicks: positionTicks,
              ).toJson(),
            );
          case _DownloadActivityPhase.stop:
            await api.reportPlaybackStopped(
              PlaybackStopReport(
                itemId: itemId,
                mediaSourceId: mediaSourceId,
                playSessionId: playSessionId,
                positionTicks: positionTicks,
              ).toJson(),
            );
        }
      } catch (_) {}
    }());
  }

  Future<void> downloadItems(
    List<AggregatedItem> items, {
    DownloadQuality quality = DownloadQuality.original,
  }) async {
    _cancelAllRequested = false;
    _totalQueued = items.length;
    _completedCount = 0;
    notifyListeners();

    for (final item in items) {
      if (_cancelAllRequested) break;
      try {
        await downloadItem(item, quality: quality);
      } catch (_) {}
    }

    _totalQueued = 0;
    _completedCount = 0;
    await _notificationService.dismiss();
    notifyListeners();
  }

  Future<List<AggregatedItem>> _getAllEpisodesForSeries(String seriesId) async {
    final seasonsData = await _client.itemsApi.getSeasons(seriesId);
    final seasons = (seasonsData['Items'] as List?) ?? [];
    final allEpisodes = <AggregatedItem>[];
    for (final season in seasons) {
      final seasonId = season['Id']?.toString() ?? '';
      final episodesData = await _client.itemsApi.getEpisodes(
        seriesId,
        seasonId: seasonId,
      );
      final episodes = (episodesData['Items'] as List?) ?? [];
      for (final raw in episodes) {
        final ep = raw as Map<String, dynamic>;
        allEpisodes.add(
          AggregatedItem(
            id: ep['Id']?.toString() ?? '',
            serverId: _client.baseUrl,
            rawData: ep,
          ),
        );
      }
    }
    return allEpisodes;
  }

  Future<void> downloadSeries(
    String seriesId, {
    DownloadQuality quality = DownloadQuality.original,
  }) async {
    final episodes = await _getAllEpisodesForSeries(seriesId);
    await downloadItems(episodes, quality: quality);
  }

  Future<void> downloadBoxSet(
    String boxSetId, {
    DownloadQuality quality = DownloadQuality.original,
  }) async {
    final playableItems = await _getAllPlayableItemsForBoxSet(boxSetId);
    await downloadItems(playableItems, quality: quality);
  }

  Future<void> downloadAlbum(
    String albumId, {
    DownloadQuality quality = DownloadQuality.original,
  }) async {
    final data = await _client.itemsApi.getItems(
      parentId: albumId,
      includeItemTypes: const ['Audio'],
      sortBy: 'ParentIndexNumber,IndexNumber,SortName',
      fields: 'MediaStreams,MediaSources,RunTimeTicks',
    );
    final rawItems = (data['Items'] as List?) ?? const [];
    final tracks = rawItems
        .whereType<Map>()
        .map((raw) => raw.cast<String, dynamic>())
        .where((raw) => (raw['Id']?.toString() ?? '').isNotEmpty)
        .map(
          (raw) => AggregatedItem(
            id: raw['Id']!.toString(),
            serverId: _client.baseUrl,
            rawData: raw,
          ),
        )
        .toList();
    await downloadItems(tracks, quality: quality);
  }

  Future<List<AggregatedItem>> _getAllPlayableItemsForBoxSet(
    String boxSetId,
  ) async {
    try {
      final data = await _client.itemsApi.getItems(
        parentId: boxSetId,
        recursive: true,
        includeItemTypes: const ['Episode', 'Movie', 'Video', 'Audio'],
        fields: 'MediaStreams,MediaSources,RunTimeTicks,Trickplay',
      );
      final rawItems = data['Items'] as List?;
      if (rawItems == null) return const [];
      final serverId = _client.baseUrl;
      return rawItems
          .whereType<Map>()
          .map((raw) => raw.cast<String, dynamic>())
          .where((raw) {
            final id = raw['Id']?.toString();
            return id != null && id.isNotEmpty;
          })
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: serverId,
              rawData: raw,
            ),
          )
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<bool> deleteDownloadedItems(List<AggregatedItem> items) async {
    var allSucceeded = true;
    final seenIds = <String>{};

    for (final item in items) {
      if (!seenIds.add(item.id)) {
        continue;
      }

      final succeeded = await deleteDownloadedFiles(item);
      if (!succeeded) {
        allSucceeded = false;
      }
    }

    return allSucceeded;
  }

  Future<bool> deleteDownloadedFiles(AggregatedItem item) async {
    // Drop any finished (complete or errored) active entry so a fresh
    // downloadItem call isn't blocked by stale in-memory state.
    final active = _activeDownloads[item.id];
    if (active != null && (active.isComplete || active.error != null)) {
      _activeDownloads.remove(item.id);
    }
    try {
      final downloadsDir = await _storagePath.getOfflineRoot();
      final subFolder = _buildSubFolder(item);
      final targetDir = Directory('${downloadsDir.path}/$subFolder');
      final imageDir = await _storagePath.getImageCacheDir();

      switch (item.type) {
        case 'Movie':
          if (await targetDir.exists()) await targetDir.delete(recursive: true);
          await _deleteItemImages(item.id, imageDir);
          await _offlineRepo.deleteItem(item.id);
          return true;

        case 'Episode':
          await _deleteCandidateFileArtifacts(targetDir, item, downloadsDir);
          await _deleteItemImages(item.id, imageDir);
          await _offlineRepo.deleteItem(item.id);
          await _cleanupEpisodeContainers(item, imageDir);
          return true;

        case 'Audio':
        case 'AudioBook':
        case 'Book':
          await _deleteCandidateFileArtifacts(targetDir, item, downloadsDir);
          await _deleteItemImages(item.id, imageDir);
          await _offlineRepo.deleteItem(item.id);
          return true;

        case 'Season':
          final seasonImageIds = await _relatedImageIds(item);
          if (await targetDir.exists()) {
            await targetDir.delete(recursive: true);
            final seriesDir = targetDir.parent;
            if (await seriesDir.exists()) {
              final remaining = await seriesDir.list().length;
              if (remaining == 0) await seriesDir.delete();
            }
          }
          await _deleteImagesForIds(seasonImageIds, imageDir);
          await _offlineRepo.deleteSeasonItems(item.id);
          return true;

        case 'Series':
          final seriesImageIds = await _relatedImageIds(item);
          final seriesName = _sanitizePath(item.seriesName ?? item.name);
          final seriesDir = Directory('${downloadsDir.path}/TV/$seriesName');
          if (await seriesDir.exists()) await seriesDir.delete(recursive: true);
          await _deleteImagesForIds(seriesImageIds, imageDir);
          await _offlineRepo.deleteSeriesItems(item.id);
          return true;

        default:
          final defaultDir = Directory(
            '${downloadsDir.path}/Other/${_sanitizePath(item.name)}',
          );
          if (await defaultDir.exists())
            await defaultDir.delete(recursive: true);
          await _deleteItemImages(item.id, imageDir);
          await _offlineRepo.deleteItem(item.id);
          return true;
      }
    } catch (_) {
      return false;
    }
  }

  Future<void> _deleteItemImages(String itemId, Directory imageDir) async {
    final dir = Directory('${imageDir.path}/$itemId');
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  Future<bool> hasDownloadedFiles(AggregatedItem item) async {
    return _offlineRepo.isAvailableOffline(item.id);
  }

  Future<void> _downloadLyrics(AggregatedItem item) async {
    try {
      final data = await _client.itemsApi.getLyrics(item.id);
      final lyrics = data['Lyrics'] as List?;
      if (lyrics == null || lyrics.isEmpty) return;
      final imageDir = await _storagePath.getImageCacheDir();
      final itemDir = Directory('${imageDir.path}/${item.id}');
      if (!await itemDir.exists()) await itemDir.create(recursive: true);
      await File('${itemDir.path}/lyrics.json').writeAsString(jsonEncode(data));
    } catch (_) {}
  }

  Future<void> _downloadImages(AggregatedItem item) async {
    try {
      final imageDir = await _storagePath.getImageCacheDir();
      final itemDir = Directory('${imageDir.path}/${item.id}');
      if (!await itemDir.exists()) await itemDir.create(recursive: true);

      final authOptions = Options(headers: _buildAuthHeaders());
      String? posterPath, backdropPath, logoPath, thumbPath;

      // Fall back to album, series, or parent art so tracks and episodes
      // still get a poster offline.
      String? posterItemId, posterTag;
      if (item.primaryImageTag != null) {
        posterItemId = item.id;
        posterTag = item.primaryImageTag;
      } else if (item.albumId != null && item.albumPrimaryImageTag != null) {
        posterItemId = item.albumId;
        posterTag = item.albumPrimaryImageTag;
      } else if (item.seriesId != null && item.seriesPrimaryImageTag != null) {
        posterItemId = item.seriesId;
        posterTag = item.seriesPrimaryImageTag;
      } else if (item.parentPrimaryImageItemId != null &&
          item.parentPrimaryImageTag != null) {
        posterItemId = item.parentPrimaryImageItemId;
        posterTag = item.parentPrimaryImageTag;
      }
      if (posterItemId != null) {
        final url = _client.imageApi.getPrimaryImageUrl(
          posterItemId,
          maxHeight: 500,
          tag: posterTag,
        );
        posterPath = '${itemDir.path}/poster.jpg';
        try {
          await _downloadDio.download(url, posterPath, options: authOptions);
        } catch (_) {
          posterPath = null;
        }
      }

      if (item.backdropImageTags.isNotEmpty) {
        final url = _client.imageApi.getBackdropImageUrl(
          item.id,
          maxWidth: 1920,
          tag: item.backdropImageTags.first,
        );
        backdropPath = '${itemDir.path}/backdrop.jpg';
        try {
          await _downloadDio.download(url, backdropPath, options: authOptions);
        } catch (_) {
          backdropPath = null;
        }
      } else if (item.parentBackdropItemId != null &&
          item.parentBackdropImageTags.isNotEmpty) {
        final url = _client.imageApi.getBackdropImageUrl(
          item.parentBackdropItemId!,
          maxWidth: 1920,
          tag: item.parentBackdropImageTags.first,
        );
        backdropPath = '${itemDir.path}/backdrop.jpg';
        try {
          await _downloadDio.download(url, backdropPath, options: authOptions);
        } catch (_) {
          backdropPath = null;
        }
      }

      String? logoItemId, logoTag;
      if (item.logoImageTag != null) {
        logoItemId = item.id;
        logoTag = item.logoImageTag;
      } else if (item.seriesLogoImageTag != null) {
        final parentLogoItemId = item.rawData['ParentLogoItemId']?.toString();
        if (parentLogoItemId != null) {
          logoItemId = parentLogoItemId;
          logoTag = item.seriesLogoImageTag;
        }
      }
      if (logoItemId != null) {
        final url = _client.imageApi.getLogoImageUrl(
          logoItemId,
          maxWidth: 500,
          tag: logoTag,
        );
        logoPath = '${itemDir.path}/logo.png';
        try {
          await _downloadDio.download(url, logoPath, options: authOptions);
        } catch (_) {
          logoPath = null;
        }
      }

      String? thumbItemId, thumbTag;
      if (item.thumbImageTag != null) {
        thumbItemId = item.id;
        thumbTag = item.thumbImageTag;
      } else if (item.parentThumbItemId != null &&
          item.parentThumbImageTag != null) {
        thumbItemId = item.parentThumbItemId;
        thumbTag = item.parentThumbImageTag;
      }
      if (thumbItemId != null) {
        final url = _client.imageApi.getThumbImageUrl(
          thumbItemId,
          maxWidth: 1280,
          tag: thumbTag,
        );
        thumbPath = '${itemDir.path}/thumb.jpg';
        try {
          await _downloadDio.download(url, thumbPath, options: authOptions);
        } catch (_) {
          thumbPath = null;
        }
      }

      await _offlineRepo.setImagePaths(
        item.id,
        poster: posterPath,
        backdrop: backdropPath,
        logo: logoPath,
        thumb: thumbPath,
      );
    } catch (_) {}
  }

  Future<void> _ensureParentContainers(AggregatedItem episode) async {
    if (episode.type == 'Audio' || episode.type == 'AudioBook') {
      await _ensureAlbumContainer(episode);
      return;
    }
    if (episode.type != 'Episode') return;

    if (episode.seriesId != null) {
      final existing = await _offlineRepo.getItem(episode.seriesId!);
      if (existing == null) {
        try {
          final seriesData = await _client.itemsApi.getItem(episode.seriesId!);
          final seriesItem = AggregatedItem(
            id: episode.seriesId!,
            serverId: episode.serverId,
            rawData: seriesData,
          );
          await _offlineRepo.upsertItem(
            DownloadedItemsCompanion(
              itemId: Value(episode.seriesId!),
              serverId: Value(episode.serverId),
              type: const Value('Series'),
              name: Value(seriesItem.name),
              metadataJson: Value(jsonEncode(seriesData)),
              downloadStatus: const Value(2),
              seriesName: Value(seriesItem.name),
            ),
          );
          _downloadImages(seriesItem);
        } catch (_) {}
      }
    }

    if (episode.seasonId != null) {
      final existing = await _offlineRepo.getItem(episode.seasonId!);
      if (existing == null) {
        try {
          final seasonData = await _client.itemsApi.getItem(episode.seasonId!);
          final seasonItem = AggregatedItem(
            id: episode.seasonId!,
            serverId: episode.serverId,
            rawData: seasonData,
          );
          await _offlineRepo.upsertItem(
            DownloadedItemsCompanion(
              itemId: Value(episode.seasonId!),
              serverId: Value(episode.serverId),
              type: const Value('Season'),
              name: Value(seasonItem.name),
              metadataJson: Value(jsonEncode(seasonData)),
              downloadStatus: const Value(2),
              seriesId: Value(episode.seriesId),
              seriesName: Value(episode.seriesName),
              seasonName: Value(seasonItem.name),
            ),
          );
          _downloadImages(seasonItem);
        } catch (_) {}
      }
    }
  }

  /// Creates a lightweight MusicAlbum container row (with images) so album
  /// groupings render offline, mirroring the Series/Season containers.
  Future<void> _ensureAlbumContainer(AggregatedItem track) async {
    final albumId = track.albumId;
    if (albumId == null || albumId.isEmpty) return;
    final existing = await _offlineRepo.getItem(albumId);
    if (existing != null) return;
    try {
      final albumData = await _client.itemsApi.getItem(albumId);
      final albumItem = AggregatedItem(
        id: albumId,
        serverId: track.serverId,
        rawData: albumData,
      );
      await _offlineRepo.upsertItem(
        DownloadedItemsCompanion(
          itemId: Value(albumId),
          serverId: Value(track.serverId),
          type: Value(albumItem.type ?? 'MusicAlbum'),
          name: Value(albumItem.name),
          metadataJson: Value(jsonEncode(albumData)),
          downloadStatus: const Value(2),
        ),
      );
      _downloadImages(albumItem);
    } catch (_) {}
  }

  Future<void> _downloadExternalSubtitles(
    AggregatedItem item,
    Directory dir,
    String fileNameBase,
  ) async {
    final mediaSources = item.mediaSources;
    if (mediaSources.isEmpty) return;
    final source = mediaSources.first;
    final mediaSourceId = source['Id']?.toString() ?? item.id;
    final streams = (source['MediaStreams'] as List?) ?? [];
    final authOptions = Options(headers: _buildAuthHeaders());
    for (final stream in streams) {
      if (stream is! Map<String, dynamic>) continue;
      if (stream['Type'] != 'Subtitle') continue;
      final isExternal = stream['IsExternal'] == true;
      final supportsExternal = stream['SupportsExternalStream'] == true;
      if (!isExternal && !supportsExternal) continue;
      final index = stream['Index'] as int? ?? 0;
      final ext = canonicalSubtitleCodec(stream['Codec'] as String?);
      // DeliveryUrl is computed by the server during PlaybackInfo and is often
      // absent from the plain item metadata. Fall back to the stable subtitle
      // stream endpoint so offline downloads match the streaming path.
      var deliveryUrl = stream['DeliveryUrl'] as String?;
      if (deliveryUrl == null || deliveryUrl.isEmpty) {
        deliveryUrl =
            '/Videos/${item.id}/$mediaSourceId/Subtitles/$index/0/Stream.$ext';
      }
      final subUrl = deliveryUrl.startsWith('http')
          ? deliveryUrl
          : '${_client.baseUrl}$deliveryUrl';
      final subPath = '${dir.path}/${fileNameBase}_sub_$index.$ext';
      try {
        await _downloadDio.download(subUrl, subPath, options: authOptions);
      } catch (_) {}
    }
  }

  void cancelDownload(String itemId) {
    _cancelTokens[itemId]?.cancel();
  }

  void cancelAll() {
    _cancelAllRequested = true;
    for (final token in _cancelTokens.values) {
      token.cancel();
    }
    _cancelTokens.clear();
    if (_pluginEngineSupported) {
      // Also cancels media-group tasks with no live context (adopted from a
      // previous run or pre-server-switch).
      unawaited(
        bgd.FileDownloader()
            .cancelAll(group: BackgroundDownloadCoordinator.mediaGroup)
            .then((_) {}, onError: (_) {}),
      );
    }
    _totalQueued = 0;
    _completedCount = 0;
    _notificationService.dismiss();
    notifyListeners();
  }

  Future<void> clearAllDownloads() async {
    cancelAll();

    final allItems = await _offlineRepo.getItems();
    for (final item in allItems) {
      final path = item.localFilePath;
      if (path == null || path.isEmpty) {
        continue;
      }

      try {
        final f = File(path);
        if (await f.exists()) {
          await f.delete();
        }
      } catch (_) {}
    }

    final offlineRoot = await _storagePath.getOfflineRoot();
    const managedFolders = [
      'Movies',
      'TV',
      'Music',
      'Music Videos',
      'Audiobooks',
      'Books',
      'Other',
      'images',
    ];

    for (final folder in managedFolders) {
      final dir = Directory('${offlineRoot.path}/$folder');
      try {
        if (await dir.exists()) {
          await dir.delete(recursive: true);
        }
      } catch (_) {}
    }

    await _offlineRepo.deleteAllItems();
    _activeDownloads.clear();
    _cancelTokens.clear();
    _downloadStartTimes.clear();
    _totalQueued = 0;
    _completedCount = 0;
    await _notificationService.dismiss();
    notifyListeners();
  }

  Future<void> recoverIncompleteDownloads() async {
    // Reconcile with the native engine's task database first: tasks may have
    // finished while the app was dead, still be running natively, or have
    // been rescheduled by the plugin at startup.
    var pluginRecords = <String, bgd.TaskRecord>{};
    if (_pluginEngineSupported) {
      try {
        await _coordinator!.ensureInitialized();
        final records = await bgd.FileDownloader().database.allRecords(
          group: BackgroundDownloadCoordinator.mediaGroup,
        );
        pluginRecords = {
          for (final record in records)
            if (_itemIdForTask(record.task) != null)
              _itemIdForTask(record.task)!: record,
        };
      } catch (_) {}
    }

    final allItems = await _offlineRepo.getItems();

    for (final item in allItems) {
      if (item.downloadStatus == 1) {
        final record = pluginRecords[item.itemId];
        if (record != null && await _recoverFromTaskRecord(item, record)) {
          continue;
        }
        if (item.localFilePath != null) {
          final file = File(item.localFilePath!);
          if (await file.exists()) await file.delete();
        }
        if (item.metadataJson.isNotEmpty) {
          final qualityName = item.qualityPreset;
          final quality = DownloadQuality.values.firstWhere(
            (q) => q.name == qualityName,
            orElse: () => DownloadQuality.original,
          );
          final isStatic = !quality.isTranscoded;
          if (isStatic) {
            await _offlineRepo.updateDownloadStatus(item.itemId, 0);
          } else {
            await _offlineRepo.updateDownloadStatus(
              item.itemId,
              3,
              error: 'Interrupted. Transcoded downloads cannot be resumed.',
            );
          }
        } else {
          await _offlineRepo.updateDownloadStatus(
            item.itemId,
            3,
            error: 'Interrupted',
          );
        }
      } else if (item.downloadStatus == 2) {
        if (item.localFilePath != null) {
          final file = File(item.localFilePath!);
          if (!await file.exists()) {
            await _offlineRepo.updateDownloadStatus(
              item.itemId,
              3,
              error: 'File missing from disk',
            );
          }
        }
      }
    }
  }

  /// Resolves an in-progress drift row against its native task record.
  /// Returns true when the record fully determined the outcome, or false to
  /// fall through to the interrupted-download handling.
  Future<bool> _recoverFromTaskRecord(
    DownloadedItem row,
    bgd.TaskRecord record,
  ) async {
    switch (record.status) {
      case bgd.TaskStatus.complete:
        await _finalizeUnattendedDownload(row.itemId, record.task);
        return true;
      case bgd.TaskStatus.enqueued:
      case bgd.TaskStatus.running:
      case bgd.TaskStatus.paused:
      case bgd.TaskStatus.waitingToRetry:
        _adoptRunningTask(row, record);
        return true;
      case bgd.TaskStatus.failed:
      case bgd.TaskStatus.notFound:
        final savePath = _savePathForTask(record.task);
        if (savePath != null) {
          try {
            await _deleteFileArtifacts(savePath);
          } catch (_) {}
        }
        await _offlineRepo.updateDownloadStatus(
          row.itemId,
          3,
          error: record.exception?.description ?? 'Download failed',
        );
        await bgd.FileDownloader().database.deleteRecordWithId(
          record.task.taskId,
        );
        return true;
      case bgd.TaskStatus.canceled:
        await bgd.FileDownloader().database.deleteRecordWithId(
          record.task.taskId,
        );
        return false;
    }
  }

  /// Re-attaches in-memory state to a native task that is still alive
  /// (running, enqueued, or rescheduled by the plugin at startup), so its
  /// progress shows in the UI and its completion is finalized.
  void _adoptRunningTask(DownloadedItem row, bgd.TaskRecord record) {
    final itemId = row.itemId;
    if (_pluginContexts.containsKey(itemId)) return;
    final savePath = _savePathForTask(record.task);
    if (savePath == null) {
      // Without a save path the context can't validate or finalize, so
      // completion is handled by _handleUnattendedTaskUpdate instead.
      return;
    }
    final quality = DownloadQuality.values.firstWhere(
      (q) => q.name == row.qualityPreset,
      orElse: () => DownloadQuality.original,
    );
    final fileName = p.basename(savePath);

    final ctx = _MediaDownloadContext(
      itemId: itemId,
      displayName: row.name,
      quality: quality,
      savePath: savePath,
      onReceiveProgress: (received, total) {
        final rawProgress = _calculateProgress(
          received: received,
          total: total,
          estimatedSize: 0,
          quality: quality,
        );
        final progress = rawProgress >= 1.0 ? 0.99 : rawProgress;
        _activeDownloads[itemId] = DownloadProgress(
          itemId: itemId,
          fileName: fileName,
          progress: progress,
          bytesReceived: received,
        );
        if (_shouldPersistProgress(itemId, progress)) {
          unawaited(
            _offlineRepo.updateDownloadStatus(
              itemId,
              1,
              progress: _storedProgress(progress),
            ),
          );
        }
        notifyListeners();
      },
    );
    ctx.currentTaskId = record.task.taskId;
    _pluginContexts[itemId] = ctx;

    final cancelToken = CancelToken();
    _cancelTokens[itemId] = cancelToken;
    cancelToken.whenCancel
        .then((_) => bgd.FileDownloader().cancelTaskWithId(ctx.currentTaskId))
        .ignore();

    _activeDownloads[itemId] = DownloadProgress(
      itemId: itemId,
      fileName: fileName,
      progress: record.progress > 0 && record.progress <= 1
          ? record.progress
          : _initialProgressForQuality(quality),
    );
    notifyListeners();

    ctx.completer.future
        .then((_) async {
          _pluginContexts.remove(itemId);
          _cancelTokens.remove(itemId);
          try {
            await _persistCompletedFile(itemId, savePath, quality);
            _activeDownloads[itemId] = DownloadProgress(
              itemId: itemId,
              fileName: fileName,
              progress: 1.0,
              isComplete: true,
            );
          } catch (e) {
            try {
              await _deleteFileArtifacts(savePath);
            } catch (_) {}
            await _offlineRepo.updateDownloadStatus(
              itemId,
              3,
              error: e.toString(),
            );
            _activeDownloads[itemId] = DownloadProgress(
              itemId: itemId,
              fileName: fileName,
              error: e.toString(),
            );
          }
          notifyListeners();
        })
        .catchError((Object e) async {
          _pluginContexts.remove(itemId);
          _cancelTokens.remove(itemId);
          if (e is DioException && e.type == DioExceptionType.cancel) {
            _activeDownloads.remove(itemId);
            try {
              await _deleteFileArtifacts(savePath);
            } catch (_) {}
            await _offlineRepo.deleteItem(itemId);
          } else {
            final message = e is DioException
                ? _friendlyDioError(e)
                : e.toString();
            try {
              await _deleteFileArtifacts(savePath);
            } catch (_) {}
            await _offlineRepo.updateDownloadStatus(itemId, 3, error: message);
            _activeDownloads[itemId] = DownloadProgress(
              itemId: itemId,
              fileName: fileName,
              error: message,
            );
            _emitError('${row.name}: $message');
          }
          notifyListeners();
        });
  }

  @override
  void dispose() {
    _coordinator?.detach(statusHandler: _onTaskStatus);
    cancelAll();
    _downloadDio.close();
    _errorController.close();
    super.dispose();
  }
}
