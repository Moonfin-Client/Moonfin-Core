/// A native Silo server found behind the Jellyfin-compatible address the user
/// entered. Silo serves Jellyfin apps on 8096 and its own API on another
/// port of the same host.
class SiloNativeOffer {
  /// The address that answered as Jellyfin (Silo's compat service).
  final String jellyfinAddress;

  /// The native Silo address that answered `/api/v2/system/info`.
  final String siloAddress;

  /// The server's name from Silo's branding.
  final String serverName;

  const SiloNativeOffer({
    required this.jellyfinAddress,
    required this.siloAddress,
    required this.serverName,
  });
}

/// Asked whether to add [SiloNativeOffer.siloAddress] instead of the
/// Jellyfin-compatible address. True adds the native server.
typedef SiloNativeOfferHandler = Future<bool> Function(SiloNativeOffer offer);
