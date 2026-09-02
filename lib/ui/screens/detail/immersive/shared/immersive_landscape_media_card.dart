import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../util/focus/dpad_keys.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';
import '../../../../widgets/offline_aware_image.dart';

class ImmersiveLandscapeMediaCard extends StatefulWidget {
  final AggregatedItem item;
  final String? imageUrl;

  final double width;
  final double imageHeight;

  final bool isFocused;
  final bool isNextUp;
  final bool suppressArtworkFocus;

  /// Compact touch-first presentation used on phones in both orientations.
  final bool compactLayout;

  final VoidCallback? onArtworkSelect;
  final VoidCallback? onContextAction;
  final VoidCallback? onDetailsSelect;

  final bool Function()? onDetailsNavigateUp;
  final bool Function()? onDetailsNavigateDown;

  final VoidCallback? onDetailsNavigateLeft;
  final VoidCallback? onDetailsNavigateRight;

  final ValueChanged<bool>? onDetailsFocusChange;

  const ImmersiveLandscapeMediaCard({
    super.key,
    required this.item,
    required this.imageUrl,
    required this.width,
    required this.imageHeight,
    required this.isFocused,
    required this.isNextUp,
    required this.suppressArtworkFocus,
    this.compactLayout = false,
    this.onArtworkSelect,
    this.onContextAction,
    this.onDetailsSelect,
    this.onDetailsNavigateUp,
    this.onDetailsNavigateDown,
    this.onDetailsNavigateLeft,
    this.onDetailsNavigateRight,
    this.onDetailsFocusChange,
  });

  @override
  State<ImmersiveLandscapeMediaCard> createState() =>
      ImmersiveLandscapeMediaCardState();
}

class ImmersiveLandscapeMediaCardState
    extends State<ImmersiveLandscapeMediaCard> {
  static const Duration _focusMotionDuration = Duration(milliseconds: 160);
  static const Duration _secondaryMotionDuration = Duration(milliseconds: 210);
  static const Duration _secondaryEffectDelay = Duration(milliseconds: 120);
  static const Duration _playShowDuration = Duration(milliseconds: 190);
  static const Duration _playHideDuration = Duration(milliseconds: 130);
  static const Duration _statusShowDuration = Duration(milliseconds: 180);
  static const Duration _statusHideDuration = Duration(milliseconds: 140);

  late final FocusNode _detailsFocusNode;

  Timer? _secondaryEffectTimer;

  bool _artworkHovered = false;
  bool _detailsHovered = false;
  bool _secondaryArtworkActive = false;

  AggregatedItem get item => widget.item;

  bool get _detailsFocused => _detailsFocusNode.hasFocus;

  bool get _artworkFocused => widget.isFocused && !widget.suppressArtworkFocus;

  bool get _artworkActive => _artworkFocused || _artworkHovered;

  bool get _detailsActive => _detailsFocused || _detailsHovered;

  double get _progress {
    final percentage = item.playedPercentage ?? 0;

    if (!percentage.isFinite) {
      return 0;
    }

    return (percentage / 100).clamp(0.0, 1.0).toDouble();
  }

  bool get _hasProgress {
    final percentage = item.playedPercentage ?? 0;

    return percentage.isFinite && percentage > 0;
  }

  bool get _showFavoriteIndicator => item.isFavorite;

  bool get _showWatchedIndicator => item.isPlayed;

  bool get _showNextUpIndicator => widget.isNextUp && !item.isPlayed;

  bool get _showEpisodeLabel =>
      item.type == 'Episode' && item.indexNumber != null;

  @override
  void initState() {
    super.initState();

    _detailsFocusNode = FocusNode(
      debugLabel: 'immersiveLandscapeMediaDetails-${widget.item.id}',
      skipTraversal: true,
    );

    _detailsFocusNode.addListener(_handleDetailsFocusNodeChange);

    if (_artworkHovered) {
      _secondaryArtworkActive = true;
    } else if (_artworkFocused) {
      _scheduleSecondaryArtworkEffect(true);
    }
  }

  @override
  void didUpdateWidget(covariant ImmersiveLandscapeMediaCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldArtworkFocused =
        oldWidget.isFocused && !oldWidget.suppressArtworkFocus;

    final oldArtworkActive = oldArtworkFocused || _artworkHovered;

    if (oldArtworkActive != _artworkActive) {
      _scheduleSecondaryArtworkEffect(_artworkActive);
    }
  }

  void _handleDetailsFocusNodeChange() {
    if (!mounted) {
      return;
    }

    setState(() {});

    widget.onDetailsFocusChange?.call(_detailsFocusNode.hasFocus);
  }

  void _setArtworkHovered(bool hovered) {
    if (!mounted || _artworkHovered == hovered) {
      return;
    }

    _secondaryEffectTimer?.cancel();

    setState(() {
      _artworkHovered = hovered;

      if (hovered) {
        _secondaryArtworkActive = true;
      }
    });

    if (!hovered) {
      _scheduleSecondaryArtworkEffect(_artworkFocused);
    }
  }

  void _setDetailsHovered(bool hovered) {
    if (!mounted || _detailsHovered == hovered) {
      return;
    }

    setState(() {
      _detailsHovered = hovered;
    });
  }

  void _scheduleSecondaryArtworkEffect(bool active) {
    _secondaryEffectTimer?.cancel();
    _secondaryEffectTimer = null;

    if (!active) {
      if (_secondaryArtworkActive && mounted) {
        setState(() {
          _secondaryArtworkActive = false;
        });
      }

      return;
    }

    if (_artworkHovered) {
      if (!_secondaryArtworkActive && mounted) {
        setState(() {
          _secondaryArtworkActive = true;
        });
      }

      return;
    }

    if (_secondaryArtworkActive) {
      return;
    }

    _secondaryEffectTimer = Timer(_secondaryEffectDelay, () {
      if (!mounted ||
          !_artworkFocused ||
          _artworkHovered ||
          _secondaryArtworkActive) {
        return;
      }

      setState(() {
        _secondaryArtworkActive = true;
      });
    });
  }

  bool requestDetailsFocus() {
    if (!_detailsFocusNode.canRequestFocus ||
        _detailsFocusNode.context == null) {
      return false;
    }

    _detailsFocusNode.requestFocus();

    return true;
  }

  Widget _buildArtworkPlaceholder(Color foreground) {
    return ColoredBox(
      color: foreground.withValues(alpha: 0.06),
      child: Center(
        child: Icon(
          _placeholderIcon,
          color: foreground.withValues(alpha: 0.38),
          size: 36,
        ),
      ),
    );
  }

  IconData get _placeholderIcon {
    return switch (item.type) {
      'Series' => Icons.tv_rounded,
      'Season' => Icons.video_library_outlined,
      'Episode' => Icons.movie_outlined,
      'Movie' => Icons.movie_outlined,
      'Video' => Icons.video_file_outlined,
      _ => Icons.movie_outlined,
    };
  }

  @override
  void dispose() {
    _secondaryEffectTimer?.cancel();

    _detailsFocusNode.removeListener(_handleDetailsFocusNodeChange);
    _detailsFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildArtworkCard(context),
          SizedBox(height: widget.compactLayout ? 10 : 8),
          _buildDetailsCard(context),
        ],
      ),
    );
  }

  Widget _buildArtworkCard(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context);

    final foreground = AppColorScheme.onSurface;
    final background = theme.scaffoldBackgroundColor;

    final compact = widget.compactLayout;

    final progress = _progress;

    final artworkRadius = compact ? 14.0 : 16.0;
    final playButtonSize = compact ? 42.0 : 44.0;

    final showPlayButton = compact || _secondaryArtworkActive;

    return MouseRegion(
      cursor: widget.onArtworkSelect != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) {
        _setArtworkHovered(true);
      },
      onExit: (_) {
        _setArtworkHovered(false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onArtworkSelect,
        onLongPress: widget.onContextAction,
        onSecondaryTap: widget.onContextAction,
        child: AnimatedScale(
          scale: compact ? 1.0 : (_artworkActive ? 1.016 : 1.0),
          duration: _focusMotionDuration,
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: _focusMotionDuration,
            curve: Curves.easeOutCubic,
            width: widget.width,
            height: widget.imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(artworkRadius),
              border: Border.all(
                color: _artworkFocused
                    ? foreground.withValues(alpha: 0.92)
                    : foreground.withValues(alpha: compact ? 0.10 : 0.08),
                width: _artworkFocused ? 2 : 1,
              ),
              boxShadow: _artworkActive && !compact
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.27),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                      if (_artworkFocused)
                        BoxShadow(
                          color: foreground.withValues(alpha: 0.055),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                    ]
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                _artworkFocused ? artworkRadius - 2 : artworkRadius - 1,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRect(
                    child: AnimatedScale(
                      scale: compact
                          ? 1.0
                          : (_secondaryArtworkActive ? 1.018 : 1.0),
                      duration: _secondaryMotionDuration,
                      curve: Curves.easeOutCubic,
                      child: widget.imageUrl != null
                          ? OfflineAwareImage(
                              imageUrl: widget.imageUrl!,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) =>
                                  _buildArtworkPlaceholder(foreground),
                            )
                          : _buildArtworkPlaceholder(foreground),
                    ),
                  ),

                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withValues(
                              alpha: compact ? 0.50 : 0.62,
                            ),
                          ],
                          stops: const [0.0, 0.62, 1.0],
                        ),
                      ),
                    ),
                  ),

                  if (_showEpisodeLabel)
                    Positioned(
                      left: compact ? 12 : 14,
                      bottom: compact ? 12 : 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.30),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: foreground.withValues(alpha: 0.16),
                          ),
                        ),
                        child: Text(
                          l10n.episodeLabel(item.indexNumber!).toUpperCase(),
                          style: textTheme.labelSmall?.copyWith(
                            color: foreground.withValues(alpha: 0.88),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    top: compact ? 9 : 10,
                    left: compact ? 9 : 10,
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
                      child: _showFavoriteIndicator
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
                    top: compact ? 9 : 10,
                    right: compact ? 9 : 10,
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
                      child: _showWatchedIndicator
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
                          : _showNextUpIndicator
                          ? Container(
                              key: const ValueKey('next-up'),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: background.withValues(alpha: 0.68),
                                borderRadius: AppRadius.circular(999),
                                border: Border.fromBorderSide(
                                  ThemeRegistry.active.borders.chipBorder
                                      .copyWith(
                                        color: foreground.withValues(
                                          alpha: 0.18,
                                        ),
                                      ),
                                ),
                              ),
                              child: Text(
                                l10n.upNext.toUpperCase(),
                                style: textTheme.labelSmall?.copyWith(
                                  color: foreground,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                          : const SizedBox(
                              key: ValueKey('media-status-empty'),
                              width: 26,
                              height: 26,
                            ),
                    ),
                  ),

                  Positioned(
                    right: compact ? 10 : 12,
                    bottom: compact ? 10 : 12,
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: showPlayButton ? 1.0 : 0.0,
                        duration: showPlayButton
                            ? _playShowDuration
                            : _playHideDuration,
                        curve: Curves.easeOutCubic,
                        child: AnimatedScale(
                          scale: showPlayButton ? 1.0 : 0.94,
                          duration: showPlayButton
                              ? _playShowDuration
                              : _playHideDuration,
                          curve: Curves.easeOutCubic,
                          child: Container(
                            width: playButtonSize,
                            height: playButtonSize,
                            decoration: BoxDecoration(
                              color: foreground.withValues(
                                alpha: compact ? 0.92 : 0.96,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.24),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: background,
                              size: compact ? 27 : 29,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (_hasProgress && !item.isPlayed)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: compact ? 3.5 : 3,
                        backgroundColor: foreground.withValues(alpha: 0.18),
                        color: theme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final foreground = AppColorScheme.onSurface;

    final overview = (item.overview ?? '').trim();

    if (widget.compactLayout) {
      return MouseRegion(
        cursor: widget.onDetailsSelect != null
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        onEnter: (_) {
          _setDetailsHovered(true);
        },
        onExit: (_) {
          _setDetailsHovered(false);
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onDetailsSelect,
          onLongPress: widget.onContextAction,
          onSecondaryTap: widget.onContextAction,
          child: FocusableWrapper(
            focusNode: _detailsFocusNode,
            suppressFocusGlow: true,
            disableScale: true,
            borderRadius: 12,
            onSelect: widget.onDetailsSelect,
            enableLongPress: widget.onContextAction != null,
            onLongPress: widget.onContextAction,
            onKeyEvent: (_, event) {
              if (!event.isActionable) {
                return KeyEventResult.ignored;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
                  widget.onDetailsNavigateUp != null) {
                return widget.onDetailsNavigateUp!()
                    ? KeyEventResult.handled
                    : KeyEventResult.ignored;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
                  widget.onDetailsNavigateDown != null) {
                return widget.onDetailsNavigateDown!()
                    ? KeyEventResult.handled
                    : KeyEventResult.ignored;
              }

              return KeyEventResult.ignored;
            },
            onNavigateLeft: widget.onDetailsNavigateLeft,
            onNavigateRight: widget.onDetailsNavigateRight,
            child: AnimatedContainer(
              duration: _focusMotionDuration,
              curve: Curves.easeOutCubic,
              width: widget.width,
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 8),
              decoration: BoxDecoration(
                color: _detailsActive
                    ? foreground.withValues(alpha: 0.055)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium?.copyWith(
                            color: foreground,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1.18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 23,
                        color: foreground.withValues(
                          alpha: _detailsActive ? 0.82 : 0.46,
                        ),
                      ),
                    ],
                  ),

                  if (overview.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(
                        overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          color: foreground.withValues(
                            alpha: _detailsActive ? 0.74 : 0.66,
                          ),
                          fontSize: 13.5,
                          height: 1.38,
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

    return MouseRegion(
      cursor: widget.onDetailsSelect != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) {
        _setDetailsHovered(true);
      },
      onExit: (_) {
        _setDetailsHovered(false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onDetailsSelect,
        onSecondaryTap: widget.onContextAction,
        child: FocusableWrapper(
          focusNode: _detailsFocusNode,
          suppressFocusGlow: true,
          disableScale: true,
          borderRadius: 16,
          onSelect: widget.onDetailsSelect,
          enableLongPress: widget.onContextAction != null,
          onLongPress: widget.onContextAction,
          onKeyEvent: (_, event) {
            if (!event.isActionable) {
              return KeyEventResult.ignored;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
                widget.onDetailsNavigateUp != null) {
              return widget.onDetailsNavigateUp!()
                  ? KeyEventResult.handled
                  : KeyEventResult.ignored;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
                widget.onDetailsNavigateDown != null) {
              return widget.onDetailsNavigateDown!()
                  ? KeyEventResult.handled
                  : KeyEventResult.ignored;
            }

            return KeyEventResult.ignored;
          },
          onNavigateLeft: widget.onDetailsNavigateLeft,
          onNavigateRight: widget.onDetailsNavigateRight,
          child: AnimatedScale(
            scale: _detailsActive ? 1.012 : 1.0,
            duration: _focusMotionDuration,
            curve: Curves.easeOutCubic,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: _focusMotionDuration,
              curve: Curves.easeOutCubic,
              width: widget.width,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              decoration: BoxDecoration(
                color: _detailsActive
                    ? theme.scaffoldBackgroundColor.withValues(alpha: 0.96)
                    : theme.scaffoldBackgroundColor.withValues(alpha: 0.88),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _detailsFocused
                      ? foreground.withValues(alpha: 0.20)
                      : foreground.withValues(alpha: 0.11),
                  width: 1,
                ),
                boxShadow: _detailsActive
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.26),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.16),
                          blurRadius: 14,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: _focusMotionDuration,
                    curve: Curves.easeOutCubic,
                    style:
                        textTheme.titleMedium?.copyWith(
                          color: foreground,
                          fontWeight: _detailsActive
                              ? FontWeight.w700
                              : FontWeight.w600,
                          height: 1.15,
                        ) ??
                        const TextStyle(),
                    child: Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  if (overview.isNotEmpty) ...[
                    const SizedBox(height: 7),

                    AnimatedDefaultTextStyle(
                      duration: _focusMotionDuration,
                      curve: Curves.easeOutCubic,
                      style:
                          textTheme.bodySmall?.copyWith(
                            color: foreground.withValues(
                              alpha: _detailsActive ? 0.76 : 0.62,
                            ),
                            height: 1.35,
                          ) ??
                          const TextStyle(),
                      child: SizedBox(
                        height:
                            (textTheme.bodySmall?.fontSize ?? 14) * 1.35 * 2,
                        child: Text(
                          overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
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
