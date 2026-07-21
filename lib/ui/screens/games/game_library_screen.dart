import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
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
    with GridFocusNodeMixin<GameLibraryScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final UserPreferences _prefs = GetIt.instance<UserPreferences>();

  bool _loading = true;
  bool _hasError = false;
  List<GameSystem> _systems = const [];
  Map<String, List<GameSummary>> _gamesBySystem = const {};
  Map<String, int> _gameCountsBySystem = const {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
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

    // Begin optional previews immediately, but do not make them part of the
    // critical path for rendering the system list.
    final previewsFuture = _loadPreviews(games);
    try {
      final systems = await games.getSystems(widget.libraryId);
      if (!mounted) return;
      setState(() {
        _systems = systems;
        _gamesBySystem = const {};
        _gameCountsBySystem = {
          for (final system in systems)
            if (system.gameCount > 0) system.id.toLowerCase(): system.gameCount,
        };
        _loading = false;
      });

      final previews = await previewsFuture;
      if (!mounted || previews == null) return;
      final populatedSystems = systems
          .where(
            (system) => (previews.counts[system.id.toLowerCase()] ?? 0) > 0,
          )
          .toList(growable: false);
      setState(() {
        _systems = populatedSystems;
        _gamesBySystem = previews.games;
        _gameCountsBySystem = previews.counts;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) cleanupGridFocusNodes(populatedSystems.length);
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

  Future<_GameSystemPreviews?> _loadPreviews(GamesApi gamesApi) async {
    try {
      final allGames = await gamesApi.getGames(widget.libraryId);
      final previews = <String, List<GameSummary>>{};
      final counts = <String, int>{};
      for (final game in allGames) {
        final key = game.system.toLowerCase();
        counts[key] = (counts[key] ?? 0) + 1;
        final systemPreviews = previews.putIfAbsent(key, () => <GameSummary>[]);
        if (systemPreviews.length < 4) systemPreviews.add(game);
      }
      return _GameSystemPreviews(games: previews, counts: counts);
    } catch (e) {
      debugPrint('[GameLibraryScreen] Failed to load system previews: $e');
      return null;
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
              libraryId: widget.libraryId,
              system: system,
              games: _gamesBySystem[system.id.toLowerCase()] ?? const [],
              gameCount:
                  _gameCountsBySystem[system.id.toLowerCase()] ??
                  (system.gameCount > 0 ? system.gameCount : null),
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

class _GameSystemPreviews {
  const _GameSystemPreviews({required this.games, required this.counts});

  final Map<String, List<GameSummary>> games;
  final Map<String, int> counts;
}
