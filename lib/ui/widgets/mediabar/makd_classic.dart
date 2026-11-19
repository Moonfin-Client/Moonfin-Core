import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../../../data/services/rating_icon_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/overview_text.dart';
import '../../../util/platform_detection.dart';
import '../../../util/playback_time_label.dart';
import '../offline_aware_image.dart';
import 'media_bar_new_release_label.dart';

/// Sizes for the MakD bar, which follows the Classic layout of makd's Jellyfin
/// Media Bar 6.1. The original sizes everything from the viewport and from
/// Jellyfin's root font (20px on TV, 14.88px on desktop, 14.4px on phones), so
/// this does the same from the screen.
class MakdMetrics {
  final double w;
  final double h;
  final bool tv;

  /// The original's touch layout, a portrait screen 767 wide or less.
  final bool touchPortrait;

  /// A phone held sideways, up to 1024 by 767.
  final bool smallLandscape;

  /// One CSS pixel. The TV canvas is narrower than the 1920 the original draws.
  final double px;
  final double rem;

  /// How far the first home row peeks up into the bar, or zero.
  final double rowPeek;

  /// Room a phone's toolbar or menu button takes above the content.
  final double topInset;

  factory MakdMetrics(Size screen, {double rowPeek = 0, double topInset = 0}) {
    final tv = PlatformDetection.isTV;
    final w = screen.width;
    final h = screen.height;
    final px = tv ? w / 1920 : 1.0;
    return MakdMetrics._(
      w: w,
      h: h,
      tv: tv,
      touchPortrait: !tv && w <= 767 && h > w,
      smallLandscape: !tv && w <= 1024 && h <= 767 && w > h,
      px: px,
      rem: tv ? 20 * px : (PlatformDetection.useMobileUi ? 14.4 : 14.88),
      rowPeek: rowPeek,
      topInset: topInset,
    );
  }

  const MakdMetrics._({
    required this.w,
    required this.h,
    required this.tv,
    required this.touchPortrait,
    required this.smallLandscape,
    required this.px,
    required this.rem,
    required this.rowPeek,
    required this.topInset,
  });

  bool get _wide => w >= 2560 * px;

  /// Where the home rows start.
  double get contentTop => h - rowPeek;

  /// Off TV the rows start where the original's do, 65% of the way down, or
  /// 68% on a phone held sideways.
  double get classicPeek => h * (smallLandscape ? 0.32 : 0.35);

  double get dotsReserve => math.max(0.025 * h, 1.75 * rem);

  double get gutter => (smallLandscape ? 0.05 : 0.04) * w;

  /// The content's bottom edge, from the top of the bar.
  double get contentBottom =>
      touchPortrait ? contentTop - 0.07 * h : contentTop - dotsReserve;

  double get contentWidth =>
      touchPortrait ? 0.92 * w : math.min(0.46 * w, 46 * rem);

  double get maxContentHeight => topInset > 0
      ? math.min(contentTop - 0.05 * h, contentBottom - topInset - 0.02 * h)
      : contentTop - 0.05 * h;

  double get gap => smallLandscape
      ? 0.35 * rem
      : _wide
      ? 1.2 * rem
      : 0.9 * rem;

  double get logoHeight => touchPortrait
      ? 0.20 * h
      : smallLandscape
      ? 0.13 * h
      : _wide
      ? 0.26 * h
      : 0.22 * h;

  // On a short landscape screen a toolbar or menu button takes the room the
  // plot line would use, so the logo keeps it.
  int get plotLines => touchPortrait
      ? 0
      : smallLandscape
      ? (topInset > 0.15 * h ? 0 : 1)
      : 3;

  double get buttonScale => touchPortrait
      ? 0.95
      : smallLandscape
      ? 0.8
      : 1.0;

  double get dotsScale => touchPortrait
      ? 0.8
      : smallLandscape
      ? 0.6
      : 1.0;

  double get activeDotScale => touchPortrait ? 1.6 : 1.7;

  /// The dots' bottom edge, from the top of the bar.
  double get dotsBottom =>
      touchPortrait ? contentTop - 0.015 * h : contentBottom;

  double get arrowSize => (tv ? 3.5 : 2.25) * rem;
  double get arrowIcon => (tv ? 2.0 : 1.25) * rem;
  double get arrowGap => (tv ? 0.75 : 0.5) * rem;
}

/// The buttons under a slide, in the original's order.
enum MakdButton { info, play, favorite }

/// Outside titles open in Seerr and have nothing to play or favorite.
List<MakdButton> makdButtonsFor(MediaBarSlideItem item) => item.isExternal
    ? const [MakdButton.info]
    : const [MakdButton.info, MakdButton.play, MakdButton.favorite];

/// Which of the at most five dots is lit. Past five titles a dot stands for a
/// share of them.
int makdActiveDot(int index, int total) {
  final dots = math.min(total, 5);
  if (total <= dots) return index;
  return math.min(dots - 1, (index / total * dots).floor());
}

const _white = Colors.white;
const _slideCurve = Cubic(0.4, 0, 0.2, 1);
TextStyle _archivo(double size, FontWeight weight, {Color color = _white}) =>
    TextStyle(
      fontFamily: 'ArchivoNarrow',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.35,
      letterSpacing: 0,
    );

/// Each new slide's art comes in from a slight fade, and on desktop and phones
/// from a blur as well, as the original's frosted glass entrance does.
class MakdSlideIn extends StatelessWidget {
  final Widget child;
  final bool blur;

  const MakdSlideIn({super.key, required this.child, required this.blur});

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
    tween: Tween(begin: 0, end: 1),
    duration: const Duration(milliseconds: 1200),
    curve: _slideCurve,
    child: child,
    builder: (context, t, child) {
      final faded = Opacity(opacity: 0.7 + 0.3 * t, child: child);
      if (!blur || t >= 1) return faded;
      final sigma = 8 * (1 - t);
      return ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: faded,
      );
    },
  );
}

/// The overlay and the 130 degree wash over the art, flat on a phone held
/// upright, and the fade into the page at the bottom. They take the media bar
/// overlay opacity, and the default 50% gives the original's 20% overlay and
/// its .65 to .35 wash. The overlay color only tints makd's charcoal, since a
/// bright pick like Neon Magenta would otherwise flood the art behind white
/// text.
class MakdWash extends StatelessWidget {
  static const _charcoal = Color(0xFF1D1D1D);

  /// How much of the overlay color goes into the charcoal.
  static const _hueShare = 0.3;

  final bool flat;
  final Color color;

  /// The overlay opacity setting, 0 to 1.
  final double opacity;

  const MakdWash({
    super.key,
    required this.flat,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: LayoutBuilder(
      builder: (context, box) {
        final page = AppColorScheme.background;
        final base = Color.lerp(_charcoal, color, _hueShare)!;
        Color tint(double alpha) =>
            base.withValues(alpha: (opacity * alpha).clamp(0.0, 1.0));
        return Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: tint(0.4)),
            if (flat)
              ColoredBox(color: tint(0.5))
            else
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: _cssAngle(
                    130,
                    box.biggest,
                    [tint(1.3), tint(0.7), tint(0)],
                    const [0.10, 0.30, 1.0],
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                key: const ValueKey('makd-bottom-fade'),
                height: box.maxHeight * 0.08,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        page,
                        page,
                        page.withValues(alpha: 0.5),
                        page.withValues(alpha: 0),
                      ],
                      stops: const [0, 0.25, 0.75, 1],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  /// A CSS linear-gradient at [degrees], which runs corner to corner on any
  /// box shape rather than in Flutter's stretched unit square.
  static LinearGradient _cssAngle(
    double degrees,
    Size size,
    List<Color> colors,
    List<double> stops,
  ) {
    final a = degrees * math.pi / 180;
    final dx = math.sin(a);
    final dy = -math.cos(a);
    final half = (size.width * dx.abs() + size.height * dy.abs()) / 2;
    final ax = size.width == 0 ? 0.0 : dx * half / (size.width / 2);
    final ay = size.height == 0 ? 0.0 : dy * half / (size.height / 2);
    return LinearGradient(
      begin: Alignment(-ax, -ay),
      end: Alignment(ax, ay),
      colors: colors,
      stops: stops,
    );
  }
}

/// The slide's text column: logo, info line, genres, plot and buttons.
class MakdContent extends StatelessWidget {
  final MediaBarSlideItem item;
  final MakdMetrics m;
  final Map<String, double> ratings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool use24Hour;
  final bool isFavorite;

  /// The button the remote is on, or null when no ring shows.
  final MakdButton? focused;
  final ValueChanged<MakdButton> onPressed;

  const MakdContent({
    super.key,
    required this.item,
    required this.m,
    required this.ratings,
    required this.enableAdditionalRatings,
    required this.enabledRatings,
    required this.use24Hour,
    required this.isFavorite,
    required this.focused,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final center = m.touchPortrait;
    final overview = cleanOverview(item.overview);
    final info = _infoItems(context);
    final release = item.newRelease;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: m.maxContentHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        spacing: m.gap,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: 0.4 * m.rem),
              child: SizedBox(
                height: m.logoHeight,
                width: double.infinity,
                child: MakdLogo(
                  url: item.logoUrl,
                  title: item.title,
                  rem: m.rem,
                  alignment: center ? Alignment.center : Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          if (release != null)
            MediaBarNewReleaseLine(
              release: release,
              showMessage: !center,
              alignment: center
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
            ),
          if (info.isNotEmpty)
            _SeparatedWrap(
              m: m,
              spacing: 10 * m.px,
              center: center,
              children: info,
            ),
          if (item.genres.isNotEmpty)
            _SeparatedWrap(
              m: m,
              spacing: 5 * m.px,
              center: center,
              children: [
                for (final genre in item.genres.take(3))
                  Text(genre, style: _archivo(m.rem, FontWeight.w500)),
              ],
            ),
          if (m.plotLines > 0 && overview.isNotEmpty)
            Text(
              overview,
              maxLines: m.plotLines,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: m.rem,
                height: 1.35,
                color: _white,
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 0.4 * m.rem),
            child: Transform.scale(
              scale: m.buttonScale,
              alignment: center ? Alignment.center : Alignment.centerLeft,
              child: MakdButtons(
                item: item,
                m: m,
                isFavorite: isFavorite,
                focused: focused,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _infoItems(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final style = _archivo(m.rem, FontWeight.w500);
    final enabled = enabledRatings
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map((s) => s == 'popcorn' ? 'tomatoes_audience' : s)
        .toList();
    bool shows(String source) =>
        !enableAdditionalRatings || enabled.contains(source);
    double? extra(String source) =>
        enableAdditionalRatings ? ratings[source] : null;

    final community = _inScale(item.communityRating ?? extra('stars'), 10);
    final critic = _inScale(
      item.criticRating?.toDouble() ?? extra('tomatoes'),
      100,
    )?.round();
    final runtime = item.runtime;
    final seasons = item.itemType == 'Series' ? item.childCount : null;

    Widget icon(String asset) => Image.asset(
      asset,
      height: 18 * m.px,
      width: 18 * m.px,
      fit: BoxFit.contain,
    );
    Widget scored(Widget leading, String value, double gap) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading,
        SizedBox(width: gap),
        Text(value, style: style),
      ],
    );

    return [
      if (community != null && shows('stars'))
        scored(
          Icon(Icons.star, color: const Color(0xFFF2B01E), size: 1.4 * m.rem),
          community.toStringAsFixed(1),
          0.125 * 1.4 * m.rem,
        ),
      if (critic != null && shows('tomatoes'))
        scored(
          icon(
            'assets/icons/ratings/${critic < 60 ? 'rt-rotten' : 'rt-fresh'}.png',
          ),
          '$critic%',
          0.25 * m.rem,
        ),
      if (enableAdditionalRatings)
        for (final source in enabled)
          if (!const {'stars', 'tomatoes', 'personal'}.contains(source))
            if (_extraRating(source) case final value?)
              if (RatingIconProvider.getIconAssetPath(source, value.round())
                  case final asset?)
                scored(
                  icon(asset),
                  RatingIconProvider.formatRating(source, value),
                  0.25 * m.rem,
                ),
      if (item.year case final year?) Text('$year', style: style),
      if (item.officialRating case final rating? when rating.isNotEmpty)
        DecoratedBox(
          decoration: BoxDecoration(
            color: _white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(5 * m.px),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.5 * m.rem),
            child: Text(
              rating,
              style: _archivo(m.rem, FontWeight.w700, color: Colors.black),
            ),
          ),
        ),
      if (seasons != null && seasons > 0)
        Text(l10n.seasonCount(seasons), style: style)
      else if (runtime != null && runtime > Duration.zero)
        Text(
          formatPlaybackEndsAt(
            context,
            position: Duration.zero,
            duration: runtime,
            use24Hour: use24Hour,
          ),
          style: style,
        ),
    ];
  }

  double? _extraRating(String source) {
    final value = source == 'tmdb'
        ? ratings['tmdb'] ?? ratings['tmdb_episode']
        : source == 'tomatoes_audience'
        ? ratings['tomatoes_audience'] ?? ratings['popcorn']
        : ratings[source];
    return value != null && value.isFinite && value > 0 ? value : null;
  }

  static double? _inScale(double? rating, double max) =>
      rating == null || !rating.isFinite || rating <= 0 || rating > max
      ? null
      : rating;
}

/// A wrapping line with the original's small round separator between items.
class _SeparatedWrap extends StatelessWidget {
  final MakdMetrics m;
  final double spacing;
  final bool center;
  final List<Widget> children;

  const _SeparatedWrap({
    required this.m,
    required this.spacing,
    required this.center,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final dot = Icon(
      Icons.fiber_manual_record,
      size: 10 * m.px,
      color: _white.withValues(alpha: 0.55),
    );
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: center ? WrapAlignment.center : WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) dot,
          children[i],
        ],
      ],
    );
  }
}

class MakdLogo extends StatelessWidget {
  final String? url;
  final String title;
  final double rem;
  final Alignment alignment;

  const MakdLogo({
    super.key,
    required this.url,
    required this.title,
    required this.rem,
    required this.alignment,
  });

  static const _brighten = ColorFilter.matrix([
    1.1, 0, 0, 0, 0, //
    0, 1.1, 0, 0, 0, //
    0, 0, 1.1, 0, 0, //
    0, 0, 0, 1, 0, //
  ]);

  @override
  Widget build(BuildContext context) {
    final fallback = Align(
      alignment: alignment,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: alignment == Alignment.center
            ? TextAlign.center
            : TextAlign.start,
        style: TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 4 * rem,
          height: 1.1,
          color: _white,
        ),
      ),
    );
    final logo = url;
    if (logo == null) return fallback;
    return ColorFiltered(
      colorFilter: _brighten,
      child: OfflineAwareImage(
        imageUrl: logo,
        fit: BoxFit.contain,
        alignment: alignment,
        fadeInDuration: Duration.zero,
        priority: ImageFetchPriority.high,
        errorWidget: (_, _, _) => fallback,
      ),
    );
  }
}

/// Info, Play and Favorite, as the original's Classic layout orders them.
class MakdButtons extends StatelessWidget {
  final MediaBarSlideItem item;
  final MakdMetrics m;
  final bool isFavorite;
  final MakdButton? focused;
  final ValueChanged<MakdButton> onPressed;

  const MakdButtons({
    super.key,
    required this.item,
    required this.m,
    required this.isFavorite,
    required this.focused,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = m.px;
    Widget circle(MakdButton kind, IconData icon, {bool favorite = false}) =>
        _HoverButton(
          focused: focused == kind,
          shape: const CircleBorder(),
          ringOffset: 6 * p,
          ringWidth: 3 * p,
          onTap: () => onPressed(kind),
          builder: (hover) => Container(
            width: 50 * p,
            height: 50 * p,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withValues(alpha: hover ? 0.7 : 0.45),
              border: Border.all(
                width: p,
                color: favorite
                    ? const Color(0x99FF4D4D)
                    : _white.withValues(alpha: hover ? 0.7 : 0.35),
              ),
            ),
            child: Icon(
              icon,
              size: 22 * p,
              color: favorite ? const Color(0xFFFF4D4D) : _white,
            ),
          ),
        );
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 15 * p,
      children: [
        for (final kind in makdButtonsFor(item))
          switch (kind) {
            MakdButton.info => circle(kind, Icons.info_outline),
            MakdButton.favorite => circle(
              kind,
              isFavorite ? Icons.favorite : Icons.favorite_border,
              favorite: isFavorite,
            ),
            MakdButton.play => _HoverButton(
              focused: focused == kind,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14 * p),
              ),
              ringOffset: 6 * p,
              ringWidth: 3 * p,
              onTap: () => onPressed(kind),
              builder: (hover) => Container(
                height: 50 * p,
                padding: EdgeInsets.symmetric(horizontal: 12.6 * p),
                decoration: BoxDecoration(
                  color: _white.withValues(alpha: hover ? 0.85 : 1),
                  borderRadius: BorderRadius.circular(8 * p),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6 * p,
                  children: [
                    Icon(Icons.play_arrow, size: 22 * p, color: Colors.black),
                    Text(
                      l10n.play,
                      style: _archivo(
                        18 * p,
                        FontWeight.w700,
                        color: Colors.black,
                      ).copyWith(height: 1),
                    ),
                  ],
                ),
              ),
            ),
          },
      ],
    );
  }
}

/// A pointer target that lightens on hover and wears the original's white
/// focus ring, 3 px wide and 3 px out, when the remote is on it.
class _HoverButton extends StatefulWidget {
  final bool focused;
  final OutlinedBorder shape;
  final double ringOffset;
  final double ringWidth;
  final VoidCallback onTap;
  final Widget Function(bool hover) builder;

  const _HoverButton({
    required this.focused,
    required this.shape,
    required this.ringOffset,
    required this.ringWidth,
    required this.onTap,
    required this.builder,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _hover = true),
    onExit: (_) => setState(() => _hover = false),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.builder(_hover),
          if (widget.focused)
            Positioned(
              left: -widget.ringOffset,
              top: -widget.ringOffset,
              right: -widget.ringOffset,
              bottom: -widget.ringOffset,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: widget.shape.copyWith(
                      side: BorderSide(color: _white, width: widget.ringWidth),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

/// At most five dots, the lit one white and grown.
class MakdDots extends StatelessWidget {
  final int count;
  final int current;
  final MakdMetrics m;

  const MakdDots({
    super.key,
    required this.count,
    required this.current,
    required this.m,
  });

  @override
  Widget build(BuildContext context) {
    final dots = math.min(count, 5);
    final active = makdActiveDot(current, count);
    final size = 0.5 * m.rem;
    return Transform.scale(
      scale: m.dotsScale,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < dots; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5 * m.px),
              child: AnimatedScale(
                scale: i == active ? m.activeDotScale : 1,
                duration: const Duration(milliseconds: 500),
                curve: _slideCurve,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == active ? _white : const Color(0x99CECECE),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// The two arrows at the right edge, shown on hover or while the remote is on
/// the bar.
List<Widget> makdArrows(
  MakdMetrics m, {
  required bool visible,
  required VoidCallback onPrevious,
  required VoidCallback onNext,
}) {
  final s = m.arrowSize;
  Widget arrow(IconData icon, VoidCallback onTap) => _HoverButton(
    focused: false,
    shape: const CircleBorder(),
    ringOffset: 0,
    ringWidth: 0,
    onTap: onTap,
    builder: (hover) => Container(
      width: s,
      height: s,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(10, 12, 18, hover ? 0.72 : 0.42),
        border: Border.all(
          width: m.px,
          color: _white.withValues(alpha: hover ? 0.6 : 0.28),
        ),
      ),
      child: Icon(icon, size: m.arrowIcon, color: _white),
    ),
  );
  Widget place(double right, Widget child) => Positioned(
    right: right,
    top: (m.h - s) / 2,
    child: IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: child,
      ),
    ),
  );
  return [
    place(m.gutter + s + m.arrowGap, arrow(Icons.chevron_left, onPrevious)),
    place(m.gutter, arrow(Icons.chevron_right, onNext)),
  ];
}
