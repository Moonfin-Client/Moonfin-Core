import 'dart:async';
import 'dart:ui';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    show HttpExceptionWithStatus;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/background_service.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_cache.dart';
import '../../../data/services/retro_artwork/retro_artwork_data_source.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';
import '../../../data/viewmodels/game_system_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/game_artwork_cache.dart';
import '../../../util/game_library.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../../util/tv_image_cache_stub.dart'
    if (dart.library.io) '../../../util/tv_image_cache_io.dart';
import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/game/game_alpha_picker_bar.dart';
import '../../widgets/game/game_poster_card.dart';
import '../../widgets/game/retro_artwork_image.dart';

import '../../widgets/local_search_field.dart';

/// Rows either side of the anchor named in the server priority hint. Wider
/// than the viewport so thumbnailing starts before a row is scrolled into it.
const int _priorityWindowRows = 4;

/// Concurrent legacy-protocol cache warms. Protocol 2 is bounded by
/// [RetroArtworkTransport.maxConcurrentTransfers] instead.
const int _legacyPrefetchWorkers = 4;

/// Browses one retro-game platform using the same vertical grid and alphabet
/// filtering interaction as Moonfin's regular media libraries.
class GameSystemScreen extends StatefulWidget {
  const GameSystemScreen({
    super.key,
    required this.libraryId,
    required this.systemId,
    this.systemName,
    @visibleForTesting this.debugArtworkDataSource,
    @visibleForTesting this.debugArtworkTransport,
    @visibleForTesting this.debugArtworkActivityGate,
  });

  final String libraryId;
  final String systemId;
  final String? systemName;

  /// Test-only seam. When supplied, [_initializeArtworkDataSource] wires
  /// these directly instead of resolving the real capability probe and
  /// factory chain, so widget tests can drive band admission with fully
  /// controllable fakes.
  @visibleForTesting
  final RetroArtworkDataSource? debugArtworkDataSource;
  @visibleForTesting
  final RetroArtworkTransport? debugArtworkTransport;
  @visibleForTesting
  final RetroArtworkActivityGate? debugArtworkActivityGate;

  @override
  State<GameSystemScreen> createState() => _GameSystemScreenState();
}

class _GameSystemScreenState extends State<GameSystemScreen>
    with GridFocusNodeMixin<GameSystemScreen>, RouteAware {
  static const _compactBreakpoint = 600.0;
  static const _compactHorizontalPadding = 16.0;
  static const _desktopHorizontalPadding = 60.0;
  static const _gridTopPadding = 8.0;
  static const _gridBottomFocusPeek = 52.0;
  // Backdrop art is a much heavier decode than a grid thumbnail; deliberately
  // its own constant, not shared with the grid settle delays above.
  static const _backdropSettleDelay = Duration(milliseconds: 700);

  final UserPreferences _prefs = GetIt.instance<UserPreferences>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final GlobalKey<CustomTVTextFieldState> _searchTvFieldKey = GlobalKey();
  late final Map<String, FocusNode> _alphaLetterFocusNodes = {
    for (final letter in GameAlphaPickerBar.letters)
      letter: FocusNode(
        debugLabel: 'game_alpha_${letter.isEmpty ? 'all' : letter}',
      ),
  };
  final ScrollController _gridScrollController = ScrollController();
  late final GameSystemBrowseViewModel _browse;
  RetroArtworkActivityGate? _retroArtworkActivityGate;
  RetroArtworkTransport? _retroArtworkTransport;
  RetroArtworkDataSource? _retroArtworkDataSource;
  _ArtworkGridLayout? _artworkGridLayout;
  // Only used to avoid re-sending an identical priority hint. Nothing about
  // what renders depends on these.
  List<GameSummary>? _artworkPlanGames;
  int? _artworkPlanAnchorRow;
  int _priorityGeneration = 0;
  late String _artworkScope;
  List<GameSummary>? _observedVisibleGames;
  Timer? _hoverScrollSettle;
  GameSummary? _hoveredGame;
  bool _suppressHoverEnrichment = false;
  Timer? _tvBackReplayGuardTimer;
  Timer? _backdropSettleTimer;
  // Only ever set by the settle timer below, never straight from the view
  // model's own (shorter) backdropGame.
  GameSummary? _settledBackdropGame;
  String? _pendingBackdropGameId;
  bool _ignoreNextTvPop = false;
  bool _allowTvPop = false;
  bool _routeIsCovered = false;
  bool _artworkRefreshQueued = false;
  ModalRoute<dynamic>? _observedRoute;

  @override
  void initState() {
    super.initState();
    _artworkScope = gameArtworkScope(widget.libraryId, widget.systemId);
    _activateArtworkScope();
    _browse = GameSystemBrowseViewModel(
      gamesApi: GetIt.instance<MediaServerClient>().gamesApi,
      libraryId: widget.libraryId,
      systemId: widget.systemId,
      systemName: widget.systemName,
    )..addListener(_onBrowseChanged);
    _searchController.addListener(_onSearchChanged);
    _searchFocus.addListener(_onSearchFocusChanged);
    unawaited(_loadGamesAndArtwork());
  }

  Future<void> _loadGamesAndArtwork() async {
    await _browse.load();
    if (!mounted || _browse.error != null) return;
    await _initializeArtworkDataSource();
    final dataSource = _retroArtworkDataSource;
    if (dataSource == null || !mounted) return;
    try {
      await dataSource.refreshSystem(
        libraryId: widget.libraryId,
        systemId: widget.systemId,
      );
    } catch (error) {
      debugPrint(
        '[GameSystemScreen] Failed to refresh artwork manifest: $error',
      );
    }
    if (mounted) {
      setState(() {});
      _scheduleArtworkPriority();
    }
  }

  Future<void> _initializeArtworkDataSource() async {
    if (_retroArtworkDataSource != null) return;
    final debugDataSource = widget.debugArtworkDataSource;
    if (debugDataSource != null) {
      debugDataSource.addSnapshotListener(_onArtworkSnapshotChanged);
      final gate = widget.debugArtworkActivityGate;
      if (gate != null) {
        _retroArtworkActivityGate = gate;
        gate.addListener(_onArtworkGateChanged);
      }
      _retroArtworkTransport = widget.debugArtworkTransport;
      _retroArtworkDataSource = debugDataSource;
      if (_routeIsCovered) debugDataSource.onRouteCovered();
      return;
    }
    if (!GetIt.instance.isRegistered<RetroArtworkByteCache>() ||
        !GetIt.instance.isRegistered<RetroArtworkActivityGate>()) {
      return;
    }
    final client = GetIt.instance<MediaServerClient>();
    final cache = await GetIt.instance.getAsync<RetroArtworkByteCache>();
    if (!mounted || _retroArtworkDataSource != null) return;
    final gate = GetIt.instance<RetroArtworkActivityGate>();
    final transport = RetroArtworkTransport.forServer(
      client: client,
      cache: cache,
      activityGate: gate,
    );
    final dataSource = await RetroArtworkDataSourceFactory.create(
      client: client,
      activityGate: gate,
      transport: transport,
    );
    if (!mounted) {
      dataSource?.dispose();
      transport.dispose();
      return;
    }
    dataSource?.addSnapshotListener(_onArtworkSnapshotChanged);
    _retroArtworkActivityGate = gate;
    gate.addListener(_onArtworkGateChanged);
    _retroArtworkTransport = transport;
    _retroArtworkDataSource = dataSource;
    if (_routeIsCovered) dataSource?.onRouteCovered();
  }

  void _onArtworkSnapshotChanged() {
    _scheduleArtworkRefresh(
      recenter:
          _retroArtworkDataSource?.protocol == RetroArtworkProtocol.manifest,
    );
  }

  /// Image loading and error builders may report an artwork outcome while the
  /// framework is building the grid. Repaint only after that frame completes.
  void _scheduleArtworkRefresh({required bool recenter}) {
    if (!mounted || _artworkRefreshQueued) return;
    _artworkRefreshQueued = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _artworkRefreshQueued = false;
      if (!mounted) return;
      setState(() {});
      if (recenter) _scheduleArtworkPriority(force: true);
    });
    // addPostFrameCallback only fires once a frame is already scheduled. If
    // artwork completes while the app is otherwise idle there isn't one, so
    // ask for it explicitly or the callback above queues forever.
    WidgetsBinding.instance.scheduleFrame();
  }

  void _onArtworkGateChanged() {
    final gate = _retroArtworkActivityGate;
    if (!mounted || gate == null) return;
    if (!gate.isOpen) {
      _clearArtworkPlan();
      return;
    }
    if (!_routeIsCovered) _scheduleArtworkPriority(force: true);
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
  void didPushNext() {
    super.didPushNext();
    _routeIsCovered = true;
    _clearArtworkPlan();
    _retroArtworkDataSource?.onRouteCovered();
    _retroArtworkTransport?.cancelAll();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _routeIsCovered = false;
    _retroArtworkDataSource?.onRouteReentered();
    _scheduleArtworkPriority(force: true);
  }

  // This route is keyed by "<libraryId>/<systemId>" (see app_router.dart), so
  // Flutter always mounts a fresh state when the system changes and this
  // branch is not expected to run in practice. It stays as a safety net in
  // case that keying ever changes.
  @override
  void didUpdateWidget(covariant GameSystemScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.libraryId != widget.libraryId ||
        oldWidget.systemId != widget.systemId) {
      releaseGameArtworkCacheScope(_artworkScope);
      _artworkScope = gameArtworkScope(widget.libraryId, widget.systemId);
      _activateArtworkScope();
    }
  }

  @override
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
    _browse.removeListener(_onBrowseChanged);
    _browse.dispose();
    _retroArtworkDataSource?.removeSnapshotListener(_onArtworkSnapshotChanged);
    _retroArtworkDataSource?.dispose();
    _retroArtworkTransport?.dispose();
    _retroArtworkActivityGate?.removeListener(_onArtworkGateChanged);
    _backdropSettleTimer?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _searchFocus.removeListener(_onSearchFocusChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    for (final node in _alphaLetterFocusNodes.values) {
      node.dispose();
    }
    _gridScrollController.dispose();
    _hoverScrollSettle?.cancel();
    _tvBackReplayGuardTimer?.cancel();
    releaseGameArtworkCacheScope(_artworkScope);
    unawaited(enforceGameArtworkCacheBudget(throttle: true));
    disposeGridFocusNodes();
    super.dispose();
  }

  void _onSearchChanged() {
    _browse.updateSearch(_searchController.text);
  }

  void _activateArtworkScope() {
    unawaited(_retainArtworkScope());
  }

  Future<void> _retainArtworkScope() async {
    await retainGameArtworkCacheScope(_artworkScope);
    // Once the new system is protected, inactive systems are eligible for
    // whole-scope LRU eviction if the combined game-art budget needs room.
    await enforceGameArtworkCacheBudget(throttle: true);
  }

  void _selectLetter(String letter) {
    if (letter == _browse.selectedLetter) return;

    // Reset the existing grid before replacing its contents. This keeps the
    // new filtered viewport at index zero, which is also the initial artwork
    // scheduler window. Focus remains on the alpha button that invoked this.
    if (_gridScrollController.hasClients) {
      _gridScrollController.jumpTo(
        _gridScrollController.position.minScrollExtent,
      );
    }
    _browse.selectLetter(letter);
  }

  void _onBrowseChanged() {
    if (!mounted) return;
    final visibleGames = _browse.visibleGames;
    if (!identical(_observedVisibleGames, visibleGames)) {
      _observedVisibleGames = visibleGames;
      _artworkGridLayout = null;
      _clearArtworkPlan();
      gridContentVersion++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) cleanupGridFocusNodes(visibleGames.length);
      });
    }
    _scheduleBackdropSettle();
    setState(() {});
  }

  /// Gates the entire backdrop pipeline (build, decode, blur) behind
  /// [_backdropSettleDelay], keyed off undebounced `activeGame` rather than
  /// the view model's own `backdropGame` (using both would stack two waits).
  void _scheduleBackdropSettle() {
    final target = _browse.activeGame;
    if (target == null) {
      // Hiding is immediate; only *starting* a new backdrop is delayed.
      _backdropSettleTimer?.cancel();
      _backdropSettleTimer = null;
      _pendingBackdropGameId = null;
      _settledBackdropGame = null;
      return;
    }
    // Comparing String ids (not null == null) below: a null target is
    // handled above, so reaching here always means a real candidate.
    if (target.id == _settledBackdropGame?.id ||
        target.id == _pendingBackdropGameId) {
      return;
    }
    _backdropSettleTimer?.cancel();
    _pendingBackdropGameId = target.id;
    _backdropSettleTimer = Timer(_backdropSettleDelay, () {
      _backdropSettleTimer = null;
      _pendingBackdropGameId = null;
      if (!mounted || _browse.activeGame?.id != target.id) return;
      setState(() => _settledBackdropGame = target);
    });
  }

  void _onSearchFocusChanged() {
    if (mounted) setState(() {});
  }

  KeyEventResult _onTvSearchKey(FocusNode node, KeyEvent event) {
    // Down returns to the alpha letter the user came up from, so it mirrors the
    // up gesture instead of dropping onto the geometric default below.
    if (event.isActionable && event.logicalKey.isDownKey) {
      if (_restoreAlphaFocus()) return KeyEventResult.handled;
    }
    if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
    if (event is KeyDownEvent) {
      if (!_searchFocus.hasFocus) _searchFocus.requestFocus();
      _searchTvFieldKey.currentState?.openKeyboard();
    }
    return KeyEventResult.handled;
  }

  bool get _gridHasFocus =>
      gridItemFocusNodes.values.any((node) => node.hasFocus);

  bool _restoreAlphaFocus() {
    // Return to the letter that is actually selected (the active filter), so
    // focus lands on the highlighted letter rather than the last one merely
    // arrowed past.
    final alphaFocus = _alphaLetterFocusNodes[_browse.selectedLetter];
    if (alphaFocus?.context == null) return false;
    alphaFocus!.requestFocus();
    return true;
  }

  void _guardAgainstTvBackReplay() {
    _ignoreNextTvPop = true;
    _tvBackReplayGuardTimer?.cancel();
    _tvBackReplayGuardTimer = Timer(const Duration(milliseconds: 300), () {
      _ignoreNextTvPop = false;
    });
  }

  void _handleTvPop(bool didPop) {
    if (didPop) return;
    if (_ignoreNextTvPop) {
      _ignoreNextTvPop = false;
      _tvBackReplayGuardTimer?.cancel();
      return;
    }
    if (_gridHasFocus && _restoreAlphaFocus()) return;
    if (_allowTvPop) return;

    setState(() => _allowTvPop = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.popOrHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final compact =
        PlatformDetection.useMobileUi ||
        MediaQuery.sizeOf(context).width < _compactBreakpoint;
    final desktopScale = _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final horizontalPadding = compact
        ? _compactHorizontalPadding
        : _desktopHorizontalPadding * desktopScale;
    final screenSize = MediaQuery.sizeOf(context);
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final showBackdrop = !compact && !hideBackdrops;
    final showDetails =
        !compact &&
        screenSize.height >= 480 * textScale.clamp(1, 2) &&
        _prefs.get(UserPreferences.showMediaDetailsOnLibraryPage);
    final backdropGame = showBackdrop ? _settledBackdropGame : null;
    final hasBackdrop = backdropGame != null;
    final scaffold = Scaffold(
      backgroundColor: AppColorScheme.background,
      body: Stack(
        children: [
          if (backdropGame != null && !_routeIsCovered)
            Positioned.fill(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _GameBrowseBackdrop(
                  key: ValueKey(backdropGame.id),
                  game: backdropGame,
                  artworkScope: _artworkScope,
                  artworkDataSource: _retroArtworkDataSource,
                  retroArtworkTransport: _retroArtworkTransport,
                  retroArtworkActivityGate: _retroArtworkActivityGate,
                  blur: _prefs
                      .get(UserPreferences.browsingBackgroundBlurAmount)
                      .toDouble(),
                ),
              ),
            ),
          Positioned.fill(
            child: ColoredBox(
              color: AppColorScheme.background.withValues(
                alpha: hasBackdrop ? 0.54 : 0.86,
              ),
            ),
          ),
          _buildBody(
            compact,
            desktopScale: desktopScale,
            horizontalPadding: horizontalPadding,
            showDetails: showDetails,
            showBackdrop: showBackdrop,
          ),
        ],
      ),
    );
    if (PlatformDetection.useMobileUi) return scaffold;
    final targetNode = PlatformDetection.isTV && _browse.visibleGames.isNotEmpty
        ? getGridItemFocusNode(0, prefix: 'game_grid')
        : _alphaLetterFocusNodes['']!;
    final content = RequestInitialFocus(
      targetNode: targetNode,
      child: scaffold,
    );
    return PopScope(
      canPop: !PlatformDetection.isTV || _allowTvPop,
      onPopInvokedWithResult: (didPop, _) => _handleTvPop(didPop),
      child: content,
    );
  }

  Widget _buildBody(
    bool compact, {
    required double desktopScale,
    required double horizontalPadding,
    required bool showDetails,
    required bool showBackdrop,
  }) {
    if (_browse.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_browse.error != null) {
      final l10n = AppLocalizations.of(context);
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.failedToLoadLibrary, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: _browse.load, child: Text(l10n.retry)),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        _buildHeader(
          compact,
          desktopScale: desktopScale,
          horizontalPadding: horizontalPadding,
          showDetails: showDetails,
        ),
        Expanded(
          child: _browse.visibleGames.isEmpty
              ? Center(child: Text(AppLocalizations.of(context).noItemsFound))
              : _buildGrid(
                  _browse.visibleGames,
                  desktopScale: desktopScale,
                  horizontalPadding: horizontalPadding,
                  showDetails: showDetails,
                  showBackdrop: showBackdrop,
                ),
        ),
      ],
    );
  }

  Widget _buildHeader(
    bool compact, {
    required double desktopScale,
    required double horizontalPadding,
    required bool showDetails,
  }) {
    final systemName = _browse.displaySystemName;
    final topPadding = compact ? MediaQuery.paddingOf(context).top + 8 : 8.0;
    final availableWidth =
        MediaQuery.sizeOf(context).width - horizontalPadding * 2;
    final inlineSearch = !compact && availableWidth >= 700 * desktopScale;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (inlineSearch)
            _buildInlineTitleAndSearch(systemName, desktopScale)
          else ...[
            Center(child: _buildSystemTitle(systemName, desktopScale)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: _buildSearchField(),
              ),
            ),
          ],
          if (showDetails) ...[
            const SizedBox(height: 2),
            _FocusedGameHud(
              desktopScale: desktopScale,
              game: _browse.hudGame,
              detail: _browse.hudGame == null
                  ? null
                  : _browse.gameDetails[_browse.hudGame!.id],
              displayTitle: _browse.hudGame == null
                  ? null
                  : _browse.displayTitles[_browse.hudGame!.id],
            ),
          ],
          SizedBox(height: showDetails ? 2 : 8),
          Row(
            children: [
              FocusableToolbarButton(
                icon: Icons.arrow_back,
                tooltip: AppLocalizations.of(context).back,
                size: 30 * desktopScale,
                iconSize: 20 * desktopScale,
                unfocusedIconAlpha: 128,
                onTap: () => context.popOrHome(),
              ),
              SizedBox(width: 10 * desktopScale),
              Expanded(
                child: GameAlphaPickerBar(
                  selected: _browse.selectedLetter,
                  letterFocusNodes: _alphaLetterFocusNodes,
                  onNavigateUp: () => _searchFocus.requestFocus(),
                  onChanged: _selectLetter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInlineTitleAndSearch(String systemName, double desktopScale) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desiredSearchWidth = 400 * desktopScale;
        final maxSearchWidth = (constraints.maxWidth - 220 * desktopScale) / 2;
        final searchWidth = desiredSearchWidth < maxSearchWidth
            ? desiredSearchWidth
            : maxSearchWidth;
        return Row(
          children: [
            SizedBox(width: searchWidth),
            Expanded(
              child: Center(child: _buildSystemTitle(systemName, desktopScale)),
            ),
            SizedBox(width: searchWidth, child: _buildSearchField()),
          ],
        );
      },
    );
  }

  Widget _buildSystemTitle(String systemName, double desktopScale) {
    return Text(
      systemName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColorScheme.onSurface,
        fontSize: 26 * desktopScale,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildSearchField() {
    return LocalSearchField(
      controller: _searchController,
      focusNode: _searchFocus,
      tvFieldKey: _searchTvFieldKey,
      onTvKeyEvent: _onTvSearchKey,
    );
  }

  void _scrollToGridRow({
    required int index,
    required int crossAxisCount,
    required double cellHeight,
    required double mainAxisSpacing,
  }) {
    if (!_gridScrollController.hasClients) return;
    final row = index ~/ crossAxisCount;
    final rowTop = _gridTopPadding + row * (cellHeight + mainAxisSpacing);
    final rowBottom = rowTop + cellHeight;
    final position = _gridScrollController.position;
    final current = position.pixels;
    final viewportHeight = position.viewportDimension;
    var target = current;
    if (rowTop - _gridTopPadding < current) {
      target = rowTop - _gridTopPadding;
    } else if (rowBottom + _gridBottomFocusPeek > current + viewportHeight) {
      target = rowBottom + _gridBottomFocusPeek - viewportHeight;
    }
    target = target.clamp(position.minScrollExtent, position.maxScrollExtent);
    if ((target - current).abs() < 1) return;
    unawaited(
      _gridScrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _activateHoveredGame(
    GameSummary game, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    _hoveredGame = game;
    if (_suppressHoverEnrichment) return;
    _activateBrowseGame(
      game,
      showBackdrop: showBackdrop,
      showDetails: showDetails,
    );
  }

  void _activateBrowseGame(
    GameSummary game, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    _browse.activateGame(
      game,
      showBackdrop: showBackdrop,
      loadDetails: showDetails,
    );
  }

  void _deactivateHoveredGame(GameSummary game) {
    if (_hoveredGame?.id == game.id) _hoveredGame = null;
    _browse.deactivateGame(game);
  }

  void _onGridPointerSignal(
    PointerSignalEvent event, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    if (event is! PointerScrollEvent) return;

    // A stationary pointer crosses many cards while the wheel moves the grid.
    // Do not let those transient hover targets compete with poster requests by
    // fetching their backdrop and details. Once wheel input stops, reactivate
    // the card still under the pointer; the view model then applies its normal
    // detail and backdrop debounce tiers.
    _suppressHoverEnrichment = true;
    _hoverScrollSettle?.cancel();
    final hovered = _hoveredGame;
    if (hovered != null) _browse.deactivateGame(hovered);

    _hoverScrollSettle = Timer(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _suppressHoverEnrichment = false;
      final settledGame = _hoveredGame;
      if (settledGame == null) return;
      _activateBrowseGame(
        settledGame,
        showBackdrop: showBackdrop,
        showDetails: showDetails,
      );
    });
  }

  /// Tells the server which games to thumbnail first, and pre-warms the cache
  /// on the legacy protocol.
  ///
  /// This is advisory. Nothing gates rendering on it, so a hint that is stale,
  /// superseded, or never sent costs ordering and never artwork: each card
  /// requests its own image when the grid builds it and cancels when the grid
  /// disposes it, which is also what bounds a fast scroll.
  void _scheduleArtworkPriority({
    ScrollMetrics? metrics,
    int? focusedIndex,
    bool force = false,
  }) {
    final layout = _artworkGridLayout;
    final dataSource = _retroArtworkDataSource;
    // A null data source here is the ordinary case for the first frames after
    // the screen opens: initialization is async, and the hint follows as soon
    // as it lands.
    if (!mounted || layout == null || dataSource == null) return;
    final currentMetrics =
        metrics ??
        (_gridScrollController.hasClients
            ? _gridScrollController.position
            : null);
    final viewportCenter = _viewportCenteredIndex(layout, currentMetrics);
    final anchorIndex =
        (focusedIndex ??
                (_gridHasFocus ? lastFocusedGridIndex : null) ??
                viewportCenter)
            .clamp(0, layout.games.length - 1)
            .toInt();
    final anchorRow = anchorIndex ~/ layout.crossAxisCount;
    if (!force &&
        identical(_artworkPlanGames, layout.games) &&
        _artworkPlanAnchorRow == anchorRow) {
      return;
    }
    _artworkPlanGames = layout.games;
    _artworkPlanAnchorRow = anchorRow;

    final reach = layout.crossAxisCount * _priorityWindowRows;
    final start = (anchorIndex - reach).clamp(0, layout.games.length).toInt();
    final end = (anchorIndex + reach).clamp(0, layout.games.length).toInt();
    final gameIds = <String>[
      layout.games[anchorIndex].id,
      for (var index = start; index < end; index++)
        if (index != anchorIndex) layout.games[index].id,
    ];
    if (gameIds.isEmpty) return;
    // The generation only supersedes queued hints, never a transfer.
    unawaited(
      dataSource.submitActiveBandPriority(
        gameIds,
        planGeneration: ++_priorityGeneration,
      ),
    );
    if (dataSource.protocol == RetroArtworkProtocol.legacy) {
      unawaited(_prefetchLegacyArtwork(dataSource, gameIds));
    }
  }

  void _clearArtworkPlan() {
    _artworkPlanGames = null;
    _artworkPlanAnchorRow = null;
  }

  int _viewportCenteredIndex(
    _ArtworkGridLayout layout,
    ScrollMetrics? metrics,
  ) {
    final offset = metrics == null
        ? 0.0
        : metrics.pixels + metrics.viewportDimension / 2;
    final row = (offset / layout.rowStride)
        .floor()
        .clamp(0, (layout.games.length - 1) ~/ layout.crossAxisCount)
        .toInt();
    return (row * layout.crossAxisCount + layout.crossAxisCount ~/ 2)
        .clamp(0, layout.games.length - 1)
        .toInt();
  }

  /// Pre-warms the legacy cache manager and records each outcome so missing
  /// art stays known. Protocol 2 needs no equivalent: its cards drive their own
  /// transfers through [RetroArtworkImage].
  Future<void> _prefetchLegacyArtwork(
    RetroArtworkDataSource dataSource,
    List<String> gameIds,
  ) async {
    final pending = <(String, String)>[
      for (final gameId in gameIds)
        if (dataSource.imageFor(gameId)?.legacyUrl case final url?)
          (gameId, url),
    ];
    if (pending.isEmpty) return;
    // Abandons the walk when a newer hint replaces this one. Safe because this
    // only fills a cache -- the cards read through it either way.
    final generation = _priorityGeneration;
    var next = 0;

    Future<void> worker() async {
      while (mounted &&
          generation == _priorityGeneration &&
          next < pending.length) {
        final (gameId, url) = pending[next++];
        try {
          await gameArtworkCacheManagerForScope(
            _artworkScope,
          ).getSingleFile(url);
          dataSource.reportImageLoaded(gameId);
        } catch (error) {
          dataSource.reportImageFailure(
            gameId,
            statusCode: _statusCodeFromArtworkError(error),
          );
        }
      }
    }

    final workerCount = pending.length < _legacyPrefetchWorkers
        ? pending.length
        : _legacyPrefetchWorkers;
    await Future.wait(<Future<void>>[
      for (var index = 0; index < workerCount; index++) worker(),
    ]);
  }

  int? _statusCodeFromArtworkError(Object error) {
    if (error is DioException) return error.response?.statusCode;
    if (error is HttpExceptionWithStatus) return error.statusCode;
    return null;
  }

  Widget _buildGrid(
    List<GameSummary> games, {
    required double desktopScale,
    required double horizontalPadding,
    required bool showDetails,
    required bool showBackdrop,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        const imageHeightRatio = 1.34;
        const captionGap = 6.0;
        const captionHeight = 42.0;

        final availableWidth = constraints.maxWidth - horizontalPadding * 2;
        final preferredCardWidth =
            _prefs.resolveLibraryPosterSize().portraitHeight *
            (2 / 3) *
            desktopScale;
        final columnCount =
            ((availableWidth + spacing) / (preferredCardWidth + spacing))
                .floor()
                .clamp(2, 20);
        final cardWidth =
            (availableWidth - spacing * (columnCount - 1)) / columnCount;
        final textScale = MediaQuery.textScalerOf(context).scale(1.0);
        final isRtl = Directionality.of(context) == TextDirection.rtl;
        final cardHeight =
            cardWidth * imageHeightRatio +
            captionGap +
            captionHeight * textScale;
        final childAspectRatio = cardWidth / cardHeight;
        final rowStride = cardHeight + 14;
        final layout = _ArtworkGridLayout(
          games: games,
          crossAxisCount: columnCount,
          rowStride: rowStride,
        );
        if (_artworkGridLayout != layout) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || !identical(games, _browse.visibleGames)) return;
            _artworkGridLayout = layout;
            _scheduleArtworkPriority();
          });
        }
        final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
        final focusColor = isNeon
            ? ThemeRegistry.active.borders.focusBorder.color
            : Color(_prefs.get(UserPreferences.focusColor).colorValue);
        final cardFocusExpansion = _prefs.get(
          UserPreferences.cardFocusExpansion,
        );
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              _scheduleArtworkPriority(metrics: notification.metrics);
            } else if (notification is ScrollEndNotification) {
              _scheduleArtworkPriority(metrics: notification.metrics);
            }
            return false;
          },
          child: Listener(
            onPointerSignal: (event) => _onGridPointerSignal(
              event,
              showBackdrop: showBackdrop,
              showDetails: showDetails,
            ),
            child: GridView.builder(
              controller: _gridScrollController,
              // Keep one viewport above and below the visible rows constructed
              // on every platform. This restores smooth reverse scrolling and
              // lets the focused row begin its own image request immediately.
              scrollCacheExtent: const ScrollCacheExtent.viewport(1),
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                _gridTopPadding,
                horizontalPadding,
                32,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount,
                mainAxisSpacing: 14,
                crossAxisSpacing: spacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                final reference = _routeIsCovered
                    ? null
                    : _retroArtworkDataSource?.imageFor(game.id);
                final source = reference?.source;
                final column = index % columnCount;
                final atVisualRightEdge = isRtl
                    ? column == 0
                    : column == columnCount - 1 || index == games.length - 1;
                return GamePosterCard(
                  imageUrl: reference?.legacyUrl,
                  artwork:
                      source == null ||
                          _retroArtworkTransport == null ||
                          _retroArtworkActivityGate == null
                      ? null
                      : RetroArtworkImage(
                          source: source,
                          transport: _retroArtworkTransport!,
                          activityGate: _retroArtworkActivityGate!,
                          // Same rule every other bounded image in the app
                          // uses: decode to the pixels actually painted. A
                          // constant here decoded a grid tile at the source
                          // thumbnail's full width on every device, which is
                          // several times the tile's real size on a dense
                          // display and wasted the image cache budget
                          // accordingly.
                          maxDecodeWidth: BoundedNetworkImage.cacheWidthFor(
                            cardWidth,
                            MediaQuery.devicePixelRatioOf(context),
                          ),
                          fit: BoxFit.cover,
                          onLoadFinished: () => _retroArtworkDataSource
                              ?.reportImageLoaded(game.id),
                          errorBuilder: (_, error) {
                            _retroArtworkDataSource?.reportImageFailure(
                              game.id,
                              statusCode: _statusCodeFromArtworkError(error),
                            );
                            return const SizedBox.shrink();
                          },
                        ),
                  title: game.title,
                  fileName: game.fileName,
                  seed: game.id,
                  cacheManager: gameArtworkCacheManagerForScope(_artworkScope),
                  width: cardWidth,
                  focusNode: getGridItemFocusNode(index, prefix: 'game_grid'),
                  focusColor: focusColor,
                  cardFocusExpansion: cardFocusExpansion,
                  suppressFocusGlow: isNeon,
                  autoScroll: false,
                  onFocus: () {
                    _activateBrowseGame(
                      game,
                      showBackdrop: showBackdrop,
                      showDetails: showDetails,
                    );
                    _scheduleArtworkPriority(focusedIndex: index);
                    _scrollToGridRow(
                      index: index,
                      crossAxisCount: columnCount,
                      cellHeight: cardHeight,
                      mainAxisSpacing: 14,
                    );
                  },
                  onFocusLost: () => _browse.deactivateGame(game),
                  onHoverStart: () => _activateHoveredGame(
                    game,
                    showBackdrop: showBackdrop,
                    showDetails: showDetails,
                  ),
                  onHoverEnd: () => _deactivateHoveredGame(game),
                  stopRightTraversal: atVisualRightEdge,
                  loadArtwork: true,
                  onArtworkLoadFinished: () =>
                      _retroArtworkDataSource?.reportImageLoaded(game.id),
                  onArtworkError: (error) {
                    _retroArtworkDataSource?.reportImageFailure(
                      game.id,
                      statusCode: _statusCodeFromArtworkError(error),
                    );
                  },
                  onKeyEvent: (_, event) {
                    if (PlatformDetection.isTV &&
                        event.isActionable &&
                        event.logicalKey.isBackKey &&
                        _restoreAlphaFocus()) {
                      if (event is KeyDownEvent) {
                        _guardAgainstTvBackReplay();
                      }
                      return KeyEventResult.handled;
                    }
                    // Right-edge traversal is stopped by [stopRightTraversal]
                    // above (TV only), which the card honors in its own key
                    // handler.
                    return KeyEventResult.ignored;
                  },
                  onTap: () => context.push(
                    Destinations.gameDetailOf(widget.libraryId, game.id),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _ArtworkGridLayout {
  const _ArtworkGridLayout({
    required this.games,
    required this.crossAxisCount,
    required this.rowStride,
  });

  final List<GameSummary> games;
  final int crossAxisCount;
  final double rowStride;

  @override
  bool operator ==(Object other) =>
      other is _ArtworkGridLayout &&
      identical(other.games, games) &&
      other.crossAxisCount == crossAxisCount &&
      other.rowStride == rowStride;

  @override
  int get hashCode => Object.hash(games, crossAxisCount, rowStride);
}

class _FocusedGameHud extends StatelessWidget {
  const _FocusedGameHud({
    required this.desktopScale,
    required this.game,
    required this.detail,
    required this.displayTitle,
  });

  final double desktopScale;
  final GameSummary? game;
  final GameDetail? detail;
  final String? displayTitle;

  @override
  Widget build(BuildContext context) {
    final activeGame = game;
    final textScale = MediaQuery.textScalerOf(
      context,
    ).scale(1).clamp(1.0, 2.0).toDouble();
    final responsiveScale = desktopScale > textScale ? desktopScale : textScale;
    return SizedBox(
      // Match the regular library HUD's reserved-height approach so changing
      // focus content never relays out the alphabet bar or game grid.
      height: 105 * responsiveScale,
      child: ClipRect(
        child: activeGame == null
            ? const SizedBox.shrink()
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Column(
                  key: ValueKey(activeGame.id),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTitle ??
                          gameDisplayTitle(
                            activeGame.title,
                            activeGame.fileName,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    _GameMetadataRow(detail: detail),
                    if (detail?.overview?.trim() case final overview?
                        when overview.isNotEmpty) ...[
                      const SizedBox(height: 5),
                      Text(
                        overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withAlpha(166),
                          fontSize: 13,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
      ),
    );
  }
}

class _GameMetadataRow extends StatelessWidget {
  const _GameMetadataRow({required this.detail});

  final GameDetail? detail;

  @override
  Widget build(BuildContext context) {
    final game = detail;
    if (game == null) return const SizedBox.shrink();

    final values = <Widget>[
      if (game.year != null) _metadataText('${game.year}'),
      if (game.genre?.trim() case final genre? when genre.isNotEmpty)
        _metadataText(genre),
      if (game.region?.trim() case final region? when region.isNotEmpty)
        _metadataText(region),
      if (game.players != null)
        _iconMetadata(Icons.group_outlined, '${game.players}'),
      if (game.rating != null)
        _iconMetadata(Icons.star, game.rating!.toStringAsFixed(1)),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: values,
    );
  }

  Widget _metadataText(String value) {
    return Text(
      value,
      style: TextStyle(
        color: AppColorScheme.onSurface.withAlpha(179),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _iconMetadata(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColorScheme.onSurface.withAlpha(179)),
        const SizedBox(width: 3),
        _metadataText(value),
      ],
    );
  }
}

class _GameBrowseBackdrop extends StatelessWidget {
  const _GameBrowseBackdrop({
    super.key,
    required this.game,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.blur,
  });

  final GameSummary game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final fallback = gameFallbackColor(game.id);
    const roles = <String>['snap', 'title', 'boxart'];

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                fallback,
                Color.lerp(fallback, AppColorScheme.background, 0.7)!,
              ],
            ),
          ),
        ),
        _GameBrowseBackdropImage(
          roles: roles,
          gameId: game.id,
          artworkScope: artworkScope,
          artworkDataSource: artworkDataSource,
          retroArtworkTransport: retroArtworkTransport,
          retroArtworkActivityGate: retroArtworkActivityGate,
          blur: blur,
        ),
      ],
    );
  }
}

class _GameBrowseBackdropImage extends StatelessWidget {
  const _GameBrowseBackdropImage({
    required this.roles,
    required this.gameId,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.blur,
    this.index = 0,
  });

  final List<String> roles;
  final String gameId;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final double blur;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index >= roles.length) return const SizedBox.shrink();
    final role = roles[index];
    final reference = artworkDataSource?.imageFor(gameId, role: role);
    if (reference == null) return _next();

    final source = reference.source;
    final transport = retroArtworkTransport;
    final gate = retroArtworkActivityGate;

    // Always sits behind a translucent scrim (often a blur too), so it is
    // decoded at half upstream's backdrop budget: indistinguishable once
    // dimmed, for a quarter the decode cost. Derived from upstream's constants
    // rather than written out, so this tracks any change to them. Note the
    // blurred case halves the *unblurred* budget, not upstream's already
    // reduced blurred one, which would be softer than this layer wants.
    Widget image;
    if (source != null && transport != null && gate != null) {
      image = RetroArtworkImage(
        source: source,
        transport: transport,
        activityGate: gate,
        maxDecodeWidth: blur > 0
            ? BackgroundService.backdropMaxWidth ~/ 4
            : BackgroundService.backdropMaxWidth ~/ 2,
        fit: BoxFit.cover,
        onLoadFinished: () =>
            artworkDataSource?.reportImageLoaded(gameId, role: role),
        errorBuilder: (_, error) {
          artworkDataSource?.reportImageFailure(
            gameId,
            role: role,
            statusCode: _gameArtworkStatusCode(error),
          );
          return _next();
        },
      );
    } else if (reference.legacyUrl case final url?) {
      image = BoundedNetworkImage(
        imageUrl: url,
        cacheManager: gameArtworkCacheManagerForScope(artworkScope),
        fit: BoxFit.cover,
        maxWidth: blur > 0 ? 480 : 960,
        scale: blur > 0 ? 0.6 : 1,
        fadeInDuration: const Duration(milliseconds: 200),
        onLoadFinished: () =>
            artworkDataSource?.reportImageLoaded(gameId, role: role),
        errorBuilder: (_, _, error) {
          artworkDataSource?.reportImageFailure(
            gameId,
            role: role,
            statusCode: _gameArtworkStatusCode(error),
          );
          return _next();
        },
      );
    } else {
      return _next();
    }
    if (blur <= 0) return image;

    final sigma = GlassSettings.decorativeSigma(blur);
    image = RepaintBoundary(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: TileMode.decal,
        ),
        child: image,
      ),
    );
    return image;
  }

  Widget _next() => _GameBrowseBackdropImage(
    roles: roles,
    gameId: gameId,
    artworkScope: artworkScope,
    artworkDataSource: artworkDataSource,
    retroArtworkTransport: retroArtworkTransport,
    retroArtworkActivityGate: retroArtworkActivityGate,
    blur: blur,
    index: index + 1,
  );
}

int? _gameArtworkStatusCode(Object error) {
  if (error is DioException) return error.response?.statusCode;
  if (error is HttpExceptionWithStatus) return error.statusCode;
  return null;
}
