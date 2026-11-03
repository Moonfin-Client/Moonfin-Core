import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../auth/store/authentication_store.dart';
import '../data/services/media_server_client_factory.dart';

/// Whether [feature] holds for at least one of [serverTypes].
///
/// With no servers at all it answers true: nothing is known yet, so nothing
/// is hidden.
bool anyServerTypeSupports(
  Iterable<ServerType> serverTypes,
  bool Function(FeatureDetector features) feature,
) {
  final types = serverTypes.toSet();
  if (types.isEmpty) return true;
  return types.any(
    (type) => feature(FeatureDetector(serverType: type, serverVersion: '')),
  );
}

/// Whether any server someone is signed in to supports [feature].
///
/// For settings that apply to every server, such as the Live TV button: they
/// are hidden only when no signed-in server could use them (all of them Silo,
/// say), so adding a Jellyfin or Emby server brings them back. Reads the
/// stored servers and users only, never the network.
bool anySignedInServerSupports(
  bool Function(FeatureDetector features) feature, {
  AuthenticationStore? store,
}) {
  final AuthenticationStore authStore;
  if (store != null) {
    authStore = store;
  } else if (GetIt.instance.isRegistered<AuthenticationStore>()) {
    authStore = GetIt.instance<AuthenticationStore>();
  } else {
    return true;
  }
  return anyServerTypeSupports([
    for (final server in authStore.getServers())
      if (authStore.getUsers(server.id).isNotEmpty) server.serverType,
  ], feature);
}

/// Live TV, the guide and recordings ([FeatureDetector.supportsLiveTv]).
bool liveTvOnAnySignedInServer({AuthenticationStore? store}) =>
    anySignedInServerSupports((f) => f.supportsLiveTv, store: store);

/// Music: libraries, artists, albums, songs and their lyrics
/// ([FeatureDetector.supportsMusic]).
bool musicOnAnySignedInServer({AuthenticationStore? store}) =>
    anySignedInServerSupports((f) => f.supportsMusic, store: store);

bool playlistsOnAnySignedInServer({AuthenticationStore? store}) =>
    anySignedInServerSupports((f) => f.supportsPlaylists, store: store);

bool moonfinPluginOnAnySignedInServer({AuthenticationStore? store}) =>
    anySignedInServerSupports((f) => f.supportsMoonfinPlugin, store: store);

bool seerrOnAnySignedInServer({AuthenticationStore? store}) =>
    anySignedInServerSupports((f) => f.supportsJellyseerr, store: store);

/// Whether the server an item came from supports [feature], for actions on
/// that item ("Add to playlist" on a Silo film, say).
///
/// Picks the server the way the item's actions do: the loaded client for
/// [serverId], else the active one. Answers true when no client is set up.
bool itemServerSupports(
  String? serverId,
  bool Function(FeatureDetector features) feature,
) {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<MediaServerClient>() ||
      !getIt.isRegistered<MediaServerClientFactory>()) {
    return true;
  }
  final client = getIt<MediaServerClientFactory>().clientForServerOrActive(
    serverId,
  );
  return feature(
    FeatureDetector(serverType: client.serverType, serverVersion: ''),
  );
}

/// Whether the active server supports [feature], for actions that act on it
/// (remote control lists the active server's sessions, say). Answers true
/// when no client is set up.
bool activeServerSupports(bool Function(FeatureDetector features) feature) =>
    itemServerSupports(null, feature);

/// Whether [client]'s server can have the full Moonfin plugin at its root
/// ([FeatureDetector.supportsFullMoonfinPlugin]). Services that call
/// `${baseUrl}/Moonfin/*` directly check it before sending anything, so
/// nothing is asked of a server that can never answer (Silo, whose Moonbase
/// is reached through `moonbaseEndpoint`).
bool serverHasMoonfinPlugin(MediaServerClient client) => FeatureDetector(
  serverType: client.serverType,
  serverVersion: '',
).supportsFullMoonfinPlugin;
