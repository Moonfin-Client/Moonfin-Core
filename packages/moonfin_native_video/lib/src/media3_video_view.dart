import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Media3VideoView extends StatelessWidget {
  const Media3VideoView({
    super.key,
    this.fill = const Color(0xFF000000),
    this.onPlatformViewCreated,
  });

  static const String _viewType = 'moonfin/media3_video';

  final Color fill;

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
      child: PlatformViewLink(
        viewType: _viewType,
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.transparent,
          );
        },
        onCreatePlatformView: (params) {
          onPlatformViewCreated?.call(params.id);
          return PlatformViewsService.initExpensiveAndroidView(
            id: params.id,
            viewType: _viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: null,
            creationParamsCodec: const StandardMessageCodec(),
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      ),
    );
  }
}
