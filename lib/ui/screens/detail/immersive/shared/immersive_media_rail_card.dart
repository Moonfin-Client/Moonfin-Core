import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/offline_aware_image.dart';
import 'immersive_overflow_text.dart';

class ImmersiveMediaRailMetrics {
  static const double visibleItemCount = 4.15;
  static const double itemGap = 40.0;
  static const double metadataHeight = 58.0;

  static double cardWidth(double availableWidth) {
    return (availableWidth - (visibleItemCount.floor() * itemGap)) /
        visibleItemCount;
  }

  static double artworkHeight(double cardWidth) {
    return cardWidth * 9 / 16;
  }

  static double cardHeight(double cardWidth) {
    return artworkHeight(cardWidth) + metadataHeight;
  }
}

class ImmersiveMediaRailCard extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final String? subtitle;
  final String? placeholderLabel;

  final double width;
  final double artworkHeight;

  final bool isFocused;
  final bool isFavorite;
  final bool isPlayed;
  final double progress;

  final VoidCallback onTap;

  const ImmersiveMediaRailCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.width,
    required this.artworkHeight,
    required this.isFocused,
    required this.onTap,
    this.subtitle,
    this.placeholderLabel,
    this.isFavorite = false,
    this.isPlayed = false,
    this.progress = 0,
  });

  @override
  State<ImmersiveMediaRailCard> createState() => _ImmersiveMediaRailCardState();
}

class _ImmersiveMediaRailCardState extends State<ImmersiveMediaRailCard> {
  static const Duration _motionDuration = Duration(milliseconds: 180);

  static const Duration _statusShowDuration = Duration(milliseconds: 180);

  static const Duration _statusHideDuration = Duration(milliseconds: 140);

  bool _hovered = false;

  bool get _active => widget.isFocused || _hovered;

  double get _progress {
    if (!widget.progress.isFinite) {
      return 0;
    }

    return widget.progress.clamp(0.0, 1.0).toDouble();
  }

  void _setHovered(bool hovered) {
    if (!mounted || _hovered == hovered) {
      return;
    }

    setState(() {
      _hovered = hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = AppColorScheme.onSurface;

    final title = widget.title.trim();
    final subtitle = widget.subtitle?.trim();

    final progress = _progress;
    final showProgress = progress > 0 && progress < 1;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        _setHovered(true);
      },
      onExit: (_) {
        _setHovered(false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _active ? 1.015 : 1,
          duration: _motionDuration,
          curve: Curves.easeOutCubic,
          child: SizedBox(
            width: widget.width,
            height:
                widget.artworkHeight + ImmersiveMediaRailMetrics.metadataHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  duration: _motionDuration,
                  curve: Curves.easeOutCubic,
                  width: widget.width,
                  height: widget.artworkHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: _active
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.30),
                              blurRadius: 22,
                              offset: const Offset(0, 7),
                            ),
                            if (widget.isFocused)
                              BoxShadow(
                                color: foreground.withValues(alpha: 0.07),
                                blurRadius: 14,
                                spreadRadius: 1,
                              ),
                          ]
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (widget.imageUrl != null &&
                            widget.imageUrl!.isNotEmpty)
                          OfflineAwareImage(
                            imageUrl: widget.imageUrl!,
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) {
                              return _buildPlaceholder(context, foreground);
                            },
                          )
                        else
                          _buildPlaceholder(context, foreground),

                        Positioned(
                          top: 10,
                          left: 10,
                          child: AnimatedSwitcher(
                            duration: _statusShowDuration,
                            reverseDuration: _statusHideDuration,
                            switchInCurve: Curves.easeOutCubic,
                            switchOutCurve: Curves.easeInCubic,
                            layoutBuilder: (currentChild, previousChildren) {
                              return Stack(
                                alignment: Alignment.topLeft,
                                clipBehavior: Clip.none,
                                children: [...previousChildren, ?currentChild],
                              );
                            },
                            transitionBuilder: (child, animation) {
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              );

                              return FadeTransition(
                                opacity: curvedAnimation,
                                child: ScaleTransition(
                                  alignment: Alignment.topLeft,
                                  scale: Tween<double>(
                                    begin: 0.92,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              );
                            },
                            child: widget.isFavorite
                                ? const _ImmersiveFavoriteIndicator(
                                    key: ValueKey('favorite'),
                                  )
                                : const SizedBox(
                                    key: ValueKey('favorite-empty'),
                                    width: 26,
                                    height: 26,
                                  ),
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 10,
                          child: AnimatedSwitcher(
                            duration: _statusShowDuration,
                            reverseDuration: _statusHideDuration,
                            switchInCurve: Curves.easeOutCubic,
                            switchOutCurve: Curves.easeInCubic,
                            layoutBuilder: (currentChild, previousChildren) {
                              return Stack(
                                alignment: Alignment.topRight,
                                clipBehavior: Clip.none,
                                children: [...previousChildren, ?currentChild],
                              );
                            },
                            transitionBuilder: (child, animation) {
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              );

                              return FadeTransition(
                                opacity: curvedAnimation,
                                child: ScaleTransition(
                                  alignment: Alignment.topRight,
                                  scale: Tween<double>(
                                    begin: 0.92,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              );
                            },
                            child: widget.isPlayed
                                ? Container(
                                    key: const ValueKey('watched'),
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.28,
                                          ),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: theme.colorScheme.onPrimary,
                                      size: 17,
                                    ),
                                  )
                                : const SizedBox(
                                    key: ValueKey('watched-empty'),
                                    width: 26,
                                    height: 26,
                                  ),
                          ),
                        ),

                        if (showProgress)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 3,
                              backgroundColor: foreground.withValues(
                                alpha: 0.18,
                              ),
                              color: theme.colorScheme.primary,
                            ),
                          ),

                        Positioned.fill(
                          child: IgnorePointer(
                            child: AnimatedContainer(
                              duration: _motionDuration,
                              curve: Curves.easeOutCubic,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: widget.isFocused
                                      ? foreground.withValues(alpha: 0.96)
                                      : foreground.withValues(alpha: 0.08),
                                  width: widget.isFocused ? 2 : 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                if (title.isNotEmpty)
                  SizedBox(
                    height: 22,
                    child: ImmersiveOverflowText(
                      text: title,
                      active: _active,
                      horizontalPadding: 8,
                      pixelsPerSecond: 40,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: foreground.withValues(alpha: _active ? 1 : 0.92),
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                      ),
                    ),
                  ),

                if (subtitle != null && subtitle.isNotEmpty) ...[
                  if (title.isNotEmpty) const SizedBox(height: 3),

                  SizedBox(
                    height: 18,
                    child: ImmersiveOverflowText(
                      text: subtitle,
                      active: _active,
                      horizontalPadding: 8,
                      pixelsPerSecond: 36,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: foreground.withValues(alpha: 0.56),
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, Color foreground) {
    final theme = Theme.of(context);

    final label = (widget.placeholderLabel ?? widget.title).trim();

    if (label.isEmpty) {
      return ColoredBox(
        color: foreground.withValues(alpha: 0.055),
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 34,
            color: foreground.withValues(alpha: 0.28),
          ),
        ),
      );
    }

    return ColoredBox(
      color: foreground.withValues(alpha: 0.055),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            label.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(
              color: foreground.withValues(alpha: 0.38),
              fontWeight: FontWeight.w700,
              letterSpacing: 2.2,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}

class _ImmersiveFavoriteIndicator extends StatelessWidget {
  const _ImmersiveFavoriteIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: AppColorScheme.recordingActive,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.favorite_rounded, color: Colors.white, size: 17),
    );
  }
}
