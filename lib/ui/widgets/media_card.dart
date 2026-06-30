import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tvos/flutter_tvos.dart'
    show TvRemoteController, TvRemoteTouchEvent, TvRemoteTouchPhase;
import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/preference_constants.dart';
import '../../util/platform_detection.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/focus/key_event_utils.dart';
import 'bounded_network_image.dart';
import 'marquee_text.dart';
import '../mixins/focus_state_mixin.dart';

class MediaCard extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final String? imageUrl;
  final double width;
  final double aspectRatio;
  final VoidCallback? onTap;
  final VoidCallback? onPressStart;
  final VoidCallback? onPressEnd;
  final VoidCallback? onFocus;
  final VoidCallback? onFocusLost;
  final VoidCallback? onHoverStart;
  final VoidCallback? onHoverEnd;
  final VoidCallback? onLongPress;
  final bool isFavorite;
  final bool isPlayed;
  final int? unplayedCount;
  final double? playedPercentage;
  final WatchedIndicatorBehavior watchedBehavior;
  final String? itemType;
  final String? seerrMediaType;
  final int? seerrStatus;
  final Color? focusColor;
  final bool cardFocusExpansion;
  final FocusNode? focusNode;
  final KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent;
  final bool? externalIsFocused;
  final bool autofocus;
  final bool suppressImageFocusBorder;
  final bool suppressFocusGlow;
  final Color? titleColor;
  final Color? subtitleColor;

  const MediaCard({
    super.key,
    this.title,
    this.subtitle,
    this.subtitleWidget,
    this.imageUrl,
    this.width = 150,
    this.aspectRatio = 2 / 3,
    this.onTap,
    this.onPressStart,
    this.onPressEnd,
    this.onFocus,
    this.onFocusLost,
    this.onHoverStart,
    this.onHoverEnd,
    this.onLongPress,
    this.isFavorite = false,
    this.isPlayed = false,
    this.unplayedCount,
    this.playedPercentage,
    this.watchedBehavior = WatchedIndicatorBehavior.always,
    this.itemType,
    this.seerrMediaType,
    this.seerrStatus,
    this.focusColor,
    this.cardFocusExpansion = true,
    this.focusNode,
    this.onKeyEvent,
    this.externalIsFocused,
    this.autofocus = false,
    this.suppressImageFocusBorder = false,
    this.suppressFocusGlow = false,
    this.titleColor,
    this.subtitleColor,
  });

  static IconData iconForType(String? type) {
    switch (type) {
      case 'Folder':
      case 'CollectionFolder':
      case 'UserView':
        return Icons.folder_rounded;
      case 'Series':
        return Icons.tv;
      case 'Season':
        return Icons.format_list_numbered;
      case 'Movie':
        return Icons.movie;
      case 'Episode':
      case 'Video':
      case 'MusicVideo':
        return Icons.play_circle_outline;
      case 'Audio':
        return Icons.music_note;
      case 'MusicAlbum':
        return Icons.album;
      case 'MusicArtist':
      case 'Person':
        return Icons.person;
      case 'Photo':
        return Icons.photo;
      case 'PhotoAlbum':
        return Icons.photo_library;
      case 'BoxSet':
        return Icons.collections_bookmark;
      case 'Playlist':
        return Icons.playlist_play;
      case 'Book':
        return Icons.book;
      default:
        return Icons.movie;
    }
  }

  static double aspectRatioForType(String? type) {
    switch (type) {
      case 'Episode':
      case 'Program':
      case 'Recording':
      case 'Video':
      case 'MusicVideo':
        return 16 / 9;
      case 'MusicAlbum':
      case 'Audio':
      case 'MusicArtist':
      case 'Playlist':
      case 'Person':
        return 1;
      default:
        return 2 / 3;
    }
  }

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> with FocusStateMixin {
  final _selectKeyHandler = LongPressSelectKeyHandler();

  @override
  void dispose() {
    _selectKeyHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final baseTextStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    final subtitleColor =
        widget.subtitleColor ??
        Theme.of(context).colorScheme.onSurface.withAlpha(153);
    final titleStyle = baseTextStyle.copyWith(
      color:
          widget.titleColor ??
          (isNeon ? AppColorScheme.accent : baseTextStyle.color),
    );
    final subtitleStyle = baseTextStyle.copyWith(color: subtitleColor);
    final textScaler = MediaQuery.textScalerOf(context);

    double lineHeightFor(TextStyle style) {
      final fontSize = style.fontSize ?? 12;
      final height = style.height ?? 1.2;
      return (textScaler.scale(fontSize) * height) + 2;
    }

    final titleLineHeight = lineHeightFor(titleStyle);
    final subtitleLineHeight = lineHeightFor(subtitleStyle);
    final externallyDriven = widget.externalIsFocused != null;
    final hasNodeFocus = widget.focusNode?.hasFocus ?? false;
    final effectiveFocused = externallyDriven
        ? (widget.externalIsFocused! || hovered)
        : (focused || hasNodeFocus);
    final showMarquee = hovered || effectiveFocused;
    final cardActive =
        widget.cardFocusExpansion &&
        (externallyDriven ? effectiveFocused : showFocusBorder);
    final inner = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => widget.onPressStart?.call(),
      onTapUp: (_) => widget.onPressEnd?.call(),
      onTapCancel: widget.onPressEnd,
      onTap: widget.onTap,
      onLongPressStart: (_) {
        widget.onPressEnd?.call();
        widget.onLongPress?.call();
      },
      onSecondaryTap: widget.onLongPress == null
          ? null
          : () => widget.onLongPress!(),
      child: RepaintBoundary(
        child: _withTvParallax(
          active: cardActive,
          child: AnimatedScale(
            scale: cardActive
                ? (PlatformDetection.isAppleTV ? 1.12 : 1.05)
                : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: PlatformDetection.isAppleTV
                ? Curves.easeOutCubic
                : Curves.linear,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _CardImage(
                  imageUrl: widget.imageUrl,
                  title: widget.title,
                  aspectRatio: widget.aspectRatio,
                  isFavorite: widget.isFavorite,
                  isPlayed: widget.isPlayed,
                  unplayedCount: widget.unplayedCount,
                  playedPercentage: widget.playedPercentage,
                  watchedBehavior: widget.watchedBehavior,
                  focused: effectiveFocused,
                  hovered: hovered,
                  focusColor: widget.focusColor,
                  suppressFocusBorder: widget.suppressImageFocusBorder,
                  suppressFocusGlow: widget.suppressFocusGlow,
                  isCircular: widget.itemType == 'Person',
                  itemType: widget.itemType,
                  seerrMediaType: widget.seerrMediaType,
                  seerrStatus: widget.seerrStatus,
                ),
                if (widget.title != null) ...[
                  const SizedBox(height: 6),
                  SizedBox(
                    height: titleLineHeight,
                    child: showMarquee
                        ? MarqueeText(text: widget.title!, style: titleStyle)
                        : Text(
                            widget.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: titleStyle,
                          ),
                  ),
                ],
                if (widget.subtitleWidget != null) ...[
                  SizedBox(height: widget.title != null ? 2 : 6),
                  widget.subtitleWidget!,
                ] else if (widget.subtitle != null &&
                    widget.subtitle!.isNotEmpty)
                  SizedBox(
                    height: subtitleLineHeight,
                    child: showMarquee
                        ? MarqueeText(
                            text: widget.subtitle!,
                            style: subtitleStyle,
                          )
                        : Text(
                            widget.subtitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: subtitleStyle,
                          ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    final mouseRegion = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setHovered(true);
        widget.onHoverStart?.call();
      },
      onExit: (_) {
        setHovered(false);
        widget.onHoverEnd?.call();
      },
      child: externallyDriven
          ? inner
          : Focus(
              focusNode: widget.focusNode,
              autofocus: widget.autofocus,
              onKeyEvent: (node, event) {
                if (widget.onLongPress != null) {
                  final handlerResult = _selectKeyHandler.handleKeyEvent(
                    event,
                    onTap: () => widget.onTap?.call(),
                    onLongPress: () => widget.onLongPress?.call(),
                  );
                  if (handlerResult != KeyEventResult.ignored) {
                    return handlerResult;
                  }
                } else if (event is KeyDownEvent &&
                    event.logicalKey.isSelectKey) {
                  widget.onTap?.call();
                  return KeyEventResult.handled;
                }
                return widget.onKeyEvent?.call(node, event) ??
                    KeyEventResult.ignored;
              },
              onFocusChange: (hasFocus) {
                setFocused(hasFocus);
                if (hasFocus) {
                  widget.onFocus?.call();
                } else {
                  widget.onFocusLost?.call();
                }
              },
              child: inner,
            ),
    );

    return SizedBox(width: widget.width, child: mouseRegion);
  }

  Widget _withTvParallax({required bool active, required Widget child}) {
    if (!PlatformDetection.isAppleTV) return child;
    return _TvFocusParallax(active: active, child: child);
  }
}

class _TvFocusParallax extends StatefulWidget {
  final bool active;
  final Widget child;

  const _TvFocusParallax({required this.active, required this.child});

  @override
  State<_TvFocusParallax> createState() => _TvFocusParallaxState();
}

class _TvFocusParallaxState extends State<_TvFocusParallax>
    with SingleTickerProviderStateMixin {
  static const double _maxAngle = 0.10;
  static const double _ease = 0.18;

  late final _ticker = createTicker(_onTick);
  final ValueNotifier<Offset> _tilt = ValueNotifier<Offset>(Offset.zero);
  Offset _target = Offset.zero;
  bool _listening = false;

  @override
  void initState() {
    super.initState();
    if (widget.active) _attach();
  }

  @override
  void didUpdateWidget(_TvFocusParallax oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active && !oldWidget.active) {
      _attach();
    } else if (!widget.active && oldWidget.active) {
      _detach();
    }
  }

  @override
  void dispose() {
    _detach();
    _ticker.dispose();
    _tilt.dispose();
    super.dispose();
  }

  void _attach() {
    if (_listening) return;
    _listening = true;
    TvRemoteController.instance.addRawListener(_onTouch);
  }

  void _detach() {
    if (_listening) {
      TvRemoteController.instance.removeRawListener(_onTouch);
      _listening = false;
    }
    _target = Offset.zero;
    _startTicker();
  }

  void _onTouch(TvRemoteTouchEvent event) {
    if (!widget.active) return;
    switch (event.phase) {
      case TvRemoteTouchPhase.started:
      case TvRemoteTouchPhase.move:
      case TvRemoteTouchPhase.loc:
        _target = Offset(event.x.clamp(-1.0, 1.0), event.y.clamp(-1.0, 1.0));
        _startTicker();
      case TvRemoteTouchPhase.ended:
      case TvRemoteTouchPhase.cancelled:
        _target = Offset.zero;
        _startTicker();
      case TvRemoteTouchPhase.clickStart:
      case TvRemoteTouchPhase.clickEnd:
        break;
    }
  }

  void _startTicker() {
    if (!_ticker.isActive) _ticker.start();
  }

  void _onTick(Duration _) {
    final next = Offset.lerp(_tilt.value, _target, _ease)!;
    if (_target == Offset.zero && next.distance < 0.002) {
      _tilt.value = Offset.zero;
      _ticker.stop();
      return;
    }
    _tilt.value = next;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Offset>(
      valueListenable: _tilt,
      child: widget.child,
      builder: (context, tilt, child) {
        if (tilt == Offset.zero) return child!;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0012)
            ..rotateY(tilt.dx * _maxAngle)
            ..rotateX(-tilt.dy * _maxAngle),
          child: child,
        );
      },
    );
  }
}

class _CardImage extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final double aspectRatio;
  final bool isFavorite;
  final bool isPlayed;
  final int? unplayedCount;
  final double? playedPercentage;
  final WatchedIndicatorBehavior watchedBehavior;
  final bool focused;
  final bool hovered;
  final Color? focusColor;
  final bool suppressFocusBorder;
  final bool suppressFocusGlow;
  final bool isCircular;
  final String? itemType;
  final String? seerrMediaType;
  final int? seerrStatus;

  const _CardImage({
    this.imageUrl,
    this.title,
    required this.aspectRatio,
    required this.isFavorite,
    required this.isPlayed,
    this.unplayedCount,
    this.playedPercentage,
    required this.watchedBehavior,
    required this.focused,
    this.hovered = false,
    this.focusColor,
    this.suppressFocusBorder = false,
    this.suppressFocusGlow = false,
    this.isCircular = false,
    this.itemType,
    this.seerrMediaType,
    this.seerrStatus,
  });

  @override
  Widget build(BuildContext context) {
    final radius = isCircular ? 999.0 : 8.0;
    final showBorder = !suppressFocusBorder && (focused || hovered);
    final borderColor = focusColor ?? Theme.of(context).colorScheme.primary;
    final borders = ThemeRegistry.active.borders;
    final showGlow =
        showBorder && !suppressFocusGlow && borders.focusGlow.isNotEmpty;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          if (showGlow)
            Positioned(
              top: -3.5,
              bottom: -3.5,
              left: -3.5,
              right: -3.5,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: isCircular
                        ? BorderRadius.circular(radius + 3.5)
                        : borders.cardRadius + BorderRadius.circular(3.5),
                    boxShadow: borders.focusGlow,
                  ),
                ),
              ),
            ),
          ClipRRect(
            borderRadius: isCircular
                ? BorderRadius.circular(radius)
                : borders.cardRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: (itemType == 'Network' || itemType == 'Studio')
                      ? Theme.of(context).colorScheme.surfaceContainerHighest
                      : (imageUrl != null
                            ? Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest
                                  .withValues(alpha: 0.2)
                            : Colors.transparent),
                  padding: (itemType == 'Network' || itemType == 'Studio')
                      ? const EdgeInsets.all(8.0)
                      : EdgeInsets.zero,
                  child: imageUrl != null
                      ? BoundedNetworkImage(
                          imageUrl: imageUrl!,
                          fit: (itemType == 'Network' || itemType == 'Studio')
                              ? BoxFit.contain
                              : BoxFit.cover,
                          fadeInDuration: Duration.zero,
                          scale: isCircular ? 0.8 : 0.9,
                          maxWidth: aspectRatio > 1.2 ? 960 : 640,
                          errorBuilder: (_, _, _) => _PlaceholderIcon(
                            itemType: itemType,
                            title: title,
                          ),
                        )
                      : _PlaceholderIcon(itemType: itemType, title: title),
                ),
                if (isFavorite)
                  Positioned(
                    top: _showSeerrMediaTypeBadge ? 28 : 4,
                    left: 4,
                    child: Icon(
                      Icons.favorite,
                      color: AppColorScheme.recordingActive,
                      size: 18,
                    ),
                  ),
                if (_showSeerrMediaTypeBadge)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: _buildSeerrMediaTypeBadge(),
                  ),
                if (_showSeerrStatusIndicator)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: _buildSeerrStatusIndicator(),
                  )
                else if (_showWatchedIndicator)
                  Positioned(top: 4, right: 4, child: _buildWatchedIndicator()),
                if (playedPercentage != null && playedPercentage! > 0)
                  Positioned(
                    left: 6,
                    right: 6,
                    bottom: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: playedPercentage! / 100,
                        minHeight: 6,
                        backgroundColor: AppColorScheme.scrim.withValues(
                          alpha: 0.54,
                        ),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColorScheme.accent,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (showBorder)
            Positioned(
              top: -3.5,
              bottom: -3.5,
              left: -3.5,
              right: -3.5,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: isCircular
                        ? BorderRadius.circular(radius + 3.5)
                        : borders.cardRadius + BorderRadius.circular(3.5),
                    border: Border.fromBorderSide(
                      borders.focusBorder.copyWith(
                        color: borderColor,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool get _showWatchedIndicator {
    switch (watchedBehavior) {
      case WatchedIndicatorBehavior.always:
        return isPlayed || (unplayedCount != null && unplayedCount! > 0);
      case WatchedIndicatorBehavior.hideUnwatched:
        return isPlayed;
      case WatchedIndicatorBehavior.episodesOnly:
        return itemType == 'Episode' &&
            (isPlayed || (unplayedCount != null && unplayedCount! > 0));
      case WatchedIndicatorBehavior.never:
        return false;
    }
  }

  bool get _showSeerrMediaTypeBadge {
    final type = seerrMediaType?.toLowerCase();
    return type == 'movie' || type == 'tv';
  }

  bool get _showSeerrStatusIndicator =>
      seerrStatus == 2 ||
      seerrStatus == 3 ||
      seerrStatus == 4 ||
      seerrStatus == 5;

  Widget _buildSeerrMediaTypeBadge() {
    final type = seerrMediaType?.toLowerCase();
    final isMovie = type == 'movie';
    final badgeColor = isMovie
        ? AppColorScheme.mediaTypeBadgeMovie
        : AppColorScheme.mediaTypeBadgeShow;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          isMovie ? 'MOVIE' : 'SERIES',
          style: TextStyle(
            color: AppColorScheme.onBadge,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildSeerrStatusIndicator() {
    if (seerrStatus == 5) {
      return _buildStatusCircle(
        borderColor: AppColorScheme.statusAvailable,
        icon: Icon(
          Icons.check_rounded,
          size: 12,
          color: AppColorScheme.statusAvailable,
        ),
      );
    }

    if (seerrStatus == 4) {
      return _buildStatusCircle(
        fillColor: AppColorScheme.statusAvailable,
        icon: Icon(
          Icons.remove_rounded,
          size: 13,
          color: AppColorScheme.onBadge,
        ),
      );
    }

    if (seerrStatus == 3) {
      return _buildStatusCircle(
        borderColor: AppColorScheme.statusRequested,
        icon: Icon(
          Icons.schedule_rounded,
          size: 12,
          color: AppColorScheme.statusRequested,
        ),
      );
    }

    return _buildStatusCircle(
      borderColor: AppColorScheme.statusPending,
      icon: Icon(
        Icons.schedule_rounded,
        size: 12,
        color: AppColorScheme.statusPending,
      ),
    );
  }

  Widget _buildStatusCircle({
    required Widget icon,
    Color? fillColor,
    Color? borderColor,
  }) {
    final effectiveFillColor = fillColor ?? AppColorScheme.onBadge;
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: effectiveFillColor,
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: borderColor ?? effectiveFillColor,
            width: 1.5,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }

  Widget _buildWatchedIndicator() {
    if (isPlayed) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColorScheme.badgeWatched,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Icon(Icons.check, color: AppColorScheme.onBadge, size: 12),
        ),
      );
    }
    if (unplayedCount != null && unplayedCount! > 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: AppColorScheme.badgeUnplayed,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '$unplayedCount',
          style: TextStyle(
            color: AppColorScheme.onBadge,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _PlaceholderIcon extends StatelessWidget {
  final String? itemType;
  final String? title;

  const _PlaceholderIcon({this.itemType, this.title});

  @override
  Widget build(BuildContext context) {
    if (itemType != 'Person') {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
              Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: title != null && title!.isNotEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title!.toUpperCase(),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              )
            : null,
      );
    }

    return Center(
      child: Icon(
        MediaCard.iconForType(itemType),
        size: 32,
        color: AppColorScheme.onSurface.withValues(alpha: 0.38),
      ),
    );
  }
}
