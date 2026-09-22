import 'package:flutter/widgets.dart';

/// Lays [child] out in the view's own points and scales it back into the box
/// it was given, so it lands in the same place on screen either way.
///
/// A platform view is not a Dart side arrangement. The engine builds it from
/// the points Flutter laid it out at, multiplied by the density the display
/// really reports, and it knows nothing about a host that scaled the subtree
/// above it. So a video surface under a scaled subtree asks for a buffer that
/// size too, and the picture is drawn at a size that has to be thrown away
/// again on the way to the screen.
///
/// Every platform view in this package wraps itself in one of these, so a host
/// never has to remember. Nothing above the view should be wrapped, since the
/// host's own layout is sized against whatever canvas it chose and has to stay
/// on it.
class UnscaledPlatformView extends StatelessWidget {
  const UnscaledPlatformView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final view = View.of(context);
    // A host that scales a subtree multiplies the density it reports by
    // whatever it scaled by, so the two densities differ by exactly that
    // factor and nothing here has to know what did the scaling. Where nothing
    // did, they match and there is no layer to add.
    final scale =
        MediaQuery.devicePixelRatioOf(context) / view.devicePixelRatio;
    if ((scale - 1.0).abs() < 0.005) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(
          constraints.maxWidth * scale,
          constraints.maxHeight * scale,
        );
        return Transform.scale(
          scale: 1 / scale,
          alignment: Alignment.topLeft,
          // The slot hands down a tight size and Transform passes constraints
          // straight through, so it has to be let go of before the view's own
          // size can be set.
          child: OverflowBox(
            alignment: Alignment.topLeft,
            minWidth: 0,
            maxWidth: double.infinity,
            minHeight: 0,
            maxHeight: double.infinity,
            child: SizedBox.fromSize(
              size: size,
              // The physical facts come back from the view, since a host that
              // scales a subtree scales its insets to match. The text scale is
              // the app's own choice rather than the host's, so it stays.
              child: MediaQuery(
                data: MediaQueryData.fromView(view).copyWith(
                  size: size,
                  textScaler: MediaQuery.textScalerOf(context),
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
