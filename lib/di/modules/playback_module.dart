import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/repositories/offline_repository.dart';
import '../../data/services/audiobook_bookmarks_service.dart';
import '../../data/services/audiobook_notes_service.dart';
import '../../data/services/audiobook_resume_service.dart';
import '../../data/services/connectivity_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../data/services/offline_playback_tracker.dart';
import '../../playback/local_aware_player_service.dart';
import '../../playback/local_first_media_stream_resolver.dart';

import '../../playback/hdr_stream_capability.dart';
import '../../playback/headless_session_bootstrap.dart';
import '../../playback/last_playback_session_store.dart';
import '../../playback/media_browse_service.dart';
import '../../playback/html_video_backend.dart';
import '../../playback/known_defects.dart';
import '../../playback/external_player_policy.dart';
import '../../playback/appletv_mpv_backend.dart';
import '../../playback/media_kit_player_backend.dart';
import '../../playback/media3_player_backend.dart';
import '../../playback/tizen_player_backend.dart';
import '../../playback/offline_stream_resolver.dart';
import '../../playback/playback_profile_diagnostics.dart';
import '../../playback/sleep_timer_controller.dart';
import '../../platform/pip_service.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../syncplay/syncplay_manager.dart';
import '../../util/platform_detection.dart';
import '../../util/episode_playability.dart';
import '../../util/audio_track_logic.dart';
import '../../util/subtitle_track_logic.dart';

final _getIt = GetIt.instance;

const _nextSeasonEpisodeFields =
    'Type,UserData,SeriesName,ParentIndexNumber,IndexNumber,SeriesId,SeasonId,'
    'MediaSources,MediaStreams,RunTimeTicks,Chapters';

bool _isDolbyVisionResolution(StreamResolutionResult resolution) {
  for (final stream in resolution.mediaStreams) {
    if (HdrStreamCapability.isDolbyVisionVideoStream(stream)) {
      return true;
    }
  }
  return false;
}

bool _shouldUseHtmlVideoBackend(StreamResolutionResult resolution) {
  if (!PlatformDetection.isWeb) {
    return false;
  }

  final mediaType = resolution.mediaType.trim().toLowerCase();
  if (mediaType != 'video') {
    return false;
  }

  return true;
}

bool _hasUnsupportedDolbyVisionProfile(StreamResolutionResult resolution) {
  final prefs = _getIt<UserPreferences>();
  final allowDolbyVisionProfile7ElDirectPlay =
      KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
        behavior: prefs.get(
          UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
        ),
      );
  for (final stream in resolution.mediaStreams) {
    if (HdrStreamCapability.streamNeedsDolbyVisionProfileTranscode(
      stream,
      allowDolbyVisionProfile7ElDirectPlay:
          allowDolbyVisionProfile7ElDirectPlay,
    )) {
      return true;
    }
  }
  return false;
}

bool _isEpisodeQueueItem(AggregatedItem item) {
  final type = item.type?.trim().toLowerCase();
  return type == 'episode';
}

List<String> _passthroughCodecsForDiagnostics(UserPreferences prefs) {
  if (prefs.resolveAudioOutputMode() == AudioOutputMode.forceStereo) {
    return const <String>[];
  }

  final codecs = <String>[];
  if (prefs.resolveAc3PassthroughEnabled()) {
    codecs.add('ac3');
  }
  if (prefs.resolveEac3PassthroughEnabled() ||
      prefs.resolveEac3JocPassthroughEnabled()) {
    codecs.add('eac3');
  }
  if (prefs.resolveDtsHdPassthroughEnabled()) {
    codecs.add('dts-hd');
  } else if (prefs.resolveDtsCorePassthroughEnabled()) {
    codecs.add('dts');
  }
  if (prefs.resolveTrueHdPassthroughEnabled() ||
      prefs.resolveTrueHdAtmosPassthroughEnabled()) {
    codecs.add('truehd');
  }
  return codecs;
}

MediaServerClient? _resolveClientForServerId(String serverId) {
  final factory = _getIt<MediaServerClientFactory>();
  final direct = factory.getClientIfExists(serverId);
  if (direct != null) return direct;

  if (factory.clients.length == 1) {
    return factory.clients.values.first;
  }

  return null;
}

int? _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

bool _isSingleSeasonEpisodeQueue(
  List<dynamic> queueItems, {
  required String seriesId,
  required String seasonId,
  required int seasonNumber,
}) {
  if (queueItems.isEmpty) return false;

  for (final item in queueItems) {
    if (item is! AggregatedItem) return false;
    if (!_isEpisodeQueueItem(item)) return false;
    if (item.seriesId != seriesId) return false;

    final itemSeasonId = item.seasonId;
    if (itemSeasonId != null && itemSeasonId.isNotEmpty) {
      if (itemSeasonId != seasonId) return false;
      continue;
    }

    if (item.parentIndexNumber != seasonNumber) return false;
  }

  return true;
}

List<AggregatedItem> _mapServerItemsToAggregated(
  List<dynamic> items,
  String serverId,
) {
  return items
      .whereType<Map<String, dynamic>>()
      .map((raw) {
        final id = raw['Id']?.toString();
        if (id == null || id.isEmpty) {
          return null;
        }
        return AggregatedItem(id: id, serverId: serverId, rawData: raw);
      })
      .whereType<AggregatedItem>()
      .toList(growable: false);
}

List<AggregatedItem> _sortEpisodesForPlayback(List<AggregatedItem> episodes) {
  final sorted = List<AggregatedItem>.from(episodes);
  sorted.sort((a, b) {
    final seasonCmp = (a.parentIndexNumber ?? 0).compareTo(
      b.parentIndexNumber ?? 0,
    );
    if (seasonCmp != 0) return seasonCmp;
    final episodeCmp = (a.indexNumber ?? 0).compareTo(b.indexNumber ?? 0);
    if (episodeCmp != 0) return episodeCmp;
    return a.id.compareTo(b.id);
  });
  return sorted;
}

bool _isSeasonFinale(
  AggregatedItem completedItem,
  List<AggregatedItem> seasonEpisodes,
) {
  if (seasonEpisodes.isEmpty) return false;

  final completedId = completedItem.id;
  if (seasonEpisodes.last.id == completedId) return true;

  if (seasonEpisodes.any((episode) => episode.id == completedId)) {
    return false;
  }

  final completedIndex = completedItem.indexNumber;
  if (completedIndex == null) return false;

  int? maxEpisodeIndex;
  for (final episode in seasonEpisodes) {
    final idx = episode.indexNumber;
    if (idx == null) continue;
    if (maxEpisodeIndex == null || idx > maxEpisodeIndex) {
      maxEpisodeIndex = idx;
    }
  }

  return maxEpisodeIndex != null && completedIndex >= maxEpisodeIndex;
}

Future<List<AggregatedItem>> _fetchSeasonEpisodes({
  required MediaServerClient client,
  required String serverId,
  required String seriesId,
  required String seasonId,
}) async {
  final data = await client.itemsApi.getEpisodes(
    seriesId,
    seasonId: seasonId,
    fields: _nextSeasonEpisodeFields,
  );
  final rawItems = (data['Items'] as List?) ?? const [];
  final episodes = _mapServerItemsToAggregated(rawItems, serverId);
  return _sortEpisodesForPlayback(episodes);
}

Future<String?> _resolveNextSeasonId({
  required MediaServerClient client,
  required String seriesId,
  required int currentSeasonNumber,
}) async {
  final seasonsData = await client.itemsApi.getSeasons(seriesId);
  final seasonItems = (seasonsData['Items'] as List?) ?? const [];

  int? bestSeasonNumber;
  String? bestSeasonId;
  for (final raw in seasonItems.whereType<Map<String, dynamic>>()) {
    final candidateId = raw['Id']?.toString();
    if (candidateId == null || candidateId.isEmpty) continue;

    final candidateNumber = _asInt(
      raw['IndexNumber'] ?? raw['ParentIndexNumber'],
    );
    if (candidateNumber == null || candidateNumber <= currentSeasonNumber) {
      continue;
    }

    if (bestSeasonNumber == null || candidateNumber < bestSeasonNumber) {
      bestSeasonNumber = candidateNumber;
      bestSeasonId = candidateId;
    }
  }

  return bestSeasonId;
}

Future<List<dynamic>> _nextSeasonItemsProvider(
  dynamic completedItem,
  List<dynamic> queueItems,
  int _,
) async {
  if (completedItem is! AggregatedItem) return const <dynamic>[];
  if (!_isEpisodeQueueItem(completedItem)) return const <dynamic>[];

  final seriesId = completedItem.seriesId;
  final seasonId = completedItem.seasonId;
  final seasonNumber = completedItem.parentIndexNumber;
  if (seriesId == null || seriesId.isEmpty) return const <dynamic>[];
  if (seasonId == null || seasonId.isEmpty) return const <dynamic>[];
  if (seasonNumber == null) return const <dynamic>[];

  if (!_isSingleSeasonEpisodeQueue(
    queueItems,
    seriesId: seriesId,
    seasonId: seasonId,
    seasonNumber: seasonNumber,
  )) {
    return const <dynamic>[];
  }

  final client = _resolveClientForServerId(completedItem.serverId);
  if (client == null) return const <dynamic>[];

  List<AggregatedItem> currentSeasonEpisodes;
  try {
    currentSeasonEpisodes = await _fetchSeasonEpisodes(
      client: client,
      serverId: completedItem.serverId,
      seriesId: seriesId,
      seasonId: seasonId,
    );
  } catch (_) {
    return const <dynamic>[];
  }

  if (!_isSeasonFinale(completedItem, currentSeasonEpisodes)) {
    return const <dynamic>[];
  }

  String? nextSeasonId;
  try {
    nextSeasonId = await _resolveNextSeasonId(
      client: client,
      seriesId: seriesId,
      currentSeasonNumber: seasonNumber,
    );
  } catch (_) {
    return const <dynamic>[];
  }

  if (nextSeasonId == null || nextSeasonId.isEmpty) {
    return const <dynamic>[];
  }

  try {
    final nextSeasonEpisodes = await _fetchSeasonEpisodes(
      client: client,
      serverId: completedItem.serverId,
      seriesId: seriesId,
      seasonId: nextSeasonId,
    );
    final playableEpisodes = nextSeasonEpisodes
        .where(isEligibleNextEpisodeCandidate)
        .toList();
    if (playableEpisodes.isEmpty ||
        playableEpisodes.first.mediaSources.isEmpty) {
      return const <dynamic>[];
    }
    return playableEpisodes;
  } catch (_) {
    return const <dynamic>[];
  }
}

void registerPlaybackModule() {
  final pipService = PipService();
  _getIt.registerSingleton<PipService>(pipService);

  final prefs = _getIt<UserPreferences>();

  MediaKitPlayerBackend? backend;
  Media3PlayerBackend? media3Backend;
  TizenPlayerBackend? tizenBackend;
  AppleTvMpvBackend? appleTvBackend;

  if (PlatformDetection.isTizen) {
    tizenBackend = TizenPlayerBackend(prefs);
    _getIt.registerSingleton<TizenPlayerBackend>(tizenBackend);
  } else if (PlatformDetection.isAppleTV) {
    appleTvBackend = AppleTvMpvBackend(prefs);
    _getIt.registerSingleton<AppleTvMpvBackend>(appleTvBackend);
  } else {
    backend = MediaKitPlayerBackend(
      prefs,
      onNativeHandleReady: pipService.initializeIos,
    );
    media3Backend = Media3PlayerBackend(prefs);
    _getIt.registerSingleton<MediaKitPlayerBackend>(backend);
    _getIt.registerSingleton<Media3PlayerBackend>(media3Backend);
  }

  HtmlVideoBackend? htmlBackend;
  if (PlatformDetection.isWeb) {
    htmlBackend = HtmlVideoBackend(prefs);
    _getIt.registerSingleton<HtmlVideoBackend>(htmlBackend);
  }

  final useMedia3ByDefault =
      !PlatformDetection.isTizen &&
      PlatformDetection.isAndroid &&
      prefs.get(UserPreferences.playbackEnginePreference) ==
          PlaybackEnginePreference.media3;
  final PlayerBackend initialBackend = PlatformDetection.isTizen
      ? tizenBackend!
      : PlatformDetection.isAppleTV
          ? appleTvBackend!
          : PlatformDetection.isWeb
              ? (htmlBackend ?? backend!)
              : (useMedia3ByDefault ? media3Backend! : backend!);
  _getIt.registerSingleton<PlayerBackend>(initialBackend);

  final manager = PlaybackManager();
  manager.onSubtitleTrackChanged = (itemId, index) {
    _getIt<UserPreferences>().setItemSubtitleStreamIndex(itemId, index);
  };
  manager.onAudioTrackChanged = (itemId, index) {
    _getIt<UserPreferences>().setItemAudioStreamIndex(itemId, index);
  };

  manager.setBackend(initialBackend);
  manager.setBackendSelector((resolution, currentBackend) {
    if (PlatformDetection.isTizen) {
      if (currentBackend is TizenPlayerBackend) return currentBackend;
      return _getIt<TizenPlayerBackend>();
    }

    if (PlatformDetection.isAppleTV) {
      if (currentBackend is AppleTvMpvBackend) return currentBackend;
      return _getIt<AppleTvMpvBackend>();
    }

    if (PlatformDetection.isWeb) {
      final webHtmlBackend = htmlBackend;
      if (webHtmlBackend != null && _shouldUseHtmlVideoBackend(resolution)) {
        if (currentBackend is HtmlVideoBackend) {
          return currentBackend;
        }
        return webHtmlBackend;
      }

      if (currentBackend is MediaKitPlayerBackend) return currentBackend;
      return _getIt<MediaKitPlayerBackend>();
    }

    if (PlatformDetection.isAndroid) {
      final preferMedia3 =
          prefs.get(UserPreferences.playbackEnginePreference) ==
          PlaybackEnginePreference.media3;
      if (preferMedia3) {
        if (currentBackend is Media3PlayerBackend) return currentBackend;
        return _getIt<Media3PlayerBackend>();
      }
      if (currentBackend is MediaKitPlayerBackend) return currentBackend;
      return _getIt<MediaKitPlayerBackend>();
    }

    if (currentBackend is MediaKitPlayerBackend) return currentBackend;
    return _getIt<MediaKitPlayerBackend>();
  });
  manager.setTranscodeSelector((resolution) {
    if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) {
      return false;
    }

    if (_hasUnsupportedDolbyVisionProfile(resolution)) {
      return true;
    }

    if (!_isDolbyVisionResolution(resolution)) {
      return false;
    }

    if (PlatformDetection.supportsDolbyVision) {
      return false;
    }

    if (!PlatformDetection.supportsAnyHdr) {
      return true;
    }

    final selected = prefs.get(UserPreferences.dolbyVisionFallbackBehavior);
    if (selected == DolbyVisionFallbackBehavior.transcode) {
      return true;
    }
    if (selected == DolbyVisionFallbackBehavior.hdr10Fallback) {
      return !PlatformDetection.supportsHdr10;
    }

    return false;
  });
  manager.setStartPositionAdjuster((_, startPosition) {
    final prefs = _getIt<UserPreferences>();
    final raw = prefs.get(UserPreferences.resumeSubtractDuration);
    final secs = int.tryParse(raw) ?? 0;
    if (secs <= 0) return startPosition;
    final rewind = Duration(seconds: secs);
    if (startPosition <= rewind) return Duration.zero;
    return startPosition - rewind;
  });
  manager.setPlaybackDecisionLogger((context) {
    final audioCapabilityProfile = prefs.detectedAudioCapabilities;

    final audioSpdifCodecs = context.backend is MediaKitPlayerBackend
        ? _passthroughCodecsForDiagnostics(prefs)
        : const <String>[];

    PlaybackProfileDiagnostics.instance.logPlaybackDecision(
      context: context,
      audioCapabilityProfile: audioCapabilityProfile,
      media3Capabilities: PlatformDetection.hasAudioCapabilities
          ? PlatformDetection.audioCapabilitiesSnapshot
          : const <String, dynamic>{},
      audioSpdifCodecs: audioSpdifCodecs,
    );
  });
  manager.setExternalPlaybackDecider((items) {
    if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) {
      return false;
    }

    if (!prefs.get(UserPreferences.useExternalPlayer)) {
      return false;
    }

    if (_getIt.isRegistered<SyncPlayManager>()) {
      final syncPlayManager = _getIt<SyncPlayManager>();
      if (syncPlayManager.state.enabled) {
        return false;
      }
    }

    return ExternalPlayerPolicy.isEligibleQueue(items);
  });
  manager.setNextSeasonItemsProvider(_nextSeasonItemsProvider);
  manager.setResolverConfigurator(_ensureResolverForItem);
  final audioArbiter = PlaybackArbiter();
  _getIt.registerSingleton<PlaybackArbiter>(audioArbiter);
  manager.setAudioArbiter(audioArbiter);
  manager.audioTrackSelector = (audioStreams, explicitIndex) {
    final preferredAudioLanguage = manager.lastExplicitAudioLanguage ??
        (prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto');

    return computeEffectiveAudioIndex(
      audioStreams: audioStreams,
      preferredAudioLanguage: preferredAudioLanguage,
      fallbackAudioLanguage: prefs.get(UserPreferences.fallbackAudioLanguage) as String? ?? '',
      preferDefaultAudioTrack: prefs.get(UserPreferences.preferDefaultAudioTrack) as bool? ?? false,
      preferAudioDescription: prefs.get(UserPreferences.preferAudioDescription) as bool? ?? false,
      explicitAudioIndex: explicitIndex,
    );
  };

  manager.subtitleTrackSelector = (subtitleStreams, audioStreams, explicitIndex) {
    final effectiveAudioIndex = computeEffectiveAudioIndex(
      audioStreams: audioStreams,
      preferredAudioLanguage: manager.lastExplicitAudioLanguage ??
          (prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto'),
      fallbackAudioLanguage: prefs.get(UserPreferences.fallbackAudioLanguage) as String? ?? '',
      preferDefaultAudioTrack: prefs.get(UserPreferences.preferDefaultAudioTrack) as bool? ?? false,
      preferAudioDescription: prefs.get(UserPreferences.preferAudioDescription) as bool? ?? false,
      explicitAudioIndex: manager.audioSelectionExplicit ? manager.audioStreamIndex : null,
    );

    final activeAudioStream = audioStreams.firstWhere(
      (s) => s['Index'] == effectiveAudioIndex,
      orElse: () => const <String, dynamic>{},
    );
    final activeAudioLanguage = activeAudioStream.isNotEmpty ? activeAudioStream['Language'] as String? : null;

    final subtitleMode = manager.lastExplicitSubtitleEnabled == false
        ? SubtitleMode.none
        : prefs.get(UserPreferences.subtitleMode);

    final preferredLanguage = manager.lastExplicitSubtitleLanguage ??
        (prefs.get(UserPreferences.defaultSubtitleLanguage) as String? ?? '');

    return computeEffectiveSubtitleIndex(
      subtitleStreams: subtitleStreams,
      selectedSubtitleIndex: explicitIndex,
      activePlaybackSubtitleIndex: null,
      subtitleMode: subtitleMode,
      preferredLanguage: preferredLanguage,
      fallbackLanguage: prefs.get(UserPreferences.fallbackSubtitleLanguage) as String? ?? '',
      preferSdh: prefs.get(UserPreferences.preferSdhSubtitles) as bool? ?? false,
      pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay) as bool? ?? false,
      assDirectPlay: prefs.get(UserPreferences.assDirectPlay) as bool? ?? false,
      preferredAudioLanguage: prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto',
      activeAudioLanguage: activeAudioLanguage,
    );
  };

  _getIt.registerSingleton<PlaybackManager>(manager);

  _getIt.registerLazySingleton<OfflineStreamResolver>(
    () => OfflineStreamResolver(_getIt<OfflineRepository>()),
  );
  _getIt.registerLazySingleton<OfflinePlaybackTracker>(
    () => OfflinePlaybackTracker(_getIt<OfflineRepository>()),
  );

  _getIt.registerLazySingleton<SyncPlayManager>(
    () => SyncPlayManager(_getIt<PlaybackManager>(), _getIt<UserPreferences>()),
  );

  _getIt.registerLazySingleton<AudiobookBookmarksService>(
    () => AudiobookBookmarksService(),
    dispose: (s) => s.dispose(),
  );
  _getIt.registerLazySingleton<AudiobookNotesService>(
    () => AudiobookNotesService(),
    dispose: (s) => s.dispose(),
  );
  _getIt.registerLazySingleton<AudiobookResumeService>(
    () => AudiobookResumeService(),
  );
  _getIt.registerLazySingleton<HeadlessSessionBootstrap>(
    () => HeadlessSessionBootstrap(),
  );
  _getIt.registerLazySingleton<LastPlaybackSessionStore>(
    () => LastPlaybackSessionStore(),
  );
  _getIt.registerLazySingleton<MediaBrowseService>(
    () => MediaBrowseService(
      _getIt<MediaServerClientFactory>(),
      _getIt<HeadlessSessionBootstrap>(),
      _getIt<AudiobookResumeService>(),
      _getIt<LastPlaybackSessionStore>(),
    ),
  );
  _getIt.registerLazySingleton<SleepTimerController>(
    () => SleepTimerController(_getIt<PlaybackManager>()),
    dispose: (s) => s.dispose(),
  );
}

MediaServerClient? _currentActiveResolverClient;

void resetActiveStreamResolver() {
  _currentActiveResolverClient = null;
}

void setActiveStreamResolver(MediaServerClient client) {
  if (identical(client, _currentActiveResolverClient) &&
      _getIt.isRegistered<MediaStreamResolver>() &&
      _getIt.isRegistered<PlayerService>()) {
    return;
  }

  if (_getIt.isRegistered<MediaStreamResolver>()) {
    _getIt.unregister<MediaStreamResolver>();
  }
  if (_getIt.isRegistered<PlayerService>()) {
    _getIt.unregister<PlayerService>();
  }

  final (
    MediaStreamResolver serverResolver,
    PlayerService serverService,
  ) = switch (client.serverType) {
    ServerType.jellyfin => () {
      final p = JellyfinPlugin(client);
      return (p.createStreamResolver(), p.createPlaySessionService());
    }(),
    ServerType.emby => () {
      final p = EmbyPlugin(client);
      return (p.createStreamResolver(), p.createPlaySessionService());
    }(),
  };

  // Local-first: completed downloads play from disk instead of streaming,
  // with progress mirrored to the downloads DB (and to the server when
  // reachable).
  final resolver = LocalFirstMediaStreamResolver(
    inner: serverResolver,
    offline: _getIt<OfflineStreamResolver>(),
  );
  final service = LocalAwarePlayerService(
    serverService,
    _getIt<OfflineRepository>(),
    canReachServer: () =>
        !_getIt.isRegistered<ConnectivityService>() ||
        _getIt<ConnectivityService>().canReachServer,
  );

  _getIt.registerSingleton<MediaStreamResolver>(resolver);
  _getIt.registerSingleton<PlayerService>(service);

  final manager = _getIt<PlaybackManager>();
  manager.setResolver(resolver);
  manager.setPlayerService(service);

  _currentActiveResolverClient = client;
}

Future<void> _ensureResolverForItem(dynamic item) async {
  if (item is! AggregatedItem) return;
  final factory = _getIt<MediaServerClientFactory>();
  final client = factory.getClientIfExists(item.serverId);
  if (client == null) return;
  setActiveStreamResolver(client);
}

