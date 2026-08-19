import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/media_bar_slide_item.dart';
import '../../../util/platform_detection.dart';
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

  static const _slideTransitionDuration = Duration(milliseconds: 420);
  static const _indicatorAnimationDuration = Duration(milliseconds: 280);
  static const _focusScaleDuration = Duration(milliseconds: 220);
  static const _backdropDepthInDuration = Duration(milliseconds: 320);
  static const _backdropDepthOutDuration = Duration(seconds: 8);

  final List<MediaBarSlideItem> items;
  final int activeIndex;
  final double height;
  final EdgeInsets padding;
  final bool focusExpansionEnabled;
  final Widget? trailerOverlay;
  final ValueChanged<String?>? onAmbientArtworkChanged;

  const AyaMediaBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.height,
    required this.padding,
    required this.focusExpansionEnabled,
    this.trailerOverlay,
    this.onAmbientArtworkChanged,
  });

  @override
  State<AyaMediaBar> createState() => _AyaMediaBarState();
}

class _AyaMediaBarState extends State<AyaMediaBar> {
  FocusNode? _parentFocusNode;
  Orientation? _lastOrientation;

  bool _isFocused = false;
  bool _isHovered = false;

  bool get _isHighlighted => _isFocused || _isHovered;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final focusNode = Focus.maybeOf(context);

    if (!identical(_parentFocusNode, focusNode)) {
      _parentFocusNode?.removeListener(_handleFocusChanged);

      _parentFocusNode = focusNode;
      _isFocused = focusNode?.hasFocus ?? false;

      _parentFocusNode?.addListener(_handleFocusChanged);
    }

    final orientation = MediaQuery.orientationOf(context);
    final orientationChanged =
        _lastOrientation != null && _lastOrientation != orientation;

    _lastOrientation = orientation;

    if (orientationChanged && _isHighlighted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_isHighlighted) {
          return;
        }

        _notifyAmbientArtwork();
      });
    }
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

      _notifyAmbientArtwork();
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
      _notifyAmbientArtwork();
    }
  }

  void _notifyAmbientArtwork() {
    if (widget.items.isEmpty ||
        widget.activeIndex < 0 ||
        widget.activeIndex >= widget.items.length) {
      return;
    }

    final item = widget.items[widget.activeIndex];

    widget.onAmbientArtworkChanged?.call(_artworkUrl(context, item));
  }

  bool _usesMobilePoster(BuildContext context, MediaBarSlideItem item) {
    final posterUrl = item.posterUrl;
    final isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    return PlatformDetection.useMobileUi &&
        isPortrait &&
        posterUrl != null &&
        posterUrl.isNotEmpty;
  }

  String? _artworkUrl(BuildContext context, MediaBarSlideItem item) {
    if (_usesMobilePoster(context, item)) {
      return item.posterUrl;
    }

    return item.backdropUrl;
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.items[widget.activeIndex];
    final theme = Theme.of(context);
    final borders = ThemeRegistry.active.borders;

    final isHighlighted = _isHighlighted;
    final shouldExpand = widget.focusExpansionEnabled && isHighlighted;

    final borderColor = GlassFocusHalo.appleStyleActive
        ? Colors.white
        : borders.focusBorder.color;

    final showGlow = isHighlighted && borders.focusGlow.isNotEmpty;

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
              if (isHighlighted)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.circular(
                          AyaMediaBar._cornerRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.22),
                            blurRadius: 28,
                            spreadRadius: 1,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                          AyaMediaBar._cornerRadius + AyaMediaBar._focusInset,
                        ),
                        boxShadow: borders.focusGlow,
                      ),
                    ),
                  ),
                ),
              ClipRRect(
                borderRadius: AppRadius.circular(AyaMediaBar._cornerRadius),
                child: SizedBox(
                  height: widget.height,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildAnimatedSlide(context, theme, item),
                      if (widget.trailerOverlay != null) widget.trailerOverlay!,
                      if (widget.items.length > 1) _buildIndicators(),
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
                          AyaMediaBar._cornerRadius + AyaMediaBar._focusInset,
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
    BuildContext context,
    ThemeData theme,
    MediaBarSlideItem item,
  ) {
    return _AyaSlideTransition(
      item: item,
      artworkUrl: _artworkUrl(context, item),
      showContent: !_usesMobilePoster(context, item),
      highlighted: _isHighlighted,
      depthScale: AyaMediaBar._backdropDepthScale,
      depthInDuration: AyaMediaBar._backdropDepthInDuration,
      depthOutDuration: AyaMediaBar._backdropDepthOutDuration,
      transitionDuration: AyaMediaBar._slideTransitionDuration,
      slideScaleBegin: AyaMediaBar._slideScaleBegin,
      contentBuilder: (slideItem) {
        return _buildContent(theme, slideItem);
      },
    );
  }

  Widget _buildContent(ThemeData theme, MediaBarSlideItem item) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: AyaMediaBar._contentLeftPadding,
          top: AyaMediaBar._contentTopPadding,
          child: _buildLogoOrTitle(theme, item),
        ),
      ],
    );
  }

  Widget _buildLogoOrTitle(ThemeData theme, MediaBarSlideItem item) {
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
        errorWidget: (_, _, _) => _buildTitle(theme, item.title),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme, String title) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AyaMediaBar._titleMaxWidth),
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
        children: List.generate(widget.items.length, (index) {
          final isActive = index == widget.activeIndex;

          return AnimatedContainer(
            duration: AyaMediaBar._indicatorAnimationDuration,
            curve: Curves.easeOutCubic,
            margin: const EdgeInsets.only(left: AyaMediaBar._indicatorSpacing),
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
              borderRadius: AppRadius.circular(AyaMediaBar._indicatorHeight),
            ),
          );
        }),
      ),
    );
  }
}

class _AyaSlideVisual {
  final MediaBarSlideItem item;
  final String? artworkUrl;
  final bool showContent;

  const _AyaSlideVisual({
    required this.item,
    required this.artworkUrl,
    required this.showContent,
  });
}

class _AyaSlideTransition extends StatefulWidget {
  final MediaBarSlideItem item;
  final String? artworkUrl;
  final bool showContent;
  final bool highlighted;
  final double depthScale;
  final Duration depthInDuration;
  final Duration depthOutDuration;
  final Duration transitionDuration;
  final double slideScaleBegin;
  final Widget Function(MediaBarSlideItem item) contentBuilder;

  const _AyaSlideTransition({
    required this.item,
    required this.artworkUrl,
    required this.showContent,
    required this.highlighted,
    required this.depthScale,
    required this.depthInDuration,
    required this.depthOutDuration,
    required this.transitionDuration,
    required this.slideScaleBegin,
    required this.contentBuilder,
  });

  @override
  State<_AyaSlideTransition> createState() => _AyaSlideTransitionState();
}

class _AyaSlideTransitionState extends State<_AyaSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _transitionController;

  late _AyaSlideVisual _baseSlide;
  _AyaSlideVisual? _incomingSlide;
  late _AyaSlideVisual _desiredSlide;

  bool _isTransitioning = false;
  int _prepareGeneration = 0;

  _AyaSlideVisual get _widgetSlide {
    return _AyaSlideVisual(
      item: widget.item,
      artworkUrl: widget.artworkUrl,
      showContent: widget.showContent,
    );
  }

  @override
  void initState() {
    super.initState();

    final initialSlide = _widgetSlide;

    _baseSlide = initialSlide;
    _desiredSlide = initialSlide;

    _transitionController = AnimationController(
      vsync: this,
      duration: widget.transitionDuration,
    );

    _transitionController.addStatusListener(_handleTransitionStatus);
  }

  @override
  void didUpdateWidget(covariant _AyaSlideTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.transitionDuration != widget.transitionDuration) {
      _transitionController.duration = widget.transitionDuration;
    }

    final nextSlide = _widgetSlide;

    if (!_sameSlide(_desiredSlide, nextSlide)) {
      _requestSlide(nextSlide);
    }
  }

  @override
  void dispose() {
    _prepareGeneration++;

    _transitionController
      ..removeStatusListener(_handleTransitionStatus)
      ..dispose();

    super.dispose();
  }

  bool _sameSlide(_AyaSlideVisual first, _AyaSlideVisual second) {
    return first.item.itemId == second.item.itemId &&
        first.artworkUrl == second.artworkUrl &&
        first.showContent == second.showContent;
  }

  void _requestSlide(_AyaSlideVisual slide) {
    _desiredSlide = slide;

    if (_isTransitioning || _sameSlide(slide, _baseSlide)) {
      return;
    }

    _prepareSlide(slide);
  }

  void _prepareSlide(_AyaSlideVisual slide) {
    final generation = ++_prepareGeneration;

    unawaited(_prepareAndStartSlide(slide, generation));
  }

  Future<void> _prepareAndStartSlide(
    _AyaSlideVisual slide,
    int generation,
  ) async {
    final artworkUrl = slide.artworkUrl;

    if (artworkUrl != null && artworkUrl.isNotEmpty) {
      try {
        await precacheImage(offlineAwareImageProvider(artworkUrl), context);
      } catch (_) {}
    }

    if (!mounted ||
        generation != _prepareGeneration ||
        !_sameSlide(slide, _desiredSlide) ||
        _isTransitioning ||
        _sameSlide(slide, _baseSlide)) {
      return;
    }

    setState(() {
      _incomingSlide = slide;
      _isTransitioning = true;
    });

    _transitionController
      ..duration = widget.transitionDuration
      ..value = 0.0
      ..forward();
  }

  void _handleTransitionStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed || !_isTransitioning) {
      return;
    }

    final completedSlide = _incomingSlide;

    if (completedSlide == null) {
      return;
    }

    setState(() {
      _baseSlide = completedSlide;
      _incomingSlide = null;
      _isTransitioning = false;
    });

    _transitionController
      ..stop()
      ..value = 0.0;

    final desiredSlide = _desiredSlide;

    if (!_sameSlide(desiredSlide, _baseSlide)) {
      _prepareSlide(desiredSlide);
    }
  }

  Widget _buildSlide(_AyaSlideVisual slide) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _AyaBackdrop(
          key: ValueKey(
            'aya_backdrop_${slide.item.itemId}_${slide.artworkUrl}',
          ),
          artworkUrl: slide.artworkUrl,
          highlighted: widget.highlighted,
          depthScale: widget.depthScale,
          depthInDuration: widget.depthInDuration,
          depthOutDuration: widget.depthOutDuration,
        ),
        if (slide.showContent) widget.contentBuilder(slide.item),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final incomingOpacity = CurvedAnimation(
      parent: _transitionController,
      curve: Curves.easeOutCubic,
    );

    final incomingScale = Tween<double>(begin: widget.slideScaleBegin, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _transitionController,
            curve: Curves.easeOutCubic,
          ),
        );

    final incomingSlide = _incomingSlide;

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildSlide(_baseSlide),
        if (_isTransitioning && incomingSlide != null)
          FadeTransition(
            opacity: incomingOpacity,
            child: ScaleTransition(
              scale: incomingScale,
              child: _buildSlide(incomingSlide),
            ),
          ),
      ],
    );
  }
}

class _AyaBackdrop extends StatefulWidget {
  final String? artworkUrl;
  final bool highlighted;
  final double depthScale;
  final Duration depthInDuration;
  final Duration depthOutDuration;

  const _AyaBackdrop({
    super.key,
    required this.artworkUrl,
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
    return 1.0 + ((widget.depthScale - 1.0) * _depthController.value);
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
    final artworkUrl = widget.artworkUrl;

    if (artworkUrl == null || artworkUrl.isEmpty) {
      return ColoredBox(color: AppColorScheme.background);
    }

    return AnimatedBuilder(
      animation: _depthController,
      child: OfflineAwareImage(
        imageUrl: artworkUrl,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        fadeInDuration: Duration.zero,
        errorWidget: (_, _, _) => ColoredBox(color: AppColorScheme.background),
      ),
      builder: (context, child) {
        return Transform.scale(scale: _scale, child: child);
      },
    );
  }
}
