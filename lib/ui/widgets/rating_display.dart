import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/rating_icon_provider.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/tv_ui_scale.dart';

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

  /// Keeps the ratings on one line, scaled down to fit, instead of wrapping.
  final bool singleLine;

  /// The classic home info area's one line chips, with any label inline after
  /// the value. Implies [singleLine].
  final bool inlineChips;

  /// Frost's strip: a column per source, its name small over its score, with
  /// a hairline between them.
  final bool columns;

  /// Grows the strip's text, for a TV where it's read from across the room.
  final double columnTextScale;

  /// Centers each line of a wrapping row under a centered title.
  final bool centered;

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
    this.singleLine = false,
    this.inlineChips = false,
    this.columns = false,
    this.columnTextScale = 1,
    this.centered = false,
  });

  /// Null when there is nothing to draw, so the caller skips its spacing too.
  ///
  /// Drops scores outside their scale, since the server returns a zero for an
  /// unrated item, and draws nothing at all in Kids Mode. A screen with no room
  /// for the sources' names passes [labels] false.
  static Widget? forDetailScreen({
    required AggregatedItem item,
    required Map<String, double> extraRatings,
    required UserPreferences prefs,
    bool labels = true,
    bool columns = false,
    double columnTextScale = 1,
    bool centered = false,
  }) {
    if (!prefs.effectiveShowDetailRatings) return null;

    final community = _inScale(item.communityRating, 10);
    final critic = _inScale(item.criticRating?.toDouble(), 100);

    if (extraRatings.isEmpty &&
        community == null &&
        critic == null &&
        item.personalRating == null) {
      return null;
    }

    return RatingsRow(
      ratings: extraRatings,
      communityRating: community,
      criticRating: critic?.round(),
      personalRating: item.personalRating,
      enableAdditionalRatings: prefs.get(
        UserPreferences.enableAdditionalRatings,
      ),
      enabledRatings: prefs.get(UserPreferences.enabledRatings),
      showLabels: labels && prefs.get(UserPreferences.showRatingLabels),
      showBadges: prefs.get(UserPreferences.showRatingBadges),
      columns: columns,
      columnTextScale: columnTextScale,
      centered: centered,
    );
  }

  static double? _inScale(double? rating, double max) {
    if (rating == null || !rating.isFinite || rating <= 0 || rating > max) {
      return null;
    }
    return rating;
  }

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

    if (columns) return _columns(filtered.take(7), columnTextScale);

    final children = [
      for (final item in filtered)
        _SingleRating(
          source: item.key,
          value: item.value,
          valueText: item.key == 'personal'
              ? _formatPersonal(item.value)
              : null,
          showLabel: showLabels,
          showBadge: showBadges,
          inline: inlineChips,
        ),
    ];

    if (singleLine || inlineChips) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: inlineChips ? tvPx(10) : 6,
          children: children,
        ),
      );
    }

    return Wrap(
      alignment: centered ? WrapAlignment.center : WrapAlignment.start,
      spacing: 6,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }
}

/// One column per source. With no width to share, as in a row that
/// scrolls, each column is as wide as its text.
Widget _columns(Iterable<MapEntry<String, double>> ratings, double scale) =>
    LayoutBuilder(
      builder: (context, constraints) {
        final share = constraints.hasBoundedWidth;
        final muted = AppColorScheme.onBackground.withValues(alpha: 0.6);
        return IntrinsicHeight(
          child: Row(
            mainAxisSize: share ? MainAxisSize.max : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final (index, entry) in ratings.indexed)
                _ratingCell(
                  share,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: index == 0
                          ? null
                          : Border(
                              left: BorderSide(
                                color: AppColorScheme.onBackground.withValues(
                                  alpha: 0.14,
                                ),
                              ),
                            ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: share ? 4 : 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            RatingIconProvider.sourceDisplayName(entry.key)
                                .toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: muted,
                              fontSize: 10 * scale,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            entry.key == 'personal'
                                ? RatingsRow._formatPersonal(entry.value)
                                : RatingIconProvider.formatRating(
                                    entry.key,
                                    entry.value,
                                  ),
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColorScheme.onBackground.withValues(
                                alpha: 0.92,
                              ),
                              fontSize: 22 * scale,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );

Widget _ratingCell(bool share, Widget child) =>
    share ? Expanded(child: child) : child;

class _SingleRating extends StatelessWidget {
  final String source;
  final double value;

  /// Pre-formatted display text, for sources whose format depends on more
  /// than the value. Null falls back to the standard per-source format.
  final String? valueText;
  final bool showLabel;
  final bool showBadge;
  final bool inline;

  const _SingleRating({
    required this.source,
    required this.value,
    this.valueText,
    this.showLabel = true,
    this.showBadge = true,
    this.inline = false,
  });

  Widget _buildInline() {
    final valueText =
        this.valueText ?? RatingIconProvider.formatRating(source, value);
    final shadows = showBadge ? null : _textShadows;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      spacing: tvPx(8),
      children: [
        if (source == 'stars' || source == 'personal')
          Text(
            '\u2605',
            style: TextStyle(
              color: source == 'personal'
                  ? AppColorScheme.accent
                  : const Color(0xFFFFC107),
              fontSize: tvPx(28),
              height: 1,
              shadows: shadows,
            ),
          )
        else
          _RatingIcon(source: source, value: value, height: tvPx(28)),
        Text(
          valueText,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: tvPx(24),
            fontWeight: FontWeight.w700,
            height: 1,
            shadows: shadows,
          ),
        ),
        if (showLabel)
          Text(
            RatingIconProvider.sourceDisplayName(source),
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: tvPx(18),
              fontWeight: FontWeight.w500,
              height: 1,
              shadows: shadows,
            ),
          ),
      ],
    );
    if (!showBadge) return content;

    final chipBorder = ThemeRegistry.active.borders.chipBorder;
    return Container(
      height: tvPx(40),
      padding: EdgeInsets.symmetric(horizontal: tvPx(12)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorScheme.scrim.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(tvPx(8)),
        border: chipBorder.color.a > 0.5
            ? Border.fromBorderSide(
                chipBorder.copyWith(color: AppColorScheme.accent),
              )
            : null,
      ),
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (inline) return _buildInline();
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
