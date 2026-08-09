import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:server_core/server_core.dart';

// cached_network_image's default HTTP stack (flutter_cache_manager's
// HttpFileService) never goes through configureServerDio, so it sends none
// of the server-facing User-Agent that WAFs/reverse proxies check for (see
// server_user_agent.dart) — API calls succeed while every server-hosted
// image request silently fails. Shared by every network-image entry point
// in the app so there's exactly one cache and one place that sets the
// identity, rather than each call site needing its own copy.
final serverImageCacheManager = CacheManager(
  Config(
    'moonfinServerImageCache',
    fileService: HttpFileService(
      httpClient: _ServerUserAgentHttpClient(http.Client()),
    ),
  ),
);

class _ServerUserAgentHttpClient extends http.BaseClient {
  _ServerUserAgentHttpClient(this._inner);
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['User-Agent'] = serverUserAgent;
    return _inner.send(request);
  }
}
