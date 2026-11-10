import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../../../playback/subtitle_style.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/utils/chapter_markers.dart';
import '../../../data/utils/episode_cast_utils.dart';
import '../../../data/utils/server_trickplay.dart';
import '../../../data/utils/trickplay_headers.dart';
import '../../../data/models/trickplay_info.dart';
import '../../../data/services/log_service.dart';
import '../../../data/services/media_segment_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../playback/cinema_skip_controller.dart';
import '../../../playback/apple_player_ui.dart';
import '../../../playback/native_apple_player_backend.dart';
import '../../../playback/appletv_subtitles.dart';
import '../../../playback/subtitle_cue_loader.dart';
import '../../../playback/playback_info_sections.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../watch_party/silo_watch_party_manager.dart';
import '../../widgets/watch_party/watch_party_player_overlay.dart';
import '../watch_party/silo_watch_party_screen.dart';
import '../../theme/app_theme_controller.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../navigation/app_router.dart';
import '../../navigation/destinations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/remote_subtitle_labels.dart';
import '../../../util/subtitle_appearance_schedule.dart';
import '../../../util/episode_playability.dart';
import '../../../util/overview_text.dart';
import '../../../util/platform_detection.dart';
import 'appletv_playback_prompt_controller.dart';
import 'episode_browser.dart';
import 'osd_buttons.dart';

class AppleTvPlayerHostScreen extends StatefulWidget {
  const AppleTvPlayerHostScreen({super.key});

  @override
  State<AppleTvPlayerHostScreen> createState() =>
      _AppleTvPlayerHostScreenState();
}

class _AppleTvPlayerHostScreenState extends State<AppleTvPlayerHostScreen> {
  StreamSubscription<void>? _exitSub;
  StreamSubscription<void>? _queueSub;
  StreamSubscription<void>? _sessionEndedSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;
  StreamSubscription<bool>? _reconnectingSub;
  StreamSubscription<Map<String, dynamic>>? _actionSub;
  bool _exiting = false;
  bool _exitFinished = false;
  final Map<String, List<Map<String, dynamic>>> _castCache = {};
  String? _castResolving;
  AppleTvPlaybackPromptController? _prompts;
  MediaSegmentService? _segmentService;
  String? _segmentsLoadedForItemId;
  String? _deviceLabel;
  final _chaptersFetchedItemIds = <String>{};
  StreamSubscription<Duration>? _positionSub;
  UserPreferences? _prefsListened;
  (SubtitleStyle, double, double, int)? _lastSubtitleStyle;
  String _lastTrickplayPrefs = '';
  String _lastTimeSlots = '';
  TrickplayInfo? _trickplayInfo;
  String? _trickplayKey;
  int _trickplayLoadGeneration = 0;
  static const int _trickplayFrameWidth = 320;
  SyncPlayManager? _syncPlay;
  SiloWatchPartyManager? _party;
  StreamSubscription<WatchPartyToast>? _partyToastSub;
  StreamSubscription<WatchPartyReaction>? _partyReactionSub;
  bool _followingParty = false;
  String? _lastPartyPayload;
  bool _partyGlyphsSent = false;
  Timer? _partyWaitTicker;
  final Set<WatchPartyChatEntry> _partyChatSeen = {};
  AppThemeController? _themeController;
  ScreensaverController? _screensaverController;
  StreamSubscription<bool>? _screensaverPlayingSub;
  PlaybackBringupState _bringupState = const PlaybackBringupState.idle();
  EpisodeBrowserController? _episodeBrowser;
  bool _episodeBrowserShown = false;
  late final CinemaSkipController _cinemaSkip;

  bool get _isCinemaPreroll =>
      _rawDataForQueueItem(_manager?.queueService.currentItem)?['__moonfinIsPreroll'] ==
      true;

  void _configureCinemaSkip() {
    final prefs = _prefsListened;
    if (prefs == null) return;
    _cinemaSkip.configure(
      enabled: prefs.get(UserPreferences.cinemaModeSkipEnabled),
    );
  }

  void _syncCinemaSkip() {
    final manager = _manager;
    if (manager == null) return;
    final item = manager.queueService.currentItem;
    final data = _rawDataForQueueItem(item);
    _cinemaSkip.synchronize(
      item: item,
      index: manager.queueService.currentIndex,
      preroll: data?['__moonfinIsPreroll'] == true ? data : null,
      itemId: _itemIdForQueueItem(item),
      source: manager.bringupState,
      duration: manager.backend?.duration ?? Duration.zero,
      playing: manager.state.isPlaying,
    );
  }

  void _syncCinemaSkipButton() {
    final backend = _backend;
    if (!mounted || backend == null) return;
    // Once enabled, Cinema Skip stays active even when its button is hidden.
    final active = _isCinemaPreroll && _cinemaSkip.enabled;
    final prefs = _prefsListened;
    final countdown = prefs == null
        ? MediaSegmentCountdown.both.name
        : prefs.get(UserPreferences.mediaSegmentCountdown).name;
    unawaited(backend.setCinemaSkipState({
      'active': active,
      'visible': active && _cinemaSkip.visible,
      'generation': _cinemaSkip.generation,
      'skipLabel': AppLocalizations.of(context).settingsSkip,
      'durationMs': _cinemaSkip.duration.inMilliseconds,
      'countdownStyle': countdown,
    }));
  }

  NativeApplePlayerBackend? get _backend {
    try {
      return GetIt.instance<NativeApplePlayerBackend>();
    } catch (_) {
      return null;
    }
  }

  PlaybackManager? get _manager {
    try {
      return GetIt.instance<PlaybackManager>();
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(playbackDeviceLabel().then((label) => _deviceLabel = label));
    _cinemaSkip = CinemaSkipController(
      onSkip: () => _manager?.nextInQueue() ?? Future<void>.value(),
    );
    try {
      _screensaverController = GetIt.instance<ScreensaverController>();
    } catch (_) {}
    _screensaverController?.setPlaybackActive(true);
    _screensaverController?.setNativePlayerPresented(true);
    // The native player on iOS sits over this route, and iOS asks the Flutter
    // view which way it may turn, so the lock has to be set here as well.
    if (PlatformDetection.isIOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    _exitSub = _backend?.userExitStream.listen((_) => _handleExit());
    _actionSub = _backend?.uiActionStream.listen(_handleUiAction);
    final manager = _manager;
    if (manager != null) {
      _bringupState = manager.bringupState;
      _queueSub = manager.queueService.queueChangedStream.listen(
        (_) => _onQueueChanged(),
      );
      _sessionEndedSub = manager.sessionEndedStream.listen(
        (_) => _handleExit(),
      );
      _reconnectingSub = manager.reconnectingStream.listen((reconnecting) {
        if (!mounted) return;
        unawaited(
          _backend?.setReconnecting(
                reconnecting
                    ? AppLocalizations.of(context).watchPartyReconnecting
                    : null,
              ) ??
              Future<void>.value(),
        );
      });
      _bringupSub = manager.bringupStateStream.listen((state) {
        if (mounted) {
          setState(() => _bringupState = state);
        }
        _pushMetadata();
        _syncCinemaSkip();
        if (state.phase == PlaybackBringupPhase.ready) {
          _pushSubtitleStyle(force: true);
        }
        // The initState load can run before the queue item resolves, so retry
        // here. The per-item guard makes repeat events a no-op.
        _loadSegmentsForCurrentItem();
      });
      _screensaverPlayingSub = manager.state.playingStream.listen((playing) {
        _screensaverController?.setPlaybackActive(playing);
        _syncCinemaSkip();
      });
      _positionSub = manager.state.positionStream.listen((position) {
        if (!_exiting && (!_isCinemaPreroll || !_cinemaSkip.enabled)) {
          _prompts?.onPositionTick(position, manager.state.duration);
        }
        _syncCinemaSkip();
      });
    }
    try {
      final prefs = GetIt.instance<UserPreferences>();
      manager?.autoAdvanceEnabled = prefs.get(
        UserPreferences.autoplayNextEpisode,
      );
      _prompts = AppleTvPlaybackPromptController(
        prefs: prefs,
        commands: _HostPromptCommands(this),
        queueSnapshot: _queueSnapshot,
        segmentService: () => _segmentService,
      );
      _prefsListened = prefs;
      _lastTrickplayPrefs = _trickplayPrefsSnapshot(prefs);
      _lastTimeSlots = _timeSlotsSnapshot(prefs);
      prefs.addListener(_onPrefsChanged);
    } catch (_) {}
    _configureCinemaSkip();
    _syncCinemaSkip();
    _cinemaSkip.addListener(_syncCinemaSkipButton);
    if (GetIt.instance.isRegistered<SyncPlayManager>()) {
      _syncPlay = GetIt.instance<SyncPlayManager>();
      _syncPlay!.addListener(_onSyncPlayChanged);
    }
    if (GetIt.instance.isRegistered<SiloWatchPartyManager>()) {
      final party = _party = GetIt.instance<SiloWatchPartyManager>();
      _followingParty = party.controlsPlayback;
      // Only what arrives from now on shows over the video.
      _partyChatSeen.addAll(party.chat);
      party.addListener(_onPartyChanged);
      _partyToastSub = party.toasts.listen(_onPartyToast);
      _partyReactionSub = party.reactions.listen(
        (r) => _sendPartyEvent({
          'type': 'reaction',
          'kind': r.reaction,
          'name': r.name,
        }),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _pushParty();
      _loadSegmentsForCurrentItem();
      _pushMetadata();
      _pushSubtitleStyle();
      _pushThemeConfig();
      _pushPromptStrings();
      _pushTimeSlots();
      _syncCinemaSkipButton();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppThemeController? controller;
    try {
      controller = AppThemeScope.of(context);
    } catch (_) {
      controller = null;
    }
    if (!identical(controller, _themeController)) {
      _themeController?.removeListener(_onThemeChanged);
      _themeController = controller;
      _themeController?.addListener(_onThemeChanged);
    }
  }

  void _onThemeChanged() => _pushThemeConfig();

  void _pushThemeConfig() {
    final backend = _backend;
    if (backend == null) return;
    unawaited(
      backend.setThemeConfig(
        isGlass: AppColorScheme.isGlass,
        accentARGB: AppColorScheme.accent.toARGB32(),
        surfaceARGB: AppColorScheme.surface.toARGB32(),
        surfaceVariantARGB: AppColorScheme.surfaceVariant.toARGB32(),
        onSurfaceARGB: AppColorScheme.onSurface.toARGB32(),
        rangeProgressARGB: AppColorScheme.rangeProgress.toARGB32(),
        rangeTrackARGB: AppColorScheme.rangeTrack.toARGB32(),
      ),
    );
  }

  /// Sends the localized prompt text the native renderer composes itself.
  /// The endsIn value keeps its {time} placeholder so languages that put the
  /// time mid sentence still read correctly.
  void _pushPromptStrings() {
    final backend = _backend;
    if (backend == null || !mounted) return;
    final l10n = AppLocalizations.of(context);
    unawaited(
      backend.setPromptStrings({
        'endsIn': l10n.endsIn('{time}'),
        'upNext': l10n.upNext,
        'playNext': l10n.playNext,
        'stillWatchingTitle': l10n.stillWatching,
        'stillWatchingBody': l10n.stillWatchingContent,
        'stillWatchingContinue': l10n.stillWatchingContinue,
        'stillWatchingStop': l10n.stillWatchingStop,
        'fetchingSubtitles': l10n.fetchingSubtitles,
      }),
    );
  }

  /// The native renderer formats the seekbar times itself every tick, so it
  /// gets the slot layout and the clock style rather than finished strings.
  /// The endsAt template keeps its {time} placeholder.
  void _pushTimeSlots() {
    final backend = _backend;
    if (backend == null || !mounted) return;
    final l10n = AppLocalizations.of(context);
    unawaited(
      backend.setTimeSlots({
        ..._timeSlotArgs(GetIt.instance<UserPreferences>()),
        'endsAt': l10n.endsAt('{time}'),
      }),
    );
  }

  Map<String, Object> _timeSlotArgs(UserPreferences prefs) => {
    'aboveLeft': prefs.get(UserPreferences.playbackTimeAboveLeft).name,
    'aboveCenter': prefs.get(UserPreferences.playbackTimeAboveCenter).name,
    'aboveRight': prefs.get(UserPreferences.playbackTimeAboveRight).name,
    'belowLeft': prefs.get(UserPreferences.playbackTimeBelowLeft).name,
    'belowCenter': prefs.get(UserPreferences.playbackTimeBelowCenter).name,
    'belowRight': prefs.get(UserPreferences.playbackTimeBelowRight).name,
    'use24Hour': prefs.get(UserPreferences.use24HourClock),
  };

  /// [force] pushes even when nothing changed, for a new stream or backend.
  void _pushSubtitleStyle({bool force = false}) {
    final backend = _backend;
    if (backend == null) return;
    try {
      final manager = _manager;
      if (manager == null) return;
      final prefs = GetIt.instance<UserPreferences>();
      final style = SubtitleStyle.forResolution(
        prefs,
        manager.currentResolution,
      );
      final appearance = (
        style,
        prefs.get(UserPreferences.secondarySubtitleSizeAdjustment),
        prefs.get(UserPreferences.secondarySubtitleOffsetPosition),
        prefs.get(UserPreferences.secondarySubtitleTextColor),
      );
      final previous = _lastSubtitleStyle;
      if (!force && appearance == previous) return;
      _lastSubtitleStyle = appearance;
      unawaited(syncSecondarySubtitleStyle(manager, prefs));
      if (!force && style == previous?.$1) return;
      backend.configureSubtitleStyle(
        textColor: style.textColor,
        backgroundColor: style.backgroundColor,
        strokeColor: style.strokeColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        verticalOffset: style.verticalOffset,
        strokeScale: style.strokeScale,
        shadowColor: style.shadowColor,
        shadowOffset: style.shadowOffset,
        shadowBlur: style.shadowBlur,
        fontFamily: style.fontFamily,
      );
    } catch (_) {}
  }

  String _logoUrlForItem(dynamic item) {
    Map<String, dynamic>? raw;
    String? itemId;
    String? serverId;
    if (item is AggregatedItem) {
      raw = item.rawData;
      itemId = item.id;
      serverId = item.serverId;
    } else if (item is Map) {
      raw = item.cast<String, dynamic>();
      itemId = (raw['Id'] ?? raw['id'])?.toString();
      serverId = (raw['ServerId']?.toString()) ?? (raw['serverId']?.toString());
    }
    if (raw == null) return '';

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
      logoItemId = itemId;
    }

    final normalizedItemId = logoItemId?.trim();
    final normalizedTag = logoTag?.trim();
    if (normalizedItemId == null ||
        normalizedItemId.isEmpty ||
        normalizedTag == null ||
        normalizedTag.isEmpty) {
      return '';
    }

    try {
      MediaServerClient? client;
      if (serverId != null && serverId.isNotEmpty) {
        client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
          serverId,
        );
      }
      client ??= GetIt.instance<MediaServerClient>();
      return client.imageApi.getLogoImageUrl(
        normalizedItemId,
        maxWidth: 420,
        tag: normalizedTag,
      );
    } catch (_) {
      return '';
    }
  }



  Map<String, dynamic>? _rawDataForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.rawData;
    if (item is Map) return item.cast<String, dynamic>();
    if (item is String) return _manager?.currentOfflineMetadata;
    return null;
  }

  String? _itemIdForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.id;
    if (item is Map) return (item['Id'] ?? item['id'])?.toString();
    return null;
  }

  MediaServerClient? _clientForQueueItem(dynamic item) {
    try {
      String? serverId;
      if (item is AggregatedItem) {
        serverId = item.serverId;
      } else if (item is Map) {
        serverId =
            (item['ServerId']?.toString()) ?? (item['serverId']?.toString());
      }
      MediaServerClient? client;
      if (serverId != null && serverId.isNotEmpty) {
        client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
          serverId,
        );
      }
      return client ?? GetIt.instance<MediaServerClient>();
    } catch (_) {
      return null;
    }
  }

  String _artworkUrlForItem(dynamic item) {
    final raw = _rawDataForQueueItem(item);
    final itemId = _itemIdForQueueItem(item);
    final imageApi = _clientForQueueItem(item)?.imageApi;
    if (raw == null || itemId == null || itemId.isEmpty || imageApi == null) {
      return '';
    }
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
    return '';
  }

  List<Map<String, dynamic>> _streamInfoSections(PlaybackManager manager) {
    final res = manager.currentResolution;
    final raw = _rawDataForQueueItem(manager.queueService.currentItem);
    final sources = (raw?['MediaSources'] as List?)
        ?.cast<Map<String, dynamic>>();
    final mediaSource =
        sources?.where((s) => s['Id'] == res?.mediaSourceId).firstOrNull ??
        sources?.firstOrNull;
    int? qualityLimitMbps = manager.maxBitrateOverrideMbps;
    try {
      qualityLimitMbps = userQualityLimitMbps(
        qualityLimitMbps,
        GetIt.instance<UserPreferences>().get(UserPreferences.maxBitrate),
      );
    } catch (_) {}

    return buildPlaybackInfoSections(
      l10n: AppLocalizations.of(context),
      resolution: res,
      mediaStreams:
          res?.mediaStreams ??
          (raw?['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
          const <Map<String, dynamic>>[],
      mediaSource: mediaSource,
      fallbackPlayMethod: manager.bringupState.playMethod,
      audioStreamIndex: manager.audioStreamIndex,
      subtitleStreamIndex: manager.subtitleStreamIndex,
      offline: manager.isOfflinePlayback,
      transcodeForced: transcodeForcedBySettings(manager),
      qualityLimitMbps: qualityLimitMbps,
      player: 'AetherEngine',
      device: _deviceLabel,
      audioRoute: playbackAudioRoute(
        res?.mediaSourceId ?? mediaSource?['Id']?.toString(),
      ),
    );
  }

  Map<String, dynamic>? _trickplayPayload(
    dynamic item,
    PlaybackManager manager,
  ) {
    final UserPreferences prefs;
    try {
      prefs = GetIt.instance<UserPreferences>();
    } catch (_) {
      return null;
    }
    if (prefs.get(UserPreferences.trickPlayMode) == TrickplayMode.disabled) {
      return null;
    }
    final itemId = _itemIdForQueueItem(item);
    final client = _clientForQueueItem(item);
    if (itemId == null || itemId.isEmpty || client == null) {
      return null;
    }
    final mediaSourceId = manager.currentResolution?.mediaSourceId;
    final key = '$itemId|${mediaSourceId ?? ''}';
    final info = key == _trickplayKey ? _trickplayInfo : null;
    if (info == null || !info.isValid) return null;

    final List<String> urls;
    final List<int> timestampsMs;
    if (info.usesIndividualFrames) {
      urls = info.frames
          .map(
            (frame) => client.trickplayApi!.getFrameImageUrl(
              itemId,
              width: info.width,
              positionTicks: frame.positionTicks,
              imageTag: frame.imageTag,
              mediaSourceId: mediaSourceId,
            ),
          )
          .toList(growable: false);
      timestampsMs = info.frames
          .map((frame) => frame.positionTicks ~/ 10000)
          .toList(growable: false);
    } else {
      final raw = _rawDataForQueueItem(item);
      final runtimeTicks = raw?['RunTimeTicks'] as int?;
      final durationMs = runtimeTicks != null ? runtimeTicks ~/ 10000 : 0;
      final msPerImage = info.interval * info.tilesPerImage;
      var imageCount = durationMs > 0
          ? (durationMs / msPerImage).ceil() + 1
          : 16;
      imageCount = imageCount.clamp(1, 128);
      urls = List<String>.generate(
        imageCount,
        (i) => client.imageApi.getTrickplayTileImageUrl(
          itemId,
          width: info.width,
          index: i,
          mediaSourceId: mediaSourceId,
        ),
      );
      timestampsMs = const [];
    }
    return {
      'urls': urls,
      if (timestampsMs.isNotEmpty) 'timestampsMs': timestampsMs,
      'headers': trickplayImageHeaders(client, withUserAgent: false),
      'width': info.width,
      'height': info.height,
      'cols': info.tileWidth,
      'rows': info.tileHeight,
      'intervalMs': info.interval,
      'mode': prefs.get(UserPreferences.trickPlayMode).name,
      'scalePercent': prefs.get(UserPreferences.trickPlayPreviewScalePercent),
      'verticalPositionPercent': prefs.get(
        UserPreferences.trickPlayVerticalPositionPercent,
      ),
      'followScrub': prefs.get(UserPreferences.trickPlayFollowScrubPosition),
      'pauseWhileScrubbing': prefs.get(
        UserPreferences.trickPlayPauseWhileScrubbing,
      ),
    };
  }

  // The native player reads these once per metadata push, so a change made
  // while a video is playing has to be sent over again.
  String _trickplayPrefsSnapshot(UserPreferences prefs) => [
    prefs.get(UserPreferences.trickPlayMode).name,
    prefs.get(UserPreferences.trickPlayPreviewScalePercent),
    prefs.get(UserPreferences.trickPlayVerticalPositionPercent),
    prefs.get(UserPreferences.trickPlayFollowScrubPosition),
    prefs.get(UserPreferences.trickPlayPauseWhileScrubbing),
  ].join('|');

  String _timeSlotsSnapshot(UserPreferences prefs) =>
      _timeSlotArgs(prefs).values.join('|');

  void _onPrefsChanged() {
    final prefs = _prefsListened;
    if (prefs == null) return;
    _configureCinemaSkip();
    _syncCinemaSkipButton();
    final previousSubtitleAppearance = _lastSubtitleStyle;
    _pushSubtitleStyle();
    final slots = _timeSlotsSnapshot(prefs);
    if (slots != _lastTimeSlots) {
      _lastTimeSlots = slots;
      _pushTimeSlots();
    }
    final next = _trickplayPrefsSnapshot(prefs);
    if (next == _lastTrickplayPrefs &&
        previousSubtitleAppearance == _lastSubtitleStyle) {
      return;
    }
    _lastTrickplayPrefs = next;
    _pushMetadata();
  }

  List<Map<String, dynamic>> _mapPeople(
    List<Map<String, dynamic>> people,
    ImageApi imageApi,
  ) {
    return people
        .map((person) {
          final name = (person['Name'] as String?)?.trim() ?? '';
          if (name.isEmpty) return null;
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
              maxHeight: 300,
              tag: imageTag,
            );
          }
          return <String, dynamic>{
            'name': name,
            'subtitle': subtitle,
            'imageUrl': imageUrl,
            'personId': personId,
          };
        })
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);
  }

  bool _hasCastCrew(dynamic item) {
    if (item is! AggregatedItem) return false;
    if (item.people.isNotEmpty) return true;
    return item.type == 'Episode' &&
        ((item.seriesId != null && item.seriesId!.isNotEmpty) ||
            (item.seasonId != null && item.seasonId!.isNotEmpty));
  }

  bool _canFavorite(dynamic item) {
    if (item is! AggregatedItem) return false;
    final id = _itemIdForQueueItem(item);
    return id != null && id.isNotEmpty;
  }

  bool _queueItemIsFavorite(dynamic item) {
    if (item is AggregatedItem) return item.isFavorite;
    final userData = _rawDataForQueueItem(item)?['UserData'];
    if (userData is Map) return userData['IsFavorite'] as bool? ?? false;
    return false;
  }

  bool _canDownloadSubtitles(dynamic item) {
    if (item is! AggregatedItem) return false;
    final client = _clientForQueueItem(item);
    if (client == null) return false;
    bool canManage = false;
    try {
      canManage =
          GetIt.instance<UserRepository>().currentUser?.canManageSubtitles ??
          false;
    } catch (_) {
      return false;
    }
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
    return client.serverType == ServerType.jellyfin &&
        canManage &&
        item.mediaSources.isNotEmpty &&
        item.type != 'Photo' &&
        item.type != 'Book' &&
        !isAudio;
  }

  Future<void> _sendSubtitleCues(
    PlaybackManager manager, {
    required bool secondary,
  }) async {
    final item = manager.queueService.currentItem;
    final cues = await SubtitleCueLoader.load(
      manager,
      secondary
          ? manager.secondarySubtitleStreamIndex
          : manager.subtitleStreamIndex,
      client: item is AggregatedItem ? _clientForQueueItem(item) : null,
      itemId: item is AggregatedItem ? item.id : null,
    );
    if (!mounted) return;
    await _backend?.showSubtitleCues(cues ?? const [], secondary: secondary);
  }

  void _searchRemoteSubtitles() {
    final manager = _manager;
    final backend = _backend;
    if (manager == null || backend == null) return;
    final item = manager.queueService.currentItem;
    if (item is! AggregatedItem) {
      backend.showRemoteSubtitles(const []);
      return;
    }
    final client = _clientForQueueItem(item);
    if (client == null) {
      backend.showRemoteSubtitles(const []);
      return;
    }
    final allStreams =
        manager.currentResolution?.mediaStreams ??
        const <Map<String, dynamic>>[];
    final subtitleStreams = allStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();
    final audioStreams = allStreams.where((s) => s['Type'] == 'Audio').toList();
    final languages = remoteSubtitleLanguages(subtitleStreams, audioStreams);
    final l10n = AppLocalizations.of(context);
    () async {
      // The search alert is raised from here rather than from Swift so that a
      // refused or failed search can end on the reason. Left to itself the
      // native side could only fall through to "No Subtitles Found", which told
      // the viewer the film had none when the truth was a rejected request.
      await backend.showSubtitleProgress(l10n.searchingSubtitles);

      List<Map<String, dynamic>> results;
      try {
        results = await searchRemoteSubtitlesIn(
          client.itemsApi,
          item.id,
          languages,
        );
      } catch (error) {
        await backend.hideSubtitleProgress(
          message: remoteSubtitleErrorMessage(
            error,
            l10n,
            action: l10n.search,
          ),
        );
        return;
      }

      if (!mounted) {
        await backend.hideSubtitleProgress();
        return;
      }

      final mapped = results
          .map((s) {
            final id = (s['Id']?.toString()) ?? '';
            final label =
                (s['Name'] as String?) ??
                (s['Author'] as String?) ??
                l10n.subtitles;
            return {
              'id': id,
              'label': label,
              'subtitle': remoteSubtitleSummary(s, l10n),
            };
          })
          .where((m) => (m['id']?.toString() ?? '').isNotEmpty)
          .toList();

      // The results sheet takes the progress alert down itself and waits for
      // the dismissal before presenting. Hiding it here instead leaves the
      // sheet presenting over an alert still animating out, which tvOS drops.
      backend.showRemoteSubtitles(mapped);
    }();
  }

  void _downloadSubtitle(String subtitleId) {
    final manager = _manager;
    if (manager == null || subtitleId.isEmpty) return;
    final item = manager.queueService.currentItem;
    if (item is! AggregatedItem) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final existingIndexes =
        (manager.currentResolution?.mediaStreams ??
                const <Map<String, dynamic>>[])
            .where((s) => s['Type'] == 'Subtitle')
            .map((s) => s['Index'] as int?)
            .whereType<int>()
            .toSet();
    final backend = _backend;
    final l10n = AppLocalizations.of(context);
    () async {
      // The wait after the press is the server queueing a metadata refresh, so
      // it can run to twenty seconds. Every ending says something: swallowing
      // them left the viewer staring at a player that had gone back to normal
      // with no idea whether the subtitle was coming.
      await backend?.showSubtitleProgress(l10n.downloadingSubtitle);
      String? outcome;
      try {
        await client.itemsApi.downloadRemoteSubtitle(item.id, subtitleId);
        final newStream = await _refreshAndFindSubtitle(
          item,
          client,
          existingIndexes,
        );
        final index = newStream?['Index'] as int?;
        if (index != null) {
          await manager.changeSubtitleTrack(index, refreshStreams: true);
        } else {
          outcome = l10n.subtitleDownloadedPending;
        }
      } catch (error) {
        outcome = remoteSubtitleErrorMessage(
          error,
          l10n,
          action: l10n.download,
        );
      } finally {
        await backend?.hideSubtitleProgress(message: outcome);
        if (mounted) _pushMetadata();
      }
    }();
  }

  Future<Map<String, dynamic>?> _refreshAndFindSubtitle(
    AggregatedItem item,
    MediaServerClient client,
    Set<int> existingIndexes,
  ) {
    return awaitNewSubtitleStream(
      client: client,
      item: item,
      existingIndexes: existingIndexes,
      keepGoing: () => mounted,
    );
  }

  void _toggleFavorite(dynamic item) {
    final itemId = _itemIdForQueueItem(item);
    if (itemId == null || itemId.isEmpty) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final wasFavorite = _queueItemIsFavorite(item);
    () async {
      try {
        await ItemMutationRepository(
          client,
        ).setFavorite(itemId, isFavorite: !wasFavorite);
        final raw = _rawDataForQueueItem(item);
        if (raw != null) {
          final existing = raw['UserData'];
          final userData = existing is Map<String, dynamic>
              ? existing
              : (existing is Map
                    ? existing.cast<String, dynamic>()
                    : <String, dynamic>{});
          userData['IsFavorite'] = !wasFavorite;
          raw['UserData'] = userData;
        }
      } catch (_) {
      } finally {
        if (mounted) _pushMetadata();
      }
    }();
  }

  List<Map<String, dynamic>> _castPeople(
    dynamic item, {
    bool resolveCast = true,
  }) {
    final imageApi = _clientForQueueItem(item)?.imageApi;
    if (imageApi == null) return const [];
    final itemId = _itemIdForQueueItem(item);
    if (itemId != null && _castCache.containsKey(itemId)) {
      return _castCache[itemId]!;
    }
    if (resolveCast && item is AggregatedItem && item.type == 'Episode') {
      _resolveCastAsync(item);
    }
    final raw = _rawDataForQueueItem(item);
    final people = (raw?['People'] as List?)?.cast<Map<String, dynamic>>();
    if (people == null || people.isEmpty) return const [];
    return _mapPeople(people, imageApi);
  }

  void _resolveCastAsync(dynamic item) {
    if (item is! AggregatedItem) return;
    final itemId = item.id;
    if (_castCache.containsKey(itemId) || _castResolving == itemId) {
      return;
    }
    if (item.type != 'Episode' ||
        ((item.seriesId == null || item.seriesId!.isEmpty) &&
            (item.seasonId == null || item.seasonId!.isEmpty))) {
      return;
    }
    final client = _clientForQueueItem(item);
    if (client == null) return;
    _castResolving = itemId;
    () async {
      try {
        final parentActors = await resolveParentCast(
          client: client,
          seasonId: item.seasonId,
          seriesId: item.seriesId,
        );
        final merged = mergeEpisodePeople(
          episodePeople: item.people,
          parentActors: parentActors,
        );
        if (merged.isNotEmpty || item.people.isNotEmpty) {
          _castCache[itemId] = _mapPeople(merged, client.imageApi);
        }
      } catch (_) {
        // Leave uncached on error so a subsequent playback event can retry
      } finally {
        _castResolving = null;
        if (mounted) _pushMetadata(skipCastResolutionForId: itemId);
      }
    }();
  }

  List<Map<String, dynamic>> _currentChapters() => chaptersForItem(
    _manager?.queueService.currentItem,
    _manager?.currentOfflineMetadata,
    mediaSourceId: _manager?.currentResolution?.mediaSourceId,
  );

  /// [chapters] with each one's frame for the native chapter row, or an
  /// empty url where the server has none.
  List<Map<String, dynamic>> _withChapterImages(
    dynamic item,
    List<Map<String, dynamic>> chapters,
  ) {
    final imageApi = _clientForQueueItem(item)?.imageApi;
    if (item is! AggregatedItem || imageApi == null) return chapters;
    final raw = itemChaptersForSource(
      item,
      _manager?.currentResolution?.mediaSourceId,
    );
    return [
      for (var i = 0; i < chapters.length; i++)
        {
          ...chapters[i],
          'imageUrl': switch (i < raw.length ? raw[i]['ImageTag'] : null) {
            final String tag when tag.isNotEmpty => imageApi
                .getChapterImageUrl(item.id, index: i, maxWidth: 480, tag: tag),
            _ => '',
          },
        },
    ];
  }

  /// Hands the current item's chapter starts to the manager, which steps
  /// previous and next through them before it steps through the queue. Runs
  /// per item, so one with none clears the last.
  void _applyChapters() {
    _manager?.setChapterStarts([
      for (final ms in chapterStartsMs(_currentChapters()))
        Duration(milliseconds: ms),
    ]);
  }

  /// Fills in chapters the current item arrived without. A row query leaves
  /// Chapters off, so playing from a library grid would otherwise lose the
  /// chapter button, its menu and the marks.
  Future<void> _ensureChaptersForCurrentItem() async {
    final item = _manager?.queueService.currentItem;
    if (item is! AggregatedItem) return;
    if (item.chapters.isNotEmpty) return;
    // A title with none would otherwise be asked for every time the queue
    // comes back to it, so each item is tried once.
    if (!_chaptersFetchedItemIds.add(item.id)) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final fetched = await fetchChapters(client, item.id);
    if (fetched.isEmpty) return;
    item.rawData['Chapters'] = fetched;
    _applyChapters();
    _pushMetadata();
  }

  /// Recreates the per-item segment service the prompt controller reads, the
  /// same way the Flutter player reloads segments on every episode change.
  void _loadSegmentsForCurrentItem() {
    final manager = _manager;
    if (manager == null) return;
    final item = manager.queueService.currentItem;
    _applyChapters();
    unawaited(_ensureChaptersForCurrentItem());
    unawaited(_loadTrickplayForCurrentItem(item, manager));
    final id = _itemIdForQueueItem(item);
    if (id == null || id.isEmpty || id == _segmentsLoadedForItemId) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    try {
      final prefs = GetIt.instance<UserPreferences>();
      final service = MediaSegmentService(
        client,
        client.features,
        prefs,
      );
      _segmentService = service;
      _segmentsLoadedForItemId = id;
      unawaited(
        service.loadSegments(id).then((_) {
          if (!GetIt.instance.isRegistered<LogService>()) return;
          GetIt.instance<LogService>().media(
            'Loaded ${service.segments.length} media segments for $id on '
            '${client.serverType.name}, supported ${service.isSupported}',
            level: LogLevel.info,
          );
        }),
      );
    } catch (_) {}
  }

  Future<void> _loadTrickplayForCurrentItem(
    dynamic item,
    PlaybackManager manager,
  ) async {
    final itemId = _itemIdForQueueItem(item);
    final mediaSourceId = manager.currentResolution?.mediaSourceId;
    final key = itemId == null ? null : '$itemId|${mediaSourceId ?? ''}';
    if (key == _trickplayKey) return;

    final generation = ++_trickplayLoadGeneration;
    _trickplayKey = key;
    _trickplayInfo = null;
    if (itemId == null || itemId.isEmpty) {
      _pushMetadata();
      return;
    }

    final raw = _rawDataForQueueItem(item);
    final client = _clientForQueueItem(item);
    if (raw != null && client != null) {
      await mergeServerTrickplay(client, itemId, raw, mediaSourceId);
    }
    var info = raw == null
        ? null
        : TrickplayInfo.fromItemData(raw, mediaSourceId: mediaSourceId);
    if (info == null && client?.trickplayApi != null) {
      try {
        final thumbnailSet = await client!.trickplayApi!.getThumbnailSet(
          itemId,
          width: _trickplayFrameWidth,
          mediaSourceId: mediaSourceId,
        );
        if (thumbnailSet != null && thumbnailSet.isValid) {
          info = TrickplayInfo.fromThumbnailSet(
            thumbnailSet,
            width: _trickplayFrameWidth,
          );
        }
      } catch (_) {
        // Emby BIF previews are optional. Playback remains usable when the
        // server has not generated them or the request fails.
      }
    }

    if (!mounted || generation != _trickplayLoadGeneration) return;
    final currentItemId = _itemIdForQueueItem(manager.queueService.currentItem);
    final currentSourceId = manager.currentResolution?.mediaSourceId;
    if (currentItemId != itemId || currentSourceId != mediaSourceId) return;
    _trickplayInfo = info?.isValid == true ? info : null;
    _pushMetadata();
  }

  AppleTvQueueSnapshot _queueSnapshot() {
    final manager = _manager;
    if (manager == null) {
      return const AppleTvQueueSnapshot(
        currentIndex: -1,
        length: 0,
        hasNext: false,
      );
    }
    final queue = manager.queueService;
    final current = queue.currentItem;
    final next = queue.peekNext;

    bool nextEligible = true;
    if (next is AggregatedItem) {
      nextEligible = isEligibleNextEpisodeCandidate(next);
    } else if (next is Map) {
      nextEligible = isEligibleNextEpisodeCandidateRaw(
        next.cast<String, dynamic>(),
      );
    }

    String nextTitle = '';
    String nextEpisodeInfo = '';
    String nextImageUrl = '';
    if (next is AggregatedItem) {
      nextTitle = next.name;
      nextEpisodeInfo = next.indexNumber != null
          ? 'S${next.parentIndexNumber ?? '?'}:E${next.indexNumber}'
          : '';
      if (next.primaryImageTag != null) {
        nextImageUrl =
            _clientForQueueItem(next)?.imageApi.getPrimaryImageUrl(
              next.id,
              maxWidth: 400,
              tag: next.primaryImageTag,
            ) ??
            '';
      }
    } else if (next is Map) {
      nextTitle = (next['Name'] as String?) ?? '';
    }

    final currentRaw = _rawDataForQueueItem(current);
    return AppleTvQueueSnapshot(
      currentIndex: queue.currentIndex,
      length: queue.length,
      hasNext: queue.hasNext,
      currentId: _itemIdForQueueItem(current),
      nextId: _itemIdForQueueItem(next),
      nextExists: next != null,
      nextEligible: nextEligible,
      currentIsPreroll: currentRaw?['__moonfinIsPreroll'] == true,
      nextTitle: nextTitle,
      nextEpisodeInfo: nextEpisodeInfo,
      nextImageUrl: nextImageUrl,
    );
  }

  void _markPlayed(String itemId) {
    final item = _manager?.queueService.currentItem;
    try {
      final client = _clientForQueueItem(item);
      if (client == null) return;
      final mutations = ItemMutationRepository(client);
      unawaited(mutations.setPlayed(itemId, isPlayed: true).catchError((_) {}));
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

  Map<String, dynamic>? _pauseMetaPayload(dynamic item) {
    bool enabled = false;
    try {
      enabled = GetIt.instance<UserPreferences>().get(
        UserPreferences.showDescriptionOnPause,
      );
    } catch (_) {}
    if (!enabled) return null;
    final raw = _rawDataForQueueItem(item);
    final overview =
        (raw?['Overview'] as String?)?.trim() ??
        ((raw?['Taglines'] as List?)?.firstOrNull as String?)?.trim() ??
        '';
    if (overview.isEmpty) return null;
    return {'overview': overview, 'imageUrl': _artworkUrlForItem(item)};
  }

  List<Map<String, dynamic>> _trackOptions(
    List<Map<String, dynamic>> streams,
    int? selectedIndex, {
    required bool audio,
  }) {
    final options = <Map<String, dynamic>>[];
    for (final s in streams) {
      final index = (s['Index'] as int?) ?? -1;
      final displayTitle = s['DisplayTitle'] as String?;
      final title = s['Title'] as String?;
      final language = s['Language'] as String?;
      final codec = s['Codec'] as String?;
      final label = displayTitle ?? title ?? language ?? 'Track';
      final String subtitle;
      if (audio) {
        subtitle = [
          if (language != null && displayTitle != null) language,
          if (codec != null) codec.toUpperCase(),
          if (s['Channels'] != null) '${s['Channels']}ch',
        ].join(' · ');
      } else {
        final subtitleType =
            ((codec == null || codec.isEmpty) ? 'Unknown' : codec)
                .toUpperCase();
        final deliveryMethod = (s['DeliveryMethod'] as String?)
            ?.trim()
            .toLowerCase();
        final location = s['IsExternal'] == true
            ? 'External'
            : (deliveryMethod == 'embed' ? 'Embedded' : 'Internal');
        subtitle = '$subtitleType · $location';
      }
      options.add({
        'index': index,
        'label': label,
        'subtitle': subtitle,
        'selected': index == selectedIndex,
      });
    }
    return options;
  }

  void _pushMetadata({String? skipCastResolutionForId}) {
    final manager = _manager;
    final backend = _backend;
    if (manager == null || backend == null) return;

    final item = manager.queueService.currentItem;
    final resolveCast =
        skipCastResolutionForId == null ||
        _itemIdForQueueItem(item) != skipCastResolutionForId;
    final chapters = _currentChapters();

    String topTitle = '';
    String topSubtitle = '';
    if (item is AggregatedItem) {
      final episodeInfo = item.indexNumber != null
          ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
          : null;
      final episodeLine = [
        ?episodeInfo,
        item.name,
      ].where((s) => s.isNotEmpty).join(' - ');
      final series = item.seriesName ?? '';
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = item.name;
        topSubtitle = '';
      }
    } else if (item is Map) {
      final title = (item['Name'] as String?) ?? '';
      final series = (item['SeriesName'] as String?) ?? '';
      final idx = item['IndexNumber'];
      final episodeInfo = idx != null
          ? 'S${item['ParentIndexNumber'] ?? '?'}:E$idx'
          : null;
      final episodeLine = [
        ?episodeInfo,
        title,
      ].where((s) => s.isNotEmpty).join(' - ');
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = title;
        topSubtitle = '';
      }
    } else if (item is String) {
      final meta = manager.currentOfflineMetadata;
      final title = (meta?['Name'] as String?) ?? item.split('/').last;
      final series = (meta?['SeriesName'] as String?) ?? '';
      final idx = meta?['IndexNumber'] as int?;
      final parentIdx = meta?['ParentIndexNumber'] as int?;
      final episodeInfo = idx != null ? 'S${parentIdx ?? '?'}:E$idx' : null;
      final episodeLine = [
        ?episodeInfo,
        title,
      ].where((s) => s.isNotEmpty).join(' - ');
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = title;
        topSubtitle = '';
      }
    }

    final allStreams =
        manager.currentResolution?.mediaStreams ??
        (manager.currentOfflineMetadata?['MediaStreams'] as List?)
            ?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    final audioStreams = allStreams.where((s) => s['Type'] == 'Audio').toList();
    final subtitleStreams = allStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();

    final skipForwardMs = _prefInt(
      UserPreferences.skipForwardLength,
      defaultValue: 30000,
    );
    final skipBackMs = _prefInt(
      UserPreferences.skipBackLength,
      defaultValue: 10000,
    );

    backend.setUiMetadata(
      topTitle: topTitle,
      topSubtitle: topSubtitle,
      chapters: _withChapterImages(item, chapters),
      showChapterMarkers: _prefBool(
        UserPreferences.showChapterMarkers,
        defaultValue: false,
      ),
      hasPrevious: true,
      hasNext: manager.queueService.hasNext,
      skipForwardMs: skipForwardMs,
      skipBackMs: skipBackMs,
      audioTracks: _trackOptions(
        audioStreams,
        manager.audioStreamIndex,
        audio: true,
      ),
      subtitleTracks: _trackOptions(
        subtitleStreams,
        manager.subtitleStreamIndex,
        audio: false,
      ),
      subtitleControls: appleTvSubtitleMetadata(
        manager: manager,
        prefs: GetIt.instance<UserPreferences>(),
        l10n: AppLocalizations.of(context),
        tracks: _trackOptions(
          subtitleStreams,
          manager.secondarySubtitleStreamIndex,
          audio: false,
        ),
        sourceStreams: subtitleStreams,
      ),
      logoUrl: _logoUrlForItem(item),
      streamInfoSections: _streamInfoSections(manager),
      streamInfoTitle: AppLocalizations.of(context).playbackInformation,
      streamInfoDroppedFramesLabel: AppLocalizations.of(
        context,
      ).playbackInfoDroppedFrames,
      trickplay: _trickplayPayload(item, manager),
      hasCast: _hasCastCrew(item),
      castPeople: _castPeople(item, resolveCast: resolveCast),
      pauseMeta: _pauseMetaPayload(item),
      selectedBitrateMbps: manager.maxBitrateOverrideMbps ?? -1,
      canFavorite: _canFavorite(item),
      isFavorite: _queueItemIsFavorite(item),
      canDownloadSubtitles: _canDownloadSubtitles(item),
      syncPlay: _syncPlayPayload(),
      osdButtons: _osdButtons(),
      canBrowseEpisodes: _canBrowseEpisodes(item),
      transportDocked: _transportDocked(),
    );

    if (resolveCast) _resolveCastAsync(item);
  }

  int _prefInt(Preference<int> pref, {required int defaultValue}) {
    try {
      return GetIt.instance<UserPreferences>().get(pref);
    } catch (_) {
      return defaultValue;
    }
  }

  bool _prefBool(Preference<bool> pref, {required bool defaultValue}) {
    try {
      return GetIt.instance<UserPreferences>().get(pref);
    } catch (_) {
      return defaultValue;
    }
  }

  /// Null when the preferences can't be read, which leaves the row as it is
  /// rather than reading an empty list as every button switched off.
  List<String>? _osdButtons() {
    try {
      final ids = visibleOsdButtonIds(GetIt.instance<UserPreferences>());
      // Everyone in a watch party hears the same track.
      return _followingParty
          ? ids.where((id) => id != OsdButton.audio.id).toList()
          : ids;
    } catch (_) {
      return null;
    }
  }

  bool? _transportDocked() {
    try {
      return nativeTransportDocked(GetIt.instance<UserPreferences>());
    } catch (_) {
      return null;
    }
  }

  void _onSyncPlayChanged() {
    if (mounted) _pushMetadata();
  }

  bool _canBrowseEpisodes(dynamic item) => canBrowseEpisodes(
    item,
    offline: _manager?.isOfflinePlayback ?? false,
    inSyncPlay: _syncPlay?.state.enabled == true || _followingParty,
  );

  void _openEpisodeBrowser() {
    final item = _manager?.queueService.currentItem;
    if (item is! AggregatedItem || !_canBrowseEpisodes(item)) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final existing = _episodeBrowser;
    final browser = existing != null && existing.isFor(item)
        ? existing
        : (EpisodeBrowserController(client: client, playing: item)
            ..addListener(_onEpisodeBrowserChanged));
    if (!identical(browser, existing)) {
      existing?.dispose();
      _episodeBrowser = browser;
    }
    browser.open(item);
    _episodeBrowserShown = true;
    unawaited(
      _backend?.showEpisodeBrowser(_episodeBrowserContent(browser)) ??
          Future<void>.value(),
    );
  }

  void _onEpisodeBrowserChanged() {
    final browser = _episodeBrowser;
    if (!_episodeBrowserShown || browser == null || !mounted) return;
    unawaited(
      _backend?.updateEpisodeBrowser(_episodeBrowserContent(browser)) ??
          Future<void>.value(),
    );
  }

  void _closeEpisodeBrowser({bool hideNative = false}) {
    if (!_episodeBrowserShown) return;
    _episodeBrowserShown = false;
    _episodeBrowser?.close();
    if (hideNative) {
      unawaited(_backend?.hideEpisodeBrowser() ?? Future<void>.value());
    }
  }

  Future<void> _playFromEpisodeBrowser(String episodeId) async {
    final browser = _episodeBrowser;
    final manager = _manager;
    _closeEpisodeBrowser();
    if (browser == null || manager == null) return;
    final episode = browser.episodes
        ?.where((candidate) => candidate.id == episodeId)
        .firstOrNull;
    if (episode == null) return;
    // The pick was made on the native panel, which the prompts never hear
    // about, so it counts as the viewer being here now.
    if (await browser.play(manager, episode)) {
      _prompts?.consecutiveEpisodes = 0;
    }
  }

  /// The native panel does no fetching and no formatting, so every label is
  /// built here where the localizations are.
  Map<String, dynamic> _episodeBrowserContent(
    EpisodeBrowserController browser,
  ) {
    final l10n = AppLocalizations.of(context);
    final imageApi = browser.client.imageApi;
    final playing = browser.playing;
    final episodes = browser.episodes;
    bool hideOverview;
    try {
      hideOverview = GetIt.instance<UserPreferences>()
          .effectiveHideDetailsMediaDescription;
    } catch (_) {
      hideOverview = false;
    }
    final String message;
    if (browser.failed) {
      message = l10n.errorLoadingEpisodes;
    } else if (episodes != null && episodes.isEmpty) {
      message = l10n.noEpisodesLoaded;
    } else {
      message = '';
    }
    return {
      'title': playing.seriesName ?? '',
      'logoUrl': _logoUrlForItem(playing),
      'seasons': [
        for (final season in browser.seasons ?? const <AggregatedItem>[])
          {
            'id': season.id,
            'name': episodeBrowserSeasonLabel(l10n, season),
            'selected': season.id == browser.selectedSeasonId,
          },
      ],
      'episodes': [
        for (final episode in episodes ?? const <AggregatedItem>[])
          {
            'id': episode.id,
            'line': episodeBrowserLine(l10n, episode),
            'title': episode.name,
            'overview': hidesMediaDescription(
                  itemType: episode.type,
                  hideMediaDescription: hideOverview,
                )
                ? ''
                : (episode.overview ?? ''),
            'imageUrl': episodeStillUrl(imageApi, episode, maxWidth: 480) ?? '',
            'progress': episodeProgress(episode),
            'played': episode.isPlayed,
            'playing': episode.id == playing.id,
          },
      ],
      'loading': episodes == null && !browser.failed,
      'message': message,
    };
  }

  Map<String, dynamic>? _syncPlayPayload() {
    final sync = _syncPlay;
    if (sync == null || !sync.state.enabled) return null;
    return {
      'groupName': sync.state.groupName ?? 'SyncPlay',
      'participants': sync.state.participants,
      'ignoreWait': sync.ignoreWaitEnabled,
    };
  }

  /// The room the player follows, with every label the party UI shows, or
  /// null outside a party.
  Map<String, dynamic>? _watchPartyPayload() {
    final party = _party;
    final room = party?.room;
    if (party == null || room == null || !party.controlsPlayback) return null;
    final l10n = AppLocalizations.of(context);
    final moonbase = party.isMoonbase;
    final connected = room.members.where((m) => m.connected).toList();
    final host = room.members.where((m) => m.isHost).firstOrNull;
    final next = connected.where((m) => !m.isSelf).firstOrNull;
    String initial(String name) =>
        name.isEmpty ? '?' : name.characters.first.toUpperCase();
    Map<String, dynamic> member(SiloRoomMember m) {
      final status = m.connected ? m.status : 'not_watching';
      return {
        'name': [
          m.isSelf ? l10n.syncPlayParticipantYou : m.displayName,
          if (m.isHost) l10n.watchPartyHost,
        ].join(' · '),
        'initial': initial(m.displayName),
        'status': watchPartyStatusLabel(l10n, status) ?? '',
        'statusColor': watchPartyStatusColor(status).toARGB32(),
      };
    }

    final countdownTo = moonbase ? party.countdownTo : null;
    final waitingSince = moonbase && countdownTo == null
        ? party.waitingSince
        : null;
    final waitingOn = connected.where((m) => m.status != 'ready').toList();
    return {
      'title': host == null
          ? l10n.watchParty
          : l10n.watchPartyHostsParty(host.displayName),
      'subtitle': l10n.watchPartyWatchingCount(connected.length),
      'chat': moonbase && room.chatEnabled,
      'reactions': moonbase && room.reactionsEnabled,
      'members': [for (final m in room.members) member(m)],
      if (waitingSince != null) ...{
        'waitingTitle': waitingOn.length == 1
            ? l10n.watchPartyWaitingFor(waitingOn.single.displayName)
            : l10n.watchPartyWaitingForCount(waitingOn.length),
        'waitingDetail': l10n.watchPartyStartingAnyway(
          math.max(0, 10 - DateTime.now().difference(waitingSince).inSeconds),
        ),
        'waitingFaces': [
          for (final m in connected)
            {'initial': initial(m.displayName), 'ready': m.status == 'ready'},
        ],
      },
      'countdownTo': ?countdownTo?.millisecondsSinceEpoch,
      'leaveLabel': room.isHost && next != null
          ? l10n.watchPartyLeaveHandsOver(next.displayName)
          : l10n.watchPartyLeave,
      if (room.isHost) 'endLabel': l10n.watchPartyEnd,
      'strings': {
        'button': l10n.watchParty,
        'type': l10n.watchPartyType,
        'backToClose': l10n.watchPartyBackToClose,
        'chatTitle': l10n.watchPartyChat,
        'sendToParty': l10n.watchPartySendToParty,
        'send': l10n.send,
        'cancel': l10n.cancel,
        'startingTogether': l10n.watchPartyStartingTogether,
      },
      'replies': [
        l10n.watchPartyReplyHaha,
        l10n.watchPartyReplyNoWay,
        l10n.watchPartyReplyPausePlease,
        l10n.watchPartyReplyBrb,
        l10n.watchPartyReplyAgain,
      ],
      'reactionNames': {
        for (final kind in WatchPartyReaction.kinds)
          kind: watchPartyReactionName(l10n, kind),
      },
    };
  }

  /// Sends the room when it changed, ticking each second through the wait
  /// for everyone's player so its countdown line stays current.
  void _pushParty() {
    final backend = _backend;
    if (backend == null || !mounted) return;
    final payload = _watchPartyPayload();
    if (payload?['waitingTitle'] != null) {
      _partyWaitTicker ??= Timer.periodic(
        const Duration(seconds: 1),
        (_) => _pushParty(),
      );
    } else {
      _partyWaitTicker?.cancel();
      _partyWaitTicker = null;
    }
    final key = jsonEncode(payload);
    if (key == _lastPartyPayload) return;
    _lastPartyPayload = key;
    unawaited(backend.setWatchParty(payload));
    if (payload != null && !_partyGlyphsSent) {
      _partyGlyphsSent = true;
      unawaited(_sendPartyGlyphs());
    }
  }

  Future<void> _sendPartyGlyphs() async {
    final glyphs = <String, Uint8List>{};
    for (final kind in WatchPartyReaction.kinds) {
      final png = await watchPartyReactionPng(kind, 128);
      if (png != null) glyphs[kind] = png;
    }
    _sendPartyEvent({'type': 'glyphs', 'glyphs': glyphs});
  }

  void _sendPartyEvent(Map<String, dynamic> event) {
    if (!mounted || _party?.isMoonbase != true) return;
    unawaited(_backend?.showWatchPartyEvent(event) ?? Future<void>.value());
  }

  void _onPartyToast(WatchPartyToast toast) {
    if (!mounted) return;
    _sendPartyEvent({
      'type': 'toast',
      'text': watchPartyToastText(
        AppLocalizations.of(context),
        toast,
        _party?.room,
      ),
      'icon': toast.kind.name,
    });
  }

  void _sendNewPartyChat(SiloWatchPartyManager party) {
    final room = party.room;
    final fresh = party.chat.where(_partyChatSeen.add).toList();
    if (fresh.isEmpty || room == null || !room.chatEnabled) return;
    if (!GetIt.instance<UserPreferences>().get(
      UserPreferences.watchPartyChatOverlay,
    )) {
      return;
    }
    final l10n = AppLocalizations.of(context);
    for (final entry in fresh) {
      final notice = entry.notice;
      _sendPartyEvent({
        'type': 'chat',
        'name': notice == null ? entry.name : '',
        'text': notice == null
            ? entry.text
            : watchPartyToastText(l10n, notice, room),
      });
    }
  }

  /// A party that stops playing (the host went back to the lobby, the item
  /// finished, the party ended) takes its members back to the room.
  void _onPartyChanged() {
    final party = _party;
    if (party == null || !mounted) return;
    _sendNewPartyChat(party);
    _pushParty();
    if (party.controlsPlayback == _followingParty) return;
    _followingParty = party.controlsPlayback;
    _pushMetadata();
    if (_followingParty) return;
    final navigator = Navigator.of(context, rootNavigator: true);
    _handleExit();
    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 600), () {
        if (party.roomScreensOpen > 0 || !navigator.mounted) return;
        unawaited(
          navigator.push(
            MaterialPageRoute<void>(
              builder: (_) => const SiloWatchPartyScreen(),
            ),
          ),
        );
      }),
    );
  }

  void _onQueueChanged() {
    _closeEpisodeBrowser(hideNative: true);
    _prompts?.onQueueChanged();
    _syncCinemaSkip();
    _loadSegmentsForCurrentItem();
    _pushMetadata();
  }

  void _handleUiAction(Map<String, dynamic> action) {
    final manager = _manager;
    if (manager == null) return;
    final subtitleAction = handleAppleTvSubtitleAction(
      action,
      manager,
      GetIt.instance<UserPreferences>(),
    );
    if (subtitleAction != null) {
      unawaited(subtitleAction.then((_) {
        if (mounted) _pushMetadata();
      }));
      return;
    }
    switch (action['event']?.toString()) {
      case 'play':
        unawaited(manager.resume());
      case 'pause':
        unawaited(manager.pause());
      case 'seek':
        // System Forward Skip skips the pre-roll. Regular seeks and Backward
        // Skip work as usual.
        if (action['isForwardSkip'] == true &&
            _isCinemaPreroll &&
            _cinemaSkip.enabled) {
          _cinemaSkip.skip(requireVisible: false);
          return;
        }
        final positionMs = (action['positionMs'] as num?)?.toInt();
        if (positionMs != null) {
          unawaited(manager.seekTo(Duration(milliseconds: positionMs)));
          _prompts?.onUserSeeked();
        }
      case 'userSeeked':
        // The native player has already seeked itself; the manager is told
        // so that whatever coordinates playback (SyncPlay's group seek) hears
        // about it without the player being moved a second time.
        final seekedToMs = (action['positionMs'] as num?)?.toInt();
        if (seekedToMs != null) {
          unawaited(
            manager.notifyExternalSeek(Duration(milliseconds: seekedToMs)),
          );
        }
        _prompts?.onUserSeeked();
      case 'nextUpPlay':
        unawaited(_prompts?.handleNextUpPlay() ?? Future<void>.value());
      case 'nextUpCancel':
        _prompts?.handleNextUpCancel();
      case 'nextUpDismiss':
        _prompts?.handleNextUpDismiss();
      case 'cinemaSkipAction':
        if (!_isCinemaPreroll ||
            !_cinemaSkip.enabled ||
            action['generation'] != _cinemaSkip.generation) {
          return;
        }
        switch (action['action']) {
          case 'hide':
            _cinemaSkip.hide();
          case 'reveal':
            _cinemaSkip.reveal();
          case 'activate':
            if (_cinemaSkip.eligible) {
              _cinemaSkip.activate();
            } else {
              unawaited(
                manager.state.isPlaying ? manager.pause() : manager.resume(),
              );
            }
        }
        return;
      case 'skipSegment':
        // Ignore regular Skip Segment events during Cinema Mode trailers.
        if (!_isCinemaPreroll || !_cinemaSkip.enabled) {
          _prompts?.handleSkipSegment();
        }
      case 'next':
        unawaited(manager.next());
      case 'previous':
        unawaited(manager.previous());
      case 'selectAudio':
        final index = (action['index'] as num?)?.toInt();
        if (index != null) {
          unawaited(manager.changeAudioTrack(index));
        }
      case 'selectSubtitle':
        final index = (action['index'] as num?)?.toInt();
        if (index == null) break;
        if (index < 0) {
          unawaited(manager.disableSubtitles());
        } else {
          unawaited(manager.changeSubtitleTrack(index));
        }
      case 'setSpeed':
        final speed = (action['speed'] as num?)?.toDouble();
        if (speed != null && speed > 0) {
          unawaited(_backend?.setPlaybackSpeed(speed) ?? Future<void>.value());
        }
      case 'setBitrate':
        final mbps = (action['mbps'] as num?)?.toInt();
        unawaited(
          manager.changeBitrate(mbps == null || mbps < 0 ? null : mbps),
        );
      case 'openCastPerson':
        final personId = action['personId']?.toString();
        if (personId != null && personId.isNotEmpty) {
          final current = manager.queueService.currentItem;
          final serverId = current is AggregatedItem ? current.serverId : null;
          // The native player is presented over Flutter, so exit it before
          // pushing the person route or the detail would stay hidden behind it.
          _handleExit();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            appRouter.push(Destinations.item(personId, serverId: serverId));
          });
        }
        return;
      case 'toggleFavorite':
        _toggleFavorite(manager.queueService.currentItem);
      case 'stillWatchingContinue':
        _prompts?.resolveStillWatching(shouldContinue: true);
      case 'stillWatchingStop':
        _prompts?.resolveStillWatching(shouldContinue: false);
      case 'searchSubtitles':
        _searchRemoteSubtitles();
      case 'loadSubtitleCues':
        unawaited(
          _sendSubtitleCues(manager, secondary: action['secondary'] == true),
        );
      case 'downloadSubtitle':
        final id = action['id']?.toString();
        if (id != null && id.isNotEmpty) _downloadSubtitle(id);
      case 'partyReaction':
        final kind = action['kind']?.toString();
        if (kind != null) _party?.sendReaction(kind);
        return;
      case 'partyChat':
        final text = action['text']?.toString().trim() ?? '';
        if (text.isNotEmpty) _party?.sendChat(text);
        return;
      case 'partyLeave':
        _party?.leave();
        return;
      case 'partyEnd':
        unawaited(_party?.end() ?? Future<void>.value());
        return;
      case 'syncplayLeave':
        unawaited(_syncPlay?.leaveGroup() ?? Future<void>.value());
      case 'syncplayIgnoreWait':
        final value = action['value'] == true;
        unawaited(
          _syncPlay?.requestSetIgnoreWait(value) ?? Future<void>.value(),
        );
      case 'openEpisodes':
        _openEpisodeBrowser();
      case 'selectEpisodesSeason':
        final seasonId = action['seasonId']?.toString();
        if (seasonId != null && seasonId.isNotEmpty) {
          _episodeBrowser?.selectSeason(seasonId);
        }
      case 'selectEpisode':
        final episodeId = action['episodeId']?.toString();
        if (episodeId != null && episodeId.isNotEmpty) {
          unawaited(_playFromEpisodeBrowser(episodeId));
        }
      case 'episodesClosed':
        _closeEpisodeBrowser();
    }
    Future<void>.delayed(const Duration(milliseconds: 300), _pushMetadata);
  }

  void _handleExit({bool finished = false}) {
    if (_exiting || !mounted) return;
    _exiting = true;
    _exitFinished = finished;
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    if (context.canPop()) {
      context.pop();
    }
  }

  @override
  void dispose() {
    _cinemaSkip.removeListener(_syncCinemaSkipButton);
    _cinemaSkip.dispose();
    _trickplayLoadGeneration++;
    _exitSub?.cancel();
    _queueSub?.cancel();
    _sessionEndedSub?.cancel();
    _bringupSub?.cancel();
    _reconnectingSub?.cancel();
    _actionSub?.cancel();
    _screensaverPlayingSub?.cancel();
    _positionSub?.cancel();
    _prompts?.dispose();
    _episodeBrowser?.dispose();
    _screensaverController?.setPlaybackActive(false);
    _screensaverController?.setNativePlayerPresented(false);
    _syncPlay?.removeListener(_onSyncPlayChanged);
    _party?.removeListener(_onPartyChanged);
    _partyToastSub?.cancel();
    _partyReactionSub?.cancel();
    _partyWaitTicker?.cancel();
    _themeController?.removeListener(_onThemeChanged);
    _prefsListened?.removeListener(_onPrefsChanged);
    if (PlatformDetection.isIOS) {
      unawaited(SystemChrome.setPreferredOrientations([]));
    }
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    try {
      final manager = GetIt.instance<PlaybackManager>();
      if (!manager.playbackDeferredToExternalPlayer) {
        if (_exitFinished) {
          manager.stopAsFinished();
        } else {
          manager.stop(userInitiated: true);
        }
      }
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: Colors.black),
          if (_bringupState.phase.isInProgress)
            const Center(
              child: CupertinoActivityIndicator(
                radius: 20,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}

/// Bridges the prompt controller's requested effects onto the native channel,
/// the playback manager, and the host's exit flow.
class _HostPromptCommands implements AppleTvPromptCommands {
  _HostPromptCommands(this._host);

  final _AppleTvPlayerHostScreenState _host;

  @override
  Future<void> showNextUp({
    required String title,
    required String episodeInfo,
    required String imageUrl,
    required bool isMinimal,
    required String countdownStyle,
    required int timeoutMs,
  }) {
    return _host._backend?.showNextUp(
          title: title,
          episodeInfo: episodeInfo,
          imageUrl: imageUrl,
          isMinimal: isMinimal,
          countdownStyle: countdownStyle,
          timeoutMs: timeoutMs,
        ) ??
        Future<void>.value();
  }

  @override
  Future<void> hideNextUp() =>
      _host._backend?.hideNextUp() ?? Future<void>.value();

  @override
  Future<bool> showStillWatching() async {
    final presented = await (_host._backend?.showStillWatching() ??
        Future<bool>.value(false));
    if (!presented && GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().media(
        "Still Watching prompt couldn't present, continuing playback",
        level: LogLevel.warning,
      );
    }
    return presented;
  }

  @override
  Future<void> showSkipSegment(
    String segmentDisplayName, {
    required String countdownStyle,
    required int segmentStartMs,
    required int segmentEndMs,
  }) {
    var label = 'Skip $segmentDisplayName';
    if (_host.mounted) {
      label = AppLocalizations.of(_host.context).skipSegment(
        segmentDisplayName,
      );
    }
    return _host._backend?.showSkipSegment(
          label,
          countdownStyle: countdownStyle,
          segmentStartMs: segmentStartMs,
          segmentEndMs: segmentEndMs,
        ) ??
        Future<void>.value();
  }

  @override
  Future<void> hideSkipSegment() =>
      _host._backend?.hideSkipSegment() ?? Future<void>.value();

  @override
  Future<void> seekTo(Duration position) =>
      _host._manager?.seekTo(position) ?? Future<void>.value();

  @override
  void pause() => unawaited(_host._manager?.pause() ?? Future<void>.value());

  @override
  void resume() => unawaited(_host._manager?.resume() ?? Future<void>.value());

  @override
  // The next item, not the next chapter, even when the card came up during
  // one.
  Future<void> advanceNext() =>
      _host._manager?.nextInQueue() ?? Future<void>.value();

  @override
  Future<void> exitPlayback({bool finished = false}) async =>
      _host._handleExit(finished: finished);

  @override
  void setSuppressAutoNext(bool value) {
    _host._manager?.suppressAutoNext = value;
  }

  @override
  void markPlayed(String itemId) => _host._markPlayed(itemId);
}
