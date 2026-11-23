import 'dart:convert';

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../util/platform_detection.dart';
import '../../../util/webview_environment.dart';

/// Token and user id the Jellyfin web client holds after an SSO sign-in.
typedef SsoCredentials = ({String accessToken, String userId});

/// Sign-in through the server's own web page needs an embedded webview.
bool get ssoWebLoginSupported =>
    !kIsWeb && (PlatformDetection.isAndroid || PlatformDetection.isIOS ||
        PlatformDetection.isMacOS || PlatformDetection.isWindows);

/// Opens the server's own Jellyfin web login (`/web/`) in a private webview,
/// so any method it offers works (password, Quick Connect, SSO plugins...).
/// Once signed in, the web client stores the session in localStorage
/// (`jellyfin_credentials`) and that is read. Null if the page is closed.
Future<SsoCredentials?> showSsoWebLogin(
  BuildContext context, {
  required String serverAddress,
}) {
  final base = serverAddress.replaceAll(RegExp(r'/+$'), '');
  return Navigator.of(context, rootNavigator: true).push<SsoCredentials>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => _SsoWebLoginPage(
        startUrl: '$base/web/',
      ),
    ),
  );
}

class _SsoWebLoginPage extends StatefulWidget {
  final String startUrl;

  const _SsoWebLoginPage({required this.startUrl});

  @override
  State<_SsoWebLoginPage> createState() => _SsoWebLoginPageState();
}

class _SsoWebLoginPageState extends State<_SsoWebLoginPage> {
  bool _done = false;
  Timer? _poll;

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _checkForCredentials(InAppWebViewController controller) async {
    if (_done) return;
    final raw = await controller.evaluateJavascript(
      source: "localStorage.getItem('jellyfin_credentials')",
    );
    if (raw is! String || raw.isEmpty) return;
    try {
      final servers = (jsonDecode(raw) as Map)['Servers'] as List;
      final s = servers.cast<Map>().firstWhere(
        (e) => e['AccessToken'] != null && e['UserId'] != null,
      );
      _done = true;
      if (mounted) {
        Navigator.of(context).pop<SsoCredentials>((
          accessToken: s['AccessToken'] as String,
          userId: s['UserId'] as String,
        ));
      }
    } catch (_) {
      // Page loaded before the session was written; a later load retries.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        webViewEnvironment: gWebViewEnvironment,
        initialUrlRequest: URLRequest(url: WebUri(widget.startUrl)),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          incognito: true, // no stale session from an earlier login
        ),
        // The login is a single page app, so poll instead of relying on loads.
        onWebViewCreated: (c) => _poll = Timer.periodic(
          const Duration(seconds: 1),
          (_) => _checkForCredentials(c),
        ),
      ),
    );
  }
}
