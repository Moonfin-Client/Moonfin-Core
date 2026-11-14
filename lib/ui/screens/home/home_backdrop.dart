import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/background_service.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';

class HomeGradientScrim extends StatelessWidget {
  const HomeGradientScrim({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColorScheme.scrim.withValues(alpha: 0.8),
              AppColorScheme.scrim.withValues(alpha: 0.4),
              AppColorScheme.scrim.withValues(alpha: 0.8),
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }
}

class HomeBackdrop extends StatelessWidget {
  final String? url;
  final double blurAmount;
  final bool useMakdBackdropFx;

  /// Where it goes: behind the whole screen, in the top right corner fading
  /// into the background toward the left and the bottom, or only its top half
  /// fading out toward the middle.
  final String style;

  const HomeBackdrop({
    super.key,
    this.url,
    required this.blurAmount,
    this.useMakdBackdropFx = false,
    this.style = UserPreferences.homeBackdropFullScreen,
  });

  @visibleForTesting
  static Widget topLayout(Widget backdrop) =>
      const HomeBackdrop(blurAmount: 0)._top(backdrop);

  @override
  Widget build(BuildContext context) {
    final switcher = FullscreenBackdropSwitcher(
      imageUrl: url,
      duration: BackgroundService.transitionDuration,
      imageBuilder: (imageUrl) {
        final image = _blurredImage(context, imageUrl, blurAmount);
        if (!useMakdBackdropFx) {
          return image;
        }

        return ClipRect(
          child: TweenAnimationBuilder<double>(
            key: ValueKey('makd_home_backdrop_$imageUrl'),
            tween: Tween(begin: 1.0, end: 1.08),
            duration: const Duration(seconds: 10),
            curve: Curves.easeOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                alignment: Alignment.center,
                child: child,
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                image,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColorScheme.scrim.withValues(alpha: 0.26),
                  ),
                  child: const SizedBox.expand(),
                ),
              ],
            ),
          ),
        );
      },
    );
    return RepaintBoundary(
      child: switch (style) {
        UserPreferences.homeBackdropCorner => _corner(switcher),
        UserPreferences.homeBackdropTop => _top(switcher),
        _ => switcher,
      },
    );
  }

  // Eased stops, so the image melts into the background rather than ending
  // on a visible line.
  LinearGradient _fade(Alignment start, Alignment end) {
    final fade = AppColorScheme.background;
    return LinearGradient(
      begin: start,
      end: end,
      colors: [
        fade,
        fade.withValues(alpha: 0.85),
        fade.withValues(alpha: 0.5),
        fade.withValues(alpha: 0.15),
        fade.withValues(alpha: 0),
      ],
      stops: const [0, 0.12, 0.3, 0.48, 0.6],
    );
  }

  Widget _corner(Widget backdrop) {
    return Align(
      alignment: Alignment.topRight,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.75,
        child: Stack(
          fit: StackFit.expand,
          children: [
            backdrop,
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: _fade(Alignment.centerLeft, Alignment.centerRight),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: _fade(Alignment.bottomCenter, Alignment.topCenter),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Leaves the picture where the full screen one sits, fades it out toward
  /// the middle and hides the bottom half.
  Widget _top(Widget backdrop) {
    return Stack(
      fit: StackFit.expand,
      children: [
        backdrop,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: _fade(Alignment.bottomCenter, Alignment.topCenter),
                ),
              ),
            ),
            Expanded(child: ColoredBox(color: AppColorScheme.background)),
          ],
        ),
      ],
    );
  }

  Widget _blurredImage(BuildContext context, String imageUrl, double blur) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final pixelRatio = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    final targetPxWidth =
        (blur > 0
                ? viewportWidth * pixelRatio * 0.6
                : viewportWidth * pixelRatio)
            .round();
    final maxWidth = targetPxWidth < 480
        ? 480
        : (targetPxWidth > 1280 ? 1280 : targetPxWidth);
    return BoundedNetworkImage(
      imageUrl: imageUrl,
      scale: blur > 0 ? 0.3 : 1.0,
      minWidth: 320,
      maxWidth: maxWidth,
      blurSigma: blur > 0 ? GlassSettings.decorativeSigma(blur) : 0,
      priority: ImageFetchPriority.high,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}
