import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/aggregated_item.dart';
import '../../preference/user_preferences.dart';
import '../../util/overview_text.dart';
import '../../util/platform_detection.dart';
import '../../util/playback_time_label.dart';
import '../../util/tv_ui_scale.dart';
import 'bounded_network_image.dart';
import 'rating_display.dart';
import 'simple_info_row.dart';

const _panelFill = Color(0xFF101218);
const _textShadows = [Shadow(blurRadius: 4, color: Colors.black54)];

/// Converts a length drawn for a 1920 wide TV into this platform's units.
double _carouselUnit(double desktopScale) => PlatformDetection.isTV
    ? desktopScale / kTvTargetScale
    : 0.64 * desktopScale;

double carouselPanelHeight(double desktopScale) =>
    PlatformDetection.useMobileUi ? 230.0 : 500.0 * _carouselUnit(desktopScale);

/// Space between a Carousel row's cards and its panel.
double carouselPanelGap(double desktopScale) =>
    PlatformDetection.useMobileUi ? 12.0 : 24.0 * _carouselUnit(desktopScale);

/// The details panel under a Carousel row's cards, showing the row's focused
/// item over its backdrop. With no backdrop the panel stays empty and
/// translucent.
class CarouselPanel extends StatelessWidget {
  const CarouselPanel({
    super.key,
    required this.item,
    required this.desktopScale,
    this.backdropUrl,
    this.ratings,
    this.showOverview = true,
    this.mediaBadges = const [],
  });

  final AggregatedItem item;
  final double desktopScale;
  final String? backdropUrl;
  final Widget? ratings;
  final bool showOverview;
  final List<String> mediaBadges;

  /// Home's ratings for [item], following the home row ratings settings, or
  /// null when it has none.
  static Widget? homeRatings(
    AggregatedItem item,
    UserPreferences prefs, {
    Map<String, double> additionalRatings = const {},
  }) {
    if (item.communityRating == null &&
        item.criticRating == null &&
        additionalRatings.isEmpty) {
      return null;
    }
    final settings = UserPreferences.homeRowsRatings;
    return RatingsRow(
      ratings: additionalRatings,
      communityRating: item.communityRating,
      criticRating: item.criticRating,
      personalRating: item.personalRating,
      enableAdditionalRatings: prefs.get(settings.additionalRatings),
      enabledRatings: prefs.get(settings.sources),
      showLabels: prefs.get(settings.labels),
      showBadges: prefs.get(settings.badges),
      // A phone's panel is too narrow to shrink every source onto one line.
      singleLine: !PlatformDetection.useMobileUi,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobile = PlatformDetection.useMobileUi;
    final u = _carouselUnit(desktopScale);
    double px(double tv, double phone) => mobile ? phone : tv * u;
    final backdrop = backdropUrl;
    final hasBackdrop = backdrop != null && backdrop.isNotEmpty;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: hasBackdrop ? _panelFill : Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(px(28, 16)),
        border: Border.all(
          color: Colors.white.withValues(alpha: hasBackdrop ? 0.08 : 0.12),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Stack(
            fit: StackFit.expand,
            children: [
              if (hasBackdrop) ...[
                // Kept off the panel's top and bottom edge pixels, where the
                // rounded clip's anti-aliasing lets the picture bleed through
                // the solid scrim as a bright line.
                Positioned(
                  top: 1,
                  bottom: 1,
                  right: 0,
                  width: mobile ? width : width * 0.7,
                  child: BoundedNetworkImage(
                    imageUrl: backdrop,
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, 0.25),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: mobile
                          ? [
                              _panelFill.withValues(alpha: 0.92),
                              _panelFill.withValues(alpha: 0.75),
                              _panelFill.withValues(alpha: 0.35),
                            ]
                          : [
                              _panelFill,
                              _panelFill,
                              _panelFill.withValues(alpha: 0.9),
                              _panelFill.withValues(alpha: 0.5),
                              _panelFill.withValues(alpha: 0),
                            ],
                      stops: mobile
                          ? const [0, 0.55, 1]
                          : const [0, 0.34, 0.46, 0.6, 0.78],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        _panelFill.withValues(alpha: 0.7),
                        _panelFill.withValues(alpha: 0),
                      ],
                      stops: const [0, 0.35],
                    ),
                  ),
                ),
              ],
              Padding(
                padding: EdgeInsets.symmetric(horizontal: px(72, 16)),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: mobile ? double.infinity : width * 0.54,
                    // Many rating sources can wrap past a phone's panel, so
                    // the details clip at its bottom rather than overflow.
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: _details(px),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _details(double Function(double, double) px) {
    final isEpisode = item.type == 'Episode';
    final title = isEpisode && (item.seriesName ?? '').isNotEmpty
        ? item.seriesName!
        : item.name;
    final lead = isEpisode ? SimpleInfoRow.episodeLead(item) : '';
    final info = _infoParts();
    final overview = item.overview ?? '';
    final ratings = this.ratings;
    final onSurface = AppColorScheme.onSurface;

    TextStyle text(double size, double alpha, FontWeight weight) => TextStyle(
      fontSize: size,
      height: 1.25,
      fontWeight: weight,
      color: onSurface.withValues(alpha: alpha),
      shadows: _textShadows,
    );

    final children = <Widget>[
      Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: text(
          px(66, 24),
          1,
          FontWeight.w700,
        ).copyWith(height: 1.05, letterSpacing: -px(1.3, 0.4)),
      ),
      if (lead.isNotEmpty) ...[
        SizedBox(height: px(10, 4)),
        Text(
          lead,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: text(px(26, 15), 1, FontWeight.w600),
        ),
      ],
      if (info.isNotEmpty) ...[
        SizedBox(height: px(14, 6)),
        _separated(
          [
            for (final part in info)
              part.pill
                  ? _pill(part.text, px)
                  : Text(
                      part.text,
                      style: text(px(21, 13), 0.84, FontWeight.w500),
                    ),
          ],
          Text('•', style: text(px(21, 13), 0.45, FontWeight.w500)),
          px(12, 6),
        ),
      ],
      // Ratings get their own line, which shrinks to fit, since MDBList can
      // bring eight or more sources.
      if (ratings != null) ...[
        SizedBox(height: px(16, 8)),
        Align(alignment: AlignmentDirectional.centerStart, child: ratings),
      ],
      if (mediaBadges.isNotEmpty) ...[
        SizedBox(height: px(12, 6)),
        _clippedRow([
          for (var i = 0; i < mediaBadges.length; i++) ...[
            if (i > 0) SizedBox(width: px(8, 4)),
            _pill(mediaBadges[i], px),
          ],
        ]),
      ],
      if (showOverview && overview.isNotEmpty) ...[
        SizedBox(height: px(20, 8)),
        Text(
          cleanOverview(overview),
          maxLines: PlatformDetection.useMobileUi ? 2 : 3,
          overflow: TextOverflow.ellipsis,
          style: text(px(20, 13), 0.8, FontWeight.w400).copyWith(height: 1.5),
        ),
      ],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  List<({String text, bool pill})> _infoParts() {
    final parts = <({String text, bool pill})>[];
    final year = item.productionYear;
    if (year != null) parts.add((text: '$year', pill: false));
    final rating = item.officialRating;
    if (rating != null && rating.isNotEmpty) {
      parts.add((text: rating, pill: true));
    }
    final runtime = item.runtime;
    if (runtime != null && runtime.inMinutes > 0 && item.type != 'Series') {
      parts.add((text: formatRuntimeShort(runtime), pill: false));
    }
    final genres = item.genres;
    if (genres.isNotEmpty) {
      parts.add((text: genres.take(3).join(', '), pill: false));
    }
    return parts;
  }

  Widget _separated(List<Widget> items, Widget dot, double gap) {
    return _clippedRow([
      for (var i = 0; i < items.length; i++) ...[
        if (i > 0) ...[SizedBox(width: gap), dot, SizedBox(width: gap)],
        items[i],
      ],
    ]);
  }

  /// One line, cut off at the edge rather than wrapped.
  Widget _clippedRow(List<Widget> children) {
    return UnconstrainedBox(
      alignment: AlignmentDirectional.centerStart,
      constrainedAxis: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }

  Widget _pill(String label, double Function(double, double) px) {
    final borders = ThemeRegistry.active.borders;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: px(10, 6), vertical: px(3, 1)),
      decoration: BoxDecoration(
        color: borders.chipBackground,
        border: Border.fromBorderSide(borders.chipBorder),
        borderRadius: borders.chipRadius,
      ),
      child: Text(
        label,
        maxLines: 1,
        style: TextStyle(
          fontSize: px(17, 11),
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: AppColorScheme.onSurface.withValues(alpha: 0.85),
          shadows: _textShadows,
        ),
      ),
    );
  }
}
