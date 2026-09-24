import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';

/// Video surface for the AetherEngine backend: a UiKitView on iOS or an
/// AppKitView on macOS hosting the native `AetherPlayerView` plus the native
/// subtitle overlay. Deliberately dumb. Playback is driven entirely by
/// AetherBackend's method channel and this widget only hosts the picture
/// and forwards zoom-mode changes.
class AetherVideoView extends StatefulWidget {
  const AetherVideoView({
    super.key,
    this.zoomMode = 'fit',
    this.keepClearOfHousing = false,
  });

  /// Dart ZoomMode enum name: 'fit', 'autoCrop', or 'stretch'.
  final String zoomMode;

  /// Holds the picture back from the iPhone camera housing in landscape.
  final bool keepClearOfHousing;

  @override
  State<AetherVideoView> createState() => _AetherVideoViewState();
}

class _AetherVideoViewState extends State<AetherVideoView> {
  MethodChannel? _viewChannel;

  @override
  void didUpdateWidget(covariant AetherVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.zoomMode != widget.zoomMode) {
      _viewChannel?.invokeMethod('setZoomMode', {'mode': widget.zoomMode});
    }
    if (oldWidget.keepClearOfHousing != widget.keepClearOfHousing) {
      _viewChannel?.invokeMethod('setKeepClearOfHousing', {
        'value': widget.keepClearOfHousing,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // IgnorePointer keeps the platform view out of hit testing, which the OSD
    // tap depends on. RenderUiKitView always reports a hit and puts its own
    // recognizer into the gesture arena. That recognizer never resolves, so as
    // the deepest entry it wins the sweep on pointer up and beats the player
    // screen's tap recognizer. Passing an empty gestureRecognizers set doesn't
    // help because that's already the default. The native view has user
    // interaction turned off anyway, and the macOS container refuses hit
    // testing natively as well.
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => IgnorePointer(
        child: UnscaledPlatformView(
          child: UiKitView(
            viewType: 'moonfin/aether_video',
            creationParams: {
              'zoomMode': widget.zoomMode,
              'keepClearOfHousing': widget.keepClearOfHousing,
            },
            creationParamsCodec: const StandardMessageCodec(),
            onPlatformViewCreated: _onCreated,
          ),
        ),
      ),
      TargetPlatform.macOS => IgnorePointer(
        child: UnscaledPlatformView(
          child: AppKitView(
            viewType: 'moonfin/aether_video',
            creationParams: {'zoomMode': widget.zoomMode},
            creationParamsCodec: const StandardMessageCodec(),
            onPlatformViewCreated: _onCreated,
          ),
        ),
      ),
      _ => const ColoredBox(color: Color(0xFF000000)),
    };
  }

  void _onCreated(int id) {
    _viewChannel = MethodChannel('moonfin/aether_video_$id');
  }
}
