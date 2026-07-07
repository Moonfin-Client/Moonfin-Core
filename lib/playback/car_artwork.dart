import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Rewrites remote artwork URLs into content:// URIs backed by the native
/// MoonfinArtProvider.
///
/// The Android Auto host fetches browse artwork in its own process, which
/// refuses cleartext http and knows nothing about server auth, so a raw
/// http(s) URL to a home server never loads. Routing it through our provider
/// lets Moonfin download the image in its own process (where cleartext and
/// credentials work) and hand the car a content:// URI it can read. On other
/// platforms the original URL is kept: CarPlay fetches artwork in-process, so
/// it needs no rewrite.
///
/// The provider is exported so the car process can read it, so it only serves
/// hosts we have actually wrapped. [wrap] records each host and [persistHosts]
/// writes them to the shared preferences the provider checks.
class CarArtwork {
  CarArtwork._();
  static final CarArtwork instance = CarArtwork._();

  static const _hostsKey = 'moonfin_art_hosts';

  String? _authority;
  Future<void>? _init;
  final Set<String> _hosts = {};
  bool _hostsDirty = false;

  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  /// Resolves the provider authority once. Callers await this before building
  /// media items so [wrap] has the authority ready.
  Future<void> ensureReady() {
    if (!_isAndroid) return Future.value();
    return _init ??= _resolve();
  }

  Future<void> _resolve() async {
    try {
      final info = await PackageInfo.fromPlatform();
      _authority = '${info.packageName}.artwork';
    } catch (_) {}
  }

  Uri? wrap(String? url) {
    if (url == null) return null;
    final authority = _authority;
    if (authority == null) return Uri.tryParse(url);
    final host = Uri.tryParse(url)?.host;
    if (host != null && host.isNotEmpty && _hosts.add(host)) {
      _hostsDirty = true;
    }
    return Uri(
      scheme: 'content',
      host: authority,
      path: '/img',
      queryParameters: {'u': url},
    );
  }

  /// Writes the hosts seen so far to the preferences the provider reads. Await
  /// this before returning media items so the allowlist is in place before the
  /// car requests an icon.
  Future<void> persistHosts() async {
    if (!_hostsDirty) return;
    _hostsDirty = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_hostsKey, _hosts.join(','));
    } catch (_) {
      _hostsDirty = true;
    }
  }
}
