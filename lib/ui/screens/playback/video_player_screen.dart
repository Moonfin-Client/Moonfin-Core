import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:screen_brightness_platform_interface/screen_brightness_platform_interface.dart';
import 'package:volume_controller/volume_controller.dart';
import 'package:window_manager/window_manager.dart';

import '../../../util/fullscreen_helper.dart';
import '../../widgets/playback/seek_icons.dart';

import '../../../playback/html_video_backend.dart';
import '../../../playback/media_kit_player_backend.dart';
import '../../../playback/playback_lifecycle_handler.dart';
import '../../../playback/playback_profile_diagnostics.dart';
import '../../../playback/hdr_stream_capability.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/models/media_segment.dart';
import '../../../data/models/trickplay_info.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../data/services/cast/native_airplay_channel.dart';
import '../../../data/services/cast/native_cast_channel.dart';
import '../../../data/services/cast/native_dlna_channel.dart';
import '../../../data/services/media_segment_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/theme_music_service.dart';
import '../../../platform/pip_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/audio_labels.dart';
import '../../../util/subtitle_track_logic.dart';
import '../../../util/auto_hdr_switcher.dart';
import '../../../util/clock_format.dart';
import '../../../util/episode_playability.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/play_method_label.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/subtitle_preview.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../widgets/remote_play_to_session_dialog.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../widgets/playback/player_loading_overlay.dart';
import '../../widgets/playback/skip_segment_overlay.dart';
import '../../widgets/playback/next_up_overlay.dart';
import '../../widgets/playback/still_watching_dialog.dart';
import '../../widgets/playback/stream_info_dialog.dart';
import '../../widgets/syncplay/syncplay_player_button.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../playback/tizen_player_backend.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver, WindowListener {
  static final _camelCaseSpaceRe = RegExp(r'(?<=[a-z])(?=[A-Z])');
  static const _streamLoadingLabel = 'Loading Stream...';
  static const _tvTemporarySpeed = 2.0;
  static const _tvTemporarySpeedHoldDelay = Duration(milliseconds: 420);
  static const _seekPromptSuppressionDuration = Duration(milliseconds: 1200);
  static const _seekDragPromptSuppressionDuration = Duration(seconds: 4);
  static const _scrubSeekDebounceDuration = Duration(milliseconds: 250);

  final _manager = GetIt.instance<PlaybackManager>();
  final MediaKitPlayerBackend? _backend =
      (PlatformDetection.isTizen || PlatformDetection.isAppleTV)
      ? null
      : GetIt.instance<MediaKitPlayerBackend>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _autoHdrSwitcher = AutoHdrSwitcher();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _castService = GetIt.instance<CastService>();
  final _nativeCast = GetIt.instance<NativeCastChannel>();
  final _nativeDlna = GetIt.instance<NativeDlnaChannel>();
  final _nativeAirPlay = GetIt.instance<NativeAirPlayChannel>();
  final _pipService = GetIt.instance<PipService>();
  final _lifecycleHandler = GetIt.instance<PlaybackLifecycleHandler>();
  final _themeMusicService = GetIt.instance<ThemeMusicService>();
  final _screensaverController = GetIt.instance<ScreensaverController>();
  final SyncPlayManager? _syncPlayManager =
      GetIt.instance.isRegistered<SyncPlayManager>()
      ? GetIt.instance<SyncPlayManager>()
      : null;
  late MediaSegmentService _segmentService;

  PlayerBackend? get _activeBackend => _manager.backend;

  MediaKitPlayerBackend? get _activeMediaKitBackend {
    final backend = _activeBackend;
    return backend is MediaKitPlayerBackend ? backend : null;
  }

  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _activeBackend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  HtmlVideoBackend? get _activeHtmlVideoBackend {
    final backend = _activeBackend;
    return backend is HtmlVideoBackend ? backend : null;
  }

  bool _controlsVisible = true;
  Timer? _hideTimer;
  bool _displayPlaying = false;
  Timer? _displayPlayingDebounce;
  bool _isSeeking = false;
  double _seekValue = 0;
  Timer? _scrubSeekDebounceTimer;
  Duration? _pendingScrubSeekTarget;
  late ZoomMode _zoomMode;
  double _audioDelay = 0.0;
  double _subtitleDelay = 0.0;
  bool _subtitleActive = false;
  bool _subtitleReapplyRetryScheduled = false;
  bool _isStopping = false;
  bool _readyToPop = false;
  bool _didRestoreSystemUiOnExit = false;
  DateTime? _suppressTvLifecycleExitUntil;
  bool _isOsdLocked = false;
  String? _remotePlaybackState;
  int _remotePositionTicks = 0;
  double? _remoteVolume;
  DateTime? _lastCastErrorAt;
  String? _lastCastErrorMessage;
  DateTime? _lastPlaybackErrorAt;
  String? _lastPlaybackErrorMessage;
  bool _isInPiP = false;
  bool _forcedLandscape = false;
  double _playerVolume = 100.0;
  double _volumeBeforeMute = 1.0;
  int _media3VolumeBoostLevel = 0;
  bool _didRequestIosPiPForBackground = false;
  bool _isStartingIosPiPForBackground = false;
  bool _didHandleBackgroundSuspend = false;
  bool _videoWasDisabledByLifecycle = false;
  Timer? _tvBackgroundExitTimer;
  Timer? _tvTemporarySpeedHoldTimer;
  DateTime? _suppressBackNavigationUntil;
  bool _isPlayerMutationInFlight = false;
  Duration? _positionBeforeScreenLock;
  StreamSubscription<bool>? _screenLockSub;
  StreamSubscription<bool>? _screensaverPlayingSub;
  StreamSubscription<void>? _completedSub;
  bool _isRestoringPosition = false;
  DateTime? _suppressSeekPromptsUntil;
  bool _wasPlayingBeforeScreenLock = false;
  LogicalKeyboardKey? _tvTemporarySpeedHoldKey;
  bool _tvTemporarySpeedHoldActive = false;
  double? _tvTemporarySpeedRestoreSpeed;

  MediaSegment? _skipSegment;
  Duration? _skipTo;
  bool _showNextUp = false;
  AggregatedItem? _nextUpItem;
  bool _nextUpDismissed = false;
  bool _isNextUpAdvancing = false;
  int _consecutiveEpisodes = 0;
  StreamSubscription? _positionSub;
  StreamSubscription? _queueSub;
  StreamSubscription<PlayerBackend>? _backendSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;
  StreamSubscription? _pipChangedSub;
  StreamSubscription? _pipActionSub;
  StreamSubscription? _playingSub;
  StreamSubscription? _bufferingSub;
  StreamSubscription<Map<String, dynamic>>? _castEventsSub;
  StreamSubscription<Map<String, dynamic>>? _dlnaEventsSub;
  StreamSubscription<Map<String, dynamic>>? _airPlayEventsSub;
  StreamSubscription<Map<String, dynamic>>? _media3ActivityActionSub;
  final Map<String, List<Map<String, dynamic>>> _media3CastPeopleCache = {};

  TrickplayInfo? _trickplayInfo;
  String? _trickplayMediaSourceId;

  final _overlayFocus = FocusNode();
  final _tvSeekbarFocus = FocusNode(debugLabel: 'video_player_tv_seekbar');
  final _tvSkipSegmentFocus = FocusNode(
    debugLabel: 'video_player_tv_skip_segment',
  );
  final _tvNextUpPlayFocus = FocusNode(
    debugLabel: 'video_player_tv_next_up_play',
  );
  final _tvNextUpDismissFocus = FocusNode(
    debugLabel: 'video_player_tv_next_up_dismiss',
  );
  final _tvTransportFirstFocus = FocusNode(
    debugLabel: 'video_player_tv_transport_first',
  );
  final _tvBottomPrimaryFocus = FocusNode(
    debugLabel: 'video_player_tv_bottom_primary',
  );
  final _tvSecondaryFocus = FocusNode(debugLabel: 'video_player_tv_secondary');
  final _tvTransportLastFocus = FocusNode(
    debugLabel: 'video_player_tv_transport_last',
  );
  final _tvSecondaryLastFocus = FocusNode(
    debugLabel: 'video_player_tv_secondary_last',
  );
  bool _seekbarFocused = false;
  bool _isDesktopFullscreen = false;
  bool _isAlwaysOnTop = false;
  bool? _wasAlwaysOnTopOnEntry;
  bool? _wasDesktopFullscreenOnEntry;

  LogicalKeyboardKey? _seekDirection;
  int _seekRepeatCount = 0;

  double _brightnessValue = 0.5;
  double _systemVolume = 1.0;
  bool _showVolumeOverlay = false;
  bool _showBrightnessOverlay = false;
  Timer? _volumeOverlayTimer;
  Timer? _persistVolumeTimer;
  Timer? _brightnessOverlayTimer;
  Timer? _zoomModeToastTimer;
  OverlayEntry? _zoomModeToastOverlay;
  StreamSubscription<double>? _brightnessListenerSub;
  StreamSubscription<double>? _volumeListenerSub;
  double? _pendingMobileSystemVolume;
  bool _isApplyingMobileSystemVolume = false;
  double _verticalDragStartY = 0.0;
  double _verticalDragStartValue = 0.0;
  bool _verticalDragIsVolume = false;
  Offset? _doubleTapDownPosition;
  DateTime? _lastSeekTime;
  bool _showSkipForward = false;
  bool _showSkipBackward = false;
  Timer? _skipForwardTimer;
  Timer? _skipBackwardTimer;
  int _skipForwardAccum = 0;
  int _skipBackwardAccum = 0;
  PlaybackBringupState _bringupState = const PlaybackBringupState.idle();
  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;

  MediaServerClient _clientForItem(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  MediaServerClient _clientForQueueItem(dynamic item) {
    if (item is AggregatedItem) {
      return _clientForItem(item);
    }
    if (item is Map) {
      final serverId =
          (item['ServerId']?.toString()) ?? (item['serverId']?.toString());
      if (serverId != null && serverId.isNotEmpty) {
        return _clientFactory.getClientIfExists(serverId) ??
            GetIt.instance<MediaServerClient>();
      }
    }
    return GetIt.instance<MediaServerClient>();
  }

  Map<String, dynamic>? _rawDataForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.rawData;
    if (item is Map) return item.cast<String, dynamic>();
    return null;
  }

  String? _itemIdForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.id;
    if (item is Map) {
      final id = item['Id'] ?? item['id'];
      return id?.toString();
    }
    return null;
  }

  String? _serverIdForQueueItem(dynamic item) {
    if (item is AggregatedItem) {
      return item.serverId;
    }
    if (item is Map) {
      final raw = item['ServerId'] ?? item['serverId'];
      return raw?.toString();
    }
    return null;
  }

  bool _isPrerollQueueItem(dynamic item) {
    final raw = _rawDataForQueueItem(item);
    return raw?['__moonfinIsPreroll'] == true;
  }

  bool get _isCurrentPreroll => _isPrerollQueueItem(_queue.currentItem);

  bool _queueItemIsFavorite(dynamic item) {
    if (item is AggregatedItem) {
      return item.isFavorite;
    }

    final raw = _rawDataForQueueItem(item);
    final userData = raw?['UserData'];
    if (userData is Map) {
      return userData['IsFavorite'] as bool? ?? false;
    }

    return false;
  }

  Future<void> _toggleCurrentItemFavorite() async {
    final item = _queue.currentItem;
    final itemId = _itemIdForQueueItem(item);
    if (itemId == null || itemId.isEmpty) {
      return;
    }

    final isFavorite = _queueItemIsFavorite(item);
    try {
      final mutations = ItemMutationRepository(_clientForQueueItem(item));
      await mutations.setFavorite(itemId, isFavorite: !isFavorite);
      if (!mounted) {
        return;
      }

      setState(() {
        final raw = _rawDataForQueueItem(item);
        if (raw == null) {
          return;
        }
        final existingUserData = raw['UserData'];
        final userData = existingUserData is Map<String, dynamic>
            ? existingUserData
            : (existingUserData is Map
                  ? existingUserData.cast<String, dynamic>()
                  : <String, dynamic>{});
        userData['IsFavorite'] = !isFavorite;
        raw['UserData'] = userData;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      _showThrottledPlaybackError(error.toString());
    }
  }

  void _syncPrerollOsdState() {
    if (!_isCurrentPreroll) return;
    _hideTimer?.cancel();
    if (!_controlsVisible && !_isOsdLocked) return;
    setState(() {
      _controlsVisible = false;
      _isOsdLocked = false;
    });
  }

  bool _canDownloadRemoteSubtitles(AggregatedItem item) {
    final client = _clientForItem(item);
    final user = GetIt.instance<UserRepository>().currentUser;
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';

    return client.serverType == ServerType.jellyfin &&
        (user?.canManageSubtitles ?? false) &&
        item.mediaSources.isNotEmpty &&
        item.type != 'Photo' &&
        item.type != 'Book' &&
        !isAudio;
  }

  String _remoteSubtitleErrorMessage(Object error, {required String action}) {
    final l10n = AppLocalizations.of(context);
    if (error is DioException) {
      final status = error.response?.statusCode;
      if (status == 403) {
        return l10n.remoteSubtitlePermissionError(action);
      }
      if (status == 404) {
        return l10n.remoteSubtitleNotFoundError(action);
      }

      final data = error.response?.data;
      String? detail;
      if (data is Map) {
        detail =
            (data['message'] ??
                    data['Message'] ??
                    data['error'] ??
                    data['Error'])
                as String?;
      } else if (data is String && data.trim().isNotEmpty) {
        detail = data.trim();
      }

      if (detail != null && detail.isNotEmpty) {
        return l10n.remoteSubtitleDetailError(action, detail);
      }
      if (status != null) {
        return l10n.remoteSubtitleHttpError(action, status);
      }
    }

    return l10n.remoteSubtitleGenericError(action);
  }

  String _remoteSubtitleLanguage(
    List<Map<String, dynamic>> subtitleStreams,
    List<Map<String, dynamic>> audioStreams,
  ) {
    final preferred = _prefs
        .get(UserPreferences.defaultSubtitleLanguage)
        .trim();
    if (preferred.isNotEmpty) {
      return preferred;
    }

    for (final stream in [...subtitleStreams, ...audioStreams]) {
      final language = (stream['Language'] as String?)?.trim();
      if (language != null && language.isNotEmpty) {
        return language;
      }
    }

    return 'eng';
  }

  String _remoteSubtitleOptionSubtitle(Map<String, dynamic> subtitle) {
    final details = <String>[];
    final language =
        (subtitle['ThreeLetterISOLanguageName'] as String?)?.trim() ??
        (subtitle['Language'] as String?)?.trim();
    final provider = subtitle['ProviderName'] as String?;
    final format = subtitle['Format'] as String?;
    final downloadCount = subtitle['DownloadCount'] as num?;
    final rating = subtitle['CommunityRating'] as num?;
    final isHashMatch = subtitle['IsHashMatch'] == true;

    if (language != null && language.isNotEmpty) {
      details.add(language.toUpperCase());
    }
    if (provider != null && provider.isNotEmpty) {
      details.add(provider);
    }
    if (format != null && format.isNotEmpty) {
      details.add(format.toUpperCase());
    }
    if (rating != null) {
      details.add('${rating.toStringAsFixed(1)}★');
    }
    if (downloadCount != null) {
      details.add(
        AppLocalizations.of(context).downloadsCount(downloadCount.toInt()),
      );
    }
    if (isHashMatch) {
      details.add(AppLocalizations.of(context).perfectMatch);
    }

    return details.join(' | ');
  }

  Future<List<Map<String, dynamic>>> _refreshSubtitleStreams(
    AggregatedItem currentItem,
    Set<int> existingIndexes,
  ) async {
    const attempts = 8;
    const delay = Duration(milliseconds: 500);
    final client = _clientForItem(currentItem);

    List<Map<String, dynamic>> latestStreams = currentItem.mediaStreams
        .where((stream) => stream['Type'] == 'Subtitle')
        .toList(growable: false);

    for (var attempt = 0; attempt < attempts; attempt++) {
      try {
        final refreshedRaw = await client.itemsApi.getItem(currentItem.id);
        if (!mounted) return latestStreams;
        final refreshedItem = AggregatedItem(
          id: currentItem.id,
          serverId: currentItem.serverId,
          rawData: refreshedRaw,
        );
        latestStreams = refreshedItem.mediaStreams
            .where((stream) => stream['Type'] == 'Subtitle')
            .toList(growable: false);

        final hasNewStream = latestStreams.any((stream) {
          final index = stream['Index'] as int?;
          return index != null && !existingIndexes.contains(index);
        });
        if (hasNewStream) {
          return latestStreams;
        }
      } catch (_) {
        break;
      }

      if (attempt < attempts - 1) {
        await Future.delayed(delay);
      }
    }

    return latestStreams;
  }

  Map<String, dynamic>? _findNewSubtitleStream(
    Set<int> existingIndexes,
    List<Map<String, dynamic>> after,
  ) {
    for (final stream in after) {
      final index = stream['Index'] as int?;
      if (index != null && !existingIndexes.contains(index)) {
        return stream;
      }
    }
    return null;
  }

  Future<void> _downloadRemoteSubtitles(
    AggregatedItem item,
    List<Map<String, dynamic>> subtitleStreams,
    List<Map<String, dynamic>> audioStreams,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final client = _clientForItem(item);
    final language = _remoteSubtitleLanguage(subtitleStreams, audioStreams);

    List<Map<String, dynamic>> results;
    try {
      results = await client.itemsApi.searchRemoteSubtitles(
        item.id,
        language: language,
      );
    } catch (error) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(_remoteSubtitleErrorMessage(error, action: 'search')),
        ),
      );
      return;
    }

    if (!mounted) return;
    if (results.isEmpty) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).noRemoteSubtitlesFound(language),
          ),
        ),
      );
      return;
    }

    final result = await TrackSelectorDialog.show(
      context,
      title: AppLocalizations.of(context).downloadSubtitles,
      options: results.map((subtitle) {
        final label =
            subtitle['Name'] as String? ??
            subtitle['Author'] as String? ??
            'Subtitle';
        final subtitleText = _remoteSubtitleOptionSubtitle(subtitle);
        return TrackOption(
          label: label,
          subtitle: subtitleText.isNotEmpty ? subtitleText : null,
        );
      }).toList(),
    );

    if (!mounted || result == null || result >= results.length) return;

    final subtitleId = results[result]['Id']?.toString();
    if (subtitleId == null || subtitleId.isEmpty) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).selectedSubtitleInvalid),
        ),
      );
      return;
    }

    try {
      await client.itemsApi.downloadRemoteSubtitle(item.id, subtitleId);
      if (!mounted) return;

      final existingIndexes = subtitleStreams
          .map((stream) => stream['Index'] as int?)
          .whereType<int>()
          .toSet();

      final refreshedSubtitleStreams = await _refreshSubtitleStreams(
        item,
        existingIndexes,
      );
      if (!mounted) return;

      final newStream = _findNewSubtitleStream(
        existingIndexes,
        refreshedSubtitleStreams,
      );
      if (newStream != null) {
        final streamIndex = newStream['Index'] as int?;
        if (streamIndex != null) {
          unawaited(
            _runSinglePlayerMutation(
              'downloaded_subtitle_$streamIndex',
              () => _manager.changeSubtitleTrack(streamIndex),
            ).then((_) {
              if (mounted) _syncSubtitleActive();
            }),
          );
        }
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).subtitleDownloadedSelected(
                newStream['DisplayTitle'] as String? ??
                    newStream['Title'] as String? ??
                    newStream['Language'] as String? ??
                    AppLocalizations.of(context).unknown,
              ),
            ),
          ),
        );
        return;
      }

      messenger.showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).subtitleDownloadedPending),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(_remoteSubtitleErrorMessage(error, action: 'download')),
        ),
      );
    }
  }

  MediaSegmentService _createSegmentService([AggregatedItem? item]) {
    final client = item != null
        ? _clientForItem(item)
        : GetIt.instance<MediaServerClient>();
    return MediaSegmentService(
      client,
      FeatureDetector(serverType: client.serverType, serverVersion: ''),
      _prefs,
    );
  }

  void _ensureDesktopOverlayFocus() {
    if (!(PlatformDetection.isDesktop || PlatformDetection.isWeb)) return;
    if (_overlayFocus.hasFocus) return;
    _overlayFocus.requestFocus();
  }

  List<Map<String, dynamic>> _streamMaps(dynamic raw) {
    if (raw is! List) {
      return const <Map<String, dynamic>>[];
    }
    return raw.whereType<Map>().map((e) => e.cast<String, dynamic>()).toList();
  }

  List<Map<String, dynamic>> _currentPlaybackMediaStreams() {
    final resolutionStreams = _manager.currentResolution?.mediaStreams;
    if (resolutionStreams != null && resolutionStreams.isNotEmpty) {
      return resolutionStreams;
    }

    final item = _queue.currentItem;
    if (item is AggregatedItem) {
      return item.mediaStreams;
    }

    if (item is String) {
      final offlineMeta = _manager.currentOfflineMetadata;
      return _streamMaps(offlineMeta?['MediaStreams']);
    }

    if (item is Map) {
      return _streamMaps(item['MediaStreams']);
    }

    return const <Map<String, dynamic>>[];
  }

  bool _isHdrPlaybackContent() {
    if (_isCurrentPreroll) {
      return false;
    }

    final streams = _currentPlaybackMediaStreams();
    for (final stream in streams) {
      if (!HdrStreamCapability.isVideoStream(stream)) continue;
      if (HdrStreamCapability.isDolbyVisionVideoStream(stream) ||
          HdrStreamCapability.isHdr10PlusVideoStream(stream)) {
        return true;
      }

      final rangeType =
          (stream['VideoRangeType']?.toString() ??
                  stream['VideoRange']?.toString() ??
                  '')
              .toUpperCase();
      if (rangeType.isEmpty || rangeType == 'SDR') {
        continue;
      }
      if (rangeType.contains('HDR') ||
          rangeType.contains('DOVI') ||
          rangeType.contains('HLG')) {
        return true;
      }
    }

    return false;
  }

  Future<void> _syncAutoHdrSwitching() async {
    if (!PlatformDetection.isWindows) return;
    final behavior = _prefs.get(UserPreferences.autoHdrSwitchingBehavior);
    await _autoHdrSwitcher.sync(
      behavior: behavior,
      isHdrContent: _isHdrPlaybackContent(),
      isDesktopFullscreen: _isDesktopFullscreen,
    );
  }

  @override
  void initState() {
    super.initState();
    _screensaverController.setPlaybackActive(true);
    _screensaverPlayingSub = _state.playingStream.listen(
      _screensaverController.setPlaybackActive,
    );
    if (PlatformDetection.useNativeVideoSurface) {
      _subtitleActive = (_manager.subtitleStreamIndex ?? -1) >= 0;
    }
    _themeMusicService.setExternalAudioActive(true);
    _segmentService = _createSegmentService();
    _bringupState = _manager.bringupState;
    _bringupSub = _manager.bringupStateStream.listen((state) {
      if (!mounted) return;
      setState(() {
        _bringupState = state;
      });
      _showBringupFailureIfAny(state);
      unawaited(_syncAutoHdrSwitching());
    });
    _zoomMode = _prefs.get(UserPreferences.playerZoomMode);
    _prefs.addListener(_syncMediaQueuingPreference);
    _syncMediaQueuingPreference();
    _applySubtitleStyle();
    _scheduleHide();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (PlatformDetection.isMobile) {
      _forcedLandscape = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp,
      ]);
    }
    WidgetsBinding.instance.addObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.addListener(this);
    }
    _loadSegmentsForCurrentItem();
    unawaited(_syncAutoHdrSwitching());
    _positionSub = _state.positionStream.listen(_onPositionUpdate);
    _completedSub = _manager.sessionEndedStream.listen((_) {
      if (!mounted || _isStopping) return;
      unawaited(_exitPlayback());
    });
    _backendSub = _manager.backendChangedStream.listen((backend) {
      if (backend is Media3PlayerBackend) {
        unawaited(_syncMedia3ZoomMode());
        _syncMedia3VolumeBoostLevel();
      } else {
        _syncMedia3VolumeBoostLevel(resetWhenUnavailable: true);
      }
      // Re-apply the desktop player volume whenever the backend (re)appears.
      if (PlatformDetection.isDesktop) {
        unawaited(backend.setVolume(_playerVolume));
      }
      if (!mounted) return;
      setState(() {});
    });
    _syncMedia3VolumeBoostLevel(resetWhenUnavailable: true);
    if (PlatformDetection.isTV) {
      _tvSeekbarFocus.addListener(_onSeekbarFocusChange);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showControls(focusSeekbar: true);
      if (PlatformDetection.useNativeVideoSurface) {
        _syncSubtitleActive();
      }
      _showBringupFailureIfAny(_bringupState);
      unawaited(_pushMedia3UiMetadata());
      unawaited(_syncAutoHdrSwitching());
    });
    if (PlatformDetection.isAndroid || PlatformDetection.isIOS) {
      _castEventsSub = _nativeCast.googleCastEventStream().listen(
        (e) => _onRemoteEvent(
          e,
          expectedKind: 'googleCast',
          castKind: CastTargetKind.googleCast,
        ),
        onError: (_) {},
      );
      _dlnaEventsSub = _nativeDlna.dlnaEventStream().listen(
        (e) => _onRemoteEvent(
          e,
          expectedKind: 'dlna',
          castKind: CastTargetKind.dlna,
        ),
        onError: (_) {},
      );
      if (PlatformDetection.isIOS) {
        _airPlayEventsSub = _nativeAirPlay.airPlayEventStream().listen(
          _onAirPlayEvent,
          onError: (_) {},
        );
      }
    }
    _queueSub = _queue.queueChangedStream.listen((_) {
      _loadSegmentsForCurrentItem();
      _manager.suppressAutoNext = false;
      _consecutiveEpisodes++;
      unawaited(_pushMedia3UiMetadata());
      _syncMedia3VolumeBoostLevel();
      unawaited(_syncAutoHdrSwitching());
      final isPreroll = _isCurrentPreroll;
      setState(() {
        _nextUpDismissed = false;
        _showNextUp = false;
        _skipSegment = null;
        if (isPreroll) {
          _controlsVisible = false;
          _isOsdLocked = false;
        }
      });
      if (isPreroll) {
        _hideTimer?.cancel();
      }
    });

    _media3ActivityActionSub = Media3PlayerBackend.activityActionStream.listen(
      _onMedia3ActivityAction,
      onError: (_) {},
    );

    final isMobilePlayback =
        (PlatformDetection.isAndroid && !PlatformDetection.isTV) ||
        PlatformDetection.isIOS;

    _displayPlaying = _state.isPlaying;
    _playingSub = _state.playingStream.listen((playing) {
      _updateDisplayPlaying(playing);
      if (isMobilePlayback) {
        _pipService.updatePiPActions(isPlaying: playing);
        _syncAirPlayPlaybackState();
        if (PlatformDetection.useNativeVideoSurface && playing) {
          _syncSubtitleActive();
        }
      }
    });

    if (isMobilePlayback) {
      _pipChangedSub = _pipService.onPiPChanged.listen(_onPiPChanged);
      _pipActionSub = _pipService.onPiPAction.listen(_onPiPAction);
      if (PlatformDetection.isAndroid) {
        _pipService.enableAutoPiP(true);
        _bufferingSub = _state.bufferingStream.listen((_) {
          _syncAirPlayPlaybackState();
        });
      }
    }

    if (PlatformDetection.isAndroid) {
      _screenLockSub = _pipService.onScreenLock.listen(_onScreenLock);
    }

    if (PlatformDetection.useDesktopUi) {
      unawaited(_syncDesktopFullscreenState());
      unawaited(_syncAlwaysOnTopState());
    }

    if (PlatformDetection.isMobile) {
      _initBrightness();
    }
    if (_useSystemVolume) {
      _initSystemVolume();
    } else if (PlatformDetection.isDesktop) {
      _initDesktopVolume();
    }
  }

  @override
  void dispose() {
    if (_isInPiP && GetIt.instance.isRegistered<PlaybackArbiter>()) {
      GetIt.instance<PlaybackArbiter>().pipActive = false;
    }
    _screensaverPlayingSub?.cancel();
    _screensaverController.setPlaybackActive(false);
    _prefs.removeListener(_syncMediaQueuingPreference);
    _manager.autoAdvanceEnabled = true;
    WidgetsBinding.instance.removeObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.removeListener(this);
    }
    _cancelTvTemporarySpeedHold();
    _hideTimer?.cancel();
    _displayPlayingDebounce?.cancel();
    _scrubSeekDebounceTimer?.cancel();
    _scrubSeekDebounceTimer = null;
    _volumeOverlayTimer?.cancel();
    _brightnessOverlayTimer?.cancel();
    _zoomModeToastTimer?.cancel();
    _removeZoomModeToastOverlay();
    _skipForwardTimer?.cancel();
    _skipBackwardTimer?.cancel();
    _persistVolumeTimer?.cancel();
    if (PlatformDetection.isDesktop) {
      unawaited(_prefs.set(UserPreferences.playerVolume, _playerVolume));
    }
    if (_useSystemVolume) {
      _volumeListenerSub?.cancel();
      VolumeController.instance.removeListener();
    }
    if (PlatformDetection.isMobile) {
      _brightnessListenerSub?.cancel();
      Future.microtask(() async {
        try {
          if (PlatformDetection.isIOS) {
            await ScreenBrightnessPlatform.instance.setAutoReset(true);
          } else {
            await ScreenBrightnessPlatform.instance
                .resetApplicationScreenBrightness();
          }
        } catch (_) {}
      });
    }
    _positionSub?.cancel();
    _queueSub?.cancel();
    _backendSub?.cancel();
    _bringupSub?.cancel();
    _pipChangedSub?.cancel();
    _pipActionSub?.cancel();
    _playingSub?.cancel();
    _bufferingSub?.cancel();
    _castEventsSub?.cancel();
    _dlnaEventsSub?.cancel();
    _airPlayEventsSub?.cancel();
    _media3ActivityActionSub?.cancel();
    _screenLockSub?.cancel();
    _completedSub?.cancel();
    _tvBackgroundExitTimer?.cancel();
    _overlayFocus.dispose();
    _tvSeekbarFocus.dispose();
    _tvSkipSegmentFocus.dispose();
    _tvNextUpPlayFocus.dispose();
    _tvNextUpDismissFocus.dispose();
    _tvTransportFirstFocus.dispose();
    _tvBottomPrimaryFocus.dispose();
    _tvSecondaryFocus.dispose();
    _tvTransportLastFocus.dispose();
    _tvSecondaryLastFocus.dispose();
    unawaited(_autoHdrSwitcher.restore());
    _themeMusicService.setExternalAudioActive(false);
    if (!PlatformDetection.isTV) _pipService.enableAutoPiP(false);
    if (_wasAlwaysOnTopOnEntry == false && _isAlwaysOnTop) {
      unawaited(_setAlwaysOnTop(false));
    }
    if (!_isStopping) _manager.stop(userInitiated: false);
    unawaited(_restoreSystemUiForExit());
    super.dispose();
  }

  void _onAirPlayEvent(Map<String, dynamic> event) {
    final kind = event['kind'] as String?;
    if (kind != 'airPlay') return;

    _onRemoteEvent(
      event,
      expectedKind: 'airPlay',
      castKind: CastTargetKind.airPlay,
    );
  }

  void _onRemoteEvent(
    Map<String, dynamic> event, {
    required String expectedKind,
    required CastTargetKind castKind,
  }) {
    final kind = event['kind'] as String?;
    if (kind != expectedKind) return;

    final state = event['state'] as String?;
    switch (state) {
      case 'connected':
        _castService.setActiveKind(castKind);
        _castService.remoteStateNotifier.value = null;
        if (castKind == CastTargetKind.googleCast ||
            castKind == CastTargetKind.dlna) {
          _refreshRemoteVolume();
        }
        if (castKind == CastTargetKind.airPlay) {
          _syncAirPlayPlaybackState();
        }
        unawaited(_pushMedia3UiMetadata());
      case 'disconnected':
        if (_castService.activeKind == castKind) {
          _castService.setActiveKind(null);
          _castService.remoteStateNotifier.value = null;
          _castService.remotePositionNotifier.value = 0;
          _castService.remoteVolumeNotifier.value = null;
          _remotePlaybackState = null;
          _remotePositionTicks = 0;
          _remoteVolume = null;
        }
        unawaited(_pushMedia3UiMetadata());
      case 'playing' || 'paused' || 'buffering' || 'idle':
        final positionTicks = (event['positionTicks'] as int?) ?? 0;
        _castService.remoteStateNotifier.value = state;
        _castService.remotePositionNotifier.value = positionTicks;
        if (mounted) {
          setState(() {
            _remotePlaybackState = state;
            _remotePositionTicks = positionTicks;
          });
        }
        unawaited(_pushMedia3UiMetadata());
      case 'error':
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          final protocolLabel = castKind == CastTargetKind.googleCast
              ? 'Google Cast'
              : 'DLNA';
          final message =
              event['message'] as String? ??
              l10n.castSessionError(protocolLabel);
          _showThrottledCastError(message);
        }
    }
  }

  void _showThrottledCastError(String message) {
    final now = DateTime.now();
    final lastAt = _lastCastErrorAt;
    final repeated = _lastCastErrorMessage == message;
    if (repeated &&
        lastAt != null &&
        now.difference(lastAt) < const Duration(seconds: 3)) {
      return;
    }
    _lastCastErrorAt = now;
    _lastCastErrorMessage = message;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showThrottledPlaybackError(String message) {
    final normalized = message.trim();
    if (normalized.isEmpty) {
      return;
    }

    final now = DateTime.now();
    final lastAt = _lastPlaybackErrorAt;
    final repeated = _lastPlaybackErrorMessage == normalized;
    if (repeated &&
        lastAt != null &&
        now.difference(lastAt) < const Duration(seconds: 3)) {
      return;
    }

    _lastPlaybackErrorAt = now;
    _lastPlaybackErrorMessage = normalized;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(normalized)));
  }

  void _showBringupFailureIfAny(PlaybackBringupState state) {
    if (state.phase != PlaybackBringupPhase.failed) {
      return;
    }
    final error = state.error?.trim();
    if (error == null || error.isEmpty) {
      return;
    }
    _showThrottledPlaybackError(error);
  }

  Future<void> _refreshRemoteVolume() async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;

    try {
      final volume = await _castService.getVolume(kind);
      if (!mounted) return;
      _castService.remoteVolumeNotifier.value = volume;
      setState(() {
        _remoteVolume = volume;
      });
      unawaited(_pushMedia3UiMetadata());
    } catch (_) {
      if (!mounted) return;
      _castService.remoteVolumeNotifier.value = null;
      setState(() {
        _remoteVolume = null;
      });
      unawaited(_pushMedia3UiMetadata());
    }
  }

  Future<void> _setRemoteVolume(double volume) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    _castService.remoteVolumeNotifier.value = volume;
    setState(() {
      _remoteVolume = volume;
    });
    unawaited(_pushMedia3UiMetadata());
    try {
      await _castService.setVolume(kind, volume: volume);
    } catch (e) {
      if (!mounted) return;
      _showThrottledCastError(
        AppLocalizations.of(context).failedToSetCastVolume('$e'),
      );
    }
  }

  void _suppressTvLifecycleExit({
    Duration duration = const Duration(seconds: 8),
  }) {
    if (!PlatformDetection.isTV) return;
    _suppressTvLifecycleExitUntil = DateTime.now().add(duration);
    _cancelTvBackgroundExit();
  }

  bool _isTvLifecycleExitSuppressed() {
    if (!PlatformDetection.isTV) return false;
    final until = _suppressTvLifecycleExitUntil;
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  void _scheduleTvBackgroundExit() {
    _tvBackgroundExitTimer?.cancel();
    _tvBackgroundExitTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted || _isStopping) return;
      if (_isTvLifecycleExitSuppressed()) return;
      if (_isInPiP || _pipService.isScreenLocked) return;
      final lifecycle = WidgetsBinding.instance.lifecycleState;
      if (lifecycle == AppLifecycleState.resumed ||
          lifecycle == AppLifecycleState.inactive) {
        return;
      }
      unawaited(_exitPlayback());
    });
  }

  void _cancelTvBackgroundExit() {
    _tvBackgroundExitTimer?.cancel();
    _tvBackgroundExitTimer = null;
  }

  void _suppressBackNavigation({
    Duration duration = const Duration(seconds: 1),
  }) {
    _suppressBackNavigationUntil = DateTime.now().add(duration);
  }

  bool _isBackNavigationSuppressed() {
    final until = _suppressBackNavigationUntil;
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  Future<bool> _runSinglePlayerMutation(
    String label,
    FutureOr<void> Function() action, {
    Duration suppressBackFor = const Duration(seconds: 1),
  }) async {
    if (_isPlayerMutationInFlight) {
      return false;
    }
    _isPlayerMutationInFlight = true;
    _suppressBackNavigation(duration: suppressBackFor);
    _suppressTvLifecycleExit();
    try {
      await Future<void>.sync(action);
    } finally {
      _isPlayerMutationInFlight = false;
    }
    return true;
  }

  @override
  void onWindowFocus() {
    _ensureDesktopOverlayFocus();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState != AppLifecycleState.resumed) {
      _cancelTvTemporarySpeedHold();
    }
    switch (lifecycleState) {
      case AppLifecycleState.inactive:
        if (PlatformDetection.isIOS) {
          _tryStartIosPiPForBackground();
          return;
        }
        if (PlatformDetection.isAndroid && !PlatformDetection.isTV) {
          return;
        }
        if (PlatformDetection.isTV ||
            PlatformDetection.isDesktop ||
            PlatformDetection.isWeb) {
          return;
        }
        if (_isInPiP || _isStopping || _pipService.isScreenLocked) return;
        _videoWasDisabledByLifecycle = true;
        _activeMediaKitBackend?.setVideoEnabled(false);
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        if (PlatformDetection.isAndroid && !PlatformDetection.isTV) {
          return;
        }
        if (PlatformDetection.isTV) {
          if (_isTvLifecycleExitSuppressed()) return;
          if (_didHandleBackgroundSuspend) return;
          _didHandleBackgroundSuspend = true;
          if (_state.isPlaying) {
            _scheduleTvBackgroundExit();
          }
          return;
        }
        if (PlatformDetection.isIOS) {
          _tryStartIosPiPForBackground();
          return;
        }
        if (_isInPiP || _isStopping || _pipService.isScreenLocked) return;
        _videoWasDisabledByLifecycle = true;
        _activeMediaKitBackend?.setVideoEnabled(false);
      case AppLifecycleState.resumed:
        _didHandleBackgroundSuspend = false;
        _cancelTvBackgroundExit();
        _didRequestIosPiPForBackground = false;
        if (PlatformDetection.isIOS && _isInPiP) {
          _pipService.enableAutoPiP(false);
        }
        if (_videoWasDisabledByLifecycle) {
          _videoWasDisabledByLifecycle = false;
          _activeMediaKitBackend?.setVideoEnabled(true);
          _restorePositionAfterScreenLock();
        }
        _ensureDesktopOverlayFocus();
        if (PlatformDetection.isMobile) _syncBrightnessFromSystem();
      case AppLifecycleState.detached:
        break;
    }
  }

  void _tryStartIosPiPForBackground() {
    if (_didRequestIosPiPForBackground) return;
    if (_isStartingIosPiPForBackground) return;
    if (_isInPiP || _isStopping || _pipService.isScreenLocked) return;
    _didRequestIosPiPForBackground = true;
    _isStartingIosPiPForBackground = true;
    unawaited(_startIosPiPForBackground());
  }

  Future<void> _startIosPiPForBackground() async {
    try {
      await _pipService.startIosPiP();

      // Re-arm if PiP hasn't started after the method channel returned.
      await Future<void>.delayed(const Duration(milliseconds: 220));
      if (mounted && !_isInPiP) {
        _didRequestIosPiPForBackground = false;
      }
    } finally {
      _isStartingIosPiPForBackground = false;
    }
  }

  void _onScreenLock(bool locked) {
    _lifecycleHandler.setScreenLocked(locked);
    if (locked) {
      _positionBeforeScreenLock = _activeBackend?.position ?? _state.position;
      _wasPlayingBeforeScreenLock = _state.isPlaying;
      _isRestoringPosition = true;
      if (_wasPlayingBeforeScreenLock) {
        _manager.pause();
      }
      return;
    }

    if (!_isRestoringPosition) return;
    unawaited(_restorePositionAfterScreenLock());
  }

  Future<void> _restorePositionAfterScreenLock() async {
    final pos = _positionBeforeScreenLock;
    final shouldResume = _wasPlayingBeforeScreenLock;
    _positionBeforeScreenLock = null;
    _wasPlayingBeforeScreenLock = false;

    try {
      if (pos != null && pos > Duration.zero) {
        await Future.delayed(const Duration(milliseconds: 450));
        if (!mounted || _isStopping) return;

        final currentPos = _activeBackend?.position ?? _state.position;
        final regressed = currentPos + const Duration(seconds: 1) < pos;
        if (regressed) {
          await _activeBackend?.seekTo(pos);
        }
      }

      if (shouldResume && !_state.isPlaying) {
        await _manager.resume();
      }
    } catch (_) {
    } finally {
      if (_isRestoringPosition && mounted) {
        setState(() => _isRestoringPosition = false);
      } else {
        _isRestoringPosition = false;
      }
    }
  }

  void _toggleOrientationLock() {
    setState(() => _forcedLandscape = !_forcedLandscape);
    if (_forcedLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp,
      ]);
    }
  }

  void _onPiPChanged(bool isInPiP) {
    if (GetIt.instance.isRegistered<PlaybackArbiter>()) {
      GetIt.instance<PlaybackArbiter>().pipActive = isInPiP;
    }
    if (!mounted) return;
    setState(() => _isInPiP = isInPiP);
    if (!isInPiP) {
      _didRequestIosPiPForBackground = false;
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      if (PlatformDetection.isMobile && _forcedLandscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
      _showControls();
    }
  }

  void _onPiPAction(String action) {
    switch (action) {
      case 'playPause':
        if (_state.isPlaying) {
          _manager.pause();
        } else {
          _manager.resume();
        }
        return;
      case 'play':
        _manager.resume();
        return;
      case 'pause':
        _manager.pause();
        return;
      case 'dismissed':
        final lifecycle = WidgetsBinding.instance.lifecycleState;
        final isForeground =
            lifecycle == AppLifecycleState.resumed ||
            lifecycle == AppLifecycleState.inactive;
        if (PlatformDetection.isAndroid && isForeground) {
          return;
        }
        _exitPlayback();
        return;
      default:
        return;
    }
  }

  Future<void> _loadSegmentsForCurrentItem() async {
    final item = _queue.currentItem;
    if (item is AggregatedItem) {
      _segmentService = _createSegmentService(item);
      await _segmentService.loadSegments(item.id);
    }
    _loadTrickplayInfo(item);
    await _pushMedia3UiMetadata();
  }

  List<Map<String, dynamic>> _buildMedia3StreamInfoSections() {
    final l10n = AppLocalizations.of(context);
    final resolution = _manager.currentResolution;
    final playMethod = resolution?.playMethod;
    final bringupPlayMethod = _manager.bringupState.playMethod;
    final methodLabel = _manager.isOfflinePlayback
        ? l10n.directPlay
        : playbackMethodLabel(
            l10n: l10n,
            playMethod: playMethod,
            transcodingReasons:
                resolution?.transcodingReasons ?? const <String>[],
            fallbackPlayMethod: bringupPlayMethod,
          );

    final item = _queue.currentItem;
    Map<String, dynamic>? mediaSource;
    Map<String, dynamic>? videoStream;
    Map<String, dynamic>? audioStream;
    Map<String, dynamic>? subtitleStream;

    Map<String, dynamic>? pickStream(
      List<Map<String, dynamic>> streams,
      String type,
      int? preferredIndex,
    ) {
      if (preferredIndex != null && preferredIndex >= 0) {
        final preferred = streams
            .where((s) => s['Type'] == type)
            .firstWhere(
              (s) => s['Index'] == preferredIndex,
              orElse: () => const <String, dynamic>{},
            );
        if (preferred.isNotEmpty) {
          return preferred;
        }
      }

      return streams
              .where((s) => s['Type'] == type && s['IsDefault'] == true)
              .firstOrNull ??
          streams.where((s) => s['Type'] == type).firstOrNull;
    }

    void populateStreams(List<Map<String, dynamic>> streams) {
      videoStream = streams.where((s) => s['Type'] == 'Video').firstOrNull;
      audioStream = pickStream(streams, 'Audio', _manager.audioStreamIndex);
      subtitleStream = _manager.subtitleStreamIndex == -1
          ? null
          : pickStream(streams, 'Subtitle', _manager.subtitleStreamIndex);
    }

    if (item is AggregatedItem) {
      final streams = resolution?.mediaStreams ?? item.mediaStreams;
      populateStreams(streams);

      final sourceId = resolution?.mediaSourceId;
      final sources = item.mediaSources;
      if (sourceId != null && sources.isNotEmpty) {
        mediaSource = sources.firstWhere(
          (s) => s['Id'] == sourceId,
          orElse: () => sources.first,
        );
      } else if (sources.isNotEmpty) {
        mediaSource = sources.first;
      }
    } else if (item is String) {
      final meta = _manager.currentOfflineMetadata;
      if (meta != null) {
        final streams =
            (meta['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        populateStreams(streams);
        final sources = meta['MediaSources'] as List?;
        if (sources != null && sources.isNotEmpty) {
          mediaSource = sources.first as Map<String, dynamic>?;
        }
      }
    }

    final container =
        (mediaSource?['Container'] as String?)?.toUpperCase() ?? l10n.unknown;
    String resolveFileName() {
      String? basenameFromPath(String? rawPath) {
        final path = rawPath?.trim();
        if (path == null || path.isEmpty) {
          return null;
        }
        final segments = path.split(RegExp(r'[\\/]'));
        final last = segments.isNotEmpty ? segments.last.trim() : '';
        return last.isEmpty ? null : last;
      }

      final sourcePathName = basenameFromPath(mediaSource?['Path'] as String?);
      if (sourcePathName != null) {
        return sourcePathName;
      }

      if (item is String) {
        final offlinePathName = basenameFromPath(item);
        if (offlinePathName != null) {
          return offlinePathName;
        }
      }

      final sourceName = (mediaSource?['Name'] as String?)?.trim();
      if (sourceName != null && sourceName.isNotEmpty) {
        return sourceName;
      }

      return l10n.unknown;
    }

    final fileName = resolveFileName();
    final bitrate = mediaSource?['Bitrate'] as int?;
    final overrideMbps = _manager.maxBitrateOverrideMbps;

    String effectiveBitrateText() {
      if (overrideMbps != null) {
        return l10n.bitrateValueMbps(overrideMbps);
      }
      return _formatBitrate(bitrate);
    }

    Map<String, dynamic> row(
      String label,
      String value, {
      bool highlight = false,
    }) {
      return {'label': label, 'value': value, 'highlight': highlight};
    }

    final sections = <Map<String, dynamic>>[];

    void addSection(String title, List<Map<String, dynamic>> rows) {
      if (rows.isEmpty) return;
      sections.add({'title': title, 'rows': rows});
    }

    final playbackRows = <Map<String, dynamic>>[
      row('File Name', fileName),
      row(l10n.playMethod, methodLabel, highlight: true),
      if (resolution != null &&
          playMethod == StreamPlayMethod.transcode &&
          resolution.transcodingReasons.isNotEmpty)
        row(
          l10n.transcodeReasons,
          resolution.transcodingReasons
              .map((r) => r.replaceAllMapped(_camelCaseSpaceRe, (_) => ' '))
              .join(', '),
        ),
      row(l10n.player, switch (_activeBackend) {
        Media3PlayerBackend _ => 'Media3 (ExoPlayer)',
        HtmlVideoBackend _ => 'HTML5 (browser)',
        MediaKitPlayerBackend _ => 'media_kit (libmpv)',
        _ => l10n.unknown,
      }),
      row(l10n.container, container),
      row(
        l10n.bitrate,
        effectiveBitrateText(),
        highlight: overrideMbps != null,
      ),
      if (overrideMbps != null)
        row(
          l10n.bitrateOverride,
          l10n.bitrateValueMbps(overrideMbps),
          highlight: true,
        ),
    ];
    addSection(l10n.playback, playbackRows);

    if (videoStream case final video?) {
      final fps = video['RealFrameRate'] as num?;
      final width = video['Width'];
      final height = video['Height'];
      final videoRows = <Map<String, dynamic>>[
        row(
          l10n.resolution,
          '${width ?? '?'}×${height ?? '?'}${fps != null ? ' @ ${fps.round()}fps' : ''}',
        ),
        row(l10n.hdr, _getHdrType(video)),
        row(l10n.codec, _formatVideoCodec(video)),
        if (video['BitRate'] != null)
          row(l10n.videoBitrate, _formatBitrate(video['BitRate'] as int?)),
      ];
      addSection(l10n.video, videoRows);
    }

    if (audioStream case final audio?) {
      final audioRows = <Map<String, dynamic>>[
        row(
          l10n.track,
          audio['DisplayTitle'] as String? ??
              audio['Language'] as String? ??
              l10n.unknown,
        ),
        row(l10n.codec, _formatAudioCodec(audio)),
        row(l10n.channels, _formatChannels(audio['Channels'] as int?)),
        if (audio['BitRate'] != null)
          row(l10n.audioBitrate, _formatBitrate(audio['BitRate'] as int?)),
        if (audio['SampleRate'] != null)
          row(
            l10n.sampleRate,
            '${((audio['SampleRate'] as num) / 1000).toStringAsFixed(1)} kHz',
          ),
      ];
      addSection(l10n.audio, audioRows);
    }

    if (subtitleStream case final subtitle?) {
      final subtitleRows = <Map<String, dynamic>>[
        row(
          l10n.track,
          subtitle['DisplayTitle'] as String? ??
              subtitle['Language'] as String? ??
              l10n.unknown,
        ),
        row(
          l10n.format,
          ((subtitle['Codec'] as String?) ?? l10n.unknown).toUpperCase(),
        ),
        row(
          l10n.type,
          subtitle['IsExternal'] == true ? l10n.external : l10n.embedded,
        ),
      ];
      addSection(l10n.subtitles, subtitleRows);
    }

    final diagnostics = PlaybackProfileDiagnostics.instance.lastDecision;
    if (diagnostics != null) {
      final diagnosticsMediaSourceId = diagnostics['mediaSourceId']?.toString();
      final currentMediaSourceId =
          resolution?.mediaSourceId ?? mediaSource?['Id']?.toString();
      final matchesCurrentMediaSource =
          diagnosticsMediaSourceId == null ||
          currentMediaSourceId == null ||
          diagnosticsMediaSourceId == currentMediaSourceId;

      if (matchesCurrentMediaSource) {
        String listValue(String key) {
          final raw = diagnostics[key];
          if (raw is List) {
            final values = raw
                .map((entry) => entry.toString().trim())
                .where((entry) => entry.isNotEmpty)
                .toList(growable: false);
            return values.isEmpty ? l10n.unknown : values.join(', ');
          }
          final text = raw?.toString().trim() ?? '';
          return text.isEmpty ? l10n.unknown : text;
        }

        String scalarValue(String key) {
          final text = diagnostics[key]?.toString().trim() ?? '';
          return text.isEmpty ? l10n.unknown : text;
        }

        final maxStreamingBitrate =
            switch (diagnostics['maxStreamingBitrate']) {
              int value => value,
              num value => value.toInt(),
              _ => null,
            };

        final diagnosticsRows = <Map<String, dynamic>>[
          row(l10n.player, scalarValue('backend')),
          row(l10n.playMethod, scalarValue('playMethod')),
          row(l10n.transcodeReasons, listValue('transcodingReasons')),
          row(l10n.container, scalarValue('container')),
          row(l10n.videoCodec, scalarValue('videoCodec')),
          row(l10n.profile, scalarValue('videoProfile')),
          row(
            l10n.settingsAudioDiagnosticsVideoLevel,
            scalarValue('videoLevel'),
          ),
          row(
            l10n.settingsAudioDiagnosticsVideoRange,
            scalarValue('videoRange'),
          ),
          row(l10n.audioCodec, scalarValue('audioCodec')),
          row(l10n.profile, scalarValue('audioProfile')),
          row(l10n.channels, scalarValue('audioChannels')),
          row(
            l10n.settingsAudioDiagnosticsSubtitleCodec,
            scalarValue('subtitleCodec'),
          ),
          row(
            l10n.settingsAudioDiagnosticsAllowedAudioCodecs,
            listValue('allowedAudioCodecs'),
          ),
          row(
            l10n.settingsAudioDiagnosticsHlsMpegTsAudioCodecs,
            listValue('hlsMpegTsAudioCodecs'),
          ),
          row(
            l10n.settingsAudioDiagnosticsHlsFmp4AudioCodecs,
            listValue('hlsFmp4AudioCodecs'),
          ),
          row(
            l10n.settingsAudioDiagnosticsAudioSpdifPassthrough,
            listValue('audioSpdifCodecs'),
          ),
          row(
            l10n.settingsAudioDiagnosticsActiveAudioRoute,
            scalarValue('activeRouteType'),
          ),
          row(
            l10n.settingsAudioDiagnosticsRouteHdAudioSupport,
            diagnostics['routeSupportsHdAudio'] == true
                ? l10n.settingsEnabledOnThisDevice
                : l10n.no,
          ),
          if (maxStreamingBitrate != null)
            row(l10n.maxStreamingBitrate, _formatBitrate(maxStreamingBitrate)),
        ];

        addSection(l10n.settingsAudioDiagnostics, diagnosticsRows);
      }
    }

    return sections;
  }

  String _castKindLabel(CastTargetKind kind, AppLocalizations l10n) {
    return switch (kind) {
      CastTargetKind.googleCast => 'Google Cast',
      CastTargetKind.airPlay => 'AirPlay',
      CastTargetKind.dlna => 'DLNA',
      _ => l10n.cast,
    };
  }

  String _castStateLabel(String state, AppLocalizations l10n) {
    final base = state.isEmpty
        ? l10n.unknown
        : '${state[0].toUpperCase()}${state.substring(1)}';
    if (_remotePositionTicks <= 0) {
      return base;
    }
    return '$base · ${_formatDuration(Duration(microseconds: _remotePositionTicks ~/ 10))}';
  }

  Future<List<Map<String, dynamic>>> _resolveCastPeopleForMetadata(
    dynamic item,
  ) async {
    if (item is! AggregatedItem || !_hasCastCrew(item)) {
      return const <Map<String, dynamic>>[];
    }

    final cacheKey = '${item.serverId}:${item.id}';
    final cached = _media3CastPeopleCache[cacheKey];
    if (cached != null) {
      return cached;
    }

    final imageApi = _clientForItem(item).imageApi;
    final people = await _resolveCastPeople(item);
    final resolved = people
        .map((person) {
          final name = (person['Name'] as String?)?.trim() ?? '';
          if (name.isEmpty) {
            return null;
          }
          final personId = person['Id']?.toString().trim() ?? '';
          final imageTag = (person['PrimaryImageTag'] as String?)?.trim();
          final role = (person['Role'] as String?)?.trim();
          final type = (person['Type'] as String?)?.trim();
          final subtitle = (role != null && role.isNotEmpty)
              ? role
              : ((type != null && type.isNotEmpty) ? type : '');

          String imageUrl = '';
          if (personId.isNotEmpty && imageTag != null && imageTag.isNotEmpty) {
            imageUrl = imageApi.getPrimaryImageUrl(
              personId,
              maxHeight: 200,
              tag: imageTag,
            );
          }

          return <String, dynamic>{
            'name': name,
            'subtitle': subtitle,
            'personId': personId,
            'imageUrl': imageUrl,
            'serverId': item.serverId,
          };
        })
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);

    _media3CastPeopleCache[cacheKey] = resolved;
    return resolved;
  }

  Future<void> _openMedia3CastPerson(Map<String, dynamic> event) async {
    final personId = event['personId']?.toString().trim();
    if (personId == null || personId.isEmpty) return;

    final fromEventServerId = event['serverId']?.toString().trim();
    final fallbackServerId = _serverIdForQueueItem(_queue.currentItem);
    final serverId = (fromEventServerId != null && fromEventServerId.isNotEmpty)
        ? fromEventServerId
        : fallbackServerId;

    await _activeMedia3Backend?.stopNativeActivity();
    if (!mounted) return;

    context.push(Destinations.item(personId, serverId: serverId));
  }

  Future<void> _pushMedia3UiMetadata() async {
    final backend = _activeMedia3Backend;
    if (backend == null) return;

    final l10n = AppLocalizations.of(context);
    final item = _queue.currentItem;
    final chapters = <Map<String, dynamic>>[];
    final streamInfoSections = _buildMedia3StreamInfoSections();
    final hasCastCrew = _hasCastCrew(item);
    final castPeople = await _resolveCastPeopleForMetadata(item);
    final castKind = _castService.activeKind;
    final canCastControl = castKind != null;
    final castKindLabel = castKind == null
        ? ''
        : _castKindLabel(castKind, l10n);
    final castStateLabel = _remotePlaybackState == null
        ? ''
        : _castStateLabel(_remotePlaybackState!, l10n);
    final artworkUrl = _artworkUrlForQueueItem(item) ?? '';

    List<Map<String, dynamic>>? rawChapters;
    if (item is AggregatedItem) {
      rawChapters = item.chapters;
    } else if (item is String) {
      rawChapters = (_manager.currentOfflineMetadata?['Chapters'] as List?)
          ?.cast<Map<String, dynamic>>();
    }

    if (rawChapters != null) {
      for (var i = 0; i < rawChapters.length; i++) {
        final chapter = rawChapters[i];
        final ticks = (chapter['StartPositionTicks'] as int?) ?? 0;
        final startMs = ticks ~/ 10000;
        final title = (chapter['Name'] as String?)?.trim();
        chapters.add({
          'title': (title != null && title.isNotEmpty)
              ? title
              : 'Chapter ${i + 1}',
          'startMs': startMs,
        });
      }
    }

    String topTitle = '';
    String topSubtitle = '';
    if (item is AggregatedItem) {
      final episodeInfo = item.indexNumber != null
          ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
          : null;
      topSubtitle = item.seriesName ?? '';
      topTitle = [
        ?episodeInfo,
        item.name,
      ].where((s) => s.isNotEmpty).join(' - ');
    } else if (item is Map) {
      final title = (item['Name'] as String?) ?? '';
      final series = (item['SeriesName'] as String?) ?? '';
      final idx = item['IndexNumber'];
      final episodeInfo = idx != null
          ? 'S${item['ParentIndexNumber'] ?? '?'}:E$idx'
          : null;
      topSubtitle = series;
      topTitle = [?episodeInfo, title].where((s) => s.isNotEmpty).join(' - ');
    } else if (item is String) {
      final meta = _manager.currentOfflineMetadata;
      final title = (meta?['Name'] as String?) ?? item.split('/').last;
      final series = (meta?['SeriesName'] as String?) ?? '';
      final idx = meta?['IndexNumber'] as int?;
      final parentIdx = meta?['ParentIndexNumber'] as int?;
      final episodeInfo = idx != null ? 'S${parentIdx ?? '?'}:E$idx' : null;
      topSubtitle = series;
      topTitle = [?episodeInfo, title].where((s) => s.isNotEmpty).join(' - ');
    }

    await backend.setUiMetadata(
      hasPrevious: _queue.hasPrevious,
      hasNext: _queue.hasNext,
      chapters: chapters,
      skipBackMs: _prefs.get(UserPreferences.skipBackLength),
      skipForwardMs: _prefs.get(UserPreferences.skipForwardLength),
      topTitle: topTitle,
      topSubtitle: topSubtitle,
      artworkUrl: artworkUrl,
      showClock: false,
      zoomModeLabel: _zoomModeLabel(_zoomMode),
      streamInfoSections: streamInfoSections,
      hasCastCrew: hasCastCrew,
      castPeople: castPeople,
      canCastControl: canCastControl,
      castKindLabel: castKindLabel,
      castStateLabel: castStateLabel,
      castPositionMs: _remotePositionTicks ~/ 10000,
      castVolume: _remoteVolume,
      selectedBitrateMbps: _manager.maxBitrateOverrideMbps,
    );
  }

  void _onMedia3ActivityAction(Map<String, dynamic> event) {
    if (!mounted || _activeMedia3Backend == null) {
      return;
    }

    final action = event['action'] as String?;
    switch (action) {
      case 'next':
        unawaited(
          _runSinglePlayerMutation(
            'native_activity_next',
            () async => _manager.next(),
            suppressBackFor: const Duration(milliseconds: 500),
          ),
        );
        return;
      case 'previous':
        unawaited(
          _runSinglePlayerMutation(
            'native_activity_previous',
            () async => _manager.previous(),
            suppressBackFor: const Duration(milliseconds: 500),
          ),
        );
        return;
      case 'setBitrate':
        final raw = event['bitrateMbps'];
        final selectedBitrate = raw is num ? raw.toInt() : null;
        _manager.changeBitrate(selectedBitrate);
        unawaited(_pushMedia3UiMetadata());
        return;
      case 'toggleZoom':
        final modes = ZoomMode.values;
        final next = modes[(_zoomMode.index + 1) % modes.length];
        setState(() => _zoomMode = next);
        _prefs.set(UserPreferences.playerZoomMode, next);
        _showZoomModeToast(next);
        unawaited(_syncMedia3ZoomMode());
        unawaited(_pushMedia3UiMetadata());
        return;
      case 'castPlay':
        unawaited(_runCastAction((k) => _castService.play(k)));
        return;
      case 'castPause':
        unawaited(_runCastAction((k) => _castService.pause(k)));
        return;
      case 'castSyncPosition':
        final positionTicks = _state.position.inMicroseconds * 10;
        unawaited(
          _runCastAction(
            (k) => _castService.seek(k, positionTicks: positionTicks),
          ),
        );
        return;
      case 'castStop':
        unawaited(_runCastAction((k) => _castService.stop(k)));
        return;
      case 'castSetVolume':
        final raw = event['volume'];
        if (raw is num) {
          unawaited(_setRemoteVolume(raw.toDouble().clamp(0.0, 1.0)));
        }
        return;
      case 'showCastCrew':
        unawaited(_showCast());
        return;
      case 'openCastPerson':
        unawaited(_openMedia3CastPerson(event));
        return;
      default:
        return;
    }
  }

  void _loadTrickplayInfo(dynamic item) {
    final rawData = _rawDataForQueueItem(item);
    if (rawData == null) {
      if (mounted) {
        setState(() {
          _trickplayInfo = null;
          _trickplayMediaSourceId = null;
        });
      }
      return;
    }

    final mediaSourceId = _manager.currentResolution?.mediaSourceId;
    final info = TrickplayInfo.fromItemData(
      rawData,
      mediaSourceId: mediaSourceId,
    );
    if (mounted) {
      setState(() {
        _trickplayInfo = info;
        _trickplayMediaSourceId = mediaSourceId;
      });
    }
  }

  void _refreshTrickplayIfNeeded() {
    final item = _queue.currentItem;
    if (_rawDataForQueueItem(item) == null) return;
    final resolvedSourceId = _manager.currentResolution?.mediaSourceId;
    if (resolvedSourceId != null &&
        resolvedSourceId != _trickplayMediaSourceId) {
      _loadTrickplayInfo(item);
    }
  }

  void _onPositionUpdate(Duration position) {
    if (!mounted || _isSeeking || _isRestoringPosition) return;
    if (PlatformDetection.useNativeVideoSurface) {
      _syncSubtitleActive();
    }
    _refreshTrickplayIfNeeded();
    _syncAirPlayPlaybackState(position: position);
    _checkSegments(position);
    _checkNextUp(position);
  }

  void _syncAirPlayPlaybackState({Duration? position}) {
    if (_castService.activeKind != CastTargetKind.airPlay) return;
    final pos = position ?? _state.position;
    final ticks = pos.inMicroseconds * 10;
    _nativeAirPlay
        .updateAirPlayPlaybackState(
          isPlaying: _state.isPlaying,
          isBuffering: _state.isBuffering,
          positionTicks: ticks,
        )
        .catchError((_) {});
    _castService.remotePositionNotifier.value = ticks;
    _castService.remoteStateNotifier.value = _state.isBuffering
        ? 'buffering'
        : (_state.isPlaying ? 'playing' : 'paused');
  }

  bool _areSeekPromptsSuppressed() {
    final until = _suppressSeekPromptsUntil;
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  void _syncMediaQueuingPreference() {
    _manager.autoAdvanceEnabled = _prefs.get(
      UserPreferences.autoplayNextEpisode,
    );
  }

  void _suppressSeekPrompts({
    Duration duration = _seekPromptSuppressionDuration,
    bool dismissVisiblePrompts = true,
  }) {
    final until = DateTime.now().add(duration);
    final currentUntil = _suppressSeekPromptsUntil;
    if (currentUntil == null || until.isAfter(currentUntil)) {
      _suppressSeekPromptsUntil = until;
    }

    if (!dismissVisiblePrompts || !mounted) return;

    final hadSkipPrompt = _skipSegment != null;
    final hadNextUpPrompt = _showNextUp;
    if (!hadSkipPrompt && !hadNextUpPrompt) return;

    setState(() {
      if (hadSkipPrompt) {
        _skipSegment = null;
        _skipTo = null;
      }
      if (hadNextUpPrompt) {
        _showNextUp = false;
        _nextUpItem = null;
      }
    });

    if (hadNextUpPrompt) {
      _manager.suppressAutoNext = false;
    }
  }

  void _checkSegments(Duration position) {
    final result = _segmentService.checkPosition(position);
    final replaceSkipOutroWithNextUp = _prefs.get(
      UserPreferences.replaceSkipOutroWithNextUp,
    );
    if (result.shouldSkip && result.skipTo != null) {
      final isOutro = result.segment?.type == MediaSegmentType.outro;
      if (replaceSkipOutroWithNextUp && isOutro && _showNextUp) {
        return;
      }
      if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUpOverlay()) {
        unawaited(_manager.seekTo(result.skipTo!));
        _presentNextUpOverlay();
        return;
      }
      if (isOutro && !_hasDistinctQueueNextItem()) {
        unawaited(_exitPlayback());
        return;
      }
      _manager.seekTo(result.skipTo!);
      _clearSkipSegment();
      return;
    }
    if (_areSeekPromptsSuppressed()) {
      if (_skipSegment != null) {
        _clearSkipSegment();
      }
      return;
    }
    if (result.shouldAsk && result.isNew && result.segment != null) {
      final isOutro = result.segment!.type == MediaSegmentType.outro;
      if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUpOverlay()) {
        _presentNextUpOverlay();
        return;
      }
      setState(() {
        _skipSegment = result.segment;
        _skipTo = result.skipTo;
        _controlsVisible = false;
      });
      _hideTimer?.cancel();
      _focusTvSkipSegment();
    } else if (result.isNone && _skipSegment != null) {
      _clearSkipSegment();
    }
  }

  void _checkNextUp(Duration position) {
    if (!_shouldShowNextUpOverlay()) {
      return;
    }

    final nextUpBehavior = _prefs.get(UserPreferences.nextUpBehavior);

    final duration = _state.duration;
    if (duration <= Duration.zero) return;

    final remaining = duration - position;
    final threshold = nextUpBehavior == NextUpBehavior.extended
        ? const Duration(seconds: 1)
        : const Duration(milliseconds: 500);

    final activeSegment = _segmentService.activeSegment;
    final inOutro = activeSegment?.type == MediaSegmentType.outro;
    if (inOutro && remaining > threshold) {
      return;
    }

    if (remaining <= threshold) {
      _presentNextUpOverlay();
    }
  }

  bool _shouldShowNextUpOverlay() {
    final nextUpBehavior = _prefs.get(UserPreferences.nextUpBehavior);
    if (_areSeekPromptsSuppressed() ||
        nextUpBehavior == NextUpBehavior.disabled ||
        _nextUpDismissed ||
        _showNextUp) {
      return false;
    }

    if (_isPrerollQueueItem(_queue.currentItem)) {
      return false;
    }

    return _nextUpCandidate() != null;
  }

  bool _isEligibleNextQueueItem(dynamic item) {
    if (item is AggregatedItem) {
      return isEligibleNextEpisodeCandidate(item);
    }
    if (item is Map) {
      return isEligibleNextEpisodeCandidateRaw(item.cast<String, dynamic>());
    }
    return true;
  }

  bool _hasDistinctQueueNextItem() {
    if (!_queue.hasNext) {
      return false;
    }

    // Treat repeat-all wraparound as "no real next episode" for Next Up.
    final currentIndex = _queue.currentIndex;
    if (currentIndex < 0 || currentIndex >= _queue.length - 1) {
      return false;
    }

    final nextItem = _queue.peekNext;
    if (nextItem == null) {
      return false;
    }

    if (!_isEligibleNextQueueItem(nextItem)) {
      return false;
    }

    final currentId = _itemIdForQueueItem(_queue.currentItem);
    final nextId = _itemIdForQueueItem(nextItem);
    if (currentId != null && nextId != null && currentId == nextId) {
      return false;
    }

    return true;
  }

  AggregatedItem? _nextUpCandidate() {
    if (!_hasDistinctQueueNextItem()) {
      return null;
    }

    final nextItem = _queue.peekNext;
    return nextItem is AggregatedItem ? nextItem : null;
  }

  void _presentNextUpOverlay() {
    if (!_shouldShowNextUpOverlay()) return;

    final nextItem = _nextUpCandidate();
    if (nextItem == null) return;

    _manager.suppressAutoNext = true;
    setState(() {
      _showNextUp = true;
      _nextUpItem = nextItem;
      _controlsVisible = false;
      _skipSegment = null;
      _skipTo = null;
    });
    _hideTimer?.cancel();
    _focusTvNextUpPlay();
  }

  Future<void> _handleNextUpPlay() async {
    if (_isNextUpAdvancing) return;
    if (!_hasDistinctQueueNextItem()) {
      _handleNextUpCancel();
      return;
    }
    _suppressBackNavigation(duration: const Duration(milliseconds: 500));
    _isNextUpAdvancing = true;
    setState(() => _showNextUp = false);
    try {
      await _checkStillWatching();
      await _manager.next();
    } finally {
      _isNextUpAdvancing = false;
    }
  }

  void _handleNextUpDismiss() {
    _suppressBackNavigation(duration: const Duration(milliseconds: 500));
    _manager.suppressAutoNext = false;
    setState(() {
      _showNextUp = false;
      _nextUpDismissed = true;
    });
  }

  void _handleNextUpCancel() {
    _suppressBackNavigation(duration: const Duration(milliseconds: 500));
    setState(() {
      _showNextUp = false;
      _nextUpDismissed = true;
    });
    unawaited(_exitPlayback());
  }

  void _focusTvNextUpPlay({int attempt = 0}) {
    if (!PlatformDetection.isTV || !_showNextUp) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_showNextUp) return;
      _tvNextUpPlayFocus.requestFocus();

      if (!_tvNextUpPlayFocus.hasFocus && attempt < 8) {
        Future<void>.delayed(const Duration(milliseconds: 50), () {
          if (!mounted) return;
          _focusTvNextUpPlay(attempt: attempt + 1);
        });
      }
    });
  }

  Future<void> _checkStillWatching() async {
    final behavior = _prefs.get(UserPreferences.stillWatchingBehavior);
    if (behavior == StillWatchingBehavior.disabled) return;
    if (_consecutiveEpisodes < behavior.episodes) return;

    _manager.pause();
    final shouldContinue = await StillWatchingDialog.show(context);
    if (shouldContinue == true) {
      _consecutiveEpisodes = 0;
      _manager.resume();
    } else {
      _exitPlayback();
    }
  }

  void _skipCurrentSegment() {
    final replaceSkipOutroWithNextUp = _prefs.get(
      UserPreferences.replaceSkipOutroWithNextUp,
    );
    final isOutro =
        _skipSegment?.type == MediaSegmentType.outro ||
        _segmentService.activeSegment?.type == MediaSegmentType.outro;
    if (isOutro) {
      final item = _queue.currentItem;
      final itemId = _itemIdForQueueItem(item);
      if (itemId != null && itemId.isNotEmpty) {
        try {
          final mutations = ItemMutationRepository(_clientForQueueItem(item));
          unawaited(
            mutations.setPlayed(itemId, isPlayed: true).catchError((_) {}),
          );
          final raw = _rawDataForQueueItem(item);
          if (raw != null) {
            final existingUserData = raw['UserData'];
            final userData = existingUserData is Map<String, dynamic>
                ? existingUserData
                : (existingUserData is Map
                      ? existingUserData.cast<String, dynamic>()
                      : <String, dynamic>{});
            userData['Played'] = true;
            raw['UserData'] = userData;
          }
        } catch (_) {}
      }
    }
    if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUpOverlay()) {
      final skipTo = _skipTo;
      if (skipTo != null) {
        unawaited(_manager.seekTo(skipTo));
      }
      _presentNextUpOverlay();
      return;
    }
    if (isOutro && !_hasDistinctQueueNextItem()) {
      unawaited(_exitPlayback());
      return;
    }

    if (_skipTo != null) {
      _manager.seekTo(_skipTo!);
    }
    setState(() {
      _skipSegment = null;
      _skipTo = null;
    });
    _showControls(focusSeekbar: true);
  }

  void _dismissSkipSegment() {
    _suppressBackNavigation(duration: const Duration(milliseconds: 500));
    _clearSkipSegment();
  }

  void _clearSkipSegment() {
    setState(() {
      _skipSegment = null;
      _skipTo = null;
    });
  }

  Future<void> _exitPlayback() async {
    if (_isStopping) return;
    setState(() {
      _isStopping = true;
    });
    _cancelTvTemporarySpeedHold();
    if (!PlatformDetection.isTV) _pipService.enableAutoPiP(false);
    if (_wasAlwaysOnTopOnEntry == false && _isAlwaysOnTop) {
      await _setAlwaysOnTop(false);
    }
    if (PlatformDetection.useDesktopUi &&
        _wasDesktopFullscreenOnEntry == false) {
      final isFullscreen = await FullscreenHelper.isFullscreen();
      if (isFullscreen) {
        await _setDesktopFullscreen(false);
      }
    }
    await _restoreSystemUiForExit();
    if (mounted) {
      _dismissTopOverlayRouteIfAny();
      setState(() {
        _readyToPop = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          if (context.canPop()) {
            context.pop();
          } else {
            Navigator.of(context).pop();
          }
        }
      });
    }
    unawaited(_manager.stop(userInitiated: false));
  }

  Future<void> _restoreSystemUiForExit() async {
    if (_didRestoreSystemUiOnExit) return;
    _didRestoreSystemUiOnExit = true;
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([]);
  }

  void _updateDisplayPlaying(bool playing) {
    _displayPlayingDebounce?.cancel();
    _displayPlayingDebounce = null;
    if (playing) {
      if (!_displayPlaying && mounted) {
        setState(() => _displayPlaying = true);
      }
      return;
    }
    final delay = _state.isBuffering
        ? const Duration(milliseconds: 600)
        : const Duration(milliseconds: 200);
    _displayPlayingDebounce = Timer(delay, () {
      if (mounted && !_state.isPlaying) {
        setState(() => _displayPlaying = false);
      }
    });
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    final hideDelay = PlatformDetection.useMobileUi
        ? const Duration(seconds: 8)
        : const Duration(seconds: 5);
    _hideTimer = Timer(hideDelay, () {
      if (mounted && _state.isPlaying) {
        setState(() {
          _controlsVisible = false;
          if (PlatformDetection.isMobile &&
              _prefs.get(UserPreferences.osdLockEnabled)) {
            _isOsdLocked = true;
          }
        });
      }
    });
  }

  void _onSeekbarFocusChange() {
    if (mounted) setState(() => _seekbarFocused = _tvSeekbarFocus.hasFocus);
  }

  void _focusTvPrimaryButton() {
    if (!PlatformDetection.isTV) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_controlsVisible) return;
      _tvBottomPrimaryFocus.requestFocus();
    });
  }

  void _focusTvSeekbar({int attempt = 0}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_controlsVisible || _isOsdLocked) return;
      _tvSeekbarFocus.requestFocus();

      if (!_tvSeekbarFocus.hasFocus && attempt < 8) {
        Future<void>.delayed(const Duration(milliseconds: 50), () {
          if (!mounted) return;
          _focusTvSeekbar(attempt: attempt + 1);
        });
      }
    });
  }

  void _focusTvSkipSegment({int attempt = 0}) {
    if (!PlatformDetection.isTV || _skipSegment == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _skipSegment == null) return;
      _tvSkipSegmentFocus.requestFocus();

      if (!_tvSkipSegmentFocus.hasFocus && attempt < 8) {
        Future<void>.delayed(const Duration(milliseconds: 50), () {
          if (!mounted) return;
          _focusTvSkipSegment(attempt: attempt + 1);
        });
      }
    });
  }

  void _focusPreferredTvOverlayTarget() {
    if (!PlatformDetection.isTV) return;
    if (_showNextUp) {
      _focusTvNextUpPlay();
      return;
    }
    if (_skipSegment != null) {
      _focusTvSkipSegment();
      return;
    }
    _focusTvSeekbar();
  }

  void _showControls({bool focusSeekbar = false}) {
    if (_isCurrentPreroll) {
      _syncPrerollOsdState();
      return;
    }
    setState(() => _controlsVisible = true);
    _scheduleHide();
    if (focusSeekbar) {
      _focusPreferredTvOverlayTarget();
    }
  }

  void _toggleControls() {
    if (_isCurrentPreroll) {
      _syncPrerollOsdState();
      return;
    }
    if (_isOsdLocked) {
      _showControls();
      return;
    }
    if (_controlsVisible) {
      _hideTimer?.cancel();
      setState(() => _controlsVisible = false);
    } else {
      _showControls();
    }
  }

  bool _dismissTopOverlayRouteIfAny() {
    final currentRoute = ModalRoute.of(context);
    if (currentRoute == null) return false;

    final navigator = Navigator.of(context);
    var dismissed = false;
    navigator.popUntil((route) {
      if (route == currentRoute) return true;
      dismissed = true;
      return false;
    });
    return dismissed;
  }

  void _seekRelative(int ms, {bool showControls = true}) {
    _suppressSeekPrompts();
    final target = _state.position + Duration(milliseconds: ms);
    final clamped = Duration(
      milliseconds: target.inMilliseconds.clamp(
        0,
        _state.duration.inMilliseconds,
      ),
    );
    _manager.seekTo(clamped);
    _lastSeekTime = DateTime.now();
    if (showControls) {
      _showControls();
    }
  }

  void _seekRelativeDebounced(int ms, {bool showControls = true}) {
    _suppressSeekPrompts();
    final basePosition = _pendingScrubSeekTarget ?? _state.position;
    final target = basePosition + Duration(milliseconds: ms);
    _scheduleDebouncedScrubSeek(target, showControls: showControls);
  }

  void _scheduleDebouncedScrubSeek(
    Duration target, {
    bool showControls = true,
  }) {
    final clamped = Duration(
      milliseconds: target.inMilliseconds.clamp(
        0,
        _state.duration.inMilliseconds,
      ),
    );
    setState(() {
      _pendingScrubSeekTarget = clamped;
      _isSeeking = true;
      _seekValue = clamped.inMilliseconds.toDouble();
    });
    _scrubSeekDebounceTimer?.cancel();
    _scrubSeekDebounceTimer = Timer(_scrubSeekDebounceDuration, () {
      final pendingTarget = _pendingScrubSeekTarget;
      if (pendingTarget != null) {
        _pendingScrubSeekTarget = null;
        _scrubSeekDebounceTimer = null;
        unawaited(_manager.seekTo(pendingTarget));
        _lastSeekTime = DateTime.now();
        if (mounted) {
          setState(() {
            _isSeeking = false;
          });
        }
      }
    });
    if (showControls) {
      _showControls();
    }
  }

  Future<void> _resumeWithConfiguredRewind() async {
    final rewindMs = _prefs.get(UserPreferences.unpauseRewindDuration);
    if (rewindMs > 0) {
      final rewind = Duration(milliseconds: rewindMs);
      final current = _state.position;
      final target = current > rewind ? current - rewind : Duration.zero;
      try {
        await _manager.seekTo(target);
      } catch (_) {}
    }
    await _manager.resume();
  }

  void _togglePlayPause() {
    if (_state.isPlaying) {
      _manager.pause();
      return;
    }
    _resumeWithConfiguredRewind();
  }

  bool _isTvTemporarySpeedKey(LogicalKeyboardKey key) {
    return key == LogicalKeyboardKey.mediaPause;
  }

  bool _canUseTvTemporarySpeedHold() {
    if (!PlatformDetection.isTV) return false;
    if (_castService.activeKind != null) return false;
    if (_isCurrentPreroll) return false;
    if (_isOsdLocked) return false;
    if (!_state.isPlaying) return false;
    if (_syncPlayManager?.state.enabled == true) return false;
    return true;
  }

  KeyEventResult _handleTvTemporarySpeedKeyDownOrRepeat(KeyEvent event) {
    final key = event.logicalKey;
    if (!_isTvTemporarySpeedKey(key)) {
      return KeyEventResult.ignored;
    }

    if (event is KeyRepeatEvent) {
      return KeyEventResult.handled;
    }

    if (!_canUseTvTemporarySpeedHold()) {
      return KeyEventResult.ignored;
    }

    _tvTemporarySpeedHoldTimer?.cancel();
    _tvTemporarySpeedHoldKey = key;
    _tvTemporarySpeedHoldActive = false;
    _tvTemporarySpeedRestoreSpeed = null;
    _tvTemporarySpeedHoldTimer = Timer(_tvTemporarySpeedHoldDelay, () {
      unawaited(_activateTvTemporarySpeedHold(key));
    });
    return KeyEventResult.handled;
  }

  KeyEventResult _handleTvTemporarySpeedKeyUp(KeyUpEvent event) {
    final key = event.logicalKey;
    if (!_isTvTemporarySpeedKey(key) || _tvTemporarySpeedHoldKey != key) {
      return KeyEventResult.ignored;
    }

    final didTriggerHold = _tvTemporarySpeedHoldActive;
    _tvTemporarySpeedHoldTimer?.cancel();
    _tvTemporarySpeedHoldTimer = null;
    _tvTemporarySpeedHoldKey = null;

    if (didTriggerHold) {
      _cancelTvTemporarySpeedHold();
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.mediaPause) {
      _manager.pause();
    } else {
      _togglePlayPause();
    }
    _showControls();
    _focusTvPrimaryButton();
    return KeyEventResult.handled;
  }

  Future<void> _activateTvTemporarySpeedHold(LogicalKeyboardKey key) async {
    if (!mounted || _tvTemporarySpeedHoldKey != key) return;
    if (!_canUseTvTemporarySpeedHold()) return;

    _tvTemporarySpeedHoldActive = true;
    _tvTemporarySpeedRestoreSpeed ??= _state.playbackSpeed;

    if ((_state.playbackSpeed - _tvTemporarySpeed).abs() < 0.001) {
      return;
    }

    try {
      await _manager.setPlaybackSpeed(_tvTemporarySpeed);
    } catch (_) {}
  }

  Future<void> _restoreTvTemporarySpeed(double speed) async {
    try {
      await _manager.setPlaybackSpeed(speed);
    } catch (_) {}
  }

  void _cancelTvTemporarySpeedHold() {
    _tvTemporarySpeedHoldTimer?.cancel();
    _tvTemporarySpeedHoldTimer = null;
    _tvTemporarySpeedHoldKey = null;

    final shouldRestore = _tvTemporarySpeedHoldActive;
    final restoreSpeed = _tvTemporarySpeedRestoreSpeed;

    _tvTemporarySpeedHoldActive = false;
    _tvTemporarySpeedRestoreSpeed = null;

    if (shouldRestore && restoreSpeed != null) {
      unawaited(_restoreTvTemporarySpeed(restoreSpeed));
    }
  }

  int _accelerateSeekStep(int baseMs, KeyEvent event) {
    final key = event.logicalKey;
    if (event is KeyDownEvent) {
      _seekDirection = key;
      _seekRepeatCount = 0;
      return baseMs;
    }
    if (event is KeyRepeatEvent) {
      if (_seekDirection != key) {
        _seekDirection = key;
        _seekRepeatCount = 0;
        return baseMs;
      }
      _seekRepeatCount++;
      if (_seekRepeatCount > 18) return baseMs * 12;
      if (_seekRepeatCount > 10) return baseMs * 6;
      if (_seekRepeatCount > 4) return baseMs * 2;
      return baseMs;
    }
    return baseMs;
  }

  void _resetSeekAcceleration() {
    _seekDirection = null;
    _seekRepeatCount = 0;
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  String _formatDelay(double seconds) {
    if (seconds == 0) return AppLocalizations.of(context).none;
    return '${seconds >= 0 ? '+' : ''}${(seconds * 1000).round()} ms';
  }

  SubtitleViewConfiguration _buildSubtitleConfig() {
    final textColor = Color(_prefs.get(UserPreferences.subtitlesTextColor));
    final bgColor = Color(_prefs.get(UserPreferences.subtitlesBackgroundColor));
    final strokeColor = Color(
      _prefs.get(UserPreferences.subtitleTextStrokeColor),
    );
    final prefSize = _prefs.get(UserPreferences.subtitlesTextSize);
    final fontWeight = _prefs.get(UserPreferences.subtitlesTextWeight);
    final offset = _prefs.get(UserPreferences.subtitlesOffsetPosition);

    final baseSize = PlatformDetection.useMobileUi ? 40.0 : 32.0;
    final fontSize = (prefSize / 24.0) * baseSize;

    final basePadding = PlatformDetection.useMobileUi ? 16.0 : 24.0;
    final bottomPadding =
        basePadding + (offset * MediaQuery.sizeOf(context).height * 0.5);

    final strokeShadows = subtitleStrokeShadows(strokeColor, fontSize);

    final activeIndex = _manager.subtitleStreamIndex;
    bool isAssOrPgs = false;
    if (activeIndex != null && activeIndex >= 0) {
      final mediaStreams = _manager.currentResolution?.mediaStreams;
      if (mediaStreams != null) {
        final activeStream = mediaStreams.firstWhere(
          (s) => s['Index'] == activeIndex,
          orElse: () => const <String, dynamic>{},
        );
        final codec = activeStream['Codec'] as String?;
        isAssOrPgs = shouldRenderSubtitleNatively(codec);
      }
    }

    return SubtitleViewConfiguration(
      visible: PlatformDetection.isDesktop ? false : !isAssOrPgs,
      style: TextStyle(
        inherit: false,
        height: 1.4,
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight >= 700 ? FontWeight.bold : FontWeight.normal,
        backgroundColor: bgColor,
        fontFamilyFallback: const ['Roboto', 'Noto Sans', 'Arial'],
        shadows: strokeShadows,
      ),
      textAlign: TextAlign.center,
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, bottomPadding),
    );
  }

  void _applySubtitleStyle() {
    final backend = _activeBackend;
    if (backend == null) return;

    final textColor = _prefs.get(UserPreferences.subtitlesTextColor);
    final backgroundColor = _prefs.get(
      UserPreferences.subtitlesBackgroundColor,
    );
    final strokeColor = _prefs.get(UserPreferences.subtitleTextStrokeColor);
    final fontSize = _prefs.get(UserPreferences.subtitlesTextSize);
    final fontWeight = _prefs.get(UserPreferences.subtitlesTextWeight);
    final verticalOffset = _prefs.get(UserPreferences.subtitlesOffsetPosition);

    // Embedded-style overrides are Media3-specific (Android only) and live on
    // the Media3PlayerBackend's wider signature, not the base PlayerBackend.
    if (backend is Media3PlayerBackend) {
      unawaited(
        backend.configureSubtitleStyle(
          textColor: textColor,
          backgroundColor: backgroundColor,
          strokeColor: strokeColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          verticalOffset: verticalOffset,
          applyEmbeddedStyles: _prefs.get(
            UserPreferences.subtitlesUseEmbeddedStyles,
          ),
          applyEmbeddedFontSizes: _prefs.get(
            UserPreferences.subtitlesUseEmbeddedFontSizes,
          ),
        ),
      );
    } else {
      unawaited(
        backend.configureSubtitleStyle(
          textColor: textColor,
          backgroundColor: backgroundColor,
          strokeColor: strokeColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          verticalOffset: verticalOffset,
        ),
      );
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (_isCurrentPreroll) {
      if (event is KeyUpEvent) {
        final isBackKey = event.logicalKey.isBackKey;
        if (isBackKey) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      }

      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }

      if (event is KeyDownEvent) {
        final isBackKey = event.logicalKey.isBackKey;

        if (isBackKey) {
          if (!_isBackNavigationSuppressed()) {
            _exitPlayback();
          }
          return KeyEventResult.handled;
        }

        switch (event.logicalKey) {
          case LogicalKeyboardKey.mediaPlay:
            unawaited(_resumeWithConfiguredRewind());
            return KeyEventResult.handled;
          case LogicalKeyboardKey.mediaPause:
            _manager.pause();
            return KeyEventResult.handled;
          case LogicalKeyboardKey.mediaPlayPause:
          case LogicalKeyboardKey.space:
          case LogicalKeyboardKey.enter:
          case LogicalKeyboardKey.select:
            _togglePlayPause();
            return KeyEventResult.handled;

          case LogicalKeyboardKey.mediaFastForward:
            unawaited(_manager.next());
            return KeyEventResult.handled;

          case LogicalKeyboardKey.mediaRewind:
            unawaited(_manager.seekTo(Duration.zero));
            _lastSeekTime = DateTime.now();
            unawaited(_manager.resume());
            return KeyEventResult.handled;

          default:
            return KeyEventResult.handled;
        }
      }

      if (event is KeyRepeatEvent) {
        final isBackKey = event.logicalKey.isBackKey;
        if (isBackKey) {
          return KeyEventResult.handled;
        }

        switch (event.logicalKey) {
          case LogicalKeyboardKey.mediaPlay:
          case LogicalKeyboardKey.mediaPause:
          case LogicalKeyboardKey.mediaPlayPause:
          case LogicalKeyboardKey.space:
          case LogicalKeyboardKey.enter:
          case LogicalKeyboardKey.select:
          case LogicalKeyboardKey.mediaFastForward:
          case LogicalKeyboardKey.mediaRewind:
            return KeyEventResult.handled;
          default:
            return KeyEventResult.handled;
        }
      }

      return KeyEventResult.ignored;
    }

    if (event is KeyUpEvent) {
      final temporarySpeedResult = _handleTvTemporarySpeedKeyUp(event);
      if (temporarySpeedResult != KeyEventResult.ignored) {
        return temporarySpeedResult;
      }
      final isBackKey = event.logicalKey.isBackKey;
      if (isBackKey) {
        // KeyUp for Back should be consumed to avoid a second route pop.
        return KeyEventResult.handled;
      }
      if (PlatformDetection.isTV && _controlsVisible && !_isOsdLocked) {
        _scheduleHide();
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
          event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _resetSeekAcceleration();
      }
      return KeyEventResult.ignored;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    if (PlatformDetection.isTV) {
      final temporarySpeedResult = _handleTvTemporarySpeedKeyDownOrRepeat(
        event,
      );
      if (temporarySpeedResult != KeyEventResult.ignored) {
        return temporarySpeedResult;
      }
    }

    final primaryFocus = FocusManager.instance.primaryFocus;

    if (PlatformDetection.isTV) {
      if (_showNextUp) {
        switch (event.logicalKey) {
          case LogicalKeyboardKey.arrowLeft:
            if (primaryFocus == _tvNextUpDismissFocus) {
              _tvNextUpPlayFocus.requestFocus();
            }
            return KeyEventResult.handled;
          case LogicalKeyboardKey.arrowRight:
            if (primaryFocus == _tvNextUpPlayFocus) {
              _tvNextUpDismissFocus.requestFocus();
            }
            return KeyEventResult.handled;
          case LogicalKeyboardKey.arrowUp:
          case LogicalKeyboardKey.arrowDown:
            return KeyEventResult.handled;
          default:
            break;
        }
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        if (primaryFocus == _tvSecondaryLastFocus) {
          if (_tvTransportFirstFocus.context != null) {
            _tvTransportFirstFocus.requestFocus();
          }
          return KeyEventResult.handled;
        }
        final isBoundaryFocus =
            primaryFocus == _tvTransportLastFocus ||
            primaryFocus == _tvSeekbarFocus;
        if (isBoundaryFocus && _skipSegment != null) {
          _focusTvSkipSegment();
          return KeyEventResult.handled;
        }
        if (isBoundaryFocus || primaryFocus == _tvSkipSegmentFocus) {
          _showControls();
          return KeyEventResult.handled;
        }
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        if (primaryFocus == _tvSkipSegmentFocus) {
          _focusTvSeekbar();
          return KeyEventResult.handled;
        }
        if (primaryFocus == _tvTransportFirstFocus ||
            primaryFocus == _tvSecondaryFocus) {
          _showControls();
          return KeyEventResult.handled;
        }
      }

      switch (event.logicalKey) {
        case LogicalKeyboardKey.goBack:
        case LogicalKeyboardKey.escape:
        case LogicalKeyboardKey.browserBack:
        case LogicalKeyboardKey.backspace:
          if (event is KeyRepeatEvent) {
            return KeyEventResult.handled;
          }
          if (_isBackNavigationSuppressed()) {
            return KeyEventResult.handled;
          }
          if (_showNextUp) {
            _handleNextUpDismiss();
            return KeyEventResult.handled;
          }
          if (_skipSegment != null) {
            _dismissSkipSegment();
            return KeyEventResult.handled;
          }
          if (_dismissTopOverlayRouteIfAny()) {
            return KeyEventResult.handled;
          }
          if (_controlsVisible) {
            _suppressBackNavigation(
              duration: const Duration(milliseconds: 500),
            );
            _hideTimer?.cancel();
            setState(() => _controlsVisible = false);
            return KeyEventResult.handled;
          }
          _exitPlayback();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          if (_showNextUp) {
            return KeyEventResult.ignored;
          }
          if (!_controlsVisible) {
            final step = _accelerateSeekStep(
              _prefs.get(UserPreferences.skipBackLength),
              event,
            );
            _seekRelative(-step, showControls: false);
            _showControls(focusSeekbar: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        case LogicalKeyboardKey.arrowRight:
          if (_showNextUp) {
            return KeyEventResult.ignored;
          }
          if (!_controlsVisible) {
            final step = _accelerateSeekStep(
              _prefs.get(UserPreferences.skipForwardLength),
              event,
            );
            _seekRelative(step, showControls: false);
            _showControls(focusSeekbar: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        case LogicalKeyboardKey.arrowUp:
        case LogicalKeyboardKey.arrowDown:
          if (_showNextUp) {
            return KeyEventResult.ignored;
          }
          if (!_controlsVisible) {
            _showControls(focusSeekbar: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        case LogicalKeyboardKey.select:
        case LogicalKeyboardKey.enter:
          if (_showNextUp) {
            return KeyEventResult.ignored;
          }
          if (!_controlsVisible) {
            _showControls(focusSeekbar: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        case LogicalKeyboardKey.mediaPlay:
          unawaited(_resumeWithConfiguredRewind());
          _showControls();
          _focusTvPrimaryButton();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaPause:
          _manager.pause();
          _showControls();
          _focusTvPrimaryButton();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaPlayPause:
        case LogicalKeyboardKey.space:
          _togglePlayPause();
          _showControls();
          _focusTvPrimaryButton();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaStop:
          _exitPlayback();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaTrackNext:
          unawaited(_manager.next());
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaTrackPrevious:
          unawaited(_manager.previous());
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaFastForward:
          _seekRelative(_prefs.get(UserPreferences.skipForwardLength));
          _showControls(focusSeekbar: PlatformDetection.isTV);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.mediaRewind:
          _seekRelative(-_prefs.get(UserPreferences.skipBackLength));
          _showControls(focusSeekbar: PlatformDetection.isTV);
          return KeyEventResult.handled;
        default:
          return KeyEventResult.ignored;
      }
    }

    switch (event.logicalKey) {
      case LogicalKeyboardKey.space:
      case LogicalKeyboardKey.mediaPlayPause:
        _togglePlayPause();
        _showControls();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaPlay:
        unawaited(_resumeWithConfiguredRewind());
        _showControls();
        _focusTvPrimaryButton();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaPause:
        _manager.pause();
        _showControls();
        _focusTvPrimaryButton();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaStop:
        _exitPlayback();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaTrackNext:
        unawaited(_manager.next());
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaTrackPrevious:
        unawaited(_manager.previous());
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaFastForward:
        _seekRelative(_prefs.get(UserPreferences.skipForwardLength));
        _showControls(focusSeekbar: PlatformDetection.isTV);
        return KeyEventResult.handled;
      case LogicalKeyboardKey.mediaRewind:
        _seekRelative(-_prefs.get(UserPreferences.skipBackLength));
        _showControls(focusSeekbar: PlatformDetection.isTV);
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowLeft:
        _seekRelative(
          -_accelerateSeekStep(
            _prefs.get(UserPreferences.skipBackLength),
            event,
          ),
        );
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowRight:
        _seekRelative(
          _accelerateSeekStep(
            _prefs.get(UserPreferences.skipForwardLength),
            event,
          ),
        );
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowUp:
        _changeVolumeBy(0.05);
        _showControls();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowDown:
        _changeVolumeBy(-0.05);
        _showControls();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.keyI:
        _showStreamInfo();
        _showControls();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.escape:
        if (PlatformDetection.useDesktopUi && _isDesktopFullscreen) {
          unawaited(_setDesktopFullscreen(false));
          return KeyEventResult.handled;
        }
        _exitPlayback();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.select:
      case LogicalKeyboardKey.enter:
        if (_controlsVisible) {
          _togglePlayPause();
        } else {
          _showControls();
        }
        return KeyEventResult.handled;
      default:
        return KeyEventResult.ignored;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hideOsdForPreroll = _isCurrentPreroll;
    if (_isInPiP) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: [_buildVideoSurface()]),
      );
    }

    return PopScope(
      canPop: _readyToPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isBackNavigationSuppressed()) {
          return;
        }
        if (_showNextUp) {
          _handleNextUpDismiss();
          return;
        }
        if (_skipSegment != null) {
          _dismissSkipSegment();
          return;
        }
        if (_dismissTopOverlayRouteIfAny()) {
          return;
        }
        if (_controlsVisible) {
          _suppressBackNavigation(duration: const Duration(milliseconds: 500));
          _hideTimer?.cancel();
          setState(() => _controlsVisible = false);
          return;
        }
        _exitPlayback();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Focus(
          focusNode: _overlayFocus,
          autofocus: true,
          onKeyEvent: _handleKeyEvent,
          child: GestureDetector(
            onTap: PlatformDetection.isTV ? null : _toggleControls,
            onDoubleTapDown: PlatformDetection.isTV
                ? null
                : PlatformDetection.useMobileUi && !_isOsdLocked
                ? _onDoubleTapDown
                : null,
            onDoubleTap: PlatformDetection.useDesktopUi
                ? null
                : _handleDoubleTapGesture,
            onVerticalDragStart: PlatformDetection.isTV
                ? null
                : PlatformDetection.useMobileUi && !_isOsdLocked
                ? _onVerticalDragStart
                : null,
            onVerticalDragUpdate: PlatformDetection.isTV
                ? null
                : PlatformDetection.useMobileUi && !_isOsdLocked
                ? _onVerticalDragUpdate
                : null,
            onVerticalDragEnd: PlatformDetection.isTV
                ? null
                : PlatformDetection.useMobileUi && !_isOsdLocked
                ? _onVerticalDragEnd
                : null,
            onVerticalDragCancel: PlatformDetection.isTV
                ? null
                : PlatformDetection.useMobileUi && !_isOsdLocked
                ? _onVerticalDragCancel
                : null,
            onPanDown: PlatformDetection.useDesktopUi
                ? (_) => _showControls()
                : null,
            behavior: HitTestBehavior.opaque,
            child: Listener(
              onPointerSignal: PlatformDetection.useDesktopUi
                  ? _handleScrollSignal
                  : null,
              child: MouseRegion(
                cursor: PlatformDetection.useDesktopUi && !_controlsVisible
                    ? SystemMouseCursors.none
                    : SystemMouseCursors.basic,
                onHover: (_) {
                  if (PlatformDetection.useDesktopUi) {
                    if (_controlsVisible) {
                      _scheduleHide();
                    } else {
                      _showControls();
                    }
                  }
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildVideoSurface(),
                    _buildBringupOverlay(context),
                    if (_isRestoringPosition)
                      const Positioned.fill(
                        child: ColoredBox(color: Colors.black),
                      ),
                    _buildPausedDescriptionOverlay(),
                    if (_controlsVisible &&
                        !_isOsdLocked &&
                        !hideOsdForPreroll) ...[
                      _buildTopOverlay(context),
                      _buildBottomOverlay(context),
                      if (!PlatformDetection.useLeanbackUi)
                        Positioned.fill(
                          child: Center(child: _buildCenterTransportControls()),
                        ),
                    ],
                    _buildBufferingIndicator(),
                    _buildVolumeOverlay(),
                    if (PlatformDetection.useMobileUi)
                      _buildBrightnessOverlay(),
                    if (PlatformDetection.useMobileUi)
                      _buildDoubleTapSkipOverlay(),
                    if (_isOsdLocked && !hideOsdForPreroll)
                      _buildLockedOverlay(),
                    if (_skipSegment != null)
                      SkipSegmentOverlay(
                        segment: _skipSegment!,
                        onSkip: _skipCurrentSegment,
                        focusNode: PlatformDetection.isTV
                            ? _tvSkipSegmentFocus
                            : null,
                        onDismiss: _clearSkipSegment,
                        positionStream: _state.positionStream,
                      ),
                    if (_showNextUp && _nextUpItem != null)
                      NextUpOverlay(
                        nextItem: _nextUpItem!,
                        isMinimal:
                            _prefs.get(UserPreferences.nextUpBehavior) ==
                            NextUpBehavior.minimal,
                        imageUrl:
                            _nextUpItem!.primaryImageTag != null &&
                                _prefs.get(UserPreferences.nextUpBehavior) !=
                                    NextUpBehavior.minimal
                            ? _clientForItem(
                                _nextUpItem!,
                              ).imageApi.getPrimaryImageUrl(
                                _nextUpItem!.id,
                                maxWidth: 400,
                                tag: _nextUpItem!.primaryImageTag,
                              )
                            : null,
                        timeoutMs: _prefs.get(UserPreferences.nextUpTimeout),
                        onPlayNext: _handleNextUpPlay,
                        onDismiss: _handleNextUpCancel,
                        onTimeout:
                            _prefs.get(UserPreferences.autoplayNextEpisode)
                            ? _handleNextUpPlay
                            : _handleNextUpCancel,
                        focusNode: PlatformDetection.isTV
                            ? _tvNextUpPlayFocus
                            : null,
                        dismissFocusNode: PlatformDetection.isTV
                            ? _tvNextUpDismissFocus
                            : null,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxFit _zoomToFit(ZoomMode mode) => switch (mode) {
    ZoomMode.fit => BoxFit.contain,
    ZoomMode.autoCrop => BoxFit.cover,
    ZoomMode.stretch => BoxFit.fill,
  };

  void _syncSubtitleActive() {
    if (!PlatformDetection.useNativeVideoSurface || !mounted) return;
    final active = (_manager.subtitleStreamIndex ?? -1) >= 0;
    if (active != _subtitleActive) {
      setState(() {
        _subtitleActive = active;
      });
    }
  }

  void _onVoReady() {
    if (!mounted || !_subtitleActive) return;
    final idx = _manager.subtitleStreamIndex;
    if (idx == null || idx < 0) return;
    unawaited(_manager.changeSubtitleTrack(idx));
    if (_subtitleReapplyRetryScheduled || _state.duration > Duration.zero) {
      return;
    }
    _subtitleReapplyRetryScheduled = true;
    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 250)).then((_) async {
        _subtitleReapplyRetryScheduled = false;
        if (!mounted || !_subtitleActive || _state.duration > Duration.zero) {
          return;
        }
        final retryIdx = _manager.subtitleStreamIndex;
        if (retryIdx == null || retryIdx < 0) return;
        await _manager.changeSubtitleTrack(retryIdx);
      }),
    );
  }

  Widget _buildVideoSurface() {
    if (PlatformDetection.isTizen) {
      return _buildTizenVideoSurface();
    }

    final prefersMedia3 =
        _prefs.get(UserPreferences.playbackEnginePreference) ==
        PlaybackEnginePreference.media3;
    final prewarmMedia3 = _activeBackend == null && prefersMedia3;
    if (_activeMedia3Backend != null || prewarmMedia3) {
      return const Positioned.fill(child: Media3VideoView(fill: Colors.black));
    }

    final htmlBackend = _activeHtmlVideoBackend;
    if (htmlBackend != null) {
      return Positioned.fill(
        child: htmlBackend.buildView(fit: _zoomToFit(_zoomMode)),
      );
    }

    final mediaKitBackend = _activeMediaKitBackend ?? _backend;
    if (mediaKitBackend == null) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    final hwDecodingEnabled = _prefs.get(UserPreferences.hardwareDecoding);
    const selectedVo = 'gpu';
    if (PlatformDetection.useNativeVideoSurface) {
      return Positioned.fill(
        child: NativeVideoView(
          player: mediaKitBackend.player,
          zoomMode: _nativeZoomMode(_zoomMode),
          fill: Colors.black,
          videoOutput: selectedVo,
          hardwareDecodingEnabled: hwDecodingEnabled,
          onVoReady: _onVoReady,
        ),
      );
    }

    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controller = mediaKitBackend.videoController;
          if (controller == null) {
            return const ColoredBox(color: Colors.black);
          }
          return Video(
            controller: controller,
            controls: NoVideoControls,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            fit: _zoomToFit(_zoomMode),
            fill: Colors.black,
            pauseUponEnteringBackgroundMode:
                !PlatformDetection.isIOS && !PlatformDetection.isAndroid,
            subtitleViewConfiguration: _buildSubtitleConfig(),
          );
        },
      ),
    );
  }

  Widget _buildTizenVideoSurface() {
    final backend = _activeBackend;
    if (backend is! TizenPlayerBackend) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    final controller = backend.controller;
    if (controller == null || !controller.value.isInitialized) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black,
        child: FittedBox(
          fit: _zoomToFit(_zoomMode),
          child: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }

  NativeVideoZoomMode _nativeZoomMode(ZoomMode mode) => switch (mode) {
    ZoomMode.fit => NativeVideoZoomMode.fit,
    ZoomMode.autoCrop => NativeVideoZoomMode.crop,
    ZoomMode.stretch => NativeVideoZoomMode.stretch,
  };

  String _media3ZoomModeWire(ZoomMode mode) => switch (mode) {
    ZoomMode.fit => 'fit',
    ZoomMode.autoCrop => 'crop',
    ZoomMode.stretch => 'stretch',
  };

  Future<void> _syncMedia3ZoomMode() async {
    final backend = _activeMedia3Backend;
    if (backend == null) return;
    await backend.setZoomMode(_media3ZoomModeWire(_zoomMode));
  }

  bool _isBringupInProgress(PlaybackBringupPhase phase) {
    return phase == PlaybackBringupPhase.stoppingPrevious ||
        phase == PlaybackBringupPhase.resolving ||
        phase == PlaybackBringupPhase.opening ||
        phase == PlaybackBringupPhase.waitingForReady ||
        phase == PlaybackBringupPhase.seekingResume;
  }

  String _bringupLabel() {
    switch (_bringupState.phase) {
      case PlaybackBringupPhase.stoppingPrevious:
        return 'Stopping previous playback...';
      case PlaybackBringupPhase.resolving:
      case PlaybackBringupPhase.opening:
      case PlaybackBringupPhase.waitingForReady:
        return _streamLoadingLabel;
      case PlaybackBringupPhase.seekingResume:
        return 'Restoring position...';
      default:
        return _streamLoadingLabel;
    }
  }

  Widget _buildBringupOverlay(BuildContext context) {
    if (!_isBringupInProgress(_bringupState.phase)) {
      return const SizedBox.shrink();
    }

    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.45),
          ),
          child: Center(child: PlayerLoadingOverlay(label: _bringupLabel())),
        ),
      ),
    );
  }

  Widget _buildBufferingIndicator() {
    return StreamBuilder<bool>(
      stream: _state.bufferingStream,
      initialData: _state.isBuffering,
      builder: (context, snap) {
        if (snap.data != true || _isBringupInProgress(_bringupState.phase)) {
          return const SizedBox.shrink();
        }
        final hasTrickplay = _trickplayInfo != null && _trickplayInfo!.isValid;
        final recentlySought =
            _lastSeekTime != null &&
            DateTime.now().difference(_lastSeekTime!) <
                const Duration(seconds: 3);
        if (hasTrickplay && (_isSeeking || recentlySought)) {
          return const SizedBox.shrink();
        }
        return const Center(
          child: PlayerLoadingOverlay(
            label: _streamLoadingLabel,
            logoSize: 160,
            labelSpacing: 40,
          ),
        );
      },
    );
  }

  Widget _buildPausedDescriptionOverlay() {
    if (!_prefs.get(UserPreferences.showDescriptionOnPause)) {
      return const SizedBox.shrink();
    }
    final description = _currentItemDescription();
    if (description == null) return const SizedBox.shrink();
    final title = _currentItemTitle();
    return StreamBuilder<bool>(
      stream: _state.playingStream,
      initialData: _state.isPlaying,
      builder: (context, snap) {
        final isPlaying = _displayPlaying;
        return Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 220),
              opacity: isPlaying ? 0.0 : 1.0,
              child: Container(
                color: Colors.black.withValues(alpha: 0.58),
                child: SafeArea(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 960),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.spaceXl,
                          vertical: AppSpacing.spaceLg,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xCC111111),
                            borderRadius: AppRadius.circular(18),
                            border: Border.fromBorderSide(
                              ThemeRegistry.active.borders.cardBorder.copyWith(
                                color: Colors.white.withValues(alpha: 0.18),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.spaceXl),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (title.isNotEmpty)
                                    Text(
                                      title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: AppTypography.fontSizeXl,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                    ),
                                  if (title.isNotEmpty)
                                    const SizedBox(height: AppSpacing.spaceMd),
                                  Text(
                                    description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: AppTypography.fontSizeLg,
                                      height: 1.45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _currentItemTitle() {
    final item = _queue.currentItem;
    if (item is AggregatedItem) {
      return _firstNonEmptyText([item.seriesName, item.name]) ?? '';
    }
    if (item is Map) {
      return _firstNonEmptyText([
            item['SeriesName'] as String?,
            item['Name'] as String?,
          ]) ??
          '';
    }
    if (item is String) {
      final meta = _manager.currentOfflineMetadata;
      return _firstNonEmptyText([
            meta?['SeriesName'] as String?,
            meta?['Name'] as String?,
          ]) ??
          item.split('/').last;
    }
    return '';
  }

  String? _currentItemDescription() {
    final item = _queue.currentItem;
    if (item is AggregatedItem) {
      return _firstNonEmptyText([item.overview, item.tagline]);
    }
    if (item is Map) {
      return _firstNonEmptyText([
        item['Overview'] as String?,
        (item['Taglines'] as List?)?.firstOrNull as String?,
      ]);
    }
    if (item is String) {
      final meta = _manager.currentOfflineMetadata;
      return _firstNonEmptyText([
        meta?['Overview'] as String?,
        (meta?['Taglines'] as List?)?.firstOrNull as String?,
      ]);
    }
    return null;
  }

  String? _firstNonEmptyText(List<String?> candidates) {
    for (final s in candidates) {
      if (s != null && s.isNotEmpty) return s;
    }
    return null;
  }

  Widget _buildTopOverlay(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final padding = MediaQuery.of(context).padding;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: padding.top + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
          bottom: AppSpacing.spaceMd,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            if (!PlatformDetection.useLeanbackUi && !PlatformDetection.isTV)
              IconButton(
                onPressed: _exitPlayback,
                tooltip: PlatformDetection.useDesktopUi
                    ? _tooltipMessage(l10n.back, shortcut: 'Esc')
                    : null,
                icon: const AdaptiveIcon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            const SizedBox(width: AppSpacing.spaceSm),
            Expanded(child: _buildTitleInfo()),
            if (PlatformDetection.useMobileUi &&
                _prefs.get(UserPreferences.osdLockEnabled))
              IconButton(
                onPressed: () {
                  _hideTimer?.cancel();
                  setState(() {
                    _controlsVisible = false;
                    _isOsdLocked = true;
                  });
                },
                icon: const AdaptiveIcon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 22,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleInfo() {
    final item = _queue.currentItem;
    if (item == null) return const SizedBox.shrink();

    final String title;
    final String? seriesName;
    final String? episodeInfo;
    if (item is AggregatedItem) {
      title = item.name;
      seriesName = item.seriesName;
      episodeInfo = item.indexNumber != null
          ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
          : null;
    } else if (item is Map) {
      title = (item['Name'] ?? '') as String;
      seriesName = item['SeriesName'] as String?;
      episodeInfo = item['IndexNumber'] != null
          ? 'S${item['ParentIndexNumber'] ?? '?'}:E${item['IndexNumber']}'
          : null;
    } else if (item is String) {
      final meta = _manager.currentOfflineMetadata;
      title = (meta?['Name'] as String?) ?? item.split('/').last;
      seriesName = meta?['SeriesName'] as String?;
      final idx = meta?['IndexNumber'] as int?;
      final parentIdx = meta?['ParentIndexNumber'] as int?;
      episodeInfo = idx != null ? 'S${parentIdx ?? '?'}:E$idx' : null;
    } else {
      title = item.toString();
      seriesName = null;
      episodeInfo = null;
    }

    final titleText = [
      ?episodeInfo,
      title,
    ].where((s) => s.isNotEmpty).join(' - ');
    final logoUrl = _logoUrlForQueueItem(item);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (logoUrl != null) ...[
          Image.network(
            logoUrl,
            height: 64,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
            errorBuilder: (_, _, _) => Text(
              seriesName ?? titleText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppTypography.fontSizeLg,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (episodeInfo != null)
            Text(
              titleText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppTypography.fontSizeLg,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ] else ...[
          if (seriesName != null)
            Text(
              seriesName,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: AppTypography.fontSizeSm,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          Text(
            titleText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeLg,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  String _endsAtLabel({
    required Duration position,
    required Duration duration,
  }) {
    if (duration <= Duration.zero) return '';
    final remaining = duration - position;
    if (remaining <= Duration.zero) return '';
    final end = DateTime.now().add(remaining);
    final time = formatClockTime(
      end,
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
    return AppLocalizations.of(context).endsAt(time);
  }

  String? _logoUrlForQueueItem(dynamic item) {
    final raw = _rawDataForQueueItem(item);
    if (raw == null) return null;

    String? logoItemId;
    String? logoTag;
    final type = (raw['Type'] as String?)?.trim();

    if (type == 'Episode') {
      logoItemId =
          (raw['ParentLogoItemId']?.toString()) ??
          (raw['SeriesId']?.toString());
      logoTag = raw['ParentLogoImageTag'] as String?;
    } else {
      final imageTags = raw['ImageTags'];
      if (imageTags is Map) {
        logoTag = imageTags['Logo'] as String?;
      }
      logoTag ??= raw['LogoImageTag'] as String?;
      logoItemId = _itemIdForQueueItem(item) ?? (raw['Id']?.toString());
    }

    final normalizedItemId = logoItemId?.trim();
    final normalizedTag = logoTag?.trim();
    if (normalizedItemId == null ||
        normalizedItemId.isEmpty ||
        normalizedTag == null ||
        normalizedTag.isEmpty) {
      return null;
    }

    return _clientForQueueItem(item).imageApi.getLogoImageUrl(
      normalizedItemId,
      maxWidth: 420,
      tag: normalizedTag,
    );
  }

  String? _artworkUrlForQueueItem(dynamic item) {
    final raw = _rawDataForQueueItem(item);
    final itemId = _itemIdForQueueItem(item);
    if (raw == null || itemId == null || itemId.isEmpty) {
      return null;
    }

    final imageApi = _clientForQueueItem(item).imageApi;
    final imageTags = raw['ImageTags'] as Map?;
    final primaryTag = (imageTags?['Primary'] as String?)?.trim();
    final thumbTag = (imageTags?['Thumb'] as String?)?.trim();
    final backdropTags = raw['BackdropImageTags'] as List?;
    final backdropTag = backdropTags?.isNotEmpty == true
        ? backdropTags!.first.toString().trim()
        : null;

    if (primaryTag != null && primaryTag.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(
        itemId,
        maxHeight: 420,
        tag: primaryTag,
      );
    }

    if (thumbTag != null && thumbTag.isNotEmpty) {
      return imageApi.getThumbImageUrl(itemId, maxWidth: 960, tag: thumbTag);
    }

    if (backdropTag != null && backdropTag.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        itemId,
        maxWidth: 1280,
        tag: backdropTag,
      );
    }

    final parentThumbItemId = raw['ParentThumbItemId']?.toString().trim();
    final parentThumbTag = (raw['ParentThumbImageTag'] as String?)?.trim();
    if (parentThumbItemId != null &&
        parentThumbItemId.isNotEmpty &&
        parentThumbTag != null &&
        parentThumbTag.isNotEmpty) {
      return imageApi.getThumbImageUrl(
        parentThumbItemId,
        maxWidth: 960,
        tag: parentThumbTag,
      );
    }

    return imageApi.getPrimaryImageUrl(itemId, maxHeight: 420);
  }

  Widget _buildBottomOverlay(BuildContext context) {
    if (PlatformDetection.isTV) {
      return _buildTvBottomOverlay(context);
    }
    return _buildStandardBottomOverlay(context);
  }

  Widget _buildStandardBottomOverlay(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          bottom: padding.bottom + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSeekbar(),
            const SizedBox(height: AppSpacing.spaceXs),
            _buildSecondaryControlsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildTvBottomOverlay(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          bottom: padding.bottom + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSeekbar(),
            const SizedBox(height: AppSpacing.spaceXs),
            _buildTvBottomControlsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeekbar() {
    return StreamBuilder<Duration>(
      stream: _state.positionStream,
      initialData: _state.position,
      builder: (context, posSnap) {
        return StreamBuilder<Duration>(
          stream: _state.durationStream,
          initialData: _state.duration,
          builder: (context, durSnap) {
            return StreamBuilder<Duration>(
              stream: _state.bufferStream,
              initialData: _state.buffer,
              builder: (context, bufferSnap) {
                final position = posSnap.data ?? Duration.zero;
                final duration = durSnap.data ?? Duration.zero;
                final buffer = bufferSnap.data ?? Duration.zero;
                final durationMs = math
                    .max(duration.inMilliseconds, 1)
                    .toDouble();
                final double positionMs = _isSeeking
                    ? _seekValue
                    : position.inMilliseconds
                          .clamp(0, duration.inMilliseconds)
                          .toDouble();
                final double bufferMs = buffer.inMilliseconds
                    .clamp(0, duration.inMilliseconds)
                    .toDouble();
                final seekPosition = Duration(milliseconds: positionMs.round());
                final livePosition = _isSeeking ? seekPosition : position;
                final endsAt = _endsAtLabel(
                  position: livePosition,
                  duration: duration,
                );
                final trickplayTile = _isSeeking
                    ? _getTrickplayTile(seekPosition)
                    : null;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (trickplayTile != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.spaceSm,
                        ),
                        child: _buildSeekPreviewThumbnail(
                          imageUrl: trickplayTile.url,
                          headers: trickplayTile.headers,
                          position: seekPosition,
                          sourceRect: trickplayTile.sourceRect,
                          thumbWidth: trickplayTile.thumbWidth,
                          thumbHeight: trickplayTile.thumbHeight,
                          tileWidth: trickplayTile.tileWidth,
                          tileHeight: trickplayTile.tileHeight,
                        ),
                      ),
                    if (endsAt.isNotEmpty)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: AppSpacing.spaceLg,
                            bottom: AppSpacing.spaceXs,
                          ),
                          child: Text(
                            endsAt,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: AppTypography.fontSizeXs,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    Focus(
                      focusNode: _tvSeekbarFocus,
                      onKeyEvent: (node, event) {
                        if (!PlatformDetection.isTV ||
                            (event is! KeyDownEvent &&
                                event is! KeyRepeatEvent)) {
                          return KeyEventResult.ignored;
                        }
                        switch (event.logicalKey) {
                          case LogicalKeyboardKey.arrowLeft:
                            _seekRelativeDebounced(
                              -_prefs.get(UserPreferences.skipBackLength),
                            );
                            return KeyEventResult.handled;
                          case LogicalKeyboardKey.arrowRight:
                            _seekRelativeDebounced(
                              _prefs.get(UserPreferences.skipForwardLength),
                            );
                            return KeyEventResult.handled;
                          case LogicalKeyboardKey.arrowUp:
                            return KeyEventResult.handled;
                          case LogicalKeyboardKey.arrowDown:
                            if (_tvBottomPrimaryFocus.context != null) {
                              _tvBottomPrimaryFocus.requestFocus();
                            }
                            return KeyEventResult.handled;
                          case LogicalKeyboardKey.select:
                          case LogicalKeyboardKey.enter:
                            _togglePlayPause();
                            _showControls(focusSeekbar: true);
                            return KeyEventResult.handled;
                          default:
                            return KeyEventResult.ignored;
                        }
                      },
                      child: ExcludeFocus(
                        excluding: PlatformDetection.isTV,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 7,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 14,
                            ),
                            activeTrackColor: AppColorScheme.rangeProgress,
                            secondaryActiveTrackColor: AppColorScheme.rangeTrack
                                .withValues(alpha: 0.8),
                            inactiveTrackColor: AppColorScheme.rangeTrack,
                            thumbColor:
                                (PlatformDetection.isTV && _seekbarFocused)
                                ? Colors.white
                                : AppColorScheme.rangeThumb,
                            overlayColor: AppColorScheme.rangeThumb.withValues(
                              alpha: 0.2,
                            ),
                          ),
                          child: Slider(
                            value: positionMs.clamp(0.0, durationMs),
                            secondaryTrackValue: bufferMs.clamp(
                              0.0,
                              durationMs,
                            ),
                            max: durationMs,
                            onChangeStart: (v) {
                              _suppressSeekPrompts(
                                duration: _seekDragPromptSuppressionDuration,
                              );
                              _scrubSeekDebounceTimer?.cancel();
                              _scrubSeekDebounceTimer = null;
                              _pendingScrubSeekTarget = null;
                              setState(() {
                                _isSeeking = true;
                                _seekValue = v;
                              });
                              _hideTimer?.cancel();
                            },
                            onChanged: (v) {
                              _suppressSeekPrompts(
                                duration: _seekDragPromptSuppressionDuration,
                                dismissVisiblePrompts: false,
                              );
                              setState(() => _seekValue = v);
                            },
                            onChangeEnd: (v) {
                              _suppressSeekPrompts();
                              _scheduleDebouncedScrubSeek(
                                Duration(milliseconds: v.round()),
                                showControls: false,
                              );
                              _scheduleHide();
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.spaceLg,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(
                              _isSeeking
                                  ? Duration(milliseconds: _seekValue.round())
                                  : position,
                            ),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: AppTypography.fontSizeXs,
                            ),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: AppTypography.fontSizeXs,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSeekPreviewThumbnail({
    required String imageUrl,
    required Map<String, String> headers,
    required Duration position,
    required Rect sourceRect,
    required double thumbWidth,
    required double thumbHeight,
    required int tileWidth,
    required int tileHeight,
  }) {
    final displayWidth = 220.0;
    final displayHeight = displayWidth * (thumbHeight / thumbWidth);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: displayWidth,
          height: displayHeight,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: AppRadius.circular(10),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder,
            ),
          ),
          child: ClipRRect(
            borderRadius: AppRadius.circular(9),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final tileW = thumbWidth * tileWidth;
                final tileH = thumbHeight * tileHeight;
                final scaleX = constraints.maxWidth / thumbWidth;
                final scaleY = constraints.maxHeight / thumbHeight;
                return OverflowBox(
                  maxWidth: tileW * scaleX,
                  maxHeight: tileH * scaleY,
                  alignment: Alignment(
                    tileWidth <= 1
                        ? 0.0
                        : -1.0 + 2.0 * sourceRect.left / (tileW - thumbWidth),
                    tileHeight <= 1
                        ? 0.0
                        : -1.0 + 2.0 * sourceRect.top / (tileH - thumbHeight),
                  ),
                  child: Image.network(
                    imageUrl,
                    headers: headers.isEmpty ? null : headers,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.medium,
                    errorBuilder: (_, _, _) => Container(
                      color: Colors.white.withValues(alpha: 0.08),
                      alignment: Alignment.center,
                      child: AdaptiveIcon(
                        Icons.movie,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spaceXs),
        Text(
          _formatDuration(position),
          style: const TextStyle(
            color: Colors.white,
            fontSize: AppTypography.fontSizeXs,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  ({
    String url,
    Map<String, String> headers,
    Rect sourceRect,
    double thumbWidth,
    double thumbHeight,
    int tileWidth,
    int tileHeight,
  })?
  _getTrickplayTile(Duration position) {
    if (!_prefs.get(UserPreferences.trickPlayEnabled)) return null;

    final info = _trickplayInfo;
    if (info == null || !info.isValid) return null;

    final item = _queue.currentItem;
    final itemId = _itemIdForQueueItem(item);
    if (itemId == null || itemId.isEmpty) return null;

    final positionMs = position.inMilliseconds;
    final tileIndex = positionMs ~/ info.interval;
    final tilesPerImage = info.tilesPerImage;
    final tileOffset = tileIndex % tilesPerImage;
    final imageIndex = tileIndex ~/ tilesPerImage;

    final col = tileOffset % info.tileWidth;
    final row = tileOffset ~/ info.tileWidth;
    final offsetX = (col * info.width).toDouble();
    final offsetY = (row * info.height).toDouble();

    final trickplayClient = _clientForQueueItem(item);
    final url = trickplayClient.imageApi.getTrickplayTileImageUrl(
      itemId,
      width: info.width,
      index: imageIndex,
      mediaSourceId: _trickplayMediaSourceId,
    );
    final token = trickplayClient.accessToken;
    final headers = <String, String>{
      if (token != null && token.isNotEmpty)
        'Authorization': 'MediaBrowser Token="$token"',
    };

    return (
      url: url,
      headers: headers,
      sourceRect: Rect.fromLTWH(
        offsetX,
        offsetY,
        info.width.toDouble(),
        info.height.toDouble(),
      ),
      thumbWidth: info.width.toDouble(),
      thumbHeight: info.height.toDouble(),
      tileWidth: info.tileWidth,
      tileHeight: info.tileHeight,
    );
  }

  Widget _buildTvTransportRow() {
    final l10n = AppLocalizations.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final buttonExtent = isLandscape ? 56.0 : 48.0;
    final buttonIconSize = isLandscape ? 28.0 : 24.0;
    final hasPrevious = _queue.hasPrevious;
    final hasNext = _queue.hasNext;

    return FocusTraversalGroup(
      policy: ReadingOrderTraversalPolicy(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_queue.hasPrevious)
              _controlButton(
                Icons.skip_previous_rounded,
                onPressed: _manager.previous,
                size: buttonIconSize,
                extent: buttonExtent,
                focusNode: _tvTransportFirstFocus,
                tooltip: l10n.playerTooltipPrevious,
              ),
            const SizedBox(width: 4),
            _controlButton(
              seekBackIcon(_prefs.get(UserPreferences.skipBackLength)),
              onPressed: () =>
                  _seekRelative(-_prefs.get(UserPreferences.skipBackLength)),
              size: buttonIconSize,
              extent: buttonExtent,
              focusNode: hasPrevious ? null : _tvTransportFirstFocus,
              tooltip: _tooltipMessage(
                l10n.playerTooltipSeekBack,
                shortcut: 'Left',
              ),
            ),
            const SizedBox(width: 8),
            StreamBuilder<bool>(
              stream: _state.playingStream,
              initialData: _state.isPlaying,
              builder: (context, snap) {
                final isPlaying = _displayPlaying;
                return _controlButton(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  onPressed: () => isPlaying
                      ? _manager.pause()
                      : _resumeWithConfiguredRewind(),
                  size: buttonIconSize,
                  extent: buttonExtent,
                  focusNode: _tvBottomPrimaryFocus,
                  tooltip: _tooltipMessage(
                    isPlaying ? l10n.pause : l10n.play,
                    shortcut: 'Space',
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            _controlButton(
              seekForwardIcon(_prefs.get(UserPreferences.skipForwardLength)),
              onPressed: () =>
                  _seekRelative(_prefs.get(UserPreferences.skipForwardLength)),
              size: buttonIconSize,
              extent: buttonExtent,
              focusNode: hasNext ? null : _tvTransportLastFocus,
              tooltip: _tooltipMessage(
                l10n.playerTooltipSeekForward,
                shortcut: 'Right',
              ),
            ),
            const SizedBox(width: 4),
            if (_queue.hasNext)
              _controlButton(
                Icons.skip_next_rounded,
                onPressed: _manager.next,
                size: buttonIconSize,
                extent: buttonExtent,
                focusNode: _tvTransportLastFocus,
                tooltip: l10n.next,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTvBottomControlsRow() {
    return Focus(
      skipTraversal: true,
      canRequestFocus: false,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _tvSeekbarFocus.requestFocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTvTransportRow(),
          const SizedBox(width: AppSpacing.spaceXs),
          Expanded(child: _buildSecondaryControlsRow()),
        ],
      ),
    );
  }

  Widget _buildSecondaryControlsRow() {
    return ValueListenableBuilder<CastTargetKind?>(
      valueListenable: _castService.activeKindNotifier,
      builder: (context, _, _) {
        final l10n = AppLocalizations.of(context);
        final item = _queue.currentItem;
        final canFavorite =
            !_isPrerollQueueItem(item) &&
            ((_itemIdForQueueItem(item)?.isNotEmpty) ?? false);
        final isFavorite = canFavorite && _queueItemIsFavorite(item);
        final hasChapters = item is AggregatedItem && item.chapters.isNotEmpty;
        final hasCast = _hasCastCrew(item);
        final playbackStreams = _currentPlaybackMediaStreams();
        final hasSubtitleStreams = playbackStreams.any(
          (s) => s['Type'] == 'Subtitle',
        );
        final canDownloadRemoteSubtitles =
            item is AggregatedItem && _canDownloadRemoteSubtitles(item);
        final showSubtitleButton =
            hasSubtitleStreams || canDownloadRemoteSubtitles;
        final subtitleButtonIcon =
            !hasSubtitleStreams && canDownloadRemoteSubtitles
            ? Icons.download_rounded
            : Icons.subtitles_outlined;
        final showAudioButton = true;
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;
        final secondaryIconSize = isLandscape ? 28.0 : 24.0;
        final secondaryExtent = isLandscape ? 56.0 : 48.0;
        final secondaryTextSize = isLandscape
            ? AppTypography.fontSizeMd
            : AppTypography.fontSizeSm;

        final Widget speedButton;
        if (PlatformDetection.isTV) {
          speedButton = _TvFocusButton(
            focusNode: _tvSecondaryFocus,
            extent: secondaryExtent,
            tooltip: l10n.playerTooltipPlaybackSpeed,
            onPressed: () {
              _showControls();
              _showSpeedSelector();
            },
            child: Text(
              '${_state.playbackSpeed}x',
              style: TextStyle(
                color: Colors.white,
                fontSize: secondaryTextSize,
              ),
            ),
          );
        } else {
          speedButton = _buildSpeedButton(
            extent: secondaryExtent,
            textSize: secondaryTextSize,
            tooltip: l10n.playerTooltipPlaybackSpeed,
          );
        }

        final secondaryButtons = <Widget>[
          SyncPlayPlayerButton(
            size: secondaryIconSize,
            extent: secondaryExtent,
          ),
          if (canFavorite)
            _controlButton(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              onPressed: _toggleCurrentItemFavorite,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: isFavorite
                  ? l10n.contextMenuRemoveFromFavorites
                  : l10n.contextMenuAddToFavorites,
              iconColor: isFavorite
                  ? Theme.of(context).colorScheme.error
                  : Colors.white,
            ),
          speedButton,
          if (hasChapters)
            _controlButton(
              Icons.bookmark_outline_rounded,
              onPressed: _showChapters,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.chapters,
            ),
          if (showSubtitleButton)
            _controlButton(
              subtitleButtonIcon,
              onPressed: () => _showTrackSelector(audio: false),
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.subtitles,
            ),
          if (showAudioButton)
            _controlButton(
              Icons.audiotrack_outlined,
              onPressed: () => _showTrackSelector(audio: true),
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.audio,
            ),
          if (hasCast)
            _controlButton(
              Icons.people_outline_rounded,
              onPressed: () {
                unawaited(_showCast());
              },
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.castAndCrew,
            ),
          if (!PlatformDetection.isTV)
            _controlButton(
              Icons.cast,
              onPressed: _castToDevice,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.cast,
            ),
          if (!PlatformDetection.isTV && _castService.activeKind != null)
            _controlButton(
              switch (_castService.activeKind!) {
                CastTargetKind.googleCast => Icons.cast_connected,
                CastTargetKind.airPlay => Icons.airplay,
                _ => Icons.router,
              },
              onPressed: _showCastControls,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: l10n.playerTooltipCastControls,
            ),
          if (PlatformDetection.useDesktopUi && _castService.activeKind == null)
            _buildVolumeButton(
              extent: secondaryExtent,
              iconSize: secondaryIconSize,
              tooltip: l10n.playerTooltipVolume,
            ),
          _buildBitrateButton(
            extent: secondaryExtent,
            iconSize: secondaryIconSize,
            tooltip: l10n.playerTooltipPlaybackQuality,
          ),
          _buildZoomButton(
            size: secondaryIconSize,
            extent: secondaryExtent,
            tooltip: l10n.playerZoomMode,
          ),
          if (PlatformDetection.isMobile)
            _controlButton(
              _forcedLandscape
                  ? Icons.screen_lock_landscape_outlined
                  : Icons.screen_rotation_outlined,
              onPressed: _toggleOrientationLock,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: _forcedLandscape
                  ? l10n.playerTooltipUnlockOrientation
                  : l10n.playerTooltipLockLandscape,
            ),
          _controlButton(
            Icons.info_outline_rounded,
            onPressed: _showStreamInfo,
            size: secondaryIconSize,
            extent: secondaryExtent,
            focusNode: _tvSecondaryLastFocus,
            tooltip: _tooltipMessage(l10n.playbackInformation, shortcut: 'I'),
            onRightBoundary: () {},
          ),
          if (PlatformDetection.useDesktopUi)
            _controlButton(
              _isDesktopFullscreen
                  ? Icons.fullscreen_exit_rounded
                  : Icons.fullscreen_rounded,
              onPressed: _toggleDesktopFullscreen,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: _isDesktopFullscreen
                  ? _tooltipMessage(
                      l10n.playerTooltipExitFullscreen,
                      shortcut: 'Esc',
                    )
                  : _tooltipMessage(
                      l10n.playerTooltipEnterFullscreen,
                      shortcut: 'F11',
                    ),
            ),
          if (PlatformDetection.useDesktopUi &&
              !PlatformDetection.isWeb &&
              !_isDesktopFullscreen)
            _controlButton(
              _isAlwaysOnTop ? Icons.push_pin : Icons.push_pin_outlined,
              onPressed: _toggleAlwaysOnTop,
              size: secondaryIconSize,
              extent: secondaryExtent,
              tooltip: _isAlwaysOnTop
                  ? _tooltipMessage(l10n.playerTooltipExitFloatOnTop)
                  : _tooltipMessage(l10n.playerTooltipFloatOnTop),
            ),
        ];

        final orderedSecondaryButtons = PlatformDetection.isTV
            ? List<Widget>.generate(
                secondaryButtons.length,
                (index) => FocusTraversalOrder(
                  order: NumericFocusOrder(index.toDouble()),
                  child: secondaryButtons[index],
                ),
              )
            : secondaryButtons;

        final estimatedWidth =
            orderedSecondaryButtons.length * (secondaryExtent + 8);

        final layoutBuilder = LayoutBuilder(
          builder: (context, constraints) {
            final canFitLandscapeRow =
                isLandscape && estimatedWidth <= constraints.maxWidth;

            if (canFitLandscapeRow) {
              return SizedBox(
                height: secondaryExtent,
                child: Row(
                  mainAxisAlignment: PlatformDetection.isTV
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  children: orderedSecondaryButtons,
                ),
              );
            }

            return SizedBox(
              height: secondaryExtent,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (final button in orderedSecondaryButtons)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: button,
                      ),
                  ],
                ),
              ),
            );
          },
        );

        if (PlatformDetection.isTV) {
          return Focus(
            skipTraversal: true,
            canRequestFocus: false,
            onKeyEvent: (node, event) {
              if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                return KeyEventResult.ignored;
              }
              if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                _tvSeekbarFocus.requestFocus();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: layoutBuilder,
            ),
          );
        }

        return layoutBuilder;
      },
    );
  }

  Future<void> _syncDesktopFullscreenState() async {
    if (!PlatformDetection.useDesktopUi) return;
    try {
      final full = await FullscreenHelper.isFullscreen();
      _wasDesktopFullscreenOnEntry ??= full;
      if (!mounted) return;
      setState(() => _isDesktopFullscreen = full);
      unawaited(_syncAutoHdrSwitching());
    } catch (_) {}
  }

  Future<void> _setDesktopFullscreen(bool full) async {
    if (!PlatformDetection.useDesktopUi) return;
    try {
      await FullscreenHelper.setFullscreen(full);
      if (!mounted) return;
      setState(() => _isDesktopFullscreen = full);
      unawaited(_syncAutoHdrSwitching());
    } catch (_) {}
  }

  Future<void> _toggleDesktopFullscreen() async {
    if (!PlatformDetection.useDesktopUi) return;
    try {
      final full = await FullscreenHelper.isFullscreen();
      _wasDesktopFullscreenOnEntry ??= full;
      await _setDesktopFullscreen(!full);
    } catch (_) {}
  }

  Future<void> _syncAlwaysOnTopState() async {
    if (!PlatformDetection.useDesktopUi) return;
    try {
      final onTop = await windowManager.isAlwaysOnTop();
      _wasAlwaysOnTopOnEntry ??= onTop;
      if (!mounted) return;
      setState(() => _isAlwaysOnTop = onTop);
    } catch (_) {}
  }

  Future<void> _setAlwaysOnTop(bool value) async {
    if (!PlatformDetection.useDesktopUi) return;
    try {
      await windowManager.setAlwaysOnTop(value);
      if (!mounted) return;
      setState(() => _isAlwaysOnTop = value);
    } catch (_) {}
  }

  Future<void> _toggleAlwaysOnTop() async {
    if (!PlatformDetection.useDesktopUi) return;
    if (_wasAlwaysOnTopOnEntry == null) {
      await _syncAlwaysOnTopState();
      _wasAlwaysOnTopOnEntry ??= _isAlwaysOnTop;
    }
    await _setAlwaysOnTop(!_isAlwaysOnTop);
  }

  void _syncMedia3VolumeBoostLevel({bool resetWhenUnavailable = false}) {
    final backend = _activeMedia3Backend;
    if (backend == null) {
      if (resetWhenUnavailable && _media3VolumeBoostLevel != 0) {
        if (mounted) {
          setState(() => _media3VolumeBoostLevel = 0);
        } else {
          _media3VolumeBoostLevel = 0;
        }
      }
      return;
    }

    final next = backend.volumeBoostLevel.clamp(0, 10).toInt();
    if (next != _media3VolumeBoostLevel) {
      if (mounted) {
        setState(() => _media3VolumeBoostLevel = next);
      } else {
        _media3VolumeBoostLevel = next;
      }
    }
  }

  Future<void> _setMedia3VolumeBoostLevel(int level) async {
    final backend = _activeMedia3Backend;
    if (backend == null) {
      return;
    }

    final clampedLevel = level.clamp(0, 10).toInt();
    if (_media3VolumeBoostLevel != clampedLevel) {
      if (mounted) {
        setState(() => _media3VolumeBoostLevel = clampedLevel);
      } else {
        _media3VolumeBoostLevel = clampedLevel;
      }
    }

    await backend.setVolumeBoostLevel(clampedLevel);
  }

  // Desktop drives the player's own (mpv) volume, independent of the OS volume
  // like mpv/vlc; only mobile attenuates the system volume.
  bool get _useSystemVolume => PlatformDetection.isMobile;

  Future<void> _changeVolumeBy(double delta) async {
    final castKind = _castService.activeKind;
    if (castKind != null) {
      final current = _remoteVolume ?? 1.0;
      final next = (current + delta).clamp(0.0, 1.0);
      await _setRemoteVolume(next);
      return;
    }

    if (_useSystemVolume) {
      final media3Backend = _activeMedia3Backend;
      if (media3Backend != null) {
        _syncMedia3VolumeBoostLevel();
        final effectiveVolume =
            _systemVolume + (_media3VolumeBoostLevel / 10.0);
        final nextEffective = (effectiveVolume + delta)
            .clamp(0.0, 2.0)
            .toDouble();
        final nextSystemVolume = nextEffective.clamp(0.0, 1.0).toDouble();
        final nextBoostLevel = nextEffective <= 1.0
            ? 0
            : ((nextEffective - 1.0) * 10.0).round().clamp(0, 10).toInt();
        await _setMedia3VolumeBoostLevel(nextBoostLevel);
        unawaited(
          _setMobileSystemVolume(nextSystemVolume, syncFromSystem: true),
        );
      } else {
        final next = (_systemVolume + delta).clamp(0.0, 1.0);
        unawaited(_setMobileSystemVolume(next, syncFromSystem: true));
      }
      _showVolumeIndicator();
      return;
    }

    final backend = _manager.backend;
    if (backend == null) return;

    final next = (_playerVolume + (delta * 100.0)).clamp(0.0, 100.0);
    _playerVolume = next;
    await backend.setVolume(next);
    _persistPlayerVolume();
    _showVolumeIndicator();
  }

  void _handleScrollSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) return;
    final dy = event.scrollDelta.dy;
    if (dy == 0) return;
    final action = _prefs.get(UserPreferences.desktopScrollWheelAction);
    // scrollDelta.dy is negative when scrolling up / away from the user.
    final scrollingUp = dy < 0;
    switch (action) {
      case DesktopScrollWheelAction.off:
        return;
      case DesktopScrollWheelAction.volume:
        unawaited(_changeVolumeBy(scrollingUp ? 0.05 : -0.05));
        _showControls();
      case DesktopScrollWheelAction.seek:
        final step = scrollingUp
            ? _prefs.get(UserPreferences.skipForwardLength)
            : _prefs.get(UserPreferences.skipBackLength);
        _seekRelative(scrollingUp ? step : -step);
    }
  }

  void _initBrightness() {
    final brightness = ScreenBrightnessPlatform.instance;

    Future.microtask(() async {
      try {
        if (PlatformDetection.isIOS) {
          await brightness.setAutoReset(true);
          final current = await brightness.system;
          if (mounted) {
            setState(() => _brightnessValue = current);
          }
          _brightnessListenerSub = brightness.onSystemScreenBrightnessChanged
              .listen((value) {
                if (mounted && (value - _brightnessValue).abs() > 0.01) {
                  setState(() => _brightnessValue = value);
                }
              });
        } else {
          await brightness.setAutoReset(false);
          final current = await brightness.application;
          if (mounted) {
            setState(() => _brightnessValue = current);
          }
          _brightnessListenerSub = brightness
              .onApplicationScreenBrightnessChanged
              .listen((value) {
                if (mounted && (value - _brightnessValue).abs() > 0.01) {
                  setState(() => _brightnessValue = value);
                }
              });
        }
      } catch (_) {}
    });
  }

  void _syncBrightnessFromSystem() {
    Future.microtask(() async {
      try {
        final current = PlatformDetection.isIOS
            ? await ScreenBrightnessPlatform.instance.system
            : await ScreenBrightnessPlatform.instance.application;
        if (mounted && (current - _brightnessValue).abs() > 0.01) {
          setState(() => _brightnessValue = current);
        }
      } catch (_) {}
    });
  }

  void _initSystemVolume() {
    final vc = VolumeController.instance;
    vc.showSystemUI = false;

    _playerVolume = 100.0;
    unawaited(_manager.backend?.setVolume(100.0));

    _volumeListenerSub = vc.addListener((value) {
      if (mounted && (value - _systemVolume).abs() > 0.01) {
        setState(() => _systemVolume = value);
      }

      if (value < 0.99 &&
          _media3VolumeBoostLevel > 0 &&
          _activeMedia3Backend != null) {
        unawaited(_setMedia3VolumeBoostLevel(0));
      }
    }, fetchInitialVolume: true);
  }

  void _initDesktopVolume() {
    _playerVolume = _prefs
        .get(UserPreferences.playerVolume)
        .clamp(0.0, 100.0)
        .toDouble();
    unawaited(_manager.backend?.setVolume(_playerVolume));
  }

  void _persistPlayerVolume() {
    if (!PlatformDetection.isDesktop) return;
    _persistVolumeTimer?.cancel();
    _persistVolumeTimer = Timer(const Duration(milliseconds: 400), () {
      unawaited(_prefs.set(UserPreferences.playerVolume, _playerVolume));
    });
  }

  Future<void> _setMobileSystemVolume(
    double value, {
    bool syncFromSystem = false,
  }) async {
    final clamped = value.clamp(0.0, 1.0);

    if (mounted && (clamped - _systemVolume).abs() > 0.01) {
      setState(() => _systemVolume = clamped);
    }

    _pendingMobileSystemVolume = clamped;
    if (_isApplyingMobileSystemVolume) {
      return;
    }

    _isApplyingMobileSystemVolume = true;

    try {
      while (_pendingMobileSystemVolume != null) {
        final next = _pendingMobileSystemVolume!;
        _pendingMobileSystemVolume = null;
        await VolumeController.instance.setVolume(next);
      }

      if (syncFromSystem) {
        final actual = await VolumeController.instance.getVolume();
        if (mounted && (actual - _systemVolume).abs() > 0.01) {
          setState(() => _systemVolume = actual);
        }
      }
    } catch (_) {
    } finally {
      _isApplyingMobileSystemVolume = false;
    }
  }

  void _showVolumeIndicator() {
    setState(() => _showVolumeOverlay = true);
    _volumeOverlayTimer?.cancel();
    _volumeOverlayTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showVolumeOverlay = false);
    });
  }

  void _showBrightnessIndicator() {
    setState(() => _showBrightnessOverlay = true);
    _brightnessOverlayTimer?.cancel();
    _brightnessOverlayTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showBrightnessOverlay = false);
    });
  }

  Future<void> _setBrightness(double value) async {
    try {
      final clamped = value.clamp(0.0, 1.0);
      if (PlatformDetection.isIOS) {
        await ScreenBrightnessPlatform.instance.setSystemScreenBrightness(
          clamped,
        );
      } else {
        await ScreenBrightnessPlatform.instance.setApplicationScreenBrightness(
          clamped,
        );
      }
    } catch (_) {}
  }

  void _onDoubleTapDown(TapDownDetails details) {
    _doubleTapDownPosition = details.localPosition;
  }

  void _handleControlButtonPress(VoidCallback onPressed) {
    onPressed();
    _showControls();
  }

  void _handleDoubleTapGesture() {
    if (PlatformDetection.useDesktopUi) {
      return;
    }
    if (PlatformDetection.useMobileUi && !_isOsdLocked) {
      _onDoubleTap();
    }
  }

  void _onDoubleTap() {
    final pos = _doubleTapDownPosition;
    if (pos == null) return;
    _doubleTapDownPosition = null;
    final screenWidth = MediaQuery.sizeOf(context).width;
    _doubleTapSkip(forward: pos.dx >= screenWidth / 2);
  }

  void _doubleTapSkip({required bool forward}) {
    final ms = _prefs.get(
      forward
          ? UserPreferences.skipForwardLength
          : UserPreferences.skipBackLength,
    );
    _seekRelative(forward ? ms : -ms, showControls: false);
    if (forward) {
      _skipForwardAccum += ms;
      setState(() => _showSkipForward = true);
      _skipForwardTimer?.cancel();
      _skipForwardTimer = Timer(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _showSkipForward = false;
            _skipForwardAccum = 0;
          });
        }
      });
    } else {
      _skipBackwardAccum += ms;
      setState(() => _showSkipBackward = true);
      _skipBackwardTimer?.cancel();
      _skipBackwardTimer = Timer(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _showSkipBackward = false;
            _skipBackwardAccum = 0;
          });
        }
      });
    }
  }

  void _onVerticalDragStart(DragStartDetails details) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    _verticalDragIsVolume = details.localPosition.dx > screenWidth / 2;
    _verticalDragStartY = details.localPosition.dy;
    if (_verticalDragIsVolume) {
      final baseVolume = PlatformDetection.isMobile
          ? _systemVolume
          : _playerVolume / 100.0;
      final includeBoost =
          PlatformDetection.isMobile && _activeMedia3Backend != null;
      _verticalDragStartValue = includeBoost
          ? baseVolume + (_media3VolumeBoostLevel / 10.0)
          : baseVolume;
      return;
    }
    _verticalDragStartValue = _brightnessValue;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final deltaY = _verticalDragStartY - details.localPosition.dy;
    final deltaValue = deltaY / (screenHeight * 0.7);

    if (_verticalDragIsVolume) {
      if (PlatformDetection.isMobile) {
        final media3Backend = _activeMedia3Backend;
        if (media3Backend != null) {
          final rawEffective = (_verticalDragStartValue + deltaValue)
              .clamp(0.0, 2.0)
              .toDouble();
          final newSystemVolume = rawEffective.clamp(0.0, 1.0).toDouble();
          final newBoostLevel = rawEffective <= 1.0
              ? 0
              : ((rawEffective - 1.0) * 10.0).round().clamp(0, 10).toInt();
          unawaited(_setMedia3VolumeBoostLevel(newBoostLevel));
          unawaited(_setMobileSystemVolume(newSystemVolume));
        } else {
          final newVolume = (_verticalDragStartValue + deltaValue)
              .clamp(0.0, 1.0)
              .toDouble();
          unawaited(_setMobileSystemVolume(newVolume));
        }
      } else {
        final newVolume = (_verticalDragStartValue + deltaValue)
            .clamp(0.0, 1.0)
            .toDouble();
        _playerVolume = newVolume * 100.0;
        _manager.backend?.setVolume(_playerVolume);
        _persistPlayerVolume();
      }
      _showVolumeIndicator();
    } else {
      final newBrightness = (_verticalDragStartValue + deltaValue).clamp(
        0.0,
        1.0,
      );
      _brightnessValue = newBrightness;
      _setBrightness(newBrightness);
      _showBrightnessIndicator();
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_verticalDragIsVolume && PlatformDetection.isMobile) {
      unawaited(_setMobileSystemVolume(_systemVolume, syncFromSystem: true));
    }
  }

  void _onVerticalDragCancel() {
    if (_verticalDragIsVolume && PlatformDetection.isMobile) {
      unawaited(_setMobileSystemVolume(_systemVolume, syncFromSystem: true));
    }
  }

  Widget _buildVolumeOverlay() {
    final displayVolume = _useSystemVolume
        ? _systemVolume
        : _playerVolume / 100.0;
    final usingMedia3Boost =
        PlatformDetection.isMobile && _activeMedia3Backend != null;
    final overlayProgress = usingMedia3Boost
        ? ((displayVolume * 100.0) + (_media3VolumeBoostLevel * 10.0)).clamp(
                0.0,
                200.0,
              ) /
              200.0
        : displayVolume.clamp(0.0, 1.0);
    final overlayLabel = usingMedia3Boost && _media3VolumeBoostLevel > 0
        ? 'Volume +$_media3VolumeBoostLevel'
        : '${(displayVolume * 100).round()}%';
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _showVolumeOverlay ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: IgnorePointer(
          child: Align(
            alignment: const Alignment(0.85, 0.0),
            child: _buildGestureIndicator(
              icon: displayVolume <= 0
                  ? Icons.volume_off_rounded
                  : displayVolume < 0.5
                  ? Icons.volume_down_rounded
                  : Icons.volume_up_rounded,
              value: overlayProgress,
              label: overlayLabel,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrightnessOverlay() {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _showBrightnessOverlay ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: IgnorePointer(
          child: Align(
            alignment: const Alignment(-0.85, 0.0),
            child: _buildGestureIndicator(
              icon: _brightnessValue <= 0.25
                  ? Icons.brightness_low_rounded
                  : _brightnessValue >= 0.75
                  ? Icons.brightness_high_rounded
                  : Icons.brightness_medium_rounded,
              value: _brightnessValue,
              label: '${(_brightnessValue * 100).round()}%',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGestureIndicator({
    required IconData icon,
    required double value,
    required String label,
  }) {
    const barHeight = 120.0;
    final fillHeight = barHeight * value.clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: AppRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptiveIcon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 10),
          SizedBox(
            height: barHeight,
            width: 4,
            child: ClipRRect(
              borderRadius: AppRadius.circular(2),
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: ColoredBox(color: Colors.white24),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: fillHeight,
                    child: const ColoredBox(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 88,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubleTapSkipOverlay() {
    if (!_showSkipForward && !_showSkipBackward) return const SizedBox.shrink();
    final isForward = _showSkipForward;
    final accum = isForward ? _skipForwardAccum : _skipBackwardAccum;
    final seconds = accum ~/ 1000;
    if (seconds <= 0) return const SizedBox.shrink();
    return Positioned.fill(
      child: IgnorePointer(
        child: Align(
          alignment: isForward
              ? const Alignment(0.6, 0.0)
              : const Alignment(-0.6, 0.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: AppRadius.circular(40),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AdaptiveIcon(
                  isForward
                      ? Icons.fast_forward_rounded
                      : Icons.fast_rewind_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context).secondsCount(seconds),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLockedOverlay() {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _showControls,
        child: SafeArea(
          child: Center(
            child: IgnorePointer(
              ignoring: !_controlsVisible,
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _isOsdLocked = false;
                    _controlsVisible = true;
                  });
                  _scheduleHide();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.spaceLg,
                    vertical: AppSpacing.spaceMd,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.72),
                    borderRadius: AppRadius.circular(20),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.cardBorder.copyWith(
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AdaptiveIcon(
                        Icons.lock,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context).longPressToUnlock,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenterTransportControls() {
    return StreamBuilder<bool>(
      stream: _state.playingStream,
      initialData: _state.isPlaying,
      builder: (context, snap) {
        final l10n = AppLocalizations.of(context);
        final isPlaying = _displayPlaying;

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_queue.hasPrevious)
              _controlButton(
                Icons.skip_previous_rounded,
                onPressed: _manager.previous,
                size: 40,
                extent: 72,
                tooltip: l10n.playerTooltipPrevious,
              ),
            _controlButton(
              seekBackIcon(_prefs.get(UserPreferences.skipBackLength)),
              onPressed: () =>
                  _seekRelative(-_prefs.get(UserPreferences.skipBackLength)),
              size: 46,
              extent: 78,
              tooltip: _tooltipMessage(
                l10n.playerTooltipSeekBack,
                shortcut: 'Left',
              ),
            ),
            _controlButton(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              onPressed: () =>
                  isPlaying ? _manager.pause() : _resumeWithConfiguredRewind(),
              size: 64,
              extent: 92,
              tooltip: _tooltipMessage(
                isPlaying ? l10n.pause : l10n.play,
                shortcut: 'Space',
              ),
            ),
            _controlButton(
              seekForwardIcon(_prefs.get(UserPreferences.skipForwardLength)),
              onPressed: () =>
                  _seekRelative(_prefs.get(UserPreferences.skipForwardLength)),
              size: 46,
              extent: 78,
              tooltip: _tooltipMessage(
                l10n.playerTooltipSeekForward,
                shortcut: 'Right',
              ),
            ),
            if (_queue.hasNext)
              _controlButton(
                Icons.skip_next_rounded,
                onPressed: _manager.next,
                size: 40,
                extent: 72,
                tooltip: l10n.next,
              ),
          ],
        );
      },
    );
  }

  Widget _controlButton(
    IconData icon, {
    required VoidCallback onPressed,
    double size = 24,
    double extent = 48,
    String? tooltip,
    FocusNode? focusNode,
    Color iconColor = Colors.white,
    VoidCallback? onRightBoundary,
  }) {
    if (PlatformDetection.isTV) {
      return _TvFocusButton(
        focusNode: focusNode,
        extent: extent,
        tooltip: tooltip,
        onPressed: () => _handleControlButtonPress(onPressed),
        onRightBoundary: onRightBoundary,
        child: AdaptiveIcon(icon, color: iconColor, size: size),
      );
    }
    return SizedBox(
      width: extent,
      height: extent,
      child: IconButton(
        focusNode: focusNode,
        onPressed: () => _handleControlButtonPress(onPressed),
        tooltip: PlatformDetection.useDesktopUi ? tooltip : null,
        icon: AdaptiveIcon(icon, color: iconColor, size: size),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  IconData _volumeIcon(double fraction) => fraction <= 0
      ? Icons.volume_off_rounded
      : fraction < 0.5
      ? Icons.volume_down_rounded
      : Icons.volume_up_rounded;

  double get _osdVolume =>
      _useSystemVolume ? _systemVolume : _playerVolume / 100.0;

  void _setOsdVolume(double fraction) {
    final clamped = fraction.clamp(0.0, 1.0).toDouble();
    if (_useSystemVolume) {
      unawaited(_setMobileSystemVolume(clamped, syncFromSystem: true));
    } else {
      setState(() => _playerVolume = clamped * 100.0);
      _manager.backend?.setVolume(_playerVolume);
      _persistPlayerVolume();
    }
    _showControls();
  }

  void _toggleMute() {
    if (_osdVolume > 0) {
      _volumeBeforeMute = _osdVolume;
      _setOsdVolume(0);
    } else {
      _setOsdVolume(_volumeBeforeMute > 0 ? _volumeBeforeMute : 1.0);
    }
  }

  Widget _buildVolumeButton({
    double extent = 48,
    double iconSize = 24,
    String? tooltip,
  }) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.black.withValues(alpha: 0.85),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppRadius.circular(12)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      menuChildren: [_buildVolumeSliderMenu()],
      builder: (context, controller, child) {
        return SizedBox(
          width: extent,
          height: extent,
          child: IconButton(
            tooltip: tooltip,
            onPressed: () {
              _showControls();
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: AdaptiveIcon(
              _volumeIcon(_osdVolume),
              color: Colors.white,
              size: iconSize,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        );
      },
    );
  }

  Widget _buildVolumeSliderMenu() {
    return StatefulBuilder(
      builder: (context, setMenuState) {
        void apply(double v) {
          setMenuState(() {});
          _setOsdVolume(v);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: SizedBox(
            width: 220,
            child: Row(
              children: [
                IconButton(
                  tooltip: _osdVolume <= 0
                      ? AppLocalizations.of(context).unmute
                      : AppLocalizations.of(context).mute,
                  onPressed: () {
                    setMenuState(() {});
                    _toggleMute();
                  },
                  icon: AdaptiveIcon(
                    _volumeIcon(_osdVolume),
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColorScheme.accent,
                      inactiveTrackColor: Colors.white24,
                      thumbColor: Colors.white,
                      overlayColor: Colors.white24,
                    ),
                    child: Slider(
                      value: _osdVolume.clamp(0.0, 1.0),
                      min: 0,
                      max: 1,
                      onChanged: apply,
                    ),
                  ),
                ),
                SizedBox(
                  width: 38,
                  child: Text(
                    '${(_osdVolume * 100).round()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpeedButton({
    double extent = 48,
    double textSize = AppTypography.fontSizeSm,
    String? tooltip,
  }) {
    return SizedBox(
      width: extent,
      height: extent,
      child: Tooltip(
        message: PlatformDetection.useDesktopUi ? (tooltip ?? '') : '',
        child: InkWell(
          borderRadius: AppRadius.circular(extent / 2),
          onTap: () {
            _showControls();
            _showSpeedSelector();
          },
          child: Center(
            child: Text(
              '${_state.playbackSpeed}x',
              style: TextStyle(color: Colors.white, fontSize: textSize),
            ),
          ),
        ),
      ),
    );
  }

  void _showSpeedSelector() {
    const speedOptions = <double>[0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
    final l10n = AppLocalizations.of(context);
    final options = speedOptions
        .map((s) => TrackOption(label: '${s}x'))
        .toList();
    final currentIdx = speedOptions.indexWhere(
      (s) => (_state.playbackSpeed - s).abs() < 0.001,
    );
    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.playerTooltipPlaybackSpeed,
        options: options,
        selectedIndex: currentIdx >= 0 ? currentIdx : null,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      final speed = speedOptions[result];
      await _runSinglePlayerMutation(
        'speed_$speed',
        () async => _manager.setPlaybackSpeed(speed),
        suppressBackFor: const Duration(seconds: 3),
      );
    }());
    _showControls();
  }

  void _showBitrateSelector() {
    final l10n = AppLocalizations.of(context);
    final options = <int?>[null, 40, 20, 12, 8, 4, 2];
    final current = _manager.maxBitrateOverrideMbps;

    String label(int? mbps) =>
        mbps == null ? l10n.auto : l10n.bitrateValueMbps(mbps);

    final trackOptions = options
        .map((mbps) => TrackOption(label: label(mbps)))
        .toList();
    final currentIdx = options.indexWhere((mbps) => mbps == current);

    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.bitrate,
        options: trackOptions,
        selectedIndex: currentIdx >= 0 ? currentIdx : null,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      final selectedBitrate = options[result];
      _manager.changeBitrate(selectedBitrate);
      unawaited(_pushMedia3UiMetadata());
    }());
    _showControls();
  }

  Widget _buildBitrateButton({
    double extent = 48,
    double iconSize = 24,
    String? tooltip,
  }) {
    final current = _manager.maxBitrateOverrideMbps;
    return _controlButton(
      Icons.video_settings_outlined,
      onPressed: _showBitrateSelector,
      size: iconSize,
      extent: extent,
      tooltip: tooltip,
      iconColor: current != null ? AppColorScheme.accent : Colors.white,
    );
  }

  void _showTrackSelector({required bool audio}) {
    final l10n = AppLocalizations.of(context);
    final resolution = _manager.currentResolution;
    final streamType = audio ? 'Audio' : 'Subtitle';
    final item = _queue.currentItem;
    final offlineMeta = _manager.currentOfflineMetadata;
    final allStreams =
        resolution?.mediaStreams ??
        (offlineMeta?['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    final streams = allStreams.where((s) => s['Type'] == streamType).toList();
    final displaySubtitleStreams = audio
        ? const <Map<String, dynamic>>[]
        : [
            ...streams.where((s) => !_isExternalSubtitleStream(s)),
            ...streams.where(_isExternalSubtitleStream),
          ];
    final optionStreams = audio ? streams : displaySubtitleStreams;
    final audioStreams = allStreams.where((s) => s['Type'] == 'Audio').toList();
    final canDownloadRemote =
        !audio && item is AggregatedItem && _canDownloadRemoteSubtitles(item);

    unawaited(() async {
      final int? currentStreamIndex;
      if (audio) {
        currentStreamIndex =
            _manager.audioStreamIndex ??
            streams.where((s) => s['IsDefault'] == true).firstOrNull?['Index']
                as int?;
      } else {
        final subIdx = await _manager.getSubtitleStreamIndexAsync();
        currentStreamIndex =
            subIdx ??
            streams.where((s) => s['IsDefault'] == true).firstOrNull?['Index']
                as int?;
      }
      final isSubsOff = !audio && currentStreamIndex == -1;

      final options = <TrackOption>[
        if (!audio) TrackOption(label: l10n.off),
        ...optionStreams.asMap().entries.map((entry) {
          final index = entry.key;
          final trackNumber = index + 1;
          final s = entry.value;
          final displayTitle = s['DisplayTitle'] as String?;
          final title = s['Title'] as String?;
          final language = s['Language'] as String?;
          final codec = s['Codec'] as String?;
          final label =
              displayTitle ??
              title ??
              language ??
              l10n.streamTypeFallback(streamType, index + 1);
          final subtitle = audio
              ? [
                  if (language != null && displayTitle != null) language,
                  if (codec != null) codec.toUpperCase(),
                  if (s['Channels'] != null) '${s['Channels']}ch',
                ].join(' · ')
              : (() {
                  final subtitleType =
                      ((codec == null || codec.isEmpty) ? 'Unknown' : codec)
                          .toUpperCase();
                  final deliveryMethod = (s['DeliveryMethod'] as String?)
                      ?.trim()
                      .toLowerCase();
                  final location = s['IsExternal'] == true
                      ? 'External'
                      : (deliveryMethod == 'embed' ? 'Embedded' : 'Internal');
                  return '$subtitleType · $location';
                })();
          return TrackOption(
            label: '$trackNumber - $label',
            subtitle: subtitle.isNotEmpty ? subtitle : null,
            scrollLabel: true,
            scrollSubtitle: true,
          );
        }),
        if (canDownloadRemote)
          TrackOption(
            label: l10n.downloadSubtitlesLabel,
            subtitle: l10n.searchOpenSubtitlesPlugin,
          ),
      ];

      final int? selectedIndex;
      if (audio) {
        final idx = currentStreamIndex != null
            ? streams.indexWhere((s) => s['Index'] == currentStreamIndex)
            : -1;
        selectedIndex = idx >= 0 ? idx : null;
      } else {
        if (isSubsOff || (currentStreamIndex == null && streams.isNotEmpty)) {
          selectedIndex = 0;
        } else if (currentStreamIndex != null) {
          final idx = optionStreams.indexWhere(
            (s) => s['Index'] == currentStreamIndex,
          );
          selectedIndex = idx >= 0 ? idx + 1 : null;
        } else {
          selectedIndex = null;
        }
      }

      if (!mounted) return;

      final result = await TrackSelectorDialog.show(
        context,
        title: audio ? l10n.audioTrack : l10n.subtitleTrack,
        options: options,
        selectedIndex: selectedIndex,
        useRootNavigator: false,
        // Delay controls are only wired for the MPV/MediaKit backend.
        // ExoPlayer (Media3) backend does not play/sync nicely with offsets,
        // so the footer is hidden on other backends to avoid a confusing unresponsive control.
        footer: _activeMediaKitBackend != null
            ? _DelayFooter(
                initialDelay: audio ? _audioDelay : _subtitleDelay,
                label: audio ? l10n.audioDelay : l10n.subtitleDelay,
                onDelayChanged: (d) => _applyDelay(audio: audio, delay: d),
                formatDelay: _formatDelay,
              )
            : null,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      if (!audio) {
        if (result == 0) {
          await _runSinglePlayerMutation(
            'subtitles_off',
            _manager.disableSubtitles,
          );
          _syncSubtitleActive();
          return;
        }
        final streamIdx = result - 1;
        if (canDownloadRemote && streamIdx == streams.length) {
          await _downloadRemoteSubtitles(item, streams, audioStreams);
          return;
        }
        if (streamIdx < optionStreams.length) {
          final streamIndex =
              optionStreams[streamIdx]['Index'] as int? ?? streamIdx;
          await _runSinglePlayerMutation(
            'subtitle_$streamIndex',
            () => _manager.changeSubtitleTrack(streamIndex),
          );
          _syncSubtitleActive();
        }
      } else {
        if (result < streams.length) {
          final streamIndex = streams[result]['Index'] as int? ?? result;
          await _runSinglePlayerMutation(
            'audio_$streamIndex',
            () => _manager.changeAudioTrack(streamIndex),
          );
        }
      }
    }());
    _showControls();
  }

  bool _isExternalSubtitleStream(Map<String, dynamic> stream) {
    if (stream['IsExternal'] == true) {
      return true;
    }
    final deliveryMethod = (stream['DeliveryMethod'] as String?)
        ?.trim()
        .toLowerCase();
    return deliveryMethod == 'external';
  }

  Widget _buildZoomButton({
    double size = 24,
    double extent = 48,
    String? tooltip,
  }) {
    final icon = switch (_zoomMode) {
      ZoomMode.fit => Icons.fit_screen_rounded,
      ZoomMode.autoCrop => Icons.crop_rounded,
      ZoomMode.stretch => Icons.open_in_full_rounded,
    };
    return _controlButton(
      icon,
      size: size,
      extent: extent,
      onPressed: () {
        final modes = ZoomMode.values;
        final next = modes[(_zoomMode.index + 1) % modes.length];
        setState(() => _zoomMode = next);
        _prefs.set(UserPreferences.playerZoomMode, next);
        _showZoomModeToast(next);
        unawaited(_syncMedia3ZoomMode());
        unawaited(_pushMedia3UiMetadata());
      },
      tooltip: tooltip,
    );
  }

  void _showZoomModeToast(ZoomMode mode) {
    final overlay = Overlay.of(context, rootOverlay: true);
    final l10n = AppLocalizations.of(context);
    _zoomModeToastTimer?.cancel();
    _removeZoomModeToastOverlay();

    _zoomModeToastOverlay = OverlayEntry(
      builder: (overlayContext) => Positioned(
        top: MediaQuery.paddingOf(overlayContext).top + 12,
        left: 0,
        right: 0,
        child: IgnorePointer(
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xD91A2230),
                  borderRadius: AppRadius.circular(10),
                  border: Border.all(color: const Color(0x668FA8CC), width: 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x4D000000),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '${l10n.playerZoomMode}: ${_zoomModeLabel(mode)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFE4ECF7),
                    fontSize: AppTypography.fontSizeSm,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_zoomModeToastOverlay!);
    _zoomModeToastTimer = Timer(
      const Duration(seconds: 3),
      _removeZoomModeToastOverlay,
    );
  }

  void _removeZoomModeToastOverlay() {
    _zoomModeToastOverlay?.remove();
    _zoomModeToastOverlay = null;
  }

  String _zoomModeLabel(ZoomMode mode) {
    final spaced = mode.name.replaceAllMapped(_camelCaseSpaceRe, (_) => ' ');
    return spaced.isEmpty
        ? mode.name
        : '${spaced[0].toUpperCase()}${spaced.substring(1)}';
  }

  String _tooltipMessage(String label, {String? shortcut}) {
    if (shortcut == null || shortcut.isEmpty || PlatformDetection.isTV) {
      return label;
    }
    return '$label ($shortcut)';
  }

  void _showChapters() {
    final l10n = AppLocalizations.of(context);
    final item = _queue.currentItem;
    if (item is! AggregatedItem) return;
    final chapters = item.chapters;
    if (chapters.isEmpty) return;
    final options = List.generate(chapters.length, (i) {
      final ch = chapters[i];
      final name = (ch['Name'] as String?) ?? l10n.chapterNumber(i + 1);
      final ticks = ch['StartPositionTicks'] as int? ?? 0;
      return TrackOption(
        label: name,
        subtitle: _formatDuration(Duration(microseconds: ticks ~/ 10)),
      );
    });
    unawaited(() async {
      final result = await TrackSelectorDialog.show(
        context,
        title: l10n.chapters,
        options: options,
      );
      _suppressBackNavigation();
      if (result == null || !mounted) return;
      final ch = chapters[result];
      final ticks = ch['StartPositionTicks'] as int? ?? 0;
      _suppressSeekPrompts();
      _manager.seekTo(Duration(microseconds: ticks ~/ 10));
    }());
    _showControls();
  }

  bool _hasCastCrew(dynamic item) {
    if (item is! AggregatedItem) return false;
    if (item.people.isNotEmpty) return true;
    return item.type == 'Episode' &&
        item.seriesId != null &&
        item.seriesId!.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> _resolveCastPeople(
    AggregatedItem item,
  ) async {
    if (item.people.isNotEmpty) {
      return item.people;
    }

    if (item.type != 'Episode' ||
        item.seriesId == null ||
        item.seriesId!.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    try {
      final client = _clientForItem(item);
      final seriesData = await client.itemsApi.getItem(item.seriesId!);
      final people = (seriesData['People'] as List?)
          ?.cast<Map<String, dynamic>>()
          .toList(growable: false);
      return people ?? const <Map<String, dynamic>>[];
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  Future<void> _showCast() async {
    final item = _queue.currentItem;
    if (item is! AggregatedItem) return;
    final people = await _resolveCastPeople(item);
    if (!mounted) return;
    if (people.isEmpty) return;

    final imageApi = _clientForItem(item).imageApi;

    void openPersonDetails(BuildContext routeContext, String personId) {
      Navigator.of(routeContext).pop();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.push(Destinations.item(personId, serverId: item.serverId));
      });
    }

    Widget personCard(
      BuildContext routeContext,
      Map<String, dynamic> person, {
      bool autofocus = false,
    }) {
      final name = (person['Name'] as String?) ?? '';
      final role = person['Role'] as String?;
      final type = person['Type'] as String?;
      final subtitle = (role != null && role.isNotEmpty) ? role : (type ?? '');
      final personId = person['Id']?.toString();
      final tag = person['PrimaryImageTag'] as String?;

      String? imageUrl;
      if (personId != null && tag != null && tag.isNotEmpty) {
        imageUrl = imageApi.getPrimaryImageUrl(
          personId,
          maxHeight: 200,
          tag: tag,
        );
      }

      return _CastPersonTile(
        name: name,
        subtitle: subtitle,
        imageUrl: imageUrl,
        autofocus: autofocus,
        onPressed: personId == null
            ? null
            : () => openPersonDetails(routeContext, personId),
      );
    }

    unawaited(() async {
      await showStyledPlayerDialog<void>(
        context,
        title: AppLocalizations.of(context).castAndCrew,
        maxWidth: 640,
        builder: (dialogCtx) => SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.spaceLg,
              AppSpacing.spaceSm,
              AppSpacing.spaceLg,
              AppSpacing.spaceSm,
            ),
            itemCount: people.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (ctx, i) =>
                personCard(dialogCtx, people[i], autofocus: i == 0),
          ),
        ),
      );
      _suppressBackNavigation();
    }());
    _showControls();
  }

  Future<void> _castToDevice() async {
    final item = _queue.currentItem;
    if (item is! AggregatedItem) return;

    if (_manager.isOfflinePlayback) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.castingUnavailableOffline)));
      return;
    }

    final positionTicks = _state.position.inMicroseconds * 10;
    final startIndex = _queue.currentIndex < 0 ? 0 : _queue.currentIndex;
    final queueItems = _queue.items
        .skip(startIndex)
        .whereType<AggregatedItem>()
        .toList(growable: false);

    await showRemotePlayToSessionDialog(
      context,
      item: item,
      queueItems: queueItems.length > 1 ? queueItems : null,
      startPositionTicks: positionTicks,
      audioStreamIndex: _manager.audioStreamIndex,
      subtitleStreamIndex: _manager.subtitleStreamIndex,
    );
  }

  void _showCastControls() {
    final kind = _castService.activeKind;
    if (kind == null) return;

    _refreshRemoteVolume();

    final l10n = AppLocalizations.of(context);
    final label = switch (kind) {
      CastTargetKind.googleCast => 'Google Cast',
      CastTargetKind.airPlay => 'AirPlay',
      CastTargetKind.dlna => 'DLNA',
      _ => l10n.cast,
    };

    final playbackSubtitle = _remotePlaybackState != null
        ? '${_remotePlaybackState![0].toUpperCase()}${_remotePlaybackState!.substring(1)}'
              ' · ${_formatDuration(Duration(microseconds: _remotePositionTicks ~/ 10))}'
        : null;

    unawaited(() async {
      await showStyledPlayerDialog<void>(
        context,
        title: l10n.castControlsTitle(label),
        subtitle: playbackSubtitle,
        showCancel: true,
        builder: (dialogCtx) {
          double? localVolume = _remoteVolume;
          return StatefulBuilder(
            builder: (_, setDialogState) {
              Widget actionRow(IconData icon, String text, VoidCallback onTap) {
                return InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        AdaptiveIcon(
                          icon,
                          color: Colors.white.withValues(alpha: 0.8),
                          size: 20,
                        ),
                        const SizedBox(width: 14),
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (kind == CastTargetKind.googleCast ||
                        kind == CastTargetKind.dlna) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                        child: Row(
                          children: [
                            const AdaptiveIcon(
                              Icons.volume_up_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              l10n.deviceVolume,
                              style: const TextStyle(color: Colors.white),
                            ),
                            if (localVolume != null) ...[
                              const Spacer(),
                              Text(
                                '${(localVolume! * 100).round()}%',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (localVolume == null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              l10n.unavailable,
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ),
                        )
                      else
                        SliderTheme(
                          data: SliderTheme.of(dialogCtx).copyWith(
                            activeTrackColor: AppColorScheme.accent,
                            inactiveTrackColor: Colors.white24,
                            thumbColor: Colors.white,
                            overlayColor: Colors.white24,
                          ),
                          child: Slider(
                            value: localVolume!.clamp(0.0, 1.0),
                            min: 0,
                            max: 1,
                            onChanged: (v) {
                              localVolume = v;
                              setDialogState(() {});
                              _setRemoteVolume(v);
                            },
                          ),
                        ),
                      Container(
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.08),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                      ),
                    ],
                    actionRow(Icons.play_arrow_rounded, l10n.play, () {
                      Navigator.pop(dialogCtx);
                      unawaited(_runCastAction((k) => _castService.play(k)));
                    }),
                    actionRow(Icons.pause_rounded, l10n.pause, () {
                      Navigator.pop(dialogCtx);
                      unawaited(_runCastAction((k) => _castService.pause(k)));
                    }),
                    actionRow(Icons.sync_rounded, l10n.syncPosition, () {
                      Navigator.pop(dialogCtx);
                      final positionTicks = _state.position.inMicroseconds * 10;
                      unawaited(
                        _runCastAction(
                          (k) => _castService.seek(
                            k,
                            positionTicks: positionTicks,
                          ),
                        ),
                      );
                    }),
                    actionRow(Icons.stop_rounded, l10n.stopCast(label), () {
                      Navigator.pop(dialogCtx);
                      unawaited(_runCastAction((k) => _castService.stop(k)));
                    }),
                  ],
                ),
              );
            },
          );
        },
      );
      _suppressBackNavigation();
    }());
  }

  Future<void> _runCastAction(
    Future<void> Function(CastTargetKind kind) action,
  ) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;

    try {
      await action(kind);
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final label = switch (kind) {
        CastTargetKind.googleCast => 'Google Cast',
        CastTargetKind.airPlay => 'AirPlay',
        CastTargetKind.dlna => 'DLNA',
        _ => l10n.cast,
      };
      _showThrottledCastError(l10n.castActionFailed(label, '$e'));
    }
  }

  void _applyDelay({required bool audio, required double delay}) {
    if (audio) {
      _audioDelay = delay;
      _manager.backend?.setAudioDelay(delay);
    } else {
      _subtitleDelay = delay;
      _manager.backend?.setSubtitleDelay(delay);
    }
  }

  String _formatBitrate(int? bitrate) {
    if (bitrate == null) {
      return AppLocalizations.of(context).unknown;
    }
    if (bitrate >= 1000000) {
      return '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';
    }
    if (bitrate >= 1000) {
      return '${(bitrate / 1000).toStringAsFixed(0)} Kbps';
    }
    return '$bitrate bps';
  }

  String _formatVideoCodec(Map<String, dynamic> stream) {
    var codec = switch (((stream['Codec'] as String?) ?? '').toUpperCase()) {
      'HEVC' => 'HEVC (H.265)',
      'H264' || 'AVC' => 'AVC (H.264)',
      final c => c,
    };

    final profile = stream['Profile'] as String?;
    if (profile != null) codec += ' $profile';
    final level = stream['Level'] as num?;
    if (level != null) codec += '@L$level';
    return codec;
  }

  String _formatAudioCodec(Map<String, dynamic> stream) {
    final label = audioLabelFromProfileCodec(
      stream['Profile'] as String?,
      stream['Codec'] as String?,
    );
    if (label != null) {
      return switch (label) {
        'EAC3' => 'E-AC3 (Dolby Digital Plus)',
        'AC3' => 'AC3 (Dolby Digital)',
        'TRUEHD' => 'TrueHD',
        _ => label,
      };
    }
    return ((stream['Codec'] as String?) ?? '').toUpperCase();
  }

  String _formatChannels(int? channels) {
    if (channels == null) return AppLocalizations.of(context).unknown;
    final l10n = AppLocalizations.of(context);
    return switch (channels) {
      8 => '7.1',
      6 => '5.1',
      2 => l10n.stereo,
      1 => l10n.mono,
      _ => l10n.channelsCount(channels),
    };
  }

  String _getHdrType(Map<String, dynamic> stream) {
    final rangeType = stream['VideoRangeType'] as String? ?? '';
    if (rangeType.contains('DOVI') || rangeType.contains('DoVi')) {
      return 'Dolby Vision';
    }
    if (rangeType.contains('HDR10Plus') || rangeType.contains('HDR10+')) {
      return 'HDR10+';
    }
    if (rangeType.contains('HDR10') || rangeType.contains('HDR')) {
      return 'HDR10';
    }
    if (rangeType.contains('HLG')) {
      return 'HLG';
    }
    final range = stream['VideoRange'] as String?;
    if (range == 'HDR') {
      return 'HDR';
    }
    return 'SDR';
  }

  void _showStreamInfo() {
    final l10n = AppLocalizations.of(context);
    final streamInfoSections = _buildMedia3StreamInfoSections();
    unawaited(
      showStreamInfoDialog(
        context: context,
        title: l10n.playbackInformation,
        streamInfoSections: streamInfoSections,
      ),
    );
    _showControls();
  }
}

class _TvFocusButton extends StatefulWidget {
  const _TvFocusButton({
    required this.extent,
    required this.child,
    this.focusNode,
    this.tooltip,
    this.onPressed,
    this.onRightBoundary,
  });

  final FocusNode? focusNode;
  final double extent;
  final String? tooltip;
  final VoidCallback? onPressed;
  final VoidCallback? onRightBoundary;
  final Widget child;

  @override
  State<_TvFocusButton> createState() => _TvFocusButtonState();
}

class _TvFocusButtonState extends State<_TvFocusButton> {
  late FocusNode _effectiveNode;
  bool _ownsNode = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _effectiveNode = widget.focusNode!;
    } else {
      _effectiveNode = FocusNode();
      _ownsNode = true;
    }
    _effectiveNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(_TvFocusButton old) {
    super.didUpdateWidget(old);
    final newNode = widget.focusNode;
    final oldNode = old.focusNode;
    if (newNode != oldNode) {
      _effectiveNode.removeListener(_onFocusChange);
      if (_ownsNode) {
        _effectiveNode.dispose();
        _ownsNode = false;
      }
      if (newNode != null) {
        _effectiveNode = newNode;
      } else {
        _effectiveNode = FocusNode();
        _ownsNode = true;
      }
      _effectiveNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    _effectiveNode.removeListener(_onFocusChange);
    if (_ownsNode) _effectiveNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!mounted) return;
    final hasFocus = _effectiveNode.hasFocus;
    if (_focused != hasFocus) {
      setState(() => _focused = hasFocus);
    }

    if (hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_effectiveNode.hasFocus) return;
        Scrollable.ensureVisible(
          context,
          alignment: 0.5,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tooltipText = widget.tooltip;
    final hasTooltip = tooltipText != null && tooltipText.isNotEmpty;
    final focusWidget = Focus(
      focusNode: _effectiveNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            final moved = FocusScope.of(context).previousFocus();
            return moved ? KeyEventResult.handled : KeyEventResult.ignored;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            if (widget.onRightBoundary != null) {
              widget.onRightBoundary!();
              return KeyEventResult.handled;
            }
            final moved = FocusScope.of(context).nextFocus();
            return moved ? KeyEventResult.handled : KeyEventResult.ignored;
          }
        }
        if (widget.onPressed != null &&
            event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.extent,
        height: widget.extent,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _focused
              ? Colors.white.withValues(alpha: 0.22)
              : Colors.transparent,
          border: _focused
              ? Border.fromBorderSide(
                  ThemeRegistry.active.borders.focusBorder.copyWith(
                    color: Colors.white,
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Center(child: widget.child),
      ),
    );
    final button = widget.onPressed != null
        ? GestureDetector(onTap: widget.onPressed, child: focusWidget)
        : focusWidget;

    if (!_focused || !hasTooltip) {
      return button;
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        button,
        Positioned(
          bottom: widget.extent + 8,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.78),
                borderRadius: AppRadius.circular(8),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.focusBorder.copyWith(
                    color: Colors.white.withValues(alpha: 0.45),
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  tooltipText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeXs,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CastPersonTile extends StatefulWidget {
  final String name;
  final String subtitle;
  final String? imageUrl;
  final bool autofocus;
  final VoidCallback? onPressed;

  const _CastPersonTile({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.autofocus,
    this.onPressed,
  });

  @override
  State<_CastPersonTile> createState() => _CastPersonTileState();
}

class _CastPersonTileState extends State<_CastPersonTile> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: widget.onPressed != null,
      autofocus: widget.autofocus,
      onFocusChange: (f) => setState(() => _focused = f),
      onKeyEvent: (_, event) {
        if (widget.onPressed != null && isActivateKey(event)) {
          widget.onPressed!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _focused ? 1.06 : 1.0,
          duration: const Duration(milliseconds: 120),
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 110,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: _focused
                        ? Border.fromBorderSide(
                            ThemeRegistry.active.borders.focusBorder.copyWith(
                              color: Colors.white,
                              width: 2,
                            ),
                          )
                        : null,
                  ),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    backgroundImage: widget.imageUrl != null
                        ? NetworkImage(widget.imageUrl!)
                        : null,
                    child: widget.imageUrl == null
                        ? const AdaptiveIcon(
                            Icons.person,
                            color: Colors.white54,
                            size: 32,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.subtitle.isNotEmpty)
                  Text(
                    widget.subtitle,
                    style: const TextStyle(color: Colors.white54, fontSize: 11),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DelayFooter extends StatefulWidget {
  final double initialDelay;
  final String label;
  final void Function(double delay) onDelayChanged;
  final String Function(double seconds) formatDelay;

  const _DelayFooter({
    required this.initialDelay,
    required this.label,
    required this.onDelayChanged,
    required this.formatDelay,
  });

  @override
  State<_DelayFooter> createState() => _DelayFooterState();
}

class _DelayFooterState extends State<_DelayFooter> {
  late double _delay;

  @override
  void initState() {
    super.initState();
    _delay = widget.initialDelay;
  }

  void _adjust(double delta) {
    setState(() => _delay = ((_delay + delta) * 10).roundToDouble() / 10);
    widget.onDelayChanged(_delay);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                widget.formatDelay(_delay),
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _adjust(-0.1),
                icon: const AdaptiveIcon(
                  Icons.remove_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.delayMinusMs(100),
              ),
              Text(
                l10n.delayMinusMs(100),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: AppTypography.fontSizeXs,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  setState(() => _delay = 0.0);
                  widget.onDelayChanged(0.0);
                },
                style: OutlinedButton.styleFrom(
                  side: ThemeRegistry.active.borders.chipBorder,
                ),
                child: Text(
                  l10n.reset,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Text(
                l10n.delayPlusMs(100),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: AppTypography.fontSizeXs,
                ),
              ),
              IconButton(
                onPressed: () => _adjust(0.1),
                icon: const AdaptiveIcon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.delayPlusMs(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
