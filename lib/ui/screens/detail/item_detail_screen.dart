import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/repositories/mdblist_repository.dart';
import '../../../data/repositories/tmdb_repository.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/download_service.dart';
import '../../../data/models/download_quality.dart';
import '../../../data/database/offline_database.dart';
import '../../../data/models/lyrics.dart';
import '../../../data/repositories/offline_repository.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/book_reader_service.dart';
import '../../../data/services/theme_music_service.dart';
import '../../../data/viewmodels/item_detail_view_model.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../navigation/route_lifecycle_observer.dart';
import 'modern/modern_detail_content.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/add_to_playlist_dialog.dart';
import '../../widgets/logo_view.dart';
import '../../widgets/media_card.dart';
import '../../widgets/change_artwork_dialog.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/horizontal_scroll_section.dart';
import '../../widgets/rating_display.dart';
import '../../widgets/track_action_dialog.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../widgets/remote_play_to_session_dialog.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/seerr_icons.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/playback/player_loading_overlay.dart';
import '../../../playback/offline_playback_launcher.dart';
import '../../../playback/hdr_stream_capability.dart';
import '../../../playback/known_defects.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../util/audio_labels.dart';
import '../../../util/download_utils.dart';
import '../../../util/episode_playability.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/language_matching.dart';
import '../../../util/subtitle_track_logic.dart';
import '../../../util/audio_track_logic.dart';
import '../../../util/platform_detection.dart';

const _textShadows = [Shadow(blurRadius: 4, color: Colors.black54)];
const _kCompactBreakpoint = 600.0;

bool _isCompact(BuildContext context) =>
    PlatformDetection.useMobileUi ||
    MediaQuery.sizeOf(context).width < _kCompactBreakpoint;

bool _useDesktopDetailLayout(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final isLandscape = size.width > size.height;
  return !(_isCompact(context)) ||
      (PlatformDetection.useMobileUi && isLandscape && size.width >= 700);
}

double _desktopUiScale({UserPreferences? prefs}) {
  final effectivePrefs = prefs ?? GetIt.instance<UserPreferences>();
  return effectivePrefs.get(UserPreferences.desktopUiScale).scaleFactor;
}

/// Smoothly scrolls a position back to the top. Ignore if already there.
void _animateScrollToTop(ScrollPosition position) {
  if (position.pixels <= position.minScrollExtent) return;
  unawaited(
    position.animateTo(
      position.minScrollExtent,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    ),
  );
}

Future<bool> _showDeleteConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  final confirmed = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      backgroundColor: const Color(0xFF171717),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      content: Text(message, style: const TextStyle(color: Colors.white70)),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(
            AppLocalizations.of(ctx).cancel,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFD32F2F),
          ),
          child: Text(AppLocalizations.of(ctx).delete),
        ),
      ],
    ),
  );

  return confirmed == true;
}

class ItemDetailScreen extends StatefulWidget {
  final String itemId;
  final String? serverId;
  final bool autoPlay;

  const ItemDetailScreen({
    super.key,
    required this.itemId,
    this.serverId,
    this.autoPlay = false,
  });

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen>
    with WidgetsBindingObserver, RouteAware {
  late final ItemDetailViewModel _viewModel;
  final _backgroundService = GetIt.instance<BackgroundService>();
  final _themeMusicService = GetIt.instance<ThemeMusicService>();
  final _prefs = GetIt.instance<UserPreferences>();
  String? _backdropUrl;
  StreamSubscription<String?>? _backgroundSub;
  bool _themeMusicStarted = false;
  String? _selectedMediaSourceId;
  bool _showNavbar = true;
  bool _actionsExpanded = false;
  Timer? _focusedBackdropDebounce;
  String? _lastFocusedBackdropItemId;
  String? _lastDetailBackdropItemId;
  final Map<String, String> _focusedPrimaryBackdropUrlCache =
      <String, String>{};
  FocusNode? _initialContentFocusNode;
  ModalRoute<dynamic>? _observedRoute;

  FocusNode _ensureInitialFocusNode() => _initialContentFocusNode ??= FocusNode(
    debugLabel: 'detailInitialContent',
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _themeMusicService.registerDetailScreen(this);
    final factory = GetIt.instance<MediaServerClientFactory>();
    final client = widget.serverId != null
        ? factory.getClientIfExists(widget.serverId!) ??
              GetIt.instance<MediaServerClient>()
        : GetIt.instance<MediaServerClient>();
    _viewModel = ItemDetailViewModel(
      itemId: widget.itemId,
      serverId: widget.serverId,
      client: client,
      mutations: GetIt.instance<ItemMutationRepository>(),
      mdbListRepository: GetIt.instance<MdbListRepository>(),
      tmdbRepository: GetIt.instance<TmdbRepository>(),
    );
    _viewModel.addListener(_onChanged);
    _prefs.addListener(_onPrefsChanged);
    GetIt.instance<PluginSyncService>().addListener(_onPrefsChanged);
    _viewModel.load();

    _backdropUrl = _backgroundService.currentUrl;
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      // Ignore null: a child screen clearing the shared service on its way out
      // must not blank this screen's backdrop after it has been restored.
      if (mounted && url != null) {
        setState(() => _backdropUrl = url);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
    }
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    final item = _viewModel.item;
    if (item != null) {
      _backgroundService.setBackground(item, context: BlurContext.details);
      final nextUrl = _backgroundService.currentUrl;
      // Keep the last good backdrop if the service has none to give (e.g. after
      // returning from a child with no backdrop that cleared the shared service).
      if (nextUrl != null && nextUrl != _backdropUrl) {
        setState(() => _backdropUrl = nextUrl);
      }
    }
    // A pushed child screen (e.g. a similar item) clears the shared play-button
    // notifier on its way out; reclaim it so focus restoration finds this screen.
    if (PlatformDetection.isTV && _initialContentFocusNode != null) {
      NavigationLayout.focusDetailsPlayButtonNotifier.value =
          _initialContentFocusNode;
    }
    _resumeThemeMusicIfEligible();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        (state == AppLifecycleState.inactive &&
            !PlatformDetection.isDesktop &&
            !PlatformDetection.isWeb) ||
        state == AppLifecycleState.detached) {
      _themeMusicService.fadeOutAndStop();
      return;
    }

    if (state == AppLifecycleState.resumed) {
      _resumeThemeMusicIfEligible();
    }
  }

  @override
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
    WidgetsBinding.instance.removeObserver(this);
    _themeMusicService.unregisterDetailScreen(this);
    _backgroundSub?.cancel();
    _focusedBackdropDebounce?.cancel();
    if (_backgroundService.currentUrl == _backdropUrl) {
      _backgroundService.clearBackgrounds();
    }
    _viewModel.removeListener(_onChanged);
    _prefs.removeListener(_onPrefsChanged);
    try {
      GetIt.instance<PluginSyncService>().removeListener(_onPrefsChanged);
    } catch (_) {}
    _viewModel.dispose();
    _initialContentFocusNode?.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    setState(() {});
    final item = _viewModel.item;
    if (item != null) {
      bool needInitialBackdrop = _lastDetailBackdropItemId != item.id;
      if (item.type == 'Playlist' &&
          _viewModel.tracks.isNotEmpty &&
          _lastFocusedBackdropItemId == null) {
        needInitialBackdrop = true;
      }

      if (needInitialBackdrop) {
        _lastDetailBackdropItemId = item.id;
        _focusedPrimaryBackdropUrlCache.clear();

        final target = (item.type == 'Playlist' && _viewModel.tracks.isNotEmpty)
            ? _viewModel.tracks.first
            : item;
        _backgroundService.setBackground(target, context: BlurContext.details);
        _backdropUrl = _backgroundService.currentUrl;

        if (item.type == 'Playlist' && _viewModel.tracks.isNotEmpty) {
          _onBackdropItemFocused(_viewModel.tracks.first);
        }

        if (item.mediaSources.isNotEmpty) {
          _selectedMediaSourceId = item.mediaSources.first['Id']?.toString();
        } else {
          _selectedMediaSourceId = null;
        }

        _viewModel.selectedAudioIndex = null;
        _viewModel.selectedSubtitleIndex = null;
      }
      if (!_themeMusicStarted) {
        _themeMusicStarted = true;
        _themeMusicService.playForItem(item);
      }
    }
  }

  void _onBackdropItemFocused(AggregatedItem focusedItem) {
    final itemId = focusedItem.id;
    if (_lastFocusedBackdropItemId == itemId) return;
    _lastFocusedBackdropItemId = itemId;
    _focusedBackdropDebounce?.cancel();

    _focusedBackdropDebounce = Timer(const Duration(milliseconds: 80), () {
      if (!mounted || _lastFocusedBackdropItemId != itemId) return;

      final hasBackdrop = focusedItem.backdropImageTags.isNotEmpty ||
          (focusedItem.parentBackdropItemId != null &&
              focusedItem.parentBackdropImageTags.isNotEmpty);

      if (!hasBackdrop) {
        final tag = focusedItem.primaryImageTag;
        if (tag != null) {
          final cacheKey = '${focusedItem.id}:$tag';
          final url = _focusedPrimaryBackdropUrlCache.putIfAbsent(
            cacheKey,
            () => _viewModel.imageApi.getPrimaryImageUrl(
              focusedItem.id,
              maxHeight: 1080,
              tag: tag,
            ),
          );
          if (url != _backdropUrl) {
            _backgroundService.setBackgroundUrl(
              url,
              context: BlurContext.details,
            );
            setState(() => _backdropUrl = url);
          }
          return;
        }
      }

      _backgroundService.setBackground(
        focusedItem,
        context: BlurContext.details,
      );
      final nextUrl = _backgroundService.currentUrl;
      if (nextUrl != _backdropUrl) {
        setState(() => _backdropUrl = nextUrl);
      }
    });
  }

  void _onPrefsChanged() {
    if (mounted) setState(() {});
  }

  void _resumeThemeMusicIfEligible() {
    final item = _viewModel.item;
    if (item == null) return;

    _themeMusicStarted = true;
    _themeMusicService.playForItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final type = _viewModel.item?.type;
    final useTargetNode = type != null && type != 'Photo';
    final node = useTargetNode ? _ensureInitialFocusNode() : null;
    final lastCollapse = ExpandableBiography.lastCollapseTime;
    final now = DateTime.now();
    final wasCollapsedRecently = lastCollapse != null &&
        now.difference(lastCollapse) < const Duration(milliseconds: 350);

    // Albums/playlists hide the chrome on TV/desktop (their split hero owns the
    // top area); on mobile they need the back arrow like every other screen.
    final isAlbumOrPlaylist = type == 'MusicAlbum' || type == 'Playlist';
    final showNavigationChrome = _viewModel.state == ItemDetailState.ready &&
        _showNavbar &&
        (!isAlbumOrPlaylist || _isCompact(context));

    Widget body = NavigationLayout(
      showBackButton: true,
      showNavigationChrome: showNavigationChrome,
      child: _buildBody(context),
    );

    body = PopScope(
      canPop: !wasCollapsedRecently,
      child: body,
    );
    return RequestInitialFocus(
      targetNode: node,
      child: Scaffold(backgroundColor: Colors.black, body: body),
    );
  }

  Future<void> _playFromChapter(
    BuildContext context,
    AggregatedItem item,
    Duration startPosition,
    String? mediaSourceId,
  ) async {
    final manager = GetIt.instance<PlaybackManager>();
    final forceTranscode = await _shouldForceTranscodeForDolbyVisionQueue(
      context,
      [item],
      mediaSourceId: mediaSourceId,
    );
    if (!context.mounted) return;
    final started = await _runWithDolbyVisionStartupFallbackPrompt(
      context,
      manager,
      () => manager.playItems(
        [item],
        startPosition: startPosition,
        mediaSourceId: mediaSourceId,
        enableDirectPlay: !forceTranscode,
        enableDirectStream: !forceTranscode,
      ),
    );
    if (!started || !context.mounted) return;

    final destination = manager.playbackDeferredToExternalPlayer
        ? Destinations.externalPlayer
        : Destinations.videoPlayer;
    unawaited(context.push(destination));
  }

  Widget _buildBody(BuildContext context) {
    return switch (_viewModel.state) {
      ItemDetailState.loading => const Center(
        child: PlayerLoadingOverlay(logoSize: 120),
      ),
      ItemDetailState.error => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AdaptiveIcon(
              Icons.error_outline,
              color: Colors.white54,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              _viewModel.errorMessage ??
                  AppLocalizations.of(context).failedToLoad,
              style: const TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _viewModel.load,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      ),
      ItemDetailState.ready =>
        _prefs.get(UserPreferences.detailScreenStyle) ==
                DetailScreenStyle.modern
            ? ModernDetailContent(
                viewModel: _viewModel,
                prefs: _prefs,
                backdropUrl: _backdropUrl,
                selectedMediaSourceId: _selectedMediaSourceId,
                initialFocusNode: _ensureInitialFocusNode(),
                onSelectedMediaSourceChanged: (id) {
                  setState(() => _selectedMediaSourceId = id);
                  _viewModel.load(mediaSourceId: id);
                },
                onBackdropItemFocused: _onBackdropItemFocused,
                autoPlay: widget.autoPlay,
                onPlayFromChapter: (position) => unawaited(
                  _playFromChapter(context, _viewModel.item!, position, _selectedMediaSourceId),
                ),
                onToggleNavbar: (show) => setState(() => _showNavbar = show),
                actionsExpanded: _actionsExpanded,
                onActionsExpandedChanged: (val) => setState(() => _actionsExpanded = val),
                onCollapseBiography: () => setState(() {}),
              )
            : _DetailContent(
                viewModel: _viewModel,
                prefs: _prefs,
                backdropUrl: _backdropUrl,
                selectedMediaSourceId: _selectedMediaSourceId,
                initialFocusNode: _ensureInitialFocusNode(),
                onSelectedMediaSourceChanged: (id) {
                  setState(() => _selectedMediaSourceId = id);
                  _viewModel.load(mediaSourceId: id);
                },
                onBackdropItemFocused: _onBackdropItemFocused,
                autoPlay: widget.autoPlay,
              ),
    };
  }
}

class _DetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final String? backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final FocusNode? initialFocusNode;
  final bool autoPlay;

  const _DetailContent({
    required this.viewModel,
    required this.prefs,
    this.backdropUrl,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.onBackdropItemFocused,
    this.initialFocusNode,
    this.autoPlay = false,
  });

  @override
  State<_DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<_DetailContent> {
  late ScrollController _scrollController;
  late FocusNode _contentFocusNode;
  final Map<String, FocusNode> _sectionFocusNodes = <String, FocusNode>{};
  final Map<FocusNode, ScrollController> _sectionScrollControllers =
      <FocusNode, ScrollController>{};
  final Set<FocusNode> _pendingSectionFocusRetries = <FocusNode>{};
  final FocusNode _firstChapterFocusNode = FocusNode(
    debugLabel: 'detailFirstChapter',
  );
  final FocusNode _firstFeatureFocusNode = FocusNode(
    debugLabel: 'detailFirstFeature',
  );
  final FocusNode _albumPlayFocusNode = FocusNode(
    debugLabel: 'albumPlayButton',
  );
  final Map<String, FocusNode> _trackFocusNodes = <String, FocusNode>{};

  FocusNode _getTrackFocusNode(String trackId) {
    return _trackFocusNodes.putIfAbsent(
      trackId,
      () => FocusNode(debugLabel: 'track-$trackId'),
    );
  }
  final FocusNode _nextEpisodeFocusNode = FocusNode(
    debugLabel: 'detailNextEpisode',
  );
  final FocusNode _seriesNextUpFocusNode = FocusNode(
    debugLabel: 'detailSeriesNextUp',
  );
  String? _tvAlbumPlayFocusAppliedForItemId;
  List<SeerrDiscoverItem>? _seerrAppearances;
  List<SeerrDiscoverItem>? _seerrCrewCredits;

  Future<void> _loadSeerrAppearances() async {
    final item = widget.viewModel.item;
    if (item == null || item.type != 'Person') return;
    final tmdbId = item.tmdbId;
    if (tmdbId == null || tmdbId.isEmpty) return;
    if (!GetIt.instance<PluginSyncService>().seerrAvailable) {
      return;
    }

    if (mounted) {
      setState(() {
        _seerrAppearances = null;
        _seerrCrewCredits = null;
      });
    }

    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      final personId = int.tryParse(tmdbId);
      if (personId != null) {
        final credits = await repo.getPersonCombinedCredits(personId);
        const excludedJobs = {'thanks', 'special thanks'};
        final castWithPosters =
            credits.cast.where((i) => i.posterPath != null).toList()
              ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
        final crewWithPosters = credits.crew
            .where(
              (i) =>
                  i.posterPath != null &&
                  !excludedJobs.contains(i.job?.toLowerCase()),
            )
            .toList()
          ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
        if (mounted) {
          setState(() {
            _seerrAppearances = castWithPosters;
            _seerrCrewCredits = crewWithPosters;
          });
        }
      }
    } catch (e) {
      debugPrint('Error loading Seerr appearances: $e');
    }
  }

  ItemDetailViewModel get viewModel => widget.viewModel;
  UserPreferences get prefs => widget.prefs;
  String? get selectedMediaSourceId => widget.selectedMediaSourceId;
  ValueChanged<String?> get onSelectedMediaSourceChanged =>
      widget.onSelectedMediaSourceChanged;
  ValueChanged<AggregatedItem>? get onBackdropItemFocused =>
      widget.onBackdropItemFocused;
  FocusNode? get initialFocusNode => widget.initialFocusNode;

  FocusNode _sectionFocusNode(String debugLabel) {
    return _sectionFocusNodes.putIfAbsent(
      debugLabel,
      () => FocusNode(debugLabel: debugLabel),
    );
  }

  ScrollController _trackSectionScrollController(
    FocusNode? focusNode,
    ScrollController controller,
  ) {
    if (focusNode != null) {
      _sectionScrollControllers[focusNode] = controller;
    }
    return controller;
  }

  void _resetSectionHorizontalOffset(FocusNode? sectionFocusNode) {
    if (sectionFocusNode == null) {
      return;
    }
    final controller = _sectionScrollControllers[sectionFocusNode];
    if (controller == null || !controller.hasClients) {
      return;
    }
    final minOffset = controller.position.minScrollExtent;
    if (controller.offset != minOffset) {
      controller.jumpTo(minOffset);
    }
  }

  bool _isLaidOutFocusNode(FocusNode target) {
    if (!target.canRequestFocus) {
      return false;
    }
    final context = target.context;
    if (context == null) {
      return false;
    }
    final renderObject = context.findRenderObject();
    return renderObject is RenderBox &&
        renderObject.attached &&
        renderObject.hasSize;
  }

  bool _shouldSkipSectionEnsureVisible(FocusNode target) {
    if (widget.viewModel.item?.type != 'Person') {
      return false;
    }
    final favoriteFocusNode =
        widget.initialFocusNode ?? _sectionFocusNodes['detailPersonFavorite'];
    final displayFocusNode = _sectionFocusNodes['detailPersonDisplayButton'];
    final seerrFocusNode = _sectionFocusNodes['detailPersonSeerrButton'];
    if (target == favoriteFocusNode || target == displayFocusNode || target == seerrFocusNode) {
      return true;
    }
    return target.context
            ?.findAncestorWidgetOfExactType<ExpandableBiography>() !=
        null;
  }

  bool _tryFocusNavbar() {
    _scrollMainToTop();

    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return false;
  }

  bool _tryFocusSidebar() {
    if (prefs.get(UserPreferences.navbarPosition) != NavbarPosition.left) {
      return false;
    }
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  FocusNode? _headerOverviewFocusNode(AggregatedItem item) {
    final overview = item.overview?.trim();
    if (overview == null || overview.isEmpty) {
      return null;
    }
    if (item.type == 'Person' ||
        item.type == 'MusicArtist' ||
        item.type == 'MusicAlbum' ||
        item.type == 'Playlist' ||
        _isReadableBookItem(item)) {
      return null;
    }
    return _sectionFocusNode('detailHeaderOverview');
  }

  Future<void> _ensureSectionVisible(
    BuildContext context, {
    double alignment = 0.2,
  }) {
    return Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      alignment: alignment,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  }

  double _sectionFocusAlignment(FocusNode target) {
    final primaryContext = FocusManager.instance.primaryFocus?.context;
    final fromActionButtons =
        primaryContext?.findAncestorWidgetOfExactType<DetailActionButtons>() != null;
    if (!fromActionButtons) {
      return 0.2;
    }

    final targetInHeader =
        target.debugLabel == 'detailHeaderOverview' ||
        target.context?.findAncestorWidgetOfExactType<_HeaderSection>() != null;
    return targetInHeader ? 0.2 : 0.42;
  }

  BuildContext? _sectionContainerContext(FocusNode target) {
    final controller = _sectionScrollControllers[target];
    if (controller == null || !controller.hasClients) {
      return null;
    }
    return controller.position.context.storageContext;
  }

  void _scrollMainToTop() {
    if (_scrollController.hasClients) {
      _animateScrollToTop(_scrollController.position);
    }
  }

  bool _isActionButtonTarget(FocusNode target) =>
      target == widget.initialFocusNode ||
      target.debugLabel == 'detailActionButtons' ||
      target.debugLabel == 'detailBoxSetActionButtons';

  void _focusSectionTarget(FocusNode target, {double alignment = 0.2}) {
    target.requestFocus();
    if (_isActionButtonTarget(target)) {
      _scrollMainToTop();
    } else {
      final context = target.context;
      if (context != null && !_shouldSkipSectionEnsureVisible(target)) {
        unawaited(_ensureSectionVisible(context, alignment: alignment));
      }
    }
  }

  void _scheduleSingleSectionFocusRetry(
    FocusNode target, {
    double alignment = 0.2,
  }) {
    if (!_pendingSectionFocusRetries.add(target)) {
      return;
    }

    if (_isActionButtonTarget(target)) {
      _scrollMainToTop();
    } else {
      final sectionContext = _sectionContainerContext(target);
      if (sectionContext != null && !_shouldSkipSectionEnsureVisible(target)) {
        unawaited(_ensureSectionVisible(sectionContext, alignment: alignment));
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pendingSectionFocusRetries.remove(target);
      if (!mounted || !_isLaidOutFocusNode(target)) {
        return;
      }
      _focusSectionTarget(target, alignment: alignment);
    });
  }

  KeyEventResult _requestSectionFocus(FocusNode? target) {
    if (target == null) {
      return KeyEventResult.ignored;
    }

    final alignment = _sectionFocusAlignment(target);

    if (!target.canRequestFocus) {
      return KeyEventResult.ignored;
    }

    _resetSectionHorizontalOffset(target);

    if (_isLaidOutFocusNode(target)) {
      _focusSectionTarget(target, alignment: alignment);
      return KeyEventResult.handled;
    }

    _scheduleSingleSectionFocusRetry(target, alignment: alignment);
    return KeyEventResult.ignored;
  }

  KeyEventResult Function(int index, KeyEvent event)? _buildVerticalRowHandler({
    FocusNode? sourceFocusNode,
    FocusNode? upTarget,
    FocusNode? downTarget,
    FocusNode? leftTarget,
    int? itemCount,
    bool consumeDownWhenNoTarget = false,
  }) {
    final hasBoundaryGuards = itemCount != null && itemCount > 0;
    if (!PlatformDetection.isTV ||
        (upTarget == null &&
            downTarget == null &&
            leftTarget == null &&
            !hasBoundaryGuards)) {
      return null;
    }

    final favoriteFocusNode =
        widget.initialFocusNode ?? _sectionFocusNode('detailPersonFavorite');

    return (index, event) {
      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }
      if (hasBoundaryGuards &&
          event.logicalKey == LogicalKeyboardKey.arrowLeft &&
          index <= 0) {
        if (event is KeyDownEvent) {
          if (leftTarget != null) {
            _requestSectionFocus(leftTarget);
            return KeyEventResult.handled;
          }
          _tryFocusSidebar();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      }
      if (hasBoundaryGuards &&
          event.logicalKey == LogicalKeyboardKey.arrowRight &&
          index >= itemCount - 1) {
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _resetSectionHorizontalOffset(sourceFocusNode);
        if (upTarget != null) {
          final displayFocusNode = _sectionFocusNodes['detailPersonDisplayButton'];
          final seerrFocusNode = _sectionFocusNodes['detailPersonSeerrButton'];
          if (upTarget == favoriteFocusNode ||
              upTarget == displayFocusNode ||
              upTarget == seerrFocusNode) {
            _scrollMainToTop();
          }
          _requestSectionFocus(upTarget);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _resetSectionHorizontalOffset(sourceFocusNode);
        if (downTarget != null) {
          _requestSectionFocus(downTarget);
          return KeyEventResult.handled;
        }
        if (consumeDownWhenNoTarget) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      }
      return KeyEventResult.ignored;
    };
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _contentFocusNode = FocusNode(debugLabel: 'detailContent');
    widget.prefs.addListener(_onPrefsChanged);
    _loadSeerrAppearances();
  }

  void _onPrefsChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant _DetailContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newId = widget.viewModel.item?.id;
    final oldId = oldWidget.viewModel.item?.id;
    if (newId != oldId) {
      _tvAlbumPlayFocusAppliedForItemId = null;
      _sectionScrollControllers.clear();
      _pendingSectionFocusRetries.clear();
      _loadSeerrAppearances();
    }
  }

  void _ensureTvAlbumPlayFocus(AggregatedItem item) {
    if (!PlatformDetection.isTV) return;
    if (item.type != 'MusicAlbum' && item.type != 'Playlist') return;
    if (_tvAlbumPlayFocusAppliedForItemId == item.id) return;
    _tryRequestTvAlbumPlayFocus(item.id, 0);
  }

  void _tryRequestTvAlbumPlayFocus(String itemId, int attempt) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_tvAlbumPlayFocusAppliedForItemId == itemId) return;
      final node = _albumPlayFocusNode;
      if (node.context != null && node.canRequestFocus) {
        node.requestFocus();
        if (node.hasFocus) {
          _tvAlbumPlayFocusAppliedForItemId = itemId;
          return;
        }
      }
      if (attempt + 1 >= 8) return;
      Future<void>.delayed(const Duration(milliseconds: 50), () {
        if (!mounted) return;
        _tryRequestTvAlbumPlayFocus(itemId, attempt + 1);
      });
    });
  }

  @override
  void dispose() {
    widget.prefs.removeListener(_onPrefsChanged);
    _scrollController.dispose();
    _contentFocusNode.dispose();
    for (final node in _sectionFocusNodes.values) {
      node.dispose();
    }
    _sectionFocusNodes.clear();
    _sectionScrollControllers.clear();
    _pendingSectionFocusRetries.clear();
    _firstChapterFocusNode.dispose();
    _firstFeatureFocusNode.dispose();
    _albumPlayFocusNode.dispose();
    for (final node in _trackFocusNodes.values) {
      node.dispose();
    }
    _trackFocusNodes.clear();
    _nextEpisodeFocusNode.dispose();
    _seriesNextUpFocusNode.dispose();
    super.dispose();
  }

  Widget _buildStaticPersonProfilePanel(
    BuildContext context,
    AggregatedItem item,
  ) {
    final safeTop = MediaQuery.of(context).padding.top;
    final topOffset = safeTop + 80.0;

    String? imageUrl;
    if (item.primaryImageTag != null) {
      imageUrl = viewModel.imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 400,
        tag: item.primaryImageTag,
      );
    }

    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final profileBorderColor = isNeon ? AppColorScheme.accent : focusColor;

    const avatarRadius = 80.0;
    final avatar = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: profileBorderColor, width: 3.0),
      ),
      child: CircleAvatar(
        radius: avatarRadius,
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        backgroundImage: imageUrl != null
            ? CachedNetworkImageProvider(imageUrl)
            : null,
        child: imageUrl == null
            ? const AdaptiveIcon(Icons.person, color: Colors.white54, size: 64)
            : null,
      ),
    );

    final theme = Theme.of(context);

    return Container(
      width: 320,
      padding: EdgeInsets.fromLTRB(32, topOffset, 32, 32),
      decoration: BoxDecoration(
        color: AppColorScheme.background.withValues(alpha: 0.85),
        border: Border(
          right: BorderSide(
            color: isNeon
                ? AppColorScheme.accent
                : Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          avatar,
          const SizedBox(height: 24),
          Text(
            item.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: _textShadows,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          PersonDatesVertical(item: item),
          if (item.productionLocations.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              item.productionLocations.first,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
                shadows: _textShadows,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.viewModel.item!;
    final headerOverviewFocusNode = _headerOverviewFocusNode(item);
    _ensureTvAlbumPlayFocus(item);
    final isReadableBook = _isReadableBookItem(item);
    final selectedMediaSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final blurAmount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble();
    final backdropEnabled = widget.prefs.get(UserPreferences.backdropEnabled);
    final useSplitLayout =
        item.type == 'Person' && _useDesktopDetailLayout(context);
    final isAlbumOrPlaylist = item.type == 'MusicAlbum' || item.type == 'Playlist';

    return Focus(
      focusNode: _contentFocusNode,
      onKeyEvent: (node, event) {
        final primaryFocus = FocusManager.instance.primaryFocus;
        if (!identical(primaryFocus, _contentFocusNode)) {
          return KeyEventResult.ignored;
        }
        if ((event is KeyDownEvent || event is KeyRepeatEvent) &&
            event.logicalKey == LogicalKeyboardKey.arrowUp) {
          final navbarPos = prefs.get(UserPreferences.navbarPosition);
          if (navbarPos == NavbarPosition.top) {
            _scrollMainToTop();
            NavigationLayout.focusNavbarNotifier.value?.call();
            return KeyEventResult.handled;
          }
          final isAtTop =
              !_scrollController.hasClients || _scrollController.offset <= 0;
          if (isAtTop) {
            NavigationLayout.focusNavbarNotifier.value?.call();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (isReadableBook)
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFF0F182A)),
              ),
            ),
          if (backdropEnabled && !isReadableBook)
            _Backdrop(url: widget.backdropUrl, blurAmount: blurAmount),
          if (isReadableBook)
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x000F182A), Color(0x440A1324)],
                  ),
                ),
              ),
            )
          else
            const _GradientScrim(),
          if (useSplitLayout)
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStaticPersonProfilePanel(context, item),
                Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    cacheExtent: 4000,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          48,
                          MediaQuery.of(context).padding.top + 80.0,
                          48,
                          48 * _desktopUiScale(),
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            _buildContentForType(context, item),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            CustomScrollView(
              controller: _scrollController,
              cacheExtent: 4000,
              slivers: [
                if (item.type != 'Person' &&
                    item.type != 'MusicArtist' &&
                    item.type != 'MusicAlbum' &&
                    item.type != 'Playlist' &&
                    !_isReadableBookItem(item))
                  SliverToBoxAdapter(
                    child: _HeaderSection(
                      viewModel: widget.viewModel,
                      prefs: widget.prefs,
                      selectedMediaSource: selectedMediaSource,
                      overviewFocusNode: headerOverviewFocusNode,
                      onArrowUp: _tryFocusNavbar,
                      onArrowDown: () {
                        final type = item.type;
                        final targetNode = switch (type) {
                          'BoxSet' => _sectionFocusNode(
                            'detailBoxSetActionButtons',
                          ),
                          _ =>
                            widget.initialFocusNode ??
                                _sectionFocusNode('detailActionButtons'),
                        };
                        _requestSectionFocus(targetNode);
                      },
                      onArrowLeft: () => _tryFocusSidebar(),
                      onCollapseBiography: () => setState(() {}),
                    ),
                  ),
                SliverPadding(
                  padding: isReadableBook
                      ? EdgeInsets.fromLTRB(
                          _isCompact(context) ? 16 : 48,
                          MediaQuery.of(context).padding.top +
                              (_isCompact(context) ? 60 : 80),
                          _isCompact(context) ? 16 : 48,
                          0,
                        )
                      : EdgeInsets.fromLTRB(
                          _isCompact(context) ? 16 : 48,
                          0,
                          _isCompact(context) ? 16 : 48,
                          (MediaQuery.of(context).padding.bottom + 48.0) *
                              _desktopUiScale(),
                        ),
                  sliver: isAlbumOrPlaylist
                      ? SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: _buildContentForType(context, item),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate(
                            _buildContentForType(context, item),
                          ),
                        ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  List<Widget> _buildContentForType(BuildContext context, AggregatedItem item) {
    return switch (item.type) {
      'Series' => _buildSeriesContent(context, item),
      'Season' => _buildSeasonContent(context, item),
      'Episode' => _buildEpisodeContent(context, item),
      'Person' => _buildPersonContent(context, item),
      'MusicArtist' => _buildArtistContent(context, item),
      'MusicAlbum' || 'Playlist' => _buildAlbumContent(context, item),
      'BoxSet' => _buildBoxSetContent(context, item),
      'Photo' => _buildPhotoContent(item),
      _ =>
        _isReadableBookItem(item)
            ? _buildBookContent(context, item)
            : _buildMovieContent(context, item),
    };
  }

  List<Widget> _buildPhotoContent(AggregatedItem item) {
    final raw = item.rawData;
    final width = raw['Width'] as int?;
    final height = raw['Height'] as int?;
    final cameraMake = raw['CameraMake'] as String?;
    final cameraModel = raw['CameraModel'] as String?;
    final software = raw['Software'] as String?;
    final dateTaken = raw['DateCreated'] as String?;

    final exifEntries = <String>[
      if (width != null && height != null) '$width×$height',
      ?cameraMake,
      ?cameraModel,
      ?software,
      if (dateTaken != null) dateTaken.split('T').first,
    ];

    return [
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: _sectionFocusNode('detailActionButtons'),
        upTarget: _headerOverviewFocusNode(item),
        onRequestFocus: _requestSectionFocus,
        autoPlay: widget.autoPlay,
      ),
      if (exifEntries.isNotEmpty) ...[
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: exifEntries
                .map(
                  (e) => Chip(
                    label: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                )
                .toList(),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  String? _bookAuthorName(AggregatedItem item) {
    final directAuthor = (item.rawData['Author'] as String?)?.trim();
    if (directAuthor != null && directAuthor.isNotEmpty) return directAuthor;

    final authors = (item.rawData['Authors'] as List?)
        ?.whereType<String>()
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    if (authors != null && authors.isNotEmpty) return authors.first;

    final peopleAuthor = item.people
        .where((person) {
          final type = (person['Type'] as String?)?.toLowerCase();
          return type == 'author' || type == 'writer';
        })
        .map((person) => (person['Name'] as String?)?.trim() ?? '')
        .firstWhere((name) => name.isNotEmpty, orElse: () => '');
    if (peopleAuthor.isNotEmpty) return peopleAuthor;

    if (item.artists.isNotEmpty) return item.artists.first;

    return null;
  }

  String? _bookAuthorPersonId(AggregatedItem item) {
    for (final person in item.people) {
      final type = (person['Type'] as String?)?.toLowerCase();
      if (type != 'author' && type != 'writer') continue;

      final id = person['Id']?.toString().trim();
      if (id != null && id.isNotEmpty) {
        return id;
      }
    }
    return null;
  }

  void _openBookAuthorDetails(
    BuildContext context,
    AggregatedItem item,
    String authorName,
  ) {
    if (authorName.trim().isEmpty) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _BookAuthorDetailScreen(
          authorName: authorName,
          authorPersonId: _bookAuthorPersonId(item),
          serverId: item.serverId,
        ),
      ),
    );
  }

  List<Widget> _buildBookContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final compact = _isCompact(context);
    final author = _bookAuthorName(item);
    final authorDisplay = author ?? l10n.unknownAuthor;
    final overview = item.overview?.trim();
    final hasOverview = overview != null && overview.isNotEmpty;
    final overviewFocusNode = hasOverview
        ? _sectionFocusNode('detailBookOverview')
        : null;
    final actionButtonsFocusNode =
        widget.initialFocusNode ?? _sectionFocusNode('detailActionButtons');
    final similarFocusNode = viewModel.similar.isNotEmpty
        ? _sectionFocusNode('detailBookSimilar')
        : null;
    final coverTag = item.primaryImageTag;
    final coverUrl = coverTag == null
        ? null
        : viewModel.imageApi.getPrimaryImageUrl(
            item.id,
            maxHeight: compact ? 520 : 720,
            tag: coverTag,
          );

    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: coverUrl == null
                    ? Container(
                        color: const Color(0xFF2C77B7),
                        alignment: Alignment.center,
                        child: const AdaptiveIcon(
                          Icons.auto_stories_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: coverUrl,
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) => Container(
                          color: const Color(0xFF2C77B7),
                          alignment: Alignment.center,
                          child: const AdaptiveIcon(
                            Icons.auto_stories_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: author != null
                      ? () => _openBookAuthorDetails(context, item, author)
                      : null,
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      authorDisplay,
                      style: const TextStyle(
                        color: Color(0xFF9EDBFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF9EDBFF),
                      ),
                    ),
                  ),
                ),
                if (item.productionYear != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    l10n.firstPublished(item.productionYear!),
                    style: const TextStyle(
                      color: Color(0xFFBDD8EE),
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: actionButtonsFocusNode,
        downTarget: overviewFocusNode,
        onRequestFocus: _requestSectionFocus,
        autoPlay: widget.autoPlay,
      ),
      const SizedBox(height: 28),
      _SectionHeader(title: l10n.overview),
      const SizedBox(height: 8),
      if (hasOverview)
        _OverviewText(
          text: overview,
          focusNode: overviewFocusNode,
          onArrowUp: () => _requestSectionFocus(actionButtonsFocusNode),
          onArrowDown: similarFocusNode != null
              ? () => _requestSectionFocus(similarFocusNode)
              : null,
          onArrowLeft: () => _tryFocusSidebar(),
          onCollapse: () => setState(() {}),
          style: const TextStyle(
            color: Color(0xFFD7E8F6),
            fontSize: 14,
            height: 1.5,
          ),
        )
      else
        Text(
          l10n.noOverviewAvailable,
          style: const TextStyle(
            color: Color(0xFFD7E8F6),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      if (item.genres.isNotEmpty) ...[
        const SizedBox(height: 20),
        _SectionHeader(title: l10n.genres),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: item.genres
              .take(24)
              .map(
                (genre) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeRegistry.active.borders.chipBackground,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.chipBorder,
                    ),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(
                      color: Color(0xFFD7E8F6),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
      if (viewModel.similar.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.moreLikeThis,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.similar,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            firstItemFocusNode: similarFocusNode,
            onItemLongPress: _showItemContextMenu,
            scrollController: ctrl,
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  List<Widget> _buildMovieContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final hasChapters = item.chapters.isNotEmpty;
    final hasFeatures = viewModel.features.isNotEmpty;
    final hasCast = viewModel.actors.isNotEmpty;
    final hasCollection = viewModel.parentCollectionItems.isNotEmpty;
    final hasSimilar = viewModel.similar.isNotEmpty;
    final castFocusNode = hasCast ? _sectionFocusNode('detailMovieCast') : null;
    final collectionFocusNode = hasCollection
        ? _sectionFocusNode('detailMovieCollection')
        : null;
    final similarFocusNode = hasSimilar
        ? _sectionFocusNode('detailMovieSimilar')
        : null;
    final actionButtonsFocusNode =
        widget.initialFocusNode ?? _sectionFocusNode('detailActionButtons');
    final overviewFocusNode = _headerOverviewFocusNode(item);
    final metadataFocusNode = _hasMetadata(item)
        ? _sectionFocusNode('detailMovieMetadata')
        : null;
    final movieDownTarget = hasChapters
        ? _firstChapterFocusNode
        : (hasFeatures
              ? _firstFeatureFocusNode
              : (castFocusNode ?? collectionFocusNode ?? similarFocusNode));
    final chapterFeatureLastNode = hasFeatures
        ? _firstFeatureFocusNode
        : (hasChapters
              ? _firstChapterFocusNode
              : (metadataFocusNode ?? actionButtonsFocusNode));
    final chapterFeatureNextNode =
        castFocusNode ?? collectionFocusNode ?? similarFocusNode;
    final collectionUpTarget = castFocusNode ?? chapterFeatureLastNode;

    return [
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: actionButtonsFocusNode,
        upTarget: overviewFocusNode,
        onRequestFocus: _requestSectionFocus,
        downTarget: metadataFocusNode ?? movieDownTarget,
        autoPlay: widget.autoPlay,
      ),
      if (_hasMetadata(item)) ...[
        const SizedBox(height: 24),
        DetailMetadataSection(
          viewModel: viewModel,
          firstItemFocusNode: metadataFocusNode,
          upTarget: actionButtonsFocusNode,
          downTarget: movieDownTarget,
          onRequestFocus: _requestSectionFocus,
        ),
      ],
      ..._buildChapterAndFeatureSections(
        context,
        item,
        selectedMediaSourceId: selectedMediaSourceId,
        prevSectionFocusNode: metadataFocusNode ?? actionButtonsFocusNode,
        nextSectionFocusNode: chapterFeatureNextNode,
      ),
      if (viewModel.actors.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.cast,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailCastRow(
            people: viewModel.actors,
            imageApi: viewModel.imageApi,
            serverId: viewModel.item?.serverId,
            scrollController: _trackSectionScrollController(
              castFocusNode,
              ctrl,
            ),
            firstItemFocusNode: castFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: castFocusNode,
              upTarget: chapterFeatureLastNode,
              downTarget: collectionFocusNode ?? similarFocusNode,
              itemCount: viewModel.actors.length,
            ),
          ),
        ),
      ],
      if (viewModel.parentCollectionItems.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: viewModel.parentCollectionName ?? l10n.collection,
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.parentCollectionItems,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              collectionFocusNode,
              ctrl,
            ),
            firstItemFocusNode: collectionFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: collectionFocusNode,
              upTarget: collectionUpTarget,
              downTarget: similarFocusNode,
              itemCount: viewModel.parentCollectionItems.length,
            ),
          ),
        ),
      ],
      if (viewModel.similar.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.moreLikeThis,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.similar,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              similarFocusNode,
              ctrl,
            ),
            firstItemFocusNode: similarFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: similarFocusNode,
              upTarget:
                  collectionFocusNode ??
                  castFocusNode ??
                  chapterFeatureLastNode,
              itemCount: viewModel.similar.length,
              consumeDownWhenNoTarget: true,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  List<Widget> _buildSeriesContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final hasSeasons = viewModel.seasons.isNotEmpty;
    final hasCast = viewModel.actors.isNotEmpty;
    final hasSimilar = viewModel.similar.isNotEmpty;
    final hasNextUp = viewModel.nextUp != null;
    final seriesNextUpFocusNode = hasNextUp ? _seriesNextUpFocusNode : null;
    final seasonsFocusNode = hasSeasons
        ? _sectionFocusNode('detailSeriesSeasons')
        : null;
    final castFocusNode = hasCast
        ? _sectionFocusNode('detailSeriesCast')
        : null;
    final similarFocusNode = hasSimilar
        ? _sectionFocusNode('detailSeriesSimilar')
        : null;
    final actionButtonsFocusNode =
        widget.initialFocusNode ?? _sectionFocusNode('detailActionButtons');
    final overviewFocusNode = _headerOverviewFocusNode(item);
    final metadataFocusNode = _hasMetadata(item)
        ? _sectionFocusNode('detailSeriesMetadata')
        : null;
    final seriesDownTarget =
        seriesNextUpFocusNode ??
        seasonsFocusNode ??
        castFocusNode ??
        similarFocusNode;

    return [
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: actionButtonsFocusNode,
        upTarget: overviewFocusNode,
        onRequestFocus: _requestSectionFocus,
        downTarget: metadataFocusNode ?? seriesDownTarget,
        autoPlay: widget.autoPlay,
      ),
      if (_hasMetadata(item)) ...[
        const SizedBox(height: 24),
        DetailMetadataSection(
          viewModel: viewModel,
          firstItemFocusNode: metadataFocusNode,
          upTarget: actionButtonsFocusNode,
          downTarget: seriesDownTarget,
          onRequestFocus: _requestSectionFocus,
        ),
      ],
      if (hasNextUp) ...[
        const SizedBox(height: 32),
        Text(
          l10n.nextUp,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.bold,
            shadows: _textShadows,
            fontSize: _isCompact(context) ? 17 : null,
          ),
        ),
        const SizedBox(height: 12),
        DetailNextUpCard(
          episode: viewModel.nextUp!,
          imageApi: viewModel.imageApi,
          focusNode: seriesNextUpFocusNode,
          onKeyEvent: (event) {
            if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
              return KeyEventResult.ignored;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              if (event is KeyDownEvent) {
                _tryFocusSidebar();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              return _requestSectionFocus(
                metadataFocusNode ?? actionButtonsFocusNode,
              );
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              return _requestSectionFocus(
                seasonsFocusNode ?? castFocusNode ?? similarFocusNode,
              );
            }
            return KeyEventResult.ignored;
          },
        ),
      ],
      if (hasSeasons) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.seasons,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailSeasonsRow(
            seasons: viewModel.seasons,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              seasonsFocusNode,
              ctrl,
            ),
            firstItemFocusNode: seasonsFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: seasonsFocusNode,
              upTarget:
                  seriesNextUpFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              downTarget: castFocusNode ?? similarFocusNode,
              itemCount: viewModel.seasons.length,
            ),
          ),
        ),
      ],
      if (hasCast) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.cast,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailCastRow(
            people: viewModel.actors,
            imageApi: viewModel.imageApi,
            serverId: viewModel.item?.serverId,
            scrollController: _trackSectionScrollController(
              castFocusNode,
              ctrl,
            ),
            firstItemFocusNode: castFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: castFocusNode,
              upTarget:
                  seasonsFocusNode ??
                  seriesNextUpFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              downTarget: similarFocusNode,
              itemCount: viewModel.actors.length,
            ),
          ),
        ),
      ],
      if (hasSimilar) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.moreLikeThis,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.similar,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              similarFocusNode,
              ctrl,
            ),
            firstItemFocusNode: similarFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: similarFocusNode,
              upTarget:
                  castFocusNode ??
                  seasonsFocusNode ??
                  seriesNextUpFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              itemCount: viewModel.similar.length,
              consumeDownWhenNoTarget: true,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  List<Widget> _buildSeasonContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    return [
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: _sectionFocusNode('detailActionButtons'),
        upTarget: _headerOverviewFocusNode(item),
        onRequestFocus: _requestSectionFocus,
        autoPlay: widget.autoPlay,
      ),
      if (viewModel.episodes.isNotEmpty) ...[
        const SizedBox(height: 32),
        _SectionHeader(title: l10n.episodes),
        const SizedBox(height: 12),
        ...viewModel.episodes.map(
          (ep) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DetailEpisodeCard(
              episode: ep,
              imageApi: viewModel.imageApi,
              onChanged: () => viewModel.load(),
              isActive: viewModel.nextUp?.id == ep.id,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  List<Widget> _buildEpisodeContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final hasChapters = item.chapters.isNotEmpty;
    final hasFeatures = viewModel.features.isNotEmpty;
    final hasSeasonEpisodes = viewModel.episodes.isNotEmpty;
    final hasCast = viewModel.actors.isNotEmpty;
    final hasSimilar = viewModel.similar.isNotEmpty;
    final episodesFocusNode = hasSeasonEpisodes
        ? _sectionFocusNode('detailEpisodeSeasonEpisodes')
        : null;
    final castFocusNode = hasCast
        ? _sectionFocusNode('detailEpisodeCast')
        : null;
    final similarFocusNode = hasSimilar
        ? _sectionFocusNode('detailEpisodeSimilar')
        : null;
    final actionButtonsFocusNode =
        widget.initialFocusNode ?? _sectionFocusNode('detailActionButtons');
    final overviewFocusNode = _headerOverviewFocusNode(item);
    final currentEpisodeIndex = viewModel.episodes.indexWhere(
      (ep) => ep.id == item.id,
    );
    final nextEpisode =
        (currentEpisodeIndex >= 0 &&
            currentEpisodeIndex < viewModel.episodes.length - 1)
        ? viewModel.episodes[currentEpisodeIndex + 1]
        : null;
    final nextEpisodeFocusNode = nextEpisode != null
        ? _nextEpisodeFocusNode
        : null;
    final metadataFocusNode = _hasMetadata(item)
        ? _sectionFocusNode('detailEpisodeMetadata')
        : null;
    final chapterFeatureNextNode =
        nextEpisodeFocusNode ??
        episodesFocusNode ??
        castFocusNode ??
        similarFocusNode;
    final episodeDownTarget = hasChapters
        ? _firstChapterFocusNode
        : (hasFeatures ? _firstFeatureFocusNode : chapterFeatureNextNode);
    final chapterFeatureLastNode = hasFeatures
        ? _firstFeatureFocusNode
        : (hasChapters
              ? _firstChapterFocusNode
              : (metadataFocusNode ?? actionButtonsFocusNode));

    return [
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: actionButtonsFocusNode,
        upTarget: overviewFocusNode,
        onRequestFocus: _requestSectionFocus,
        downTarget: metadataFocusNode ?? episodeDownTarget,
        autoPlay: widget.autoPlay,
      ),
      if (_hasMetadata(item)) ...[
        const SizedBox(height: 24),
        DetailMetadataSection(
          viewModel: viewModel,
          firstItemFocusNode: metadataFocusNode,
          upTarget: actionButtonsFocusNode,
          downTarget: episodeDownTarget,
          onRequestFocus: _requestSectionFocus,
        ),
      ],
      ..._buildChapterAndFeatureSections(
        context,
        item,
        selectedMediaSourceId: selectedMediaSourceId,
        prevSectionFocusNode: metadataFocusNode ?? actionButtonsFocusNode,
        nextSectionFocusNode: chapterFeatureNextNode,
      ),
      if (nextEpisode != null) ...[
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.nextEpisode,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                      ? AppColorScheme.onSurface
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: _textShadows,
                  fontSize: _isCompact(context) ? 17 : null,
                ),
              ),
              DetailNextUpCard(
                episode: nextEpisode,
                imageApi: viewModel.imageApi,
                focusNode: nextEpisodeFocusNode,
                onKeyEvent: (event) {
                  if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                    return KeyEventResult.ignored;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    if (event is KeyDownEvent) {
                      _tryFocusSidebar();
                      return KeyEventResult.handled;
                    }
                    return KeyEventResult.ignored;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    return KeyEventResult.handled;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    return _requestSectionFocus(chapterFeatureLastNode);
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    return _requestSectionFocus(episodesFocusNode);
                  }
                  return KeyEventResult.ignored;
                },
              ),
            ],
          ),
        ),
      ],
      if (hasSeasonEpisodes) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.moreFromThisSeason,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => _EpisodesRow(
            episodes: viewModel.episodes,
            currentEpisodeId: item.id,
            imageApi: viewModel.imageApi,
            onChanged: () => viewModel.load(),
            scrollController: _trackSectionScrollController(
              episodesFocusNode,
              ctrl,
            ),
            firstItemFocusNode: episodesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: episodesFocusNode,
              upTarget: nextEpisodeFocusNode ?? chapterFeatureLastNode,
              downTarget: castFocusNode ?? similarFocusNode,
              itemCount: viewModel.episodes.length,
            ),
          ),
        ),
      ],
      if (hasCast) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.cast,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailCastRow(
            people: viewModel.actors,
            imageApi: viewModel.imageApi,
            serverId: viewModel.item?.serverId,
            scrollController: _trackSectionScrollController(
              castFocusNode,
              ctrl,
            ),
            firstItemFocusNode: castFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: castFocusNode,
              upTarget:
                  episodesFocusNode ??
                  nextEpisodeFocusNode ??
                  chapterFeatureLastNode,
              downTarget: similarFocusNode,
              itemCount: viewModel.actors.length,
            ),
          ),
        ),
      ],
      if (hasSimilar) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.moreLikeThis,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.similar,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              similarFocusNode,
              ctrl,
            ),
            firstItemFocusNode: similarFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: similarFocusNode,
              upTarget:
                  castFocusNode ?? episodesFocusNode ?? chapterFeatureLastNode,
              itemCount: viewModel.similar.length,
              consumeDownWhenNoTarget: true,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  Future<void> _playFromChapter(
    BuildContext context,
    AggregatedItem item,
    Duration startPosition,
    String? mediaSourceId,
  ) async {
    final manager = GetIt.instance<PlaybackManager>();
    final forceTranscode = await _shouldForceTranscodeForDolbyVisionQueue(
      context,
      [item],
      mediaSourceId: mediaSourceId,
    );
    if (!context.mounted) return;
    final started = await _runWithDolbyVisionStartupFallbackPrompt(
      context,
      manager,
      () => manager.playItems(
        [item],
        startPosition: startPosition,
        mediaSourceId: mediaSourceId,
        enableDirectPlay: !forceTranscode,
        enableDirectStream: !forceTranscode,
      ),
    );
    if (!started || !context.mounted) return;

    final destination = manager.playbackDeferredToExternalPlayer
        ? Destinations.externalPlayer
        : Destinations.videoPlayer;
    unawaited(context.push(destination));
  }

  List<Widget> _buildChapterAndFeatureSections(
    BuildContext context,
    AggregatedItem item, {
    String? selectedMediaSourceId,
    FocusNode? prevSectionFocusNode,
    FocusNode? nextSectionFocusNode,
  }) {
    final l10n = AppLocalizations.of(context);
    final hasChapters = item.chapters.isNotEmpty;
    final hasFeatures = viewModel.features.isNotEmpty;
    final chapterDownTarget = hasFeatures
        ? _firstFeatureFocusNode
        : nextSectionFocusNode;
    final featureUpTarget = hasChapters ? _firstChapterFocusNode : null;

    return [
      if (hasChapters) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.chapters,
          builder: (_, ctrl) => DetailChaptersRow(
            item: item,
            imageApi: viewModel.imageApi,
            onPlayFromChapter: (position) => unawaited(
              _playFromChapter(context, item, position, selectedMediaSourceId),
            ),
            scrollController: _trackSectionScrollController(
              _firstChapterFocusNode,
              ctrl,
            ),
            firstItemFocusNode: _firstChapterFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: _firstChapterFocusNode,
              upTarget: prevSectionFocusNode,
              downTarget: chapterDownTarget,
              itemCount: item.chapters.length,
            ),
          ),
        ),
      ],
      if (hasFeatures) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.features,
          builder: (_, ctrl) => DetailFeaturesRow(
            items: viewModel.features,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              _firstFeatureFocusNode,
              ctrl,
            ),
            firstItemFocusNode: _firstFeatureFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: _firstFeatureFocusNode,
              upTarget: featureUpTarget ?? prevSectionFocusNode,
              downTarget: nextSectionFocusNode,
              itemCount: viewModel.features.length,
            ),
          ),
        ),
      ],
    ];
  }

  List<Widget> _buildPersonContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final sortOpt = widget.prefs.get(UserPreferences.personPageSortOption);
    final groupOpt = widget.prefs.get(UserPreferences.personPageGroupItems);

    List<AggregatedItem> sortJellyfinItems(List<AggregatedItem> list) {
      final sorted = List<AggregatedItem>.from(list);
      if (sortOpt == 'alphabetical') {
        sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      } else {
        final asc = sortOpt == 'releaseDateAsc';
        sorted.sort((a, b) {
          final dateA = a.premiereDate ?? (a.productionYear != null ? DateTime(a.productionYear!) : null);
          final dateB = b.premiereDate ?? (b.productionYear != null ? DateTime(b.productionYear!) : null);
          if (dateA == null && dateB == null) {
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());
          }
          if (dateA == null) return 1;
          if (dateB == null) return -1;
          final comp = dateA.compareTo(dateB);
          return asc ? comp : -comp;
        });
      }
      return sorted;
    }

    List<SeerrDiscoverItem> groupSeerrItems(List<SeerrDiscoverItem> list, bool isCrew) {
      if (!groupOpt) return list;
      final grouped = <int, List<SeerrDiscoverItem>>{};
      for (final item in list) {
        grouped.putIfAbsent(item.id, () => []).add(item);
      }

      final result = <SeerrDiscoverItem>[];
      for (final entries in grouped.values) {
        final first = entries.first;
        if (entries.length == 1) {
          result.add(first);
          continue;
        }

        if (isCrew) {
          final jobs = entries
              .map((e) => e.job ?? e.department)
              .where((j) => j != null && j.isNotEmpty)
              .map((j) => j!)
              .toSet();
          final combinedJobs = jobs.join(', ');
          result.add(SeerrDiscoverItem(
            id: first.id,
            mediaType: first.mediaType,
            title: first.title,
            name: first.name,
            originalTitle: first.originalTitle,
            originalName: first.originalName,
            posterPath: first.posterPath,
            backdropPath: first.backdropPath,
            overview: first.overview,
            releaseDate: first.releaseDate,
            firstAirDate: first.firstAirDate,
            originalLanguage: first.originalLanguage,
            genreIds: first.genreIds,
            voteAverage: first.voteAverage,
            voteCount: first.voteCount,
            popularity: first.popularity,
            adult: first.adult,
            mediaInfo: first.mediaInfo,
            character: first.character,
            job: combinedJobs.isNotEmpty ? combinedJobs : null,
            department: first.department,
          ));
        } else {
          final characters = entries
              .map((e) => e.character)
              .where((c) => c != null && c.isNotEmpty)
              .map((c) => c!)
              .toSet();
          final combinedCharacters = characters.join(', ');
          result.add(SeerrDiscoverItem(
            id: first.id,
            mediaType: first.mediaType,
            title: first.title,
            name: first.name,
            originalTitle: first.originalTitle,
            originalName: first.originalName,
            posterPath: first.posterPath,
            backdropPath: first.backdropPath,
            overview: first.overview,
            releaseDate: first.releaseDate,
            firstAirDate: first.firstAirDate,
            originalLanguage: first.originalLanguage,
            genreIds: first.genreIds,
            voteAverage: first.voteAverage,
            voteCount: first.voteCount,
            popularity: first.popularity,
            adult: first.adult,
            mediaInfo: first.mediaInfo,
            character: combinedCharacters.isNotEmpty ? combinedCharacters : null,
            job: first.job,
            department: first.department,
          ));
        }
      }
      return result;
    }

    List<SeerrDiscoverItem> sortSeerrItems(List<SeerrDiscoverItem> list) {
      final sorted = List<SeerrDiscoverItem>.from(list);
      if (sortOpt == 'alphabetical') {
        sorted.sort((a, b) => a.displayTitle.toLowerCase().compareTo(b.displayTitle.toLowerCase()));
      } else {
        final asc = sortOpt == 'releaseDateAsc';
        sorted.sort((a, b) {
          final dateStrA = a.releaseDate ?? a.firstAirDate;
          final dateStrB = b.releaseDate ?? b.firstAirDate;
          if (dateStrA == null && dateStrB == null) {
            return a.displayTitle.toLowerCase().compareTo(b.displayTitle.toLowerCase());
          }
          if (dateStrA == null) return 1;
          if (dateStrB == null) return -1;
          final dateA = DateTime.tryParse(dateStrA);
          final dateB = DateTime.tryParse(dateStrB);
          if (dateA == null && dateB == null) {
            return dateStrA.compareTo(dateStrB);
          }
          if (dateA == null) return 1;
          if (dateB == null) return -1;
          final comp = dateA.compareTo(dateB);
          return asc ? comp : -comp;
        });
      }
      return sorted;
    }

    final movies = sortJellyfinItems(viewModel.filmographyMovies);
    final series = sortJellyfinItems(viewModel.filmographySeries);
    final musicVideos = sortJellyfinItems(viewModel.filmographyMusicVideos);
    final useSplit = _useDesktopDetailLayout(context);

    final favoriteFocusNode =
        initialFocusNode ?? _sectionFocusNode('detailPersonFavorite');
    final displayFocusNode = _sectionFocusNode('detailPersonDisplayButton');
    final bioFocusNode = _sectionFocusNode('detailPersonBio');
    final firstFocus = bioFocusNode;
    final hasBio = item.overview != null && item.overview!.isNotEmpty;

    final hasSeerrButton =
        item.tmdbId != null &&
        item.tmdbId!.isNotEmpty &&
        GetIt.instance<PluginSyncService>().seerrAvailable;
    final seerrFocusNode = hasSeerrButton
        ? _sectionFocusNode('detailPersonSeerrButton')
        : null;

    final moviesFocusNode = movies.isNotEmpty
        ? _sectionFocusNode('detailPersonMovies')
        : null;
    final seriesFocusNode = series.isNotEmpty
        ? _sectionFocusNode('detailPersonSeries')
        : null;
    final guestAppearances = sortJellyfinItems(viewModel.filmographyEpisodes.where((episode) {
      final sId = episode.seriesId;
      if (sId == null || sId.isEmpty) return true;
      final isMainCastOfSeries = series.any((s) => s.id == sId);
      return !isMainCastOfSeries;
    }).toList());
    final guestAppearancesFocusNode = guestAppearances.isNotEmpty
        ? _sectionFocusNode('detailPersonGuestAppearances')
        : null;
    final musicVideosFocusNode = musicVideos.isNotEmpty
        ? _sectionFocusNode('detailPersonMusicVideos')
        : null;

    final rawCrew = _seerrCrewCredits;
    final seerrCrewCredits = rawCrew != null
        ? sortSeerrItems(groupSeerrItems(rawCrew, true))
        : null;
    final hasSeerrCrewCredits =
        seerrCrewCredits != null && seerrCrewCredits.isNotEmpty;
    final seerrCrewCreditsFocusNode = hasSeerrCrewCredits
        ? _sectionFocusNode('detailPersonSeerrCrewCredits')
        : null;

    final rawAppearances = _seerrAppearances;
    final seerrAppearances = rawAppearances != null
        ? sortSeerrItems(groupSeerrItems(rawAppearances, false))
        : null;
    final hasSeerrAppearances =
        seerrAppearances != null && seerrAppearances.isNotEmpty;
    final seerrAppearancesFocusNode = hasSeerrAppearances
        ? _sectionFocusNode('detailPersonSeerrAppearances')
        : null;

    return [
      if (!useSplit) ...[
        PersonHeader(item: item, imageApi: viewModel.imageApi),
        const SizedBox(height: 12),
      ],
      if (hasBio) ...[
        const SizedBox(height: 24),
        ExpandableBiography(
          text: item.overview!,
          toggleFocusNode: firstFocus,
          upTarget: null,
          onArrowUp: _tryFocusNavbar,
          onArrowDown: () {
            _requestSectionFocus(favoriteFocusNode);
          },
          onArrowLeft: () {
            _tryFocusSidebar();
          },
          onCollapse: () => setState(() {}),
        ),
      ],
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: useSplit
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            _DetailActionButton(
              label: item.isFavorite ? l10n.favorited : l10n.favorite,
              icon: Icons.favorite,
              onPressed: viewModel.toggleFavorite,
              isActive: item.isFavorite,
              activeColor: const Color(0xFFFF4757),
              focusNode: favoriteFocusNode,
              suppressAutoScrollToTop: true,
              onArrowUp: () {
                if (hasBio && firstFocus.canRequestFocus) {
                  _requestSectionFocus(firstFocus);
                } else {
                  _tryFocusNavbar();
                }
              },
              onArrowDown: () {
                _requestSectionFocus(
                  moviesFocusNode ??
                      seriesFocusNode ??
                      musicVideosFocusNode ??
                      seerrCrewCreditsFocusNode ??
                      seerrAppearancesFocusNode,
                );
              },
              onArrowRight: () {
                _requestSectionFocus(displayFocusNode);
              },
              onArrowLeft: () {
                _tryFocusSidebar();
              },
            ),
            const SizedBox(width: 16),
            _DetailActionButton(
              label: l10n.display,
              icon: Icons.tune,
              onPressed: () => _showDisplaySettingsDialog(context),
              isActive: false,
              focusNode: displayFocusNode,
              suppressAutoScrollToTop: true,
              onArrowUp: () {
                if (hasBio && firstFocus.canRequestFocus) {
                  _requestSectionFocus(firstFocus);
                } else {
                  _tryFocusNavbar();
                }
              },
              onArrowDown: () {
                _requestSectionFocus(
                  moviesFocusNode ??
                      seriesFocusNode ??
                      musicVideosFocusNode ??
                      seerrCrewCreditsFocusNode ??
                      seerrAppearancesFocusNode,
                );
              },
              onArrowLeft: () {
                _requestSectionFocus(favoriteFocusNode);
              },
              onArrowRight: hasSeerrButton
                  ? () {
                      _requestSectionFocus(seerrFocusNode);
                    }
                  : () {},
            ),
            if (hasSeerrButton) ...[
              const SizedBox(width: 16),
              _DetailActionButton(
                label: l10n.seerr,
                iconBuilder: (size, color) => SeerrIcon(size: size, color: color),
                onPressed: () {
                  context.push(Destinations.seerrPerson(item.tmdbId!));
                },
                isActive: false,
                focusNode: seerrFocusNode,
                suppressAutoScrollToTop: true,
                onArrowUp: () {
                  if (hasBio && firstFocus.canRequestFocus) {
                    _requestSectionFocus(firstFocus);
                  } else {
                    _tryFocusNavbar();
                  }
                },
                onArrowDown: () {
                  _requestSectionFocus(
                    moviesFocusNode ??
                        seriesFocusNode ??
                        musicVideosFocusNode ??
                        seerrCrewCreditsFocusNode ??
                        seerrAppearancesFocusNode,
                  );
                },
                onArrowLeft: () {
                  _requestSectionFocus(displayFocusNode);
                },
                onArrowRight: () {},
              ),
            ],
          ],
        ),
      ),
      if (movies.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.movies,
          builder: (_, ctrl) => FilmographyRow(
            items: movies,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              moviesFocusNode,
              ctrl,
            ),
            firstFocusNode: moviesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: moviesFocusNode,
              upTarget: favoriteFocusNode,
              downTarget:
                  seriesFocusNode ??
                  guestAppearancesFocusNode ??
                  musicVideosFocusNode ??
                  seerrCrewCreditsFocusNode ??
                  seerrAppearancesFocusNode,
              itemCount: movies.length,
            ),
          ),
        ),
      ],
      if (series.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.series,
          builder: (_, ctrl) => FilmographyRow(
            items: series,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              seriesFocusNode,
              ctrl,
            ),
            firstFocusNode: seriesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: seriesFocusNode,
              upTarget: moviesFocusNode ?? favoriteFocusNode,
              downTarget:
                  guestAppearancesFocusNode ??
                  musicVideosFocusNode ??
                  seerrCrewCreditsFocusNode ??
                  seerrAppearancesFocusNode,
              itemCount: series.length,
            ),
          ),
        ),
      ],
      if (guestAppearances.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.guestAppearances,
          builder: (_, ctrl) => FilmographyRow(
            items: guestAppearances,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              guestAppearancesFocusNode,
              ctrl,
            ),
            firstFocusNode: guestAppearancesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: guestAppearancesFocusNode,
              upTarget: seriesFocusNode ?? moviesFocusNode ?? favoriteFocusNode,
              downTarget: musicVideosFocusNode ?? seerrCrewCreditsFocusNode ?? seerrAppearancesFocusNode,
              itemCount: guestAppearances.length,
            ),
          ),
        ),
      ],
      if (musicVideos.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.musicVideos,
          builder: (_, ctrl) => FilmographyRow(
            items: musicVideos,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              musicVideosFocusNode,
              ctrl,
            ),
            firstFocusNode: musicVideosFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: musicVideosFocusNode,
              upTarget:
                  guestAppearancesFocusNode ??
                  seriesFocusNode ??
                  moviesFocusNode ??
                  favoriteFocusNode,
              downTarget: seerrCrewCreditsFocusNode ?? seerrAppearancesFocusNode,
              itemCount: musicVideos.length,
              consumeDownWhenNoTarget: !hasSeerrCrewCredits && !hasSeerrAppearances,
            ),
          ),
        ),
      ],
      if (hasSeerrCrewCredits) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.crewContributionsSeerr,
          builder: (_, ctrl) => SeerrCrewCreditsRow(
            items: seerrCrewCredits,
            prefs: prefs,
            scrollController: _trackSectionScrollController(
              seerrCrewCreditsFocusNode,
              ctrl,
            ),
            firstFocusNode: seerrCrewCreditsFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: seerrCrewCreditsFocusNode,
              upTarget:
                  musicVideosFocusNode ??
                  guestAppearancesFocusNode ??
                  seriesFocusNode ??
                  moviesFocusNode ??
                  favoriteFocusNode,
              downTarget: seerrAppearancesFocusNode,
              itemCount: seerrCrewCredits.length,
              consumeDownWhenNoTarget: !hasSeerrAppearances,
            ),
          ),
        ),
      ],
      if (hasSeerrAppearances) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.appearancesSeerr,
          builder: (_, ctrl) => SeerrAppearancesRow(
            items: seerrAppearances,
            prefs: prefs,
            scrollController: _trackSectionScrollController(
              seerrAppearancesFocusNode,
              ctrl,
            ),
            firstFocusNode: seerrAppearancesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: seerrAppearancesFocusNode,
              upTarget:
                  seerrCrewCreditsFocusNode ??
                  musicVideosFocusNode ??
                  guestAppearancesFocusNode ??
                  seriesFocusNode ??
                  moviesFocusNode ??
                  favoriteFocusNode,
              itemCount: seerrAppearances.length,
              consumeDownWhenNoTarget: true,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  void _showDisplaySettingsDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _PersonDisplaySettingsDialog(prefs: widget.prefs),
    );
  }

  List<Widget> _buildArtistContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final hasAlbums = viewModel.albums.isNotEmpty;
    final hasSimilar = viewModel.similar.isNotEmpty;
    final hasOverview = item.overview != null && item.overview!.isNotEmpty;
    final overviewFocusNode = hasOverview
        ? _sectionFocusNode('detailArtistOverview')
        : null;
    final albumsFocusNode = hasAlbums
        ? _sectionFocusNode('detailArtistAlbums')
        : null;
    final similarFocusNode = hasSimilar
        ? _sectionFocusNode('detailArtistSimilar')
        : null;

    return [
      _ArtistHeader(item: item, imageApi: viewModel.imageApi),
      const SizedBox(height: 16),
      _AlbumActions(
        item: item,
        tracks: viewModel.tracks,
        playFocusNode: widget.initialFocusNode,
        showAddToPlaylist: false,
        onPlayDown: () {
          _requestSectionFocus(overviewFocusNode ?? albumsFocusNode);
        },
      ),
      if (hasOverview) ...[
        const SizedBox(height: 24),
        _OverviewText(
          text: item.overview!,
          focusNode: overviewFocusNode,
          onArrowUp: () => _requestSectionFocus(widget.initialFocusNode),
          onArrowDown: (albumsFocusNode ?? similarFocusNode) != null
              ? () => _requestSectionFocus(albumsFocusNode ?? similarFocusNode)
              : null,
          onArrowLeft: () => _tryFocusSidebar(),
          onCollapse: () => setState(() {}),
        ),
      ],
      if (viewModel.albums.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.discography,
          builder: (_, ctrl) => _AlbumsRow(
            albums: viewModel.albums,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              albumsFocusNode,
              ctrl,
            ),
            firstItemFocusNode: albumsFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: albumsFocusNode,
              downTarget: similarFocusNode,
              itemCount: viewModel.albums.length,
            ),
          ),
        ),
      ],
      if (viewModel.similar.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.similarArtists,
          builder: (_, ctrl) => DetailSimilarRow(
            items: viewModel.similar,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              similarFocusNode,
              ctrl,
            ),
            firstItemFocusNode: similarFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: similarFocusNode,
              upTarget: albumsFocusNode,
              itemCount: viewModel.similar.length,
              consumeDownWhenNoTarget: true,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  List<Widget> _buildAlbumContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final isAudiobook = _isAudiobookCollectionItem(item);
    final isPlaylist = item.type == 'Playlist';
    final canManagePlaylistTracks =
        isPlaylist && viewModel.canManagePlaylistTracks;
    final canDeleteItem = item.canDelete;
    final canDownloadAll =
        _canUserDownload() &&
        (item.type == 'MusicAlbum' ||
            item.type == 'AudioBook' ||
            (item.type == 'Playlist' &&
                viewModel.tracks.isNotEmpty &&
                viewModel.tracks.every(_isAudioItem)));
    final canDeleteDownloaded =
        !PlatformDetection.isTV &&
        (item.type == 'MusicAlbum' || item.type == 'AudioBook');
    return [
      _AlbumHeader(
        item: item,
        imageApi: viewModel.imageApi,
        isAudiobook: isAudiobook,
        onRenameRequested: isPlaylist
            ? () => _showRenamePlaylistDialog(context, item)
            : null,
      ),
      const SizedBox(height: 16),
      _AlbumActions(
        item: item,
        tracks: viewModel.tracks,
        playFocusNode: widget.initialFocusNode ?? _albumPlayFocusNode,
        autofocusPlay: PlatformDetection.isTV,
        onPlayDown: () {
          if (viewModel.tracks.isNotEmpty) {
            final node = _getTrackFocusNode(viewModel.tracks.first.id);
            if (node.canRequestFocus) {
              node.requestFocus();
            }
          }
        },
        showAddToPlaylist: !isPlaylist,
        onDownloadAll: canDownloadAll
            ? () => _downloadTrackList(
                context,
                item.name,
                viewModel.tracks,
                itemLabel: isAudiobook ? 'chapters' : 'tracks',
              )
            : null,
        onDeleteDownloaded: canDeleteDownloaded
            ? () => _confirmDeleteDownloadedAlbum(context, item.name)
            : null,
        onDeletePlaylist: canDeleteItem
            ? () => _confirmDeleteServerItem(context, item)
            : null,
      ),
      if (viewModel.tracks.isNotEmpty) ...[
        const SizedBox(height: 24),
        _SectionHeader(
          title: isPlaylist
              ? l10n.playlist
              : (isAudiobook ? l10n.tableOfContents : l10n.tracklist),
        ),
        const SizedBox(height: 12),
        DetailTrackList(
          tracks: viewModel.tracks,
          getFocusNode: _getTrackFocusNode,
          onFirstTrackUp: () {
            final targetNode = widget.initialFocusNode ?? _albumPlayFocusNode;
            if (!targetNode.canRequestFocus) return;
            targetNode.requestFocus();
          },
          onTrackFocused: onBackdropItemFocused,
          isAudiobook: isAudiobook,
          groupByDisc: item.type == 'MusicAlbum',
          reorderable: canManagePlaylistTracks,
          isPlaylist: isPlaylist,
          imageApi: viewModel.imageApi,
          onPlayTrack: (index) {
            final selectedTrack = viewModel.tracks[index];
            if (isPlaylist && !_isAudioItem(selectedTrack)) {
              context.push(
                Destinations.itemOrPhoto(
                  selectedTrack.id,
                  serverId: selectedTrack.serverId,
                  type: selectedTrack.type,
                ),
              );
              return;
            }
            final manager = GetIt.instance<PlaybackManager>();
            unawaited(() async {
              await manager.playItems(viewModel.tracks, startIndex: index);
              if (!context.mounted) return;
              final isAudio = viewModel.tracks.every(_isAudioItem);
              context.push(
                isAudio ? Destinations.audioPlayer : Destinations.videoPlayer,
              );
            }());
          },
          onReorder: canManagePlaylistTracks
              ? (oldIndex, newIndex) {
                  var target = newIndex;
                  if (target > oldIndex) {
                    target -= 1;
                  }
                  viewModel.reorderPlaylistTrack(oldIndex, target);
                }
              : null,
          onRemoveFromPlaylist: canManagePlaylistTracks
              ? (track) => viewModel.removeTrackFromPlaylist(track)
              : null,
          onMoveUp: canManagePlaylistTracks
              ? (index) => viewModel.reorderPlaylistTrack(index, index - 1)
              : null,
          onMoveDown: canManagePlaylistTracks
              ? (index) => viewModel.reorderPlaylistTrack(index, index + 1)
              : null,
        ),
        SizedBox(
          height: PlatformDetection.isTV
              ? MediaQuery.of(context).size.height * 0.2
              : 0,
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  bool _isAudioItem(AggregatedItem item) {
    final mediaType = item.rawData['MediaType'] as String?;
    return item.type == 'Audio' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
  }

  void _downloadTrackList(
    BuildContext context,
    String title,
    List<AggregatedItem> tracks, {
    String itemLabel = 'items',
  }) {
    final l10n = AppLocalizations.of(context);
    if (tracks.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.noItemsLoaded(itemLabel))));
      return;
    }

    GetIt.instance<DownloadService>().downloadItems(tracks);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.downloadingTitle(title, tracks.length)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _confirmDeleteDownloadedAlbum(
    BuildContext context,
    String title,
  ) async {
    final l10n = AppLocalizations.of(context);
    final tracks = viewModel.tracks.where(_isAudioItem).toList(growable: false);
    if (tracks.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.noTracksLoaded)));
      return;
    }

    final ok = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF171717),
        title: Text(
          l10n.deleteDownloadedAlbum,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          l10n.deleteDownloadedTracksMessage(title),
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.cancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;

    final success = await GetIt.instance<DownloadService>()
        .deleteDownloadedItems(tracks);
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? l10n.downloadedTracksDeleted
              : l10n.downloadedTracksDeleteFailed,
        ),
      ),
    );
  }

  Future<void> _confirmDeleteServerItem(
    BuildContext context,
    AggregatedItem item,
  ) async {
    final l10n = AppLocalizations.of(context);
    final isPlaylist = item.type == 'Playlist';
    final confirmed = await _showDeleteConfirmationDialog(
      context,
      title: isPlaylist ? l10n.deletePlaylist : l10n.deleteItem,
      message: isPlaylist ? l10n.deletePlaylistMessage : l10n.deleteItemMessage,
    );
    if (!confirmed) return;

    final success = await viewModel.deleteItem();
    if (!context.mounted) return;
    if (success) {
      context.pop(true);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isPlaylist ? l10n.failedToDeletePlaylist : l10n.failedToDeleteItem,
        ),
      ),
    );
  }

  Future<void> _showRenamePlaylistDialog(
    BuildContext context,
    AggregatedItem item,
  ) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: item.name);
    final newName = await showFocusRestoringDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF171717),
        title: Text(
          l10n.renamePlaylist,
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: l10n.playlistName),
          onSubmitted: (_) => Navigator.pop(ctx, controller.text.trim()),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              l10n.cancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    controller.dispose();
    if (newName == null || newName.isEmpty || newName == item.name) return;
    await viewModel.renamePlaylist(newName);
  }

  void _showItemContextMenu(AggregatedItem item) {
    unawaited(
      showContextMenu(
        context,
        item,
        onChanged: () {
          if (!mounted) return;
          setState(() {});
        },
      ),
    );
  }

  List<Widget> _buildBoxSetContent(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    int releaseSort(AggregatedItem a, AggregatedItem b) {
      final aDate =
          a.premiereDate ??
          (a.productionYear != null ? DateTime(a.productionYear!) : null);
      final bDate =
          b.premiereDate ??
          (b.productionYear != null ? DateTime(b.productionYear!) : null);
      if (aDate == null && bDate == null) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }
      if (aDate == null) return 1;
      if (bDate == null) return -1;
      final byDate = aDate.compareTo(bDate);
      if (byDate != 0) return byDate;
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    }

    final movies =
        viewModel.collectionItems.where((i) => i.type == 'Movie').toList()
          ..sort(releaseSort);
    final series =
        viewModel.collectionItems.where((i) => i.type == 'Series').toList()
          ..sort(releaseSort);
    final other =
        viewModel.collectionItems
            .where((i) => i.type != 'Movie' && i.type != 'Series')
            .toList()
          ..sort(releaseSort);
    final actionButtonsFocusNode = _sectionFocusNode(
      'detailBoxSetActionButtons',
    );
    final firstFocus = initialFocusNode ?? actionButtonsFocusNode;
    final moviesFocusNode = movies.isNotEmpty
        ? _sectionFocusNode('detailBoxSetMovies')
        : null;
    final seriesFocusNode = series.isNotEmpty
        ? _sectionFocusNode('detailBoxSetSeries')
        : null;
    final otherFocusNode = other.isNotEmpty
        ? _sectionFocusNode('detailBoxSetOther')
        : null;
    final castFocusNode = viewModel.actors.isNotEmpty
        ? _sectionFocusNode('detailBoxSetCast')
        : null;
    final metadataFocusNode = _hasMetadata(item)
        ? _sectionFocusNode('detailBoxSetMetadata')
        : null;
    final boxSetDownTarget =
        moviesFocusNode ?? seriesFocusNode ?? otherFocusNode ?? castFocusNode;

    return [
      if (!_hasMetadata(item)) _NavbarFocusPoint(focusNode: firstFocus),
      DetailActionButtons(
        viewModel: viewModel,
        itemId: viewModel.item?.id,
        selectedMediaSourceId: selectedMediaSourceId,
        onSelectedMediaSourceChanged: onSelectedMediaSourceChanged,
        tvPlayFocusNode: actionButtonsFocusNode,
        onRequestFocus: _requestSectionFocus,
        downTarget: metadataFocusNode ?? boxSetDownTarget,
        autoPlay: widget.autoPlay,
      ),
      if (_hasMetadata(item)) ...[
        const SizedBox(height: 24),
        DetailMetadataSection(
          viewModel: viewModel,
          firstItemFocusNode: metadataFocusNode,
          upTarget: actionButtonsFocusNode,
          downTarget: boxSetDownTarget,
          onRequestFocus: _requestSectionFocus,
        ),
      ],
      if (movies.isNotEmpty) ...[
        const SizedBox(height: 8),
        HorizontalScrollSection(
          title: l10n.movies,
          builder: (_, ctrl) => DetailSimilarRow(
            items: movies,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              moviesFocusNode,
              ctrl,
            ),
            firstItemFocusNode: moviesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: moviesFocusNode,
              upTarget: metadataFocusNode ?? actionButtonsFocusNode,
              downTarget: seriesFocusNode ?? otherFocusNode ?? castFocusNode,
              itemCount: movies.length,
            ),
          ),
        ),
      ],
      if (series.isNotEmpty) ...[
        SizedBox(height: movies.isEmpty ? 8 : 32),
        HorizontalScrollSection(
          title: l10n.series,
          builder: (_, ctrl) => DetailSimilarRow(
            items: series,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              seriesFocusNode,
              ctrl,
            ),
            firstItemFocusNode: seriesFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: seriesFocusNode,
              upTarget:
                  moviesFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              downTarget: otherFocusNode ?? castFocusNode,
              itemCount: series.length,
            ),
          ),
        ),
      ],
      if (other.isNotEmpty) ...[
        SizedBox(height: (movies.isEmpty && series.isEmpty) ? 8 : 32),
        HorizontalScrollSection(
          title: l10n.other,
          builder: (_, ctrl) => DetailSimilarRow(
            items: other,
            imageApi: viewModel.imageApi,
            prefs: prefs,
            onItemLongPress: _showItemContextMenu,
            scrollController: _trackSectionScrollController(
              otherFocusNode,
              ctrl,
            ),
            firstItemFocusNode: otherFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: otherFocusNode,
              upTarget:
                  seriesFocusNode ??
                  moviesFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              downTarget: castFocusNode,
              itemCount: other.length,
            ),
          ),
        ),
      ],
      if (viewModel.actors.isNotEmpty) ...[
        const SizedBox(height: 32),
        HorizontalScrollSection(
          title: l10n.cast,
          titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                ? AppColorScheme.onSurface
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          builder: (_, ctrl) => DetailCastRow(
            people: viewModel.actors,
            imageApi: viewModel.imageApi,
            serverId: viewModel.item?.serverId,
            scrollController: _trackSectionScrollController(
              castFocusNode,
              ctrl,
            ),
            firstItemFocusNode: castFocusNode,
            onItemKeyEvent: _buildVerticalRowHandler(
              sourceFocusNode: castFocusNode,
              upTarget:
                  otherFocusNode ??
                  seriesFocusNode ??
                  moviesFocusNode ??
                  metadataFocusNode ??
                  actionButtonsFocusNode,
              itemCount: viewModel.actors.length,
            ),
          ),
        ),
      ],
      const SizedBox(height: 48),
    ];
  }

  bool _hasMetadata(AggregatedItem item) {
    return item.type == 'BoxSet' ||
        viewModel.directors.isNotEmpty ||
        viewModel.writers.isNotEmpty ||
        item.studios.isNotEmpty;
  }
}

class _Backdrop extends StatelessWidget {
  final String? url;
  final double blurAmount;

  const _Backdrop({this.url, required this.blurAmount});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FullscreenBackdropSwitcher(
        imageUrl: url,
        duration: BackgroundService.transitionDuration,
        imageBuilder: (imageUrl) => _blurredImage(imageUrl, blurAmount),
      ),
    );
  }

  Widget _blurredImage(String imageUrl, double blur) {
    final blurred = blur > 0;
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      fadeInDuration: Duration.zero,
      memCacheWidth: blurred ? 640 : null,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
    if (!blurred) return image;
    return RepaintBoundary(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
          tileMode: TileMode.decal,
        ),
        child: image,
      ),
    );
  }
}

class _GradientScrim extends StatelessWidget {
  const _GradientScrim();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xCC000000), Color(0x66000000), Color(0xCC000000)],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final Map<String, dynamic>? selectedMediaSource;
  final FocusNode? overviewFocusNode;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onCollapseBiography;

  const _HeaderSection({
    required this.viewModel,
    required this.prefs,
    this.selectedMediaSource,
    this.overviewFocusNode,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onCollapseBiography,
  });

  @override
  Widget build(BuildContext context) {
    final item = viewModel.item!;
    final imageApi = viewModel.imageApi;
    final isEpisode = item.type == 'Episode';
    final useDesktopLayout = _useDesktopDetailLayout(context);
    final isMobile = !useDesktopLayout;
    final mediaType = item.rawData['MediaType'] as String?;
    final isMusicItem = item.type == 'Audio' || mediaType == 'Audio';
    final showLyrics =
        useDesktopLayout && isMusicItem && viewModel.lyrics.isNotEmpty;
    final isCollection = item.type == 'BoxSet';

    final infoColumn = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isEpisode && item.seriesName != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Wrap(
              alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                Text(
                  item.seriesName!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                    shadows: _textShadows,
                    fontSize: isMobile ? 14 : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.parentIndexNumber != null && item.indexNumber != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'S${item.parentIndexNumber}E${item.indexNumber}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (!isEpisode && item.logoImageTag != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: isMobile
                ? Center(
                    child: LogoView(
                      imageUrl: imageApi.getLogoImageUrl(
                        item.id,
                        maxWidth: 240,
                        tag: item.logoImageTag,
                      ),
                      maxHeight: 56,
                      maxWidth: 240,
                    ),
                  )
                : LogoView(
                    imageUrl: imageApi.getLogoImageUrl(
                      item.id,
                      maxWidth: 350,
                      tag: item.logoImageTag,
                    ),
                    maxHeight: 80,
                    maxWidth: 350,
                  ),
          )
        else
          Text(
            item.name,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: _textShadows,
              fontSize: isMobile ? 24 : null,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: isMobile ? TextAlign.center : null,
          ),
        const SizedBox(height: 8),
        DetailMetadataRow(item: item, selectedMediaSource: selectedMediaSource),
        if (viewModel.ratings.isNotEmpty ||
            item.communityRating != null ||
            item.criticRating != null) ...[
          const SizedBox(height: 8),
          RatingsRow(
            ratings: viewModel.ratings,
            communityRating: item.communityRating,
            criticRating: item.criticRating,
            enableAdditionalRatings: prefs.get(
              UserPreferences.enableAdditionalRatings,
            ),
            enabledRatings: prefs.get(UserPreferences.enabledRatings),
            showLabels: prefs.get(UserPreferences.showRatingLabels),
            showBadges: prefs.get(UserPreferences.showRatingBadges),
          ),
        ],
        if (item.tagline != null) ...[
          const SizedBox(height: 6),
          Text(
            item.tagline!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                  ? AppColorScheme.accent
                  : Colors.white.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
              shadows: _textShadows,
              fontSize: isMobile ? 13 : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: isMobile ? TextAlign.center : null,
          ),
        ],
        if (item.overview != null && item.overview!.isNotEmpty) ...[
          const SizedBox(height: 8),
          _OverviewText(
            text: item.overview!,
            focusNode: overviewFocusNode,
            onArrowUp: onArrowUp,
            onArrowDown: onArrowDown,
            onArrowLeft: onArrowLeft,
            onCollapse: onCollapseBiography,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                  ? AppColorScheme.onSurface
                  : Colors.white.withValues(alpha: 0.8),
              shadows: _textShadows,
              height: 1.4,
              fontSize: isMobile ? 13 : null,
            ),
            textAlign: isMobile ? TextAlign.center : null,
          ),
        ],
      ],
    );

    final posterWidget = isEpisode
        ? _EpisodeThumbnail(item: item, imageApi: imageApi)
        : DetailPosterImage(item: item, imageApi: imageApi);

    final safeTop = MediaQuery.of(context).padding.top;

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, safeTop + 60, 16, 12),
        child: Column(
          children: [posterWidget, const SizedBox(height: 16), infoColumn],
        ),
      );
    }

    if (showLyrics) {
      return Padding(
        padding: EdgeInsets.fromLTRB(48, safeTop + 80, 48, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            posterWidget,
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoColumn,
                  const SizedBox(height: 16),
                  _LyricsPanel(lyrics: viewModel.lyrics),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
        48,
        safeTop + (isCollection ? 96 : 80),
        48,
        isCollection ? 0 : 16,
      ),
      child: Row(
        crossAxisAlignment: isCollection
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Expanded(child: infoColumn),
          const SizedBox(width: 32),
          posterWidget,
        ],
      ),
    );
  }
}

class _LyricsPanel extends StatelessWidget {
  final LyricsData lyrics;

  const _LyricsPanel({required this.lyrics});

  @override
  Widget build(BuildContext context) {
    final lines = lyrics.lines
        .map((line) => line.text.trim())
        .where((line) => line.isNotEmpty)
        .toList(growable: false);
    if (lines.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 280),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.cardBorder.copyWith(
            color: Colors.white.withValues(alpha: 0.14),
          ),
        ),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Text(
            lines.join('\n'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.45,
              shadows: _textShadows,
            ),
          ),
        ),
      ),
    );
  }
}

class _DownloadedBadge extends StatefulWidget {
  final String itemId;
  const _DownloadedBadge({required this.itemId});

  @override
  State<_DownloadedBadge> createState() => _DownloadedBadgeState();
}

class _DownloadedBadgeState extends State<_DownloadedBadge> {
  bool _downloaded = false;
  DownloadService? _downloadService;

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<DownloadService>()) {
      _downloadService = GetIt.instance<DownloadService>();
      _downloadService!.addListener(_onDownloadChanged);
    }
    _check();
  }

  @override
  void dispose() {
    _downloadService?.removeListener(_onDownloadChanged);
    super.dispose();
  }

  void _onDownloadChanged() => _check();

  Future<void> _check() async {
    final repo = GetIt.instance<OfflineRepository>();
    final available = await repo.isAvailableOffline(widget.itemId);
    if (mounted && available != _downloaded) {
      setState(() => _downloaded = available);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_downloaded) return const SizedBox.shrink();
    return Positioned(
      bottom: 8,
      left: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF4CAF50),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AdaptiveIcon(
              Icons.download_done,
              color: Colors.white,
              size: 12,
            ),
            const SizedBox(width: 3),
            Text(
              AppLocalizations.of(context).downloaded,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.clip,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPosterImage extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;

  const DetailPosterImage({required this.item, required this.imageApi});

  @override
  Widget build(BuildContext context) {
    final isMobile = !_useDesktopDetailLayout(context);
    final desktopScale = _desktopUiScale();
    final w = isMobile ? 120.0 : 165.0 * desktopScale;
    final h = isMobile ? 180.0 : 248.0 * desktopScale;

    if (item.primaryImageTag == null) return SizedBox(width: w, height: h);

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageApi.getPrimaryImageUrl(
                item.id,
                maxHeight: isMobile ? 360 : (500 * desktopScale).round(),
                tag: item.primaryImageTag,
              ),
              width: w,
              height: h,
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => SizedBox(width: w, height: h),
            ),
          ),
          if (item.isFavorite)
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const AdaptiveIcon(
                  Icons.favorite,
                  color: Color(0xFFFF4757),
                  size: 16,
                ),
              ),
            ),
          if (item.isPlayed)
            Positioned(
              top: 6,
              right: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColorScheme.accent,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: AdaptiveIcon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
            ),
          if ((item.playedPercentage ?? 0) > 0)
            Positioned(
              left: 6,
              right: 6,
              bottom: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: item.playedPercentage! / 100.0,
                  minHeight: 6,
                  backgroundColor: Colors.black54,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColorScheme.accent,
                  ),
                ),
              ),
            ),
          _DownloadedBadge(itemId: item.id),
        ],
      ),
    );
  }
}

class _EpisodeThumbnail extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;

  const _EpisodeThumbnail({required this.item, required this.imageApi});

  @override
  Widget build(BuildContext context) {
    final isMobile = !_useDesktopDetailLayout(context);
    final desktopScale = _desktopUiScale();
    final w = isMobile ? 200.0 : 280.0 * desktopScale;
    final h = isMobile ? 113.0 : 158.0 * desktopScale;

    if (item.primaryImageTag == null) return SizedBox(width: w, height: h);

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageApi.getPrimaryImageUrl(
                item.id,
                maxWidth: isMobile ? 400 : (560 * desktopScale).round(),
                tag: item.primaryImageTag,
              ),
              width: w,
              height: h,
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => SizedBox(width: w, height: h),
            ),
          ),
          if (item.isFavorite)
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const AdaptiveIcon(
                  Icons.favorite,
                  color: Color(0xFFFF4757),
                  size: 14,
                ),
              ),
            ),
          if (item.isPlayed)
            Positioned(
              top: 6,
              right: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColorScheme.accent,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: AdaptiveIcon(Icons.check, color: Colors.white, size: 10),
                ),
              ),
            ),
          if ((item.playedPercentage ?? 0) > 0)
            Positioned(
              left: 6,
              right: 6,
              bottom: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: item.playedPercentage! / 100.0,
                  minHeight: 6,
                  backgroundColor: Colors.black54,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColorScheme.accent,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DetailMetadataRow extends StatelessWidget {
  final AggregatedItem item;
  final Map<String, dynamic>? selectedMediaSource;

  /// When true, render only the file size and technical badges (no year, rating,
  /// runtime, seasons, status, ends-at or genres). Used by the Modern Details
  /// tab, where those fields already live in the hero metadata row.
  final bool technicalOnly;

  const DetailMetadataRow({
    required this.item,
    this.selectedMediaSource,
    this.technicalOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final parts = <Widget>[];
    final theme = Theme.of(context);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    if (!technicalOnly && item.productionYear != null) {
      parts.add(_text(theme, item.productionYear.toString()));
    }

    if (!technicalOnly && item.officialRating != null) {
      parts.add(_badge(theme, item.officialRating!));
    }

    final sizeBytes =
        selectedMediaSource?['Size'] as int? ??
        (item.mediaSources.isNotEmpty
            ? item.mediaSources.first['Size'] as int?
            : null);
    if (sizeBytes != null &&
        sizeBytes > 0 &&
        item.type != 'Series' &&
        item.type != 'Season') {
      final double mb = sizeBytes / (1024 * 1024);
      final String formattedSize;
      if (mb > 999) {
        formattedSize = '${(mb / 1024).toStringAsFixed(2)} GB';
      } else {
        formattedSize = '${mb.toStringAsFixed(0)} MB';
      }
      parts.add(_text(theme, formattedSize));
    }

    final runtime = _runtimeForItem(item, selectedMediaSource);
    if (!technicalOnly && runtime != null && item.type != 'Series') {
      final h = runtime.inHours;
      final m = runtime.inMinutes.remainder(60);
      parts.add(_text(theme, h > 0 ? '${h}h ${m}m' : '${m}m'));
    }

    if (!technicalOnly && item.type == 'Series') {
      final count = item.childCount;
      if (count != null) {
        parts.add(
          _text(theme, AppLocalizations.of(context).seasonCount(count)),
        );
      }
      final status = item.status;
      if (status != null) {
        parts.add(_statusBadge(context, theme, status));
      }
    }

    final use24 = GetIt.instance<UserPreferences>().get(
      UserPreferences.use24HourClock,
    );
    final endsAt = _endsAt(item, runtime, use24Hour: use24);
    if (!technicalOnly && endsAt != null && item.type != 'Series') {
      parts.add(_text(theme, AppLocalizations.of(context).endsAt(endsAt)));
    }

    if (!technicalOnly && item.genres.isNotEmpty) {
      parts.add(_text(theme, item.genres.take(3).join(' \u2022 ')));
    }

    if (parts.isEmpty) return const SizedBox.shrink();

    final separated = <Widget>[];
    for (var i = 0; i < parts.length; i++) {
      separated.add(parts[i]);
      if (i < parts.length - 1) {
        separated.add(
          Text(
            ' \u2022 ',
            style: theme.textTheme.bodySmall?.copyWith(
              color: isNeon
                  ? AppColorScheme.onSurface.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.5),
              shadows: _textShadows,
            ),
          ),
        );
      }
    }

    final streams = _mediaStreamsForItem(item, selectedMediaSource);
    final badges = <String>[];
    final res = _resolutionFromStreams(streams) ?? item.videoResolution;
    if (res != null) badges.add(res);
    final hdr = _hdrFromStreams(streams) ?? item.hdrType;
    if (hdr != null) badges.add(hdr);
    final vcodec =
        _codecFromStreams(streams, 'Video') ?? item.videoCodec?.toUpperCase();
    if (vcodec != null) badges.add(vcodec);
    final acodec =
        _audioLabelFromStreams(streams) ??
        audioLabelFromProfileCodec(item.audioProfile, item.audioCodec);
    if (acodec != null) badges.add(acodec);
    final layout = _channelLayoutFromStreams(streams) ?? item.channelLayout;
    if (layout != null) badges.add(layout);

    final compact = !_useDesktopDetailLayout(context);

    return Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: compact ? WrapAlignment.center : WrapAlignment.start,
          spacing: 2,
          runSpacing: 4,
          children: separated,
        ),
        if (badges.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              alignment: compact ? WrapAlignment.center : WrapAlignment.start,
              spacing: 6,
              runSpacing: 4,
              children: badges.map((b) => _techChip(theme, b)).toList(),
            ),
          ),
      ],
    );
  }

  Widget _text(ThemeData theme, String value) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Text(
      value,
      style: theme.textTheme.bodySmall?.copyWith(
        color: isNeon
            ? AppColorScheme.onSurface
            : Colors.white.withValues(alpha: 0.9),
        fontWeight: FontWeight.w700,
        shadows: _textShadows,
      ),
    );
  }

  Widget _badge(ThemeData theme, String label) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isNeon
            ? AppColorScheme.accent.withValues(alpha: 0.15)
            : Colors.white.withValues(alpha: 0.15),
        border: isNeon
            ? Border.fromBorderSide(
                ThemeRegistry.active.borders.chipBorder.copyWith(
                  color: AppColorScheme.accent,
                ),
              )
            : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: isNeon
              ? AppColorScheme.onSurface
              : Colors.white.withValues(alpha: 0.9),
          shadows: _textShadows,
        ),
      ),
    );
  }

  Widget _statusBadge(BuildContext context, ThemeData theme, String status) {
    final isEnded = status.toLowerCase() == 'ended';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isEnded ? const Color(0xFFB71C1C) : const Color(0xFF2E7D32),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        isEnded
            ? AppLocalizations.of(context).ended
            : AppLocalizations.of(context).continuing,
        style: theme.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _techChip(ThemeData theme, String label) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: isNeon
                ? AppColorScheme.accent.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.3),
          ),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: isNeon
              ? AppColorScheme.onSurface
              : Colors.white.withValues(alpha: 0.8),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DetailActionButtons extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final String? itemId;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? tvPlayFocusNode;
  final FocusNode? upTarget;
  final FocusNode? downTarget;
  final KeyEventResult Function(FocusNode? target)? onRequestFocus;
  final bool autoPlay;

  /// When set, caps the number of buttons shown before the rest collapse under
  /// "More", regardless of form factor. Used by layouts (e.g. Modern) that
  /// host the buttons in a narrow pane where the width-based heuristic would
  /// otherwise show too many.
  final int? maxVisibleButtonsOverride;

  /// Invoked when the right arrow is pressed on the rightmost visible button.
  /// Lets a host layout move focus out of the button cluster (e.g. into a tab
  /// rail) instead of trapping it.
  final VoidCallback? onArrowRightAtEnd;

  /// Renders the "modern" detail style: a high-contrast Play pill plus circular
  /// secondary icon buttons. Defaults to the classic square layout.
  final bool modernStyle;

  /// In modern style, render the primary Play as a full-width pill (portrait).
  /// When false the pill is content-width and sits inline with the secondary
  /// circular buttons (landscape).
  final bool fullWidthPrimary;
  final FocusNode? actionRowRightFocusNode;
  final FocusNode? extraFirstFocusNode;
  final ValueChanged<bool>? onFocusExtra;
  final bool? actionsExpanded;
  final ValueChanged<bool>? onActionsExpandedChanged;

  const DetailActionButtons({
    required this.viewModel,
    this.itemId,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.tvPlayFocusNode,
    this.upTarget,
    this.downTarget,
    this.onRequestFocus,
    this.autoPlay = false,
    this.maxVisibleButtonsOverride,
    this.onArrowRightAtEnd,
    this.modernStyle = false,
    this.fullWidthPrimary = false,
    this.actionRowRightFocusNode,
    this.extraFirstFocusNode,
    this.onFocusExtra,
    this.actionsExpanded,
    this.onActionsExpandedChanged,
  });

  @override
  State<DetailActionButtons> createState() => DetailActionButtonsState();
}

class _BookAuthorDetailScreen extends StatefulWidget {
  final String authorName;
  final String? authorPersonId;
  final String? serverId;

  const _BookAuthorDetailScreen({
    required this.authorName,
    this.authorPersonId,
    this.serverId,
  });

  @override
  State<_BookAuthorDetailScreen> createState() =>
      _BookAuthorDetailScreenState();
}

class _BookAuthorDetailScreenState extends State<_BookAuthorDetailScreen> {
  _BookAuthorDetailData? _data;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final client = _resolveClient();
    final libraryBooks = await _loadLibraryBooks(client);
    if (!mounted) return;

    final books = _dedupeAuthorBooks(libraryBooks);
    books.sort((a, b) {
      final ay = a.year ?? -1;
      final by = b.year ?? -1;
      return by.compareTo(ay);
    });
    final profile = await _loadAuthorProfile(client, books);

    setState(() {
      _data = _BookAuthorDetailData(
        authorName: widget.authorName,
        biography: profile.biography,
        photoUrl: profile.photoUrl,
        books: books,
      );
      _loading = false;
    });
  }

  MediaServerClient _resolveClient() {
    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final defaultClient = GetIt.instance<MediaServerClient>();
    return widget.serverId != null
        ? clientFactory.getClientIfExists(widget.serverId!) ?? defaultClient
        : defaultClient;
  }

  Future<List<_AuthorBookEntry>> _loadLibraryBooks(
    MediaServerClient client,
  ) async {
    try {
      final itemsApi = client.itemsApi;
      final rawItems = await _fetchBookItemsFromServer(itemsApi);

      final mapped = rawItems
          .map(
            (raw) => AggregatedItem(
              id: raw['Id']?.toString() ?? '',
              serverId: widget.serverId ?? client.baseUrl,
              rawData: raw,
            ),
          )
          .toList();

      final filtered =
          widget.authorPersonId != null &&
              widget.authorPersonId!.trim().isNotEmpty
          ? mapped
          : mapped.where((item) => _bookMatchesAuthor(item)).toList();

      return _dedupeAuthorBooks(
        filtered
            .map(
              (item) => _AuthorBookEntry.fromLibraryItem(item, client.imageApi),
            )
            .toList(),
      );
    } catch (_) {
      return const [];
    }
  }

  Future<({String? biography, String? photoUrl})> _loadAuthorProfile(
    MediaServerClient client,
    List<_AuthorBookEntry> books,
  ) async {
    String? biography;
    String? photoUrl;

    if (widget.authorPersonId != null &&
        widget.authorPersonId!.trim().isNotEmpty) {
      try {
        final personId = widget.authorPersonId!.trim();
        final person = await client.itemsApi.getItem(personId);
        final overview = (person['Overview'] as String?)?.trim();
        if (overview != null && overview.isNotEmpty) {
          biography = overview;
        }

        final imageTag = (person['PrimaryImageTag'] as String?)?.trim();
        photoUrl = client.imageApi.getPrimaryImageUrl(
          personId,
          tag: imageTag != null && imageTag.isNotEmpty ? imageTag : null,
          maxHeight: 300,
        );
      } catch (_) {}
    }

    if (photoUrl?.isEmpty ?? true) {
      try {
        final peopleData = await client.itemsApi.getItems(
          includeItemTypes: const ['Person'],
          recursive: true,
          searchTerm: widget.authorName,
          limit: 12,
        );
        final items =
            (peopleData['Items'] as List?)
                ?.whereType<Map>()
                .map((m) => m.cast<String, dynamic>())
                .toList() ??
            const <Map<String, dynamic>>[];

        final target = widget.authorName.trim().toLowerCase();
        final person = items.firstWhere(
          (item) =>
              ((item['Name'] as String?) ?? '').trim().toLowerCase() == target,
          orElse: () =>
              items.isNotEmpty ? items.first : const <String, dynamic>{},
        );
        final personId = person['Id']?.toString().trim();
        if (personId != null && personId.isNotEmpty) {
          final imageTag = (person['PrimaryImageTag'] as String?)?.trim();
          photoUrl = client.imageApi.getPrimaryImageUrl(
            personId,
            tag: imageTag != null && imageTag.isNotEmpty ? imageTag : null,
            maxHeight: 300,
          );
        }
      } catch (_) {}
    }

    if (biography == null || biography.isEmpty) {
      for (final book in books) {
        final overview = book.overview?.trim();
        if (overview != null && overview.isNotEmpty) {
          biography = overview;
          break;
        }
      }
    }

    return (biography: biography, photoUrl: photoUrl);
  }

  Future<List<Map<String, dynamic>>> _fetchBookItemsFromServer(
    ItemsApi itemsApi,
  ) async {
    final books = <Map<String, dynamic>>[];
    var startIndex = 0;
    const pageSize = 200;
    const maxItems = 2000;

    while (books.length < maxItems) {
      final data = await itemsApi.getItems(
        includeItemTypes: const ['Book'],
        recursive: true,
        sortBy: 'ProductionYear,SortName',
        sortOrder: 'Descending',
        startIndex: startIndex,
        limit: pageSize,
        searchTerm:
            widget.authorPersonId == null ||
                widget.authorPersonId!.trim().isEmpty
            ? widget.authorName
            : null,
        personIds:
            widget.authorPersonId != null &&
                widget.authorPersonId!.trim().isNotEmpty
            ? [widget.authorPersonId!.trim()]
            : null,
        enableTotalRecordCount: true,
      );

      final pageItems =
          (data['Items'] as List?)
              ?.whereType<Map>()
              .map((m) => m.cast<String, dynamic>())
              .toList() ??
          const <Map<String, dynamic>>[];
      if (pageItems.isEmpty) {
        break;
      }

      books.addAll(pageItems);
      startIndex += pageItems.length;

      final total = (data['TotalRecordCount'] as num?)?.toInt();
      if (pageItems.length < pageSize) break;
      if (total != null && startIndex >= total) break;
    }

    return books;
  }

  bool _bookMatchesAuthor(AggregatedItem item) {
    final target = widget.authorName.trim().toLowerCase();
    if (target.isEmpty) return false;

    final direct = (item.rawData['Author'] as String?)?.trim().toLowerCase();
    if (direct == target) return true;

    final authors =
        (item.rawData['Authors'] as List?)
            ?.whereType<String>()
            .map((name) => name.trim().toLowerCase())
            .toList() ??
        const <String>[];
    if (authors.any((name) => name == target)) {
      return true;
    }

    final peopleAuthor = item.people.any((person) {
      final type = (person['Type'] as String?)?.toLowerCase();
      if (type != 'author' && type != 'writer') return false;
      final name = (person['Name'] as String?)?.trim().toLowerCase();
      return name == target;
    });
    if (peopleAuthor) return true;

    return item.artists.map((a) => a.trim().toLowerCase()).contains(target);
  }

  String _bookIdentity(_AuthorBookEntry book) {
    final canonicalTitle = _canonicalBookTitle(book.title);
    final yearBucket = book.year != null
        ? (book.year! ~/ 5).toString()
        : 'unknown';
    return 'title:$canonicalTitle|year:$yearBucket';
  }

  List<_AuthorBookEntry> _dedupeAuthorBooks(List<_AuthorBookEntry> books) {
    final deduped = <String, _AuthorBookEntry>{};
    for (final book in books) {
      final key = _bookIdentity(book);
      final existing = deduped[key];
      deduped[key] = existing == null
          ? book
          : _preferAuthorBook(existing, book);
    }
    return deduped.values.toList();
  }

  _AuthorBookEntry _preferAuthorBook(
    _AuthorBookEntry left,
    _AuthorBookEntry right,
  ) {
    final leftScore = _authorBookScore(left);
    final rightScore = _authorBookScore(right);
    if (rightScore > leftScore) return right;
    return left;
  }

  int _authorBookScore(_AuthorBookEntry book) {
    var score = 0;
    if (book.inLibrary) score += 100;
    if (book.coverUrl != null && book.coverUrl!.isNotEmpty) score += 10;
    if (book.year != null) score += 1;
    return score;
  }

  String _canonicalBookTitle(String title) {
    var value = title.toLowerCase().trim();
    value = value.replaceAll(RegExp(r'\[[^\]]*\]|\([^\)]*\)'), ' ');
    value = value.replaceAll(RegExp(r'[:\-–].*$'), ' ');
    value = value.replaceAll(RegExp(r'\b(a|an|the)\b'), ' ');
    value = value.replaceAll(RegExp(r'[^a-z0-9]+'), '');
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = _isCompact(context) ? 16.0 : 48.0;
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width >= 1500
        ? 7
        : width >= 1200
        ? 6
        : width >= 900
        ? 5
        : width >= 700
        ? 4
        : 3;
    const gridSpacing = 10.0;
    final data = _data;

    return Scaffold(
      backgroundColor: const Color(0xFF0F182A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(AppLocalizations.of(context).authorDetails),
      ),
      body: SafeArea(
        child: _loading && data == null
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF32B9E8)),
              )
            : data == null
            ? Center(
                child: Text(
                  AppLocalizations.of(context).unableToLoadAuthorDetails,
                  style: const TextStyle(color: Color(0xFFD7E8F6)),
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  8,
                  horizontalPadding,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AuthorHeader(
                      name: data.authorName,
                      photoUrl: data.photoUrl,
                    ),
                    const SizedBox(height: 20),
                    _SectionHeader(
                      title: AppLocalizations.of(context).biography,
                    ),
                    const SizedBox(height: 8),
                    if (data.biography != null &&
                        data.biography!.trim().isNotEmpty)
                      ExpandableBiography(
                        text: data.biography!,
                        onCollapse: () => setState(() {}),
                      )
                    else
                      Text(
                        AppLocalizations.of(context).noBiographyAvailable,
                        style: const TextStyle(
                          color: Color(0xFFD7E8F6),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    const SizedBox(height: 28),
                    _SectionHeader(title: AppLocalizations.of(context).books),
                    const SizedBox(height: 8),
                    if (data.books.isEmpty)
                      Text(
                        AppLocalizations.of(context).noBooksFound,
                        style: const TextStyle(
                          color: Color(0xFFD7E8F6),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.books.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: gridSpacing,
                          crossAxisSpacing: gridSpacing,
                          childAspectRatio: 0.72,
                        ),
                        itemBuilder: (context, index) {
                          final book = data.books[index];
                          return _AuthorBookTile(
                            book: book,
                            onTap: book.inLibrary && book.itemId != null
                                ? () => context.push(
                                    Destinations.item(
                                      book.itemId!,
                                      serverId: widget.serverId,
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
      ),
    );
  }
}

class _AuthorHeader extends StatelessWidget {
  final String name;
  final String? photoUrl;

  const _AuthorHeader({required this.name, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 42,
          backgroundColor: const Color(0xFF1E3A5F),
          child: ClipOval(
            child: SizedBox(
              width: 84,
              height: 84,
              child: photoUrl == null
                  ? const AdaptiveIcon(
                      Icons.person,
                      size: 36,
                      color: Color(0xFFE4F0FA),
                    )
                  : CachedNetworkImage(
                      imageUrl: photoUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => const AdaptiveIcon(
                        Icons.person,
                        size: 36,
                        color: Color(0xFFE4F0FA),
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthorBookTile extends StatelessWidget {
  final _AuthorBookEntry book;
  final VoidCallback? onTap;

  const _AuthorBookTile({required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: const Color(0xFF2C77B7),
                  child: book.coverUrl == null
                      ? const Center(
                          child: AdaptiveIcon(
                            Icons.auto_stories_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: book.coverUrl!,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorWidget: (_, _, _) => Container(
                            color: const Color(0xFF2C77B7),
                            alignment: Alignment.center,
                            child: const AdaptiveIcon(
                              Icons.auto_stories_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                ),
              ),
              if (book.inLibrary)
                const Positioned(
                  top: 6,
                  right: 6,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFF2FA74B),
                    child: AdaptiveIcon(Icons.check, size: 15, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardMarqueeText(
                  book.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  book.year != null
                      ? AppLocalizations.of(context).published(book.year!)
                      : AppLocalizations.of(context).publicationDateUnknown,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFB9D4E8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    if (onTap == null) {
      return content;
    }
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: content,
    );
  }
}

class _CardMarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const _CardMarqueeText(this.text, {required this.style});

  @override
  State<_CardMarqueeText> createState() => _CardMarqueeTextState();
}

class _CardMarqueeTextState extends State<_CardMarqueeText>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller;
  late final AnimationController _animation;
  bool _started = false;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _animation = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _startIfNeeded());
  }

  void _startIfNeeded() {
    if (!mounted || !_controller.hasClients || _started || !_hovered) return;
    final maxScroll = _controller.position.maxScrollExtent;
    if (maxScroll <= 0) return;

    _started = true;
    _animation.duration = Duration(
      milliseconds: (maxScroll * 34).round().clamp(1800, 8000),
    );
    _animation.addListener(_onTick);
    _animation.repeat(reverse: true);
  }

  void _onTick() {
    if (!_controller.hasClients) return;
    _controller.jumpTo(_animation.value * _controller.position.maxScrollExtent);
  }

  void _stopScroll() {
    _started = false;
    _animation.removeListener(_onTick);
    _animation.stop();
    if (_controller.hasClients) {
      _controller.jumpTo(0);
    }
  }

  @override
  void didUpdateWidget(covariant _CardMarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _stopScroll();
      WidgetsBinding.instance.addPostFrameCallback((_) => _startIfNeeded());
    }
  }

  @override
  void dispose() {
    _stopScroll();
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hovered = true;
        WidgetsBinding.instance.addPostFrameCallback((_) => _startIfNeeded());
      },
      onExit: (_) {
        _hovered = false;
        _stopScroll();
      },
      child: SizedBox(
        height: 20,
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Text(
            widget.text,
            maxLines: 1,
            overflow: _hovered ? TextOverflow.visible : TextOverflow.ellipsis,
            style: widget.style,
          ),
        ),
      ),
    );
  }
}

class _BookAuthorDetailData {
  final String authorName;
  final String? biography;
  final String? photoUrl;
  final List<_AuthorBookEntry> books;

  const _BookAuthorDetailData({
    required this.authorName,
    required this.biography,
    required this.photoUrl,
    required this.books,
  });
}

class _AuthorBookEntry {
  final String title;
  final int? year;
  final String? overview;
  final String? coverUrl;
  final String? sourceKey;
  final bool inLibrary;
  final String? itemId;

  const _AuthorBookEntry({
    required this.title,
    required this.year,
    required this.overview,
    required this.coverUrl,
    required this.sourceKey,
    required this.inLibrary,
    required this.itemId,
  });

  factory _AuthorBookEntry.fromLibraryItem(
    AggregatedItem item,
    ImageApi imageApi,
  ) {
    final tag = item.primaryImageTag;
    final coverUrl = tag == null
        ? null
        : imageApi.getPrimaryImageUrl(item.id, maxHeight: 300, tag: tag);

    return _AuthorBookEntry(
      title: item.name,
      year: item.productionYear,
      overview: item.overview,
      coverUrl: coverUrl,
      sourceKey: item.providerIds['OpenLibrary'],
      inLibrary: true,
      itemId: item.id,
    );
  }
}

class _DolbyVisionPlayDecision {
  final bool forceTranscode;
  final DolbyVisionFallbackBehavior? rememberBehavior;

  const _DolbyVisionPlayDecision({
    required this.forceTranscode,
    this.rememberBehavior,
  });
}

class DetailActionButtonsState extends State<DetailActionButtons> {
  int? get _selectedAudioIndex => viewModel.selectedAudioIndex;
  set _selectedAudioIndex(int? value) => viewModel.selectedAudioIndex = value;

  int? get _selectedSubtitleIndex => viewModel.selectedSubtitleIndex;
  set _selectedSubtitleIndex(int? value) =>
      viewModel.selectedSubtitleIndex = value;

  bool _localExpanded = false;
  bool get _expanded => widget.actionsExpanded ?? _localExpanded;
  set _expanded(bool val) {
    if (widget.onActionsExpandedChanged != null) {
      widget.onActionsExpandedChanged!(val);
    } else {
      setState(() => _localExpanded = val);
    }
  }
  bool _playLaunchInFlight = false;
  bool _autoPlayTriggered = false;
  DownloadedItem? _offlineRow;
  List<DownloadedItem>? _offlineQueue;
  DownloadService? _downloadService;
  StreamSubscription<Object?>? _userSub;
  final FocusNode _localTvPlayFocusNode = FocusNode(
    debugLabel: 'detail_play_button',
  );
  final FocusNode _overflowMoreFocusNode = FocusNode(
    debugLabel: 'detail_more_button',
  );
  final FocusNode _overflowFirstExtraFocusNode = FocusNode(
    debugLabel: 'detail_overflow_first_extra',
  );
  final List<FocusNode> _primaryFocusNodes = [];
  final List<FocusNode> _extraFocusNodes = [];

  FocusNode _primaryFocusNode(int index) {
    if (index == 0) return _tvPlayFocusNode;
    final listIndex = index - 1;
    while (_primaryFocusNodes.length <= listIndex) {
      _primaryFocusNodes.add(FocusNode(debugLabel: 'primary_btn_${_primaryFocusNodes.length + 1}'));
    }
    return _primaryFocusNodes[listIndex];
  }

  /// Returns the focus node for extra-row button [index], matching the same
  /// logic used when assigning focus nodes during build so index 0 always
  /// resolves to [widget.extraFirstFocusNode] when provided.
  FocusNode _extraFocusNode(int index) {
    if (index == 0 && widget.extraFirstFocusNode != null) {
      return widget.extraFirstFocusNode!;
    }
    while (_extraFocusNodes.length <= index) {
      _extraFocusNodes.add(FocusNode(debugLabel: 'extra_btn_${_extraFocusNodes.length}'));
    }
    return _extraFocusNodes[index];
  }

  void _focusSecondRowButton(int index, int extraCount) {
    if (extraCount <= 0) return;
    final targetIndex = index.clamp(0, extraCount - 1);
    _extraFocusNode(targetIndex).requestFocus();
  }

  /// Resolves the focus node for primary-row button [index] in a full (non-
  /// overflow) row, where the last slot shares the right-edge node.
  FocusNode _primaryNodeAt(int index, int count) {
    if (index == 0) return widget.tvPlayFocusNode ?? _primaryFocusNode(0);
    if (index == count - 1) {
      return widget.actionRowRightFocusNode ?? _primaryFocusNode(index);
    }
    return _primaryFocusNode(index);
  }

  /// Resolves the focus node for primary-row button [index] in an overflow row,
  /// where the More button owns the right-edge node separately.
  FocusNode _primaryNodePlain(int index) => index == 0
      ? (widget.tvPlayFocusNode ?? _primaryFocusNode(0))
      : _primaryFocusNode(index);

  /// Focuses the nearest mounted button along [nodeAt], scanning from [from] by
  /// [step]. Skips slots that currently render nothing (unattached focus node),
  /// e.g. the hidden delete-download action, so the d-pad chain is never
  /// stranded on an invisible button.
  bool _focusAdjacent(
    FocusNode Function(int) nodeAt,
    int from,
    int step,
    int count,
  ) {
    for (var i = from; i >= 0 && i < count; i += step) {
      final node = nodeAt(i);
      if (node.context != null) {
        node.requestFocus();
        return true;
      }
    }
    return false;
  }

  void _focusFirstRowButton(int index, int primaryCount) {
    final targetIndex = index.clamp(0, primaryCount - 1);
    _primaryFocusNode(targetIndex).requestFocus();
  }
  String? _tvPlayFocusAppliedForItemId;
  bool _rowHasFocus = false;

  FocusNode get _tvPlayFocusNode =>
      widget.tvPlayFocusNode ?? _localTvPlayFocusNode;

  ItemDetailViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<DownloadService>()) {
      _downloadService = GetIt.instance<DownloadService>();
      _downloadService!.addListener(_onDownloadChanged);
    }
    _userSub = GetIt.instance<UserRepository>().currentUserStream.listen((_) {
      if (!mounted) return;
      setState(() {});
    });
    _checkOffline();
    _maybeTriggerAutoPlay();
  }

  @override
  void dispose() {
    _downloadService?.removeListener(_onDownloadChanged);
    _userSub?.cancel();
    _localTvPlayFocusNode.dispose();
    _overflowMoreFocusNode.dispose();
    _overflowFirstExtraFocusNode.dispose();
    for (final node in _primaryFocusNodes) {
      node.dispose();
    }
    for (final node in _extraFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  _DetailActionButton _copyActionButton(
    _DetailActionButton button, {
    VoidCallback? onFocused,
    VoidCallback? onArrowUp,
    VoidCallback? onArrowDown,
    VoidCallback? onArrowLeft,
    VoidCallback? onArrowRight,
    FocusNode? focusNode,
    bool? autofocus,
    bool? suppressAutoScrollToTop,
  }) {
    return _DetailActionButton(
      label: button.label,
      icon: button.icon,
      onPressed: button.onPressed,
      onLongPress: button.onLongPress,
      onFocused: onFocused ?? button.onFocused,
      onArrowUp: onArrowUp ?? button.onArrowUp,
      onArrowDown: onArrowDown ?? button.onArrowDown,
      onArrowLeft: onArrowLeft ?? button.onArrowLeft,
      onArrowRight: onArrowRight ?? button.onArrowRight,
      isActive: button.isActive,
      activeColor: button.activeColor,
      focusNode: focusNode ?? button.focusNode,
      autofocus: autofocus ?? button.autofocus,
      neonAccentColor: button.neonAccentColor,
      suppressAutoScrollToTop:
          suppressAutoScrollToTop ?? button.suppressAutoScrollToTop,
      isPrimary: button.isPrimary,
    );
  }

  /// Applies the row's per-slot focus node and arrow wiring to any action
  /// widget, including the download/delete wrappers that are not themselves
  /// _DetailActionButtons (without this they never join the d-pad chain).
  Widget _wireButton(
    Widget button, {
    VoidCallback? onFocused,
    VoidCallback? onArrowUp,
    VoidCallback? onArrowDown,
    VoidCallback? onArrowLeft,
    VoidCallback? onArrowRight,
    FocusNode? focusNode,
    bool? autofocus,
    bool? suppressAutoScrollToTop,
  }) {
    if (button is _DetailActionButton) {
      return _copyActionButton(
        button,
        onFocused: onFocused,
        onArrowUp: onArrowUp,
        onArrowDown: onArrowDown,
        onArrowLeft: onArrowLeft,
        onArrowRight: onArrowRight,
        focusNode: focusNode,
        autofocus: autofocus,
        suppressAutoScrollToTop: suppressAutoScrollToTop,
      );
    }
    if (button is _DownloadButton) {
      return _DownloadButton(
        item: button.item,
        viewModel: button.viewModel,
        focusNode: focusNode,
        onFocused: onFocused,
        onArrowUp: onArrowUp,
        onArrowDown: onArrowDown,
        onArrowLeft: onArrowLeft,
        onArrowRight: onArrowRight,
        suppressAutoScrollToTop: suppressAutoScrollToTop ?? false,
      );
    }
    if (button is _DeleteDownloadButton) {
      return _DeleteDownloadButton(
        item: button.item,
        focusNode: focusNode,
        onFocused: onFocused,
        onArrowUp: onArrowUp,
        onArrowDown: onArrowDown,
        onArrowLeft: onArrowLeft,
        onArrowRight: onArrowRight,
        suppressAutoScrollToTop: suppressAutoScrollToTop ?? false,
      );
    }
    return button;
  }

  bool _tryFocusSidebar() {
    if (GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) !=
        NavbarPosition.left) {
      return false;
    }
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  void _focusSidebar() {
    _tryFocusSidebar();
  }

  void _focusTarget(FocusNode? target, {double alignment = 0.2}) {
    if (target == null) {
      if (GetIt.instance<UserPreferences>().get(
            UserPreferences.navbarPosition,
          ) ==
          NavbarPosition.top) {
        NavigationLayout.focusNavbarNotifier.value?.call();
      }
      return;
    }

    final requestFocus = widget.onRequestFocus;
    if (requestFocus != null) {
      final result = requestFocus(target);
      if (result != KeyEventResult.ignored) {
        return;
      }
    }

    if (target.context == null) {
      if (GetIt.instance<UserPreferences>().get(
            UserPreferences.navbarPosition,
          ) ==
          NavbarPosition.top) {
        NavigationLayout.focusNavbarNotifier.value?.call();
      }
      return;
    }

    if (target.canRequestFocus) {
      target.requestFocus();
      if (target.context
              ?.findAncestorWidgetOfExactType<ExpandableBiography>() !=
          null) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final targetContext = target.context;
        if (targetContext == null) return;
        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          alignment: alignment,
          alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        );
      });
    }
  }

  void _focusDownTarget() {
    _focusTarget(widget.downTarget, alignment: 0.42);
  }

  void _focusUpTarget() {
    final upTarget = widget.upTarget;
    if (upTarget != null && upTarget.context != null && upTarget.canRequestFocus) {
      upTarget.requestFocus();
    } else if (NavigationLayout.focusNavbarNotifier.value != null) {
      final isAlbumOrPlaylist = widget.viewModel.item?.type == 'MusicAlbum' ||
          widget.viewModel.item?.type == 'Playlist';
      if (!isAlbumOrPlaylist) {
        NavigationLayout.focusNavbarNotifier.value?.call();
      }
    } else {
      _focusTarget(widget.upTarget);
    }
  }

  void _ensureOverflowButtonVisible(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        alignment: 0.82,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  void _ensureTvPlayFocus(String itemId) {
    if (!PlatformDetection.isTV) return;
    if (_tvPlayFocusAppliedForItemId == itemId) return;
    _tryRequestPlayFocus(itemId, 0);
  }

  void _tryRequestPlayFocus(String itemId, int attempt) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final node = _tvPlayFocusNode;
      if (node.context != null && node.canRequestFocus) {
        node.requestFocus();
        if (node.hasFocus) {
          _tvPlayFocusAppliedForItemId = itemId;
          return;
        }
      }
      if (attempt + 1 >= 8) return;
      Future<void>.delayed(const Duration(milliseconds: 50), () {
        if (!mounted) return;
        _tryRequestPlayFocus(itemId, attempt + 1);
      });
    });
  }

  void _onDownloadChanged() => _checkOffline();

  int _calculateMaxVisibleButtons(BuildContext context) {
    final override = widget.maxVisibleButtonsOverride;
    if (override != null) return override > 2 ? override : 2;
    if (PlatformDetection.isTV) {
      final desktopScale = _desktopUiScale();
      final maxTVButtons = (7 / desktopScale).floor();
      return maxTVButtons > 2 ? maxTVButtons : 2;
    }
    final screenWidth = MediaQuery.sizeOf(context).width;
    final compact = (widget.modernStyle && _isCompact(context)) ||
        !_useDesktopDetailLayout(context);
    final desktopScale = _desktopUiScale();
    // On mobile, secondary buttons are labelled vertical tiles 66 wide; the
    // spacing and content padding below mirror the real layout exactly so the
    // row packs as many tiles as physically fit before the rest fold into More.
    final buttonWidth = compact ? 66.0 : 108.0 * desktopScale;
    final spacing = compact ? 4.0 : 8.0 * desktopScale;
    final horizontalPadding = compact ? 40.0 : 64.0;

    final availableWidth = screenWidth - horizontalPadding;
    final maxButtons = ((availableWidth + spacing) / (buttonWidth + spacing))
        .floor();

    return maxButtons > 2 ? maxButtons : 2;
  }

  Future<void> _checkOffline() async {
    final item = viewModel.item;
    if (item == null || !_isDownloadable(item.type)) return;
    final repo = GetIt.instance<OfflineRepository>();
    final type = item.type;

    if (type == 'Season' || type == 'Series') {
      final episodes = type == 'Season'
          ? await repo.getSeasonEpisodes(item.id)
          : await repo.getSeriesEpisodes(item.id);
      final playable = episodes
          .where((e) => e.downloadStatus == 2 && e.localFilePath != null)
          .toList();
      if (mounted) {
        setState(() {
          _offlineRow = playable.isNotEmpty ? playable.first : null;
          _offlineQueue = playable.isNotEmpty ? playable : null;
        });
      }
    } else {
      final row = await repo.getItem(item.id);
      if (mounted) {
        setState(() {
          _offlineRow = (row != null && row.downloadStatus == 2) ? row : null;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant DetailActionButtons oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedMediaSourceId != widget.selectedMediaSourceId ||
        oldWidget.itemId != widget.itemId) {
      _selectedAudioIndex = null;
      _selectedSubtitleIndex = null;
    }
    _maybeTriggerAutoPlay();
  }

  void _syncAudioSelectionFromActivePlayback() {
    final activeAudioIndex = _activePlaybackAudioIndex();
    if (activeAudioIndex != null) {
      _selectedAudioIndex = activeAudioIndex;
    }
  }

  void _syncSubtitleSelectionFromActivePlayback() {
    final activeSubtitleIndex = _activePlaybackSubtitleIndex();
    if (activeSubtitleIndex != null) {
      _selectedSubtitleIndex = activeSubtitleIndex;
    }
  }

  void _maybeTriggerAutoPlay() {
    if (!widget.autoPlay || _autoPlayTriggered) return;

    final item = widget.viewModel.item;
    if (item == null) return;

    _autoPlayTriggered = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // Consume autoPlay from the current detail route so back navigation
      // doesn't re-trigger playback.
      context.replace(Destinations.item(item.id, serverId: item.serverId));

      final isPhoto = item.type == 'Photo';
      final ws = _computeWatchState(item);
      _play(context, item, resume: !isPhoto && ws.hasProgress);
    });
  }

  // ---------------------------------------------------------------------------
  // Watch-state helper — avoids repeating the same 6-line block in three places
  // ---------------------------------------------------------------------------

  ({
    bool isFullyWatched,
    bool isFullyUnwatched,
    bool isPartiallyWatched,
    bool hasProgress,
  })
  _computeWatchState(AggregatedItem item) {
    final isSeries = item.type == 'Series';
    final isContainer = item.type == 'Series' ||
                        item.type == 'Season' ||
                        item.type == 'BoxSet' ||
                        item.type == 'MusicAlbum';
    if (!isContainer) {
      final hasProgress = (item.playedPercentage ?? 0) > 0 ||
                          (item.playbackPosition?.inMilliseconds ?? 0) > 0;
      return (
        isFullyWatched: item.isPlayed,
        isFullyUnwatched: !item.isPlayed && !hasProgress,
        isPartiallyWatched: hasProgress,
        hasProgress: hasProgress,
      );
    }
    final totalEpisodes = isSeries
        ? (item.recursiveItemCount ?? 0)
        : (item.childCount ?? item.recursiveItemCount ?? 0);
    final unplayed = item.unplayedItemCount ?? totalEpisodes;
    final isFullyWatched = item.isPlayed || unplayed == 0;
    final isFullyUnwatched = unplayed == totalEpisodes;
    final isPartiallyWatched = !isFullyWatched && !isFullyUnwatched;
    final hasProgress = isSeries
        ? isPartiallyWatched
        : ((item.playedPercentage ?? 0) > 0 ||
              (item.playbackPosition?.inMilliseconds ?? 0) > 0);
    return (
      isFullyWatched: isFullyWatched,
      isFullyUnwatched: isFullyUnwatched,
      isPartiallyWatched: isPartiallyWatched,
      hasProgress: hasProgress,
    );
  }

  List<Map<String, dynamic>> _streamsForTrackSelectors(
    AggregatedItem item,
    Map<String, dynamic>? selectedSource,
  ) {
    final manager = GetIt.instance<PlaybackManager>();
    final queued = manager.queueService.currentItem;
    final resolution = manager.currentResolution;
    if (queued?.id == item.id &&
        resolution != null &&
        resolution.mediaStreams.isNotEmpty) {
      return resolution.mediaStreams;
    }
    return _mediaStreamsForItem(item, selectedSource);
  }

  void _openAudioSelector(BuildContext context, AggregatedItem item) {
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final streams = _streamsForTrackSelectors(
      item,
      selectedSource,
    ).where((s) => s['Type'] == 'Audio').toList();
    if (streams.length > 1) {
      _showAudioSelector(context, streams);
    }
  }

  void _openSubtitleSelector(BuildContext context, AggregatedItem item) {
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final selectorStreams = _streamsForTrackSelectors(item, selectedSource);
    final subtitleStreams = selectorStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();
    final audioStreams = selectorStreams
        .where((s) => s['Type'] == 'Audio')
        .toList();
    _showSubtitleSelector(context, item, subtitleStreams, audioStreams);
  }

  bool _isManagementButton(_DetailActionButton button) {
    return button.icon == Icons.check_circle ||
           button.icon == Icons.check_circle_outline ||
           button.icon == Icons.favorite ||
           button.icon == Icons.playlist_add ||
           button.icon == Icons.delete_outline ||
           button.icon == Icons.movie_outlined;
  }

  bool _isSeasonManagementButton(_DetailActionButton button) {
    return button.icon == Icons.check_circle ||
           button.icon == Icons.check_circle_outline ||
           button.icon == Icons.favorite ||
           button.icon == Icons.playlist_add ||
           button.icon == Icons.settings;
  }

  bool _isSeriesManagementButton(_DetailActionButton button) {
    return button.icon == Icons.check_circle ||
           button.icon == Icons.check_circle_outline ||
           button.icon == Icons.favorite ||
           button.icon == Icons.playlist_add ||
           button.icon == Icons.settings ||
           button.icon == Icons.movie_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final item = viewModel.item!;
    final l10n = AppLocalizations.of(context);

    if (item.type == 'Person') {
      final normalizedPrimaryButtons = [
        _DetailActionButton(
          label: item.isFavorite ? l10n.favorited : l10n.favorite,
          icon: Icons.favorite,
          isPrimary: true,
          focusNode: widget.tvPlayFocusNode ?? _primaryFocusNode(0),
          autofocus: PlatformDetection.isTV,
          onPressed: viewModel.toggleFavorite,
          isActive: item.isFavorite,
          activeColor: const Color(0xFFFF4757),
          onArrowUp: NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null,
          onArrowDown: widget.downTarget != null ? _focusDownTarget : null,
          onArrowLeft: _focusSidebar,
          onArrowRight: () {
            _primaryFocusNode(1).requestFocus();
          },
        ),
        _DetailActionButton(
          label: l10n.display,
          icon: Icons.tune,
          focusNode: _primaryFocusNode(1),
          onPressed: () {
            showFocusRestoringDialog(
              context: context,
              useRootNavigator: false,
              builder: (_) => PersonDisplaySettingsDialog(prefs: GetIt.instance<UserPreferences>()),
            );
          },
          onArrowUp: NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null,
          onArrowDown: widget.downTarget != null ? _focusDownTarget : null,
          onArrowLeft: () {
            (widget.tvPlayFocusNode ?? _primaryFocusNode(0)).requestFocus();
          },
          onArrowRight: widget.onArrowRightAtEnd ?? () {},
        ),
      ];

      return Align(
        alignment: widget.modernStyle ? Alignment.centerLeft : Alignment.center,
        child: Wrap(
          spacing: widget.modernStyle ? 12.0 : 8.0,
          runSpacing: 12.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: widget.modernStyle ? WrapAlignment.start : WrapAlignment.center,
          children: normalizedPrimaryButtons,
        ),
      );
    }

    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final isPhoto = item.type == 'Photo';
    final isBook = _isReadableBookItem(item);
    final isSeries = item.type == 'Series';
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
    final isVideo = !isPhoto && !isBook && !isAudio;
    final isPlayableVideo = item.type == 'Movie' || item.type == 'Episode' || item.type == 'Video' || item.type == 'MusicVideo';
    final isPlayableMedia = isPlayableVideo || item.type == 'Audio' || item.type == 'AudioBook';
    final ws = _computeWatchState(item);
    final isFullyWatched = ws.isFullyWatched;
    final isFullyUnwatched = ws.isFullyUnwatched;
    final hasProgress = ws.hasProgress;
    final bool isBoxSet = item.type == 'BoxSet';
    final bool boxSetAllWatched;
    final bool boxSetAllUnwatched;
    if (isBoxSet) {
      final items = viewModel.collectionItems;
      if (items.isEmpty) {
        boxSetAllWatched = item.isPlayed;
        boxSetAllUnwatched = !item.isPlayed;
      } else {
        boxSetAllWatched = items.every((e) => e.isPlayed);
        boxSetAllUnwatched = items.every(
          (e) =>
              !e.isPlayed &&
              (e.playbackPosition == null ||
                  e.playbackPosition == Duration.zero),
        );
      }
    } else {
      boxSetAllWatched = false;
      boxSetAllUnwatched = false;
    }
    final isSeason = item.type == 'Season';
    bool seasonAllWatched = false;
    bool seasonAllUnwatched = false;
    AggregatedItem? seasonNextUpEp;
    if (isSeason && viewModel.episodes.isNotEmpty) {
      seasonAllWatched = viewModel.episodes.every((e) => e.isPlayed);
      seasonAllUnwatched = viewModel.episodes.every((e) => !e.isPlayed && (e.playedPercentage == null || e.playedPercentage == 0));
      if (!seasonAllWatched && !seasonAllUnwatched) {
        try {
          seasonNextUpEp = viewModel.episodes.firstWhere((e) => !e.isPlayed);
        } catch (_) {}
      }
    }
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final mediaStreams = _mediaStreamsForItem(item, selectedSource);
    final subtitleStreams = mediaStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();

    final canShowDownloadActions =
        _isDownloadable(item.type) &&
        _canUserDownload() &&
        !PlatformDetection.isTV;

    final String playButtonLabel;
    if (isPhoto) {
      playButtonLabel = l10n.view;
    } else if (isBook) {
      playButtonLabel = hasProgress ? l10n.resumeReading : l10n.read;
    } else if (isSeason) {
      if (seasonAllWatched) {
        playButtonLabel = l10n.replay;
      } else if (seasonAllUnwatched) {
        playButtonLabel = l10n.play;
      } else {
        playButtonLabel = l10n.resume;
      }
    } else if (isSeries) {
      if (isFullyWatched) {
        playButtonLabel = l10n.replay;
      } else if (isFullyUnwatched) {
        playButtonLabel = l10n.play;
      } else {
        final nextUp = viewModel.nextUp;
        if (nextUp != null) {
          final s = nextUp.parentIndexNumber;
          final e = nextUp.indexNumber;
          if (s != null && e != null) {
            if (s == 1 && e == 1) {
              playButtonLabel = l10n.play;
            } else {
              playButtonLabel = l10n.resume;
            }
          } else {
            playButtonLabel = l10n.resume;
          }
        } else {
          playButtonLabel = l10n.resume;
        }
      }
    } else if (isBoxSet) {
      playButtonLabel = (boxSetAllWatched || boxSetAllUnwatched)
          ? l10n.play
          : l10n.resume;
    } else if (hasProgress) {
      playButtonLabel = l10n.resumeFrom(_formatResumePosition(item.playbackPosition));
    } else {
      playButtonLabel = l10n.play;
    }

    _ensureTvPlayFocus(item.id);

    var allButtons = <Widget>[
      _DetailActionButton(
        label: playButtonLabel,
        isPrimary: true,
        icon: isPhoto
            ? Icons.photo
            : isBook
            ? Icons.menu_book
            : Icons.play_arrow,
        focusNode: _tvPlayFocusNode,
        autofocus: PlatformDetection.isTV,
        onPressed: () {
          if (isSeason && viewModel.episodes.isNotEmpty) {
            final targetEp = seasonNextUpEp ?? viewModel.episodes[0];
            _play(
              context,
              targetEp,
              resume: seasonNextUpEp != null,
            );
          } else {
            _play(
              context,
              item,
              resume: isBoxSet
                  ? (!boxSetAllWatched && !boxSetAllUnwatched)
                  : (!isPhoto && hasProgress),
            );
          }
        },
        onLongPress: isVideo
            ? () => _showAdvancedPlaybackMenu(context, item)
            : null,
      ),
      if (_supportsShuffle(item))
        _DetailActionButton(
          label: l10n.shuffle,
          icon: Icons.shuffle_rounded,
          onPressed: () => _shuffle(context, item),
        ),
      if (item.type == 'Series' || (isBoxSet
          ? !(boxSetAllWatched || boxSetAllUnwatched)
          : (hasProgress && !isPhoto)))
        _DetailActionButton(
          label: isBook ? l10n.startOver : l10n.restart,
          icon: Icons.restart_alt,
          onPressed: () => _play(context, item),
          onLongPress: isVideo
              ? () => _showAdvancedPlaybackMenu(
                  context,
                  item,
                  forceStartOver: true,
                )
              : null,
        ),
      if (_offlineRow != null)
        _DetailActionButton(
          label: isBook ? l10n.readOffline : l10n.playOffline,
          icon: isBook ? Icons.menu_book : Icons.offline_pin,
          onPressed: () async {
            if (context.mounted) {
              if (isBook) {
                await context.push(
                  Destinations.book(item.id, serverId: item.serverId),
                );
              } else {
                await launchOfflinePlayback(
                  context,
                  _offlineRow!,
                  episodeQueue: _offlineQueue,
                );
              }
            }
          },
          isActive: true,
          activeColor: const Color(0xFF4CAF50),
        ),
      if (isPlayableVideo) ...[
        _DetailActionButton(
          label: l10n.audio,
          icon: Icons.audiotrack,
          onPressed: () => _openAudioSelector(context, item),
        ),
        _DetailActionButton(
          label: l10n.subtitles,
          icon: Icons.subtitles,
          onPressed: () {
            if (subtitleStreams.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.noSubtitlesFound),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else {
              _openSubtitleSelector(context, item);
            }
          },
        ),
      ],
      if (isPlayableMedia && item.mediaSources.length > 1)
        _DetailActionButton(
          label: l10n.version,
          icon: Icons.video_file,
          onPressed: () => _showVersionSelector(context, item.mediaSources),
          isActive: widget.selectedMediaSourceId != null,
          activeColor: AppColorScheme.accent,
        ),
      if (!isBook && !PlatformDetection.isTV)
        _DetailActionButton(
          label: l10n.cast,
          icon: Icons.cast,
          onPressed: () => _castToDevice(context, item),
        ),
      if (item.type == 'Series' || _hasTrailer(item))
        _DetailActionButton(
          label: l10n.trailer,
          icon: Icons.movie_outlined,
          onPressed: () => _playTrailer(context, item),
        ),
      if (!isBook && !isPhoto && _isInSyncPlayGroup())
        _DetailActionButton(
          label: l10n.watchWithGroup,
          icon: Icons.groups_rounded,
          onPressed: () => _watchWithGroup(context, item),
          isActive: true,
          activeColor: AppColorScheme.accent,
        ),
      _DetailActionButton(
        label: isBook
            ? (item.isPlayed ? l10n.finished : l10n.unread)
            : (item.isPlayed ? l10n.watched : l10n.unwatched),
        icon: item.isPlayed ? Icons.check_circle : Icons.check_circle_outline,
        onPressed: viewModel.togglePlayed,
        isActive: item.isPlayed,
        activeColor: AppColorScheme.accent,
      ),
      _DetailActionButton(
        label: item.isFavorite ? l10n.favorited : l10n.favorite,
        icon: Icons.favorite,
        onPressed: viewModel.toggleFavorite,
        isActive: item.isFavorite,
        activeColor: const Color(0xFFFF4757),
      ),
      if (!isBook)
        _DetailActionButton(
          label: l10n.playlist,
          icon: Icons.playlist_add,
          onPressed: () => AddToPlaylistDialog.show(
            context,
            itemIds: [item.id],
            serverId: item.serverId,
          ),
        ),
      if (canShowDownloadActions)
        _DownloadButton(item: item, viewModel: viewModel),
      if (canShowDownloadActions) _DeleteDownloadButton(item: item),
      if (item.type == 'Episode' && item.seriesId != null)
        _DetailActionButton(
          label: l10n.goToSeries,
          icon: Icons.tv,
          onPressed: () => context.push(
            Destinations.item(item.seriesId!, serverId: item.serverId),
          ),
        ),
      if ((GetIt.instance<UserRepository>().currentUser?.isAdministrator ?? false) &&
          GetIt.instance<MediaServerClient>().serverType == ServerType.jellyfin)
        _DetailActionButton(
          label: l10n.admin,
          icon: Icons.settings,
          onPressed: () => _showAdminDialog(context, item),
          isActive: true,
          activeColor: const Color(0xFFD32F2F),
        ),
    ];

    if (isNeon) {
      var neonSlot = 0;
      allButtons = allButtons.map((widget) {
        if (widget is! _DetailActionButton) {
          return widget;
        }
        final accentColor = neonSlot.isEven
            ? AppColorScheme.accent
            : AppColorScheme.onSurface;
        neonSlot += 1;
        return _DetailActionButton(
          label: widget.label,
          icon: widget.icon,
          onPressed: widget.onPressed,
          onLongPress: widget.onLongPress,
          onFocused: widget.onFocused,
          onArrowUp: widget.onArrowUp,
          onArrowDown: widget.onArrowDown,
          onArrowLeft: widget.onArrowLeft,
          onArrowRight: widget.onArrowRight,
          isActive: widget.isActive,
          activeColor: widget.activeColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          neonAccentColor: accentColor,
          suppressAutoScrollToTop: widget.suppressAutoScrollToTop,
        );
      }).toList();
    }

    final compact = (widget.modernStyle && _isCompact(context)) ||
        !_useDesktopDetailLayout(context);
    final desktopScale = _desktopUiScale();
    final buttonSpacing = compact ? 4.0 : 8.0 * desktopScale;
    final buttonRunSpacing = compact ? 10.0 : 12.0 * desktopScale;
    final maxVisible = _calculateMaxVisibleButtons(context);

    final List<Widget> primaryButtons;
    final List<Widget> extraButtons;
    final bool needsOverflow;

    final bool isTvShow = item.type == 'Series' || item.type == 'Season';
    final bool isTvSeries = item.type == 'Series';
    final bool isTvSeason = item.type == 'Season';
    // Series uses the two-column (inline-Play) layout on TV/desktop, but on the
    // modern mobile layout it should match movies: full-width primary + overflow.
    final bool isModernMobile = widget.modernStyle && _isCompact(context);
    // Series/Season keep the two-column inline-Play layout on TV/desktop; on the
    // compact (mobile) layout every type uses the full-width primary + overflow.
    final bool isTwoColumnLayout = !isModernMobile && isTvShow;

    if (isTwoColumnLayout) {
      final List<Widget> prim = [];
      final List<Widget> ext = [];
      for (final btn in allButtons) {
        if (btn is _DetailActionButton) {
          final isManagement = isTvSeries
              ? _isSeriesManagementButton(btn)
              : (isTvSeason ? _isSeasonManagementButton(btn) : _isManagementButton(btn));
          if (isManagement) {
            ext.add(btn);
          } else {
            prim.add(btn);
          }
        } else {
          prim.add(btn);
        }
      }
      primaryButtons = prim;
      extraButtons = ext;
      needsOverflow = extraButtons.isNotEmpty;
    } else {
      // On mobile the full-width primary sits on its own row, so it does not
      // occupy a slot in the secondary row: exclude it from the count and split.
      final int secondaryCount =
          isModernMobile ? allButtons.length - 1 : allButtons.length;
      final int visibleCount = isModernMobile ? maxVisible : maxVisible - 1;
      needsOverflow =
          (compact ||
              PlatformDetection.isTV ||
              widget.maxVisibleButtonsOverride != null) &&
          secondaryCount > maxVisible;
      if (needsOverflow) {
        primaryButtons = allButtons.take(visibleCount).toList();
        extraButtons = allButtons.skip(visibleCount).toList();
      } else {
        primaryButtons = allButtons;
        extraButtons = const [];
      }
    }

    final Widget rowContent;
    if (!needsOverflow) {
      final normalizedButtons = allButtons.asMap().entries.map((entry) {
        final index = entry.key;
        final button = entry.value;
        final existingUp =
            button is _DetailActionButton ? button.onArrowUp : null;
        final fNode = index == 0 ? (widget.tvPlayFocusNode ?? _primaryFocusNode(0)) : _primaryFocusNode(index);
        return _wireButton(
          button,
          focusNode: index == allButtons.length - 1
              ? (widget.actionRowRightFocusNode ?? fNode)
              : fNode,
          onArrowUp:
              existingUp ??
              (NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null),
          onArrowLeft: index == 0
              ? _focusSidebar
              : () {
                  if (!_focusAdjacent(
                    (i) => _primaryNodeAt(i, allButtons.length),
                    index - 1,
                    -1,
                    allButtons.length,
                  )) {
                    _focusSidebar();
                  }
                },
          onArrowDown: widget.downTarget != null ? _focusDownTarget : null,
          onArrowRight: index == allButtons.length - 1
              ? (widget.onArrowRightAtEnd ?? () {})
              : () {
                  if (!_focusAdjacent(
                    (i) => _primaryNodeAt(i, allButtons.length),
                    index + 1,
                    1,
                    allButtons.length,
                  )) {
                    (widget.onArrowRightAtEnd ?? () {})();
                  }
                },
        );
      }).toList();
      rowContent = Align(
        alignment:
            widget.modernStyle ? Alignment.centerLeft : Alignment.center,
        child: Wrap(
          spacing: buttonSpacing,
          runSpacing: buttonRunSpacing,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: widget.modernStyle
              ? WrapAlignment.start
              : WrapAlignment.center,
          children: normalizedButtons,
        ),
      );
    } else {
      final normalizedPrimaryButtons = primaryButtons.asMap().entries.map((entry) {
        final index = entry.key;
        final button = entry.value;
        final existingUp =
            button is _DetailActionButton ? button.onArrowUp : null;
        final fNode = index == 0 ? (widget.tvPlayFocusNode ?? _primaryFocusNode(0)) : _primaryFocusNode(index);
        return _wireButton(
          button,
          focusNode: fNode,
          onFocused: () => widget.onFocusExtra?.call(false),
          onArrowUp: existingUp ?? (NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null),
          onArrowLeft: index == 0
              ? _focusSidebar
              : () {
                  if (!_focusAdjacent(
                    _primaryNodePlain,
                    index - 1,
                    -1,
                    primaryButtons.length,
                  )) {
                    _focusSidebar();
                  }
                },
          onArrowRight: () {
            // Skip any unmounted slot (e.g. hidden delete-download) and fall
            // through to the More button so it is always reachable.
            if (!_focusAdjacent(
              _primaryNodePlain,
              index + 1,
              1,
              primaryButtons.length,
            )) {
              (widget.actionRowRightFocusNode ?? _overflowMoreFocusNode)
                  .requestFocus();
            }
          },
          onArrowDown: isTvShow
              ? (_expanded
                  ? () => _focusSecondRowButton(index, extraButtons.length)
                  : (widget.downTarget != null ? _focusDownTarget : null))
              : (widget.downTarget != null ? _focusDownTarget : null),
        );
      }).toList();

      final normalizedExtraButtons = extraButtons.asMap().entries.map((entry) {
        final index = entry.key;
        final button = entry.value;
        final fNode = (index == 0 && widget.extraFirstFocusNode != null)
            ? widget.extraFirstFocusNode!
            : (() {
                while (_extraFocusNodes.length <= index) {
                  _extraFocusNodes.add(FocusNode(debugLabel: 'extra_btn_${_extraFocusNodes.length}'));
                }
                return _extraFocusNodes[index];
              })();
        return _wireButton(
          button,
          focusNode: fNode,
          onFocused: () {
            _ensureOverflowButtonVisible(context);
            widget.onFocusExtra?.call(true);
          },
          onArrowUp: isTvShow
              ? () {
                  // For both Series and Season: last extra button (Admin) goes up to More button
                  // All other extra buttons navigate up to the corresponding primary button
                  if (index == extraButtons.length - 1) {
                    (widget.actionRowRightFocusNode ?? _overflowMoreFocusNode).requestFocus();
                  } else {
                    _focusFirstRowButton(index, primaryButtons.length);
                  }
                }
              : (NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null),
          onArrowDown: widget.downTarget != null ? _focusDownTarget : null,
          onArrowLeft: index == 0
              ? _focusSidebar
              : () {
                  if (!_focusAdjacent(
                    _extraFocusNode,
                    index - 1,
                    -1,
                    extraButtons.length,
                  )) {
                    _focusSidebar();
                  }
                },
          onArrowRight: () {
            if (!_focusAdjacent(
              _extraFocusNode,
              index + 1,
              1,
              extraButtons.length,
            )) {
              (widget.onArrowRightAtEnd ?? () {})();
            }
          },
          suppressAutoScrollToTop: true,
        );
      }).toList();

      final moreButton = _DetailActionButton(
        label: _expanded ? l10n.less : l10n.more,
        icon: _expanded ? Icons.expand_less : Icons.expand_more,
        focusNode: widget.actionRowRightFocusNode ?? _overflowMoreFocusNode,
        onFocused: () => widget.onFocusExtra?.call(false),
        onArrowUp: NavigationLayout.focusNavbarNotifier.value != null || widget.upTarget != null ? _focusUpTarget : null,
        onArrowDown: isTvShow && _expanded && extraButtons.isNotEmpty
            ? () {
                _extraFocusNode(extraButtons.length - 1).requestFocus();
              }
            : (widget.downTarget != null ? _focusDownTarget : null),
        onArrowLeft: () {
          // Scan back from the last primary slot, skipping any unmounted button
          // (e.g. hidden delete-download) so More can always return to the row.
          _focusAdjacent(
            _primaryNodePlain,
            primaryButtons.length - 1,
            -1,
            primaryButtons.length,
          );
        },
        onArrowRight: widget.onArrowRightAtEnd ?? () {},
        onPressed: () => setState(() => _expanded = !_expanded),
      );

      if (widget.modernStyle) {
        if (isTwoColumnLayout) {
          // Build a Row so the play pill (first button) can grow via Flexible
          // to fill available space — avoids text truncation for long labels.
          final pillButton = normalizedPrimaryButtons.isNotEmpty
              ? normalizedPrimaryButtons.first
              : null;
          final circleButtons = normalizedPrimaryButtons.skip(1).toList();

          Widget primaryRow = Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (pillButton != null)
                Flexible(fit: FlexFit.loose, child: pillButton),
              for (final btn in circleButtons) ...[SizedBox(width: buttonSpacing), btn],
              SizedBox(width: buttonSpacing),
              moreButton,
            ],
          );

          if (_expanded) {
            rowContent = Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  primaryRow,
                  Padding(
                    padding: EdgeInsets.only(top: buttonRunSpacing),
                    child: Wrap(
                      spacing: buttonSpacing,
                      runSpacing: buttonRunSpacing,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: normalizedExtraButtons,
                    ),
                  ),
                ],
              ),
            );
          } else {
            rowContent = Align(
              alignment: Alignment.centerLeft,
              child: primaryRow,
            );
          }
        } else {
          // Primary row keeps the More/Less button pinned at its end; the extra
          // buttons reveal in a second wrap below, so More/Less never moves.
          rowContent = Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: buttonSpacing,
                  runSpacing: buttonRunSpacing,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  // On mobile the collapsed row is full (overflow is active), so
                  // justify the tiles edge to edge with the full-width Play pill
                  // above instead of piling leftover space on the right.
                  alignment: compact
                      ? WrapAlignment.spaceBetween
                      : WrapAlignment.start,
                  children: [...normalizedPrimaryButtons, moreButton],
                ),
                if (_expanded) ...[
                  SizedBox(height: buttonRunSpacing),
                  // Force full width so spaceBetween has room to justify; unlike
                  // the collapsed row it has no full-width Play pill to stretch it.
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: buttonSpacing,
                      runSpacing: buttonRunSpacing,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      // Match the collapsed row: justify the revealed tiles edge
                      // to edge on mobile instead of piling space on the right.
                      alignment: compact
                          ? WrapAlignment.spaceBetween
                          : WrapAlignment.start,
                      children: normalizedExtraButtons,
                    ),
                  ),
                ],
              ],
            ),
          );
        }
      } else {
        final wrapAlignment =
            widget.modernStyle ? WrapAlignment.start : WrapAlignment.center;
        rowContent = Align(
          alignment:
              widget.modernStyle ? Alignment.centerLeft : Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: widget.modernStyle
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Wrap(
                spacing: buttonSpacing,
                runSpacing: buttonRunSpacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: wrapAlignment,
                children: [...normalizedPrimaryButtons, moreButton],
              ),
              if (_expanded) ...[
                SizedBox(height: buttonRunSpacing),
                Wrap(
                  spacing: buttonSpacing,
                  runSpacing: buttonRunSpacing,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: wrapAlignment,
                  children: normalizedExtraButtons,
                ),
              ],
            ],
          ),
        );
      }
    }

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (focused == _rowHasFocus) return;
        _rowHasFocus = focused;
        if (!focused) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          final scrollable = Scrollable.maybeOf(context);
          if (scrollable == null) return;
          final position = scrollable.position;
          if (position.pixels <= position.minScrollExtent) return;
          position.animateTo(
            position.minScrollExtent,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
          );
        });
      },
      child: rowContent,
    );
  }

  String _formatResumePosition(Duration? position) {
    if (position == null) return '0:00';
    final h = position.inHours;
    final m = position.inMinutes.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  void _showAdminDialog(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E24),
          title: Text(
            l10n.adminControls,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus(
                onKeyEvent: (_, event) {
                  if (isActivateKey(event)) {
                    Navigator.of(context).pop();
                    ChangeArtworkDialog.show(context, item: item).then((changed) {
                      if (changed == true) {
                        viewModel.load();
                      }
                    });
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: Builder(
                  builder: (context) {
                    final hasFocus = Focus.of(context).hasFocus;
                    return InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        final changed = await ChangeArtworkDialog.show(context, item: item);
                        if (changed == true) {
                          viewModel.load();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: hasFocus ? Colors.white12 : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.image, color: Colors.white70),
                            const SizedBox(width: 12),
                            Text(l10n.changeArtwork, style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (!PlatformDetection.isTV)
                Focus(
                  onKeyEvent: (_, event) {
                    if (isActivateKey(event)) {
                      Navigator.of(context).pop();
                      context.push(Destinations.adminMetadata(item.id));
                      return KeyEventResult.handled;
                    }
                    return KeyEventResult.ignored;
                  },
                  child: Builder(
                    builder: (context) {
                      final hasFocus = Focus.of(context).hasFocus;
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          context.push(Destinations.adminMetadata(item.id));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: hasFocus ? Colors.white12 : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.edit_note, color: Colors.white70),
                              const SizedBox(width: 12),
                              Text(l10n.editMetadata, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Focus(
                onKeyEvent: (_, event) {
                  if (isActivateKey(event)) {
                    Navigator.of(context).pop();
                    _confirmDeleteItem(context, item);
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: Builder(
                  builder: (context) {
                    final hasFocus = Focus.of(context).hasFocus;
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        _confirmDeleteItem(context, item);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: hasFocus ? Colors.white12 : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.delete_forever, color: Colors.redAccent),
                            const SizedBox(width: 12),
                            Text(l10n.delete, style: const TextStyle(color: Colors.redAccent)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmDeleteItem(
    BuildContext context,
    AggregatedItem item,
  ) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await _showDeleteConfirmationDialog(
      context,
      title: l10n.deleteItem,
      message: l10n.deleteConfirmMessage(item.name),
    );
    if (!confirmed) return;

    final success = await viewModel.deleteItem();
    if (!mounted || !context.mounted) return;

    if (success) {
      if (Navigator.of(context).canPop()) {
        context.pop(true);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.itemDeleted)));
      }
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.failedToDeleteItem)));
  }

  int? _activePlaybackAudioIndex() {
    final item = widget.viewModel.item;
    if (item == null) return null;
    final manager = GetIt.instance<PlaybackManager>();
    final queued = manager.queueService.currentItem;
    if (queued?.id != item.id) return null;
    return manager.audioStreamIndex;
  }

  int? _activePlaybackSubtitleIndex() {
    final item = widget.viewModel.item;
    if (item == null) return null;
    final manager = GetIt.instance<PlaybackManager>();
    final queued = manager.queueService.currentItem;
    if (queued?.id != item.id) return null;
    return manager.subtitleStreamIndex;
  }

  int? _effectiveAudioStreamIndex(List<Map<String, dynamic>> audioStreams) {
    if (_selectedAudioIndex != null) {
      return _selectedAudioIndex;
    }
    final active = _activePlaybackAudioIndex();
    if (active != null) {
      return active;
    }

    final prefs = GetIt.instance<UserPreferences>();
    return computeEffectiveAudioIndex(
      audioStreams: audioStreams,
      preferredAudioLanguage: prefs.get(UserPreferences.defaultAudioLanguage),
      fallbackAudioLanguage: prefs.get(UserPreferences.fallbackAudioLanguage),
      preferDefaultAudioTrack: prefs.get(UserPreferences.preferDefaultAudioTrack),
      preferAudioDescription: prefs.get(UserPreferences.preferAudioDescription),
      explicitAudioIndex: null,
    );
  }

  int? _effectiveSubtitleStreamIndex(
    List<Map<String, dynamic>> subtitleStreams,
    List<Map<String, dynamic>> audioStreams,
  ) {
    final prefs = GetIt.instance<UserPreferences>();
    final audioStreamIndex = _effectiveAudioStreamIndex(audioStreams);
    String? activeAudioLanguage;
    if (audioStreamIndex != null) {
      final activeAudioStream = audioStreams.firstWhere(
        (s) => s['Index'] == audioStreamIndex,
        orElse: () => <String, dynamic>{},
      );
      activeAudioLanguage = activeAudioStream['Language'] as String?;
    }

    final item = widget.viewModel.item;
    var preferredLanguage = prefs.get(UserPreferences.defaultSubtitleLanguage);
    var subtitleMode = prefs.get(UserPreferences.subtitleMode);

    if (item != null && item.type == 'Episode' && item.seriesId != null) {
      final seriesLanguage = prefs.getSeriesSubtitleLanguage(item.seriesId!);
      if (seriesLanguage == 'none') {
        return -1;
      } else if (seriesLanguage.isNotEmpty) {
        preferredLanguage = seriesLanguage;
        if (subtitleMode == SubtitleMode.none) {
          subtitleMode = SubtitleMode.always;
        }
      }
    }

    return computeEffectiveSubtitleIndex(
      subtitleStreams: subtitleStreams,
      selectedSubtitleIndex: _selectedSubtitleIndex,
      activePlaybackSubtitleIndex: _activePlaybackSubtitleIndex(),
      subtitleMode: subtitleMode,
      preferredLanguage: preferredLanguage,
      fallbackLanguage: prefs.get(UserPreferences.fallbackSubtitleLanguage),
      preferSdh: prefs.get(UserPreferences.preferSdhSubtitles),
      pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay),
      assDirectPlay: prefs.get(UserPreferences.assDirectPlay),
      preferredAudioLanguage: prefs.get(UserPreferences.defaultAudioLanguage),
      activeAudioLanguage: activeAudioLanguage,
    );
  }

  bool _isInSyncPlayGroup() {
    try {
      return GetIt.instance<SyncPlayManager>().state.enabled;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _shouldForceTranscodeForDolbyVision(
    BuildContext context,
    List<AggregatedItem> queue, {
    String? mediaSourceId,
  }) async {
    return _shouldForceTranscodeForDolbyVisionQueue(
      context,
      queue,
      mediaSourceId: mediaSourceId ?? widget.selectedMediaSourceId,
    );
  }

  void _watchWithGroup(BuildContext context, AggregatedItem item) {
    _play(context, item);
    final syncPlay = GetIt.instance<SyncPlayManager>();
    final l10n = AppLocalizations.of(context);
    final groupName =
        syncPlay.state.groupName ?? l10n.syncPlayGroupFallbackName;
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.syncPlaySyncingPlaybackToGroup(groupName))),
      );
    }
  }

  void _showAdvancedPlaybackMenu(
    BuildContext context,
    AggregatedItem item, {
    bool forceStartOver = false,
  }) async {
    final l10n = AppLocalizations.of(context);
    final resume =
        !forceStartOver && (item.playbackPosition?.inMilliseconds ?? 0) > 0;

    final client = GetIt.instance<MediaServerClient>();
    final isAdmin = GetIt.instance<UserRepository>().currentUser?.isAdministrator ?? false;
    final canChangeArtwork = client.serverType == ServerType.jellyfin && isAdmin;

    final options = [
      if (canChangeArtwork)
        _AdvancedPlaybackOption(
          label: l10n.changeArtwork,
          icon: Icons.image_outlined,
          onTap: () async {
            final changed = await ChangeArtworkDialog.show(context, item: item);
            if (changed == true) {
              viewModel.load();
            }
          },
        ),
      if (PlatformDetection.isAndroid &&
          GetIt.instance<UserPreferences>()
              .get(UserPreferences.externalPlayerComponentName)
              .trim()
              .isNotEmpty)
        _AdvancedPlaybackOption(
          label: 'Open in External Player',
          icon: Icons.open_in_new,
          onTap: () {
            _play(context, item, resume: resume, openInExternalPlayer: true);
          },
        ),
      _AdvancedPlaybackOption(
        label: 'Transcode Stream: High Quality (1080p)',
        icon: Icons.high_quality,
        onTap: () {
          _play(
            context,
            item,
            resume: resume,
            forceMaxBitrateMbps: 4,
            forceTranscode: true,
          );
        },
      ),
      _AdvancedPlaybackOption(
        label: 'Transcode Stream: Medium Quality (720p)',
        icon: Icons.video_settings,
        onTap: () {
          _play(
            context,
            item,
            resume: resume,
            forceMaxBitrateMbps: 2,
            forceTranscode: true,
          );
        },
      ),
      _AdvancedPlaybackOption(
        label: 'Transcode Stream: Low Quality (480p)',
        icon: Icons.sd,
        onTap: () {
          _play(
            context,
            item,
            resume: resume,
            forceMaxBitrateMbps: 1,
            forceTranscode: true,
          );
        },
      ),
    ];

    var picked = false;
    await showFocusRestoringDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) => SimpleDialog(
        title: const Text('Advanced Playback'),
        children: options.asMap().entries.map((entry) {
          final i = entry.key;
          final option = entry.value;
          return FocusableButton(
            autofocus: i == 0,
            borderRadius: 6,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            onPressed: () {
              if (picked) return;
              picked = true;
              Navigator.of(dialogContext).pop();
              option.onTap();
            },
            child: Row(
              children: [
                AdaptiveIcon(option.icon, size: 22),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    option.label,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _play(
    BuildContext context,
    AggregatedItem item, {
    bool resume = false,
    int? forceMaxBitrateMbps,
    bool forceTranscode = false,
    bool openInExternalPlayer = false,
  }) async {
    if (_playLaunchInFlight) return;
    _playLaunchInFlight = true;
    try {
      final manager = GetIt.instance<PlaybackManager>();
      manager.setBitrateOverride(forceMaxBitrateMbps);
      if (openInExternalPlayer) {
        manager.forceExternalPlayerOnce();
      }
      await _playInternal(
        context,
        item,
        resume: resume,
        forceTranscode: forceTranscode,
        useExternalPlayer:
            openInExternalPlayer ||
            (PlatformDetection.isAndroid &&
                PlatformDetection.isTV &&
                GetIt.instance<UserPreferences>().get(
                  UserPreferences.useExternalPlayer,
                )),
      );
    } finally {
      _playLaunchInFlight = false;
    }
  }

  void _shuffle(BuildContext context, AggregatedItem item) async {
    if (_playLaunchInFlight) return;
    _playLaunchInFlight = true;
    try {
      await _shuffleInternal(context, item);
    } finally {
      _playLaunchInFlight = false;
    }
  }

  bool _supportsShuffle(AggregatedItem item) {
    switch (item.type) {
      case 'Series':
        return viewModel.nextUp != null || viewModel.seasons.isNotEmpty;
      case 'Season':
        return viewModel.episodes.length > 1;
      case 'BoxSet':
        return viewModel.collectionItems.length > 1 ||
            (item.rawData['ChildCount'] as num? ?? 0) > 1;
      case 'Folder':
      case 'CollectionFolder':
      case 'UserView':
        final childCount = item.rawData['ChildCount'];
        if (childCount is num) {
          return childCount > 1;
        }
        return true;
      default:
        return false;
    }
  }

  MediaServerClient _clientForItem(AggregatedItem item) {
    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final defaultClient = GetIt.instance<MediaServerClient>();
    if (item.serverId.isEmpty) {
      return defaultClient;
    }
    return clientFactory.getClientIfExists(item.serverId) ?? defaultClient;
  }

  Future<List<AggregatedItem>> _moviePrerollsForStart(
    AggregatedItem item,
    Duration startPosition,
  ) async {
    if (item.type != 'Movie') {
      return const [];
    }
    if (startPosition > Duration.zero) {
      return const [];
    }
    if (!GetIt.instance<UserPreferences>().get(
      UserPreferences.cinemaModeEnabled,
    )) {
      return const [];
    }

    try {
      final client = _clientForItem(item);
      final intros = await client.itemsApi.getIntros(item.id);
      if (intros.isEmpty) {
        return const [];
      }

      final prerolls = <AggregatedItem>[];
      for (final raw in intros) {
        final id = raw['Id']?.toString();
        if (id == null || id.isEmpty) {
          continue;
        }
        final prerollRaw = Map<String, dynamic>.from(raw)
          ..['__moonfinIsPreroll'] = true;
        prerolls.add(
          AggregatedItem(id: id, serverId: item.serverId, rawData: prerollRaw),
        );
      }
      return prerolls;
    } catch (_) {
      return const [];
    }
  }

  Future<List<AggregatedItem>> _shuffleQueueForItem(AggregatedItem item) async {
    const shuffleQueueFields =
        'MediaStreams,MediaSources,RunTimeTicks,Trickplay,Chapters';
    switch (item.type) {
      case 'Series':
        if (viewModel.episodes.length > 1) {
          return viewModel.episodes;
        }
        return _loadSeriesEpisodesForShuffle(item, fields: shuffleQueueFields);
      case 'Season':
        return viewModel.episodes;
      case 'BoxSet':
        if (viewModel.collectionItems.length > 1) {
          return viewModel.collectionItems;
        }
        return _loadFolderPlayableItemsForShuffle(
          item,
          fields: shuffleQueueFields,
        );
      case 'Folder':
      case 'CollectionFolder':
      case 'UserView':
        return _loadFolderPlayableItemsForShuffle(
          item,
          fields: shuffleQueueFields,
        );
      default:
        return const [];
    }
  }

  Future<List<AggregatedItem>> _loadSeriesEpisodesForShuffle(
    AggregatedItem item, {
    required String fields,
  }) async {
    final client = _clientForItem(item);
    try {
      final data = await client.itemsApi.getEpisodes(item.id, fields: fields);
      return _mapRawItemsForServer(data['Items'], item.serverId);
    } catch (_) {
      return const [];
    }
  }

  Future<List<AggregatedItem>> _loadFolderPlayableItemsForShuffle(
    AggregatedItem item, {
    required String fields,
  }) async {
    final client = _clientForItem(item);
    try {
      final data = await client.itemsApi.getItems(
        parentId: item.id,
        recursive: true,
        includeItemTypes: const ['Episode', 'Movie', 'Video', 'Audio'],
        sortBy: 'SortName',
        fields: fields,
      );
      return _mapRawItemsForServer(data['Items'], item.serverId);
    } catch (_) {
      return const [];
    }
  }

  List<AggregatedItem> _mapRawItemsForServer(
    dynamic rawItems,
    String serverId,
  ) {
    final items =
        (rawItems as List?)
            ?.whereType<Map>()
            .map((raw) => raw.cast<String, dynamic>())
            .toList() ??
        const <Map<String, dynamic>>[];
    return items
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
  }

  List<AggregatedItem> _truncateQueueIfImmediateNextUnplayable(
    List<AggregatedItem> queue, {
    required int startIndex,
  }) {
    if (startIndex < 0 || startIndex >= queue.length - 1) {
      return queue;
    }

    final immediateNext = queue[startIndex + 1];
    if (isEligibleNextEpisodeCandidate(immediateNext)) {
      return queue;
    }

    return queue.sublist(0, startIndex + 1);
  }

  Future<bool> _pushPlayerRouteWhileStartingPlayback(
    BuildContext context, {
    required String destination,
    required Future<bool> startupFuture,
    bool reloadOnReturn = true,
  }) async {
    if (!context.mounted) return false;
    final manager = GetIt.instance<PlaybackManager>();
    final pushVideoEarly =
        destination == Destinations.videoPlayer && PlatformDetection.isIOS;

    void popTopPlayerRoute() {
      final route = ModalRoute.of(context);
      if (route != null && !route.isCurrent) {
        Navigator.of(context).pop();
      }
    }

    Future<Object?>? routeFuture;
    if (destination != Destinations.videoPlayer || pushVideoEarly) {
      routeFuture = context.push(destination);
    }

    bool started;
    try {
      started = await startupFuture;
    } catch (_) {
      if (routeFuture != null && context.mounted) {
        popTopPlayerRoute();
      }
      rethrow;
    }

    if (!started) {
      if (routeFuture != null && context.mounted) {
        popTopPlayerRoute();
      }
      return false;
    }

    if (!context.mounted) return false;

    if (pushVideoEarly &&
        routeFuture != null &&
        manager.playbackDeferredToExternalPlayer) {
      popTopPlayerRoute();
      routeFuture = null;
    }

    if (routeFuture == null) {
      var resolvedDestination = destination;
      if (manager.playbackDeferredToExternalPlayer) {
        resolvedDestination = Destinations.externalPlayer;
      }
      if (!context.mounted) return false;
      routeFuture = context.push(resolvedDestination);
    }

    await routeFuture;
    _syncAudioSelectionFromActivePlayback();
    _syncSubtitleSelectionFromActivePlayback();

    final lastPlayed = manager.lastPlayedItem;
    if (lastPlayed is AggregatedItem) {
      final lastPlayedType = lastPlayed.type?.toLowerCase();
      final currentType = viewModel.item?.type?.toLowerCase();

      if (currentType == 'episode' &&
          lastPlayedType == 'episode' &&
          lastPlayed.id != widget.itemId) {
        if (context.mounted) {
          final currentSeasonId = viewModel.item?.seasonId;
          if (lastPlayed.seasonId != null &&
              lastPlayed.seasonId!.isNotEmpty &&
              lastPlayed.seasonId != currentSeasonId) {
            final router = GoRouter.of(context);
            router.pushReplacement(
              Destinations.item(lastPlayed.seasonId!, serverId: lastPlayed.serverId),
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              router.push(
                Destinations.item(lastPlayed.id, serverId: lastPlayed.serverId),
              );
            });
          } else {
            context.pushReplacement(
              Destinations.item(lastPlayed.id, serverId: lastPlayed.serverId),
            );
          }
        }
        return true;
      } else if (currentType == 'season' &&
          lastPlayedType == 'episode' &&
          lastPlayed.seasonId != null &&
          lastPlayed.seasonId!.isNotEmpty &&
          lastPlayed.seasonId != widget.itemId) {
        if (context.mounted) {
          context.pushReplacement(
            Destinations.item(lastPlayed.seasonId!, serverId: lastPlayed.serverId),
          );
        }
        return true;
      }
    }

    if (reloadOnReturn) {
      viewModel.load();
    }
    return true;
  }

  Future<void> _playInternal(
    BuildContext context,
    AggregatedItem item, {
    bool resume = false,
    bool forceTranscode = false,
    bool useExternalPlayer = false,
  }) async {
    final manager = GetIt.instance<PlaybackManager>();
    final mediaStreams = _mediaStreamsForCurrentSelection(item);
    final audioStreams = mediaStreams
        .where((s) => s['Type'] == 'Audio')
        .toList();
    final subtitleStreams = mediaStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();
    final audioStreamIndex = _effectiveAudioStreamIndex(audioStreams);
    final subtitleStreamIndex = _effectiveSubtitleStreamIndex(subtitleStreams, audioStreams);

    if (item.type == 'Photo') {
      await context.push(Destinations.photo(item.id));
      return;
    }

    if (_isReadableBookItem(item)) {
      final extension = BookReaderService.detectExtension(item);
      if (extension != null &&
          !BookReaderService.isSupportedExtension(extension)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(context).unsupportedBookFormat(extension),
              ),
            ),
          );
        }
        return;
      }

      await context.push(Destinations.book(item.id, serverId: item.serverId));
      viewModel.load();
      return;
    }

    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';

    final startupFuture = _runWithDolbyVisionStartupFallbackPrompt(
      context,
      manager,
      () async {
        switch (item.type) {
          case 'Series':
            const episodeQueueFields =
                'Overview,MediaStreams,MediaSources,RunTimeTicks,Trickplay,UserData,Chapters';

            final client = _clientForItem(item);
            final data = await client.itemsApi.getEpisodes(
              item.id,
              fields: episodeQueueFields,
            );
            final allEpisodes = _mapRawItemsForServer(
              data['Items'],
              item.serverId,
            ).where(isEligibleNextEpisodeCandidate).toList();

            if (allEpisodes.isEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context).noEpisodesLoaded,
                    ),
                  ),
                );
              }
              throw PlaybackStartupRecoveryAbortedException();
            }

            final ws = _computeWatchState(item);
            final isFullyWatched = ws.isFullyWatched;
            final isFullyUnwatched = ws.isFullyUnwatched;

            AggregatedItem targetEpisode;
            if (isFullyWatched || isFullyUnwatched) {
              final s1e1 = allEpisodes.firstWhere(
                (e) => e.parentIndexNumber == 1 && e.indexNumber == 1,
                orElse: () => allEpisodes.first,
              );
              targetEpisode = s1e1;
            } else {
              final firstUnwatched = allEpisodes.firstWhere(
                (e) => !e.isPlayed,
                orElse: () => allEpisodes.first,
              );
              targetEpisode = firstUnwatched;
            }

            final targetSeasonId = targetEpisode.seasonId;
            var queueEpisodes = <AggregatedItem>[targetEpisode];
            if (targetSeasonId != null && targetSeasonId.isNotEmpty) {
              try {
                final seasonData = await client.itemsApi.getEpisodes(
                  item.id,
                  seasonId: targetSeasonId,
                  fields: episodeQueueFields,
                );
                final seasonEpisodes = _mapRawItemsForServer(
                  seasonData['Items'],
                  item.serverId,
                );
                final playableSeasonEpisodes = seasonEpisodes
                    .where(isEligibleNextEpisodeCandidate)
                    .toList();
                if (playableSeasonEpisodes.isNotEmpty) {
                  queueEpisodes = playableSeasonEpisodes;
                }
              } catch (_) {}
            }

            final startIndex = queueEpisodes.indexWhere(
              (e) => e.id == targetEpisode.id,
            );
            final idx = startIndex >= 0 ? startIndex : 0;
            final selectedEpisode = queueEpisodes[idx];
            final seriesQueue = _truncateQueueIfImmediateNextUnplayable(
              queueEpisodes,
              startIndex: idx,
            );
            final startPosition = resume
                ? (selectedEpisode.playbackPosition ?? Duration.zero)
                : Duration.zero;

            if (!context.mounted) return;
            final dvForceTranscode = await _shouldForceTranscodeForDolbyVision(
              context,
              [selectedEpisode],
            );
            final directAllowed = !dvForceTranscode && !forceTranscode;
            await manager.playItems(
              seriesQueue,
              startIndex: idx,
              startPosition: startPosition,
              audioStreamIndex: audioStreamIndex,
              subtitleStreamIndex: subtitleStreamIndex,
              audioSelectionExplicit: viewModel.selectedAudioIndex != null,
              subtitleSelectionExplicit:
                  viewModel.selectedSubtitleIndex != null,
              enableDirectPlay: directAllowed,
              enableDirectStream: directAllowed,
            );

          case 'Season':
            final episodes = viewModel.episodes
                .where(isEligibleNextEpisodeCandidate)
                .toList();
            if (episodes.isEmpty) return;
            final startIndex = resume
                ? episodes.indexWhere(
                    (e) => (e.playedPercentage ?? 0) > 0 && !e.isPlayed,
                  )
                : episodes.indexWhere((e) => !e.isPlayed);
            final idx = startIndex >= 0 ? startIndex : 0;
            final selectedEpisode = episodes[idx];
            final seasonQueue = _truncateQueueIfImmediateNextUnplayable(
              episodes,
              startIndex: idx,
            );
            final startPosition = resume
                ? (selectedEpisode.playbackPosition ?? Duration.zero)
                : Duration.zero;
            final dvForceTranscode = await _shouldForceTranscodeForDolbyVision(
              context,
              [selectedEpisode],
            );
            final directAllowed = !dvForceTranscode && !forceTranscode;
            await manager.playItems(
              seasonQueue,
              startIndex: idx,
              startPosition: startPosition,
              audioStreamIndex: audioStreamIndex,
              subtitleStreamIndex: subtitleStreamIndex,
              audioSelectionExplicit: viewModel.selectedAudioIndex != null,
              subtitleSelectionExplicit:
                  viewModel.selectedSubtitleIndex != null,
              enableDirectPlay: directAllowed,
              enableDirectStream: directAllowed,
            );

          case 'Episode':
            var episodes = viewModel.episodes;
            if (episodes.isEmpty || !episodes.any((e) => e.id == item.id)) {
              final seriesId = item.seriesId;
              final seasonId = item.seasonId;
              if (seriesId != null && seriesId.isNotEmpty) {
                try {
                  const episodeQueueFields =
                      'Overview,MediaStreams,MediaSources,RunTimeTicks,Trickplay,UserData,Chapters';
                  final client = _clientForItem(item);
                  final data = await client.itemsApi.getEpisodes(
                    seriesId,
                    seasonId: seasonId,
                    fields: episodeQueueFields,
                  );
                  episodes = _mapRawItemsForServer(
                    data['Items'],
                    item.serverId,
                  );
                } catch (_) {}
              }
            }
            if (!context.mounted) return;

            if (episodes.length > 1) {
              final playableEpisodes = episodes
                  .where(
                    (e) => e.id == item.id || isEligibleNextEpisodeCandidate(e),
                  )
                  .toList();
              final startIndex = playableEpisodes.indexWhere(
                (e) => e.id == item.id,
              );
              final idx = startIndex >= 0 ? startIndex : 0;
              final selectedEpisode = playableEpisodes[idx];
              final episodeQueue = _truncateQueueIfImmediateNextUnplayable(
                playableEpisodes,
                startIndex: idx,
              );

              // Fallback to the master item's position context if it's the target episode
              final startPosition = resume
                  ? ((selectedEpisode.id == item.id
                            ? item.playbackPosition
                            : selectedEpisode.playbackPosition) ??
                        Duration.zero)
                  : Duration.zero;

              final dvForceTranscode =
                  await _shouldForceTranscodeForDolbyVision(context, [
                    selectedEpisode,
                  ], mediaSourceId: widget.selectedMediaSourceId);
              final directAllowed = !dvForceTranscode && !forceTranscode;
              await manager.playItems(
                episodeQueue,
                startIndex: idx,
                startPosition: startPosition,
                audioStreamIndex: audioStreamIndex,
                subtitleStreamIndex: subtitleStreamIndex,
                audioSelectionExplicit: viewModel.selectedAudioIndex != null,
                subtitleSelectionExplicit:
                    viewModel.selectedSubtitleIndex != null,
                mediaSourceId: widget.selectedMediaSourceId,
                enableDirectPlay: directAllowed,
                enableDirectStream: directAllowed,
              );
              break;
            }
            continue defaultCase;

          case 'BoxSet':
            final playableQueue = await _loadFolderPlayableItemsForShuffle(
              item,
              fields:
                  'Overview,MediaStreams,MediaSources,RunTimeTicks,Trickplay,UserData',
            );
            if (playableQueue.isEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context).noEpisodesLoaded,
                    ),
                  ),
                );
              }
              throw PlaybackStartupRecoveryAbortedException();
            }

            final allWatched = playableQueue.every((e) => e.isPlayed);
            final allUnwatched = playableQueue.every(
              (e) =>
                  !e.isPlayed &&
                  (e.playbackPosition == null ||
                      e.playbackPosition == Duration.zero),
            );

            int startIndex = 0;
            Duration startPosition = Duration.zero;

            if (allWatched || allUnwatched) {
              startIndex = 0;
              startPosition = Duration.zero;
            } else {
              final resumeIndex = playableQueue.indexWhere(
                (e) =>
                    !e.isPlayed &&
                    (e.playbackPosition != null &&
                        e.playbackPosition! > Duration.zero),
              );
              if (resumeIndex >= 0) {
                startIndex = resumeIndex;
                startPosition =
                    playableQueue[resumeIndex].playbackPosition ??
                    Duration.zero;
              } else {
                final nextUnwatchedIndex = playableQueue.indexWhere(
                  (e) => !e.isPlayed,
                );
                startIndex = nextUnwatchedIndex >= 0 ? nextUnwatchedIndex : 0;
                startPosition = Duration.zero;
              }
            }

            if (!context.mounted) return;
            final targetItem = playableQueue[startIndex];
            final dvForceTranscode = await _shouldForceTranscodeForDolbyVision(
              context,
              [targetItem],
            );
            final directAllowed = !dvForceTranscode && !forceTranscode;
            await manager.playItems(
              playableQueue,
              startIndex: startIndex,
              startPosition: startPosition,
              audioStreamIndex: audioStreamIndex,
              subtitleStreamIndex: subtitleStreamIndex,
              audioSelectionExplicit: viewModel.selectedAudioIndex != null,
              subtitleSelectionExplicit:
                  viewModel.selectedSubtitleIndex != null,
              enableDirectPlay: directAllowed,
              enableDirectStream: directAllowed,
            );
            break;

          case 'MusicArtist':
            final client = _clientForItem(item);
            final data = await client.itemsApi.getItems(
              artistIds: [item.id],
              includeItemTypes: const ['Audio'],
              sortBy: 'Album,ParentIndexNumber,IndexNumber,SortName',
              recursive: true,
              fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
            );
            final tracks = _mapRawItemsForServer(data['Items'], item.serverId);
            if (tracks.isEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).noItemsFound)),
                );
              }
              throw PlaybackStartupRecoveryAbortedException();
            }
            await manager.playItems(tracks);
            break;

          case 'MusicAlbum':
            var tracks = viewModel.tracks;
            if (tracks.isEmpty) {
              final client = _clientForItem(item);
              final data = await client.itemsApi.getItems(
                parentId: item.id,
                includeItemTypes: const ['Audio'],
                sortBy: 'ParentIndexNumber,IndexNumber,SortName',
                fields: 'PrimaryImageAspectRatio,BasicSyncInfo',
              );
              tracks = _mapRawItemsForServer(data['Items'], item.serverId);
            }
            if (tracks.isEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).noItemsFound)),
                );
              }
              throw PlaybackStartupRecoveryAbortedException();
            }
            await manager.playItems(tracks);
            break;

          case 'Playlist':
            var tracks = viewModel.tracks;
            if (tracks.isEmpty) {
              final client = _clientForItem(item);
              final data = await client.itemsApi.getPlaylistItems(item.id);
              tracks = _mapRawItemsForServer(data['Items'], item.serverId);
            }
            if (tracks.isEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).noItemsFound)),
                );
              }
              throw PlaybackStartupRecoveryAbortedException();
            }
            if (!context.mounted) return;
            // Playlists can contain video, so honor the Dolby Vision
            // force-transcode check before allowing direct play/stream.
            final dvForceTranscode =
                await _shouldForceTranscodeForDolbyVision(context, tracks);
            final directAllowed = !dvForceTranscode && !forceTranscode;
            await manager.playItems(
              tracks,
              enableDirectPlay: directAllowed,
              enableDirectStream: directAllowed,
            );
            break;

          case 'AudioBook':
            final client = _clientForItem(item);
            const audioChildFields =
                'BasicSyncInfo,PrimaryImageAspectRatio,RunTimeTicks,MediaSources,MediaSourceCount,MediaType,IndexNumber,ParentIndexNumber,Artists,AlbumArtist,Genres,Chapters';
            bool isAudioChild(dynamic e) {
              final childType = e is Map ? e['Type']?.toString() : null;
              return childType == 'Audio' || childType == 'AudioBook';
            }

            final data = await client.itemsApi.getItems(
              parentId: item.id,
              includeItemTypes: const ['Audio', 'AudioBook'],
              sortBy: 'ParentIndexNumber,IndexNumber,SortName',
              fields: audioChildFields,
            );
            // A container audiobook lists its chapters as child items. A
            // single-file audiobook is a leaf: Jellyfin answers a ParentId query
            // against a leaf by ignoring the filter and returning the top-level
            // libraries (CollectionFolder/UserView), so keep only real tracks.
            final rawChildren = (data['Items'] as List?) ?? const [];
            final childItems = rawChildren.where(isAudioChild).toList();
            if (childItems.isNotEmpty) {
              await manager.playItems(
                _mapRawItemsForServer(childItems, item.serverId),
              );
              break;
            }

            // Leaf audiobook: enqueue the sibling chapters from the parent
            // folder so the book plays through, starting at this file.
            final parentId = item.rawData['ParentId']?.toString();
            if (parentId != null && parentId.isNotEmpty) {
              final siblingData = await client.itemsApi.getItems(
                parentId: parentId,
                includeItemTypes: const ['Audio', 'AudioBook'],
                sortBy: 'ParentIndexNumber,IndexNumber,SortName',
                fields: audioChildFields,
              );
              final siblingsRaw = (siblingData['Items'] as List?) ?? const [];
              final siblings = _mapRawItemsForServer(
                siblingsRaw.where(isAudioChild).toList(),
                item.serverId,
              );
              final startIndex = siblings.indexWhere((t) => t.id == item.id);
              if (siblings.isNotEmpty && startIndex >= 0) {
                await manager.playItems(siblings, startIndex: startIndex);
                break;
              }
            }

            continue defaultCase;

          defaultCase:
          default:
            final startPosition = resume
                ? (item.playbackPosition ?? Duration.zero)
                : Duration.zero;
            final prerolls = useExternalPlayer
                ? const <AggregatedItem>[]
                : await _moviePrerollsForStart(item, startPosition);
            if (!context.mounted) return;
            final applyMainItemStreamOverrides = prerolls.isEmpty;
            final selectedMediaSourceId = widget.selectedMediaSourceId;
            final hasMainItemStreamOverrides =
                audioStreamIndex != null ||
                subtitleStreamIndex != null ||
                (selectedMediaSourceId != null &&
                    selectedMediaSourceId.isNotEmpty);
            final queue = prerolls.isEmpty
                ? <AggregatedItem>[item]
                : <AggregatedItem>[...prerolls, item];
            final dvForceTranscode =
                !isAudio &&
                await _shouldForceTranscodeForDolbyVision(context, [
                  item,
                ], mediaSourceId: selectedMediaSourceId);
            final directAllowed = !dvForceTranscode && !forceTranscode;
            final playItemsFuture = manager.playItems(
              queue,
              startPosition: startPosition,
              audioStreamIndex: applyMainItemStreamOverrides
                  ? audioStreamIndex
                  : null,
              subtitleStreamIndex: applyMainItemStreamOverrides
                  ? subtitleStreamIndex
                  : null,
              audioSelectionExplicit:
                  applyMainItemStreamOverrides &&
                  viewModel.selectedAudioIndex != null,
              subtitleSelectionExplicit:
                  applyMainItemStreamOverrides &&
                  viewModel.selectedSubtitleIndex != null,
              mediaSourceId: applyMainItemStreamOverrides
                  ? selectedMediaSourceId
                  : null,
              enableDirectPlay: directAllowed,
              enableDirectStream: directAllowed,
            );
            if (!applyMainItemStreamOverrides && hasMainItemStreamOverrides) {
              manager.setPendingItemOverrides(
                itemId: item.id,
                audioStreamIndex: audioStreamIndex,
                subtitleStreamIndex: subtitleStreamIndex,
                mediaSourceId: selectedMediaSourceId,
                audioSelectionExplicit: viewModel.selectedAudioIndex != null,
                subtitleSelectionExplicit:
                    viewModel.selectedSubtitleIndex != null,
              );
            }
            await playItemsFuture;
        }
      },
    );

    await _pushPlayerRouteWhileStartingPlayback(
      context,
      destination: isAudio
          ? Destinations.audioPlayer
          : Destinations.videoPlayer,
      startupFuture: startupFuture,
    );
  }

  Future<void> _shuffleInternal(
    BuildContext context,
    AggregatedItem item,
  ) async {
    final manager = GetIt.instance<PlaybackManager>();
    final queue = await _shuffleQueueForItem(item);
    final playableQueue = queue
        .where((e) => isEligibleNextEpisodeCandidate(e) || e.id == item.id)
        .toList();
    if (playableQueue.length < 2) return;
    if (!context.mounted) return;

    final shuffled = List<AggregatedItem>.from(playableQueue)..shuffle();
    final isAudio = shuffled.every((queuedItem) {
      final mediaType = queuedItem.rawData['MediaType'] as String?;
      return queuedItem.type == 'Audio' || mediaType == 'Audio';
    });

    final forceTranscode =
        !isAudio &&
        await _shouldForceTranscodeForDolbyVision(context, [shuffled.first]);

    if (!context.mounted) return;

    final startupFuture = _runWithDolbyVisionStartupFallbackPrompt(
      context,
      manager,
      () => manager.playItems(
        shuffled,
        enableDirectPlay: !forceTranscode,
        enableDirectStream: !forceTranscode,
      ),
    );

    await _pushPlayerRouteWhileStartingPlayback(
      context,
      destination: isAudio
          ? Destinations.audioPlayer
          : Destinations.videoPlayer,
      startupFuture: startupFuture,
    );
  }

  Future<void> _castToDevice(BuildContext context, AggregatedItem item) {
    final mediaStreams = _mediaStreamsForCurrentSelection(item);
    final audioStreams = mediaStreams
        .where((s) => s['Type'] == 'Audio')
        .toList();
    final subtitleStreams = mediaStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();
    final audioStreamIndex = _effectiveAudioStreamIndex(audioStreams);
    final subtitleStreamIndex = _effectiveSubtitleStreamIndex(subtitleStreams, audioStreams);
    final positionTicks = item.playbackPosition == null
        ? null
        : item.playbackPosition!.inMicroseconds * 10;
    return showRemotePlayToSessionDialog(
      context,
      item: item,
      startPositionTicks: positionTicks,
      mediaSourceId: widget.selectedMediaSourceId,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
  }

  List<Map<String, dynamic>> _mediaStreamsForCurrentSelection(
    AggregatedItem item,
  ) {
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    return _mediaStreamsForItem(item, selectedSource);
  }

  bool _hasTrailer(AggregatedItem item) {
    if (item.remoteTrailers.isNotEmpty) return true;
    return viewModel.features.any(_isTrailerFeatureItem);
  }

  bool _isTrailerFeatureItem(AggregatedItem feature) {
    final extraType = feature.rawData['ExtraType'] as String?;
    final type = feature.type;
    return extraType == 'Trailer' || type == 'Trailer';
  }

  AggregatedItem? _firstLocalTrailerFromFeatures(
    List<AggregatedItem> features,
  ) {
    final candidates = features
        .where(
          (feature) => _isTrailerFeatureItem(feature) && feature.id.isNotEmpty,
        )
        .toList(growable: false);
    return _preferredLocalTrailer(candidates);
  }

  AggregatedItem? _preferredLocalTrailer(List<AggregatedItem> candidates) {
    if (candidates.isEmpty) {
      return null;
    }

    final preferred = GetIt.instance<UserPreferences>()
        .get(UserPreferences.defaultAudioLanguage)
        .trim();
    if (preferred.isEmpty) {
      return candidates.first;
    }

    final preferredNormalized = normalizeLanguage(preferred);
    if (preferredNormalized.isEmpty) {
      return candidates.first;
    }
    final preferredIso3 = toIso3Language(preferredNormalized);

    for (final candidate in candidates) {
      if (_trailerHasPreferredAudio(
        candidate,
        preferredNormalized,
        preferredIso3,
      )) {
        return candidate;
      }
    }

    return candidates.first;
  }

  bool _trailerHasPreferredAudio(
    AggregatedItem trailer,
    String preferredNormalized,
    String preferredIso3,
  ) {
    final audioStreams = _audioStreamsForTrailer(trailer);
    return audioStreams.any(
      (stream) => languageMatchesPreferred(
        (stream['Language'] as String?)?.trim(),
        preferredNormalized,
        preferredIso3,
      ),
    );
  }

  List<Map<String, dynamic>> _audioStreamsForTrailer(AggregatedItem trailer) {
    final List<Map<String, dynamic>> audio = <Map<String, dynamic>>[];

    for (final stream in trailer.mediaStreams) {
      if (stream['Type'] == 'Audio') {
        audio.add(stream);
      }
    }

    for (final source in trailer.mediaSources) {
      final streams =
          (source['MediaStreams'] as List?)?.whereType<Map>() ?? const <Map>[];
      for (final stream in streams) {
        final casted = stream.cast<String, dynamic>();
        if (casted['Type'] == 'Audio') {
          audio.add(casted);
        }
      }
    }

    return audio;
  }

  Future<AggregatedItem?> _loadLocalTrailerOnDemand(AggregatedItem item) async {
    final client = GetIt.instance<MediaServerClient>();
    try {
      final trailers = await client.itemsApi.getLocalTrailers(item.id);
      final candidates = <AggregatedItem>[];
      for (final raw in trailers) {
        final id = raw['Id']?.toString();
        if (id == null || id.isEmpty) {
          continue;
        }
        candidates.add(
          AggregatedItem(id: id, serverId: item.serverId, rawData: raw),
        );
      }
      return _preferredLocalTrailer(candidates);
    } catch (_) {}
    return null;
  }

  Future<void> _playTrailer(BuildContext context, AggregatedItem item) async {
    final manager = GetIt.instance<PlaybackManager>();

    var localTrailer = _firstLocalTrailerFromFeatures(viewModel.features);
    localTrailer ??= await _loadLocalTrailerOnDemand(item);
    if (!context.mounted) return;

    if (localTrailer != null) {
      final forceTranscode = await _shouldForceTranscodeForDolbyVisionQueue(
        context,
        [localTrailer],
      );
      if (!context.mounted) return;
      final startupFuture = _runWithDolbyVisionStartupFallbackPrompt(
        context,
        manager,
        () => manager.playItems(
          [localTrailer],
          enableDirectPlay: !forceTranscode,
          enableDirectStream: !forceTranscode,
        ),
      );
      await _pushPlayerRouteWhileStartingPlayback(
        context,
        destination: Destinations.videoPlayer,
        startupFuture: startupFuture,
      );
      return;
    }

    final trailerUrl = item.remoteTrailers
        .map((t) => t['Url'] as String?)
        .whereType<String>()
        .firstWhere((u) => u.isNotEmpty, orElse: () => '');

    if (trailerUrl.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).noPlayableTrailerFound),
        ),
      );
      return;
    }

    await context.push(Destinations.trailer(url: trailerUrl));
  }

  void _showAudioSelector(
    BuildContext context,
    List<Map<String, dynamic>> streams,
  ) async {
    _syncAudioSelectionFromActivePlayback();
    final effectiveAudioIndex = _effectiveAudioStreamIndex(streams);
    final currentIdx = effectiveAudioIndex != null
        ? streams.indexWhere((s) => s['Index'] == effectiveAudioIndex)
        : streams.indexWhere((s) => s['IsDefault'] == true);
    final result = await TrackSelectorDialog.show(
      context,
      title: AppLocalizations.of(context).audioTrack,
      options: streams.asMap().entries.map((entry) {
        final l10n = AppLocalizations.of(context);
        final trackNumber = entry.key + 1;
        final s = entry.value;
        final display =
            s['DisplayTitle'] as String? ??
            s['Language'] as String? ??
            l10n.unknown;
        final codec = s['Codec'] as String?;
        return TrackOption(
          label: '$trackNumber - $display',
          subtitle: codec?.toUpperCase(),
          scrollLabel: true,
          scrollSubtitle: true,
        );
      }).toList(),
      selectedIndex: currentIdx >= 0 ? currentIdx : null,
    );
    if (result != null && result < streams.length) {
      setState(() => _selectedAudioIndex = streams[result]['Index'] as int?);
    }
  }

  bool _canDownloadRemoteSubtitles(AggregatedItem item) {
    final client = GetIt.instance<MediaServerClient>();
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
        !_isReadableBookItem(item) &&
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
    final preferred = GetIt.instance<UserPreferences>()
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
    List<Map<String, dynamic>> latestStreams = currentItem.mediaStreams
        .where((stream) => stream['Type'] == 'Subtitle')
        .toList(growable: false);

    for (var attempt = 0; attempt < attempts; attempt++) {
      await viewModel.load();
      if (!mounted) {
        return latestStreams;
      }

      final refreshedItem = viewModel.item;
      if (refreshedItem != null) {
        final mediaSource = selectedMediaSourceForItem(
          refreshedItem,
          widget.selectedMediaSourceId,
        );
        latestStreams = _mediaStreamsForItem(refreshedItem, mediaSource)
            .where((stream) => stream['Type'] == 'Subtitle')
            .toList(growable: false);
        final hasNewStream = latestStreams.any((stream) {
          final index = stream['Index'] as int?;
          return index != null && !existingIndexes.contains(index);
        });
        if (hasNewStream) {
          return latestStreams;
        }
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
    BuildContext context,
    AggregatedItem item,
    List<Map<String, dynamic>> subtitleStreams,
    List<Map<String, dynamic>> audioStreams,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final client = GetIt.instance<MediaServerClient>();
    final language = _remoteSubtitleLanguage(subtitleStreams, audioStreams);

    List<Map<String, dynamic>> results;
    try {
      results = await client.itemsApi.searchRemoteSubtitles(
        item.id,
        language: language,
      );
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            _remoteSubtitleErrorMessage(
              error,
              action: AppLocalizations.of(context).search,
            ),
          ),
        ),
      );
      return;
    }

    if (!context.mounted) {
      return;
    }
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
        final l10n = AppLocalizations.of(context);
        final label =
            subtitle['Name'] as String? ??
            subtitle['Author'] as String? ??
            l10n.subtitles;
        final subtitleText = _remoteSubtitleOptionSubtitle(subtitle);
        return TrackOption(
          label: label,
          subtitle: subtitleText.isNotEmpty ? subtitleText : null,
        );
      }).toList(),
    );

    if (!context.mounted || result == null || result >= results.length) {
      return;
    }

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
      if (!context.mounted) {
        return;
      }

      final existingIndexes = subtitleStreams
          .map((stream) => stream['Index'] as int?)
          .whereType<int>()
          .toSet();

      final refreshedSubtitleStreams = await _refreshSubtitleStreams(
        item,
        existingIndexes,
      );
      if (!context.mounted) {
        return;
      }

      final newStream = _findNewSubtitleStream(
        existingIndexes,
        refreshedSubtitleStreams,
      );

      if (newStream != null) {
        setState(() => _selectedSubtitleIndex = newStream['Index'] as int?);
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
      if (!context.mounted) {
        return;
      }
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            _remoteSubtitleErrorMessage(
              error,
              action: AppLocalizations.of(context).download,
            ),
          ),
        ),
      );
    }
  }

  void _showSubtitleSelector(
    BuildContext context,
    AggregatedItem item,
    List<Map<String, dynamic>> streams,
    List<Map<String, dynamic>> audioStreams,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    _syncSubtitleSelectionFromActivePlayback();
    final canDownloadRemote = _canDownloadRemoteSubtitles(item);
    final displayStreams = sortedSubtitleStreams(streams);
    final effectiveSubtitleIndex = _effectiveSubtitleStreamIndex(streams, audioStreams);
    final currentIdx = computeSubtitleDialogSelectedIndex(
      displayStreams,
      effectiveSubtitleIndex,
    );
    final options = [
      TrackOption(label: AppLocalizations.of(context).none),
      ...displayStreams.asMap().entries.map((entry) {
        final l10n = AppLocalizations.of(context);
        final trackNumber = entry.key + 1;
        final s = entry.value;
        final display =
            s['DisplayTitle'] as String? ??
            s['Language'] as String? ??
            l10n.unknown;
        final subtitleType = ((s['Codec'] as String?) ?? l10n.unknown)
            .toUpperCase();
        final deliveryMethod = (s['DeliveryMethod'] as String?)
            ?.trim()
            .toLowerCase();
        final location = s['IsExternal'] == true
            ? l10n.external
            : (deliveryMethod == 'embed' ? l10n.embedded : l10n.internal);
        return TrackOption(
          label: '$trackNumber - $display',
          subtitle: '$subtitleType · $location',
          scrollLabel: true,
          scrollSubtitle: true,
        );
      }),
    ];
    final downloadOptionIndex = canDownloadRemote ? options.length : null;
    if (canDownloadRemote) {
      options.add(
        TrackOption(
          label: AppLocalizations.of(context).downloadSubtitlesLabel,
          subtitle: AppLocalizations.of(context).searchOpenSubtitlesPlugin,
        ),
      );
    }
    final result = await TrackSelectorDialog.show(
      context,
      title: AppLocalizations.of(context).subtitleTrack,
      options: options,
      selectedIndex: currentIdx >= 0 ? currentIdx : 0,
    );
    if (!context.mounted) return;
    if (result != null) {
      if (downloadOptionIndex != null && result == downloadOptionIndex) {
        await _downloadRemoteSubtitles(context, item, streams, audioStreams);
        return;
      }
      final streamIndex = mapSubtitleResultToStreamIndex(result, displayStreams);
      if (streamIndex != null) {
        setState(() => _selectedSubtitleIndex = streamIndex);
        if (item.type == 'Episode' && item.seriesId != null) {
          final selectedStream = streams.firstWhere(
            (s) => s['Index'] == streamIndex,
            orElse: () => <String, dynamic>{},
          );
          final language = selectedStream.isEmpty ? 'none' : (selectedStream['Language'] as String? ?? '');
          await prefs.setSeriesSubtitleLanguage(item.seriesId!, language);
        }
      }
    }
  }

  void _showVersionSelector(
    BuildContext context,
    List<Map<String, dynamic>> sources,
  ) async {
    final currentIdx = widget.selectedMediaSourceId != null
        ? sources.indexWhere((s) => s['Id'] == widget.selectedMediaSourceId)
        : 0;
    final result = await TrackSelectorDialog.show(
      context,
      title: AppLocalizations.of(context).selectVersion,
      options: sources.asMap().entries.map((entry) {
        final s = entry.value;
        final name =
            s['Name'] as String? ??
            AppLocalizations.of(context).versionNumber(entry.key + 1);
        final bitrate = s['Bitrate'] as int?;
        final container = s['Container'] as String?;
        final subtitle = [
          if (container != null) container.toUpperCase(),
          if (bitrate != null) '${(bitrate / 1000000).toStringAsFixed(1)} Mbps',
        ].join(' | ');
        return TrackOption(
          label: name,
          subtitle: subtitle.isNotEmpty ? subtitle : null,
          labelMaxLines: null,
        );
      }).toList(),
      selectedIndex: currentIdx >= 0 ? currentIdx : 0,
    );
    if (result != null && result < sources.length) {
      final id = sources[result]['Id']?.toString();
      widget.onSelectedMediaSourceChanged(id);
    }
  }
}

Map<String, dynamic>? selectedMediaSourceForItem(
  AggregatedItem item,
  String? selectedMediaSourceId,
) {
  if (item.mediaSources.isEmpty) {
    return null;
  }
  if (selectedMediaSourceId == null || selectedMediaSourceId.isEmpty) {
    return item.mediaSources.first;
  }
  for (final source in item.mediaSources) {
    final id = source['Id']?.toString();
    if (id == selectedMediaSourceId) {
      return source;
    }
  }
  return item.mediaSources.first;
}

List<Map<String, dynamic>> _mediaStreamsForItem(
  AggregatedItem item,
  Map<String, dynamic>? mediaSource,
) {
  final rawStreams = mediaSource?['MediaStreams'];
  if (rawStreams is List) {
    final parsed = rawStreams
        .whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .toList(growable: false);
    if (parsed.isNotEmpty) {
      return parsed;
    }
  }
  return item.mediaStreams;
}

bool _allowDolbyVisionProfile7ElDirectPlay(UserPreferences prefs) {
  return KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
    behavior: prefs.get(UserPreferences.dolbyVisionProfile7DirectPlayBehavior),
  );
}

bool _shouldPromptDolbyVisionDirectPlayStartupFailure(
  PlaybackStartupFailureContext failure,
  UserPreferences prefs,
) {
  if (failure.resolution.playMethod == StreamPlayMethod.transcode) {
    return false;
  }
  if (!_allowDolbyVisionProfile7ElDirectPlay(prefs)) {
    return false;
  }
  return failure.resolution.mediaStreams.any(
    HdrStreamCapability.isDolbyVisionVideoStream,
  );
}

Future<PlaybackStartupRecoveryDecision>
_showDolbyVisionDirectPlayStartupFailureDecisionDialog(
  BuildContext context,
) async {
  final l10n = AppLocalizations.of(context);
  final retryWithTranscode = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog.adaptive(
        title: Text(l10n.dolbyVisionDirectPlayFailedTitle),
        content: Text(l10n.dolbyVisionDirectPlayFailedMessage),
        actions: [
          FocusableButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FocusableButton(
            autofocus: true,
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.retryWithTranscode),
          ),
        ],
      );
    },
  );

  if (retryWithTranscode == true) {
    return PlaybackStartupRecoveryDecision.retryWithTranscode;
  }
  return PlaybackStartupRecoveryDecision.abortPlayback;
}

Future<bool> _runWithDolbyVisionStartupFallbackPrompt(
  BuildContext context,
  PlaybackManager manager,
  Future<void> Function() playAction,
) async {
  final prefs = GetIt.instance<UserPreferences>();

  manager.setStartupRecoveryDecider((failure) async {
    if (!_shouldPromptDolbyVisionDirectPlayStartupFailure(failure, prefs)) {
      return PlaybackStartupRecoveryDecision.retryWithTranscode;
    }
    if (!context.mounted) {
      return PlaybackStartupRecoveryDecision.retryWithTranscode;
    }
    return _showDolbyVisionDirectPlayStartupFailureDecisionDialog(context);
  });

  try {
    await playAction();
    return true;
  } on PlaybackStartupRecoveryAbortedException {
    return false;
  } finally {
    manager.setStartupRecoveryDecider(null);
  }
}

({bool hasDolbyVision, bool hasUnsupportedProfile}) _analyzeDolbyVisionQueue(
  List<AggregatedItem> queue, {
  String? mediaSourceId,
  bool allowDolbyVisionProfile7ElDirectPlay = false,
}) {
  var hasDolbyVision = false;
  var hasUnsupportedProfile = false;

  for (final item in queue) {
    final selectedSource = selectedMediaSourceForItem(item, mediaSourceId);
    final streams = _mediaStreamsForItem(item, selectedSource);
    for (final stream in streams) {
      if (!hasDolbyVision &&
          HdrStreamCapability.isDolbyVisionVideoStream(stream)) {
        hasDolbyVision = true;
      }
      if (!hasUnsupportedProfile &&
          HdrStreamCapability.streamNeedsDolbyVisionProfileTranscode(
            stream,
            allowDolbyVisionProfile7ElDirectPlay:
                allowDolbyVisionProfile7ElDirectPlay,
          )) {
        hasUnsupportedProfile = true;
      }
      if (hasDolbyVision && hasUnsupportedProfile) {
        return (hasDolbyVision: true, hasUnsupportedProfile: true);
      }
    }
  }

  return (
    hasDolbyVision: hasDolbyVision,
    hasUnsupportedProfile: hasUnsupportedProfile,
  );
}

Future<_DolbyVisionPlayDecision?> _showDolbyVisionFallbackDecisionDialog(
  BuildContext context,
) async {
  final l10n = AppLocalizations.of(context);
  var rememberChoice = false;

  final choice = await showFocusRestoringDialog<DolbyVisionFallbackBehavior>(
    context: context,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          return AlertDialog.adaptive(
            title: Text(l10n.dolbyVisionNotSupportedTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.dolbyVisionNotSupportedMessage),
                const SizedBox(height: 12),
                FocusableButton(
                  onPressed: () => setDialogState(() {
                    rememberChoice = !rememberChoice;
                  }),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AdaptiveIcon(
                        rememberChoice
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.rememberMyChoice),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              FocusableButton(
                autofocus: true,
                onPressed: () {
                  Navigator.of(
                    dialogContext,
                  ).pop(DolbyVisionFallbackBehavior.hdr10Fallback);
                },
                child: Text(l10n.playHdr10Fallback),
              ),
              FocusableButton(
                onPressed: () {
                  Navigator.of(
                    dialogContext,
                  ).pop(DolbyVisionFallbackBehavior.transcode);
                },
                child: Text(l10n.requestTranscode),
              ),
            ],
          );
        },
      );
    },
  );

  if (choice == null) return null;
  return _DolbyVisionPlayDecision(
    forceTranscode: choice == DolbyVisionFallbackBehavior.transcode,
    rememberBehavior: rememberChoice ? choice : null,
  );
}

Future<bool> _shouldForceTranscodeForDolbyVisionQueue(
  BuildContext context,
  List<AggregatedItem> queue, {
  String? mediaSourceId,
}) async {
  if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) {
    return false;
  }

  final prefs = GetIt.instance<UserPreferences>();
  final allowDolbyVisionProfile7ElDirectPlay =
      _allowDolbyVisionProfile7ElDirectPlay(prefs);

  final dvAnalysis = _analyzeDolbyVisionQueue(
    queue,
    mediaSourceId: mediaSourceId,
    allowDolbyVisionProfile7ElDirectPlay: allowDolbyVisionProfile7ElDirectPlay,
  );
  if (!dvAnalysis.hasDolbyVision) {
    return false;
  }

  if (dvAnalysis.hasUnsupportedProfile) {
    return true;
  }

  if (PlatformDetection.supportsDolbyVision) {
    return false;
  }

  if (!PlatformDetection.supportsAnyHdr) {
    return true;
  }

  final behavior = prefs.get(UserPreferences.dolbyVisionFallbackBehavior);
  if (behavior == DolbyVisionFallbackBehavior.transcode) {
    return true;
  }
  if (behavior == DolbyVisionFallbackBehavior.hdr10Fallback) {
    return !PlatformDetection.supportsHdr10;
  }

  final decision = await _showDolbyVisionFallbackDecisionDialog(context);
  if (decision == null) {
    return false;
  }
  final remember = decision.rememberBehavior;
  if (remember != null) {
    await prefs.set(UserPreferences.dolbyVisionFallbackBehavior, remember);
  }

  return decision.forceTranscode;
}

Duration? _runtimeForItem(
  AggregatedItem item,
  Map<String, dynamic>? mediaSource,
) {
  final ticks = mediaSource?['RunTimeTicks'];
  if (ticks is num && ticks > 0) {
    return Duration(microseconds: (ticks ~/ 10));
  }
  return item.runtime;
}

String? _endsAt(
  AggregatedItem item,
  Duration? runtime, {
  required bool use24Hour,
}) {
  if (runtime == null) {
    return null;
  }
  final percentage = item.playedPercentage;
  final Duration left;
  if (percentage != null && percentage > 0) {
    left = Duration(
      microseconds: (runtime.inMicroseconds * (1.0 - percentage / 100.0))
          .round(),
    );
  } else {
    left = runtime;
  }
  final end = DateTime.now().add(left);
  final hour = end.hour;
  final minute = end.minute.toString().padLeft(2, '0');
  if (use24Hour) {
    return '${hour.toString().padLeft(2, '0')}:$minute';
  }
  final amPm = hour >= 12 ? 'PM' : 'AM';
  final h12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
  return '$h12:$minute $amPm';
}

String? _resolutionFromStreams(List<Map<String, dynamic>> streams) {
  final video = streams.where((s) => s['Type'] == 'Video').firstOrNull;
  if (video == null) {
    return null;
  }
  final width = video['Width'] as int?;
  final height = video['Height'] as int?;
  if (width == null || height == null || width <= 0 || height <= 0) {
    return null;
  }

  final interlaced = video['IsInterlaced'] == true;
  final suffix = interlaced ? 'i' : 'p';

  if (width >= 7600 || height >= 4300) return '8K';
  if (width >= 3800 || height >= 2000) return '4K';
  if (width >= 2500 || height >= 1400) return '1440$suffix';
  if (width >= 1800 || height >= 1000) return '1080$suffix';
  if (width >= 1200 || height >= 700) return '720$suffix';
  if (width >= 600 || height >= 400) return '480$suffix';
  return 'SD';
}

String? _hdrFromStreams(List<Map<String, dynamic>> streams) {
  final video = streams.where((s) => s['Type'] == 'Video').firstOrNull;
  if (video == null) {
    return null;
  }
  final hdr = video['VideoRangeType'] as String?;
  if (hdr == null || hdr.isEmpty) {
    return null;
  }
  return hdr.toUpperCase();
}

String? _audioLabelFromStreams(List<Map<String, dynamic>> streams) {
  final audio = streams.where((s) => s['Type'] == 'Audio').firstOrNull;
  if (audio == null) return null;
  return audioLabelFromProfileCodec(
    audio['Profile'] as String?,
    audio['Codec'] as String?,
  );
}

String? _codecFromStreams(
  List<Map<String, dynamic>> streams,
  String streamType,
) {
  final stream = streams.where((s) => s['Type'] == streamType).firstOrNull;
  final codec = stream?['Codec'] as String?;
  if (codec == null || codec.isEmpty) {
    return null;
  }
  return codec.toUpperCase();
}

String? _channelLayoutFromStreams(List<Map<String, dynamic>> streams) {
  final audio = streams.where((s) => s['Type'] == 'Audio').firstOrNull;
  if (audio == null) {
    return null;
  }
  final layout = audio['ChannelLayout'] as String?;
  if (layout != null && layout.isNotEmpty) {
    return layout;
  }
  final channels = audio['Channels'];
  if (channels is int) {
    return switch (channels) {
      1 => 'Mono',
      2 => 'Stereo',
      6 => '5.1',
      8 => '7.1',
      _ => '${channels}ch',
    };
  }
  return null;
}

bool _isReadableBookItem(AggregatedItem item) {
  final mediaType = item.rawData['MediaType'] as String?;
  return item.type == 'Book' && mediaType != 'Audio';
}

bool _isAudiobookCollectionItem(AggregatedItem item) {
  if (item.type == 'AudioBook') return true;

  final genres =
      (item.rawData['Genres'] as List?)
          ?.whereType<String>()
          .map((g) => g.toLowerCase())
          .toList() ??
      const <String>[];
  return genres.any((g) => g.contains('audiobook') || g.contains('audio book'));
}

bool _isDownloadable(String? type) {
  return type == 'Movie' ||
      type == 'Audio' ||
      type == 'AudioBook' ||
      type == 'Book' ||
      type == 'Episode' ||
      type == 'Season' ||
      type == 'Series' ||
      type == 'BoxSet';
}

bool _canUserDownload() {
  final user = GetIt.instance<UserRepository>().currentUser;
  return !PlatformDetection.isTV && (user?.canDownload ?? false);
}

class _DownloadButton extends StatefulWidget {
  final AggregatedItem item;
  final ItemDetailViewModel viewModel;
  final FocusNode? focusNode;
  final VoidCallback? onFocused;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final bool suppressAutoScrollToTop;

  const _DownloadButton({
    required this.item,
    required this.viewModel,
    this.focusNode,
    this.onFocused,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
    this.suppressAutoScrollToTop = false,
  });

  @override
  State<_DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<_DownloadButton> {
  bool _isOffline = false;
  DownloadService? _downloadService;

  String _originalQualitySubtitle(
    AggregatedItem item, {
    required bool isMulti,
  }) {
    if (isMulti) {
      return AppLocalizations.of(context).originalFilesNoReencoding;
    }

    final mediaSource = item.mediaSources.isNotEmpty
        ? item.mediaSources.first
        : null;
    final sizeBytes = sourceSizeBytes(item);
    final container = (mediaSource?['Container'] as String?)?.toUpperCase();
    final videoCodec = item.videoCodec?.toUpperCase();
    final audioCodec = item.audioCodec?.toUpperCase();

    final details = <String>[];
    if (sizeBytes > 0) {
      details.add(formatBytes(sizeBytes));
    }
    if (container != null && container.isNotEmpty) {
      details.add(container);
    }
    if (videoCodec != null && audioCodec != null) {
      details.add('$videoCodec/$audioCodec');
    } else if (videoCodec != null) {
      details.add(videoCodec);
    } else if (audioCodec != null) {
      details.add(audioCodec);
    }

    if (details.isEmpty) {
      return AppLocalizations.of(context).originalFileNoReencoding;
    }

    return details.join(' • ');
  }

  String _qualitySubtitle(
    AggregatedItem item,
    DownloadQuality quality, {
    required bool supportsTranscoding,
    required bool isMulti,
    String? multiEstimateSubtitle,
  }) {
    if (!quality.isTranscoded || !supportsTranscoding) {
      return _originalQualitySubtitle(item, isMulti: isMulti);
    }

    if (isMulti) {
      if (multiEstimateSubtitle != null) {
        return '$multiEstimateSubtitle • ${quality.encodingInfo}';
      }
      return '${quality.estimatedSizePerHour} • ${quality.encodingInfo}';
    }

    final estimateBytes = estimateTranscodedSizeBytes(item, quality);
    if (estimateBytes != null) {
      return '~${formatBytes(estimateBytes)} • ${quality.encodingInfo}';
    }

    return '${quality.estimatedSizePerHour} • ${quality.encodingInfo}';
  }

  String? _multiTranscodedEstimateSubtitle(
    List<AggregatedItem> episodes,
    DownloadQuality quality,
  ) {
    if (episodes.isEmpty) {
      return null;
    }

    var totalBytes = 0;
    var estimatedCount = 0;
    for (final episode in episodes) {
      final estimate = estimateTranscodedSizeBytes(episode, quality);
      if (estimate != null && estimate > 0) {
        totalBytes += estimate;
        estimatedCount++;
      }
    }

    if (estimatedCount == 0) {
      return null;
    }

    final totalLabel = '~${formatBytes(totalBytes)} total';
    if (estimatedCount == episodes.length) {
      return totalLabel;
    }

    return '$totalLabel (${episodes.length - estimatedCount} unknown)';
  }

  Map<DownloadQuality, String> _multiTranscodedEstimateSubtitles(
    List<AggregatedItem> episodes,
    List<DownloadQuality> qualities,
  ) {
    final subtitles = <DownloadQuality, String>{};
    for (final quality in qualities) {
      if (!quality.isTranscoded) {
        continue;
      }
      final subtitle = _multiTranscodedEstimateSubtitle(episodes, quality);
      if (subtitle != null) {
        subtitles[quality] = subtitle;
      }
    }
    return subtitles;
  }

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<DownloadService>()) {
      _downloadService = GetIt.instance<DownloadService>();
      _downloadService!.addListener(_onChanged);
    }
    _checkOffline();
  }

  @override
  void dispose() {
    _downloadService?.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => _checkOffline();

  Future<void> _checkOffline() async {
    final repo = GetIt.instance<OfflineRepository>();
    final available = await repo.isAvailableOffline(widget.item.id);
    if (mounted && available != _isOffline) {
      setState(() => _isOffline = available);
    }
  }

  @override
  Widget build(BuildContext context) {
    final downloadService =
        _downloadService ?? GetIt.instance<DownloadService>();
    return ListenableBuilder(
      listenable: downloadService,
      builder: (context, _) {
        final item = widget.item;
        final isMulti =
            item.type == 'Season' ||
            item.type == 'Series' ||
            item.type == 'BoxSet';
        final progress = downloadService.activeDownloads[item.id];
        final downloadError = progress?.error;
        final isBatch = downloadService.isBatchDownloading;

        // Forward the focus node and arrow wiring the action row assigns to this
        // slot so the button is reachable by d-pad in every download state.
        _DetailActionButton wire({
          required String label,
          required IconData icon,
          required VoidCallback onPressed,
          bool isActive = false,
          Color? activeColor,
        }) {
          return _DetailActionButton(
            label: label,
            icon: icon,
            onPressed: onPressed,
            isActive: isActive,
            activeColor: activeColor,
            focusNode: widget.focusNode,
            onFocused: widget.onFocused,
            onArrowUp: widget.onArrowUp,
            onArrowDown: widget.onArrowDown,
            onArrowLeft: widget.onArrowLeft,
            onArrowRight: widget.onArrowRight,
            suppressAutoScrollToTop: widget.suppressAutoScrollToTop,
          );
        }

        if (progress != null &&
            !progress.isComplete &&
            progress.error == null) {
          final label = progress.progress >= 0
              ? '${(progress.progress * 100).toInt()}%'
              : '${(progress.bytesReceived / 1048576).toStringAsFixed(1)} MB';
          return wire(
            label: label,
            icon: Icons.close,
            onPressed: () => downloadService.cancelDownload(item.id),
            isActive: true,
            activeColor: AppColorScheme.accent,
          );
        }

        if (isBatch && isMulti) {
          final done = downloadService.completedCount;
          final total = downloadService.totalQueued;
          var pct = '';
          for (final progress in downloadService.activeDownloads.values) {
            if (!progress.isComplete && progress.error == null) {
              if (progress.progress >= 0) {
                pct = '${(progress.progress * 100).toInt()}%';
              }
              break;
            }
          }
          return wire(
            label: '${done + 1}/$total${pct.isNotEmpty ? ' · $pct' : ''}',
            icon: Icons.close,
            onPressed: () => downloadService.cancelAll(),
            isActive: true,
            activeColor: AppColorScheme.accent,
          );
        }

        if (_isOffline || (progress != null && progress.isComplete)) {
          return wire(
            label: AppLocalizations.of(context).downloaded,
            icon: Icons.download_done,
            isActive: true,
            activeColor: const Color(0xFF4CAF50),
            onPressed: () => _showQualityPicker(context, downloadService),
          );
        }

        if (downloadError != null) {
          return wire(
            label: AppLocalizations.of(context).retry,
            icon: Icons.error_outline,
            isActive: true,
            activeColor: const Color(0xFFD32F2F),
            onPressed: () {
              if (downloadError.isNotEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(downloadError)));
              }
              _showQualityPicker(context, downloadService);
            },
          );
        }

        return wire(
          label: AppLocalizations.of(context).download,
          icon: Icons.download,
          onPressed: () => _showQualityPicker(context, downloadService),
        );
      },
    );
  }

  void _showQualityPicker(BuildContext context, DownloadService service) {
    final item = widget.item;
    final isMulti =
        item.type == 'Season' || item.type == 'Series' || item.type == 'BoxSet';
    final supportsTranscoding =
        item.type == 'Movie' || item.type == 'Episode' || isMulti;
    final estimationItems = item.type == 'BoxSet'
        ? widget.viewModel.collectionItems
        : widget.viewModel.episodes;

    if (!isMulti && !supportsTranscoding) {
      _startDownload(context, service, DownloadQuality.original);
      return;
    }

    final sourceWidth = isMulti
        ? (() {
            int? maxWidth;
            for (final episode in estimationItems) {
              final width = episode.sourceVideoWidth;
              if (width == null) continue;
              maxWidth = maxWidth == null || width > maxWidth
                  ? width
                  : maxWidth;
            }
            return maxWidth;
          })()
        : item.sourceVideoWidth;
    final availableQualities = DownloadQuality.values.where((q) {
      if (q.maxWidth == null) return true;
      if (sourceWidth == null) return true;
      return q.maxWidth! <= sourceWidth;
    }).toList();
    final multiEstimateSubtitles = isMulti
        ? _multiTranscodedEstimateSubtitles(estimationItems, availableQualities)
        : const <DownloadQuality, String>{};
    showFocusRestoringModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                isMulti
                    ? AppLocalizations.of(context).downloadAllQuality
                    : AppLocalizations.of(context).downloadQuality,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...availableQualities.map(
              (quality) => ListTile(
                leading: AdaptiveIcon(
                  quality.isTranscoded
                      ? Icons.compress
                      : Icons.file_copy_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  quality.label,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  _qualitySubtitle(
                    item,
                    quality,
                    supportsTranscoding: supportsTranscoding,
                    isMulti: isMulti,
                    multiEstimateSubtitle: multiEstimateSubtitles[quality],
                  ),
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _startDownload(context, service, quality);
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _startDownload(
    BuildContext context,
    DownloadService service,
    DownloadQuality quality,
  ) {
    final item = widget.item;
    switch (item.type) {
      case 'Movie':
      case 'Episode':
      case 'Audio':
      case 'AudioBook':
      case 'Book':
        service.downloadItem(item, quality: quality);
      case 'Season':
        final episodes = widget.viewModel.episodes;
        if (episodes.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context).noEpisodesLoaded),
            ),
          );
          return;
        }
        service.downloadItems(episodes, quality: quality);
      case 'Series':
        service.downloadSeries(item.id, quality: quality);
      case 'BoxSet':
        service.downloadBoxSet(item.id, quality: quality);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(
            context,
          ).downloadingItem(item.name, quality.label),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _DeleteDownloadButton extends StatefulWidget {
  final AggregatedItem item;
  final FocusNode? focusNode;
  final VoidCallback? onFocused;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final bool suppressAutoScrollToTop;

  const _DeleteDownloadButton({
    required this.item,
    this.focusNode,
    this.onFocused,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
    this.suppressAutoScrollToTop = false,
  });

  @override
  State<_DeleteDownloadButton> createState() => _DeleteDownloadButtonState();
}

class _DeleteDownloadButtonState extends State<_DeleteDownloadButton> {
  bool _hasFiles = false;
  bool _checking = true;
  DownloadService? _downloadService;

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<DownloadService>()) {
      _downloadService = GetIt.instance<DownloadService>();
      _downloadService!.addListener(_onDownloadChanged);
    }
    _checkFiles();
  }

  @override
  void dispose() {
    _downloadService?.removeListener(_onDownloadChanged);
    super.dispose();
  }

  void _onDownloadChanged() => _checkFiles();

  Future<void> _checkFiles() async {
    final service = GetIt.instance<DownloadService>();
    final exists = await service.hasDownloadedFiles(widget.item);
    if (mounted) {
      setState(() {
        _hasFiles = exists;
        _checking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checking || !_hasFiles) return const SizedBox.shrink();

    return _DetailActionButton(
      label: AppLocalizations.of(context).deleteFiles,
      icon: Icons.delete_outline,
      onPressed: () => _confirmDelete(context),
      isActive: true,
      activeColor: const Color(0xFFFF4757),
      focusNode: widget.focusNode,
      onFocused: widget.onFocused,
      onArrowUp: widget.onArrowUp,
      onArrowDown: widget.onArrowDown,
      onArrowLeft: widget.onArrowLeft,
      onArrowRight: widget.onArrowRight,
      suppressAutoScrollToTop: widget.suppressAutoScrollToTop,
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final item = widget.item;
    final l10n = AppLocalizations.of(context);
    final typeLabel = switch (item.type) {
      'Series' => l10n.deleteSeriesFiles(item.seriesName ?? item.name),
      'Season' => l10n.deleteSeasonFiles,
      _ => '"${item.name}"',
    };

    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(
          AppLocalizations.of(ctx).deleteDownloadedFiles,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          AppLocalizations.of(ctx).deleteLocalFilesMessage(typeLabel),
          style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(AppLocalizations.of(ctx).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFFF4757),
            ),
            child: Text(AppLocalizations.of(ctx).delete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final service = GetIt.instance<DownloadService>();
      final success = await service.deleteDownloadedFiles(item);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success ? l10n.downloadedFilesDeleted : l10n.failedToDeleteFiles,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        if (success) {
          setState(() => _hasFiles = false);
        }
      }
    }
  }
}

class _DetailActionButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onFocused;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final bool isActive;
  final Color? activeColor;
  final Color? neonAccentColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool suppressAutoScrollToTop;

  /// In the "modern" detail style this button is rendered as the high-contrast
  /// primary Play pill; secondary buttons render as circular icon buttons.
  final bool isPrimary;

  const _DetailActionButton({
    required this.label,
    this.icon,
    this.iconBuilder,
    required this.onPressed,
    this.onLongPress,
    this.onFocused,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
    this.isActive = false,
    this.activeColor,
    this.neonAccentColor,
    this.focusNode,
    this.autofocus = false,
    this.suppressAutoScrollToTop = false,
    this.isPrimary = false,
  });

  @override
  State<_DetailActionButton> createState() => _DetailActionButtonState();
}

class _DetailActionButtonState extends State<_DetailActionButton>
    with FocusStateMixin {
  Timer? _longPressTimer;
  bool _longPressFired = false;
  bool _selectDownSeen = false;

  @override
  void dispose() {
    _longPressTimer?.cancel();
    super.dispose();
  }

  /// Modern detail style: primary Play renders as a high-contrast light pill,
  /// secondary actions as circular outline icon buttons (icon only in landscape,
  /// icon + label in portrait).
  Widget _buildModernChild(
    BuildContext context, {
    required bool isMobile,
    required bool showHighlight,
    required Color focusColor,
    required Color iconColor,
    required Color labelColor,
  }) {
    final isExpanded = showHighlight;
    final hasNewline = widget.label.contains('\n');
    final double height = widget.isPrimary
        ? (isMobile ? (hasNewline ? 56.0 : 50.0) : (hasNewline ? 64.0 : 54.0))
        : (isMobile ? 48.0 : 52.0);

    if (widget.isPrimary) {
      final fg = showHighlight ? AppColorScheme.onButtonFocused : Colors.white;
      final heartColor = (widget.icon == Icons.favorite && widget.isActive) ? const Color(0xFFE50914) : fg;
      // Portrait spans the primary Play full width (circular secondary actions
      // wrap beneath); landscape keeps it content-width, inline with them.
      final fullWidth = context
              .findAncestorWidgetOfExactType<DetailActionButtons>()
              ?.fullWidthPrimary ??
          false;

      // When expanded (focused): use ConstrainedBox with a minWidth floor
      // so the pill always has enough room for labels like "Resume S12:E24".
      // Flexible in the parent Row lets the pill grow beyond the minimum.
      final Widget pill;
      if (isExpanded || fullWidth) {
        final pillInner = Container(
          height: height,
          width: fullWidth ? double.infinity : null,
          padding: EdgeInsets.only(
            left: fullWidth ? 10 : 10,
            right: fullWidth ? 10 : 14,
          ),
          alignment: fullWidth ? Alignment.center : null,
          decoration: BoxDecoration(
            color: showHighlight
                ? AppColorScheme.buttonFocused
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(
              color: showHighlight ? focusColor : Colors.transparent,
              width: 3,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdaptiveIcon(widget.icon ?? Icons.play_arrow, color: heartColor, size: 24),
              const SizedBox(width: 2),
                widget.label.contains('\n')
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label.split('\n')[0],
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: fg,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  height: 1.1,
                                ),
                          ),
                          Text(
                            widget.label.split('\n')[1],
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: fg.withValues(alpha: 0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  height: 1.1,
                                ),
                          ),
                        ],
                      )
                    : Text(
                        widget.label,
                        maxLines: 1,
                        softWrap: false,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: fg,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              height: 1.1,
                            ),
                      ),
              ],
            ),
        );
        // Landscape: wrap with a minWidth so text always has room.
        // Flexible in the parent Row allows growing beyond minWidth.
        pill = fullWidth
            ? pillInner
            : ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 200),
                child: pillInner,
              );
      } else {
        // Collapsed: animate from/to a circle
        pill = AnimatedSize(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: SizedBox.square(
            dimension: height,
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(height / 2),
                border: Border.all(
                  color: Colors.transparent,
                  width: 3,
                ),
              ),
              child: Center(
                child: AdaptiveIcon(widget.icon ?? Icons.play_arrow, color: Colors.white, size: 24),
              ),
            ),
          ),
        );
      }
      return fullWidth ? SizedBox(width: double.infinity, child: pill) : pill;
    }

    if (isMobile) {
      // Vertical tile: circular icon with its label always shown underneath.
      final iconWidget = widget.iconBuilder != null
          ? widget.iconBuilder!(36, iconColor)
          : AdaptiveIcon(
              widget.icon!,
              color: (widget.icon == Icons.favorite && widget.isActive)
                  ? const Color(0xFFE50914)
                  : iconColor,
              size: 24,
            );
      return SizedBox(
        width: 66,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: showHighlight
                    ? AppColorScheme.buttonFocused
                    : (widget.isActive
                        ? (widget.activeColor ?? AppColorScheme.accent)
                            .withValues(alpha: 0.18)
                        : Colors.white.withValues(alpha: 0.06)),
                border: Border.all(
                  color: showHighlight
                      ? focusColor
                      : AppColorScheme.onSurface.withValues(alpha: 0.35),
                  width: showHighlight ? 2.5 : 1.5,
                ),
              ),
              child: Center(child: iconWidget),
            ),
            const SizedBox(height: 6),
            // Shrink long labels (e.g. "Unwatched") to fit the tile on one line
            // instead of wrapping a lone letter into the row below.
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: labelColor,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        ),
      );
    }

    final double minWidth = height;
    final double maxWidth = isExpanded ? 200.0 : height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      height: height,
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      padding: EdgeInsets.only(
        left: isExpanded ? 6 : 0,
        right: isExpanded ? 16 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2),
        color: showHighlight
            ? AppColorScheme.buttonFocused
            : (widget.isActive
                ? (widget.activeColor ?? AppColorScheme.accent)
                    .withValues(alpha: 0.18)
                : Colors.white.withValues(alpha: 0.06)),
        border: Border.all(
          color: showHighlight
              ? focusColor
              : AppColorScheme.onSurface.withValues(alpha: 0.35),
          width: showHighlight ? 2.5 : 1.5,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: height - 4, // keep icon centered when collapsed
              child: Center(
                child: widget.iconBuilder != null
                    ? widget.iconBuilder!(36, iconColor)
                    : AdaptiveIcon(
                        widget.icon!,
                        color: (widget.icon == Icons.favorite && widget.isActive)
                            ? const Color(0xFFE50914)
                            : iconColor,
                        size: 24,
                      ),
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: labelColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.1,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  bool _tryFocusSidebar() {
    if (GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) !=
        NavbarPosition.left) {
      return false;
    }
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  void _scrollToTopOnFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final scrollable = Scrollable.maybeOf(context);
      if (scrollable == null) return;
      final position = scrollable.position;
      if (position.pixels <= position.minScrollExtent) return;
      position.animateTo(
        position.minScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  bool _moveHorizontalFocus({required bool forward}) {
    final current = widget.focusNode ?? Focus.of(context);
    final moved = forward
        ? FocusScope.of(context).nextFocus()
        : FocusScope.of(context).previousFocus();
    if (!moved) {
      if (!forward) {
        _tryFocusSidebar();
      }
      return true;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final primary = FocusManager.instance.primaryFocus;
      final inActionButtons =
          primary?.context?.findAncestorWidgetOfExactType<DetailActionButtons>() !=
              null ||
          primary?.context?.findAncestorWidgetOfExactType<_AlbumActions>() !=
              null;
      if (!inActionButtons) {
        if (forward) {
          current.requestFocus();
        } else {
          _tryFocusSidebar();
        }
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale();
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final nodeHasFocus = widget.focusNode?.hasFocus ?? false;
    final showHighlight = showFocusBorder || nodeHasFocus;
    final modern = context
            .findAncestorWidgetOfExactType<DetailActionButtons>()
            ?.modernStyle ??
        false;

    final activeColor = widget.isActive ? widget.activeColor : null;
    final neonAccent = widget.neonAccentColor ?? AppColorScheme.onSurface;
    final iconColor = showHighlight
        ? (isNeon ? AppColorScheme.accent : AppColorScheme.onButtonFocused)
        : (widget.isActive
              ? (widget.activeColor ?? (isNeon ? neonAccent : Colors.white))
              : (isNeon ? neonAccent : Colors.white));
    final labelColor = showHighlight
        ? (isNeon
              ? neonAccent
              : (AppColorScheme.isGlass
                    ? Colors.white
                    : AppColorScheme.onButtonFocused))
        : (isNeon ? neonAccent : Colors.white);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onFocusChange: (focused) {
          setFocused(focused);
          if (focused) {
            if (!widget.suppressAutoScrollToTop) {
              _scrollToTopOnFocus();
            }
            widget.onFocused?.call();
          }
        },
        onKeyEvent: (_, event) {
          final isNavigationEvent =
              event is KeyDownEvent || event is KeyRepeatEvent;
          if (isNavigationEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowRight) {
            if (widget.onArrowRight != null) {
              widget.onArrowRight!();
              return KeyEventResult.handled;
            }
            return _moveHorizontalFocus(forward: true)
                ? KeyEventResult.handled
                : KeyEventResult.ignored;
          }
          if (isNavigationEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            if (widget.onArrowLeft != null) {
              widget.onArrowLeft!();
              return KeyEventResult.handled;
            }
            return _moveHorizontalFocus(forward: false)
                ? KeyEventResult.handled
                : KeyEventResult.ignored;
          }
          if (isNavigationEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowUp &&
              widget.onArrowUp != null) {
            widget.onArrowUp!();
            return KeyEventResult.handled;
          }
          if (isNavigationEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowDown &&
              widget.onArrowDown != null) {
            widget.onArrowDown!();
            return KeyEventResult.handled;
          }
          if (widget.onLongPress != null) {
            if (event.logicalKey.isContextMenuKey) {
              if (event is KeyDownEvent) {
                widget.onLongPress!();
              }
              return KeyEventResult.handled;
            }
            if (event.logicalKey.isSelectKey) {
              if (event is KeyDownEvent) {
                _selectDownSeen = true;
                _longPressFired = false;
                _longPressTimer?.cancel();
                _longPressTimer = Timer(const Duration(milliseconds: 500), () {
                  _longPressFired = true;
                  widget.onLongPress?.call();
                });
                return KeyEventResult.handled;
              }
              if (event is KeyRepeatEvent) {
                return _selectDownSeen
                    ? KeyEventResult.handled
                    : KeyEventResult.ignored;
              }
              if (event is KeyUpEvent) {
                if (!_selectDownSeen) return KeyEventResult.ignored;
                _selectDownSeen = false;
                _longPressTimer?.cancel();
                _longPressTimer = null;
                if (!_longPressFired) {
                  widget.onPressed();
                }
                _longPressFired = false;
                return KeyEventResult.handled;
              }
            }
          }
          if (isActivateKey(event)) {
            widget.onPressed();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          onSecondaryTap: widget.onLongPress,
          child: modern
              ? _buildModernChild(
                  context,
                  isMobile: isMobile,
                  showHighlight: showHighlight,
                  focusColor: focusColor,
                  iconColor: iconColor,
                  labelColor: labelColor,
                )
              : SizedBox(
                  width: isMobile ? 80 : 108 * desktopScale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: isMobile ? 44 : 58 * desktopScale,
                        height: isMobile ? 44 : 58 * desktopScale,
                        decoration: BoxDecoration(
                          color: showHighlight
                              ? (isNeon
                                    ? Colors.transparent
                                    : AppColorScheme.buttonFocused)
                              : activeColor != null
                              ? activeColor.withValues(
                                  alpha: isNeon ? 0.12 : 0.15)
                              : (isNeon
                                    ? Colors.transparent
                                    : Colors.white.withValues(alpha: 0.08)),
                          border: showHighlight
                              ? Border.fromBorderSide(
                                  ThemeRegistry
                                      .active.borders.focusBorder
                                      .copyWith(
                                    color: isNeon
                                        ? AppColorScheme.accent
                                        : focusColor,
                                  ),
                                )
                              : null,
                          borderRadius: BorderRadius.circular(
                            isMobile ? 14 : 15 * desktopScale,
                          ),
                        ),
                        child: widget.iconBuilder != null
                            ? widget.iconBuilder!(
                                isMobile ? 22 : 27 * desktopScale,
                                iconColor,
                              )
                            : AdaptiveIcon(
                                widget.icon!,
                                color: iconColor,
                                size: isMobile ? 22 : 27 * desktopScale,
                              ),
                      ),
                      SizedBox(height: isMobile ? 6 : 8 * desktopScale),
                      Text(
                        widget.label,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                              color: labelColor,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
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

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isNeon ? AppColorScheme.accent : Colors.white,
        fontWeight: FontWeight.bold,
        shadows: _textShadows,
        fontSize: _isCompact(context) ? 17 : null,
      ),
    );
  }
}

class DetailCastRow extends StatelessWidget {
  final List<Map<String, dynamic>> people;
  final ImageApi imageApi;
  final String? serverId;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final VoidCallback? onNavigateUp;

  const DetailCastRow({
    required this.people,
    required this.imageApi,
    this.serverId,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onNavigateUp,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale();
    final cardWidth = isMobile ? 80.0 : 100.0 * desktopScale;
    final avatarRadius = isMobile ? 35.0 : 45.0 * desktopScale;

    return SizedBox(
      height: isMobile ? 172 : 196 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
        itemCount: people.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 12 : 16 * desktopScale),
        itemBuilder: (context, index) {
          final person = people[index];
          final name = person['Name'] as String? ?? '';
          final role = person['Role'] as String?;
          final personId = person['Id']?.toString();
          final tag = person['PrimaryImageTag'] as String?;

          String? imageUrl;
          if (personId != null && tag != null) {
            imageUrl = imageApi.getPrimaryImageUrl(
              personId,
              maxHeight: isMobile ? 140 : (200 * desktopScale).round(),
              tag: tag,
            );
          }

          return _CastPersonCard(
            cardWidth: cardWidth,
            avatarRadius: avatarRadius,
            name: name,
            role: role,
            imageUrl: imageUrl,
            isMobile: isMobile,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onNavigateUp: onNavigateUp,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (event) => onItemKeyEvent!(index, event),
            onTap: personId != null
                ? () => context.push(
                    Destinations.item(personId, serverId: serverId),
                  )
                : null,
          );
        },
      ),
    );
  }
}

class _CastPersonCard extends StatefulWidget {
  final double cardWidth;
  final double avatarRadius;
  final String name;
  final String? role;
  final String? imageUrl;
  final bool isMobile;
  final FocusNode? focusNode;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;
  final VoidCallback? onTap;
  final VoidCallback? onNavigateUp;

  const _CastPersonCard({
    required this.cardWidth,
    required this.avatarRadius,
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.isMobile,
    this.focusNode,
    this.onKeyEvent,
    this.onTap,
    this.onNavigateUp,
  });

  @override
  State<_CastPersonCard> createState() => _CastPersonCardState();
}

class _CastPersonCardState extends State<_CastPersonCard> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (_, event) {
          final isNavigationEvent =
              event is KeyDownEvent || event is KeyRepeatEvent;
          if (isNavigationEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowUp &&
              widget.onNavigateUp != null) {
            widget.onNavigateUp!();
            return KeyEventResult.handled;
          }
          final customResult = widget.onKeyEvent?.call(event);
          if (customResult != null && customResult != KeyEventResult.ignored) {
            return customResult;
          }
          if (widget.onTap != null && isActivateKey(event)) {
            widget.onTap!();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: cardExpansion && showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 120),
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: widget.cardWidth,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: showFocusBorder
                              ? (isNeon ? AppColorScheme.accent : focusColor)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: widget.avatarRadius,
                      backgroundColor: Colors.white.withValues(alpha: 0.1),
                      backgroundImage: widget.imageUrl != null
                          ? CachedNetworkImageProvider(widget.imageUrl!)
                          : null,
                      child: widget.imageUrl == null
                          ? AdaptiveIcon(
                              Icons.person,
                              color: Colors.white54,
                              size: widget.isMobile ? 24 : 32,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isNeon ? AppColorScheme.accent : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: widget.isMobile ? 11 : null,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.role != null)
                    Text(
                      widget.role!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isNeon
                            ? AppColorScheme.onSurface
                            : Colors.white.withValues(alpha: 0.6),
                        fontSize: widget.isMobile ? 10 : 11,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailSimilarRow extends StatelessWidget {
  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final ValueChanged<AggregatedItem>? onItemLongPress;

  const DetailSimilarRow({
    required this.items,
    required this.imageApi,
    required this.prefs,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);
    final cardWidth = isMobile ? 120.0 : 150.0 * desktopScale;

    return SizedBox(
      height: isMobile ? 228 : 282 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(6, 10, 6, 4),
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final item = items[index];
          final ar = MediaCard.aspectRatioForType(item.type);
          return MediaCard(
            title: item.name,
            titleColor: isNeon ? AppColorScheme.accent : null,
            imageUrl: item.primaryImageTag != null
                ? imageApi.getPrimaryImageUrl(
                    item.id,
                    maxHeight: isMobile ? 300 : (400 * desktopScale).round(),
                    tag: item.primaryImageTag,
                  )
                : null,
            width: cardWidth,
            aspectRatio: ar,
            focusColor: isNeon
                ? AppColorScheme.accent
                : Color(prefs.get(UserPreferences.focusColor).colorValue),
            cardFocusExpansion: cardExpansion,
            suppressFocusGlow: isNeon,
            isFavorite: item.isFavorite,
            isPlayed: item.isPlayed,
            playedPercentage: item.playedPercentage,
            watchedBehavior: watchedBehavior,
            itemType: item.type,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onLongPress: onItemLongPress == null
                ? null
                : () => onItemLongPress!(item),
            onTap: () => context.push(
              Destinations.item(item.id, serverId: item.serverId),
            ),
          );
        },
      ),
    );
  }
}

class DetailFeaturesRow extends StatelessWidget {
  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final void Function(AggregatedItem item)? onItemLongPress;

  const DetailFeaturesRow({
    required this.items,
    required this.imageApi,
    required this.prefs,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);
    final cardWidth = isMobile ? 140.0 : 170.0 * desktopScale;

    return SizedBox(
      height: isMobile ? 230 : 280 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final item = items[index];
          return MediaCard(
            title: item.name,
            subtitle: item.subtitle,
            titleColor: isNeon ? AppColorScheme.onSurface : null,
            subtitleColor: isNeon
                ? AppColorScheme.onSurface.withValues(alpha: 0.85)
                : null,
            imageUrl: item.primaryImageTag != null
                ? imageApi.getPrimaryImageUrl(
                    item.id,
                    maxHeight: isMobile ? 300 : (400 * desktopScale).round(),
                    tag: item.primaryImageTag,
                  )
                : null,
            width: cardWidth,
            aspectRatio: MediaCard.aspectRatioForType(item.type),
            focusColor: Color(prefs.get(UserPreferences.focusColor).colorValue),
            cardFocusExpansion: cardExpansion,
            isFavorite: item.isFavorite,
            isPlayed: item.isPlayed,
            playedPercentage: item.playedPercentage,
            watchedBehavior: watchedBehavior,
            itemType: item.type,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onLongPress: onItemLongPress != null
                ? () => onItemLongPress!(item)
                : null,
            onTap: () => context.push(
              Destinations.item(item.id, serverId: item.serverId),
            ),
          );
        },
      ),
    );
  }
}

class DetailChaptersRow extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final ValueChanged<Duration> onPlayFromChapter;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;

  const DetailChaptersRow({
    required this.item,
    required this.imageApi,
    required this.onPlayFromChapter,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
  });

  @override
  Widget build(BuildContext context) {
    final chapters = item.chapters;
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale();
    final chapterCardWidth = isMobile ? 220.0 : 280.0 * desktopScale;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final chapterImageWidth = (chapterCardWidth * devicePixelRatio).ceil();

    return SizedBox(
      height: isMobile ? 180 : 210 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        itemCount: chapters.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          final ticks = chapter['StartPositionTicks'] as int? ?? 0;
          final position = Duration(microseconds: ticks ~/ 10);
          final name = (chapter['Name'] as String?)?.trim().isNotEmpty == true
              ? (chapter['Name'] as String)
              : AppLocalizations.of(context).chapterNumber(index + 1);
          final imageTag = chapter['ImageTag'] as String?;
          final chapterImageUrl = imageApi.getChapterImageUrl(
            item.id,
            index: index,
            maxWidth: chapterImageWidth,
            tag: imageTag,
          );

          return _ChapterListCard(
            chapterName: name,
            chapterImageUrl: chapterImageUrl,
            chapterCardWidth: chapterCardWidth,
            isMobile: isMobile,
            position: position,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (event) => onItemKeyEvent!(index, event),
            onTap: () => onPlayFromChapter(position),
            formatDuration: _formatDuration,
          );
        },
      ),
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (h > 0) {
      return '$h:$m:$s';
    }
    return '${d.inMinutes}:$s';
  }
}

class _ChapterListCard extends StatefulWidget {
  final String chapterName;
  final String chapterImageUrl;
  final double chapterCardWidth;
  final bool isMobile;
  final Duration position;
  final FocusNode? focusNode;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;
  final VoidCallback onTap;
  final String Function(Duration) formatDuration;

  const _ChapterListCard({
    required this.chapterName,
    required this.chapterImageUrl,
    required this.chapterCardWidth,
    required this.isMobile,
    required this.position,
    this.focusNode,
    this.onKeyEvent,
    required this.onTap,
    required this.formatDuration,
  });

  @override
  State<_ChapterListCard> createState() => _ChapterListCardState();
}

class _ChapterListCardState extends State<_ChapterListCard>
    with FocusStateMixin {
  String _normalizeTimeString(String s) {
    s = s.trim();
    final parts = s.split(':');
    if (parts.length == 2) {
      final m = int.tryParse(parts[0]);
      final sec = parts[1];
      if (m != null) return '$m:$sec';
    } else if (parts.length == 3) {
      final h = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      final sec = parts[2];
      if (h != null && m != null) {
        if (h == 0) return '$m:$sec';
        return '$h:${m.toString().padLeft(2, '0')}:$sec';
      }
    }
    return s;
  }

  String _cleanChapterDisplay(String rawName, Duration position, String Function(Duration) formatDuration) {
    final lDuration = formatDuration(position);
    final normDuration = _normalizeTimeString(lDuration);

    final parts = rawName.split(RegExp(r'\s*-\s*'));
    final normalizedParts = parts.map(_normalizeTimeString).toList();

    final uniqueParts = <String>[];
    for (final part in normalizedParts) {
      if (part.isEmpty) continue;
      if (!uniqueParts.contains(part)) {
        uniqueParts.add(part);
      }
    }

    if (uniqueParts.isNotEmpty && uniqueParts.last == normDuration) {
      uniqueParts.removeLast();
    }

    if (uniqueParts.isEmpty) {
      return normDuration;
    }
    return '${uniqueParts.join(' - ')} - $normDuration';
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (_, event) {
          final customResult = widget.onKeyEvent?.call(event);
          if (customResult != null && customResult != KeyEventResult.ignored) {
            return customResult;
          }
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: SizedBox(
            width: widget.chapterCardWidth,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: showFocusBorder
                          ? Border.fromBorderSide(
                              ThemeRegistry.active.borders.focusBorder.copyWith(
                                color: focusColor,
                                width: 2,
                              ),
                            )
                          : Border.fromBorderSide(
                              ThemeRegistry.active.borders.cardBorder.copyWith(
                                color: Colors.white.withValues(alpha: 0.1),
                              ),
                            ),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            widget.chapterImageUrl,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (_, _, _) => Container(
                              color: Colors.white.withValues(alpha: 0.08),
                              alignment: Alignment.center,
                              child: AdaptiveIcon(
                                Icons.movie,
                                size: widget.isMobile ? 22 : 26,
                                color: Colors.white.withValues(alpha: 0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _cleanChapterDisplay(widget.chapterName, widget.position, widget.formatDuration),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
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
}

class _MetadataItem {
  final String name;
  final String? id;
  final VoidCallback? onTap;

  const _MetadataItem({required this.name, this.id, this.onTap});
}

class _MetadataGroup {
  final String title;
  final List<_MetadataItem> items;

  const _MetadataGroup({required this.title, required this.items});
}

class _MetadataChip extends StatefulWidget {
  final _MetadataItem item;
  final FocusNode? focusNode;

  const _MetadataChip({required this.item, this.focusNode});

  @override
  State<_MetadataChip> createState() => _MetadataChipState();
}

class _MetadataChipState extends State<_MetadataChip> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return MouseRegion(
      cursor: widget.item.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (node, event) {
          if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
            return KeyEventResult.ignored;
          }
          if (isActivateKey(event)) {
            widget.item.onTap?.call();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.item.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: showFocusBorder
                  ? focusColor.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.04),
              // Border width and font weight are kept constant across focus so
              // the chip's footprint never changes; only color/fill react to
              // focus, which avoids the wrap reflowing as focus moves.
              border: Border.all(
                color: showFocusBorder
                    ? focusColor
                    : (isNeon
                          ? AppColorScheme.accent.withValues(alpha: 0.3)
                          : Colors.white.withValues(alpha: 0.1)),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.item.name,
              style: theme.textTheme.bodySmall?.copyWith(
                color: showFocusBorder
                    ? (isNeon ? AppColorScheme.onSurface : Colors.white)
                    : Colors.white.withValues(alpha: 0.85),
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A focusable category cell (Director / Writers / Studio) for the two-level
/// D-pad model. The whole cell is the parent focus stop; Select drills into its
/// name chips, which traverse trapped inside [trapScope] until Back.
class _MetadataGroupCell extends StatefulWidget {
  final String title;
  final List<_MetadataItem> items;
  final List<FocusNode> childNodes;
  final FocusScopeNode trapScope;
  final FocusNode focusNode;
  final bool isNeon;
  final bool isEntered;
  final VoidCallback onEnter;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final VoidCallback onUp;
  final VoidCallback onDown;
  final BorderRadius borderRadius;

  const _MetadataGroupCell({
    required this.title,
    required this.items,
    required this.childNodes,
    required this.trapScope,
    required this.focusNode,
    required this.isNeon,
    required this.isEntered,
    required this.onEnter,
    required this.onUp,
    required this.onDown,
    required this.borderRadius,
    this.onLeft,
    this.onRight,
  });

  @override
  State<_MetadataGroupCell> createState() => _MetadataGroupCellState();
}

class _MetadataGroupCellState extends State<_MetadataGroupCell>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    // The cell border shows only while the cell itself holds focus at the
    // parent level. Once entered, focus (and the border) moves to a name chip.
    final showCellBorder = focused && !widget.isEntered;
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (f) => setFocused(f),
      onKeyEvent: (node, event) {
        if (widget.isEntered) return KeyEventResult.ignored;
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (isActivateKey(event)) {
          widget.onEnter();
          return KeyEventResult.handled;
        }
        // onLeft/onRight are null at the row edges, so returning handled there
        // caps focus inside the category row.
        if (event.logicalKey.isLeftKey) {
          widget.onLeft?.call();
          return KeyEventResult.handled;
        }
        if (event.logicalKey.isRightKey) {
          widget.onRight?.call();
          return KeyEventResult.handled;
        }
        if (event.logicalKey.isUpKey) {
          widget.onUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey.isDownKey) {
          widget.onDown();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: showCellBorder
              ? focusColor.withValues(alpha: 0.10)
              : Colors.transparent,
          border: Border.all(
            color: showCellBorder ? focusColor : Colors.transparent,
            width: 1.5,
          ),
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: widget.isNeon
                    ? AppColorScheme.accent
                    : Colors.white.withValues(alpha: 0.4),
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            Focus(
              canRequestFocus: false,
              descendantsAreFocusable: widget.isEntered,
              child: FocusScope(
                node: widget.trapScope,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var c = 0; c < widget.items.length; c++)
                      _MetadataChip(
                        item: widget.items[c],
                        focusNode: widget.childNodes[c],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailMetadataSection extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final FocusNode? firstItemFocusNode;
  final FocusNode? upTarget;
  final FocusNode? downTarget;
  final KeyEventResult Function(FocusNode? target)? onRequestFocus;

  const DetailMetadataSection({
    required this.viewModel,
    this.firstItemFocusNode,
    this.upTarget,
    this.downTarget,
    this.onRequestFocus,
  });

  @override
  State<DetailMetadataSection> createState() => DetailMetadataSectionState();
}

class DetailMetadataSectionState extends State<DetailMetadataSection> {
  final List<FocusNode> _groupFocusNodes = [];
  final List<List<FocusNode>> _childFocusNodes = [];
  // Per-category scope that traps directional traversal while entered.
  final List<FocusScopeNode> _groupTrapScopes = [];
  // null = parent (category) level; a value = that category is entered.
  int? _enteredGroupIndex;
  List<_MetadataGroup> _groups = [];
  bool _builtGroups = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Built here rather than in initState because group titles come from
    // AppLocalizations.of(context), which registers an inherited dependency
    // that initState is not allowed to access.
    if (!_builtGroups) {
      _builtGroups = true;
      _buildGroupsAndFocusNodes();
    }
  }

  @override
  void didUpdateWidget(covariant DetailMetadataSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel.item != oldWidget.viewModel.item) {
      _buildGroupsAndFocusNodes();
    }
  }

  void _buildGroupsAndFocusNodes() {
    _disposeFocusNodes();
    _groupFocusNodes.clear();
    _childFocusNodes.clear();
    _groupTrapScopes.clear();
    _enteredGroupIndex = null;
    InlineBackInterceptor.remove(_handleInterceptedBack);

    final item = widget.viewModel.item!;
    final l10n = AppLocalizations.of(context);
    final serverId = widget.viewModel.item?.serverId;
    final newGroups = <_MetadataGroup>[];

    if (widget.viewModel.directors.isNotEmpty) {
      newGroups.add(
        _MetadataGroup(
          title: widget.viewModel.directors.length == 1
              ? l10n.director
              : l10n.directors,
          items: widget.viewModel.directors.map((d) {
            final name = d['Name']?.toString() ?? '';
            final id = d['Id']?.toString();
            return _MetadataItem(
              name: name,
              id: id,
              onTap: id != null
                  ? () =>
                        context.push(Destinations.item(id, serverId: serverId))
                  : null,
            );
          }).toList(),
        ),
      );
    }

    if (widget.viewModel.writers.isNotEmpty) {
      newGroups.add(
        _MetadataGroup(
          title: widget.viewModel.writers.length == 1
              ? l10n.writer
              : l10n.writers,
          items: widget.viewModel.writers.map((w) {
            final name = w['Name']?.toString() ?? '';
            final id = w['Id']?.toString();
            return _MetadataItem(
              name: name,
              id: id,
              onTap: id != null
                  ? () =>
                        context.push(Destinations.item(id, serverId: serverId))
                  : null,
            );
          }).toList(),
        ),
      );
    }

    if (item.studios.isNotEmpty) {
      newGroups.add(
        _MetadataGroup(
          title: l10n.studio,
          items: item.studios.map((s) {
            final name = s['Name']?.toString() ?? '';
            final id = s['Id']?.toString();
            return _MetadataItem(
              name: name,
              id: id,
              onTap: name.isNotEmpty
                  ? () => context.push(Destinations.searchWith('studio:$name'))
                  : null,
            );
          }).toList(),
        ),
      );
    }

    _groups = newGroups;

    for (var g = 0; g < _groups.length; g++) {
      // The first parent chip adopts the parent-owned firstItemFocusNode so the
      // screen's existing section-entry target lands on the first category.
      final parentNode = (g == 0 && widget.firstItemFocusNode != null)
          ? widget.firstItemFocusNode!
          : FocusNode(debugLabel: 'metadata_parent_$g');
      _groupFocusNodes.add(parentNode);
      _childFocusNodes.add([
        for (var c = 0; c < _groups[g].items.length; c++)
          FocusNode(debugLabel: 'metadata_child_${g}_$c'),
      ]);
      _groupTrapScopes.add(
        FocusScopeNode(
          debugLabel: 'metadata_trap_$g',
          traversalEdgeBehavior: TraversalEdgeBehavior.stop,
        ),
      );
    }
  }

  void _enterGroup(int g) {
    if (g < 0 || g >= _groups.length) return;
    final children = _childFocusNodes[g];
    if (children.isEmpty) return;
    // Single-item categories drill straight through to the lone item.
    if (_groups[g].items.length == 1) {
      _groups[g].items.first.onTap?.call();
      return;
    }
    setState(() => _enteredGroupIndex = g);
    InlineBackInterceptor.push(_handleInterceptedBack);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _enteredGroupIndex != g) return;
      children.first.requestFocus();
    });
  }

  void _handleInterceptedBack() {
    final g = _enteredGroupIndex;
    if (g != null) _exitGroup(g);
  }

  void _exitGroup(int g) {
    if (g < 0 || g >= _groupFocusNodes.length) return;
    InlineBackInterceptor.remove(_handleInterceptedBack);
    setState(() => _enteredGroupIndex = null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || g >= _groupFocusNodes.length) return;
      _groupFocusNodes[g].requestFocus();
    });
  }

  void _focusTarget(FocusNode? target) {
    if (widget.onRequestFocus != null) {
      widget.onRequestFocus!(target);
    } else {
      target?.requestFocus();
    }
  }

  void _disposeFocusNodes() {
    for (final node in _groupFocusNodes) {
      if (node != widget.firstItemFocusNode) {
        node.dispose();
      }
    }
    for (final group in _childFocusNodes) {
      for (final node in group) {
        node.dispose();
      }
    }
    for (final scope in _groupTrapScopes) {
      scope.dispose();
    }
  }

  @override
  void dispose() {
    InlineBackInterceptor.remove(_handleInterceptedBack);
    _disposeFocusNodes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_groups.isEmpty) return const SizedBox.shrink();

    final isMobile = _isCompact(context);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return Container(
      decoration: BoxDecoration(
        color: isNeon
            ? AppColorScheme.background.withValues(alpha: 0.25)
            : Colors.white.withValues(alpha: 0.03),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.cardBorder.copyWith(
            color: isNeon
                ? AppColorScheme.accent.withValues(alpha: 0.95)
                : Colors.white.withValues(alpha: 0.06),
            width: isNeon ? 1.2 : null,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: isMobile
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _groups.map((group) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.title,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.accent
                                    : Colors.white.withValues(alpha: 0.4),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                                fontSize: 10,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: group.items
                              .map((item) => _MetadataChip(item: item))
                              .toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _groups.asMap().entries.map((e) {
                  final groupIndex = e.key;
                  final group = e.value;
                  return Expanded(
                    child: Row(
                      children: [
                        if (groupIndex > 0)
                          Container(
                            width: 1,
                            color: isNeon
                                ? AppColorScheme.accent.withValues(alpha: 0.8)
                                : Colors.white.withValues(alpha: 0.08),
                          ),
                        Expanded(
                          child: _MetadataGroupCell(
                            title: group.title,
                            items: group.items,
                            childNodes: _childFocusNodes[groupIndex],
                            trapScope: _groupTrapScopes[groupIndex],
                            focusNode: _groupFocusNodes[groupIndex],
                            isNeon: isNeon,
                            isEntered: _enteredGroupIndex == groupIndex,
                            onEnter: () => _enterGroup(groupIndex),
                            onLeft: groupIndex == 0
                                ? null
                                : () => _groupFocusNodes[groupIndex - 1]
                                      .requestFocus(),
                            onRight: groupIndex == _groups.length - 1
                                ? null
                                : () => _groupFocusNodes[groupIndex + 1]
                                      .requestFocus(),
                            onUp: () => _focusTarget(widget.upTarget),
                            onDown: () => _focusTarget(widget.downTarget),
                            borderRadius: BorderRadius.only(
                              topLeft: groupIndex == 0
                                  ? const Radius.circular(11)
                                  : Radius.zero,
                              bottomLeft: groupIndex == 0
                                  ? const Radius.circular(11)
                                  : Radius.zero,
                              topRight: groupIndex == _groups.length - 1
                                  ? const Radius.circular(11)
                                  : Radius.zero,
                              bottomRight: groupIndex == _groups.length - 1
                                  ? const Radius.circular(11)
                                  : Radius.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}

class _OverviewText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onCollapse;

  const _OverviewText({
    required this.text,
    this.style,
    this.textAlign,
    this.focusNode,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onCollapse,
  });

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return ExpandableBiography(
      text: text,
      toggleFocusNode: focusNode,
      onArrowUp: onArrowUp,
      onArrowDown: onArrowDown,
      onArrowLeft: onArrowLeft,
      onCollapse: onCollapse,
      style:
          style ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isNeon
                ? AppColorScheme.onSurface
                : Colors.white.withValues(alpha: 0.9),
            shadows: _textShadows,
            height: 1.5,
          ),
      textAlign: textAlign,
    );
  }
}

class _EpisodeProgressBar extends StatelessWidget {
  final double percentage;

  const _EpisodeProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: LinearProgressIndicator(
        value: percentage / 100.0,
        minHeight: 3,
        backgroundColor: Colors.black38,
        valueColor: AlwaysStoppedAnimation<Color>(AppColorScheme.accent),
      ),
    );
  }
}

class DetailSeasonsRow extends StatelessWidget {
  final List<AggregatedItem> seasons;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final void Function(AggregatedItem item)? onItemLongPress;

  const DetailSeasonsRow({
    required this.seasons,
    required this.imageApi,
    required this.prefs,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);
    final cardWidth = isMobile ? 120.0 : 150.0 * desktopScale;

    return SizedBox(
      height: isMobile ? 230 : 290 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        itemCount: seasons.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final season = seasons[index];
          return MediaCard(
            title: season.name,
            subtitle: _progressText(season),
            titleColor: isNeon ? AppColorScheme.accent : null,
            subtitleColor: isNeon
                ? AppColorScheme.onSurface.withValues(alpha: 0.85)
                : null,
            imageUrl: _seasonImageUrl(season, isMobile: isMobile),
            width: cardWidth,
            aspectRatio: 2 / 3,
            focusColor: isNeon
                ? AppColorScheme.accent
                : Color(prefs.get(UserPreferences.focusColor).colorValue),
            cardFocusExpansion: cardExpansion,
            suppressFocusGlow: isNeon,
            isPlayed: season.isPlayed,
            unplayedCount: season.unplayedItemCount,
            watchedBehavior: watchedBehavior,
            itemType: season.type,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onTap: () => context.push(
              Destinations.item(season.id, serverId: season.serverId),
            ),
            onLongPress: onItemLongPress != null
                ? () => onItemLongPress!(season)
                : null,
          );
        },
      ),
    );
  }

  String? _seasonImageUrl(AggregatedItem season, {required bool isMobile}) {
    final desktopScale = _desktopUiScale(prefs: prefs);
    final primaryHeight = isMobile ? 300 : (400 * desktopScale).round();
    final secondaryWidth = isMobile ? 200 : (260 * desktopScale).round();

    String? primary(String? id, String? tag) {
      if (id == null || tag == null) return null;
      return imageApi.getPrimaryImageUrl(
        id,
        maxHeight: primaryHeight,
        tag: tag,
      );
    }

    String? thumb(String? id, String? tag) {
      if (id == null) return null;
      return imageApi.getThumbImageUrl(id, maxWidth: secondaryWidth, tag: tag);
    }

    String? backdrop(String? id, List<String> tags) {
      if (id == null || tags.isEmpty) return null;
      return imageApi.getBackdropImageUrl(
        id,
        maxWidth: secondaryWidth,
        index: 0,
        tag: tags.first,
      );
    }

    return primary(season.id, season.primaryImageTag) ??
        primary(season.seriesId, season.seriesPrimaryImageTag) ??
        primary(season.primaryImageItemId, season.primaryImageTagField) ??
        primary(
          season.parentPrimaryImageItemId,
          season.parentPrimaryImageTag,
        ) ??
        thumb(season.id, season.thumbImageTag) ??
        backdrop(season.id, season.backdropImageTags) ??
        thumb(season.seriesId, season.seriesThumbImageTag) ??
        thumb(season.parentThumbItemId, season.parentThumbImageTag) ??
        backdrop(season.parentBackdropItemId, season.parentBackdropImageTags);
  }

  String? _progressText(AggregatedItem season) {
    final total = season.childCount;
    final unplayed = season.unplayedItemCount;
    if (total == null) return null;
    if (unplayed == null || unplayed == 0) return '$total';
    final watched = total - unplayed;
    return '$watched / $total';
  }
}

class _EpisodesRow extends StatelessWidget {
  final List<AggregatedItem> episodes;
  final String currentEpisodeId;
  final ImageApi imageApi;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final VoidCallback? onChanged;

  const _EpisodesRow({
    required this.episodes,
    required this.currentEpisodeId,
    required this.imageApi,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale();

    return SizedBox(
      height: isMobile ? 150 : 180 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: episodes.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final ep = episodes[index];
          final isCurrent = ep.id == currentEpisodeId;
          return _EpisodeListCard(
            episode: ep,
            isCurrent: isCurrent,
            imageApi: imageApi,
            isMobile: isMobile,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (event) => onItemKeyEvent!(index, event),
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}

class _EpisodeListCard extends StatefulWidget {
  final AggregatedItem episode;
  final bool isCurrent;
  final ImageApi imageApi;
  final bool isMobile;
  final FocusNode? focusNode;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;
  final VoidCallback? onChanged;

  const _EpisodeListCard({
    required this.episode,
    required this.isCurrent,
    required this.imageApi,
    required this.isMobile,
    this.focusNode,
    this.onKeyEvent,
    this.onChanged,
  });

  @override
  State<_EpisodeListCard> createState() => _EpisodeListCardState();
}

class _EpisodeListCardState extends State<_EpisodeListCard>
    with FocusStateMixin {
  final _selectKeyHandler = LongPressSelectKeyHandler();

  @override
  void dispose() {
    _selectKeyHandler.dispose();
    super.dispose();
  }

  void _handleLongPress() {
    showContextMenu(context, widget.episode, onChanged: widget.onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final ep = widget.episode;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final desktopScale = _desktopUiScale();
    final epNum = ep.indexNumber;
    final runtime = ep.runtime;
    final runtimeText = runtime != null
        ? (runtime.inHours > 0
              ? '${runtime.inHours}h ${runtime.inMinutes.remainder(60)}m'
              : '${runtime.inMinutes}m')
        : null;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (_, event) {
          final customResult = widget.onKeyEvent?.call(event);
          if (customResult != null && customResult != KeyEventResult.ignored) {
            return customResult;
          }
          final handlerResult = _selectKeyHandler.handleKeyEvent(
            event,
            onTap: () =>
                context.push(Destinations.item(ep.id, serverId: ep.serverId)),
            onLongPress: _handleLongPress,
          );
          if (handlerResult != KeyEventResult.ignored) {
            return handlerResult;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: () =>
              context.push(Destinations.item(ep.id, serverId: ep.serverId)),
          onLongPress: _handleLongPress,
          onSecondaryTap: _handleLongPress,
          child: Container(
            width: widget.isMobile ? 180.0 : 220.0 * desktopScale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: showFocusBorder
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: isNeon ? AppColorScheme.accent : focusColor,
                        width: 1.5,
                      ),
                    )
                  : widget.isCurrent
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: AppColorScheme.onSurface,
                        width: 2.5,
                      ),
                    )
                  : null,
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.isMobile ? 100 : 124 * desktopScale,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (ep.primaryImageTag != null)
                        CachedNetworkImage(
                          imageUrl: widget.imageApi.getPrimaryImageUrl(
                            ep.id,
                            maxHeight: widget.isMobile
                                ? 250
                                : (250 * desktopScale).round(),
                            tag: ep.primaryImageTag,
                          ),
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => Container(
                            color: Colors.white.withValues(alpha: 0.05),
                            child: const AdaptiveIcon(
                              Icons.movie,
                              color: Colors.white24,
                              size: 32,
                            ),
                          ),
                        )
                      else
                        Container(
                          color: Colors.white.withValues(alpha: 0.05),
                          child: const AdaptiveIcon(
                            Icons.movie,
                            color: Colors.white24,
                            size: 32,
                          ),
                        ),
                      if ((ep.playedPercentage ?? 0) > 0)
                        _EpisodeProgressBar(percentage: ep.playedPercentage!),
                      if (ep.isPlayed && (ep.playedPercentage ?? 0) == 0)
                        const Positioned(
                          top: 6,
                          right: 6,
                          child: AdaptiveIcon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 6, 8, 4),
                  child: Row(
                    children: [
                      if (epNum != null)
                        Text(
                          'E$epNum',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.onSurface.withValues(
                                        alpha: 0.85,
                                      )
                                    : Colors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      if (epNum != null) const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          ep.name,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.accent
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (runtimeText != null) ...[
                        const SizedBox(width: 4),
                        Text(
                          runtimeText,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.onSurface.withValues(
                                        alpha: 0.8,
                                      )
                                    : Colors.white.withValues(alpha: 0.5),
                              ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailNextUpCard extends StatefulWidget {
  final AggregatedItem episode;
  final ImageApi imageApi;
  final FocusNode? focusNode;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;

  const DetailNextUpCard({
    required this.episode,
    required this.imageApi,
    this.focusNode,
    this.onKeyEvent,
  });

  @override
  State<DetailNextUpCard> createState() => DetailNextUpCardState();
}

class DetailNextUpCardState extends State<DetailNextUpCard> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final episode = widget.episode;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final desktopScale = _desktopUiScale();
    final s = episode.parentIndexNumber;
    final e = episode.indexNumber;
    final label = s != null && e != null ? 'S$s:E$e' : null;
    final subtitle = [?label, episode.name].join(' - ');

    final isMobile = _isCompact(context);
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (_, event) {
          final customResult = widget.onKeyEvent?.call(event);
          if (customResult != null && customResult != KeyEventResult.ignored) {
            return customResult;
          }
          if (isActivateKey(event)) {
            context.push(
              Destinations.item(episode.id, serverId: episode.serverId),
            );
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: () => context.push(
            Destinations.item(episode.id, serverId: episode.serverId),
          ),
          child: AnimatedScale(
            scale: cardExpansion && showFocusBorder ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              height: isMobile ? 100.0 : 120.0 * desktopScale,
              decoration: BoxDecoration(
                color: isNeon
                    ? Colors.transparent
                    : Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: showFocusBorder
                    ? Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: isNeon ? AppColorScheme.accent : focusColor,
                          width: 1.5,
                        ),
                      )
                    : null,
              ),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  SizedBox(
                    width: isMobile ? 178.0 : 213.0 * desktopScale,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (episode.primaryImageTag != null)
                          CachedNetworkImage(
                            imageUrl: widget.imageApi.getPrimaryImageUrl(
                              episode.id,
                              maxHeight: isMobile
                                  ? 240
                                  : (240 * desktopScale).round(),
                              tag: episode.primaryImageTag,
                            ),
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => const SizedBox.shrink(),
                          ),
                        if ((episode.playedPercentage ?? 0) > 0)
                          _EpisodeProgressBar(
                            percentage: episode.playedPercentage!,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 16 : 16 * desktopScale),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.accent
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (episode.overview != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            episode.overview!,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: isNeon
                                      ? AppColorScheme.onSurface
                                      : Colors.white.withValues(alpha: 0.7),
                                ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 16 : 16 * desktopScale),
                  AdaptiveIcon(
                    Icons.play_circle_outline,
                    color: Colors.white54,
                    size: isMobile ? 40 : 40 * desktopScale,
                  ),
                  SizedBox(width: isMobile ? 16 : 16 * desktopScale),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailEpisodeCard extends StatefulWidget {
  final AggregatedItem episode;
  final ImageApi imageApi;
  final VoidCallback? onChanged;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;

  final bool isActive;

  const DetailEpisodeCard({
    required this.episode,
    required this.imageApi,
    this.onChanged,
    this.focusNode,
    this.onKeyEvent,
    this.isActive = false,
  });

  @override
  State<DetailEpisodeCard> createState() => DetailEpisodeCardState();
}

class DetailEpisodeCardState extends State<DetailEpisodeCard> with FocusStateMixin {
  final _selectKeyHandler = LongPressSelectKeyHandler();

  @override
  void dispose() {
    _selectKeyHandler.dispose();
    super.dispose();
  }

  void _handleLongPress() {
    showContextMenu(context, widget.episode, onChanged: widget.onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final episode = widget.episode;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final desktopScale = _desktopUiScale();
    final epNum = episode.indexNumber;
    final runtime = episode.runtime;
    final runtimeText = runtime != null
        ? (runtime.inHours > 0
              ? '${runtime.inHours}h ${runtime.inMinutes.remainder(60)}m'
              : '${runtime.inMinutes}m')
        : null;

    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    final isMobile = _isCompact(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) => setFocused(focused),
        onKeyEvent: (node, event) {
          if (widget.onKeyEvent != null) {
            final res = widget.onKeyEvent!(node, event);
            if (res != KeyEventResult.ignored) return res;
          }
          final handlerResult = _selectKeyHandler.handleKeyEvent(
            event,
            onTap: () => context.push(
              Destinations.item(episode.id, serverId: episode.serverId),
            ),
            onLongPress: _handleLongPress,
          );
          if (handlerResult != KeyEventResult.ignored) {
            return handlerResult;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: () => context.push(
            Destinations.item(episode.id, serverId: episode.serverId),
          ),
          onLongPress: _handleLongPress,
          onSecondaryTap: _handleLongPress,
          child: AnimatedScale(
            scale: cardExpansion && showFocusBorder ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              height: isMobile ? 90.0 : 110.0 * desktopScale,
              decoration: BoxDecoration(
                color: isNeon
                    ? Colors.transparent
                    : Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(8),
                border: showFocusBorder
                    ? Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: isNeon ? AppColorScheme.accent : focusColor,
                          width: 1.5,
                        ),
                      )
                    : (widget.isActive
                        ? Border.fromBorderSide(
                            ThemeRegistry.active.borders.focusBorder.copyWith(
                              color: isNeon ? const Color(0xFF00FFFF) : Colors.cyan.withValues(alpha: 0.7),
                              width: 1.5,
                            ),
                          )
                        : null),
              ),
              clipBehavior: Clip.none,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Row(
                children: [
                  SizedBox(
                    width: isMobile ? 160.0 : 196.0 * desktopScale,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (episode.primaryImageTag != null)
                          CachedNetworkImage(
                            imageUrl: widget.imageApi.getPrimaryImageUrl(
                              episode.id,
                              maxHeight: isMobile
                                  ? 220
                                  : (220 * desktopScale).round(),
                              tag: episode.primaryImageTag,
                            ),
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => Container(
                              color: Colors.white.withValues(alpha: 0.05),
                              child: const AdaptiveIcon(
                                Icons.movie,
                                color: Colors.white24,
                                size: 32,
                              ),
                            ),
                          )
                        else
                          Container(
                            color: Colors.white.withValues(alpha: 0.05),
                            child: const AdaptiveIcon(
                              Icons.movie,
                              color: Colors.white24,
                              size: 32,
                            ),
                          ),
                        if ((episode.playedPercentage ?? 0) > 0)
                          _EpisodeProgressBar(
                            percentage: episode.playedPercentage!,
                          ),
                        if (episode.isPlayed)
                          Positioned(
                            top: 6,
                            right: 6,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColorScheme.accent,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: AdaptiveIcon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 16 : 16 * desktopScale),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          [
                            if (epNum != null)
                              AppLocalizations.of(context).episodeLabel(epNum),
                            episode.name,
                          ].join(' - '),
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: isNeon
                                    ? AppColorScheme.accent
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (runtimeText != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            runtimeText,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: isNeon
                                      ? AppColorScheme.onSurface.withValues(
                                          alpha: 0.8,
                                        )
                                      : Colors.white.withValues(alpha: 0.5),
                                ),
                          ),
                        ],
                        if (episode.overview != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            episode.overview!,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: isNeon
                                      ? AppColorScheme.onSurface
                                      : Colors.white.withValues(alpha: 0.7),
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 12 : 12 * desktopScale),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}

class PersonHeader extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;

  const PersonHeader({required this.item, required this.imageApi});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = _isCompact(context);
    final safeTop = MediaQuery.of(context).padding.top;
    String? imageUrl;
    if (item.primaryImageTag != null) {
      imageUrl = imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 400,
        tag: item.primaryImageTag,
      );
    }

    final avatarRadius = isMobile ? 60.0 : 80.0;
    final avatar = CircleAvatar(
      radius: avatarRadius,
      backgroundColor: Colors.white.withValues(alpha: 0.1),
      backgroundImage: imageUrl != null
          ? CachedNetworkImageProvider(imageUrl)
          : null,
      child: imageUrl == null
          ? AdaptiveIcon(
              Icons.person,
              color: Colors.white54,
              size: isMobile ? 48 : 64,
            )
          : null,
    );

    final info = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (!isMobile) const SizedBox(height: 16),
        Text(
          item.name,
          style:
              (isMobile
                      ? theme.textTheme.headlineSmall
                      : theme.textTheme.headlineLarge)
                  ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: _textShadows,
                  ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 8),
        PersonDates(item: item),
        if (item.productionLocations.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              item.productionLocations.first,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
                shadows: _textShadows,
              ),
            ),
          ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: safeTop + (isMobile ? 60 : 80)),
      child: isMobile
          ? Column(children: [avatar, const SizedBox(height: 16), info])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                avatar,
                const SizedBox(width: 32),
                Expanded(child: info),
              ],
            ),
    );
  }
}

class PersonDates extends StatelessWidget {
  final AggregatedItem item;

  const PersonDates({required this.item});

  @override
  Widget build(BuildContext context) {
    final birth = item.premiereDate;
    final death = item.endDate;
    if (birth == null && death == null) return const SizedBox.shrink();

    final parts = <String>[];
    if (birth != null) {
      parts.add(AppLocalizations.of(context).born(_formatDate(birth)));
    }
    if (death != null) {
      parts.add(AppLocalizations.of(context).died(_formatDate(death)));
    } else if (birth != null) {
      final age = _calculateAge(birth);
      if (age > 0) parts.add(AppLocalizations.of(context).age(age));
    }

    return Text(
      parts.join('  \u2022  '),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white.withValues(alpha: 0.7),
        shadows: _textShadows,
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  int _calculateAge(DateTime birth) {
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }
}

class PersonDatesVertical extends StatelessWidget {
  final AggregatedItem item;

  const PersonDatesVertical({required this.item});

  @override
  Widget build(BuildContext context) {
    final birth = item.premiereDate;
    final death = item.endDate;
    if (birth == null && death == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.white.withValues(alpha: 0.7),
      shadows: _textShadows,
    );

    final lines = <String>[];
    if (birth != null) {
      lines.add(l10n.born(_formatDate(birth)));
    }
    if (death != null) {
      lines.add(l10n.died(_formatDate(death)));
    } else if (birth != null) {
      final age = _calculateAge(birth);
      if (age > 0) lines.add(l10n.age(age));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: lines
          .map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(line, style: style, textAlign: TextAlign.center),
            ),
          )
          .toList(),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  int _calculateAge(DateTime birth) {
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }
}

class ExpandableBiography extends StatefulWidget {
  final String text;
  final FocusNode? toggleFocusNode;
  final FocusNode? upTarget;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final VoidCallback? onCollapse;
  final TextStyle? style;
  final TextAlign? textAlign;

  static DateTime? lastCollapseTime;

  const ExpandableBiography({
    required this.text,
    this.toggleFocusNode,
    this.upTarget,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
    this.onCollapse,
    this.style,
    this.textAlign,
  });

  @override
  State<ExpandableBiography> createState() => _ExpandableBiographyState();
}

class _ExpandableBiographyState extends State<ExpandableBiography> {
  bool _expanded = false;
  bool _focused = false;
  static const double _contentHorizontalPadding = 8;
  final ScrollController _scrollbarController = ScrollController();

  @override
  void dispose() {
    _scrollbarController.dispose();
    super.dispose();
  }

  bool _handleUpWithoutToggle() {
    if (widget.onArrowUp != null) {
      widget.onArrowUp!();
      return true;
    }
    final upTarget = widget.upTarget;
    if (upTarget != null && upTarget.canRequestFocus) {
      upTarget.requestFocus();
      return true;
    }

    final navbarPosition = GetIt.instance<UserPreferences>().get(
      UserPreferences.navbarPosition,
    );
    if (navbarPosition != NavbarPosition.top) {
      return true;
    }

    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      final scrollable = Scrollable.maybeOf(context);
      if (scrollable != null) {
        _animateScrollToTop(scrollable.position);
      }
      focusNavbar();
      return true;
    }

    return false;
  }

  bool _textOverflows(BoxConstraints constraints, TextStyle? style) {
    final maxWidth = constraints.maxWidth.isFinite
        ? (constraints.maxWidth - (_contentHorizontalPadding * 2)).clamp(
            0.0,
            double.infinity,
          )
        : constraints.maxWidth;
    if (maxWidth <= 0) {
      return false;
    }
    final limit = (GetIt.instance<UserPreferences>()
                .get(UserPreferences.desktopUiScale)
                .scaleFactor >=
            1.2)
        ? 2
        : 4;
    final tp = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      maxLines: limit,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return tp.didExceedMaxLines;
  }

  bool _stepScrollDirect({required bool down}) {
    if (!_scrollbarController.hasClients) return false;
    final maxScroll = _scrollbarController.position.maxScrollExtent;
    final currentScroll = _scrollbarController.offset;
    if (down) {
      if (currentScroll < maxScroll) {
        _scrollbarController.animateTo(
          (currentScroll + 40.0).clamp(0.0, maxScroll),
          duration: const Duration(milliseconds: 80),
          curve: Curves.easeOut,
        );
        return true;
      }
    } else {
      if (currentScroll > 0.0) {
        _scrollbarController.animateTo(
          (currentScroll - 40.0).clamp(0.0, double.infinity),
          duration: const Duration(milliseconds: 80),
          curve: Curves.easeOut,
        );
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final style =
        widget.style ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white.withValues(alpha: 0.9),
          shadows: _textShadows,
          height: 1.5,
        );
    final l10n = AppLocalizations.of(context);
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return LayoutBuilder(
      builder: (context, constraints) {
        final overflows = _textOverflows(constraints, style);
        final canToggle = overflows;

        return Focus(
          focusNode: canToggle ? widget.toggleFocusNode : null,
          canRequestFocus: canToggle,
          skipTraversal: !canToggle,
          onFocusChange: (focused) {
            if (_focused != focused) {
              setState(() => _focused = focused);
            }
          },
          onKeyEvent: (_, event) {
            if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
              return KeyEventResult.ignored;
            }

            final isBackKey = event.logicalKey == LogicalKeyboardKey.escape ||
                event.logicalKey == LogicalKeyboardKey.goBack ||
                event.logicalKey == LogicalKeyboardKey.browserBack ||
                event.logicalKey == LogicalKeyboardKey.gameButtonB ||
                event.logicalKey == LogicalKeyboardKey.backspace;
            if (_expanded && isBackKey) {
              setState(() {
                _expanded = false;
              });
              ExpandableBiography.lastCollapseTime = DateTime.now();
              widget.onCollapse?.call();
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              if (widget.onArrowLeft != null) {
                widget.onArrowLeft!();
                return KeyEventResult.handled;
              }
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              if (widget.onArrowRight != null) {
                widget.onArrowRight!();
                return KeyEventResult.handled;
              }
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
                (!canToggle || !_expanded)) {
              return _handleUpWithoutToggle()
                  ? KeyEventResult.handled
                  : KeyEventResult.ignored;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
                (!canToggle || !_expanded)) {
              if (widget.onArrowDown != null) {
                widget.onArrowDown!();
                return KeyEventResult.handled;
              }
            }

            if (_expanded && event.logicalKey == LogicalKeyboardKey.arrowDown) {
              _stepScrollDirect(down: true);
              return KeyEventResult.handled;
            }
            if (_expanded && event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _stepScrollDirect(down: false);
              return KeyEventResult.handled;
            }
            if (canToggle && isActivateKey(event)) {
              setState(() => _expanded = !_expanded);
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: canToggle
                ? () => setState(() => _expanded = !_expanded)
                : null,
            child: AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: Container(
                constraints: (canToggle && _expanded)
                    ? const BoxConstraints(maxHeight: 220.0)
                    : const BoxConstraints(),
                padding: canToggle
                    ? const EdgeInsets.all(12)
                    : EdgeInsets.zero,
                decoration: canToggle
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _focused
                              ? (isNeon ? AppColorScheme.accent : focusColor)
                              : Colors.white.withValues(alpha: 0.08),
                          width: _focused ? 1.5 : 1.0,
                        ),
                        color: _focused
                            ? (isNeon
                                ? AppColorScheme.accent.withValues(alpha: 0.04)
                                : focusColor.withValues(alpha: 0.04))
                            : Colors.white.withValues(alpha: 0.02),
                      )
                    : const BoxDecoration(),
                child: _expanded
                    ? NotificationListener<ScrollNotification>(
                        onNotification: (notification) => true, // Stop bubbling
                        child: SingleChildScrollView(
                          controller: _scrollbarController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.text,
                                style: style,
                                textAlign: widget.textAlign,
                              ),
                              if (canToggle) ...[
                                const SizedBox(height: 8),
                                Text(
                                  l10n.showLess,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColorScheme.accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.text,
                            style: style,
                            maxLines: (GetIt.instance<UserPreferences>()
                                        .get(UserPreferences.desktopUiScale)
                                        .scaleFactor >=
                                    1.2)
                                ? 2
                                : 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: widget.textAlign,
                          ),
                          if (canToggle) ...[
                            const SizedBox(height: 8),
                            Text(
                              l10n.readMore,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColorScheme.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FilmographyRow extends StatelessWidget {
  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final void Function(AggregatedItem item)? onItemLongPress;

  const FilmographyRow({
    required this.items,
    required this.imageApi,
    required this.prefs,
    this.scrollController,
    this.firstFocusNode,
    this.onItemKeyEvent,
    this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);

    // Aligned with the Home Screen's scaling logic:
    final platformScale = PlatformDetection.isTV
        ? 0.8 * desktopScale
        : desktopScale;
    final metadataScale = desktopScale;
    final isRowsV2 =
        prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    final rowScale = isRowsV2 ? 2.0 : 1.0;

    final posterSize = prefs.get(UserPreferences.posterSize);
    final cardHeight =
        posterSize.portraitHeight.toDouble() * platformScale * rowScale;

    // Check if the items are of type 'Episode' (landscape aspect ratio 16/9)
    final isEpisode = items.isNotEmpty && items.first.type == 'Episode';
    final cardAspectRatio = isEpisode ? 16 / 9 : 2 / 3;

    final cardWidth = isMobile
        ? (isEpisode ? 160.0 : 120.0)
        : cardHeight * cardAspectRatio;
    final rowHeight = isMobile ? 240.0 : cardHeight + (56 * metadataScale);

    return SizedBox(
      height: rowHeight,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final item = items[index];
          final year = item.productionYear;

          final String title;
          final String? subtitle;
          if (isEpisode) {
            final s = item.parentIndexNumber;
            final e = item.indexNumber;
            final episodeInfo = switch ((s, e)) {
              (final season?, final episode?) => 'S$season:E$episode',
              _ => null,
            };
            title = item.seriesName ?? item.name;
            subtitle = episodeInfo != null
                ? '$episodeInfo - ${item.name}'
                : item.name;
          } else {
            title = item.name;
            subtitle = year?.toString();
          }

          return MediaCard(
            title: title,
            subtitle: subtitle,
            imageUrl: item.primaryImageTag != null
                ? imageApi.getPrimaryImageUrl(
                    item.id,
                    maxHeight: isMobile ? 300 : (400 * desktopScale).round(),
                    tag: item.primaryImageTag,
                  )
                : null,
            width: cardWidth,
            aspectRatio: cardAspectRatio,
            focusColor: Color(prefs.get(UserPreferences.focusColor).colorValue),
            cardFocusExpansion: cardExpansion,
            isFavorite: item.isFavorite,
            isPlayed: item.isPlayed,
            playedPercentage: item.playedPercentage,
            watchedBehavior: watchedBehavior,
            itemType: item.type,
            autofocus: index == 0 && firstFocusNode != null,
            focusNode: index == 0 ? firstFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onLongPress: onItemLongPress != null
                ? () => onItemLongPress!(item)
                : null,
            onTap: () => context.push(
              Destinations.item(item.id, serverId: item.serverId),
            ),
          );
        },
      ),
    );
  }
}

class SeerrAppearancesRow extends StatelessWidget {
  final List<SeerrDiscoverItem> items;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;

  const SeerrAppearancesRow({
    required this.items,
    required this.prefs,
    this.scrollController,
    this.firstFocusNode,
    this.onItemKeyEvent,
  });

  @override
  Widget build(BuildContext context) {
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);

    // Aligned with the Home Screen's scaling logic:
    final platformScale = PlatformDetection.isTV
        ? 0.8 * desktopScale
        : desktopScale;
    final metadataScale = desktopScale;
    final isRowsV2 =
        prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    final rowScale = isRowsV2 ? 2.0 : 1.0;

    final posterSize = prefs.get(UserPreferences.posterSize);
    final cardHeight =
        posterSize.portraitHeight.toDouble() * platformScale * rowScale;

    final cardWidth = isMobile ? 120.0 : cardHeight * (2 / 3);
    final rowHeight = isMobile ? 240.0 : cardHeight + (56 * metadataScale);
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;

    return SizedBox(
      height: rowHeight,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final item = items[index];

          return MediaCard(
            title: item.displayTitle,
            subtitle: item.character,
            imageUrl: item.posterPath != null
                ? 'https://image.tmdb.org/t/p/w342${item.posterPath}'
                : null,
            width: cardWidth,
            aspectRatio: 2 / 3,
            focusColor: focusColor,
            cardFocusExpansion: cardExpansion,
            suppressFocusGlow: suppressFocusGlow,
            seerrMediaType: item.mediaType,
            seerrStatus: item.mediaInfo?.status,
            autofocus: index == 0 && firstFocusNode != null,
            focusNode: index == 0 ? firstFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onTap: () {
              final mediaType = item.mediaType ?? 'movie';
              context.push(
                Destinations.seerrMedia(item.id.toString()),
                extra: {'mediaType': mediaType},
              );
            },
          );
        },
      ),
    );
  }
}

class SeerrCrewCreditsRow extends StatelessWidget {
  final List<SeerrDiscoverItem> items;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;

  const SeerrCrewCreditsRow({
    required this.items,
    required this.prefs,
    this.scrollController,
    this.firstFocusNode,
    this.onItemKeyEvent,
  });

  @override
  Widget build(BuildContext context) {
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);

    final platformScale = PlatformDetection.isTV
        ? 0.8 * desktopScale
        : desktopScale;
    final metadataScale = desktopScale;
    final isRowsV2 =
        prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    final rowScale = isRowsV2 ? 2.0 : 1.0;

    final posterSize = prefs.get(UserPreferences.posterSize);
    final cardHeight =
        posterSize.portraitHeight.toDouble() * platformScale * rowScale;

    final cardWidth = isMobile ? 120.0 : cardHeight * (2 / 3);
    final rowHeight = isMobile ? 240.0 : cardHeight + (56 * metadataScale);
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;

    return SizedBox(
      height: rowHeight,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final item = items[index];

          return MediaCard(
            title: item.displayTitle,
            subtitle: item.job ?? item.department,
            imageUrl: item.posterPath != null
                ? 'https://image.tmdb.org/t/p/w342${item.posterPath}'
                : null,
            width: cardWidth,
            aspectRatio: 2 / 3,
            focusColor: focusColor,
            cardFocusExpansion: cardExpansion,
            suppressFocusGlow: suppressFocusGlow,
            seerrMediaType: item.mediaType,
            seerrStatus: item.mediaInfo?.status,
            autofocus: index == 0 && firstFocusNode != null,
            focusNode: index == 0 ? firstFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onTap: () {
              final mediaType = item.mediaType ?? 'movie';
              context.push(
                Destinations.seerrMedia(item.id.toString()),
                extra: {'mediaType': mediaType},
              );
            },
          );
        },
      ),
    );
  }
}

class _ArtistHeader extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;

  const _ArtistHeader({required this.item, required this.imageApi});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = _isCompact(context);
    final safeTop = MediaQuery.of(context).padding.top;
    String? imageUrl;
    if (item.primaryImageTag != null) {
      imageUrl = imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 400,
        tag: item.primaryImageTag,
      );
    }

    final avatarRadius = isMobile ? 60.0 : 80.0;
    final avatar = CircleAvatar(
      radius: avatarRadius,
      backgroundColor: Colors.white.withValues(alpha: 0.1),
      backgroundImage: imageUrl != null
          ? CachedNetworkImageProvider(imageUrl)
          : null,
      child: imageUrl == null
          ? AdaptiveIcon(
              Icons.music_note,
              color: Colors.white54,
              size: isMobile ? 48 : 64,
            )
          : null,
    );

    final info = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (!isMobile) const SizedBox(height: 16),
        Text(
          item.name,
          style:
              (isMobile
                      ? theme.textTheme.headlineSmall
                      : theme.textTheme.headlineLarge)
                  ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: _textShadows,
                  ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        if (item.genres.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            item.genres.join(' \u2022 '),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
              shadows: _textShadows,
            ),
          ),
        ],
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: safeTop + (isMobile ? 60 : 80)),
      child: isMobile
          ? Column(children: [avatar, const SizedBox(height: 16), info])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                avatar,
                const SizedBox(width: 32),
                Expanded(child: info),
              ],
            ),
    );
  }
}

class _AlbumHeader extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final bool isAudiobook;
  final VoidCallback? onRenameRequested;

  const _AlbumHeader({
    required this.item,
    required this.imageApi,
    this.isAudiobook = false,
    this.onRenameRequested,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = _isCompact(context);
    final safeTop = MediaQuery.of(context).padding.top;
    final desktopScale = _desktopUiScale();
    final albumSize = isMobile ? 150.0 : 200.0 * desktopScale;

    final albumArt = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: item.primaryImageTag != null
          ? CachedNetworkImage(
              imageUrl: imageApi.getPrimaryImageUrl(
                item.id,
                maxHeight: 400,
                tag: item.primaryImageTag,
              ),
              width: albumSize,
              height: albumSize,
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => _albumPlaceholder(albumSize),
            )
          : _albumPlaceholder(albumSize),
    );

    final info = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (!isMobile) const SizedBox(height: 16),
        GestureDetector(
          onTap: onRenameRequested,
          child: Text(
            item.name,
            style:
                (isMobile
                        ? theme.textTheme.headlineSmall
                        : theme.textTheme.headlineLarge)
                    ?.copyWith(
                      color: onRenameRequested != null
                          ? AppColorScheme.accent
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: _textShadows,
                    ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        if (item.albumArtist != null) ...[
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              final artistId = item.albumArtists.isNotEmpty
                  ? item.albumArtists.first['Id']?.toString()
                  : null;
              if (artistId != null) {
                context.push(
                  Destinations.item(artistId, serverId: item.serverId),
                );
              }
            },
            child: Text(
              item.albumArtist!,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColorScheme.accent,
                shadows: _textShadows,
              ),
            ),
          ),
        ],
        const SizedBox(height: 8),
        _AlbumMeta(item: item, isAudiobook: isAudiobook),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: safeTop + (isMobile ? 60 : 80)),
      child: isMobile
          ? Column(children: [albumArt, const SizedBox(height: 16), info])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                albumArt,
                const SizedBox(width: 32),
                Expanded(child: info),
              ],
            ),
    );
  }

  Widget _albumPlaceholder(double size) {
    return Container(
      width: size,
      height: size,
      color: Colors.white.withValues(alpha: 0.1),
      child: const AdaptiveIcon(Icons.album, color: Colors.white24, size: 64),
    );
  }
}

class _AlbumMeta extends StatelessWidget {
  final AggregatedItem item;
  final bool isAudiobook;

  const _AlbumMeta({required this.item, this.isAudiobook = false});

  @override
  Widget build(BuildContext context) {
    final parts = <String>[];
    if (item.productionYear != null) parts.add(item.productionYear.toString());
    final songCount = item.childCount ?? item.recursiveItemCount;
    if (songCount != null) {
      parts.add(
        isAudiobook
            ? AppLocalizations.of(context).chapterCount(songCount)
            : AppLocalizations.of(context).trackCount(songCount),
      );
    }
    if (item.genres.isNotEmpty) {
      final genresList = item.type == 'Playlist' ? item.genres : item.genres.take(2);
      parts.add(genresList.join(', '));
    }
    if (parts.isEmpty) return const SizedBox.shrink();
    return Text(
      parts.join(' \u2022 '),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.white.withValues(alpha: 0.7),
        shadows: _textShadows,
      ),
    );
  }
}

class _AlbumActions extends StatelessWidget {
  final AggregatedItem item;
  final List<AggregatedItem> tracks;
  final FocusNode? playFocusNode;
  final bool autofocusPlay;
  final VoidCallback? onPlayDown;
  final bool showAddToPlaylist;
  final VoidCallback? onDownloadAll;
  final VoidCallback? onDeleteDownloaded;
  final VoidCallback? onDeletePlaylist;

  const _AlbumActions({
    required this.item,
    required this.tracks,
    this.playFocusNode,
    this.autofocusPlay = false,
    this.onPlayDown,
    this.showAddToPlaylist = true,
    this.onDownloadAll,
    this.onDeleteDownloaded,
    this.onDeletePlaylist,
  });

  void _playAndOpen(
    BuildContext context,
    PlaybackManager manager,
    List<AggregatedItem> queue,
  ) {
    final isAudioQueue = queue.every(_isAudioItem);
    unawaited(() async {
      try {
        await manager.playItems(queue);
      } catch (_) {
        return;
      }
      if (!context.mounted) return;
      context.push(
        isAudioQueue ? Destinations.audioPlayer : Destinations.videoPlayer,
      );
    }());
  }

  bool _isAudioItem(AggregatedItem item) {
    final mediaType = item.rawData['MediaType'] as String?;
    return item.type == 'Audio' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
  }

  @override
  Widget build(BuildContext context) {
    final manager = GetIt.instance<PlaybackManager>();
    final offlineRepo = GetIt.instance<OfflineRepository>();
    final trackIds = tracks.map((track) => track.id).toSet();
    if (trackIds.isEmpty) {
      return _buildActions(context, manager, false);
    }

    return StreamBuilder<List<DownloadedItem>>(
      stream: offlineRepo.watchItems(),
      builder: (context, snapshot) {
        final hasDownloadedTracks =
            snapshot.data?.any(
              (row) =>
                  row.downloadStatus == 2 &&
                  row.localFilePath != null &&
                  trackIds.contains(row.itemId),
            ) ??
            false;
        return _buildActions(context, manager, hasDownloadedTracks);
      },
    );
  }

  Widget _buildActions(
    BuildContext context,
    PlaybackManager manager,
    bool hasDownloadedTracks,
  ) {
    final l10n = AppLocalizations.of(context);
    final rawButtons = <_DetailActionButton>[
      _DetailActionButton(
        label: l10n.play,
        icon: Icons.play_arrow,
        focusNode: playFocusNode,
        autofocus: autofocusPlay,
        onArrowDown: onPlayDown,
        onPressed: () {
          if (tracks.isEmpty) return;
          _playAndOpen(context, manager, tracks);
        },
      ),
      _DetailActionButton(
        label: l10n.shuffle,
        icon: Icons.shuffle,
        onArrowDown: onPlayDown,
        onPressed: () {
          if (tracks.isEmpty) return;
          final shuffled = List<AggregatedItem>.from(tracks)..shuffle();
          _playAndOpen(context, manager, shuffled);
        },
      ),
      if (onDownloadAll != null)
        _DetailActionButton(
          label: l10n.download,
          icon: Icons.download,
          onArrowDown: onPlayDown,
          onPressed: onDownloadAll!,
        ),
      if (onDeleteDownloaded != null && hasDownloadedTracks)
        _DetailActionButton(
          label: l10n.deleteDownloaded,
          icon: Icons.delete_sweep,
          onArrowDown: onPlayDown,
          onPressed: onDeleteDownloaded!,
        ),
      if (onDeletePlaylist != null)
        _DetailActionButton(
          label: l10n.delete,
          icon: Icons.delete_outline,
          onArrowDown: onPlayDown,
          onPressed: onDeletePlaylist!,
        ),
      if (showAddToPlaylist)
        _DetailActionButton(
          label: l10n.playlist,
          icon: Icons.playlist_add,
          onArrowDown: onPlayDown,
          onPressed: () => AddToPlaylistDialog.show(
            context,
            itemIds: [item.id],
            serverId: item.serverId,
          ),
        ),
    ];

    final processedButtons = <Widget>[];
    for (var i = 0; i < rawButtons.length; i++) {
      final btn = rawButtons[i];
      processedButtons.add(
        _DetailActionButton(
          label: btn.label,
          icon: btn.icon,
          onPressed: btn.onPressed,
          onLongPress: btn.onLongPress,
          onFocused: btn.onFocused,
          onArrowUp: () {},
          onArrowDown: btn.onArrowDown,
          onArrowLeft: i == 0 ? () {} : btn.onArrowLeft,
          onArrowRight: i == rawButtons.length - 1 ? () {} : btn.onArrowRight,
          isActive: btn.isActive,
          activeColor: btn.activeColor,
          neonAccentColor: btn.neonAccentColor,
          focusNode: btn.focusNode,
          autofocus: btn.autofocus,
          suppressAutoScrollToTop: btn.suppressAutoScrollToTop,
        ),
      );
    }

    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: processedButtons,
      ),
    );
  }
}

class _AlbumsRow extends StatelessWidget {
  final List<AggregatedItem> albums;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final ScrollController? scrollController;
  final FocusNode? firstItemFocusNode;
  final KeyEventResult Function(int index, KeyEvent event)? onItemKeyEvent;
  final void Function(AggregatedItem item)? onItemLongPress;

  const _AlbumsRow({
    required this.albums,
    required this.imageApi,
    required this.prefs,
    this.scrollController,
    this.firstItemFocusNode,
    this.onItemKeyEvent,
    this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScale(prefs: prefs);
    final cardWidth = isMobile ? 120.0 : 150.0 * desktopScale;

    return SizedBox(
      height: isMobile ? 180 : 220 * desktopScale,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: albums.length,
        separatorBuilder: (_, _) =>
            SizedBox(width: isMobile ? 8 : 12 * desktopScale),
        itemBuilder: (context, index) {
          final album = albums[index];
          return MediaCard(
            title: album.name,
            subtitle: album.productionYear?.toString(),
            imageUrl: album.primaryImageTag != null
                ? imageApi.getPrimaryImageUrl(
                    album.id,
                    maxHeight: isMobile ? 240 : (300 * desktopScale).round(),
                    tag: album.primaryImageTag,
                  )
                : null,
            width: cardWidth,
            aspectRatio: 1.0,
            focusColor: Color(prefs.get(UserPreferences.focusColor).colorValue),
            cardFocusExpansion: cardExpansion,
            watchedBehavior: watchedBehavior,
            itemType: album.type,
            focusNode: index == 0 ? firstItemFocusNode : null,
            onKeyEvent: onItemKeyEvent == null
                ? null
                : (_, event) => onItemKeyEvent!(index, event),
            onLongPress: onItemLongPress != null
                ? () => onItemLongPress!(album)
                : null,
            onTap: () => context.push(
              Destinations.item(album.id, serverId: album.serverId),
            ),
          );
        },
      ),
    );
  }
}

class DetailTrackList extends StatelessWidget {
  final List<AggregatedItem> tracks;
  final FocusNode Function(String) getFocusNode;
  final VoidCallback? onFirstTrackUp;
  final ValueChanged<AggregatedItem>? onTrackFocused;
  final bool isAudiobook;
  final bool groupByDisc;
  final ValueChanged<int> onPlayTrack;
  final bool reorderable;
  final ReorderCallback? onReorder;
  final ValueChanged<AggregatedItem>? onRemoveFromPlaylist;
  final ValueChanged<int>? onMoveUp;
  final ValueChanged<int>? onMoveDown;
  final bool isPlaylist;
  final ImageApi? imageApi;

  const DetailTrackList({
    required this.tracks,
    required this.getFocusNode,
    this.onFirstTrackUp,
    this.onTrackFocused,
    this.isAudiobook = false,
    this.groupByDisc = false,
    required this.onPlayTrack,
    this.reorderable = false,
    this.onReorder,
    this.onRemoveFromPlaylist,
    this.onMoveUp,
    this.onMoveDown,
    this.isPlaylist = false,
    this.imageApi,
  });

  @override
  Widget build(BuildContext context) {
    if (reorderable && onReorder != null) {
      return ReorderableListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        buildDefaultDragHandles: false,
        itemCount: tracks.length,
        onReorder: onReorder!,
        itemBuilder: (context, index) {
          final track = tracks[index];
          final keyId = track.rawData['PlaylistItemId']?.toString() ?? track.id;
          return _TrackTile(
            key: ValueKey('playlist-track-$keyId'),
            track: track,
            focusNode: getFocusNode(track.id),
            onArrowUp: index == 0 ? onFirstTrackUp : null,
            onFocused: onTrackFocused == null
                ? null
                : () => onTrackFocused!(track),
            index: index + 1,
            totalCount: tracks.length,
            currentIndex: index,
            reorderable: true,
            reorderIndex: index,
            onTap: () => onPlayTrack(index),
            onRemoveFromPlaylist: onRemoveFromPlaylist,
            onMoveUp: onMoveUp,
            onMoveDown: onMoveDown,
            isAudiobook: isAudiobook,
            isPlaylist: isPlaylist,
            imageApi: imageApi,
          );
        },
      );
    }

    final hasMultipleDiscs =
        groupByDisc &&
        tracks.map((track) => track.parentIndexNumber ?? 1).toSet().length > 1;
    final l10n = hasMultipleDiscs ? AppLocalizations.of(context) : null;
    final children = <Widget>[];
    int? previousDiscNumber;

    for (var index = 0; index < tracks.length; index++) {
      final track = tracks[index];
      final discNumber = track.parentIndexNumber ?? 1;

      if (hasMultipleDiscs && discNumber != previousDiscNumber) {
        children.add(
          Padding(
            padding: EdgeInsets.fromLTRB(4, index == 0 ? 0 : 16, 4, 8),
            child: Text(
              l10n!.discNumber(discNumber),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }

      children.add(
        _TrackTile(
          track: track,
          focusNode: getFocusNode(track.id),
          onArrowUp: index == 0 ? onFirstTrackUp : null,
          onFocused: onTrackFocused == null
              ? null
              : () => onTrackFocused!(track),
          index: index + 1,
          totalCount: tracks.length,
          currentIndex: index,
          reorderable: false,
          reorderIndex: index,
          onTap: () => onPlayTrack(index),
          onRemoveFromPlaylist: onRemoveFromPlaylist,
          onMoveUp: onMoveUp,
          onMoveDown: onMoveDown,
          isAudiobook: isAudiobook,
          isPlaylist: isPlaylist,
          imageApi: imageApi,
        ),
      );

      previousDiscNumber = discNumber;
    }

    return Column(children: children);
  }
}

class _TrackTile extends StatefulWidget {
  final AggregatedItem track;
  final FocusNode? focusNode;
  final VoidCallback? onFocused;
  final VoidCallback? onArrowUp;
  final bool isAudiobook;
  final bool isPlaylist;
  final ImageApi? imageApi;
  final int index;
  final int currentIndex;
  final int totalCount;
  final bool reorderable;
  final int reorderIndex;
  final VoidCallback onTap;
  final ValueChanged<AggregatedItem>? onRemoveFromPlaylist;
  final ValueChanged<int>? onMoveUp;
  final ValueChanged<int>? onMoveDown;

  const _TrackTile({
    super.key,
    required this.track,
    this.focusNode,
    this.onFocused,
    this.onArrowUp,
    this.isAudiobook = false,
    this.isPlaylist = false,
    this.imageApi,
    required this.index,
    required this.currentIndex,
    required this.totalCount,
    required this.reorderable,
    required this.reorderIndex,
    required this.onTap,
    this.onRemoveFromPlaylist,
    this.onMoveUp,
    this.onMoveDown,
  });

  @override
  State<_TrackTile> createState() => _TrackTileState();
}

class _TrackTileState extends State<_TrackTile> with FocusStateMixin {
  Timer? _selectLongPressTimer;
  bool _selectLongPressTriggered = false;

  void _keepTrackVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 180),
        alignment: 0.5,
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _selectLongPressTimer?.cancel();
    super.dispose();
  }

  KeyEventResult _handleTvKeys(KeyEvent event) {
    final key = event.logicalKey;

    if (key.isUpKey && event.isActionable && widget.onArrowUp != null) {
      widget.onArrowUp!.call();
      return KeyEventResult.handled;
    }

    if (widget.reorderable && event.isActionable) {
      if (key.isLeftKey) {
        if (widget.onMoveUp != null && widget.currentIndex > 0) {
          widget.onMoveUp!(widget.currentIndex);
          _keepTrackVisible();
        }
        return KeyEventResult.handled;
      }
      if (key.isRightKey) {
        if (widget.onMoveDown != null &&
            widget.currentIndex < widget.totalCount - 1) {
          widget.onMoveDown!(widget.currentIndex);
          _keepTrackVisible();
        }
        return KeyEventResult.handled;
      }
    }

    if (key.isContextMenuKey && event.isActionable) {
      _showTrackActions(context);
      return KeyEventResult.handled;
    }

    if (!key.isSelectKey) return KeyEventResult.ignored;

    if (event is KeyDownEvent) {
      _selectLongPressTriggered = false;
      _selectLongPressTimer?.cancel();
      _selectLongPressTimer = Timer(const Duration(milliseconds: 450), () {
        if (!mounted || _selectLongPressTriggered) return;
        _selectLongPressTriggered = true;
        _showTrackActions(context);
      });
      return KeyEventResult.handled;
    }

    if (event is KeyRepeatEvent) {
      if (!_selectLongPressTriggered) {
        _selectLongPressTimer?.cancel();
        _selectLongPressTriggered = true;
        _showTrackActions(context);
      }
      return KeyEventResult.handled;
    }

    if (event is KeyUpEvent) {
      _selectLongPressTimer?.cancel();
      _selectLongPressTimer = null;
      if (_selectLongPressTriggered) {
        _selectLongPressTriggered = false;
        return KeyEventResult.handled;
      }
      widget.onTap();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final runtime = widget.track.runtime;
    final isAudio = widget.track.type == 'Audio';
    final runtimeText = runtime != null
        ? (isAudio
            ? '${runtime.inMinutes}:${(runtime.inSeconds % 60).toString().padLeft(2, '0')}'
            : (runtime.inHours > 0
                ? '${runtime.inHours}h ${runtime.inMinutes.remainder(60)}m'
                : '${runtime.inMinutes}m'))
        : null;

    final trackNumber = widget.isPlaylist
        ? widget.index
        : (widget.track.indexNumber ?? widget.index);

    final isEpisode = widget.track.type == 'Episode';
    final title = isEpisode
        ? (widget.track.seriesName ?? widget.track.name)
        : widget.track.name;

    final subtitle = isEpisode
        ? () {
            final s = widget.track.parentIndexNumber;
            final e = widget.track.indexNumber;
            final epName = widget.track.name;
            final episodeInfo = switch ((s, e)) {
              (final season?, final episode?) => 'S$season:E$episode',
              _ => null,
            };
            if (episodeInfo != null) {
              return '$episodeInfo - $epName';
            }
            return epName;
          }()
        : () {
            if (widget.isAudiobook) {
              return null;
            }
            final artistText = widget.track.artists.isNotEmpty
                ? widget.track.artists.join(', ')
                : widget.track.albumArtist ?? '';
            return artistText.isNotEmpty ? artistText : null;
          }();

    Widget? thumbnailWidget;
    if (widget.isPlaylist && widget.imageApi != null) {
      final imgId = widget.track.primaryImageItemId ?? widget.track.id;
      final logoTag = widget.track.logoImageTag;
      final thumbTag = widget.track.thumbImageTag;
      final backdropTags = widget.track.backdropImageTags;
      final primaryTag = widget.track.primaryImageTag;

      final String imageUrl;
      final BoxFit fit;
      if (thumbTag != null) {
        imageUrl = widget.imageApi!.getThumbImageUrl(
          imgId,
          tag: thumbTag,
          maxWidth: 120,
        );
        fit = BoxFit.cover;
      } else if (backdropTags.isNotEmpty) {
        imageUrl = widget.imageApi!.getBackdropImageUrl(
          imgId,
          tag: backdropTags.first,
          maxWidth: 120,
        );
        fit = BoxFit.cover;
      } else if (primaryTag != null) {
        imageUrl = widget.imageApi!.getPrimaryImageUrl(
          imgId,
          tag: primaryTag,
          maxHeight: 120,
        );
        fit = BoxFit.cover;
      } else if (logoTag != null) {
        imageUrl = widget.imageApi!.getLogoImageUrl(
          imgId,
          tag: logoTag,
          maxWidth: 120,
        );
        fit = BoxFit.contain;
      } else {
        imageUrl = '';
        fit = BoxFit.cover;
      }

      final alternateAccentColor = AppColorScheme.navColorCycle.length >= 2
          ? AppColorScheme.navColorCycle[1]
          : AppColorScheme.accent;

      thumbnailWidget = Container(
        width: 72,
        height: 40,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: alternateAccentColor,
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2.5),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            errorWidget: (context, url, error) => Container(
              color: Colors.white.withValues(alpha: 0.05),
              child: const Icon(
                Icons.movie_outlined,
                color: Colors.white24,
                size: 16,
              ),
            ),
          ),
        ),
      );
    }

    final activeColor = focusColor;
    final baseBackground = widget.index.isOdd
        ? Colors.white.withValues(alpha: 0.04)
        : Colors.transparent;
    final activeBackground = activeColor.withValues(alpha: 0.14);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (hasFocus) {
          setFocused(hasFocus);
          if (hasFocus) {
            _keepTrackVisible();
            widget.onFocused?.call();
          }
        },
        onKeyEvent: (_, event) => _handleTvKeys(event),
        child: GestureDetector(
          onTap: widget.onTap,
          onLongPress: widget.reorderable
              ? null
              : () => _showTrackActions(context),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: 56,
            decoration: BoxDecoration(
              color: showFocusBorder ? activeBackground : baseBackground,
              borderRadius: BorderRadius.circular(4),
              border: showFocusBorder
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: activeColor.withValues(alpha: 0.85),
                        width: ThemeRegistry.active.borders.focusBorder.width,
                      ),
                    )
                  : null,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      trackNumber.toString(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: showFocusBorder
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
                if (thumbnailWidget != null) thumbnailWidget,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: showFocusBorder
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: showFocusBorder
                                ? Colors.white.withValues(alpha: 0.82)
                                : Colors.white.withValues(alpha: 0.6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                () {
                  final releaseYear = widget.track.productionYear ??
                      (widget.track.premiereDate != null ? widget.track.premiereDate!.year : null);
                  final parts = [
                    if (releaseYear != null) '$releaseYear',
                    if (runtimeText != null) runtimeText,
                  ];
                  if (parts.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      parts.join('  •  '),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: showFocusBorder
                            ? Colors.white.withValues(alpha: 0.82)
                            : Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  );
                }(),
                if (PlatformDetection.isTV) ...[
                  if (widget.reorderable) ...[
                    IconButton(
                      onPressed: widget.currentIndex > 0
                          ? () {
                              widget.onMoveUp?.call(widget.currentIndex);
                              _keepTrackVisible();
                            }
                          : null,
                      icon: AdaptiveIcon(
                        Icons.arrow_back,
                        color: showFocusBorder ? Colors.white : Colors.white38,
                        size: 18,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.currentIndex < widget.totalCount - 1
                          ? () {
                              widget.onMoveDown?.call(widget.currentIndex);
                              _keepTrackVisible();
                            }
                          : null,
                      icon: AdaptiveIcon(
                        Icons.arrow_forward,
                        color: showFocusBorder ? Colors.white : Colors.white38,
                        size: 18,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                    ),
                  ],
                ] else ...[
                  if (widget.reorderable)
                    ReorderableDragStartListener(
                      index: widget.reorderIndex,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: AdaptiveIcon(
                          Icons.drag_indicator,
                          color: showFocusBorder
                              ? Colors.white70
                              : Colors.white38,
                          size: 18,
                        ),
                      ),
                    ),
                  IconButton(
                    onPressed: widget.onTap,
                    icon: AdaptiveIcon(
                      Icons.play_arrow,
                      color: showFocusBorder ? Colors.white : Colors.white54,
                      size: 22,
                    ),
                    splashRadius: 20,
                  ),
                  IconButton(
                    onPressed: () => _showTrackActions(context),
                    icon: AdaptiveIcon(
                      Icons.more_vert,
                      color: showFocusBorder ? Colors.white : Colors.white54,
                      size: 20,
                    ),
                    splashRadius: 20,
                  ),
                ],
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTrackActions(BuildContext context) {
    final manager = GetIt.instance<PlaybackManager>();
    TrackActionDialog.show(
      context,
      track: widget.track,
      onPlay: widget.onTap,
      onPlayNext: () => manager.queueService.insertNext(widget.track),
      onAddToQueue: () => manager.queueService.addToQueue(widget.track),
      onAddToPlaylist: () => AddToPlaylistDialog.show(
        context,
        itemIds: [widget.track.id],
        serverId: widget.track.serverId,
      ),
      onRemoveFromPlaylist: widget.onRemoveFromPlaylist != null
          ? () => widget.onRemoveFromPlaylist!(widget.track)
          : null,
      onMoveUp:
          widget.reorderable &&
              widget.onMoveUp != null &&
              widget.currentIndex > 0
          ? () => widget.onMoveUp!(widget.currentIndex)
          : null,
      onMoveDown:
          widget.reorderable &&
              widget.onMoveDown != null &&
              widget.currentIndex < widget.totalCount - 1
          ? () => widget.onMoveDown!(widget.currentIndex)
          : null,
      onToggleFavorite: () {
        GetIt.instance<ItemMutationRepository>().setFavorite(
          widget.track.id,
          isFavorite: !widget.track.isFavorite,
        );
      },
    );
  }
}

class _NavbarFocusPoint extends StatelessWidget {
  final FocusNode focusNode;

  const _NavbarFocusPoint({required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (focused) {
        if (!focused) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final scrollable = Scrollable.maybeOf(context);
          if (scrollable == null) return;
          final position = scrollable.position;
          if (position.pixels <= position.minScrollExtent) return;
          position.animateTo(
            position.minScrollExtent,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
          );
        });
      },
      onKeyEvent: (_, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          NavigationLayout.focusNavbarNotifier.value?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: const SizedBox(height: 1, width: double.infinity),
    );
  }
}

class _AdvancedPlaybackOption {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  _AdvancedPlaybackOption({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class _PersonDisplaySettingsDialog extends StatefulWidget {
  final UserPreferences prefs;

  const _PersonDisplaySettingsDialog({required this.prefs});

  @override
  State<_PersonDisplaySettingsDialog> createState() =>
      _PersonDisplaySettingsDialogState();
}

class _PersonDisplaySettingsDialogState
    extends State<_PersonDisplaySettingsDialog> {
  late String _sortOption;
  late bool _groupItems;
  DateTime? _lastTapTime;

  @override
  void initState() {
    super.initState();
    _sortOption = widget.prefs.get(UserPreferences.personPageSortOption);
    _groupItems = widget.prefs.get(UserPreferences.personPageGroupItems);
  }

  @override
  void didUpdateWidget(covariant _PersonDisplaySettingsDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sortOption = widget.prefs.get(UserPreferences.personPageSortOption);
    _groupItems = widget.prefs.get(UserPreferences.personPageGroupItems);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    final accent = AppColorScheme.accent;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final sectionColor = onSurface.withValues(alpha: 0.72);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(280.0, 380.0);

    return Dialog(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.92),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.displayOptions,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
              child: Text(
                l10n.sortBy,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sectionColor,
                ),
              ),
            ),
            _radioTile(
              label: l10n.settingsAlphabetical,
              selected: _sortOption == 'alphabetical',
              onTap: () => _updateSort('alphabetical'),
              accent: accent,
              onSurface: onSurface,
            ),
            _radioTile(
              label: l10n.releaseDateAscending,
              selected: _sortOption == 'releaseDateAsc',
              onTap: () => _updateSort('releaseDateAsc'),
              accent: accent,
              onSurface: onSurface,
            ),
            _radioTile(
              label: l10n.releaseDateDescending,
              selected: _sortOption == 'releaseDateDesc',
              onTap: () => _updateSort('releaseDateDesc'),
              accent: accent,
              onSurface: onSurface,
            ),
            Divider(color: dividerColor),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
              child: Text(
                l10n.groupContributions,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sectionColor,
                ),
              ),
            ),
            _checkboxTile(
              label: l10n.groupMultipleRoles,
              checked: _groupItems,
              onTap: () => _updateGroup(!_groupItems),
              accent: accent,
              onSurface: onSurface,
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldThrottleTap() {
    final now = DateTime.now();
    if (_lastTapTime != null &&
        now.difference(_lastTapTime!) < const Duration(milliseconds: 300)) {
      return true;
    }
    _lastTapTime = now;
    return false;
  }

  void _updateSort(String option) {
    if (_shouldThrottleTap()) return;
    setState(() {
      _sortOption = option;
    });
    widget.prefs.set(UserPreferences.personPageSortOption, option);
  }

  void _updateGroup(bool value) {
    if (_shouldThrottleTap()) return;
    setState(() {
      _groupItems = value;
    });
    widget.prefs.set(UserPreferences.personPageGroupItems, value);
  }

  Widget _radioTile({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    Color? accent,
    required Color onSurface,
  }) {
    final effectiveAccent = accent ?? AppColorScheme.accent;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: selected
                        ? effectiveAccent
                        : onSurface.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                color: selected ? effectiveAccent : Colors.transparent,
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: onSurface,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: selected
                      ? onSurface
                      : onSurface.withValues(alpha: 0.72),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkboxTile({
    required String label,
    required bool checked,
    required VoidCallback onTap,
    required Color accent,
    required Color onSurface,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: checked ? accent : onSurface.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                color: checked ? accent : Colors.transparent,
              ),
              child: checked
                  ? Center(
                      child: Text(
                        '✓',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: onSurface,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: checked
                      ? onSurface
                      : onSurface.withValues(alpha: 0.72),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef PersonDisplaySettingsDialog = _PersonDisplaySettingsDialog;

