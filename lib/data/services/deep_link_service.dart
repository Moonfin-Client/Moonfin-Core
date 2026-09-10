import 'dart:async';

import 'package:app_links/app_links.dart';

import '../../util/platform_detection.dart';

/// Routes OS-registered `moonfin://` deep links into the app. tvOS and web
/// are gated off, they have no app_links backend.
class DeepLinkService {
  StreamSubscription<Uri>? _subscription;

  static bool get _enabled =>
      !PlatformDetection.isWeb && !PlatformDetection.isAppleTV;

  /// Starts listening for `moonfin://` links, including the one the app was
  /// launched with. [onRoute] receives an in-app route path.
  void startListener(void Function(String route) onRoute) {
    if (!_enabled) return;
    _subscription?.cancel();
    // uriLinkStream replays the launch link before live ones, so this is both
    // the cold-start and the warm path.
    _subscription = AppLinks().uriLinkStream.listen(
      (uri) {
        final route = routeForDeepLink(uri);
        if (route != null) onRoute(route);
      },
      onError: (_) {},
    );
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Resolves a `moonfin://` deep link into an in-app route path, or null if
  /// the link isn't recognized.
  ///
  /// Recognized forms:
  ///  - `moonfin://item?id=<itemId>[&serverId=<serverId>][&userId=<userId>]`
  ///  - `moonfin://play?id=<itemId>[&serverId=<serverId>][&userId=<userId>]`
  ///    (starts playback)
  ///
  /// `userId` optionally pins a stored user for cold starts, skipping the
  /// profile picker. It is only honored for users already signed in on this
  /// device, and never bypasses a PIN or an always-authenticate setting.
  static String? routeForDeepLink(Uri uri) {
    if (uri.scheme != 'moonfin') return null;
    final id = uri.queryParameters['id'];
    if (id == null || id.isEmpty) return null;
    final serverId = uri.queryParameters['serverId'];
    final userId = uri.queryParameters['userId'];
    final params = <String, String>{
      if (serverId != null && serverId.isNotEmpty) 'serverId': serverId,
      if (userId != null && userId.isNotEmpty) 'userId': userId,
      if (uri.host == 'play') 'autoPlay': 'true',
    };
    final query = params.entries
        .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
    return query.isEmpty ? '/item/$id' : '/item/$id?$query';
  }
}
