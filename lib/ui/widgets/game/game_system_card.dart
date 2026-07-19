import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../util/game_library.dart';
import '../bounded_network_image.dart';
import '../focus/focusable_wrapper.dart';

/// A focusable, artwork-backed platform tile used at the root of a retro-game
/// library.
class GameSystemCard extends StatelessWidget {
  const GameSystemCard({
    super.key,
    required this.libraryId,
    required this.system,
    required this.games,
    required this.onTap,
    this.autofocus = false,
  });

  final String libraryId;
  final GameSystem system;
  final List<GameSummary> games;
  final VoidCallback onTap;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final seedColor = gameFallbackColor(system.id);
    final countLabel = games.length == 1 ? '1 game' : '${games.length} games';

    return FocusableWrapper(
      autofocus: autofocus,
      autoScroll: true,
      borderRadius: 14,
      semanticLabel: '${system.name}, $countLabel',
      onSelect: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: seedColor,
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _SystemArtworkStrip(
                libraryId: libraryId,
                games: games.take(4).toList(growable: false),
                fallbackColor: seedColor,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.86),
                      Colors.black.withValues(alpha: 0.58),
                      Colors.black.withValues(alpha: 0.18),
                    ],
                    stops: const [0, 0.52, 1],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.34),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.sports_esports,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            system.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 5),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            countLabel,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.76),
                              fontSize: 13,
                              shadows: const [
                                Shadow(color: Colors.black, blurRadius: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white.withValues(alpha: 0.72),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SystemArtworkStrip extends StatelessWidget {
  const _SystemArtworkStrip({
    required this.libraryId,
    required this.games,
    required this.fallbackColor,
  });

  final String libraryId;
  final List<GameSummary> games;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return ColoredBox(
        color: Color.lerp(fallbackColor, AppColorScheme.background, 0.28)!,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final game in games)
          Expanded(
            child: _SystemGameArtwork(
              imageUrl: gameThumbUrl(libraryId, game.id),
              fallbackColor: gameFallbackColor(game.id),
            ),
          ),
      ],
    );
  }
}

class _SystemGameArtwork extends StatelessWidget {
  const _SystemGameArtwork({
    required this.imageUrl,
    required this.fallbackColor,
  });

  final String? imageUrl;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null) return _fallback();

    return BoundedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      maxWidth: 320,
      errorBuilder: (_, _, _) => _fallback(),
    );
  }

  Widget _fallback() {
    return ColoredBox(
      color: fallbackColor,
      child: const Center(
        child: Icon(Icons.videogame_asset, color: Colors.white54, size: 26),
      ),
    );
  }
}
