import 'package:flutter/services.dart';

import 'hdr_composition.dart';

/// Dart side of `windows/runner/hdr_video_window.cpp`: the window mpv renders
/// HDR video into.
///
/// The runner owns nothing but the window's lifetime and geometry. mpv creates
/// and owns the D3D11 swapchain once it is handed the HWND as `wid`, which is
/// what gives `target-colorspace-hint` a swapchain to tag - the shared texture
/// path has none.
class HdrVideoWindow {
  HdrVideoWindow() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'monitorChanged') {
        onMonitorChanged?.call();
      }
    });
  }

  static const MethodChannel _channel = MethodChannel('moonfin/hdr_video');

  /// Fired by the runner when the window crosses onto another monitor.
  ///
  /// mpv negotiates its swapchain colorspace once, at creation, against the
  /// display it is created on - so a window dragged from an SDR screen to an
  /// HDR one keeps outputting SDR until the renderer is recreated. The
  /// backend hooks this to cycle the renderer.
  void Function()? onMonitorChanged;

  int? _handle;
  Rect? _geometry;
  bool _visible = false;
  bool _unavailable = false;

  /// The HWND, once created. Null until [create] succeeds.
  int? get handle => _handle;

  /// Creates the window and returns its HWND, or null if it could not be
  /// created. Safe to call repeatedly; the second call returns the same
  /// handle.
  Future<int?> create() async {
    if (_handle != null) return _handle;
    if (_unavailable) return null;
    try {
      // The arrangement rides along; MOONFIN_HDR_DWM is parsed once, in
      // hdr_composition_io.dart.
      final handle = await _channel.invokeMethod<int>('create', {
        'dwmMode': HdrComposition.dwmMode,
      });
      if (handle == null || handle == 0) return null;
      _handle = handle;
      return handle;
    } on MissingPluginException {
      // Not a Windows build, or the runner predates the channel.
      _unavailable = true;
      return null;
    } on PlatformException {
      return null;
    }
  }

  /// Moves the window to [rect], in physical pixels relative to the top-level
  /// window's client area.
  Future<void> setGeometry(Rect rect) async {
    if (_handle == null) return;
    if (_geometry == rect) return;
    _geometry = rect;
    try {
      await _channel.invokeMethod<void>('setGeometry', {
        'x': rect.left.round(),
        'y': rect.top.round(),
        'width': rect.width.round(),
        'height': rect.height.round(),
      });
    } on PlatformException {
      // Geometry is pushed again on the next layout, so a dropped update
      // corrects itself.
    }
  }

  Future<void> setVisible(bool visible) async {
    if (_handle == null || _visible == visible) return;
    _visible = visible;
    try {
      await _channel.invokeMethod<void>('setVisible', {'visible': visible});
    } on PlatformException {
      _visible = !visible;
    }
  }

  /// Whoever is currently presenting the video, so a departing presenter
  /// cannot hide a window its successor has already claimed.
  ///
  /// The player screen is rebuilt on route changes, and the incoming state
  /// mounts before the outgoing one disposes - so a plain `setVisible(false)`
  /// in `dispose` lands last and wins, leaving mpv rendering into a window
  /// nobody can see. Claiming by identity makes the ordering irrelevant.
  Object? _presenter;

  Future<void> claim(Object presenter, Rect rect) async {
    _presenter = presenter;
    await setGeometry(rect);
    await setVisible(true);
  }

  /// Gives the window to [to] where it stands, so the departing presenter's
  /// release no longer hides it. The window keeps its place until the new
  /// owner claims a rect.
  void transferOwnership({required Object from, required Object to}) {
    if (identical(_presenter, from)) _presenter = to;
  }

  Future<void> release(Object presenter) async {
    if (!identical(_presenter, presenter)) return;
    _presenter = null;
    await setVisible(false);
  }

  Future<void> destroy() async {
    if (_handle == null) return;
    _handle = null;
    _geometry = null;
    _visible = false;
    try {
      await _channel.invokeMethod<void>('destroy');
    } on PlatformException {
      // The window goes with the runner either way.
    }
  }
}
