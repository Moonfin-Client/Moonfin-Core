import 'dart:js_interop';

import 'package:web/web.dart' as web;

@JS('screen.orientation')
external _BrowserScreenOrientation? get _screenOrientation;

@JS()
extension type _BrowserScreenOrientation(JSObject _) implements JSObject {
  external JSPromise<JSAny?> lock(String orientation);
  external void unlock();
}

bool isSupported() {
  try {
    // This is false both when the element fullscreen API is unavailable
    // (notably iPhone browsers) and when Permissions Policy disables it.
    return web.document.fullscreenEnabled;
  } catch (_) {
    return false;
  }
}

Future<bool> isFullscreen() async => web.document.fullscreenElement != null;

Future<void> setFullscreen(bool value) async {
  try {
    if (!isSupported()) return;
    if (value) {
      final el = web.document.documentElement;
      if (el != null) {
        await el.requestFullscreen().toDart;
      }
    } else if (web.document.fullscreenElement != null) {
      await web.document.exitFullscreen().toDart;
    }
  } catch (_) {}
}

Future<void> lockLandscape() async {
  try {
    final orientation = _screenOrientation;
    if (orientation == null) return;
    await orientation.lock('landscape').toDart;
  } catch (_) {}
}

Future<void> unlockOrientation() async {
  try {
    _screenOrientation?.unlock();
  } catch (_) {}
}
