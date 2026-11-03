import 'package:server_core/server_core.dart';

/// The headers a seek-preview sheet or frame of [client]'s server is loaded
/// with.
///
/// Jellyfin and Emby guard their trickplay images, so they get the server's
/// own authorization (`serverAuthHeaders`: the scheme, device and token each
/// server expects). Silo's sheet URLs are signed and carry their own
/// authorization, and Moonfin never sends the account's credentials beside
/// signed artwork, so they get none. [withUserAgent] adds the app's
/// image User-Agent, which the Flutter image loaders send.
Map<String, String> trickplayImageHeaders(
  MediaServerClient client, {
  bool withUserAgent = true,
}) => {
  if (withUserAgent) ...serverImageHeaders,
  if (client.serverType != ServerType.silo) ...serverAuthHeaders(client),
};
