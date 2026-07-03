import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../bounded_network_image.dart';
import 'gallery_glow.dart';

class GalleryCoverflow extends StatefulWidget {
  static const int kCoverDecodeWidth = 600;

  final List<MediaBarSlideItem> items;
  final int activeIndex;
  final ValueChanged<int> onSelect;
  final VoidCallback onInfo;
  final VoidCallback onPlay;
  final Widget? activeRatings;
  final Widget? activeTrailer;
  final bool trailerActive;

  const GalleryCoverflow({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    required this.onInfo,
    required this.onPlay,
    this.activeRatings,
    this.activeTrailer,
    this.trailerActive = false,
  });

  @override
  State<GalleryCoverflow> createState() => _GalleryCoverflowState();
}

class _GalleryCoverflowState extends State<GalleryCoverflow> {
  static const double _viewportFraction = 0.64;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: _viewportFraction,
      initialPage: widget.activeIndex,
    );
  }

  @override
  void didUpdateWidget(GalleryCoverflow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeIndex != oldWidget.activeIndex &&
        _controller.hasClients &&
        _controller.page?.round() != widget.activeIndex) {
      _controller.animateToPage(
        widget.activeIndex,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();
    final active = widget.items[widget.activeIndex.clamp(
      0,
      widget.items.length - 1,
    )];
    final glow = glowColorForGenres(active.genres);
    final topInset = MediaQuery.paddingOf(context).top;

    return Stack(
      fit: StackFit.expand,
      children: [
        _AmbientGlow(color: glow),
        Padding(
          padding: EdgeInsets.only(top: topInset + 8),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                controller: _controller,
                itemCount: widget.items.length,
                onPageChanged: widget.onSelect,
                clipBehavior: Clip.none,
                itemBuilder: (context, i) {
                  final item = widget.items[i];
                  final imageUrl = item.posterUrl ?? item.backdropUrl;
                  final Widget cardImage = imageUrl == null
                      ? ColoredBox(color: AppColorScheme.surface)
                      : BoundedNetworkImage(
                          imageUrl: imageUrl,
                          minWidth: GalleryCoverflow.kCoverDecodeWidth,
                          maxWidth: GalleryCoverflow.kCoverDecodeWidth,
                          errorBuilder: (_, _, _) =>
                              ColoredBox(color: AppColorScheme.surface),
                        );
                  return AnimatedBuilder(
                    animation: _controller,
                    child: cardImage,
                    builder: (context, child) {
                      final page =
                          _controller.hasClients &&
                              _controller.position.haveDimensions
                          ? (_controller.page ?? widget.activeIndex.toDouble())
                          : widget.activeIndex.toDouble();
                      final delta = i - page;
                      final isCenter = delta.abs() < 0.5;
                      return _Cover(
                        image: child!,
                        delta: delta,
                        accent: glow,
                        trailer: isCenter ? widget.activeTrailer : null,
                        trailerActive: isCenter && widget.trailerActive,
                        onTap: isCenter
                            ? widget.onInfo
                            : () => widget.onSelect(i),
                        onLongPress: isCenter ? widget.onPlay : null,
                      );
                    },
                  );
                },
              ),
            ),
              _Info(item: active, ratings: widget.activeRatings),
              const SizedBox(height: 10),
              _Dots(count: widget.items.length, active: widget.activeIndex),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _Cover extends StatelessWidget {
  final Widget image;
  final double delta;
  final Color accent;
  final Widget? trailer;
  final bool trailerActive;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const _Cover({
    required this.image,
    required this.delta,
    required this.accent,
    required this.trailer,
    required this.trailerActive,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final t = (1 - delta.abs()).clamp(0.0, 1.0);
    final scale = 0.82 + 0.18 * t;
    final rotation = (-delta).clamp(-1.0, 1.0) * 0.34;
    final dim = 0.45 + 0.55 * t;

    return Center(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0012)
          ..rotateY(rotation)
          ..scaleByDouble(scale, scale, 1.0, 1.0),
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.5 * t),
                    blurRadius: 30 * t,
                    spreadRadius: 1.5 * t,
                  ),
                  BoxShadow(
                    color: AppColorScheme.scrim.withValues(alpha: 0.55),
                    blurRadius: 22,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circular(14),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    image,
                    ColoredBox(color: Colors.black.withValues(alpha: 1 - dim)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.12,
                          ),
                        ),
                        borderRadius: AppRadius.circular(14),
                      ),
                    ),
                    if (trailer != null && trailerActive) trailer!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final MediaBarSlideItem item;
  final Widget? ratings;

  const _Info({required this.item, required this.ratings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadows = <Shadow>[
      Shadow(blurRadius: 10, color: AppColorScheme.scrim.withValues(alpha: 0.8)),
    ];
    final meta = <String>[
      if (item.year != null) '${item.year}',
      if (item.itemType != 'Series' && item.runtime != null)
        _formatRuntime(item.runtime!),
      if (item.officialRating != null) item.officialRating!,
    ].join('  ·  ');

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColorScheme.onSurface,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
              shadows: shadows,
            ),
          ),
          if (meta.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              meta,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (ratings != null) ...[
            const SizedBox(height: 10),
            ratings!,
          ],
        ],
      ),
    );
  }

  String _formatRuntime(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    return h > 0 ? '${h}h ${m}m' : '${m}m';
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int active;

  const _Dots({required this.count, required this.active});

  @override
  Widget build(BuildContext context) {
    final shown = math.min(count, 7);
    final start = (active - shown ~/ 2).clamp(0, math.max(0, count - shown));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = start; i < start + shown; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == active ? 18 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == active
                  ? AppColorScheme.onSurface
                  : AppColorScheme.onSurface.withValues(alpha: 0.3),
              borderRadius: AppRadius.circular(3),
            ),
          ),
      ],
    );
  }
}

class _AmbientGlow extends StatelessWidget {
  final Color color;

  const _AmbientGlow({required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: DecoratedBox(
        key: ValueKey<int>(color.toARGB32()),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.35),
            radius: 1.0,
            colors: [
              color.withValues(alpha: 0.4),
              color.withValues(alpha: 0.12),
              AppColorScheme.background.withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
