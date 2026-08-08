import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_cache.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../widgets/game/game_system_card.dart';

/// Displays the platforms in a retro-game library. Selecting a platform opens
/// its vertically scrolling, searchable game grid.
class GameLibraryScreen extends StatefulWidget {
  const GameLibraryScreen({super.key, required this.libraryId, this.title});

  final String libraryId;
  final String? title;

  @override
  State<GameLibraryScreen> createState() => _GameLibraryScreenState();
}

class _GameLibraryScreenState extends State<GameLibraryScreen>
    with GridFocusNodeMixin<GameLibraryScreen>, RouteAware {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final UserPreferences _prefs = GetIt.instance<UserPreferences>();

  bool _loading = true;
  bool _hasError = false;
  List<GameSystem> _systems = const [];
  RetroArtworkActivityGate? _retroArtworkActivityGate;
  RetroArtworkTransport? _retroArtworkTransport;
  String? _retroArtworkServerIdentity;
  ModalRoute<dynamic>? _observedRoute;
  bool _routeIsCovered = false;

  @override
  void initState() {
    super.initState();
    unawaited(_initializePreviewArtwork());
    _load();
  }

  Future<void> _initializePreviewArtwork() async {
    if (!GetIt.instance.isRegistered<RetroArtworkByteCache>() ||
        !GetIt.instance.isRegistered<RetroArtworkActivityGate>()) {
      // Widget tests and stripped-down embeddings can still use protocol 1.
      return;
    }
    final cache = await GetIt.instance.getAsync<RetroArtworkByteCache>();
    if (!mounted) return;
    final gate = GetIt.instance<RetroArtworkActivityGate>();
    _retroArtworkActivityGate = gate;
    _retroArtworkTransport = RetroArtworkTransport.forServer(
      client: _client,
      cache: cache,
      activityGate: gate,
    );
    _retroArtworkServerIdentity = normalizeRetroArtworkServerIdentity(
      _client.baseUrl,
    );
    if (mounted && !_routeIsCovered) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didPushNext() {
    _routeIsCovered = true;
    _retroArtworkTransport?.cancelAll();
  }

  @override
  void didPopNext() {
    _routeIsCovered = false;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    _retroArtworkTransport?.dispose();
    disposeGridFocusNodes();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _hasError = false;
    });
    final games = _client.gamesApi;
    if (games == null) {
      setState(() {
        _loading = false;
        _hasError = true;
      });
      return;
    }

    try {
      final systems = await games.getSystems(widget.libraryId);
      if (!mounted) return;
      setState(() {
        _systems = systems;
        _loading = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) cleanupGridFocusNodes(systems.length);
      });
    } catch (e) {
      debugPrint('[GameLibraryScreen] Failed to load systems: $e');
      if (!mounted) return;
      setState(() {
        _loading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      appBar: AppBar(title: Text(widget.title ?? l10n.games)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final l10n = AppLocalizations.of(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_hasError) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.failedToLoadLibrary, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: _load, child: Text(l10n.retry)),
            ],
          ),
        ),
      );
    }
    if (_systems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.noItemsFound, textAlign: TextAlign.center),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 600;
        final desktopScale = _prefs
            .get(UserPreferences.desktopUiScale)
            .scaleFactor;
        final layoutScale = compact ? 1.0 : desktopScale;
        final horizontalPadding = compact ? 16.0 : 48.0 * layoutScale;
        final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
        final focusColor = isNeon
            ? ThemeRegistry.active.borders.focusBorder.color
            : Color(_prefs.get(UserPreferences.focusColor).colorValue);
        final cardFocusExpansion = _prefs.get(
          UserPreferences.cardFocusExpansion,
        );
        final textScale = MediaQuery.textScalerOf(context).scale(1);
        final minimumCardHeight = (compact ? 116.0 : 126.0) * layoutScale;
        // Theme fonts can have line heights substantially above their nominal
        // size. Reserve enough growth for a two-line title and count rather
        // than relying on a font-specific multiplier.
        final cardHeight = minimumCardHeight + math.max(0, textScale - 1) * 96;
        final maximumCardWidth = (compact ? 360.0 : 320.0) * layoutScale;
        final spacing = 18 * layoutScale;
        final availableWidth = constraints.maxWidth - horizontalPadding * 2;
        final crossAxisCount =
            ((availableWidth + spacing) / (maximumCardWidth + spacing))
                .ceil()
                .clamp(1, 20);
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            20 * layoutScale,
            horizontalPadding,
            32 * layoutScale,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: cardHeight,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
          ),
          itemCount: _systems.length,
          itemBuilder: (context, index) {
            final system = _systems[index];
            return GameSystemCard(
              system: system,
              gameCount: system.gameCount,
              retroArtworkTransport: _routeIsCovered
                  ? null
                  : _retroArtworkTransport,
              retroArtworkActivityGate: _routeIsCovered
                  ? null
                  : _retroArtworkActivityGate,
              libraryId: widget.libraryId,
              serverIdentity: _retroArtworkServerIdentity,
              autofocus: PlatformDetection.isTV && index == 0,
              focusNode: getGridItemFocusNode(index, prefix: 'game_system'),
              focusColor: focusColor,
              cardFocusExpansion: cardFocusExpansion,
              suppressFocusGlow: isNeon,
              onKeyEvent: (_, event) {
                if (event.isActionable && event.logicalKey.isRightKey) {
                  final isLastColumn =
                      (index % crossAxisCount) == crossAxisCount - 1;
                  final isLastItem = index == _systems.length - 1;
                  if (isLastColumn || isLastItem) {
                    return KeyEventResult.handled;
                  }
                }
                return KeyEventResult.ignored;
              },
              onTap: () => context.push(
                Destinations.gameSystemOf(
                  widget.libraryId,
                  system.id,
                  systemName: system.name,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
