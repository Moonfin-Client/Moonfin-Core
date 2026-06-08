import 'dart:js_interop';

import 'package:web/web.dart' as web;

class PlaybackExitBeacon {
  const PlaybackExitBeacon._();

  static bool get supported => true;

  static String? _url;
  static String? _body;
  static bool _installed = false;

  static void arm({required String url, required String body}) {
    _url = url;
    _body = body;
    if (_installed) return;
    _installed = true;
    web.window.addEventListener('pagehide', _onPageHide.toJS);
  }

  static void disarm() {
    _url = null;
    _body = null;
  }

  static void _onPageHide(web.Event event) {
    final url = _url;
    final body = _body;
    if (url == null || body == null) return;
    try {
      final blob = web.Blob(
        <JSAny>[body.toJS].toJS,
        web.BlobPropertyBag(type: 'application/json'),
      );
      web.window.navigator.sendBeacon(url, blob);
    } catch (_) {}
  }
}
