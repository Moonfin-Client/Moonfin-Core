import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/media_bar_slide_item.dart';
import '../offline_aware_image.dart';

class AyaMediaBar extends StatelessWidget {
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
  static const _indicatorAnimationDuration = Duration(
    milliseconds: 250,
  );

  final List<MediaBarSlideItem> items;
  final int activeIndex;
  final double height;
  final EdgeInsets padding;

  const AyaMediaBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.height,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[activeIndex];
    final theme = Theme.of(context);

    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: AppRadius.circular(_cornerRadius),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackdrop(item),
              _buildContent(theme, item),
              if (items.length > 1) _buildIndicators(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackdrop(MediaBarSlideItem item) {
    final backdropUrl = item.backdropUrl;

    if (backdropUrl == null || backdropUrl.isEmpty) {
      return ColoredBox(
        color: AppColorScheme.background,
      );
    }

    return OfflineAwareImage(
      imageUrl: backdropUrl,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      fadeInDuration: Duration.zero,
      errorWidget: (_, _, _) => ColoredBox(
        color: AppColorScheme.background,
      ),
    );
  }

  Widget _buildContent(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    return Positioned(
      left: _contentLeftPadding,
      top: _contentTopPadding,
      child: _buildLogoOrTitle(
        theme,
        item,
      ),
    );
  }

  Widget _buildLogoOrTitle(
      ThemeData theme,
      MediaBarSlideItem item,
      ) {
    final logoUrl = item.logoUrl;

    if (logoUrl == null || logoUrl.isEmpty) {
      return _buildTitle(
        theme,
        item.title,
      );
    }

    return SizedBox(
      width: _logoWidth,
      height: _logoHeight,
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
        maxWidth: _titleMaxWidth,
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
                alpha: _titleShadowOpacity,
              ),
              blurRadius: _titleShadowBlurRadius,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      top: _indicatorTopInset,
      right: _indicatorRightInset,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          items.length,
              (index) {
            final isActive = index == activeIndex;

            return AnimatedContainer(
              duration: _indicatorAnimationDuration,
              curve: Curves.easeOut,
              margin: const EdgeInsets.only(
                left: _indicatorSpacing,
              ),
              width: isActive
                  ? _indicatorActiveWidth
                  : _indicatorInactiveWidth,
              height: _indicatorHeight,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColorScheme.onSurface
                    : AppColorScheme.onSurface.withValues(
                  alpha: _indicatorInactiveOpacity,
                ),
                borderRadius: AppRadius.circular(
                  _indicatorHeight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
