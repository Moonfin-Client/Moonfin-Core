import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../navigation/destinations.dart';
import '../shared/immersive_poster_card.dart';

class ImmersiveDiscoveryCard extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final double width;
  final bool isFocused;

  const ImmersiveDiscoveryCard({
    super.key,
    required this.item,
    required this.imageApi,
    required this.prefs,
    required this.width,
    required this.isFocused,
  });

  static const double _aspectRatio = 2 / 3;

  static const Color _seerrColor = Color(0xFF615FFF);

  static void openItem(BuildContext context, AggregatedItem item) {
    if (item.serverId == 'seerr') {
      final mediaType =
          item.seerrMediaType ?? (item.type == 'Series' ? 'tv' : 'movie');

      context.push(Destinations.seerrMedia(item.id, mediaType: mediaType));

      return;
    }

    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  bool _isPhonePortrait(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return size.height > size.width && size.width < 600;
  }

  bool get _isSeerr => item.serverId == 'seerr';

  String? _imageUrl() {
    final tag = item.primaryImageTag;

    if (tag != null) {
      return imageApi.getPrimaryImageUrl(item.id, maxHeight: 750, tag: tag);
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

  Widget? _buildSeerrBadge(BuildContext context) {
    if (!_isSeerr) {
      return null;
    }

    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: _seerrColor.withValues(alpha: 0.92),
        borderRadius: AppRadius.circular(999),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.14),
          width: 0.75,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.20),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        l10n.seerr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          height: 1,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final phonePortrait = _isPhonePortrait(context);

    final posterHeight = width / _aspectRatio;

    final title = item.name.trim();

    final poster = ImmersivePosterCard(
      imageUrl: _imageUrl(),
      title: title,
      width: width,
      height: posterHeight,
      isFocused: isFocused,
      isFavorite: item.isFavorite,
      isPlayed: _showPlayedIndicator(),
      progress: _progress,
      placeholderIcon: Icons.movie_outlined,
      topRightOverlay: _buildSeerrBadge(context),
      onTap: () {
        openItem(context, item);
      },
    );

    if (!phonePortrait) {
      return poster;
    }

    final foreground = AppColorScheme.onSurface;

    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        openItem(context, item);
      },
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            poster,

            const SizedBox(height: 9),

            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: foreground.withValues(alpha: 0.94),
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  height: 1.22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
