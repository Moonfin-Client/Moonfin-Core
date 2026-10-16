import 'package:server_core/server_core.dart';

import '../../data/services/plex_tv_service.dart';
import '../models/server.dart';
import '../models/user.dart';
import '../services/server_discovery_service.dart';
import '../store/authentication_store.dart';
import 'server_repository.dart';
import 'session_repository.dart';

class PlexRepository {
  final PlexTvService _plexTv;
  final ServerRepository _serverRepository;
  final AuthenticationStore _authStore;
  final SessionRepository _sessionRepository;

  PlexRepository(
    this._plexTv,
    this._serverRepository,
    this._authStore,
    this._sessionRepository,
  );

  /// The account's servers, each with the addresses GDM found for it on this
  /// network put first.
  Future<List<PlexServer>> loadServers(String authToken) async {
    final lanUris = <String, List<String>>{};
    final (servers, _) = await (
      _plexTv.getServers(authToken),
      ServerDiscoveryService()
          .discoverLocalServers()
          .where((s) => s.serverType == ServerType.plex)
          .forEach((s) => lanUris.putIfAbsent(s.id, () => []).add(s.address)),
    ).wait;
    return [
      for (final server in servers)
        server.withLanUris(lanUris[server.id] ?? []),
    ];
  }

  /// Saves [server] at the first address that answers and opens a session on
  /// it as the [authToken] account. False when no address answered or the
  /// session didn't start.
  Future<bool> connect(PlexServer server, String authToken) async {
    final uri = await _plexTv.findReachableUri(server);
    if (uri == null) return false;

    final account = await _plexTv.getAccount(authToken);
    final now = DateTime.now();
    await _serverRepository.saveServer(
      Server(
        id: server.id,
        name: server.name,
        address: uri,
        version: server.version,
        serverType: ServerType.plex,
        dateAdded: now,
      ),
    );
    await _authStore.putUser(
      PrivateUser(
        id: account.id,
        name: account.name,
        serverId: server.id,
        accessToken: server.accessToken,
        lastUsed: now,
      ),
    );
    return _sessionRepository.switchCurrentSession(
      serverId: server.id,
      userId: account.id,
    );
  }
}
