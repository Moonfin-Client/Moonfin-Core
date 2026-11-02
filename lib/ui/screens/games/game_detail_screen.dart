import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    show HttpExceptionWithStatus;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart' show GlassSettings;
import 'package:server_core/server_core.dart';

import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/adaptive/adaptive_glass.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/focus/focusable_button.dart';
import '../../widgets/game/game_poster_rail.dart';
import '../../widgets/game/retro_artwork_image.dart';
import '../../widgets/game/retro_artwork_shape.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_cache.dart';
import '../../../data/services/retro_artwork/retro_artwork_data_source.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';
import '../../../util/game_artwork_cache.dart';
import '../../../util/game_core_licenses.dart';
import '../../../util/game_cores.dart';
import '../../../util/game_library.dart';
import '../../../util/platform_detection.dart';
import '../../../util/tv_image_cache_stub.dart'
    if (dart.library.io) '../../../util/tv_image_cache_io.dart';

/// Responsive game detail screen led by the in-game snapshot, with the box art, title,
/// one primary Play or Continue action, the player that will run it, and the metadata the
/// games API exposes. Portrait on mobile, landscape on desktop/TV, with d-pad focus in
/// leanback mode.
class GameDetailScreen extends StatefulWidget {
  const GameDetailScreen({
    super.key,
    required this.libraryId,
    required this.gameId,
    @visibleForTesting this.debugArtworkDataSource,
    @visibleForTesting this.debugArtworkTransport,
    @visibleForTesting this.debugArtworkActivityGate,
  });

  final String libraryId;
  final String gameId;

  /// Test-only seam. When supplied, [_initializeArtworkDataSource] wires
  /// these directly instead of resolving the real capability probe and
  /// factory chain, so widget tests can drive artwork updates with fully
  /// controllable fakes.
  @visibleForTesting
  final RetroArtworkDataSource? debugArtworkDataSource;
  @visibleForTesting
  final RetroArtworkTransport? debugArtworkTransport;
  @visibleForTesting
  final RetroArtworkActivityGate? debugArtworkActivityGate;

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

enum _SaveReadiness { checking, absent, available, failed }

class _GameDetailScreenState extends State<GameDetailScreen> with RouteAware {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final FocusNode _primaryActionFocusNode = FocusNode(
    debugLabel: 'gameDetailPrimaryAction',
  );

  bool _loading = true;
  String? _error;
  GameDetail? _game;
  _SaveReadiness _saveReadiness = _SaveReadiness.checking;
  int _saveCheckGeneration = 0;
  bool _hardwareRenderingEnabled = true;
  List<GameSummary> _related = const [];
  String? _artworkScope;
  RetroArtworkActivityGate? _retroArtworkActivityGate;
  RetroArtworkTransport? _retroArtworkTransport;
  RetroArtworkDataSource? _retroArtworkDataSource;
  ModalRoute<dynamic>? _observedRoute;
  bool _routeIsCovered = false;
  bool _artworkRefreshQueued = false;

  /// Number of in-flight `showDialog` calls from this screen. Dialogs push a
  /// route too, which fires [didPushNext] the same as navigating away to the
  /// gameplay screen — without this guard, opening "Choose player" wipes the
  /// backdrop artwork even though the screen is still fully visible under it.
  int _ownDialogDepth = 0;

  @override
  void initState() {
    super.initState();
    if (GetIt.instance.isRegistered<UserPreferences>()) {
      _hardwareRenderingEnabled = GetIt.instance<UserPreferences>().get(
        UserPreferences.useHardwareRendering,
      );
    }
    _load();
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
    if (_ownDialogDepth > 0) return;
    _routeIsCovered = true;
    // This screen stays mounted under gameplay, so dispose does not run.
    // The root observer owns the shared activity gate; this page only cancels
    // work created by its own transport.
    _retroArtworkDataSource?.onRouteCovered();
    _retroArtworkTransport?.cancelAll();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _routeIsCovered = false;
    _retroArtworkDataSource?.onRouteReentered();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
    _retroArtworkDataSource?.removeSnapshotListener(_onArtworkChanged);
    _retroArtworkDataSource?.dispose();
    _retroArtworkTransport?.dispose();
    if (_artworkScope case final scope?) {
      releaseGameArtworkCacheScope(scope);
    }
    _primaryActionFocusNode.dispose();
    super.dispose();
  }

  void _onArtworkChanged() {
    if (!mounted || _artworkRefreshQueued) return;
    _artworkRefreshQueued = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _artworkRefreshQueued = false;
      if (mounted) setState(() {});
    });
    // addPostFrameCallback only fires once a frame is already scheduled. If
    // artwork completes while the app is otherwise idle there isn't one, so
    // ask for it explicitly or the callback above queues forever.
    WidgetsBinding.instance.scheduleFrame();
  }

  Future<void> _initializeArtworkDataSource(GameDetail game) async {
    final games = _client.gamesApi;
    if (games == null || _retroArtworkDataSource != null) return;

    final debugDataSource = widget.debugArtworkDataSource;
    if (debugDataSource != null) {
      debugDataSource.addSnapshotListener(_onArtworkChanged);
      _retroArtworkActivityGate = widget.debugArtworkActivityGate;
      _retroArtworkTransport = widget.debugArtworkTransport;
      _retroArtworkDataSource = debugDataSource;
      if (_routeIsCovered) debugDataSource.onRouteCovered();
      await debugDataSource.refreshSystem(
        libraryId: widget.libraryId,
        systemId: game.system,
      );
      if (mounted) setState(() {});
      return;
    }

    // Tests and minimal app embeddings may not register the protocol-2
    // transport foundations. The legacy adapter still preserves established
    // Thumb URLs and screen-lifetime missing suppression in that case.
    if (!GetIt.instance.isRegistered<RetroArtworkByteCache>() ||
        !GetIt.instance.isRegistered<RetroArtworkActivityGate>()) {
      final dataSource = LegacyArtworkAdapter(gamesApi: games);
      dataSource.addSnapshotListener(_onArtworkChanged);
      _retroArtworkDataSource = dataSource;
      if (_routeIsCovered) dataSource.onRouteCovered();
      await dataSource.refreshSystem(
        libraryId: widget.libraryId,
        systemId: game.system,
      );
      if (mounted) setState(() {});
      return;
    }

    final cache = await GetIt.instance.getAsync<RetroArtworkByteCache>();
    if (!mounted || _retroArtworkDataSource != null) return;
    final gate = GetIt.instance<RetroArtworkActivityGate>();
    final transport = RetroArtworkTransport.forServer(
      client: _client,
      cache: cache,
      activityGate: gate,
    );
    final dataSource = await RetroArtworkDataSourceFactory.create(
      client: _client,
      activityGate: gate,
      transport: transport,
    );
    if (!mounted) {
      dataSource?.dispose();
      transport.dispose();
      return;
    }
    if (dataSource == null) {
      transport.dispose();
      return;
    }
    dataSource.addSnapshotListener(_onArtworkChanged);
    _retroArtworkActivityGate = gate;
    _retroArtworkTransport = transport;
    _retroArtworkDataSource = dataSource;
    if (_routeIsCovered) dataSource.onRouteCovered();
    try {
      // Detail owns exactly the current game's system snapshot. It never
      // expands this request to the library or related-game systems.
      await dataSource.refreshSystem(
        libraryId: widget.libraryId,
        systemId: game.system,
      );
    } catch (_) {
      // Existing detail metadata remains usable when a manifest refresh fails.
    } finally {
      if (mounted) setState(() {});
    }
  }

  KeyEventResult _handleAppBarKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _primaryActionFocusNode.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Future<void> _load() async {
    final games = _client.gamesApi;
    if (games == null) {
      setState(() {
        _loading = false;
        _error = 'This server does not support games.';
      });
      return;
    }

    try {
      final game = await games.getGame(widget.libraryId, widget.gameId);
      if (!mounted) return;
      if (game == null) {
        setState(() {
          _loading = false;
          _error = 'Game not found.';
        });
        return;
      }

      final artworkScope = gameArtworkScope(widget.libraryId, game.system);
      _artworkScope = artworkScope;
      unawaited(retainGameArtworkCacheScope(artworkScope));
      setState(() {
        _game = game;
        _saveReadiness = _SaveReadiness.checking;
        _loading = false;
      });

      // Land on Play/Continue. The button's own autofocus only wins when
      // nothing else holds focus by the time it is built, which depends on how
      // long the load took.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _routeIsCovered) return;
        _primaryActionFocusNode.requestFocus();
      });

      unawaited(_initializeArtworkDataSource(game));

      // Save state and related games are enrichments; a failure here must not block the
      // screen that already has its core data.
      unawaited(_loadSave(games, game));
      _loadRelated(games, game);
    } catch (e) {
      if (!mounted) return;
      final detail = describeError(e, AppLocalizations.of(context));
      setState(() {
        _loading = false;
        _error = 'Failed to load game: $detail';
      });
    }
  }

  Future<void> _loadSave(GamesApi games, GameDetail game) async {
    final generation = ++_saveCheckGeneration;
    if (mounted && _saveReadiness != _SaveReadiness.checking) {
      setState(() => _saveReadiness = _SaveReadiness.checking);
    }
    try {
      final save = await loadGameStateWithMigration(
        games,
        game.id,
        game.core,
        forceEmulatorJs: _usesEmulatorJsOverride(game),
      );
      if (!mounted || generation != _saveCheckGeneration) return;
      setState(() {
        _saveReadiness = save != null && save.isNotEmpty
            ? _SaveReadiness.available
            : _SaveReadiness.absent;
      });
    } catch (_) {
      if (!mounted || generation != _saveCheckGeneration) return;
      setState(() => _saveReadiness = _SaveReadiness.failed);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || generation != _saveCheckGeneration || _routeIsCovered) {
        return;
      }
      _primaryActionFocusNode.requestFocus();
    });
  }

  Future<void> _loadRelated(GamesApi games, GameDetail game) async {
    try {
      final all = await games.getGames(widget.libraryId, system: game.system);
      if (!mounted) return;
      setState(() {
        _related = all
            .where((g) => g.id != game.id)
            .take(20)
            .toList(growable: false);
      });
    } catch (_) {}
  }

  void _retrySaveCheck() {
    final games = _client.gamesApi;
    final game = _game;
    if (games == null || game == null) return;
    unawaited(_loadSave(games, game));
  }

  void _play({required bool fresh}) {
    final game = _game;
    if (game == null ||
        (_saveReadiness != _SaveReadiness.absent &&
            _saveReadiness != _SaveReadiness.available)) {
      return;
    }
    if (!PlatformDetection.gamesPlaybackSupported ||
        !gameCoreSupported(game.core)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).gamePlaybackUnsupported),
        ),
      );
      return;
    }
    final biosId = game.bios.isNotEmpty ? game.bios.first.id : null;
    context.push(
      Destinations.gamePlayerOf(
        widget.libraryId,
        game.id,
        core: game.core,
        romFileName: game.fileName,
        biosId: biosId,
        name: game.title,
        startFresh: fresh,
        forceEmulatorJs: _usesEmulatorJsOverride(game),
        hardwareRenderingEnabled: _hardwareRenderingEnabled,
      ),
    );
  }

  Future<void> _toggleHardwareRendering() async {
    if (!GetIt.instance.isRegistered<UserPreferences>()) return;
    final next = !_hardwareRenderingEnabled;
    setState(() => _hardwareRenderingEnabled = next);
    try {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.useHardwareRendering,
        next,
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _hardwareRenderingEnabled = !next);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Could not save hardware rendering setting.'),
      ));
    }
  }

  Future<void> _selectCore() async {
    final game = _game;
    if (game == null || !_canSelectCore(game)) return;

    _ownDialogDepth++;
    final _CoreSelection? selection;
    try {
      selection = await showDialog<_CoreSelection>(
        context: context,
        builder: (context) => _CorePickerDialog(game: game),
      );
    } finally {
      _ownDialogDepth--;
    }
    if (selection == null) return;

    final games = _client.gamesApi;
    if (games == null) return;
    var updated = game;
    var didUpdate = false;
    void applyUpdate(GameDetail detail) {
      updated = detail;
      didUpdate = true;
      if (!mounted) return;
      setState(() {
        _game = detail;
        _saveCheckGeneration++;
        _saveReadiness = _SaveReadiness.checking;
      });
    }

    try {
      if (selection.setBackend) {
        final response = await games.setGameBackendOverride(
          widget.libraryId,
          game.id,
          backend: selection.backend,
        );
        if (response != null) applyUpdate(response);
      }
      if (selection.setCore) {
        final response = await games.setGameCoreOverride(
          widget.libraryId,
          game.id,
          core: selection.core,
        );
        if (response != null) applyUpdate(response);
      }
    } catch (e) {
      if (!mounted) return;
      final detail = describeError(e, AppLocalizations.of(context));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not change player: $detail')));
    } finally {
      if (didUpdate && mounted) unawaited(_loadSave(games, updated));
    }
  }

  void _openGame(GameSummary game) {
    context.push(Destinations.gameDetailOf(widget.libraryId, game.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Stays clear when the page scrolls under it, since the back button has its own backing.
        notificationPredicate: (_) => false,
        foregroundColor: Colors.white,
        leading: Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: _handleAppBarKeyEvent,
          // Keeps the arrow readable over a bright snapshot.
          child: const Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0x73101010),
                shape: BoxShape.circle,
              ),
              child: BackButton(),
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_error!, textAlign: TextAlign.center),
        ),
      );
    }

    final game = _game!;
    final artworkScope = _artworkScope!;
    return LayoutBuilder(
      builder: (context, constraints) {
        final tv = PlatformDetection.isTV;
        final landscape = tv || constraints.maxWidth >= 720;
        return landscape
            ? _LandscapeBody(
                game: game,
                artworkScope: artworkScope,
                artworkDataSource: _routeIsCovered
                    ? null
                    : _retroArtworkDataSource,
                retroArtworkTransport: _routeIsCovered
                    ? null
                    : _retroArtworkTransport,
                retroArtworkActivityGate: _routeIsCovered
                    ? null
                    : _retroArtworkActivityGate,
                saveReadiness: _saveReadiness,
                related: _related,
                tv: tv,
                primaryActionFocusNode: _primaryActionFocusNode,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onRetrySave: _retrySaveCheck,
                onSelectCore: _selectCore,
                hardwareRenderingEnabled: _hardwareRenderingEnabled,
                onToggleHardwareRendering: _toggleHardwareRendering,
                onOpenGame: _openGame,
              )
            : _PortraitBody(
                game: game,
                artworkScope: artworkScope,
                artworkDataSource: _routeIsCovered
                    ? null
                    : _retroArtworkDataSource,
                retroArtworkTransport: _routeIsCovered
                    ? null
                    : _retroArtworkTransport,
                retroArtworkActivityGate: _routeIsCovered
                    ? null
                    : _retroArtworkActivityGate,
                saveReadiness: _saveReadiness,
                related: _related,
                primaryActionFocusNode: _primaryActionFocusNode,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onRetrySave: _retrySaveCheck,
                onSelectCore: _selectCore,
                hardwareRenderingEnabled: _hardwareRenderingEnabled,
                onToggleHardwareRendering: _toggleHardwareRendering,
                onOpenGame: _openGame,
              );
      },
    );
  }
}

class _PortraitBody extends StatelessWidget {
  const _PortraitBody({
    required this.game,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.saveReadiness,
    required this.related,
    required this.primaryActionFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onRetrySave,
    required this.onSelectCore,
    required this.hardwareRenderingEnabled,
    required this.onToggleHardwareRendering,
    required this.onOpenGame,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final _SaveReadiness saveReadiness;
  final List<GameSummary> related;
  final FocusNode primaryActionFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onRetrySave;
  final VoidCallback onSelectCore;
  final bool hardwareRenderingEnabled;
  final VoidCallback onToggleHardwareRendering;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
    // Most retro screens are close to 8:7, so the snapshot shows nearly whole.
    final snapHeight = (MediaQuery.sizeOf(context).width * 7 / 8).clamp(
      240.0,
      420.0,
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: snapHeight + 64,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  height: snapHeight,
                  child: _Backdrop(
                    game: game,
                    artworkScope: artworkScope,
                    artworkDataSource: artworkDataSource,
                    retroArtworkTransport: retroArtworkTransport,
                    retroArtworkActivityGate: retroArtworkActivityGate,
                    landscape: false,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _Poster(
                        game: game,
                        artworkScope: artworkScope,
                        artworkDataSource: artworkDataSource,
                        retroArtworkTransport: retroArtworkTransport,
                        retroArtworkActivityGate: retroArtworkActivityGate,
                        width: 96,
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: _HeroTitle(game: game)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: _ActionRow(
              game: game,
              saveReadiness: saveReadiness,
              tv: false,
              landscape: false,
              primaryFocusNode: primaryActionFocusNode,
              onPlay: onPlay,
              onRestart: onRestart,
              onRetrySave: onRetrySave,
              onSelectCore: onSelectCore,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: _SaveStatus(readiness: saveReadiness),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: _PlayerCard(
              game: game,
              onSelectCore: onSelectCore,
              hardwareRenderingEnabled: hardwareRenderingEnabled,
              onToggleHardwareRendering: onToggleHardwareRendering,
            ),
          ),
          if (game.overview != null && game.overview!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
              child: _OverviewBlock(text: game.overview!, maxLines: 4),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
            child: _Facts(game: game, twoColumns: true),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
            child: _FileLine(game: game),
          ),
          if (related.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 24),
              child: GamePosterRail(
                title: 'More in ${game.system}',
                games: related,
                artworkScope: artworkScope,
                artworkDataSource: artworkDataSource,
                retroArtworkTransport: retroArtworkTransport,
                retroArtworkActivityGate: retroArtworkActivityGate,
                onTapGame: onOpenGame,
              ),
            )
          else
            const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _LandscapeBody extends StatelessWidget {
  const _LandscapeBody({
    required this.game,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.saveReadiness,
    required this.related,
    required this.tv,
    required this.primaryActionFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onRetrySave,
    required this.onSelectCore,
    required this.hardwareRenderingEnabled,
    required this.onToggleHardwareRendering,
    required this.onOpenGame,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final _SaveReadiness saveReadiness;
  final List<GameSummary> related;
  final bool tv;
  final FocusNode primaryActionFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onRetrySave;
  final VoidCallback onSelectCore;
  final bool hardwareRenderingEnabled;
  final VoidCallback onToggleHardwareRendering;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
    // Keeps the text left of where the snapshot fades in.
    final columnWidth = math.min(
      640.0,
      MediaQuery.sizeOf(context).width * 0.55 - 56,
    );
    return Stack(
      fit: StackFit.expand,
      children: [
        _Backdrop(
          game: game,
          artworkScope: artworkScope,
          artworkDataSource: artworkDataSource,
          retroArtworkTransport: retroArtworkTransport,
          retroArtworkActivityGate: retroArtworkActivityGate,
          landscape: true,
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(56, 12, 56, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: columnWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // The actions sit above the middle of a 540 tall TV screen,
                      // so focusing Play on open doesn't scroll the title away.
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _Poster(
                            game: game,
                            artworkScope: artworkScope,
                            artworkDataSource: artworkDataSource,
                            retroArtworkTransport: retroArtworkTransport,
                            retroArtworkActivityGate: retroArtworkActivityGate,
                            width: 104,
                          ),
                          const SizedBox(width: 20),
                          Expanded(child: _HeroTitle(game: game, large: true)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _ActionRow(
                        game: game,
                        saveReadiness: saveReadiness,
                        tv: tv,
                        landscape: true,
                        primaryFocusNode: primaryActionFocusNode,
                        onPlay: onPlay,
                        onRestart: onRestart,
                        onRetrySave: onRetrySave,
                        onSelectCore: onSelectCore,
                      ),
                      const SizedBox(height: 12),
                      _SaveStatus(readiness: saveReadiness, large: true),
                      if (game.overview != null &&
                          game.overview!.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        _OverviewBlock(
                          text: game.overview!,
                          maxLines: 3,
                          large: true,
                        ),
                      ],
                      const SizedBox(height: 22),
                      _Facts(game: game, large: true),
                      const SizedBox(height: 14),
                      _FileLine(game: game),
                      if (PlatformDetection.isAndroid &&
                          _usesNativeBackend(game))
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: _HardwareRenderingToggle(
                            enabled: hardwareRenderingEnabled,
                            onToggle: onToggleHardwareRendering,
                          ),
                        ),
                    ],
                  ),
                ),
                if (related.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: GamePosterRail(
                      title: 'More in ${game.system}',
                      games: related,
                      artworkScope: artworkScope,
                      artworkDataSource: artworkDataSource,
                      retroArtworkTransport: retroArtworkTransport,
                      retroArtworkActivityGate: retroArtworkActivityGate,
                      onTapGame: onOpenGame,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// The in-game snapshot, falling back to the title screen, then a blurred box art, and
/// finally a seeded color gradient. Portrait shows it full width above the title. Landscape
/// keeps it whole on the right and fades it out toward the text.
class _Backdrop extends StatelessWidget {
  const _Backdrop({
    required this.game,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.landscape,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final bool landscape;

  @override
  Widget build(BuildContext context) {
    final base = gameFallbackColor(game.id);

    final steps = <_BackdropStep>[
      const _BackdropStep('snap', blur: false),
      const _BackdropStep('title', blur: false),
      const _BackdropStep('boxart', blur: true),
    ];

    final image = Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [base, Color.lerp(base, Colors.black, 0.55)!],
            ),
          ),
        ),
        _BackdropImage(
          steps: steps,
          gameId: game.id,
          artworkScope: artworkScope,
          artworkDataSource: artworkDataSource,
          retroArtworkTransport: retroArtworkTransport,
          retroArtworkActivityGate: retroArtworkActivityGate,
          index: 0,
        ),
      ],
    );

    if (!landscape) {
      return Stack(
        fit: StackFit.expand,
        children: [
          _fade(
            image,
            const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
              stops: [0.5, 1],
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x59000000), Colors.transparent],
                stops: [0, 0.22],
              ),
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = math.min(
          constraints.maxWidth,
          constraints.maxHeight * 8 / 7,
        );
        // The fade spans a share of the screen, measured from the snapshot's left edge.
        final scale = constraints.maxWidth / width;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: width,
              child: _fade(
                _fade(
                  image,
                  LinearGradient(
                    colors: const [
                      Colors.transparent,
                      Color(0x26FFFFFF),
                      Colors.white,
                    ],
                    stops: [
                      0,
                      math.min(0.18 * scale, 1),
                      math.min(0.4 * scale, 1),
                    ],
                  ),
                ),
                const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x1AFFFFFF),
                    Colors.white,
                    Colors.white,
                    Color(0x26FFFFFF),
                    Colors.transparent,
                  ],
                  stops: [0, 0.16, 0.62, 0.8, 0.92],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Fades [child] out where [gradient] is transparent, so whatever the page draws behind it
/// shows through, including translucent theme backgrounds.
Widget _fade(Widget child, Gradient gradient) => ShaderMask(
  blendMode: BlendMode.dstIn,
  shaderCallback: gradient.createShader,
  child: child,
);

class _BackdropStep {
  const _BackdropStep(this.role, {required this.blur});
  final String role;
  final bool blur;
}

class _BackdropImage extends StatelessWidget {
  const _BackdropImage({
    required this.steps,
    required this.gameId,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.index,
  });

  final List<_BackdropStep> steps;
  final String gameId;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index >= steps.length) return const SizedBox.shrink();
    final step = steps[index];
    final reference = artworkDataSource?.imageFor(gameId, role: step.role);
    if (reference == null) {
      return _nextStep();
    }
    final source = reference.source;
    final transport = retroArtworkTransport;
    final gate = retroArtworkActivityGate;
    void onError(Object error) {
      artworkDataSource?.reportImageFailure(
        gameId,
        role: step.role,
        statusCode: _artworkStatusCode(error),
      );
    }

    final image = source != null && transport != null && gate != null
        ? RetroArtworkImage(
            source: source,
            transport: transport,
            activityGate: gate,
            // Full-bleed backdrop, so there is no painted width smaller than
            // the window to size from. Upstream's backdrop budget rather than a
            // literal, so game art and media art stay on one number.
            maxDecodeWidth: BackgroundService.backdropMaxWidth,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            filterQuality: step.blur ? FilterQuality.low : FilterQuality.none,
            onLoadFinished: () =>
                artworkDataSource?.reportImageLoaded(gameId, role: step.role),
            errorBuilder: (_, error) {
              onError(error);
              return _nextStep();
            },
          )
        : reference.legacyUrl == null
        ? _nextStep()
        : BoundedNetworkImage(
            imageUrl: reference.legacyUrl!,
            cacheManager: gameArtworkCacheManagerForScope(artworkScope),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            fadeInDuration: Duration.zero,
            maxWidth: 1920,
            onLoadFinished: () =>
                artworkDataSource?.reportImageLoaded(gameId, role: step.role),
            errorBuilder: (_, _, error) {
              onError(error);
              return _nextStep();
            },
          );
    if (!step.blur) return image;
    final sigma = GlassSettings.capSigma(24);
    if (sigma <= 0) {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Color(0x8C000000),
          BlendMode.srcOver,
        ),
        child: image,
      );
    }
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: image,
    );
  }

  Widget _nextStep() => _BackdropImage(
    steps: steps,
    gameId: gameId,
    artworkScope: artworkScope,
    artworkDataSource: artworkDataSource,
    retroArtworkTransport: retroArtworkTransport,
    retroArtworkActivityGate: retroArtworkActivityGate,
    index: index + 1,
  );
}

class _Poster extends StatelessWidget {
  const _Poster({
    required this.game,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.width,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final double width;

  @override
  Widget build(BuildContext context) {
    final reference = artworkDataSource?.imageFor(game.id, role: 'boxart');
    final source = reference?.source;
    final transport = retroArtworkTransport;
    final gate = retroArtworkActivityGate;
    final fallback = _ArtFallback(seed: game.id, iconSize: 40);
    final artAspect = artworkDataSource?.snapshot?.aspectRatioFor(game.id);
    final cell = RetroArtworkShape.cellFor(artAspect);
    final posterWidth = width * cell.width;
    final containArt =
        artAspect != null &&
        RetroArtworkShape.needsFill(artAspect, cell.aspectRatio);
    final artwork = source != null && transport != null && gate != null
        ? RetroArtworkImage(
            source: source,
            transport: transport,
            activityGate: gate,
            // Sized from what is painted, like every other bounded image.
            maxDecodeWidth: BoundedNetworkImage.cacheWidthFor(
              posterWidth,
              MediaQuery.devicePixelRatioOf(context),
            ),
            fit: containArt ? BoxFit.contain : BoxFit.cover,
            fillBehind: containArt,
            onLoadFinished: () =>
                artworkDataSource?.reportImageLoaded(game.id, role: 'boxart'),
            errorBuilder: (_, error) {
              artworkDataSource?.reportImageFailure(
                game.id,
                role: 'boxart',
                statusCode: _artworkStatusCode(error),
              );
              return fallback;
            },
          )
        : reference?.legacyUrl == null
        ? fallback
        : BoundedNetworkImage(
            imageUrl: reference!.legacyUrl!,
            cacheManager: gameArtworkCacheManagerForScope(artworkScope),
            fit: BoxFit.cover,
            maxWidth: 512,
            onLoadFinished: () =>
                artworkDataSource?.reportImageLoaded(game.id, role: 'boxart'),
            errorBuilder: (_, _, error) {
              artworkDataSource?.reportImageFailure(
                game.id,
                role: 'boxart',
                statusCode: _artworkStatusCode(error),
              );
              return fallback;
            },
          );
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SizedBox(
          width: posterWidth,
          height: width * cell.height,
          child: artwork,
        ),
      ),
    );
  }
}

int? _artworkStatusCode(Object error) {
  if (error is DioException) return error.response?.statusCode;
  if (error is HttpExceptionWithStatus) return error.statusCode;
  return null;
}

class _ArtFallback extends StatelessWidget {
  const _ArtFallback({required this.seed, required this.iconSize});

  final String seed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: gameFallbackColor(seed),
      child: Center(
        child: Icon(
          Icons.videogame_asset,
          size: iconSize,
          color: Colors.white70,
        ),
      ),
    );
  }
}

class _HeroTitle extends StatelessWidget {
  const _HeroTitle({required this.game, this.large = false});

  final GameDetail game;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          game.system.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: large ? 14 : 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: large ? 8 : 4),
        Text(
          _headlineTitle(game),
          style: TextStyle(
            color: Colors.white,
            fontSize: large ? 40 : 26,
            fontWeight: FontWeight.w700,
            height: 1.08,
          ),
        ),
        if (_metaSummary(game) case final summary?) ...[
          SizedBox(height: large ? 10 : 6),
          Text(
            summary,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: large ? 17 : 14,
            ),
          ),
        ],
      ],
    );
  }
}

/// The title without trailing No-Intro tags such as "(USA)" or "(Rev 1)". The region
/// still shows in the facts below.
String _headlineTitle(GameDetail game) {
  final title = gameDisplayTitle(game.title, game.fileName);
  final stripped = title
      .replaceFirst(RegExp(r'(\s*[(\[][^()\[\]]*[)\]])+$'), '')
      .trim();
  return stripped.isEmpty ? title : stripped;
}

/// A one-line "year · genre · players" summary from whatever metadata is present, or null
/// when the libretro lookup returned nothing usable.
String? _metaSummary(GameDetail game) {
  final parts = <String>[
    if (game.year != null) '${game.year}',
    if (game.genre != null && game.genre!.isNotEmpty) game.genre!,
    if (game.players != null && game.players! > 0)
      game.players == 1 ? '1 player' : '${game.players} players',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.game,
    required this.saveReadiness,
    required this.tv,
    required this.landscape,
    required this.primaryFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onRetrySave,
    required this.onSelectCore,
  });

  final GameDetail game;
  final _SaveReadiness saveReadiness;
  final bool tv;

  /// Landscape puts the player button in this row. Portrait has the player card instead.
  final bool landscape;
  final FocusNode primaryFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onRetrySave;
  final VoidCallback onSelectCore;

  @override
  Widget build(BuildContext context) {
    final hasSave = saveReadiness == _SaveReadiness.available;
    final checking = saveReadiness == _SaveReadiness.checking;
    final failed = saveReadiness == _SaveReadiness.failed;
    final primaryLabel = switch (saveReadiness) {
      _SaveReadiness.checking => 'Checking for save…',
      _SaveReadiness.failed => 'Retry save check',
      _SaveReadiness.available => 'Continue',
      _SaveReadiness.absent => 'Play',
    };
    final primaryIcon = checking
        ? Icons.hourglass_top
        : failed
        ? Icons.refresh
        : Icons.play_arrow;
    final VoidCallback? primaryAction = checking
        ? null
        : failed
        ? onRetrySave
        : onPlay;
    final scheme = Theme.of(context).colorScheme;
    final player = landscape
        ? _PlayerButton(
            game: game,
            tv: tv,
            onPressed: _canSelectCore(game) ? onSelectCore : null,
          )
        : null;

    if (tv) {
      final radius = BorderRadius.circular(FocusTheme.defaultBorderRadius);
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: radius,
            ),
            child: FocusableButton(
              focusNode: primaryFocusNode,
              autofocus: true,
              autoScroll: true,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              onPressed: primaryAction,
              child: _ActionLabel(
                icon: primaryIcon,
                label: primaryLabel,
                color: scheme.onPrimary,
              ),
            ),
          ),
          if (hasSave)
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: radius,
              ),
              child: FocusableButton(
                autoScroll: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                onPressed: onRestart,
                child: const _ActionLabel(
                  icon: Icons.refresh,
                  label: 'Start fresh',
                  color: Colors.white,
                ),
              ),
            ),
          ?player,
        ],
      );
    }

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    );
    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    final primary = FilledButton.icon(
      focusNode: primaryFocusNode,
      onPressed: primaryAction,
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 26),
        shape: shape,
        textStyle: textStyle,
      ).copyWith(side: _focusRing),
      icon: Icon(primaryIcon),
      label: Text(primaryLabel),
    );
    final restart = FilledButton.icon(
      onPressed: onRestart,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        foregroundColor: Colors.white,
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        shape: shape,
        textStyle: textStyle.copyWith(fontWeight: FontWeight.w500),
      ).copyWith(side: _focusRing),
      icon: const Icon(Icons.refresh),
      label: const Text('Start fresh'),
    );

    if (!landscape) {
      return Row(
        children: [
          Expanded(child: primary),
          if (hasSave) ...[const SizedBox(width: 10), restart],
        ],
      );
    }
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [primary, if (hasSave) restart, ?player],
    );
  }
}

/// Material's own keyboard focus is a faint overlay, too quiet to follow with arrow keys
/// or a remote on the phone and desktop layouts. Touch skips it, since the screen focuses
/// Play on open.
final _focusRing = WidgetStateProperty.resolveWith<BorderSide?>(
  (states) =>
      states.contains(WidgetState.focused) &&
          FocusManager.instance.highlightMode ==
              FocusHighlightMode.traditional
      ? const BorderSide(color: Colors.white, width: 2)
      : null,
);

/// Which player runs the game, as a button that opens the picker when there is a choice.
class _PlayerButton extends StatelessWidget {
  const _PlayerButton({
    required this.game,
    required this.tv,
    required this.onPressed,
  });

  final GameDetail game;
  final bool tv;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final native = _usesNativeBackend(game);
    final name = _playerName(game);
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PlayerIcon(native: native, size: 32),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              native ? 'Native core' : 'EmulatorJS',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
    const padding = EdgeInsets.fromLTRB(12, 8, 20, 8);
    final onPressed = this.onPressed;
    // With only one player there is nothing to pick, so it reads as a label rather than a
    // button the d-pad can't reach.
    if (onPressed == null) {
      return Padding(padding: padding, child: content);
    }
    if (tv) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(FocusTheme.defaultBorderRadius),
        ),
        child: FocusableButton(
          key: const ValueKey('gameDetailPlayer'),
          autoScroll: true,
          padding: padding,
          semanticLabel: 'Player, $name. Change',
          onPressed: onPressed,
          child: content,
        ),
      );
    }
    return FilledButton(
      key: const ValueKey('gameDetailPlayer'),
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.12),
        foregroundColor: Colors.white,
        minimumSize: const Size(0, 52),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ).copyWith(side: _focusRing),
      child: content,
    );
  }
}

/// Green for the native core, blue for EmulatorJS.
class _PlayerIcon extends StatelessWidget {
  const _PlayerIcon({required this.native, required this.size});

  final bool native;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: native ? const Color(0x247FE0B0) : const Color(0x243D9BFF),
        borderRadius: BorderRadius.circular(size / 4),
      ),
      child: Icon(
        native ? Icons.memory_rounded : Icons.web_asset_rounded,
        color: native ? const Color(0xFFA9F0CC) : const Color(0xFFB7DBFF),
        size: size * 0.55,
      ),
    );
  }
}

/// The libretro core's own name for the native player, such as "Snes9x", or the
/// EmulatorJS core otherwise.
String _playerName(GameDetail game) {
  if (!_usesNativeBackend(game)) return _coreLabel(game.core);
  final coreId = libretroCoreId(game.core);
  return (coreId == null ? null : libretroCoreName(coreId)) ??
      _coreLabel(game.core);
}

class _SaveStatus extends StatelessWidget {
  const _SaveStatus({required this.readiness, this.large = false});

  final _SaveReadiness readiness;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final found = readiness == _SaveReadiness.available;
    // While checking or after a failure the primary button already says so.
    if (!found && readiness != _SaveReadiness.absent) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: found ? const Color(0xFF7FE0B0) : null,
            border: found
                ? null
                : Border.all(color: Colors.white54, width: 1.5),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            found
                ? 'Save found. Continue picks up from it.'
                : 'No save on this server yet',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: large ? 15 : 13,
            ),
          ),
        ),
      ],
    );
  }
}

/// Portrait's player summary: the core, a Change action when there is a choice, and the
/// hardware rendering switch for Android's native player.
class _PlayerCard extends StatelessWidget {
  const _PlayerCard({
    required this.game,
    required this.onSelectCore,
    required this.hardwareRenderingEnabled,
    required this.onToggleHardwareRendering,
  });

  final GameDetail game;
  final VoidCallback onSelectCore;
  final bool hardwareRenderingEnabled;
  final VoidCallback onToggleHardwareRendering;

  @override
  Widget build(BuildContext context) {
    final native = _usesNativeBackend(game);
    final name = _playerName(game);
    final canSelect = _canSelectCore(game);
    final accent = Theme.of(context).colorScheme.primary;
    final summary = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          _PlayerIcon(native: native, size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  native
                      ? 'Native core · runs on this device'
                      : 'EmulatorJS · runs in a web view',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.62),
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          if (canSelect) ...[
            Text(
              'Change',
              style: TextStyle(
                color: accent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.chevron_right, color: accent, size: 18),
          ],
        ],
      ),
    );
    return adaptiveGlass(
      context: context,
      fallbackColor: const Color(0x14FFFFFF),
      cornerRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (canSelect)
            FocusableButton(
              key: const ValueKey('gameDetailPlayer'),
              padding: EdgeInsets.zero,
              borderRadius: 16,
              autoScroll: true,
              semanticLabel: 'Player, $name. Change',
              onPressed: onSelectCore,
              child: summary,
            )
          else
            summary,
          if (PlatformDetection.isAndroid && native) ...[
            const Divider(height: 1, indent: 16, endIndent: 16),
            Padding(
              padding: const EdgeInsets.all(4),
              child: _HardwareRenderingToggle(
                enabled: hardwareRenderingEnabled,
                onToggle: onToggleHardwareRendering,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HardwareRenderingToggle extends StatelessWidget {
  const _HardwareRenderingToggle({
    required this.enabled,
    required this.onToggle,
  });

  final bool enabled;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final status = enabled ? 'ON' : 'OFF';
    final statusColor = enabled
        ? const Color(0xFFA9F0CC)
        : const Color(0xFFFFC47A);
    return FocusableButton(
      semanticLabel: 'Experimental hardware rendering: $status',
      autoScroll: true,
      onPressed: onToggle,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.memory_rounded, color: statusColor, size: 20),
              const SizedBox(width: 9),
              const Flexible(
                child: Text(
                  'Hardware rendering',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ExcludeSemantics(
                child: IgnorePointer(
                  child: Switch(
                    value: enabled,
                    onChanged: (_) {},
                    activeThumbColor: const Color(0xFFA9F0CC),
                    activeTrackColor: const Color(0x667FE0B0),
                    inactiveThumbColor: const Color(0xFFFFC47A),
                    inactiveTrackColor: const Color(0x66FF9F43),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'EXPERIMENTAL · OFF disables the EGL hardware path. Hardware-only cores may not start.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.25),
          ),
        ],
      ),
    );
  }
}

class _ActionLabel extends StatelessWidget {
  const _ActionLabel({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _OverviewBlock extends StatefulWidget {
  const _OverviewBlock({
    required this.text,
    required this.maxLines,
    this.large = false,
  });

  final String text;
  final int maxLines;

  /// Landscape drops the About heading and uses larger text.
  final bool large;

  @override
  State<_OverviewBlock> createState() => _OverviewBlockState();
}

class _OverviewBlockState extends State<_OverviewBlock> {
  bool _expanded = false;

  bool _overflows(TextStyle style, double maxWidth) {
    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      maxLines: widget.maxLines,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout(maxWidth: maxWidth);
    final overflows = painter.didExceedMaxLines;
    painter.dispose();
    return overflows;
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Colors.white.withValues(alpha: 0.78),
      fontSize: widget.large ? 17 : 14,
      height: 1.55,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final showToggle = _expanded || _overflows(style, constraints.maxWidth);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.large)
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Text(
              widget.text,
              style: style,
              maxLines: _expanded ? null : widget.maxLines,
              overflow: _expanded ? null : TextOverflow.ellipsis,
            ),
            if (showToggle)
              Transform.translate(
                offset: const Offset(-8, 0),
                child: FocusableButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  autoScroll: true,
                  onPressed: () => setState(() => _expanded = !_expanded),
                  child: Text(
                    _expanded ? 'Show less' : 'Read more',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: widget.large ? 15 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Label and value pairs for the metadata the hero doesn't already show. Two equal columns
/// in portrait, one wrapping row in landscape.
class _Facts extends StatelessWidget {
  const _Facts({
    required this.game,
    this.twoColumns = false,
    this.large = false,
  });

  final GameDetail game;
  final bool twoColumns;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final facts = <(String, String)>[
      if (game.developer case final v? when v.isNotEmpty) ('Developer', v),
      if (game.publisher case final v? when v.isNotEmpty) ('Publisher', v),
      if (game.franchise case final v? when v.isNotEmpty) ('Franchise', v),
      if (game.region case final v? when v.isNotEmpty) ('Region', v),
      if (game.rating case final v?) ('Rating', '${v.toStringAsFixed(1)} / 5'),
      if (game.sizeBytes > 0) ('Size', _formatBytes(game.sizeBytes)),
      if (game.bios.isNotEmpty)
        ('BIOS', game.bios.map((b) => b.fileName).join(', ')),
    ];
    if (facts.isEmpty) return const SizedBox.shrink();
    Widget cell((String, String) fact, double? width) => SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            fact.$1,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: large ? 13 : 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            fact.$2,
            style: TextStyle(
              color: Colors.white,
              fontSize: large ? 17 : 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
    if (!twoColumns) {
      return Wrap(
        spacing: 40,
        runSpacing: 16,
        children: [for (final fact in facts) cell(fact, null)],
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth - 20) / 2;
        return Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [for (final fact in facts) cell(fact, width)],
        );
      },
    );
  }
}

class _FileLine extends StatelessWidget {
  const _FileLine({required this.game});

  final GameDetail game;

  @override
  Widget build(BuildContext context) {
    final color = Colors.white.withValues(alpha: 0.6);
    return Row(
      children: [
        Icon(Icons.insert_drive_file_outlined, color: color, size: 16),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            game.fileName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _CoreSelection {
  const _CoreSelection({
    required this.core,
    required this.backend,
    required this.setBackend,
    required this.setCore,
  });

  final String? core;
  final String? backend;
  final bool setBackend;
  final bool setCore;
}

/// One reachable (player, core) outcome shown as a row in the picker — pins
/// down both halves of what "Play" will actually do.
class _CoreRow {
  const _CoreRow({
    required this.label,
    required this.core,
    required this.isEmulatorJs,
    required this.recommended,
    required this.setBackend,
    required this.setCore,
    this.detail,
  });

  final String label;
  final String core;
  final bool isEmulatorJs;
  final bool recommended;
  final bool setBackend;
  final bool setCore;
  final String? detail;

  _CoreSelection get selection => _CoreSelection(
    core: setCore ? core : null,
    backend: isEmulatorJs ? 'emulatorjs' : null,
    setBackend: setBackend,
    setCore: setCore,
  );
}

/// Builds the full set of genuinely reachable (player, core) rows for [game].
///
/// Candidate cores are the union of the game's current core and every core
/// the server validated ([GameDetail.availableCores]), recommended core
/// first. A native row is only emitted when [nativeCoreReachable] (checked
/// independent of the user's current preference, so a row can always be
/// forced); an EmulatorJS row is emitted whenever the WebView backend exists
/// on this platform at all.
List<_CoreRow> _buildCoreRows(GameDetail game) {
  final recommended = game.recommendedCore ?? game.core;
  final candidates = <String>[];
  void addCandidate(String core) {
    if (!candidates.contains(core)) candidates.add(core);
  }

  addCandidate(recommended);
  addCandidate(game.core);
  for (final core in game.availableCores) {
    addCandidate(core);
  }

  // Arcade ROMs can run under FBNeo (native-only) or MAME (EmulatorJS-only),
  // but the server's `availableCores` only lists what it validated the
  // archive against — e.g. a MAME-only validation would otherwise hide the
  // FBNeo option entirely. Force both in as candidates for any arcade-family
  // game; reachability below still filters out what isn't actually
  // installed/available.
  if (isArcadeFamilyCore(game.core) || isArcadeFamilyCore(recommended)) {
    addCandidate('arcade');
    addCandidate('mame');
  }

  // The "Recommended" tag goes on whichever player would actually run the
  // recommended core: native if that's reachable, otherwise EmulatorJS. Only
  // one row can carry it, since only one row exists per (player, core) pair.
  final recommendOnNative = nativeCoreReachable(recommended);
  final setBackend = game.supportsBackendOverrides;
  final setCore = game.supportsCoreOverrides;

  // Both branches emit one row per candidate core; only the player, the
  // reachability test, and which recommendation half they claim differ.
  _CoreRow buildRow({
    required String core,
    required bool isEmulatorJs,
    required bool isRecommended,
  }) {
    return _CoreRow(
      label: isEmulatorJs ? 'EmulatorJS (WebView)' : 'Native core',
      core: core,
      isEmulatorJs: isEmulatorJs,
      recommended: isRecommended,
      setBackend: isEmulatorJs ? true : setBackend,
      setCore: setCore,
      detail: isRecommended
          ? game.coreCompatibilityReason
          : _notValidatedWarning(game, core),
    );
  }

  final rows = <_CoreRow>[];
  if (setBackend || setCore) {
    for (final core in candidates) {
      if (nativeCoreReachable(core)) {
        rows.add(
          buildRow(
            core: core,
            isEmulatorJs: false,
            isRecommended: recommendOnNative && core == recommended,
          ),
        );
      }
    }
  }
  // Offered whenever *either* override channel is usable: a legacy server
  // that hasn't rolled out backendOverrideSupported (setBackend == false)
  // can still reach EmulatorJS via a plain core override, and arcade
  // families force setCore on regardless of backend-override support.
  if (emulatorJsAvailable && (setBackend || setCore)) {
    for (final core in candidates) {
      rows.add(
        buildRow(
          core: core,
          isEmulatorJs: true,
          isRecommended: !recommendOnNative && core == recommended,
        ),
      );
    }
  }
  return rows;
}

/// A warning for offering [core] when the server has compatibility data but
/// didn't validate this ROM against it.
String? _notValidatedWarning(GameDetail game, String core) {
  if (game.availableCores.isEmpty || game.availableCores.contains(core)) {
    return null;
  }
  return 'This archive is not validated for ${_coreLabel(core)} and may not launch correctly.';
}

class _CorePickerDialog extends StatelessWidget {
  const _CorePickerDialog({required this.game});

  final GameDetail game;

  @override
  Widget build(BuildContext context) {
    final effectiveNative = _usesNativeBackend(game);
    final rows = _buildCoreRows(game);
    return AlertDialog(
      title: const Text('Choose player'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final row in rows)
                _CorePickerOption(
                  label: row.label,
                  subtitle: row.recommended
                      ? '${_coreLabel(row.core)} (Recommended)'
                      : _coreLabel(row.core),
                  detail: row.detail,
                  selected:
                      row.isEmulatorJs == !effectiveNative &&
                      row.core == game.core,
                  onTap: () => Navigator.pop(context, row.selection),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CorePickerOption extends StatelessWidget {
  const _CorePickerOption({
    required this.label,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.detail,
  });

  final String label;
  final String? subtitle;

  /// Second, optional line below [subtitle] — used for the server's
  /// `coreCompatibilityReason` explanation, kept visually distinct (smaller,
  /// dimmer, italic) so it reads as supplementary detail rather than a label.
  final String? detail;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FocusableButton(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      borderRadius: 8,
      semanticLabel: label,
      autoScroll: true,
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Colors.white70,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white)),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                if (detail != null && detail!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      detail!,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _coreLabel(String core) => switch (core) {
  'arcade' => 'FBNeo',
  'mame' => 'MAME',
  _ => core,
};

bool _usesEmulatorJsOverride(GameDetail game) =>
    game.userBackendOverride == 'emulatorjs';

bool _usesNativeBackend(GameDetail game) =>
    !_usesEmulatorJsOverride(game) && usesNativeGameBackendFor(game.core);

/// Hidden when there is only one supported per-game player/core outcome. A
/// backend choice and an arcade-core choice are separate capabilities: normal
/// console games only write the former, while arcade games may write both.
bool _canSelectCore(GameDetail game) => _buildCoreRows(game).length > 1;

String _formatBytes(int bytes) {
  if (bytes <= 0) return '';
  const units = ['B', 'KB', 'MB', 'GB'];
  var size = bytes.toDouble();
  var unit = 0;
  while (size >= 1024 && unit < units.length - 1) {
    size /= 1024;
    unit++;
  }
  final rounded = (size >= 10 || unit == 0) ? size.toStringAsFixed(0) : size.toStringAsFixed(1);
  return '$rounded ${units[unit]}';
}
