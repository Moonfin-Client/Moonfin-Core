import '../silo_support.dart';

enum ServerType {
  jellyfin,
  emby,
  silo;

  /// The query parameter that carries the access token on media URLs.
  ///
  /// Jellyfin 12 drops the lowercase api_key param while Emby still requires
  /// it. Silo media requests that can't carry headers pass the bearer token as
  /// `token`. Most Silo URLs (artwork, plan stream URLs) are already signed and
  /// must not get a token appended at all.
  String get tokenQueryParam => switch (this) {
    ServerType.emby => 'api_key',
    ServerType.jellyfin => 'ApiKey',
    ServerType.silo => 'token',
  };

  /// Display name for the server product.
  String get productName => switch (this) {
    ServerType.jellyfin => 'Jellyfin',
    ServerType.emby => 'Emby',
    ServerType.silo => 'Silo',
  };

  /// Classifies a server from its product name, then its version.
  ///
  /// A Silo product name only counts when [allowSilo] is true (by default
  /// [siloSupportEnabled]); otherwise the name falls through to the Jellyfin
  /// and Emby checks like any other.
  static ServerType detect(
    String? productName,
    String? version, {
    bool allowSilo = siloSupportEnabled,
  }) {
    if (productName != null) {
      final lower = productName.toLowerCase();
      if (allowSilo && lower.contains('silo')) return ServerType.silo;
      if (lower.contains('jellyfin')) return ServerType.jellyfin;
      if (lower.contains('emby')) return ServerType.emby;
    }
    if (version != null) {
      final parts = version.split('.');
      final major = int.tryParse(parts.firstOrNull ?? '');
      if (major != null && parts.length >= 4 && major < 10) return ServerType.emby;
    }
    return ServerType.jellyfin;
  }
}
