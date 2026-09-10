import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/offline/connectivity_aware_media_server_client.dart';
import '../../data/offline/offline_catalog.dart';
import '../../data/repositories/offline_repository.dart';
import '../../data/services/pending_rating_store.dart';
import '../../data/services/auto_download_service.dart';
import '../../data/services/background_download_coordinator.dart';
import '../../data/services/download_notification_service.dart';
import '../../data/services/download_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../data/services/push_messaging_service.dart';
import '../../data/services/seerr_notification_service.dart';
import '../../data/services/socket_handler.dart';
import '../../data/services/storage_path_service.dart';
import '../../platform/auto_download_background_binding.dart';
import '../../playback/server_transcode_capabilities.dart';
import '../../util/download_grouping.dart' show downloadNotificationLabel;
import '../../util/download_utils.dart' show formatBytes;
import '../../preference/user_preferences.dart';

final _getIt = GetIt.instance;

// Keeps the platform's background task in step with the signed-in
// account's auto-download service; null between accounts.
AutoDownloadBackgroundBinding? _autoDownloadBinding;

void registerServerModule() {
  _getIt.registerLazySingleton<MediaServerClientFactory>(
    () => MediaServerClientFactory(deviceInfo: _getIt<DeviceInfo>()),
  );

  if (!_getIt.isRegistered<DownloadNotificationService>()) {
    _getIt.registerLazySingleton<DownloadNotificationService>(
      () => DownloadNotificationService(),
    );
  }

  // App-lifetime: owns the background_downloader singleton across server
  // switches, while DownloadService instances attach/detach to it.
  if (!_getIt.isRegistered<BackgroundDownloadCoordinator>()) {
    _getIt.registerLazySingleton<BackgroundDownloadCoordinator>(
      () => BackgroundDownloadCoordinator(_getIt<UserPreferences>()),
    );
  }

  if (!_getIt.isRegistered<SeerrNotificationService>()) {
    _getIt.registerLazySingleton<SeerrNotificationService>(
      () => SeerrNotificationService(),
    );
  }

  if (!_getIt.isRegistered<PushMessagingService>()) {
    _getIt.registerLazySingleton<PushMessagingService>(
      () => PushMessagingService(),
    );
  }

  if (!_getIt.isRegistered<ServerTranscodeCapabilities>()) {
    _getIt.registerLazySingleton<ServerTranscodeCapabilities>(
      () => ServerTranscodeCapabilities(),
    );
  }
}

/// [background] marks a headless engine (the Android auto-download worker):
/// it runs one check and never schedules, so it gets no scheduling binding.
void setActiveServerClient(
  MediaServerClient client, {
  bool background = false,
}) {
  // The raw client keeps serving downloads, playback, and sockets, while the
  // registered singleton is a wrapper that answers browse and read calls from
  // the downloads catalog whenever the server is unreachable.
  final rawClient = client is ConnectivityAwareMediaServerClient
      ? client.onlineClient
      : client;
  final wrapped = ConnectivityAwareMediaServerClient(
    rawClient,
    useOffline: shouldUseOfflineCatalog,
    catalog: _getIt<OfflineCatalog>(),
    storagePath: _getIt<StoragePathService>(),
    pendingRatings: _getIt<PendingRatingStore>(),
    offlineRepo: _getIt<OfflineRepository>(),
  );

  if (_getIt.isRegistered<MediaServerClient>()) {
    _getIt.unregister<MediaServerClient>();
  }
  _getIt.registerSingleton<MediaServerClient>(wrapped);

  if (_getIt.isRegistered<DownloadService>()) {
    // Detach the replaced instance's app-lifetime listeners (preferences,
    // download coordinator); its in-flight downloads keep running.
    _getIt<DownloadService>().detachFromGlobalState();
    _getIt.unregister<DownloadService>();
  }
  final downloadService = DownloadService(
    rawClient,
    _getIt<DownloadNotificationService>(),
  );
  _getIt.registerSingleton<DownloadService>(downloadService);

  if (AutoDownloadService.isSupportedPlatform) {
    _replaceAutoDownloadService(
      rawClient,
      downloadService,
      background: background,
    );
  } else {
    downloadService.recoverIncompleteDownloads();
  }

  // Fire and forget: device profiles read the cached result and fall back to
  // the H264-only transcode offer until the probe lands.
  _getIt<ServerTranscodeCapabilities>().refresh(rawClient);
}

/// Sign-out: nobody is left to check for, so the auto-download service goes
/// and the background task is cancelled. Downloads already in flight keep
/// running on the download service, which stays registered.
void clearAutoDownloadForSignOut() => _tearDownAutoDownload(disable: true);

void _tearDownAutoDownload({required bool disable}) {
  _autoDownloadBinding?.detach(disable: disable);
  _autoDownloadBinding = null;
  if (_getIt.isRegistered<AutoDownloadService>()) {
    _getIt<AutoDownloadService>().dispose();
    _getIt.unregister<AutoDownloadService>();
  }
}

/// The auto-download service of the signed-in account, on platforms that
/// have the feature; nothing is registered elsewhere, so "registered" means
/// "available" for every caller. Replaced when the account changes.
void _replaceAutoDownloadService(
  MediaServerClient client,
  DownloadService downloadService, {
  required bool background,
}) {
  _tearDownAutoDownload(disable: false);
  if (!AutoDownloadService.isSupportedPlatform) return;

  // Recovery reconciles the native task database; checks wait for it so
  // they see those transfers as in flight.
  final recovered = downloadService.recoverIncompleteDownloads();
  final service = AutoDownloadService(
    repository: _getIt<OfflineRepository>(),
    downloader: downloadService,
    prefs: _getIt<UserPreferences>(),
    serverId: _getIt<MediaServerClientFactory>().serverIdOf(client),
    userId: client.userId ?? '',
    socketEvents: _getIt.isRegistered<SocketHandler>()
        ? _getIt<SocketHandler>().events
        : null,
    ready: recovered,
    playingItemId: _playingItemId,
    onStorageFull: _notifyStorageFull,
  )..start();
  _getIt.registerSingleton<AutoDownloadService>(service);
  if (!background) {
    _autoDownloadBinding = AutoDownloadBackgroundBinding(
      service: service,
      prefs: _getIt<UserPreferences>(),
    )..attach();
  }

  unawaited(
    recovered.whenComplete(() {
      // The account may have changed again while recovery ran.
      if (!service.isDisposed) service.onServerConnected();
    }),
  );
}

void _notifyStorageFull(List<BlockedEpisode> blocked) {
  final first = blocked.first.episode;
  unawaited(
    _getIt<DownloadNotificationService>().showStorageFull(
      count: blocked.length,
      firstLabel: downloadNotificationLabel(
        name: first.name,
        seriesName: first.seriesName,
        season: first.parentIndexNumber,
        episode: first.indexNumber,
      ),
      firstSize: formatBytes(blocked.first.bytes),
    ),
  );
}

String? _playingItemId() {
  if (!_getIt.isRegistered<PlaybackManager>()) return null;
  final current = _getIt<PlaybackManager>().queueService.currentItem;
  return current is AggregatedItem ? current.id : null;
}
