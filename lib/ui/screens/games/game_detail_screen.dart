import 'dart:async';
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
import '../../widgets/adaptive/adaptive_glass.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/focus/focusable_button.dart';
import '../../widgets/game/game_poster_rail.dart';
import '../../widgets/game/retro_artwork_image.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_cache.dart';
import '../../../data/services/retro_artwork/retro_artwork_data_source.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';
import '../../../util/game_artwork_cache.dart';
import '../../../util/game_cores.dart';
import '../../../util/game_library.dart';
import '../../../util/platform_detection.dart';
import '../../../util/tv_image_cache_stub.dart'
    if (dart.library.io) '../../../util/tv_image_cache_io.dart';

/// Premium, responsive game detail screen. Builds a cinematic hero from keyless libretro
/// thumbnails (in-game snapshot backdrop + box-art poster), shows the data the games API
/// exposes (system, core, size, BIOS, save state), and offers Continue/Play plus Restart.
/// Portrait on mobile, landscape on desktop/TV, with d-pad focus in leanback mode.
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

class _GameDetailScreenState extends State<GameDetailScreen> with RouteAware {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final FocusNode _primaryActionFocusNode = FocusNode(
    debugLabel: 'gameDetailPrimaryAction',
  );

  bool _loading = true;
  String? _error;
  GameDetail? _game;
  bool _hasSave = false;
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
        _loading = false;
      });

      unawaited(_initializeArtworkDataSource(game));

      // Save state and related games are enrichments; a failure here must not block the
      // screen that already has its core data.
      _loadSave(games, game);
      _loadRelated(games, game);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load game: $e';
      });
    }
  }

  Future<void> _loadSave(GamesApi games, GameDetail game) async {
    try {
      final save = await loadGameStateWithMigration(
        games,
        game.id,
        game.core,
        forceEmulatorJs: _usesEmulatorJsOverride(game),
      );
      if (!mounted) return;
      setState(() => _hasSave = save != null && save.isNotEmpty);
    } catch (_) {}
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

  void _play({required bool fresh}) {
    final game = _game;
    if (game == null) return;
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
      ),
    );
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
        _hasSave = false;
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not change player: $e')));
    } finally {
      if (didUpdate && mounted) _loadSave(games, updated);
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
        foregroundColor: Colors.white,
        leading: Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: _handleAppBarKeyEvent,
          child: const BackButton(),
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
                hasSave: _hasSave,
                related: _related,
                tv: tv,
                primaryActionFocusNode: _primaryActionFocusNode,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onSelectCore: _selectCore,
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
                hasSave: _hasSave,
                related: _related,
                primaryActionFocusNode: _primaryActionFocusNode,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onSelectCore: _selectCore,
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
    required this.hasSave,
    required this.related,
    required this.primaryActionFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onSelectCore,
    required this.onOpenGame,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final bool hasSave;
  final List<GameSummary> related;
  final FocusNode primaryActionFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onSelectCore;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _Backdrop(
                  game: game,
                  artworkScope: artworkScope,
                  artworkDataSource: artworkDataSource,
                  retroArtworkTransport: retroArtworkTransport,
                  retroArtworkActivityGate: retroArtworkActivityGate,
                  landscape: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
                  child: Row(
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
                      const SizedBox(width: 14),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: _HeroTitle(game: game),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
            child: _MetaPills(game: game, hasSave: hasSave),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
            child: _ActionRow(
              game: game,
              hasSave: hasSave,
              tv: false,
              fullWidthPrimary: true,
              primaryFocusNode: primaryActionFocusNode,
              onPlay: onPlay,
              onRestart: onRestart,
              onSelectCore: onSelectCore,
            ),
          ),
          if (game.overview != null && game.overview!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: _OverviewBlock(text: game.overview!),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: _DetailsPanel(
              game: game,
              hasSave: hasSave,
              onSelectCore: onSelectCore,
            ),
          ),
          if (related.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 24),
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
    required this.hasSave,
    required this.related,
    required this.tv,
    required this.primaryActionFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onSelectCore,
    required this.onOpenGame,
  });

  final GameDetail game;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
  final bool hasSave;
  final List<GameSummary> related;
  final bool tv;
  final FocusNode primaryActionFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onSelectCore;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(40, 24, 40, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Poster(
                      game: game,
                      artworkScope: artworkScope,
                      artworkDataSource: artworkDataSource,
                      retroArtworkTransport: retroArtworkTransport,
                      retroArtworkActivityGate: retroArtworkActivityGate,
                      width: tv ? 168 : 150,
                    ),
                    const SizedBox(width: 26),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroTitle(game: game, large: true),
                            const SizedBox(height: 16),
                            _MetaPills(game: game, hasSave: hasSave),
                            const SizedBox(height: 20),
                            _ActionRow(
                              game: game,
                              hasSave: hasSave,
                              tv: tv,
                              fullWidthPrimary: false,
                              primaryFocusNode: primaryActionFocusNode,
                              onPlay: onPlay,
                              onRestart: onRestart,
                              onSelectCore: onSelectCore,
                            ),
                            if (game.overview != null && game.overview!.isNotEmpty) ...[
                              const SizedBox(height: 22),
                              _OverviewBlock(text: game.overview!),
                            ],
                            const SizedBox(height: 22),
                            _DetailsPanel(
                              game: game,
                              hasSave: hasSave,
                              onSelectCore: onSelectCore,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (related.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
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

/// Full-bleed hero image. Tries the in-game snapshot, then the title screen, then a blurred
/// box art, and finally a seeded color gradient, with scrims for text legibility.
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
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final base = gameFallbackColor(game.id);

    final steps = <_BackdropStep>[
      const _BackdropStep('snap', blur: false),
      const _BackdropStep('title', blur: false),
      const _BackdropStep('boxart', blur: true),
    ];

    return Stack(
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
        if (landscape)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [bg, bg.withValues(alpha: 0.35), Colors.transparent],
                stops: const [0.30, 0.62, 0.92],
              ),
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                bg.withValues(alpha: landscape ? 0.4 : 0.75),
                bg,
              ],
              stops: const [0.35, 0.78, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}

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
            fadeInDuration: const Duration(milliseconds: 250),
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
    final artwork = source != null && transport != null && gate != null
        ? RetroArtworkImage(
            source: source,
            transport: transport,
            activityGate: gate,
            // Sized from what is painted, like every other bounded image.
            maxDecodeWidth: BoundedNetworkImage.cacheWidthFor(
              width,
              MediaQuery.devicePixelRatioOf(context),
            ),
            fit: BoxFit.cover,
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
        child: SizedBox(width: width, height: width * 1.34, child: artwork),
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
          game.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: large ? 30 : 20,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          game.system,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        if (_metaSummary(game) case final summary?) ...[
          const SizedBox(height: 4),
          Text(
            summary,
            style: const TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ],
      ],
    );
  }
}

/// A one-line "genre · year · players" summary from whatever metadata is present, or null
/// when the libretro lookup returned nothing usable.
String? _metaSummary(GameDetail game) {
  final parts = <String>[
    if (game.genre != null && game.genre!.isNotEmpty) game.genre!,
    if (game.year != null) '${game.year}',
    if (game.players != null && game.players! > 0)
      game.players == 1 ? '1 player' : '${game.players} players',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

class _MetaPills extends StatelessWidget {
  const _MetaPills({required this.game, required this.hasSave});

  final GameDetail game;
  final bool hasSave;

  @override
  Widget build(BuildContext context) {
    final native = _usesNativeBackend(game);
    final pills = <Widget>[
      if (game.region != null && game.region!.isNotEmpty) _Pill(text: game.region!),
      if (game.sizeBytes > 0) _Pill(text: _formatBytes(game.sizeBytes)),
      if (hasSave) const _Pill(text: 'Save found', accent: true),
      if (game.bios.isNotEmpty) const _Pill(text: 'BIOS required'),
      _BackendPill(native: native, core: game.core),
    ];
    return Wrap(spacing: 7, runSpacing: 7, children: pills);
  }
}

/// Reports the actual route for this game, including any per-system fallback
/// from a missing or unsupported native core to EmulatorJS. Purely
/// informational -- changing the core happens through the core button in
/// [_ActionRow] or the details panel, not by tapping this pill.
class _BackendPill extends StatelessWidget {
  const _BackendPill({required this.native, required this.core});

  final bool native;
  final String core;

  @override
  Widget build(BuildContext context) {
    final color = native ? const Color(0xFFA9F0CC) : const Color(0xFFB7DBFF);
    final background = native
        ? const Color(0x267FE0B0)
        : const Color(0x263D9BFF);
    final border = native ? const Color(0x4D7FE0B0) : const Color(0x4D3D9BFF);
    final label = native
        ? 'Native core · ${_coreLabel(core)}'
        : 'WebView · EmulatorJS';
    final pill = Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            native ? Icons.memory_rounded : Icons.web_asset_rounded,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
    return Semantics(label: label, child: pill);
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, this.accent = false});

  final String text;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final color = accent ? const Color(0xFFA9F0CC) : Colors.white;
    final bg = accent ? const Color(0x267FE0B0) : const Color(0x1AFFFFFF);
    final border = accent ? const Color(0x4D7FE0B0) : const Color(0x24FFFFFF);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.game,
    required this.hasSave,
    required this.tv,
    required this.fullWidthPrimary,
    required this.primaryFocusNode,
    required this.onPlay,
    required this.onRestart,
    required this.onSelectCore,
  });

  final GameDetail game;
  final bool hasSave;
  final bool tv;
  final bool fullWidthPrimary;
  final FocusNode primaryFocusNode;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final VoidCallback onSelectCore;

  @override
  Widget build(BuildContext context) {
    final primaryLabel = hasSave ? 'Continue' : 'Play';
    final accent = Theme.of(context).colorScheme.primary;
    final native = _usesNativeBackend(game);
    final coreFill = _coreButtonFillColor(native);

    if (tv) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FocusableButton(
            focusNode: primaryFocusNode,
            autofocus: true,
            focusColor: accent,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            onPressed: onPlay,
            child: _ActionLabel(
              icon: Icons.play_arrow,
              label: primaryLabel,
              color: Colors.white,
            ),
          ),
          if (hasSave) ...[
            const SizedBox(width: 12),
            FocusableButton(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              onPressed: onRestart,
              child: const _ActionLabel(
                icon: Icons.refresh,
                label: 'Restart',
                color: Colors.white,
              ),
            ),
          ],
          if (_canSelectCore(game)) ...[
            const SizedBox(width: 12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: coreFill,
                borderRadius: BorderRadius.circular(
                  FocusTheme.defaultBorderRadius,
                ),
              ),
              child: FocusableButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                onPressed: onSelectCore,
                child: _ActionLabel(
                  icon: Icons.memory,
                  label: _coreLabel(game.core),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      );
    }

    final primary = FilledButton.icon(
      focusNode: primaryFocusNode,
      onPressed: onPlay,
      icon: const Icon(Icons.play_arrow),
      label: Text(primaryLabel),
    );
    final restart = OutlinedButton.icon(
      onPressed: onRestart,
      icon: const Icon(Icons.refresh),
      label: const Text('Restart'),
    );
    final core = FilledButton.icon(
      onPressed: onSelectCore,
      style: FilledButton.styleFrom(
        backgroundColor: coreFill,
        foregroundColor: Colors.white,
      ),
      icon: const Icon(Icons.memory),
      label: Text(_coreLabel(game.core)),
    );

    if (fullWidthPrimary) {
      return Row(
        children: [
          Expanded(child: primary),
          if (hasSave) ...[const SizedBox(width: 10), restart],
          if (_canSelectCore(game)) ...[const SizedBox(width: 10), core],
        ],
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        primary,
        if (hasSave) ...[const SizedBox(width: 10), restart],
        if (_canSelectCore(game)) ...[const SizedBox(width: 10), core],
      ],
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

class _OverviewBlock extends StatelessWidget {
  const _OverviewBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  const _DetailsPanel({
    required this.game,
    required this.hasSave,
    required this.onSelectCore,
  });

  final GameDetail game;
  final bool hasSave;
  final VoidCallback onSelectCore;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[
      if (game.genre != null && game.genre!.isNotEmpty)
        _DetailRow(label: 'Genre', value: game.genre!),
      if (game.developer != null && game.developer!.isNotEmpty)
        _DetailRow(label: 'Developer', value: game.developer!),
      if (game.publisher != null && game.publisher!.isNotEmpty)
        _DetailRow(label: 'Publisher', value: game.publisher!),
      if (game.franchise != null && game.franchise!.isNotEmpty)
        _DetailRow(label: 'Franchise', value: game.franchise!),
      if (game.year != null) _DetailRow(label: 'Year', value: '${game.year}'),
      if (game.region != null && game.region!.isNotEmpty)
        _DetailRow(label: 'Region', value: game.region!),
      if (game.rating != null)
        _DetailRow(
          label: 'Rating',
          value: '${game.rating!.toStringAsFixed(1)} / 5',
        ),
      _DetailRow(label: 'File', value: game.fileName),
      if (game.sizeBytes > 0)
        _DetailRow(label: 'Size', value: _formatBytes(game.sizeBytes)),
      _canSelectCore(game)
          ? _CoreDetailRow(game: game, onTap: onSelectCore)
          : _DetailRow(label: 'Core', value: _coreLabel(game.core)),
      _DetailRow(label: 'Save state', value: hasSave ? 'Found' : 'None'),
      if (game.bios.isNotEmpty)
        _DetailRow(
          label: 'BIOS',
          value: game.bios.map((b) => b.fileName).join(', '),
        ),
    ];

    return adaptiveGlass(
      context: context,
      fallbackColor: const Color(0x14FFFFFF),
      cornerRadius: 14,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        ),
      ),
    );
  }
}

class _CoreDetailRow extends StatelessWidget {
  const _CoreDetailRow({required this.game, required this.onTap});

  final GameDetail game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final recommended = game.recommendedCore;
    final subtitle = recommended == null || recommended == game.core
        ? null
        : 'Recommended: ${_coreLabel(recommended)}';
    return FocusableButton(
      padding: EdgeInsets.zero,
      borderRadius: 8,
      semanticLabel: 'Core, ${_coreLabel(game.core)}',
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 96,
              child: Text(
                'Core',
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _coreLabel(game.core),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white60, size: 18),
          ],
        ),
      ),
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

/// The core-picker button's fill: same green/blue hues [_BackendPill] uses
/// for native/WebView, so the two stay visually paired, but solid rather than
/// tinted so the button reads as clickable the way [FilledButton] does.
Color _coreButtonFillColor(bool native) =>
    native ? const Color(0xFF2E9E6B) : const Color(0xFF2E74E0);

/// Hidden when there is only one supported per-game player/core outcome. A
/// backend choice and an arcade-core choice are separate capabilities: normal
/// console games only write the former, while arcade games may write both.
bool _canSelectCore(GameDetail game) => _buildCoreRows(game).length > 1;

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white60, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

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
