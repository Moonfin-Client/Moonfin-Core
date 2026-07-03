import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_bar_slide_item.dart';
import '../../../data/viewmodels/media_bar_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../bounded_network_image.dart';
import '../rating_display.dart';

class BannerMediaBar extends StatefulWidget {
  final MediaBarViewModel viewModel;
  final UserPreferences prefs;
  final double height;
  final bool externallyPaused;
  final FocusNode? focusNode;
  final void Function(MediaBarSlideItem item) onOpen;
  final void Function(MediaBarSlideItem item) onPlay;
  final Future<void> Function()? onNavigateDown;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateLeft;

  const BannerMediaBar({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.height,
    required this.onOpen,
    required this.onPlay,
    this.externallyPaused = false,
    this.focusNode,
    this.onNavigateDown,
    this.onNavigateUp,
    this.onNavigateLeft,
  });

  @override
  State<BannerMediaBar> createState() => _BannerMediaBarState();
}

class _BannerMediaBarState extends State<BannerMediaBar> {
  static const _keyLongPressThreshold = Duration(milliseconds: 500);
  Timer? _autoAdvance;
  int _index = 0;
  bool _focused = false;
  DateTime? _keyDownTime;

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onChanged);
    widget.prefs.addListener(_onChanged);
    _startAutoAdvance();
    _ensureRatingsForCurrent();
  }

  @override
  void didUpdateWidget(BannerMediaBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.externallyPaused != oldWidget.externallyPaused) {
      _startAutoAdvance();
    }
  }

  @override
  void dispose() {
    _autoAdvance?.cancel();
    widget.viewModel.removeListener(_onChanged);
    widget.prefs.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _ensureRatingsForCurrent() {
    final items = widget.viewModel.items;
    if (_index < items.length) {
      unawaited(widget.viewModel.ensureRatings(items[_index].itemId));
    }
  }

  void _startAutoAdvance() {
    _autoAdvance?.cancel();
    if (widget.externallyPaused) return;
    if (!widget.prefs.get(UserPreferences.mediaBarAutoAdvance)) return;
    final intervalMs = widget.prefs.get(UserPreferences.mediaBarIntervalMs);
    _autoAdvance = Timer.periodic(Duration(milliseconds: intervalMs), (_) {
      final items = widget.viewModel.items;
      if (items.length <= 1 || !mounted) return;
      setState(() => _index = (_index + 1) % items.length);
      _ensureRatingsForCurrent();
    });
  }

  void _setIndex(int next) {
    final items = widget.viewModel.items;
    if (items.isEmpty) return;
    setState(() => _index = next % items.length);
    _ensureRatingsForCurrent();
    _startAutoAdvance();
  }

  KeyEventResult _handleKey(KeyEvent event, MediaBarSlideItem item) {
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) {
      if (event is KeyDownEvent || event is KeyRepeatEvent) {
        _keyDownTime ??= DateTime.now();
        return KeyEventResult.handled;
      }
      if (event is KeyUpEvent) {
        final downTime = _keyDownTime;
        _keyDownTime = null;
        final longPress = downTime != null &&
            DateTime.now().difference(downTime) >= _keyLongPressThreshold;
        if (longPress) {
          widget.onPlay(item);
        } else {
          widget.onOpen(item);
        }
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    final items = widget.viewModel.items;
    if (key == LogicalKeyboardKey.arrowDown) {
      unawaited(widget.onNavigateDown?.call());
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      widget.onNavigateUp?.call();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft) {
      if (_index > 0) {
        _setIndex(_index - 1);
      } else if (widget.onNavigateLeft != null) {
        widget.onNavigateLeft!();
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      if (items.length > 1) _setIndex(_index + 1);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.viewModel.items;
    if (items.isEmpty) return const SizedBox.shrink();
    final index = _index.clamp(0, items.length - 1);
    final item = items[index];

    final isMobile = PlatformDetection.useMobileUi;
    final navbarAtTop =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final topInset = isMobile
        ? MediaQuery.paddingOf(context).top + (navbarAtTop ? 60.0 : 0.0)
        : 0.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, topInset, 16, 8),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.focusNode == null && PlatformDetection.useLeanbackUi,
        onFocusChange: (f) {
          if (mounted) setState(() => _focused = f);
        },
        onKeyEvent: (node, event) => _handleKey(event, item),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            borderRadius: AppRadius.circular(16),
            border: Border.all(
              color: _focused
                  ? AppColorScheme.accent
                  : Colors.transparent,
              width: 2.5,
            ),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: AppColorScheme.accent.withValues(alpha: 0.4),
                      blurRadius: 18,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: AppRadius.circular(14),
            child: SizedBox(
              height: widget.height,
              child: GestureDetector(
                onTap: () => widget.onOpen(item),
                onHorizontalDragEnd: items.length > 1
                    ? (details) {
                        final v = details.primaryVelocity ?? 0;
                        if (v < -300) {
                          _setIndex(_index + 1);
                        } else if (v > 300) {
                          _setIndex(_index == 0 ? items.length - 1 : _index - 1);
                        }
                      }
                    : null,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _backdrop(item),
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
                      child: _content(context, item),
                    ),
                    if (items.length > 1)
                      Positioned(
                        top: 12,
                        right: 16,
                        child: _Dots(count: items.length, active: index),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _backdrop(MediaBarSlideItem item) {
    final url = item.backdropUrl;
    if (url == null) {
      return ColoredBox(color: AppColorScheme.surface);
    }
    return BoundedNetworkImage(
      imageUrl: url,
      minWidth: 640,
      maxWidth: 1280,
      errorBuilder: (_, _, _) => ColoredBox(color: AppColorScheme.surface),
    );
  }

  Widget _content(BuildContext context, MediaBarSlideItem item) {
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

    final ratingsMap = widget.viewModel.ratingsFor(item.itemId);
    final hasRatings =
        ratingsMap.isNotEmpty ||
        item.communityRating != null ||
        item.criticRating != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.logoUrl != null)
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 240,
              height: 56,
              child: CachedNetworkImage(
                imageUrl: item.logoUrl!,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                fadeInDuration: Duration.zero,
                errorWidget: (_, _, _) => _title(theme, item, shadows),
              ),
            ),
          )
        else
          _title(theme, item, shadows),
        if (meta.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            meta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.75),
              fontWeight: FontWeight.w600,
              shadows: shadows,
            ),
          ),
        ],
        if (hasRatings) ...[
          const SizedBox(height: 8),
          RatingsRow(
            ratings: ratingsMap,
            communityRating: item.communityRating,
            criticRating: item.criticRating,
            enableAdditionalRatings: widget.prefs.get(
              UserPreferences.enableAdditionalRatings,
            ),
            enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
            showLabels: false,
            showBadges: false,
          ),
        ],
      ],
    );
  }

  Widget _title(
    ThemeData theme,
    MediaBarSlideItem item,
    List<Shadow> shadows,
  ) {
    final isMobile = PlatformDetection.useMobileUi;
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          (isMobile ? theme.textTheme.titleLarge : theme.textTheme.headlineMedium)
              ?.copyWith(
                color: AppColorScheme.onSurface,
                fontWeight: FontWeight.w800,
                height: 1.05,
                shadows: shadows,
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
    final shown = count > 7 ? 7 : count;
    final start = (active - shown ~/ 2).clamp(0, count - shown < 0 ? 0 : count - shown);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = start; i < start + shown; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: i == active ? 16 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == active
                  ? AppColorScheme.onSurface
                  : AppColorScheme.onSurface.withValues(alpha: 0.4),
              borderRadius: AppRadius.circular(3),
            ),
          ),
      ],
    );
  }
}
