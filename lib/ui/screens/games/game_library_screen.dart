import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

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
      // Start both requests together. Platform tiles use a small selection of
      // their games for artwork, while the platform screen remains responsible
      // for displaying the complete game grid.
      final systemsFuture = games.getSystems(widget.libraryId);
      final allGamesFuture = games.getGames(widget.libraryId);
      final (systems, allGames) = await (systemsFuture, allGamesFuture).wait;
      final grouped = <String, List<GameSummary>>{};
      for (final game in allGames) {
        grouped
            .putIfAbsent(game.system.toLowerCase(), () => <GameSummary>[])
            .add(game);
      }
      final populatedSystems = systems
          .where(
            (system) => grouped[system.id.toLowerCase()]?.isNotEmpty == true,
          )
          .toList(growable: false);
      if (!mounted) return;
      setState(() {
        _systems = populatedSystems;
        _gamesBySystem = grouped;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load game platforms: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 600;
        final horizontalPadding = compact ? 16.0 : 48.0;
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            20,
            horizontalPadding,
            32,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: compact ? 360 : 320,
            mainAxisExtent: compact ? 116 : 126,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
          ),
          itemCount: _systems.length,
          itemBuilder: (context, index) {
            final system = _systems[index];
            return GameSystemCard(
              libraryId: widget.libraryId,
              system: system,
              games: _gamesBySystem[system.id.toLowerCase()] ?? const [],
              autofocus: PlatformDetection.isTV && index == 0,
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
