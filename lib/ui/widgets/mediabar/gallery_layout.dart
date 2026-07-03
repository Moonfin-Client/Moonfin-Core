import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/gallery_detail.dart';
import '../../../data/models/media_bar_slide_item.dart';
import '../bounded_network_image.dart';
import 'gallery_active_card.dart';
import 'gallery_glow.dart';

class GalleryLayout extends StatelessWidget {
  static const Cubic kExpandCurve = Cubic(0.16, 1, 0.3, 1);
  static const Duration kExpandDuration = Duration(milliseconds: 620);
  static const int kBackdropDecodeWidth = 1280;

  final List<MediaBarSlideItem> items;
  final int activeIndex;

  final ValueChanged<int> onSelect;

  final VoidCallback onInfo;

  final GalleryDetail? Function(String itemId) detailFor;

  final Widget? activeRatings;

  final Widget? activeTrailer;

  final bool trailerActive;

  static const int pageSize = 5;

  const GalleryLayout({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    required this.onInfo,
    required this.detailFor,
    this.activeRatings,
    this.activeTrailer,
    this.trailerActive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final safeActive = activeIndex.clamp(0, items.length - 1);
    final pageStart = (safeActive ~/ pageSize) * pageSize;
    final pageEnd = (pageStart + pageSize).clamp(0, items.length);
    final panels = items.sublist(pageStart, pageEnd);
    final activeInPage = safeActive - pageStart;
    final activeItem = panels[activeInPage];
    final glow = glowColorForGenres(activeItem.genres);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight;
        final topMargin = totalHeight * 0.09;
        final bottomMargin = totalHeight * 0.03;
        final barHeight = totalHeight - topMargin - bottomMargin;

        return Stack(
          fit: StackFit.expand,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: DecoratedBox(
                key: ValueKey<int>(glow.toARGB32()),
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
                child: const SizedBox.expand(),
              ),
            ),
            Positioned(
              top: topMargin,
              left: 0,
              right: 0,
              height: barHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: AppRadius.circular(18),
                  child: Row(
                    children: [
                      for (var i = 0; i < panels.length; i++)
                        _Panel(
                          item: panels[i],
                          index: pageStart + i,
                          isActive: i == activeInPage,
                          accent: glowColorForGenres(panels[i].genres),
                          detail: detailFor(panels[i].itemId),
                          ratings: i == activeInPage ? activeRatings : null,
                          trailer: i == activeInPage ? activeTrailer : null,
                          trailerActive: i == activeInPage && trailerActive,
                          onSelect: () => onSelect(pageStart + i),
                          onInfo: onInfo,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Panel extends StatelessWidget {
  final MediaBarSlideItem item;
  final int index;
  final bool isActive;
  final Color accent;
  final GalleryDetail? detail;
  final Widget? ratings;
  final Widget? trailer;
  final bool trailerActive;
  final VoidCallback onSelect;
  final VoidCallback onInfo;

  const _Panel({
    required this.item,
    required this.index,
    required this.isActive,
    required this.accent,
    required this.detail,
    required this.ratings,
    required this.trailer,
    required this.trailerActive,
    required this.onSelect,
    required this.onInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: isActive ? 16 : 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: isActive ? 1 : 0, end: isActive ? 1 : 0),
        duration: GalleryLayout.kExpandDuration,
        curve: GalleryLayout.kExpandCurve,
        child: _backdropImage(),
        builder: (context, t, child) {
          return MouseRegion(
            onEnter: (_) {
              if (!isActive) onSelect();
            },
            child: GestureDetector(
              onTap: isActive ? onInfo : onSelect,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                      child: Opacity(
                        opacity: 1 - t,
                        child: Center(
                          child: Text(
                            (index + 1).toString().padLeft(2, '0'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.85,
                              ),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.circular(14),
                          boxShadow: t > 0.01
                              ? [
                                  BoxShadow(
                                    color: accent.withValues(alpha: 0.55 * t),
                                    blurRadius: 26 * t,
                                    spreadRadius: t,
                                  ),
                                ]
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: AppRadius.circular(14),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              _backdrop(t, child!),
                              if (trailer != null && t > 0.01) trailer!,
                              AnimatedOpacity(
                                opacity: trailerActive ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 400),
                                child: _scrim(t),
                              ),
                              Opacity(
                                opacity: 1 - t,
                                child: IgnorePointer(
                                  ignoring: isActive,
                                  child: _IdlePanelContent(
                                    item: item,
                                    accent: accent,
                                  ),
                                ),
                              ),
                              if (t > 0.01)
                                Opacity(
                                  opacity: t,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      28,
                                      24,
                                      24,
                                      24,
                                    ),
                                    child: GalleryActiveCard(
                                      item: item,
                                      detail: detail,
                                      accent: accent,
                                      ratings: ratings,
                                      compact: trailerActive,
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
          );
        },
      ),
    );
  }

  Widget _backdropImage() {
    return item.backdropUrl == null
        ? ColoredBox(color: AppColorScheme.surface)
        : BoundedNetworkImage(
            imageUrl: item.backdropUrl!,
            minWidth: GalleryLayout.kBackdropDecodeWidth,
            maxWidth: GalleryLayout.kBackdropDecodeWidth,
            errorBuilder: (_, _, _) =>
                ColoredBox(color: AppColorScheme.surface),
          );
  }

  Widget _backdrop(double t, Widget image) {
    final opacity = 0.35 + 0.65 * t;
    return Opacity(opacity: opacity, child: image);
  }

  Widget _scrim(double t) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColorScheme.scrim.withValues(alpha: 0.7 * t + 0.25),
              AppColorScheme.scrim.withValues(alpha: 0.15 * t),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdlePanelContent extends StatelessWidget {
  final MediaBarSlideItem item;
  final Color accent;

  const _IdlePanelContent({
    required this.item,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final titleRegion = constraints.maxHeight * 0.72;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _line()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: titleRegion,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      item.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: AppColorScheme.scrim.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: _line()),
          ],
        );
      },
    );
  }

  Widget _line() => Center(
        child: Container(
          width: 2,
          height: double.infinity,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.7),
            borderRadius: AppRadius.circular(1),
          ),
        ),
      );
}
