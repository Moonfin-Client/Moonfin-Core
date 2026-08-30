import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../util/platform_detection.dart';
import '../../../../widgets/offline_aware_image.dart';
import 'immersive_overflow_text.dart';

class ImmersivePosterCard extends StatefulWidget {
  final String? imageUrl;

  final String title;
  final String? subtitle;

  final double width;
  final double height;

  final bool isFocused;

  final bool isFavorite;
  final bool isPlayed;
  final double progress;

  final IconData placeholderIcon;

  final Widget? topRightOverlay;

  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ImmersivePosterCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    required this.width,
    required this.height,
    required this.isFocused,
    this.isFavorite = false,
    this.isPlayed = false,
    this.progress = 0,
    this.placeholderIcon = Icons.movie_outlined,
    this.topRightOverlay,
    required this.onTap,
    this.onLongPress,
  });

  @override
  State<ImmersivePosterCard> createState() => _ImmersivePosterCardState();
}

class _ImmersivePosterCardState extends State<ImmersivePosterCard> {
  static const Duration _focusMotionDuration = Duration(milliseconds: 160);
  static const Duration _secondaryMotionDuration = Duration(milliseconds: 210);
  static const Duration _secondaryEffectDelay = Duration(milliseconds: 120);
  static const Duration _infoShowDuration = Duration(milliseconds: 280);
  static const Duration _infoHideDuration = Duration(milliseconds: 180);
  static const Duration _statusShowDuration = Duration(milliseconds: 180);
  static const Duration _statusHideDuration = Duration(milliseconds: 140);

  Timer? _secondaryEffectTimer;

  bool _hovered = false;
  bool _secondaryActive = false;

  bool get _active => widget.isFocused || _hovered;

  bool get _hasSubtitle {
    final subtitle = widget.subtitle;

    return subtitle != null && subtitle.trim().isNotEmpty;
  }

  double get _progress {
    if (!widget.progress.isFinite) {
      return 0;
    }

    return widget.progress.clamp(0.0, 1.0).toDouble();
  }

  bool _isCompact(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  @override
  void initState() {
    super.initState();

    if (widget.isFocused) {
      _scheduleSecondaryEffect(true);
    }
  }

  @override
  void didUpdateWidget(covariant ImmersivePosterCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldActive = oldWidget.isFocused || _hovered;

    if (oldActive != _active) {
      _scheduleSecondaryEffect(_active);
    }
  }

  @override
  void dispose() {
    _secondaryEffectTimer?.cancel();

    super.dispose();
  }

  void _setHovered(bool hovered) {
    if (!mounted || _hovered == hovered) {
      return;
    }

    _secondaryEffectTimer?.cancel();

    setState(() {
      _hovered = hovered;

      if (hovered) {
        _secondaryActive = true;
      }
    });

    if (!hovered) {
      _scheduleSecondaryEffect(widget.isFocused);
    }
  }

  void _scheduleSecondaryEffect(bool active) {
    _secondaryEffectTimer?.cancel();
    _secondaryEffectTimer = null;

    if (!active) {
      if (_secondaryActive && mounted) {
        setState(() {
          _secondaryActive = false;
        });
      }

      return;
    }

    if (_hovered) {
      if (!_secondaryActive && mounted) {
        setState(() {
          _secondaryActive = true;
        });
      }

      return;
    }

    if (_secondaryActive) {
      return;
    }

    _secondaryEffectTimer = Timer(_secondaryEffectDelay, () {
      if (!mounted || !widget.isFocused || _hovered || _secondaryActive) {
        return;
      }

      setState(() {
        _secondaryActive = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = AppColorScheme.onSurface;

    final progress = _progress;

    final title = widget.title.trim();
    final subtitle = widget.subtitle?.trim();

    final compact = _isCompact(context);

    final overlayHeight = _hasSubtitle ? 62.0 : 42.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onSecondaryTap: widget.onLongPress,
        child: AnimatedContainer(
          duration: _focusMotionDuration,
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isFocused
                  ? foreground.withValues(alpha: 0.92)
                  : foreground.withValues(alpha: 0.08),
              width: widget.isFocused ? 2 : 1,
            ),
            boxShadow: _active
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.27),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                    if (widget.isFocused)
                      BoxShadow(
                        color: foreground.withValues(alpha: 0.055),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                      ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.isFocused ? 14 : 15),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedScale(
                  scale: _active
                      ? _secondaryActive
                            ? 1.034
                            : 1.016
                      : 1.0,
                  duration: _secondaryActive
                      ? _secondaryMotionDuration
                      : _focusMotionDuration,
                  curve: Curves.easeOutCubic,
                  child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                      ? OfflineAwareImage(
                          imageUrl: widget.imageUrl!,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) {
                            return _buildPlaceholder(foreground);
                          },
                        )
                      : _buildPlaceholder(foreground),
                ),

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
                                  color: Colors.black.withValues(alpha: 0.28),
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

                if (widget.topRightOverlay != null)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IgnorePointer(child: widget.topRightOverlay!),
                  ),

                if (title.isNotEmpty)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: progress > 0 && progress < 1 ? 3 : 0,
                    child: IgnorePointer(
                      child: compact
                          ? _buildCompactInfoOverlay(
                              context: context,
                              title: title,
                              subtitle: subtitle,
                              foreground: foreground,
                            )
                          : _buildRegularInfoOverlay(
                              context: context,
                              title: title,
                              subtitle: subtitle,
                              foreground: foreground,
                              overlayHeight: overlayHeight,
                            ),
                    ),
                  ),

                if (progress > 0 && progress < 1)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 3,
                      backgroundColor: foreground.withValues(alpha: 0.18),
                      color: theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegularInfoOverlay({
    required BuildContext context,
    required String title,
    required String? subtitle,
    required Color foreground,
    required double overlayHeight,
  }) {
    return AnimatedOpacity(
      opacity: _secondaryActive ? 1.0 : 0.0,
      duration: _secondaryActive ? _infoShowDuration : _infoHideDuration,
      curve: Curves.easeOutCubic,
      child: AnimatedSlide(
        offset: _secondaryActive ? Offset.zero : const Offset(0, 0.18),
        duration: _secondaryActive ? _infoShowDuration : _infoHideDuration,
        curve: Curves.easeOutCubic,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              width: double.infinity,
              height: overlayHeight,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.34),
                border: Border(
                  top: BorderSide(color: foreground.withValues(alpha: 0.08)),
                ),
              ),
              child: _buildInfoContent(
                context: context,
                title: title,
                subtitle: subtitle,
                foreground: foreground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactInfoOverlay({
    required BuildContext context,
    required String title,
    required String? subtitle,
    required Color foreground,
  }) {
    final height = _hasSubtitle ? 92.0 : 70.0;

    return AnimatedOpacity(
      opacity: _secondaryActive ? 1.0 : 0.0,
      duration: _secondaryActive ? _infoShowDuration : _infoHideDuration,
      curve: Curves.easeOutCubic,
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.00, 0.30, 0.62, 1.00],
                  colors: [
                    Colors.transparent,
                    Color.fromRGBO(0, 0, 0, 0.10),
                    Color.fromRGBO(0, 0, 0, 0.52),
                    Color.fromRGBO(0, 0, 0, 0.82),
                  ],
                ),
              ),
            ),

            AnimatedSlide(
              offset: _secondaryActive ? Offset.zero : const Offset(0, 0.06),
              duration: _secondaryActive
                  ? _infoShowDuration
                  : _infoHideDuration,
              curve: Curves.easeOutCubic,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildInfoContent(
                    context: context,
                    title: title,
                    subtitle: subtitle,
                    foreground: foreground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContent({
    required BuildContext context,
    required String title,
    required String? subtitle,
    required Color foreground,
  }) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 24,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: ImmersiveOverflowText(
                text: title,
                active: _secondaryActive,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: foreground.withValues(alpha: 0.94),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.10,
                  height: 1.15,
                ),
              ),
            ),
          ),
        ),

        if (_hasSubtitle) ...[
          const SizedBox(height: 2),

          SizedBox(
            height: 18,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: ImmersiveOverflowText(
                  text: subtitle!,
                  active: _secondaryActive,
                  horizontalPadding: 10,
                  pixelsPerSecond: 36,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: foreground.withValues(alpha: 0.66),
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPlaceholder(Color foreground) {
    return ColoredBox(
      color: foreground.withValues(alpha: 0.06),
      child: Center(
        child: Icon(
          widget.placeholderIcon,
          size: 40,
          color: foreground.withValues(alpha: 0.38),
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
