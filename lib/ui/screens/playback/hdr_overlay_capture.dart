import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../playback/hdr_composition.dart';
import '../../../playback/hdr_overlay_channel.dart';
import '../../../util/platform_detection.dart';

/// Mirrors part of the player chrome into a layered window above the HDR
/// video window.
///
/// While native HDR output is running, mpv draws into its own window, which
/// covers the Flutter view. The widget tree underneath is left exactly as it
/// is - still laid out, still hit-tested, still holding focus - because the
/// video window and the overlays are both `WS_EX_TRANSPARENT`, so clicks fall
/// straight through to it. Only the *pixels* have to be re-sent, which is what
/// this does.
///
/// Wrapping a subtree in this changes nothing when [enabled] is false, so the
/// texture path is untouched.
class HdrOverlayCapture extends StatefulWidget {
  const HdrOverlayCapture({
    super.key,
    required this.enabled,
    required this.channel,
    required this.child,
  });

  /// Capture only while mpv owns its own window. False leaves the subtree
  /// untouched, so the call site can wrap unconditionally and keep one element
  /// identity - and the player's focus node - across engage/disengage.
  final bool enabled;

  final HdrOverlayChannel channel;
  final Widget child;

  /// Whether this build can ever mirror the chrome into the layered window.
  ///
  /// False off Windows, and false on Windows in the default arrangement where
  /// the compositor draws Flutter over the video. Both settle at startup, so
  /// the widget hands its child straight back rather than wrapping every
  /// player on every platform in a boundary only this path reads.
  static bool get canCapture =>
      PlatformDetection.supportsNativeHdrWindow &&
      !HdrComposition.videoBehindFlutter;

  @override
  State<HdrOverlayCapture> createState() => _HdrOverlayCaptureState();
}

class _HdrOverlayCaptureState extends State<HdrOverlayCapture>
    with WidgetsBindingObserver {
  final _boundaryKey = GlobalKey();

  /// One capture in flight at a time. `toByteData` is a GPU-to-CPU readback,
  /// so overlapping calls would queue up behind each other and the overlay
  /// would drift further behind the widget tree with every frame.
  bool _capturing = false;

  /// Set by the frame watch whenever Flutter actually produced a frame,
  /// cleared when a capture starts. The timer does nothing while it is clear,
  /// so once the chrome has faded out and nothing animates, readbacks stop
  /// entirely - the zero-cost steady state a film spends most of its runtime
  /// in.
  bool _frameDirty = false;

  /// Ceiling on the capture rate while the chrome is animating.
  static const _minInterval = Duration(milliseconds: 66);

  /// Drives the captures. A plain timer, not a Ticker: a ticker requests a
  /// frame every tick, forcing build and raster at display rate while mpv owns
  /// the pixels and Flutter should be idle. The chrome changes only through
  /// setState and animations, which schedule their own frames; the frame
  /// watch just records that one happened.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.enabled) _start();
  }

  /// A monitor crossing changes the device pixel ratio and window metrics
  /// without necessarily rebuilding anything, so a capture taken
  /// mid-transition can land at the wrong offset with no further frame to
  /// correct it. Re-dirty so the next tick re-reads geometry and ratio.
  @override
  void didChangeMetrics() {
    _frameDirty = true;
  }

  @override
  void didUpdateWidget(HdrOverlayCapture oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !oldWidget.enabled) {
      _start();
    } else if (!widget.enabled && oldWidget.enabled) {
      _stop();
      widget.channel.hide();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stop();
    if (widget.enabled) widget.channel.hide();
    super.dispose();
  }

  void _start() {
    // Capture the current state right away, then only on real frames.
    _frameDirty = true;
    _armFrameWatch();
    _timer ??= Timer.periodic(_minInterval, (_) => unawaited(_capture()));
  }

  void _stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Marks [_frameDirty] whenever the engine produces a frame.
  /// `addPostFrameCallback` runs after frames Flutter was going to draw
  /// anyway and never schedules one itself, so this costs nothing while the
  /// tree is idle.
  void _armFrameWatch() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _frameDirty = true;
      if (widget.enabled) _armFrameWatch();
    });
  }

  Future<void> _capture() async {
    if (!mounted || !widget.enabled || _capturing || !_frameDirty) return;
    final context = _boundaryKey.currentContext;
    final boundary = context?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null || !boundary.hasSize) {
      return;
    }

    _capturing = true;
    // Before the awaits, so a frame produced mid-capture marks it again and
    // the next tick picks it up.
    _frameDirty = false;
    // Declared outside the try so the finally can dispose it even when
    // toByteData throws; the native backing is ~33 MB at 4K.
    ui.Image? image;
    try {
      // Physical pixels: the layered window is sized in them, and rendering
      // at the logical size would upscale the chrome on a high-DPI display.
      final ratio = MediaQuery.devicePixelRatioOf(context!);
      // Read before the awaits, since the origin below needs it and the
      // context is no longer safe to reach through by then.
      final viewRatio = View.of(context).devicePixelRatio;
      image = await boundary.toImage(pixelRatio: ratio);
      // rawRgba is premultiplied, which is what AC_SRC_ALPHA wants. The
      // runner swaps RGBA to BGRA so that loop stays off this isolate.
      final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      final width = image.width;
      final height = image.height;

      // `data == null` is a documented outcome of toByteData; fall through
      // rather than return so the capture still reschedules.
      if (data != null && mounted && widget.enabled) {
        // localToGlobal has already walked whatever scales the tree, so the
        // origin is in the view's own points. The ratio above carries that
        // scale, so multiplying by it here would apply the scale twice to
        // the corner while applying it once to the size.
        final origin = boundary.localToGlobal(Offset.zero) * viewRatio;
        await widget.channel.push(
          x: origin.dx,
          y: origin.dy,
          pixels: data.buffer.asUint8List(),
          width: width,
          height: height,
        );
      }
    } catch (_) {
      // A capture can fail while the tree is being torn down. The next frame
      // either retries or the widget is gone.
    } finally {
      image?.dispose();
      _capturing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!HdrOverlayCapture.canCapture) return widget.child;
    // Where it does run, the boundary stays up whatever [enabled] says, so
    // toggling it never relayouts the chrome underneath.
    return RepaintBoundary(key: _boundaryKey, child: widget.child);
  }
}

/// Reports where the video should be, so the native window can be moved there.
///
/// Takes the place of the `Video` widget while native HDR output is running:
/// mpv is drawing into its own window, so there is nothing for Flutter to
/// paint here, but the rect still has to be measured from the same layout the
/// texture path would have used.
class HdrVideoGeometry extends StatefulWidget {
  const HdrVideoGeometry({
    super.key,
    required this.onGeometry,
    required this.onDetached,
    this.showVideo = true,
  });

  /// Whether the native window should be on screen at all.
  ///
  /// False while a route sits above the player - a track picker, the info
  /// sheet, any dialog. Those live in the Navigator's overlay, outside this
  /// screen's subtree, so they are not mirrored into the layered window and
  /// the video would simply cover them: the menu opens, takes the keyboard,
  /// and cannot be seen. Standing the video window down for the few seconds a
  /// menu is open hands the screen back to Flutter, which can draw it. Audio
  /// is untouched.
  final bool showVideo;

  /// Called with the video rect in physical pixels, relative to the top-level
  /// window's client area, whenever it changes.
  final void Function(Rect rect) onGeometry;

  /// Called when this widget goes away, so the window can be released by
  /// whoever still owns it.
  final VoidCallback onDetached;

  @override
  State<HdrVideoGeometry> createState() => _HdrVideoGeometryState();
}

class _HdrVideoGeometryState extends State<HdrVideoGeometry> {
  Rect? _last;

  bool? _lastShown;

  void _report() {
    if (!widget.showVideo) {
      if (_lastShown != false) {
        _lastShown = false;
        widget.onDetached();
      }
      return;
    }

    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    // The size is measured in the tree's own points, so it takes the ratio
    // that carries whatever scale the tree is under. The origin comes back
    // from localToGlobal already in the view's points, so it takes the view's
    // own ratio or the scale lands on it twice.
    final ratio = MediaQuery.devicePixelRatioOf(context);
    final origin =
        box.localToGlobal(Offset.zero) * View.of(context).devicePixelRatio;
    final rect = Rect.fromLTWH(
      origin.dx,
      origin.dy,
      box.size.width * ratio,
      box.size.height * ratio,
    );
    // Re-report the rect when coming back from hidden, since the claim that
    // shows the window again rides on it.
    if (rect == _last && _lastShown == true) return;
    _last = rect;
    _lastShown = true;
    widget.onGeometry(rect);
  }

  @override
  void dispose() {
    widget.onDetached();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A LayoutBuilder so a pure resize (maximise, fullscreen, edge drag)
    // re-reports: those relayout without rebuilding. Once per layout, not per
    // frame - HdrVideoWindow.claim/release owning the window by identity is
    // what handles the dispose/build race between two player-screen states.
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _report();
        });
        return const SizedBox.expand();
      },
    );
  }
}
