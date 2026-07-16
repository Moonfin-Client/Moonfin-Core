import 'package:flutter/material.dart';
import 'package:server_core/server_core.dart';

import '../../../util/game_library.dart';
import 'game_poster_card.dart';

/// A titled horizontal row of game box art (one system's games, or a "more like this" rail).
class GamePosterRail extends StatelessWidget {
  const GamePosterRail({
    super.key,
    required this.title,
    required this.libraryId,
    required this.games,
    required this.onTapGame,
    this.trailingCount,
    this.cardWidth = 108,
    this.autofocusFirst = false,
  });

  final String title;

  /// The library the games belong to, needed to ask the server for their art.
  final String libraryId;
  final List<GameSummary> games;
  final void Function(GameSummary game) onTapGame;

  /// Optional count shown next to the title (e.g. games in a system).
  final int? trailingCount;
  final double cardWidth;
  final bool autofocusFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailingCount != null)
                Text(
                  '$trailingCount',
                  style: const TextStyle(color: Colors.white38, fontSize: 13),
                ),
            ],
          ),
        ),
        SizedBox(
          height: cardWidth * 1.34 + 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: games.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, i) => GamePosterCard(
              imageUrl: gameThumbUrl(libraryId, games[i].id),
              title: games[i].title,
              fileName: games[i].fileName,
              seed: games[i].id,
              width: cardWidth,
              autofocus: autofocusFirst && i == 0,
              onTap: () => onTapGame(games[i]),
            ),
          ),
        ),
      ],
    );
  }
}
