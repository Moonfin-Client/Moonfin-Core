import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'unscaled_platform_view.dart';
import 'package:media_kit/media_kit.dart';

enum NativeVideoZoomMode {
  fit,
  crop,
  stretch,
}

class NativeVideoView extends StatefulWidget {
  final Player player;
  final NativeVideoZoomMode zoomMode;
  final Color fill;
  final String videoOutput;
  final bool hardwareDecodingEnabled;
  final VoidCallback? onVoReady;

  const NativeVideoView({
    super.key,
    required this.player,
    this.zoomMode = NativeVideoZoomMode.fit,
    this.fill = const Color(0xFF000000),
    this.videoOutput = 'gpu',
    this.hardwareDecodingEnabled = true,
    this.onVoReady,
  });

  @override
  State<NativeVideoView> createState() => _NativeVideoViewState();
}

class _SurfaceState {
  final int wid;
  final int width;
  final int height;
  final String vo;

  const _SurfaceState({
    required this.wid,
    required this.width,
    required this.height,
    required this.vo,
  });

  bool matches(int wid, int width, int height, String vo) {
    return this.wid == wid &&
        this.width == width &&
        this.height == height &&
        this.vo == vo;
  }

  _SurfaceState copyWith({
    int? wid,
    int? width,
    int? height,
    String? vo,
  }) {
    return _SurfaceState(
      wid: wid ?? this.wid,
      width: width ?? this.width,
      height: height ?? this.height,
      vo: vo ?? this.vo,
    );
  }
}

class _NativeVideoViewState extends State<NativeVideoView> {
  static const String _viewType = 'moonfin/native_video';

  MethodChannel? _channel;
  _SurfaceState? _surface;
  int? _releaseWid;
  Future<void> _pendingOp = Future<void>.value();

  NativePlayer get _native => widget.player.platform as NativePlayer;

  Future<void> _setProperty(String key, String value) async {
    try {
      final dynamic native = _native;
      await Future.value(
        native.setProperty(key, value, waitForInitialization: false),
      );
    } catch (_) {}
  }

  Future<void> _setPropertyReady(String key, String value) async {
    try {
      final dynamic native = _native;
      await Future.value(
        native.setProperty(key, value, waitForInitialization: true),
      );
    } catch (_) {}
  }

  Future<String?> _getProperty(String key) async {
    try {
      final dynamic dyn = _native;
      final value = await Future.value(dyn.getProperty(key));
      return value.toString();
    } catch (_) {
      return null;
    }
  }

  Future<void> _restoreSubtitleState({
    required String? sid,
  }) async {
    if (sid == null || sid.isEmpty) {
      return;
    }
    await _setProperty('sid', sid);
    await _setProperty('secondary-sid', 'no');
    await _setProperty('sub-visibility', 'yes');
  }

  String _hwdecMode() {
    if (!widget.hardwareDecodingEnabled) return 'no';
    return widget.videoOutput == 'mediacodec_embed' ? 'mediacodec' : 'auto-copy';
  }

  Future<void> _enqueueMutation(Future<void> Function() op) {
    _pendingOp = _pendingOp.then((_) => op()).catchError((_) {});
    return _pendingOp;
  }

  Future<void> _teardownSurface({
    required int? wid,
    required MethodChannel? channel,
  }) async {
    await _setProperty('vo', 'null');
    await _setProperty('vid', 'no');
    await _setProperty('wid', '0');

    if (wid != null) {
      try {
        await channel?.invokeMethod('releaseRef', wid);
      } catch (_) {}
    }
  }

  void _onPlatformViewCreated(int viewId) {
    _channel = MethodChannel('moonfin/native_video_$viewId');
    _channel!.setMethodCallHandler(_handleMethodCall);
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onSurfaceReady':
        final args = call.arguments as Map;
        final wid = (args['wid'] as num).toInt();
        final width = (args['width'] as num).toInt();
        final height = (args['height'] as num).toInt();
        await _onSurfaceReady(wid, width, height);
        return null;
      case 'onSurfaceDestroyed':
        await _onSurfaceDestroyed();
        return null;
      default:
        return null;
    }
  }

  Future<void> _onSurfaceReady(int wid, int width, int height) async {
    await _enqueueMutation(() async {
      final previous = _surface;
      if (previous?.matches(wid, width, height, widget.videoOutput) ?? false) {
        return;
      }

      final sidBefore = await _getProperty('sid');

      _surface = _SurfaceState(
        wid: wid,
        width: width,
        height: height,
        vo: widget.videoOutput,
      );
      _releaseWid = wid;

      await _setProperty('vo', 'null');
      await _setProperty('hwdec', _hwdecMode());
      await _applyZoomMode();
      await _setProperty('android-surface-size', '${width}x$height');
      await _setProperty('wid', wid.toString());
      await _setProperty('vid', 'auto');

      await _setPropertyReady('vo', widget.videoOutput);
      await _restoreSubtitleState(
        sid: sidBefore,
      );
      if (widget.videoOutput == 'gpu') {
        widget.onVoReady?.call();
      }

      if (previous?.wid != wid) {
        try {
          await widget.player.seek(widget.player.state.position);
        } catch (_) {}
      }
    });
  }

  Future<void> _applyZoomMode() async {
    switch (widget.zoomMode) {
      case NativeVideoZoomMode.fit:
        await _setProperty('panscan', '0.0');
        await _setProperty('video-aspect-override', '-1');
        await _setProperty('video-unscaled', 'no');
      case NativeVideoZoomMode.crop:
        await _setProperty('panscan', '1.0');
        await _setProperty('video-aspect-override', '-1');
        await _setProperty('video-unscaled', 'no');
      case NativeVideoZoomMode.stretch:
        await _setProperty('panscan', '0.0');
        await _setProperty('video-aspect-override', '-1');
        await _setProperty('video-unscaled', 'downscale-big');
    }
  }

  Future<void> _onSurfaceDestroyed() async {
    await _enqueueMutation(() async {
      final wid = _releaseWid;
      _surface = null;
      _releaseWid = null;
      await _teardownSurface(wid: wid, channel: _channel);
    });
  }

  @override
  void didUpdateWidget(NativeVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasSurface = _surface != null;
    if (!hasSurface) return;

    final zoomChanged = oldWidget.zoomMode != widget.zoomMode;
    final voChanged = oldWidget.videoOutput != widget.videoOutput;
    final hwdecChanged =
        oldWidget.hardwareDecodingEnabled != widget.hardwareDecodingEnabled;
    if (!zoomChanged && !voChanged && !hwdecChanged) return;

    unawaited(_enqueueMutation(() async {
      if (_surface == null) return;

      if (zoomChanged) {
        await _applyZoomMode();
      }

      if (voChanged) {
        final sidBefore = await _getProperty('sid');

        final s = _surface!;
        await _setProperty('vo', 'null');
        await _setProperty('hwdec', _hwdecMode());
        await _setProperty('android-surface-size', '${s.width}x${s.height}');
        await _setProperty('wid', s.wid.toString());
        await _setProperty('vid', 'auto');
        await _setPropertyReady('vo', widget.videoOutput);
        await _restoreSubtitleState(
          sid: sidBefore,
        );
        if (widget.videoOutput == 'gpu') {
          widget.onVoReady?.call();
        }
        _surface = _surface?.copyWith(vo: widget.videoOutput);
      } else if (hwdecChanged) {
        await _setProperty('hwdec', _hwdecMode());
      }
    }));
  }

  @override
  void dispose() {
    final wid = _releaseWid;
    final channel = _channel;

    _surface = null;
    _releaseWid = null;

    _channel?.setMethodCallHandler(null);
    _channel = null;

    unawaited(_pendingOp.then((_) {
      return _teardownSurface(wid: wid, channel: channel);
    }));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return ColoredBox(color: widget.fill);
    }

    return ColoredBox(
      color: widget.fill,
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
            _onPlatformViewCreated(params.id);
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
      ),
    );
  }
}
