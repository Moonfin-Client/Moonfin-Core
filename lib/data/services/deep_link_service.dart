import 'dart:async';

import 'package:app_links/app_links.dart';

import '../../ui/navigation/destinations.dart';
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
  ///  - `moonfin://search?query=<text>` (opens search with the query text)
  ///  - `moonfin://live-tv/guide` and `moonfin://live-tv/recordings`, for
  ///    remapping remote buttons the system keeps from apps (Guide, DVR)
  ///  - `moonfin://party?server=<serverId>&code=<code>&address=<url>`, a
  ///    watch party invite. The server id is the server's own, so the watch
  ///    party link screen works out which saved server it is, if any.
  ///
  /// `userId` optionally pins a stored user, skipping the profile picker on a
  /// cold start and switching to that user when another one is signed in. It
  /// is only honored for users already signed in on this device, and never
  /// bypasses a PIN, an always-authenticate setting or Kids Mode.
  static String? routeForDeepLink(Uri uri) {
    if (uri.scheme != 'moonfin') return null;
    if (uri.host == 'party') {
      final code = uri.queryParameters['code'];
      if (code == null || code.isEmpty) return null;
      final params = <String, String>{
        'code': code,
        for (final (from, to) in const [
          ('server', 'serverId'),
          ('address', 'address'),
        ])
          if (uri.queryParameters[from] case final v? when v.isNotEmpty) to: v,
      };
      final query = params.entries
          .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
          .join('&');
      return '${Destinations.watchParty}?$query';
    }
    if (uri.host == 'search') {
      final searchQuery = uri.queryParameters['query'];
      if (searchQuery == null || searchQuery.isEmpty) return null;
      return '/search?query=${Uri.encodeComponent(searchQuery)}';
    }
    if (uri.host == 'live-tv') {
      return switch (uri.path) {
        '/guide' => Destinations.liveTvGuide,
        '/recordings' => Destinations.liveTvRecordings,
        _ => null,
      };
    }
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
