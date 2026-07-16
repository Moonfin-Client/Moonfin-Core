import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../navigation/destinations.dart';
import '../../widgets/game/game_poster_rail.dart';
import '../../../util/platform_detection.dart';

/// Browses a retro-game library as premium per-system box-art rows. Tapping a game opens the
/// game detail screen. Responsive card sizing across mobile, desktop, and TV (d-pad focus).
class GameLibraryScreen extends StatefulWidget {
  const GameLibraryScreen({super.key, required this.libraryId, this.title});

  final String libraryId;
  final String? title;

  @override
  State<GameLibraryScreen> createState() => _GameLibraryScreenState();
}

class _GameLibraryScreenState extends State<GameLibraryScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();

  bool _loading = true;
  String? _error;
  List<GameSystem> _systems = const [];
  Map<String, List<GameSummary>> _gamesBySystem = const {};

  @override
  void initState() {
    super.initState();
    _load();
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
      final systems = await games.getSystems(widget.libraryId);
      final all = await games.getGames(widget.libraryId);
      final grouped = <String, List<GameSummary>>{};
      for (final g in all) {
        grouped.putIfAbsent(g.system, () => <GameSummary>[]).add(g);
      }
      if (!mounted) return;
      setState(() {
        _systems = systems;
        _gamesBySystem = grouped;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load games: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Games')),
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
    if (_systems.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No games found.\n\nOrganize ROMs as System/<game>/rom.ext in a Mixed Content '
            'library, and enable Retro Games in the Moonbase plugin settings.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final cardWidth = PlatformDetection.isTV
        ? 132.0
        : (PlatformDetection.useDesktopUi ? 120.0 : 100.0);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: _systems.length,
      itemBuilder: (context, index) {
        final system = _systems[index];
        final games = _gamesBySystem[system.id] ?? const [];
        if (games.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GamePosterRail(
            title: system.name,
            libraryId: widget.libraryId,
            games: games,
            trailingCount: games.length,
            cardWidth: cardWidth,
            autofocusFirst: index == 0,
            onTapGame: (game) => context.push(
              Destinations.gameDetailOf(widget.libraryId, game.id),
            ),
          ),
        );
      },
    );
  }
}
