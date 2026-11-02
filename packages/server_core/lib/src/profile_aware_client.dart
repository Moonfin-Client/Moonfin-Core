import 'media_server_client.dart';
import 'models/server_type.dart';
import 'network/auth_header.dart';

/// A client for a server with household profiles (Silo).
///
/// Kept apart from [MediaServerClient] so Jellyfin, Emby and every test fake
/// stay unchanged. Code that needs these members goes through the helpers
/// below, which also see through wrappers that implement this interface.
abstract interface class ProfileAwareClient {
  /// The household profile requests act as (Silo `X-Profile-Id`).
  String? get profileId;
  set profileId(String? id);

  /// Proof that a PIN-locked profile was unlocked (Silo `X-Profile-Token`).
  String? get profileToken;
  set profileToken(String? token);

  /// Headers that authenticate a request made outside the client's own HTTP
  /// stack (bandwidth probes, artwork transports, players fetching media).
  Map<String, String> authHeaders();
}

/// Headers that authenticate a request to [client]'s server from outside its
/// own HTTP stack. A [ProfileAwareClient] supplies its own (for Silo: bearer
/// token, profile and device headers). Plex takes its token as
/// `X-Plex-Token`, and Jellyfin and Emby get the MediaBrowser/Emby
/// `Authorization` header they already use.
Map<String, String> serverAuthHeaders(MediaServerClient client) {
  if (client is ProfileAwareClient) {
    return (client as ProfileAwareClient).authHeaders();
  }
  if (client.serverType == ServerType.plex) {
    return {'X-Plex-Token': ?client.accessToken};
  }
  return {
    'Authorization': buildServerAuthorizationHeader(
      scheme: client.serverType == ServerType.emby ? 'Emby' : 'MediaBrowser',
      deviceInfo: client.deviceInfo,
      accessToken: client.accessToken,
    ),
  };
}

/// The household profile [client] acts as, or null on servers without one.
String? clientProfileId(MediaServerClient client) =>
    client is ProfileAwareClient
    ? (client as ProfileAwareClient).profileId
    : null;
