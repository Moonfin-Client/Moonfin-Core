import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/rating_icon_provider.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

final _textShadows = [
  Shadow(blurRadius: 4, color: AppColors.black.withValues(alpha: 0.54)),
];
const _coreRatingSources = {'tomatoes', 'stars', 'personal'};

String _normalizeRatingSource(String source) {
  return source == 'popcorn' ? 'tomatoes_audience' : source;
}

/// An episode's TMDB rating keeps its own key because it's scored out of 10
/// rather than 100, but the picker only offers TMDB, so it follows that choice.
String _selectionSource(String source) {
  return source == 'tmdb_episode' ? 'tmdb' : source;
}

class RatingsRow extends StatelessWidget {
  final Map<String, double> ratings;
  final double? communityRating;
  final int? criticRating;

  /// The viewer's own rating for this item, out of 10, shown under the
  /// 'personal' source. Null hides the slot, so an unrated item costs nothing.
  final double? personalRating;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;

  const RatingsRow({
    super.key,
    required this.ratings,
    this.communityRating,
    this.criticRating,
    this.personalRating,
    this.enableAdditionalRatings = false,
    this.enabledRatings = 'stars,imdb,tmdb,tomatoes,metacritic',
    this.showLabels = true,
    this.showBadges = true,
  });

  /// The viewer picked how ratings read on the detail screen, so the row
  /// speaks the same dialect: five-star users see their score out of five.
  static String _formatPersonal(double value) {
    var style = PersonalRatingStyle.numeric;
    if (GetIt.instance.isRegistered<UserPreferences>()) {
      style = GetIt.instance<UserPreferences>().get(
        UserPreferences.personalRatingStyle,
      );
    }
    if (style == PersonalRatingStyle.stars) {
      return '${(value / 2).toStringAsFixed(1)}/5';
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = enabledRatings
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map(_normalizeRatingSource)
        .toSet();

    final allRatings = <String, double>{};

    if (personalRating != null) {
      allRatings['personal'] = personalRating!;
    }

    if (communityRating != null) {
      allRatings['stars'] = communityRating!;
    }

    for (final entry in ratings.entries) {
      final source = _normalizeRatingSource(entry.key);
      // The server's own rating wins over a fetched one for the same slot.
      if (source == 'tomatoes' && criticRating != null) continue;
      if (source == 'stars' && communityRating != null) continue;
      allRatings[source] = entry.value;
    }

    if (!allRatings.containsKey('tomatoes') && criticRating != null) {
      allRatings['tomatoes'] = criticRating!.toDouble();
    }

    if (allRatings.isEmpty) return const SizedBox.shrink();

    final filtered = allRatings.entries.where((e) {
      final source = _selectionSource(e.key);
      // The picker belongs to the extra ratings, so with those off it stops
      // applying and the server's own ratings still show.
      if (!enableAdditionalRatings) return _coreRatingSources.contains(source);
      return enabled.contains(source);
    }).toList();

    final enabledList = enabledRatings
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
      .map(_normalizeRatingSource)
        .toList();
    final enabledOrder = {
      for (var i = 0; i < enabledList.length; i++) enabledList[i]: i,
    };
    // A personal rating outside the picker order leads the row rather than
    // trailing it, since the viewer's own score is the one they chose to set.
    int orderOf(String key) {
      final source = _selectionSource(key);
      return enabledOrder[source] ?? (source == 'personal' ? -1 : 999);
    }

    filtered.sort((a, b) => orderOf(a.key).compareTo(orderOf(b.key)));

    if (filtered.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 6,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final item in filtered)
          _SingleRating(
            source: item.key,
            value: item.value,
            valueText: item.key == 'personal'
                ? _formatPersonal(item.value)
                : null,
            showLabel: showLabels,
            showBadge: showBadges,
          ),
      ],
    );
  }
}

class _SingleRating extends StatelessWidget {
  final String source;
  final double value;

  /// Pre-formatted display text, for sources whose format depends on more
  /// than the value. Null falls back to the standard per-source format.
  final String? valueText;
  final bool showLabel;
  final bool showBadge;

  const _SingleRating({
    required this.source,
    required this.value,
    this.valueText,
    this.showLabel = true,
    this.showBadge = true,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isLargeLayout = media.size.width >= 1000 ||
        (media.orientation == Orientation.landscape && media.size.width >= 700);
    final valueText =
        this.valueText ?? RatingIconProvider.formatRating(source, value);
    final labelText = RatingIconProvider.sourceDisplayName(source);
    final valueFontSize = 14.0;
    final labelFontSize = isLargeLayout ? 9.0 : 8.0;
    final iconHeight = isLargeLayout ? 18.0 : 15.0;
    final starSize = isLargeLayout ? 16.0 : 14.0;

    final ratingContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (source == 'stars' || source == 'personal') ...[
              Text(
                '\u2605',
                style: TextStyle(
                  // The viewer's own star wears the accent so it never reads
                  // as another community score.
                  color: source == 'personal'
                      ? AppColorScheme.accent
                      : const Color(0xFFFFC107),
                  fontSize: starSize,
                  height: 1,
                  shadows: _textShadows,
                ),
              ),
              const SizedBox(width: 4),
            ] else ...[
              _RatingIcon(source: source, value: value, height: iconHeight),
              const SizedBox(width: 5),
            ],
            Text(
              valueText,
              style: TextStyle(
                color: AppColorScheme.onSurface,
                fontSize: valueFontSize,
                fontWeight: FontWeight.w700,
                height: 1,
                shadows: _textShadows,
              ),
            ),
          ],
        ),
        if (showLabel)
          Text(
            labelText,
            style: TextStyle(
              color: AppColorScheme.onSurface,
              fontSize: labelFontSize,
              fontWeight: FontWeight.w500,
              height: 1.1,
              shadows: _textShadows,
            ),
          ),
      ],
    );

    if (!showBadge) {
      return ratingContent;
    }

    final chipBorder = ThemeRegistry.active.borders.chipBorder;
    final badgeBorder = chipBorder.color.a > 0.5
        ? Border.fromBorderSide(chipBorder.copyWith(color: AppColorScheme.accent))
        : null;
    final badge = Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLargeLayout ? 8 : 6,
        vertical: isLargeLayout ? 4 : 3,
      ),
      decoration: BoxDecoration(
        color: AppColorScheme.scrim.withValues(alpha: 0.45),
        borderRadius: AppRadius.circular(4),
        border: badgeBorder,
      ),
      child: ratingContent,
    );
    return ClipRRect(borderRadius: AppRadius.circular(4), child: badge);
  }
}

class _RatingIcon extends StatelessWidget {
  final String source;
  final double value;
  final double height;

  const _RatingIcon({
    required this.source,
    required this.value,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    final assetPath = RatingIconProvider.getIconAssetPath(
      source,
      value.toInt(),
    );

    if (assetPath == null) return const SizedBox.shrink();

    return Image.asset(
      assetPath,
      height: height,
      filterQuality: FilterQuality.medium,
    );
  }
}
