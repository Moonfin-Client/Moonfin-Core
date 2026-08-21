import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../../../data/viewmodels/media_bar_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/overlay_color_palette.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/mediabar/gallery_glow.dart';

/// The artwork behind every preview, shared with the home screen.
///
/// The wizard reads the same MediaBarViewModel singleton Home renders from, so
/// the items in the previews are the items the real bar will open on, and the
/// images are already cached by the time Home draws them for real.
abstract final class SetupPreviewData {
  /// Stands in for the view model in widget tests, where neither the
  /// container nor a server exists.
  @visibleForTesting
  static ValueNotifier<List<MediaBarSlideItem>>? debugOverride;

  static MediaBarViewModel? get _viewModel =>
      GetIt.instance.isRegistered<MediaBarViewModel>()
      ? GetIt.instance<MediaBarViewModel>()
      : null;

  static Listenable? get listenable => debugOverride ?? _viewModel;

  static List<MediaBarSlideItem> get items =>
      debugOverride?.value ?? _viewModel?.items ?? const [];

  static Future<void> ensureLoaded() async {
    if (debugOverride != null) return;
    await _viewModel?.load();
  }
}

/// Frame shared by every option card preview.
class SetupPreview extends StatelessWidget {
  const SetupPreview({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.circular(8),
      child: ColoredBox(color: AppColorScheme.surface, child: child),
    );
  }
}

/// The logical size the preview screen is laid out at before being scaled
/// down, matching a typical device of the interface the wizard runs in. Every
/// measurement inside a preview is the real widget's measurement at this size,
/// so the scaled result keeps the true proportions.
Size _designSize() {
  if (PlatformDetection.useLeanbackUi) return const Size(960, 540);
  if (PlatformDetection.useMobileUi) return const Size(390, 844);
  return const Size(1280, 800);
}

bool get _tv => PlatformDetection.useLeanbackUi;
bool get _phone => PlatformDetection.useMobileUi;

/// TV rows render at 0.8 of the desktop size, same as _rowPlatformScale.
double get _rowScale => _tv ? 0.8 : 1.0;

double get _rowLeftInset => _phone ? 16 : (_tv ? 80 : 32);

/// Lays [child] out at the platform design size, then scales it into the card.
Widget _screen(Widget child) {
  final size = _designSize();
  return AspectRatio(
    aspectRatio: size.aspectRatio,
    child: FittedBox(
      fit: BoxFit.fill,
      child: SizedBox.fromSize(
        size: size,
        child: ColoredBox(color: AppColorScheme.background, child: child),
      ),
    ),
  );
}

/// Live preview when artwork has loaded, the drawn stand-in until then. The
/// stand-in keeps the same aspect so nothing jumps when the artwork lands.
Widget _liveOrFallback({
  required Widget Function(BuildContext context, List<MediaBarSlideItem> items)
  live,
  required Widget fallback,
  double fallbackAspect = 16 / 10,
}) {
  final framedFallback = AspectRatio(
    aspectRatio: _designSize().aspectRatio,
    child: Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: 320,
          height: 320 / fallbackAspect,
          child: fallback,
        ),
      ),
    ),
  );
  final listenable = SetupPreviewData.listenable;
  if (listenable == null) return framedFallback;
  return ListenableBuilder(
    listenable: listenable,
    builder: (context, _) {
      final items = SetupPreviewData.items;
      if (items.isEmpty) return framedFallback;
      return _screen(live(context, items));
    },
  );
}

MediaBarSlideItem _itemAt(List<MediaBarSlideItem> items, int index) =>
    items[index % items.length];

const List<Shadow> _textShadows = [
  Shadow(blurRadius: 4, color: Colors.black54),
];

String _runtimeText(Duration? runtime) {
  if (runtime == null) return '';
  final hours = runtime.inHours;
  final minutes = runtime.inMinutes % 60;
  return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
}

List<String> _metaParts(MediaBarSlideItem item) => [
  if (item.year != null) '${item.year}',
  if (item.officialRating != null) item.officialRating!,
  if (item.runtime != null) _runtimeText(item.runtime),
  if (item.genres.isNotEmpty) item.genres.take(3).join(' • '),
];

Widget _artwork(String? url, {Alignment alignment = Alignment.center}) {
  if (url == null || url.isEmpty) {
    return ColoredBox(
      color: AppColorScheme.onSurface.withValues(alpha: 0.1),
      child: const SizedBox.expand(),
    );
  }
  return BoundedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    alignment: alignment,
  );
}

/// The item's logo when it has one, its title in [fallbackStyle] otherwise,
/// matching how the real bar and detail pages fall back.
Widget _logoOrTitle(
  MediaBarSlideItem item, {
  required double width,
  required double height,
  required TextStyle fallbackStyle,
  Alignment alignment = Alignment.bottomLeft,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: item.logoUrl != null
        ? BoundedNetworkImage(
            imageUrl: item.logoUrl!,
            fit: BoxFit.contain,
            alignment: alignment,
          )
        : Align(
            alignment: alignment,
            child: Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: fallbackStyle,
            ),
          ),
  );
}

Widget _communityRating(MediaBarSlideItem item) {
  final rating = item.communityRating;
  if (rating == null) return const SizedBox.shrink();
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.star_rounded, size: 16, color: Color(0xFFFFC107)),
      const SizedBox(width: 4),
      Text(
        rating.toStringAsFixed(1),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColorScheme.onSurface,
        ),
      ),
    ],
  );
}

Color get _overlayColor => OverlayColorPalette.resolveColor(
  GetIt.instance<UserPreferences>().get(UserPreferences.mediaBarOverlayColor),
);

double get _overlayOpacity =>
    GetIt.instance<UserPreferences>()
        .get(UserPreferences.mediaBarOverlayOpacity)
        .toDouble()
        .clamp(0.0, 100.0) /
    100.0;

// ---------------------------------------------------------------------------
// Media bar modes
// ---------------------------------------------------------------------------

Widget mediaBarPreview(String mode) => _liveOrFallback(
  live: (context, items) => switch (mode) {
    UserPreferences.mediaBarModeMakd => _makdBar(context, items),
    UserPreferences.mediaBarModeBookshelf => _bookshelfBar(context, items),
    UserPreferences.mediaBarModeGallery => _galleryBar(context, items),
    UserPreferences.mediaBarModeBanner => _bannerBar(context, items),
    UserPreferences.mediaBarModeAya => _ayaBar(context, items),
    // The rows carry the whole screen with the bar off, so the preview packs
    // them tighter than the style default to show more than one.
    UserPreferences.mediaBarModeOff => _homeRowsScreen(
      context,
      items,
      modern: !_phone,
      rowGapOverride: 24,
    ),
    _ => _moonfinBar(context, items),
  },
  fallback: _fallbackMediaBar(mode),
  fallbackAspect: 16 / 7,
);

/// On phones the bar takes 55 percent of the screen (46 for makd) and the
/// rows carry on beneath, which is exactly what the preview shows too.
Widget _phoneBarScreen(
  BuildContext context,
  List<MediaBarSlideItem> items,
  Widget bar, {
  double barFraction = 0.55,
}) {
  final height = _designSize().height * barFraction;
  return Column(
    children: [
      SizedBox(height: height, child: bar),
      Expanded(
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            maxHeight: double.infinity,
            child: _homeRowsColumn(context, items, modern: false),
          ),
        ),
      ),
    ],
  );
}

Widget _dots({
  required int count,
  required double active,
  required double inactive,
  required double inactiveAlpha,
  double gap = 4,
  bool pillActive = false,
  double? height,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (var i = 0; i < count; i++)
        Container(
          width: i == 0 ? active : inactive,
          height:
              height ?? (i == 0 ? (pillActive ? inactive : active) : inactive),
          margin: EdgeInsets.symmetric(horizontal: gap),
          decoration: BoxDecoration(
            shape: pillActive ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: pillActive ? BorderRadius.circular(3) : null,
            color: i == 0
                ? AppColorScheme.onSurface
                : AppColorScheme.onSurface.withValues(alpha: inactiveAlpha),
          ),
        ),
    ],
  );
}

Widget _navArrow(IconData icon) => Container(
  width: 48,
  height: 48,
  margin: const EdgeInsets.symmetric(horizontal: 8),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: AppColorScheme.scrim.withValues(alpha: 0.4),
    border: Border.fromBorderSide(ThemeRegistry.active.borders.cardBorder),
  ),
  child: Icon(
    icon,
    size: 28,
    color: AppColorScheme.onSurface.withValues(alpha: 0.9),
  ),
);

Widget _metadataWrap(
  MediaBarSlideItem item, {
  WrapAlignment alignment = WrapAlignment.start,
}) {
  final style = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColorScheme.onSurface.withValues(alpha: 0.9),
  );
  final parts = _metaParts(item);
  return Wrap(
    alignment: alignment,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 2,
    runSpacing: 4,
    children: [
      for (var i = 0; i < parts.length; i++) ...[
        if (i > 0) Text(' • ', style: style),
        if (item.officialRating != null && parts[i] == item.officialRating)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(3),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.chipBorder,
              ),
            ),
            child: Text(parts[i], style: style.copyWith(fontSize: 11)),
          )
        else
          Text(parts[i], style: style),
      ],
    ],
  );
}

Widget _moonfinBar(BuildContext context, List<MediaBarSlideItem> items) {
  final item = items.first;
  final overlay = _overlayColor;
  final op = _overlayOpacity;

  final info = Padding(
    padding: EdgeInsets.only(
      left: _phone ? 16 : 24,
      right: _phone ? 16 : 24,
      bottom: _phone ? 24 : 36,
    ),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: _phone ? 6 : 12),
      decoration: BoxDecoration(
        color: overlay.withValues(alpha: 0.75 * op),
        borderRadius: AppRadius.circular(16),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _metadataWrap(item),
          if (item.overview != null) ...[
            const SizedBox(height: 8),
            Text(
              item.overview!,
              maxLines: _phone ? 2 : 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: _phone ? 12 : 14,
                height: 1.4,
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
          ],
        ],
      ),
    ),
  );

  final bar = Stack(
    fit: StackFit.expand,
    children: [
      _artwork(item.backdropUrl),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              overlay.withValues(alpha: op * 0.3),
              overlay.withValues(alpha: op * 0.1),
              overlay.withValues(alpha: op * 0.8),
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
      ),
      if (!_phone)
        Positioned(
          top: 56,
          left: 40,
          child: _logoOrTitle(
            item,
            width: 280,
            height: 120,
            fallbackStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.05,
              color: AppColorScheme.onSurface,
              shadows: _textShadows,
            ),
          ),
        ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_phone)
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: _logoOrTitle(
                  item,
                  width: 180,
                  height: 70,
                  fallbackStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.05,
                    color: AppColorScheme.onSurface,
                    shadows: _textShadows,
                  ),
                ),
              ),
            info,
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 8,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: overlay.withValues(alpha: op * 0.6),
              borderRadius: AppRadius.circular(12),
            ),
            child: _dots(count: 5, active: 10, inactive: 8, inactiveAlpha: 0.5),
          ),
        ),
      ),
      if (!_phone) ...[
        Align(
          alignment: Alignment.centerLeft,
          child: _navArrow(Icons.chevron_left),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _navArrow(Icons.chevron_right),
        ),
      ],
    ],
  );

  return _phone ? _phoneBarScreen(context, items, bar) : bar;
}

Widget _makdBar(BuildContext context, List<MediaBarSlideItem> items) {
  final item = items.first;
  final overlay = _overlayColor;
  final op = _overlayOpacity;
  final size = _designSize();
  final l10n = AppLocalizations.of(context);

  if (_phone) {
    final barHeight = size.height * 0.46;
    final bar = Stack(
      fit: StackFit.expand,
      children: [
        _artwork(item.backdropUrl),
        ColoredBox(color: AppColorScheme.scrim.withValues(alpha: 0.26)),
        Align(
          alignment: const Alignment(0, -0.1),
          child: _logoOrTitle(
            item,
            width: (size.width * 0.7).clamp(190.0, 380.0),
            height: (barHeight * 0.18).clamp(58.0, 112.0),
            alignment: Alignment.center,
            fallbackStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColorScheme.onSurface,
              shadows: _textShadows,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _metadataWrap(item, alignment: WrapAlignment.center),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _makdPlayButton(l10n, compact: true),
                    const SizedBox(width: 10),
                    _makdInfoButton(36, 18),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 14,
          child: Center(
            child: _dots(
              count: 5,
              active: 9,
              inactive: 7,
              inactiveAlpha: 0.45,
              gap: 5,
            ),
          ),
        ),
      ],
    );
    return _phoneBarScreen(context, items, bar, barFraction: 0.46);
  }

  final contentWidth = (size.width * 0.42).clamp(280.0, 560.0);
  return Stack(
    fit: StackFit.expand,
    children: [
      _artwork(item.backdropUrl),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              overlay.withValues(alpha: op * 0.78),
              overlay.withValues(alpha: op * 0.46),
              overlay.withValues(alpha: op * 0.06),
            ],
            stops: const [0.0, 0.46, 1.0],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              overlay.withValues(alpha: op * 0.12),
              overlay.withValues(alpha: op * 0.28),
              overlay.withValues(alpha: op * 0.78),
            ],
            stops: const [0.0, 0.48, 1.0],
          ),
        ),
      ),
      Positioned(
        left: 50,
        top: size.height * 0.22,
        child: _logoOrTitle(
          item,
          width: (size.width * 0.45).clamp(220.0, 640.0),
          height: (size.height * 0.35).clamp(90.0, 300.0),
          fallbackStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            height: 1.05,
            color: AppColorScheme.onSurface,
            shadows: _textShadows,
          ),
        ),
      ),
      Positioned(
        left: 50,
        bottom: 20,
        width: contentWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _metadataWrap(item),
            if (item.overview != null) ...[
              const SizedBox(height: 10),
              Text(
                item.overview!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.38,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.88),
                ),
              ),
            ],
            if (!_tv) ...[
              const SizedBox(height: 14),
              Row(
                children: [
                  _makdPlayButton(l10n, compact: false),
                  const SizedBox(width: 10),
                  _makdInfoButton(46, 22),
                ],
              ),
            ],
          ],
        ),
      ),
      Positioned(
        right: 20,
        bottom: 24,
        child: _dots(
          count: 5,
          active: 9,
          inactive: 7,
          inactiveAlpha: 0.45,
          gap: 5,
        ),
      ),
    ],
  );
}

Widget _makdPlayButton(AppLocalizations l10n, {required bool compact}) =>
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 14 : 18,
        vertical: compact ? 7 : 10,
      ),
      decoration: BoxDecoration(
        color: AppColorScheme.buttonFocused,
        borderRadius: AppRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.play_arrow_rounded,
            size: compact ? 20 : 24,
            color: AppColorScheme.onButtonFocused,
          ),
          const SizedBox(width: 4),
          Text(
            l10n.play,
            style: TextStyle(
              fontSize: compact ? 14 : 17,
              fontWeight: FontWeight.w700,
              color: AppColorScheme.onButtonFocused,
            ),
          ),
        ],
      ),
    );

Widget _makdInfoButton(double size, double iconSize) => Container(
  width: size,
  height: size,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: AppColorScheme.onSurface.withValues(alpha: 0.18),
    border: Border.all(
      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
      width: 1.5,
    ),
  ),
  child: Icon(
    Icons.info_outline_rounded,
    size: iconSize,
    color: AppColorScheme.onSurface,
  ),
);

Widget _bookshelfBar(BuildContext context, List<MediaBarSlideItem> items) {
  final bar = LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final isMobile = width < 600;
      final totalHeight = constraints.maxHeight;
      final contentHeight = totalHeight - (isMobile ? 108 : 0);
      final activeHeight = contentHeight * 0.84;
      final activeWidth = activeHeight * 0.72;
      final spineHeight = contentHeight * 0.76;
      final spineWidth = isMobile ? 48.0 : 36.0;
      final centerWidth = activeWidth + (isMobile ? 0 : 56);
      final maxSide = (((width - centerWidth) / 2) / (spineWidth + 4))
          .floor()
          .clamp(1, 20);
      final active = items.first;

      Widget spine(int index) {
        final item = _itemAt(items, index);
        return Container(
          width: spineWidth,
          height: spineHeight,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: glowColorForGenres(item.genres),
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black.withValues(alpha: 0.35),
                Colors.white.withValues(alpha: 0.12),
                glowColorForGenres(item.genres),
                Colors.black.withValues(alpha: 0.45),
              ],
              stops: const [0.0, 0.25, 0.6, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.55),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  (index + 1).toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Color(0xE6E5D5B8),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 16,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: const Color(0x40E5D5B8),
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: Text(
                      item.title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10.5,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE5D5B8),
                        shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      }

      final book = Container(
        width: activeWidth,
        height: activeHeight,
        decoration: BoxDecoration(
          color: glowColorForGenres(active.genres),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3),
            bottomLeft: Radius.circular(3),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.75),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3),
            bottomLeft: Radius.circular(3),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: activeWidth * 0.12),
            child: _artwork(active.posterUrl),
          ),
        ),
      );

      return Stack(
        children: [
          Positioned.fill(
            child: isMobile
                ? const ColoredBox(color: Color(0xFF1C100A))
                : Row(
                    children: [
                      const Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF130905), Color(0xFF23150D)],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: centerWidth,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1C100A),
                          border: Border.symmetric(
                            vertical: BorderSide(
                              color: Color(0xFF382314),
                              width: 8,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF23150D), Color(0xFF130905)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 88 : 0,
              bottom: isMobile ? 20 : 0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var i = maxSide; i >= 1; i--) spine(i),
                    const SizedBox(width: 8),
                    book,
                    const SizedBox(width: 8),
                    for (var i = maxSide + 1; i <= maxSide * 2; i++) spine(i),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5A3D28), Color(0xFF26180E)],
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 1.5,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.65),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );

  return _phone ? _phoneBarScreen(context, items, bar) : bar;
}

Widget _galleryBar(BuildContext context, List<MediaBarSlideItem> items) {
  if (_phone) return _galleryCoverflow(context, items);

  final l10n = AppLocalizations.of(context);
  final size = _designSize();
  final active = items.first;
  final glow = glowColorForGenres(active.genres);
  final badgeStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColorScheme.onSurface,
  );

  Widget badge(String text, {bool tinted = false, bool outlined = false}) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: tinted
              ? AppColorScheme.accent.withValues(alpha: 0.22)
              : AppColorScheme.scrim.withValues(alpha: 0.35),
          borderRadius: AppRadius.circular(8),
          border: outlined
              ? Border.all(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                )
              : null,
        ),
        child: Text(text, style: badgeStyle),
      );

  Widget shimmerBar(double width) => Container(
    width: width,
    height: 12,
    margin: const EdgeInsets.only(top: 6),
    decoration: BoxDecoration(
      color: AppColorScheme.onSurface.withValues(alpha: 0.12),
      borderRadius: AppRadius.circular(6),
    ),
  );

  Widget idlePanel(int index) {
    final item = _itemAt(items, index);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          children: [
            SizedBox(
              height: 24,
              child: Text(
                (index + 1).toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(opacity: 0.35, child: _artwork(item.backdropUrl)),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 2,
                            height: 24,
                            color: AppColorScheme.accent.withValues(alpha: 0.7),
                          ),
                          Expanded(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Center(
                                child: Text(
                                  item.title.toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.0,
                                    color: AppColorScheme.onSurface,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 6,
                                        color: AppColorScheme.scrim.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 24,
                            color: AppColorScheme.accent.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final activePanel = Expanded(
    flex: 16,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _artwork(active.backdropUrl),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppColorScheme.scrim.withValues(alpha: 0.95),
                          AppColorScheme.scrim.withValues(alpha: 0.15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 24, 24, 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                active.title.toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  height: 1.02,
                                  letterSpacing: 1.0,
                                  color: AppColorScheme.onSurface,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 12,
                                      color: AppColorScheme.scrim.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (active.runtime != null)
                                    badge(_runtimeText(active.runtime)),
                                  if (active.officialRating != null)
                                    badge(
                                      active.officialRating!,
                                      outlined: true,
                                    ),
                                  if (active.year != null)
                                    badge('${active.year}'),
                                  for (final genre in active.genres.take(3))
                                    badge(genre, tinted: true),
                                ],
                              ),
                              if (active.overview != null) ...[
                                const SizedBox(height: 14),
                                Text(
                                  active.overview!,
                                  maxLines: _tv ? 3 : 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.45,
                                    color: AppColorScheme.onSurface.withValues(
                                      alpha: 0.9,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 28),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: AppColorScheme.scrim.withValues(
                                alpha: 0.55,
                              ),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: AppColorScheme.onSurface.withValues(
                                  alpha: 0.12,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.director,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.4,
                                    color: AppColorScheme.accent,
                                  ),
                                ),
                                shimmerBar(120),
                                const SizedBox(height: 14),
                                Text(
                                  l10n.starring,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.4,
                                    color: AppColorScheme.accent,
                                  ),
                                ),
                                shimmerBar(160),
                                shimmerBar(140),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  return Stack(
    fit: StackFit.expand,
    children: [
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.2, 0.1),
            radius: 1.1,
            colors: [
              glow.withValues(alpha: 0.42),
              glow.withValues(alpha: 0.14),
              AppColorScheme.background.withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
        ),
      ),
      Positioned(
        top: size.height * 0.09,
        bottom: size.height * 0.03,
        left: 24,
        right: 24,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Row(
            children: [activePanel, for (var i = 1; i < 5; i++) idlePanel(i)],
          ),
        ),
      ),
    ],
  );
}

Widget _galleryCoverflow(BuildContext context, List<MediaBarSlideItem> items) {
  final active = items.first;
  final glow = glowColorForGenres(active.genres);
  final size = _designSize();
  final cardWidth = size.width * 0.64;

  Widget sideCard(int index) => Transform.scale(
    scale: 0.82,
    child: Opacity(
      opacity: 0.45,
      child: SizedBox(
        width: cardWidth,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: _artwork(
              _itemAt(items, index).posterUrl ??
                  _itemAt(items, index).backdropUrl,
            ),
          ),
        ),
      ),
    ),
  );

  final metaParts = [
    if (active.year != null) '${active.year}',
    if (active.runtime != null) _runtimeText(active.runtime),
    if (active.officialRating != null) active.officialRating!,
  ];

  final bar = Stack(
    children: [
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.35),
              radius: 1.0,
              colors: [
                glow.withValues(alpha: 0.4),
                glow.withValues(alpha: 0.12),
                AppColorScheme.background.withValues(alpha: 0.0),
              ],
              stops: const [0.0, 0.45, 1.0],
            ),
          ),
        ),
      ),
      Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ClipRect(
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sideCard(1),
                    SizedBox(
                      width: cardWidth,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.12,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: glow.withValues(alpha: 0.5),
                                blurRadius: 30,
                                spreadRadius: 1.5,
                              ),
                              BoxShadow(
                                color: AppColorScheme.scrim.withValues(
                                  alpha: 0.55,
                                ),
                                blurRadius: 22,
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: _artwork(
                              active.posterUrl ?? active.backdropUrl,
                            ),
                          ),
                        ),
                      ),
                    ),
                    sideCard(2),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
            child: Column(
              children: [
                Text(
                  active.title.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    color: AppColorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  metaParts.join('  ·  '),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _dots(
            count: 5,
            active: 18,
            inactive: 6,
            inactiveAlpha: 0.3,
            gap: 3,
            pillActive: true,
          ),
          const SizedBox(height: 8),
        ],
      ),
    ],
  );

  return _phoneBarScreen(context, items, bar);
}

Widget _bannerBar(BuildContext context, List<MediaBarSlideItem> items) {
  final item = items.first;
  final height = _tv ? 320.0 : (_phone ? 200.0 : 240.0);
  final metaParts = [
    if (item.year != null) '${item.year}',
    if (item.runtime != null) _runtimeText(item.runtime),
    if (item.officialRating != null) item.officialRating!,
  ];

  final banner = Padding(
    padding: EdgeInsets.fromLTRB(16, _phone ? 24 : 0, 16, 8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _artwork(item.backdropUrl),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xE6000000), Color(0x00000000)],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _logoOrTitle(
                    item,
                    width: 240,
                    height: 56,
                    fallbackStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColorScheme.onSurface,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: AppColorScheme.scrim.withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    metaParts.join('  ·  '),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 16,
              child: _dots(
                count: 5,
                active: 16,
                inactive: 6,
                inactiveAlpha: 0.4,
                gap: 2,
                pillActive: true,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      banner,
      Expanded(
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            maxHeight: double.infinity,
            child: _homeRowsColumn(context, items, modern: !_phone),
          ),
        ),
      ),
    ],
  );
}

/// Artwork first, with the logo top left and the page marks top right. The
/// bar takes 65 percent of the screen on every platform, so the rows always
/// show underneath it.
Widget _ayaBar(BuildContext context, List<MediaBarSlideItem> items) {
  final item = items.first;
  final size = _designSize();

  final padding = _phone
      ? const EdgeInsets.fromLTRB(16, 60, 16, 16)
      : EdgeInsets.fromLTRB(_tv ? 80 : 32, _tv ? 71 : 32, _tv ? 80 : 32, 32);

  // Phones preview in portrait, which is where the poster is used.
  final artwork = _phone
      ? (item.posterUrl ?? item.backdropUrl)
      : item.backdropUrl;

  final bar = Padding(
    padding: padding,
    child: ClipRRect(
      borderRadius: AppRadius.circular(18),
      child: SizedBox(
        height: size.height * 0.65 - padding.vertical,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _artwork(artwork),
            Positioned(
              left: 44,
              top: 40,
              child: _logoOrTitle(
                item,
                width: 340,
                height: 100,
                alignment: Alignment.topLeft,
                fallbackStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  height: 1.0,
                  color: AppColorScheme.onSurface,
                  shadows: [
                    Shadow(
                      blurRadius: 20,
                      color: AppColorScheme.scrim.withValues(alpha: 0.72),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 22,
              right: 24,
              child: _dots(
                count: 5,
                active: 16,
                inactive: 10,
                inactiveAlpha: 0.30,
                gap: 2.5,
                pillActive: true,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      bar,
      Expanded(
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            maxHeight: double.infinity,
            child: _homeRowsColumn(context, items, modern: !_phone),
          ),
        ),
      ),
    ],
  );
}

// ---------------------------------------------------------------------------
// Home rows
// ---------------------------------------------------------------------------

Widget homeRowsPreview({required bool modern}) => _liveOrFallback(
  live: (context, items) => _homeRowsScreen(
    context,
    items,
    modern: modern,
    // Modern's whole point is the focused card, so its preview holds the
    // first card in that state with the text block it grows underneath.
    focusFirst: modern,
  ),
  fallback: _fallbackHomeRows(modern: modern),
);

Widget _homeRowsScreen(
  BuildContext context,
  List<MediaBarSlideItem> items, {
  required bool modern,
  bool focusFirst = false,
  double? rowGapOverride,
}) {
  return ClipRect(
    child: OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: double.infinity,
      child: _homeRowsColumn(
        context,
        items,
        modern: modern,
        focusFirst: focusFirst,
        rowGapOverride: rowGapOverride,
      ),
    ),
  );
}

Widget _homeRowsColumn(
  BuildContext context,
  List<MediaBarSlideItem> items, {
  required bool modern,
  bool focusFirst = false,
  double? rowGapOverride,
}) {
  final l10n = AppLocalizations.of(context);
  final scale = _rowScale;

  Widget header(String title) => Padding(
    padding: modern
        ? const EdgeInsets.fromLTRB(16, 6, 8, 1)
        : const EdgeInsets.fromLTRB(16, 16, 8, 8),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.onSurface,
      ),
    ),
  );

  Widget card(
    MediaBarSlideItem item, {
    required double height,
    required double aspect,
    String? imageUrl,
    double? progress,
  }) {
    final width = height * aspect;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: ThemeRegistry.active.borders.cardRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _artwork(imageUrl ?? item.posterUrl),
                if (progress != null)
                  Positioned(
                    left: 6,
                    right: 6,
                    bottom: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: SizedBox(
                        height: 6,
                        child: Row(
                          children: [
                            Expanded(
                              flex: (progress * 100).round(),
                              child: ColoredBox(color: AppColorScheme.accent),
                            ),
                            Expanded(
                              flex: 100 - (progress * 100).round(),
                              child: ColoredBox(
                                color: AppColorScheme.scrim.withValues(
                                  alpha: 0.54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: width,
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColorScheme.onSurface,
              shadows: _textShadows,
            ),
          ),
        ),
        const SizedBox(height: 2),
        if (item.year != null)
          Text(
            '${item.year}',
            style: TextStyle(
              fontSize: 12,
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              shadows: _textShadows,
            ),
          ),
      ],
    );
  }

  Widget cardsRow(List<Widget> cards) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 5, 20, 5),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: 12),
            cards[i],
          ],
        ],
      ),
    ),
  );

  final posterHeight = modern ? 240.0 * scale : 150.0 * scale;
  final thumbHeight = 110.0 * scale;
  final rowGap = rowGapOverride ?? (modern ? (_phone ? 40.0 : 60.0) : 18.0);

  // The focused modern card: same height, morphed to 16:9 on the thumb image,
  // with the focus border and the ratings and overview block it grows below,
  // spanning wider than the card the way the real extended section does.
  Widget focusedCard(MediaBarSlideItem item) {
    final width = posterHeight * 16 / 9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: width,
              height: posterHeight,
              child: ClipRRect(
                borderRadius: ThemeRegistry.active.borders.cardRadius,
                child: _artwork(item.backdropUrl ?? item.posterUrl),
              ),
            ),
            Positioned(
              top: -3.5,
              bottom: -3.5,
              left: -3.5,
              right: -3.5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius:
                      ThemeRegistry.active.borders.cardRadius +
                      AppRadius.circular(3.5),
                  border: Border.fromBorderSide(
                    ThemeRegistry.active.borders.focusBorder.copyWith(
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColorScheme.onSurface,
            shadows: _textShadows,
          ),
        ),
        const SizedBox(height: 2),
        if (item.year != null)
          Text(
            '${item.year}',
            style: TextStyle(
              fontSize: 12,
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              shadows: _textShadows,
            ),
          ),
        const SizedBox(height: 4),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(width: width, height: 76),
            Positioned(
              left: 0,
              top: 0,
              width: width * 2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _communityRating(item),
                  if (item.overview != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.overview!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                          shadows: _textShadows,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget row(
    String title, {
    bool thumbs = false,
    int offset = 0,
    bool withFocus = false,
  }) {
    final cards = <Widget>[
      for (var i = 0; i < 8; i++)
        if (withFocus && i == 0)
          focusedCard(_itemAt(items, offset))
        else
          card(
            _itemAt(items, i + offset),
            height: thumbs ? thumbHeight : posterHeight,
            aspect: thumbs ? 16 / 9 : 2 / 3,
            imageUrl: thumbs ? _itemAt(items, i + offset).backdropUrl : null,
            progress: thumbs && i == 0 ? 0.35 : (thumbs && i == 1 ? 0.7 : null),
          ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header(title), cardsRow(cards)],
    );
  }

  // Classic TV keeps the info overlay band above the rows, so its preview
  // starts with one. Modern shows its metadata under the focused card instead.
  final infoOverlay = !modern && _tv
      ? Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: SizedBox(
            height: 145,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.first.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: AppColorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                _metadataWrap(items.first),
                if (items.first.overview != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    items.first.overview!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ],
            ),
          ),
        )
      : null;

  return Padding(
    padding: EdgeInsets.only(left: _rowLeftInset - 16, top: _phone ? 8 : 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ?infoOverlay,
        row(l10n.continueWatching, thumbs: !modern, withFocus: focusFirst),
        SizedBox(height: rowGap),
        row(l10n.recentlyAdded, offset: 3),
        SizedBox(height: rowGap),
        row(l10n.nextUp, thumbs: !modern, offset: 6),
      ],
    ),
  );
}

// ---------------------------------------------------------------------------
// Detail screen styles
// ---------------------------------------------------------------------------

Widget detailStylePreview({required bool modern}) => _liveOrFallback(
  live: (context, items) => modern
      ? _modernDetail(context, items.first)
      : _classicDetail(context, items),
  fallback: _fallbackDetail(modern: modern),
);

Widget _detailActionTile(
  IconData icon,
  String label, {
  required double cell,
  required double box,
  required double radius,
  required double iconSize,
}) {
  return SizedBox(
    width: cell,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: box,
          height: box,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Icon(icon, size: iconSize, color: AppColorScheme.onSurface),
        ),
        SizedBox(height: box > 50 ? 8 : 6),
        Text(
          label,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColorScheme.onSurface,
          ),
        ),
      ],
    ),
  );
}

Widget _castPlaceholderRow({required double avatarRadius}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const NeverScrollableScrollPhysics(),
    child: Row(
      children: [
        for (var i = 0; i < 8; i++)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: avatarRadius * 2,
                  height: avatarRadius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: avatarRadius * 1.6,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

Widget _classicDetail(BuildContext context, List<MediaBarSlideItem> items) {
  final item = items.first;
  final l10n = AppLocalizations.of(context);
  final desktopLayout = !_phone;

  final poster = Container(
    width: desktopLayout ? 165.0 : 120.0,
    height: desktopLayout ? 248.0 : 180.0,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.antiAlias,
    child: _artwork(item.posterUrl),
  );

  final metaStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white.withValues(alpha: 0.9),
    shadows: _textShadows,
  );
  final parts = _metaParts(item);
  final meta = Wrap(
    alignment: desktopLayout ? WrapAlignment.start : WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 2,
    runSpacing: 4,
    children: [
      for (var i = 0; i < parts.length; i++) ...[
        if (i > 0)
          Text(
            ' • ',
            style: metaStyle.copyWith(
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        if (item.officialRating != null && parts[i] == item.officialRating)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(parts[i], style: metaStyle.copyWith(fontSize: 11)),
          )
        else
          Text(parts[i], style: metaStyle),
      ],
    ],
  );

  final overview = item.overview == null
      ? const SizedBox.shrink()
      : Text(
          item.overview!,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: desktopLayout ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            fontSize: desktopLayout ? 14 : 13,
            height: 1.4,
            color: Colors.white.withValues(alpha: 0.8),
            shadows: _textShadows,
          ),
        );

  final titleBlock = _logoOrTitle(
    item,
    width: desktopLayout ? 350 : 240,
    height: desktopLayout ? 80 : 56,
    alignment: desktopLayout ? Alignment.bottomLeft : Alignment.bottomCenter,
    fallbackStyle: TextStyle(
      fontSize: desktopLayout ? 32 : 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: _textShadows,
    ),
  );

  final cell = desktopLayout ? 108.0 : 80.0;
  final box = desktopLayout ? 58.0 : 44.0;
  final tileRadius = desktopLayout ? 15.0 : 14.0;
  final tileIcon = desktopLayout ? 27.0 : 22.0;
  final buttons = Wrap(
    alignment: WrapAlignment.center,
    spacing: desktopLayout ? 8 : 4,
    runSpacing: desktopLayout ? 12 : 10,
    children: [
      for (final (icon, label) in [
        (Icons.play_arrow_rounded, l10n.play),
        (Icons.shuffle_rounded, l10n.shuffle),
        (Icons.subtitles_outlined, l10n.subtitles),
        (Icons.check_rounded, l10n.watched),
        (Icons.favorite_border_rounded, l10n.favorite),
        (Icons.more_horiz_rounded, l10n.more),
      ])
        _detailActionTile(
          icon,
          label,
          cell: cell,
          box: box,
          radius: tileRadius,
          iconSize: tileIcon,
        ),
    ],
  );

  final infoColumn = Column(
    crossAxisAlignment: desktopLayout
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      titleBlock,
      const SizedBox(height: 12),
      meta,
      const SizedBox(height: 8),
      _communityRating(item),
      const SizedBox(height: 8),
      overview,
    ],
  );

  return Stack(
    fit: StackFit.expand,
    children: [
      if (item.backdropUrl != null)
        ImageFiltered(
          imageFilter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: _artwork(item.backdropUrl),
        ),
      const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xCC000000), Color(0x66000000), Color(0xCC000000)],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
      ),
      ClipRect(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: desktopLayout
                    ? const EdgeInsets.fromLTRB(48, 60, 48, 16)
                    : const EdgeInsets.fromLTRB(16, 40, 16, 12),
                child: desktopLayout
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: infoColumn),
                          const SizedBox(width: 32),
                          poster,
                        ],
                      )
                    : Column(
                        children: [
                          poster,
                          const SizedBox(height: 16),
                          infoColumn,
                        ],
                      ),
              ),
              buttons,
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: desktopLayout ? 48 : 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.cast,
                      style: TextStyle(
                        fontSize: desktopLayout ? 20 : 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: _textShadows,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _castPlaceholderRow(avatarRadius: desktopLayout ? 45 : 35),
                    const SizedBox(height: 32),
                    Text(
                      l10n.moreLikeThis,
                      style: TextStyle(
                        fontSize: desktopLayout ? 20 : 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: _textShadows,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 1; i < 8; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: desktopLayout ? 150 : 120,
                                    child: AspectRatio(
                                      aspectRatio: 2 / 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: _artwork(
                                          _itemAt(items, i).posterUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    width: desktopLayout ? 150 : 120,
                                    child: Text(
                                      _itemAt(items, i).title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: _textShadows,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _modernDetail(BuildContext context, MediaBarSlideItem item) {
  final l10n = AppLocalizations.of(context);
  final landscape = !_phone;
  final base = AppColorScheme.background;
  const gradientScale = 0.58;

  final metaStyle = TextStyle(
    fontSize: 14,
    color: AppColorScheme.onSurface.withValues(alpha: 0.75),
  );
  final metaChildren = <Widget>[
    if (item.year != null) Text('${item.year}', style: metaStyle),
    if (item.officialRating != null)
      Text(item.officialRating!, style: metaStyle),
    if (item.runtime != null)
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.schedule,
            size: 14,
            color: AppColorScheme.onSurface.withValues(alpha: 0.75),
          ),
          const SizedBox(width: 4),
          Text(_runtimeText(item.runtime), style: metaStyle),
        ],
      ),
    if (item.genres.isNotEmpty)
      Text(item.genres.take(3).join(' · '), style: metaStyle),
  ];
  final meta = Wrap(
    spacing: 8,
    runSpacing: 6,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      for (var i = 0; i < metaChildren.length; i++) ...[
        if (i > 0) Text('·', style: metaStyle),
        metaChildren[i],
      ],
    ],
  );

  Widget pillTab(String label, {bool selected = false}) => Container(
    height: 38,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: selected ? AppColorScheme.accent : null,
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        color: selected
            ? AppColorScheme.onAccent
            : AppColorScheme.onSurface.withValues(alpha: 0.75),
      ),
    ),
  );

  final tabBar = SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const NeverScrollableScrollPhysics(),
    child: Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          pillTab(l10n.cast, selected: true),
          pillTab(l10n.studios),
          pillTab(l10n.chapters),
          pillTab(l10n.details),
          if (landscape) pillTab(l10n.moreLikeThis),
        ],
      ),
    ),
  );

  Widget circleButton(IconData icon, double diameter) => Container(
    width: diameter,
    height: diameter,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withValues(alpha: 0.06),
      border: Border.all(
        color: AppColorScheme.onSurface.withValues(alpha: 0.35),
        width: 1.5,
      ),
    ),
    child: Icon(icon, size: 24, color: AppColorScheme.onSurface),
  );

  final playPill = Container(
    height: landscape ? 54 : 50,
    constraints: landscape ? const BoxConstraints(minWidth: 200) : null,
    width: landscape ? null : double.infinity,
    padding: const EdgeInsets.only(left: 10, right: 14),
    decoration: BoxDecoration(
      color: AppColorScheme.accent,
      borderRadius: BorderRadius.circular(landscape ? 27 : 25),
    ),
    child: Row(
      mainAxisSize: landscape ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.play_arrow_rounded,
          size: 24,
          color: AppColorScheme.onAccent,
        ),
        const SizedBox(width: 4),
        Text(
          l10n.play,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            height: 1.1,
            color: AppColorScheme.onAccent,
          ),
        ),
      ],
    ),
  );

  final hero = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _logoOrTitle(
        item,
        width: landscape ? 300 : 260,
        height: landscape ? 75 : 64,
        fallbackStyle: TextStyle(
          fontSize: landscape ? 34 : 26,
          fontWeight: FontWeight.w700,
          color: AppColorScheme.onSurface,
        ),
      ),
      const SizedBox(height: 10),
      meta,
      const SizedBox(height: 6),
      _communityRating(item),
      if (item.overview != null) ...[
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Text(
            item.overview!,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: AppColorScheme.onSurface.withValues(alpha: 0.85),
            ),
          ),
        ),
      ],
      const SizedBox(height: 24),
      if (landscape)
        Row(
          children: [
            playPill,
            const SizedBox(width: 8),
            circleButton(Icons.favorite_border_rounded, 52),
            const SizedBox(width: 8),
            circleButton(Icons.check_rounded, 52),
            const SizedBox(width: 8),
            circleButton(Icons.more_horiz_rounded, 52),
          ],
        )
      else ...[
        playPill,
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            circleButton(Icons.favorite_border_rounded, 48),
            circleButton(Icons.check_rounded, 48),
            circleButton(Icons.subtitles_outlined, 48),
            circleButton(Icons.more_horiz_rounded, 48),
          ],
        ),
      ],
      SizedBox(height: landscape ? 16 : 24),
      tabBar,
      SizedBox(height: landscape ? 8 : 12),
      _castPlaceholderRow(avatarRadius: landscape ? 45 : 35),
    ],
  );

  return Stack(
    fit: StackFit.expand,
    children: [
      ColoredBox(color: base),
      _artwork(
        item.backdropUrl,
        alignment: landscape ? Alignment.centerRight : Alignment.topCenter,
      ),
      ColoredBox(color: Colors.black.withValues(alpha: 0.32)),
      if (landscape) ...[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                base.withValues(alpha: 1.0 * gradientScale),
                base.withValues(alpha: 0.90 * gradientScale),
                base.withValues(alpha: 0.45 * gradientScale),
                base.withValues(alpha: 0.0),
              ],
              stops: const [0.0, 0.35, 0.60, 0.85],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                base.withValues(alpha: 1.0 * gradientScale),
                base.withValues(alpha: 0.80 * gradientScale),
                base.withValues(alpha: 0.0),
              ],
              stops: const [0.0, 0.45, 0.80],
            ),
          ),
        ),
      ] else
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                base.withValues(alpha: 0.15 * gradientScale),
                base.withValues(alpha: 0.45 * gradientScale),
                base.withValues(alpha: 0.85 * gradientScale),
              ],
              stops: const [0.0, 0.55, 1.0],
            ),
          ),
        ),
      ClipRect(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: double.infinity,
          child: landscape
              ? Padding(
                  padding: EdgeInsets.fromLTRB(40, _tv ? 71 : 68, 40, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: (_designSize().width * 0.85).clamp(450.0, 1100.0),
                      child: hero,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: _designSize().height * 0.26 + 60,
                  ),
                  child: hero,
                ),
        ),
      ),
    ],
  );
}

// ---------------------------------------------------------------------------
// Drawn stand-ins, shown until the artwork loads or when a first run lands
// mid-scan and the library is still empty.
// ---------------------------------------------------------------------------

Color get _posterFill => AppColorScheme.onSurface.withValues(alpha: 0.16);
Color get _strong => AppColorScheme.onSurface.withValues(alpha: 0.78);
Color get _weak => AppColorScheme.onSurface.withValues(alpha: 0.3);

Widget _bar(double width, double height, Color color) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: color,
    borderRadius: AppRadius.circular(height / 2),
  ),
);

Widget _posterCard(double width) => SizedBox(
  width: width,
  child: AspectRatio(
    aspectRatio: 2 / 3,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: _posterFill,
        borderRadius: AppRadius.circular(3),
      ),
    ),
  ),
);

Widget _backdrop() => DecoratedBox(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColorScheme.accent.withValues(alpha: 0.34),
        AppColorScheme.surface,
      ],
    ),
  ),
  child: const SizedBox.expand(),
);

Widget _fallbackMediaBar(String mode) => switch (mode) {
  UserPreferences.mediaBarModeMoonfin => Stack(
    fit: StackFit.expand,
    children: [
      _backdrop(),
      Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceSm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [_bar(46, 4, _strong), _bar(28, 4, _weak)],
        ),
      ),
    ],
  ),
  UserPreferences.mediaBarModeMakd => Stack(
    fit: StackFit.expand,
    children: [
      _backdrop(),
      Center(
        child: FractionallySizedBox(
          widthFactor: 0.56,
          heightFactor: 0.62,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface.withValues(alpha: 0.1),
              borderRadius: AppRadius.circular(6),
              border: Border.all(
                color: AppColorScheme.onSurface.withValues(alpha: 0.16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [_bar(34, 4, _strong), _bar(20, 4, _weak)],
            ),
          ),
        ),
      ),
    ],
  ),
  UserPreferences.mediaBarModeBookshelf => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: [for (var i = 0; i < 5; i++) _posterCard(18)],
    ),
  ),
  UserPreferences.mediaBarModeGallery => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6,
      children: [
        Opacity(opacity: 0.5, child: _posterCard(14)),
        Opacity(opacity: 0.5, child: _posterCard(14)),
        _posterCard(22),
        Opacity(opacity: 0.5, child: _posterCard(14)),
        Opacity(opacity: 0.5, child: _posterCard(14)),
      ],
    ),
  ),
  UserPreferences.mediaBarModeAya => Padding(
    padding: const EdgeInsets.all(6),
    child: Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(borderRadius: AppRadius.circular(6), child: _backdrop()),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.topLeft,
            child: _bar(42, 5, _strong),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Row(
            spacing: 2,
            children: [
              _bar(8, 2, _strong),
              _bar(5, 2, _weak),
              _bar(5, 2, _weak),
            ],
          ),
        ),
      ],
    ),
  ),
  UserPreferences.mediaBarModeBanner => Stack(
    fit: StackFit.expand,
    children: [
      _backdrop(),
      Center(
        child: FractionallySizedBox(
          widthFactor: 0.88,
          heightFactor: 0.44,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface.withValues(alpha: 0.12),
              borderRadius: AppRadius.circular(5),
            ),
            child: _bar(38, 4, _strong),
          ),
        ),
      ),
    ],
  ),
  _ => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        _bar(30, 3, _weak),
        Row(
          spacing: 4,
          children: [for (var i = 0; i < 4; i++) _posterCard(13)],
        ),
        _bar(30, 3, _weak),
      ],
    ),
  ),
};

Widget _fallbackHomeRows({required bool modern}) => Padding(
  padding: const EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 9,
    children: [
      for (var row = 0; row < 2; row++) ...[
        _bar(44, 3, _weak),
        Row(
          spacing: modern ? 7 : 5,
          children: [
            for (var i = 0; i < (modern ? 4 : 6); i++)
              if (modern)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3,
                  children: [_posterCard(26), _bar(18, 3, _weak)],
                )
              else
                _posterCard(18),
          ],
        ),
      ],
    ],
  ),
);

Widget _fallbackDetail({required bool modern}) {
  if (!modern) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          _posterCard(30),
          _bar(50, 4, _strong),
          _bar(32, 3, _weak),
          Container(
            width: 34,
            height: 10,
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface.withValues(alpha: 0.85),
              borderRadius: AppRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 4, child: _backdrop()),
      Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(0, -12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [_bar(46, 4, _strong), _bar(30, 3, _weak)],
                ),
              ),
              const Spacer(),
              Row(
                spacing: 8,
                children: [
                  _bar(16, 3, _strong),
                  _bar(16, 3, _weak),
                  _bar(16, 3, _weak),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
