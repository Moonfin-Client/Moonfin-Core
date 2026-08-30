import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../navigation/destinations.dart';
import '../shared/immersive_poster_card.dart';

class ImmersiveSeerrFilmographyCard extends StatelessWidget {
  final SeerrDiscoverItem item;

  final double width;
  final double height;

  final bool isFocused;
  final bool isCrew;

  final bool showCaption;
  final double captionGap;
  final double captionHeight;

  const ImmersiveSeerrFilmographyCard({
    super.key,
    required this.item,
    required this.width,
    required this.height,
    required this.isFocused,
    required this.isCrew,
    this.showCaption = false,
    this.captionGap = 9,
    this.captionHeight = 42,
  });

  static void openItem(BuildContext context, SeerrDiscoverItem item) {
    final mediaType = item.mediaType ?? 'movie';

    context.push(
      Destinations.seerrMedia(item.id.toString(), mediaType: mediaType),
    );
  }

  String? get _imageUrl {
    final posterPath = item.posterPath;

    if (posterPath == null || posterPath.isEmpty) {
      return null;
    }

    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String? get _subtitle {
    final value = isCrew ? item.job ?? item.department : item.character;

    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }

  @override
  Widget build(BuildContext context) {
    final title = item.displayTitle.trim();

    final poster = ImmersivePosterCard(
      imageUrl: _imageUrl,
      title: title,
      subtitle: _subtitle,
      width: width,
      height: height,
      isFocused: isFocused,
      placeholderIcon: Icons.movie_outlined,
      onTap: () {
        openItem(context, item);
      },
    );

    if (!showCaption) {
      return poster;
    }

    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;

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
              style: theme.textTheme.bodyMedium?.copyWith(
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
