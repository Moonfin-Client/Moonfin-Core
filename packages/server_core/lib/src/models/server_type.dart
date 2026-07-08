enum ServerType {
  jellyfin,
  emby;

  /// Jellyfin 12 drops the lowercase api_key param while Emby still requires it.
  String get tokenQueryParam => this == ServerType.emby ? 'api_key' : 'ApiKey';

  static ServerType detect(String? productName, String? version) {
    if (productName != null) {
      final lower = productName.toLowerCase();
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
