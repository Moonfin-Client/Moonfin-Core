import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/media_bar_slide_item.dart';
import '../focus/glass_focus_halo.dart';
import '../offline_aware_image.dart';

class AyaMediaBar extends StatefulWidget {
  static const _cornerRadius = 18.0;

  static const _contentLeftPadding = 44.0;
  static const _contentTopPadding = 40.0;

  static const _logoWidth = 340.0;
  static const _logoHeight = 100.0;

  static const _titleMaxWidth = 440.0;
  static const _titleShadowOpacity = 0.72;
  static const _titleShadowBlurRadius = 20.0;

  static const _indicatorTopInset = 22.0;
  static const _indicatorRightInset = 24.0;
  static const _indicatorSpacing = 5.0;
  static const _indicatorActiveWidth = 16.0;
  static const _indicatorInactiveWidth = 10.0;
  static const _indicatorHeight = 2.0;
  static const _indicatorInactiveOpacity = 0.30;

  static const _focusInset = 3.5;
  static const _focusBorderWidth = 3.0;
  static const _focusScale = 1.006;

  static const _backdropDepthScale = 1.012;
  static const _slideScaleBegin = 1.006;

  static const _slideTransitionDuration = Duration(milliseconds: 900);
  static const _indicatorAnimationDuration = Duration(milliseconds: 280);
  static const _focusScaleDuration = Duration(milliseconds: 220);
  static const _backdropDepthInDuration = Duration(milliseconds: 320);
  static const _backdropDepthOutDuration = Duration(seconds: 8);

  final List<MediaBarSlideItem> items;
  final int activeIndex;
  final double height;
  final EdgeInsets padding;
  final bool focusExpansionEnabled;
  final ValueChanged<MediaBarSlideItem>? onAmbientItemChanged;

  const AyaMediaBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.height,
    required this.padding,
    required this.focusExpansionEnabled,
    this.onAmbientItemChanged,
  });

  @override
  State<AyaMediaBar> createState() => _AyaMediaBarState();
}

class _AyaMediaBarState extends State<AyaMediaBar> {
  FocusNode? _parentFocusNode;

  bool _isFocused = false;
  bool _isHovered = false;

  bool get _isHighlighted => _isFocused || _isHovered;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final focusNode = Focus.maybeOf(context);

    if (identical(_parentFocusNode, focusNode)) {
      return;
    }

    _parentFocusNode?.removeListener(_handleFocusChanged);

    _parentFocusNode = focusNode;
    _isFocused = focusNode?.hasFocus ?? false;

    _parentFocusNode?.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(covariant AyaMediaBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.activeIndex == widget.activeIndex || !_isHighlighted) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_isHighlighted) {
        return;
      }

      _notifyAmbientItem();
    });
  }

  @override
  void dispose() {
    _parentFocusNode?.removeListener(_handleFocusChanged);
    super.dispose();
  }

  void _handleFocusChanged() {
    if (!mounted) {
      return;
    }

    final isFocused = _parentFocusNode?.hasFocus ?? false;

    if (_isFocused == isFocused) {
      return;
    }

    setState(() {
      _isFocused = isFocused;
    });
  }

  void _setHovered(bool hovered) {
    if (_isHovered == hovered) {
      return;
    }

    setState(() {
      _isHovered = hovered;
    });

    if (_isHighlighted) {
      _notifyAmbientItem();
    }
  }

  void _notifyAmbientItem() {
    if (widget.items.isEmpty ||
        widget.activeIndex < 0 ||
        widget.activeIndex >= widget.items.length) {
      return;
    }

    widget.onAmbientItemChanged?.call(
      widget.items[widget.activeIndex],
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.items[widget.activeIndex];
    final theme = Theme.of(context);
    final borders = ThemeRegistry.active.borders;

    final isHighlighted = _isHighlighted;
    final shouldExpand =
        widget.focusExpansionEnabled && isHighlighted;

    final borderColor = GlassFocusHalo.appleStyleActive
        ? Colors.white
        : theme.colorScheme.primary;

    final showGlow =
        isHighlighted && borders.focusGlow.isNotEmpty;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedScale(
        scale: shouldExpand ? AyaMediaBar._focusScale : 1.0,
        duration: AyaMediaBar._focusScaleDuration,
        curve: Curves.easeOutCubic,
        child: Padding(
          padding: widget.padding,
          child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              if (showGlow)
                Positioned(
                  top: -AyaMediaBar._focusInset,
                  bottom: -AyaMediaBar._focusInset,
                  left: -AyaMediaBar._focusInset,
                  right: -AyaMediaBar._focusInset,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.circular(
                          AyaMediaBar._cornerRadius +
                              AyaMediaBar._focusInset,
                        ),
                        boxShadow: borders.focusGlow,
                      ),
                    ),
                  ),
                ),
              ClipRRect(
                borderRadius: AppRadius.circular(
                  AyaMediaBar._cornerRadius,
                ),
                child: SizedBox(
                  height: widget.height,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildAnimatedSlide(theme, item),
                      if (widget.items.length > 1)
                        _buildIndicators(),
                    ],
                  ),
                ),
              ),
              if (isHighlighted)
                Positioned(
                  top: -AyaMediaBar._focusInset,
                  bottom: -AyaMediaBar._focusInset,
                  left: -AyaMediaBar._focusInset,
                  right: -AyaMediaBar._focusInset,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.circular(
                          AyaMediaBar._cornerRadius +
                              AyaMediaBar._focusInset,
                        ),
                        border: Border.fromBorderSide(
                          borders.focusBorder.copyWith(
                            color: borderColor,
                            width: AyaMediaBar._focusBorderWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSlide(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    return AnimatedSwitcher(
      duration: AyaMediaBar._slideTransitionDuration,
      reverseDuration: AyaMediaBar._slideTransitionDuration,
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      layoutBuilder: (
          Widget? currentChild,
          List<Widget> previousChildren,
          ) {
        return Stack(
          fit: StackFit.expand,
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (
          Widget child,
          Animation<double> animation,
          ) {
        final opacity = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
          reverseCurve: Curves.easeInOutCubic,
        );

        final scale = Tween<double>(
          begin: AyaMediaBar._slideScaleBegin,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
        );

        return FadeTransition(
          opacity: opacity,
          child: ScaleTransition(
            scale: scale,
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: ValueKey(item.itemId),
        child: _buildSlide(theme, item),
      ),
    );
  }

  Widget _buildSlide(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _AyaBackdrop(
          key: ValueKey('aya_backdrop_${item.itemId}'),
          item: item,
          highlighted: _isHighlighted,
          depthScale: AyaMediaBar._backdropDepthScale,
          depthInDuration: AyaMediaBar._backdropDepthInDuration,
          depthOutDuration: AyaMediaBar._backdropDepthOutDuration,
        ),
        _buildContent(theme, item),
      ],
    );
  }

  Widget _buildContent(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    return Positioned(
      left: AyaMediaBar._contentLeftPadding,
      top: AyaMediaBar._contentTopPadding,
      child: _buildLogoOrTitle(theme, item),
    );
  }

  Widget _buildLogoOrTitle(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    final logoUrl = item.logoUrl;

    if (logoUrl == null || logoUrl.isEmpty) {
      return _buildTitle(theme, item.title);
    }

    return SizedBox(
      width: AyaMediaBar._logoWidth,
      height: AyaMediaBar._logoHeight,
      child: OfflineAwareImage(
        imageUrl: logoUrl,
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
        fadeInDuration: Duration.zero,
        errorWidget: (_, _, _) => _buildTitle(
          theme,
          item.title,
        ),
      ),
    );
  }

  Widget _buildTitle(
      ThemeData theme,
      String title,
      ) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: AyaMediaBar._titleMaxWidth,
      ),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.0,
          color: AppColorScheme.onSurface,
          shadows: [
            Shadow(
              color: AppColorScheme.scrim.withValues(
                alpha: AyaMediaBar._titleShadowOpacity,
              ),
              blurRadius: AyaMediaBar._titleShadowBlurRadius,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      top: AyaMediaBar._indicatorTopInset,
      right: AyaMediaBar._indicatorRightInset,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.items.length,
              (index) {
            final isActive = index == widget.activeIndex;

            return AnimatedContainer(
              duration: AyaMediaBar._indicatorAnimationDuration,
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.only(
                left: AyaMediaBar._indicatorSpacing,
              ),
              width: isActive
                  ? AyaMediaBar._indicatorActiveWidth
                  : AyaMediaBar._indicatorInactiveWidth,
              height: AyaMediaBar._indicatorHeight,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColorScheme.onSurface
                    : AppColorScheme.onSurface.withValues(
                  alpha: AyaMediaBar._indicatorInactiveOpacity,
                ),
                borderRadius: AppRadius.circular(
                  AyaMediaBar._indicatorHeight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AyaBackdrop extends StatefulWidget {
  final MediaBarSlideItem item;
  final bool highlighted;
  final double depthScale;
  final Duration depthInDuration;
  final Duration depthOutDuration;

  const _AyaBackdrop({
    super.key,
    required this.item,
    required this.highlighted,
    required this.depthScale,
    required this.depthInDuration,
    required this.depthOutDuration,
  });

  @override
  State<_AyaBackdrop> createState() => _AyaBackdropState();
}

class _AyaBackdropState extends State<_AyaBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _depthController;

  double get _scale {
    return 1.0 +
        ((widget.depthScale - 1.0) * _depthController.value);
  }

  @override
  void initState() {
    super.initState();

    _depthController = AnimationController(
      vsync: this,
      value: widget.highlighted ? 1.0 : 0.0,
    );

    if (widget.highlighted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !widget.highlighted) {
          return;
        }

        unawaited(_retreatFromDepth());
      });
    }
  }

  @override
  void didUpdateWidget(covariant _AyaBackdrop oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.highlighted == widget.highlighted) {
      return;
    }

    if (widget.highlighted) {
      unawaited(_runDepthCycle());
    } else {
      _resetDepth();
    }
  }

  @override
  void dispose() {
    _depthController.dispose();
    super.dispose();
  }

  Future<void> _runDepthCycle() async {
    _depthController.stop();

    await _depthController.animateTo(
      1.0,
      duration: widget.depthInDuration,
      curve: Curves.easeOutCubic,
    );

    if (!mounted || !widget.highlighted) {
      return;
    }

    await _depthController.animateBack(
      0.0,
      duration: widget.depthOutDuration,
      curve: Curves.linear,
    );
  }

  Future<void> _retreatFromDepth() async {
    _depthController.stop();
    _depthController.value = 1.0;

    await _depthController.animateBack(
      0.0,
      duration: widget.depthOutDuration,
      curve: Curves.linear,
    );
  }

  void _resetDepth() {
    _depthController.stop();
    _depthController.value = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final backdropUrl = widget.item.backdropUrl;

    if (backdropUrl == null || backdropUrl.isEmpty) {
      return ColoredBox(
        color: AppColorScheme.background,
      );
    }

    return AnimatedBuilder(
      animation: _depthController,
      child: OfflineAwareImage(
        imageUrl: backdropUrl,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        fadeInDuration: Duration.zero,
        errorWidget: (_, _, _) => ColoredBox(
          color: AppColorScheme.background,
        ),
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: _scale,
          child: child,
        );
      },
    );
  }
}
