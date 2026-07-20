import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../preference/user_preferences.dart';
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
    final prefs = GetIt.instance<UserPreferences>();
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = isNeon
        ? ThemeRegistry.active.borders.focusBorder.color
        : Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final textScale = MediaQuery.textScalerOf(context).scale(1);
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
          height: cardWidth * 1.34 + 6 + 42 * textScale,
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
              focusColor: focusColor,
              cardFocusExpansion: cardFocusExpansion,
              suppressFocusGlow: isNeon,
              onTap: () => onTapGame(games[i]),
            ),
          ),
        ),
      ],
    );
  }
}
