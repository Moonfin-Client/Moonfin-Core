import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../navigation/destinations.dart';
import '../shared/immersive_poster_card.dart';

class ImmersiveFilmographyCard extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final UserPreferences prefs;

  final double width;
  final double height;

  final bool isFocused;
  final bool showCaption;

  final double captionGap;
  final double captionHeight;

  final ValueChanged<AggregatedItem>? onLongPress;

  const ImmersiveFilmographyCard({
    super.key,
    required this.item,
    required this.imageApi,
    required this.prefs,
    required this.width,
    required this.height,
    required this.isFocused,
    this.showCaption = false,
    this.captionGap = 9,
    this.captionHeight = 42,
    this.onLongPress,
  });

  static void openItem(BuildContext context, AggregatedItem item) {
    if (item.serverId == 'seerr') {
      final mediaType =
          item.seerrMediaType ?? (item.type == 'Series' ? 'tv' : 'movie');

      context.push(Destinations.seerrMedia(item.id, mediaType: mediaType));

      return;
    }

    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  String? _imageUrl() {
    final tag = item.primaryImageTag;

    if (tag != null && !item.id.startsWith('tmdb:')) {
      return imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: item.type == 'Episode' ? 420 : 750,
        tag: tag,
      );
    }

    if (item.type == 'Episode') {
      final backdropPath = item.rawData['BackdropPath'] as String?;

      if (backdropPath != null && backdropPath.isNotEmpty) {
        return 'https://image.tmdb.org/t/p/w780$backdropPath';
      }
    }

    final posterPath = item.rawData['PosterPath'] as String?;

    if (posterPath != null && posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

    return null;
  }

  double get _progress {
    final percentage = item.playedPercentage ?? 0;

    if (!percentage.isFinite) {
      return 0;
    }

    return (percentage / 100).clamp(0.0, 1.0).toDouble();
  }

  bool _showPlayedIndicator() {
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);

    return switch (watchedBehavior) {
      WatchedIndicatorBehavior.always => item.isPlayed,

      WatchedIndicatorBehavior.hideUnwatched => item.isPlayed,

      WatchedIndicatorBehavior.episodesOnly =>
        item.type == 'Episode' && item.isPlayed,

      WatchedIndicatorBehavior.never => false,
    };
  }

  @override
  Widget build(BuildContext context) {
    final title = item.name.trim();

    final poster = ImmersivePosterCard(
      imageUrl: _imageUrl(),
      title: title,
      subtitle: item.productionYear?.toString(),
      width: width,
      height: height,
      isFocused: isFocused,
      isFavorite: item.isFavorite,
      isPlayed: _showPlayedIndicator(),
      progress: _progress,
      placeholderIcon: item.type == 'Episode'
          ? Icons.tv_rounded
          : Icons.movie_outlined,
      onTap: () {
        openItem(context, item);
      },
      onLongPress: onLongPress == null
          ? null
          : () {
              onLongPress!.call(item);
            },
    );

    if (!showCaption) {
      return poster;
    }

    final textTheme = Theme.of(context).textTheme;

    final foreground = Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: width,
      height: height + captionGap + captionHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          poster,

          SizedBox(height: captionGap),

          SizedBox(
            width: width,
            height: captionHeight,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: foreground.withValues(alpha: 0.94),
                fontWeight: FontWeight.w600,
                height: 1.22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
