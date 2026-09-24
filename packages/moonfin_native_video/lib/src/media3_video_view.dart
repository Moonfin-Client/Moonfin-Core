import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'unscaled_platform_view.dart';

class Media3VideoView extends StatelessWidget {
  const Media3VideoView({
    super.key,
    this.fill = const Color(0xFF000000),
    this.onPlatformViewCreated,
    this.role = 'main',
  });

  static const String _viewType = 'moonfin/media3_video';

  final Color fill;

  /// 'preview' for inline media-bar/row trailers, 'main' for real players. The
  /// native bridge uses this so a preview never steals the shared player slot
  /// from a live main view.
  final String role;

  /// Reports the Android platform-view id so a persistent host (media bar)
  /// can re-activate this view via Media3PlayerBackend.activateView().
  final ValueChanged<int>? onPlatformViewCreated;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return ColoredBox(color: fill);
    }

    return ColoredBox(
      color: fill,
      child: UnscaledPlatformView(
        child: PlatformViewLink(
          viewType: _viewType,
          surfaceFactory: (context, controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers:
                  const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.transparent,
            );
          },
          onCreatePlatformView: (params) {
            onPlatformViewCreated?.call(params.id);
            return PlatformViewsService.initExpensiveAndroidView(
              id: params.id,
              viewType: _viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: {'role': role},
              creationParamsCodec: const StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        ),
      ),
    );
  }
}
