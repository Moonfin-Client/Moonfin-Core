import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    show HttpExceptionWithStatus;
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/game_artwork_cache.dart';
import '../bounded_network_image.dart';
import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_data_source.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';
import 'game_poster_card.dart';
import 'retro_artwork_image.dart';

/// A titled horizontal row of game box art (one system's games, or a "more like this" rail).
class GamePosterRail extends StatelessWidget {
  const GamePosterRail({
    super.key,
    required this.title,
    required this.games,
    required this.artworkScope,
    required this.artworkDataSource,
    required this.retroArtworkTransport,
    required this.retroArtworkActivityGate,
    required this.onTapGame,
    this.trailingCount,
    this.cardWidth = 108,
    this.autofocusFirst = false,
  });

  final String title;

  final List<GameSummary> games;
  final String artworkScope;
  final RetroArtworkDataSource? artworkDataSource;
  final RetroArtworkTransport? retroArtworkTransport;
  final RetroArtworkActivityGate? retroArtworkActivityGate;
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
            itemBuilder: (context, i) {
              final game = games[i];
              final reference = artworkDataSource?.imageFor(
                game.id,
                role: 'boxart',
              );
              final source = reference?.source;
              final transport = retroArtworkTransport;
              final gate = retroArtworkActivityGate;
              return GamePosterCard(
                imageUrl: reference?.legacyUrl,
                artwork: source == null || transport == null || gate == null
                    ? null
                    : RetroArtworkImage(
                        source: source,
                        transport: transport,
                        activityGate: gate,
                        // Decode to the pixels actually painted, the rule the
                        // rest of the app's bounded images already follow.
                        maxDecodeWidth: BoundedNetworkImage.cacheWidthFor(
                          cardWidth,
                          MediaQuery.devicePixelRatioOf(context),
                        ),
                        fit: BoxFit.cover,
                        onLoadFinished: () => artworkDataSource
                            ?.reportImageLoaded(game.id, role: 'boxart'),
                        errorBuilder: (_, error) {
                          artworkDataSource?.reportImageFailure(
                            game.id,
                            role: 'boxart',
                            statusCode: _artworkStatusCode(error),
                          );
                          return const SizedBox.shrink();
                        },
                      ),
                title: game.title,
                fileName: game.fileName,
                seed: game.id,
                width: cardWidth,
                autofocus: autofocusFirst && i == 0,
                focusColor: focusColor,
                cardFocusExpansion: cardFocusExpansion,
                suppressFocusGlow: isNeon,
                cacheManager: gameArtworkCacheManagerForScope(artworkScope),
                loadArtwork: reference != null,
                onArtworkLoadFinished: () => artworkDataSource
                    ?.reportImageLoaded(game.id, role: 'boxart'),
                onArtworkError: (error) =>
                    artworkDataSource?.reportImageFailure(
                      game.id,
                      role: 'boxart',
                      statusCode: _artworkStatusCode(error),
                    ),
                onTap: () => onTapGame(game),
              );
            },
          ),
        ),
      ],
    );
  }
}

int? _artworkStatusCode(Object error) {
  if (error is DioException) return error.response?.statusCode;
  if (error is HttpExceptionWithStatus) return error.statusCode;
  return null;
}
