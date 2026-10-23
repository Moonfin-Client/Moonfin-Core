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
  /// network put first, and a typed [address] ahead of those on the server
  /// that answers there.
  Future<List<PlexServer>> loadServers(
    String authToken, {
    String? address,
  }) async {
    final lanUris = <String, List<String>>{};
    final (servers, _, typedId) = await (
      _plexTv.getServers(authToken),
      ServerDiscoveryService()
          .discoverLocalServers()
          .where((s) => s.serverType == ServerType.plex)
          .forEach((s) => lanUris.putIfAbsent(s.id, () => []).add(s.address)),
      address == null ? Future<String?>.value() : _plexTv.machineIdAt(address),
    ).wait;
    if (typedId != null) {
      lanUris.putIfAbsent(typedId, () => []).insert(0, address!);
    }
    return [
      for (final server in servers)
        server.withLanUris(lanUris[server.id] ?? []),
    ];
  }

  /// Saves [server] at the first address that answers and opens a session on
  /// it as the [authToken] account. False when no address answered or the
  /// session didn't start.
  Future<bool> connect(PlexServer server, String authToken) async {
    final uris = [for (final c in server.connections) c.uri];
    final uri = await _plexTv.findReachableUri(uris, server.id);
    if (uri == null) return false;

    final account = await _plexTv.getAccount(authToken);
    final now = DateTime.now();
    await _serverRepository.saveServer(
      Server(
        id: server.id,
        name: server.name,
        address: uri,
        candidateAddresses: uris,
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
        plexToken: authToken,
        lastUsed: now,
      ),
    );
    return _sessionRepository.switchCurrentSession(
      serverId: server.id,
      userId: account.id,
    );
  }

  /// The Plex Home members someone signed in to [server] can switch to.
  Future<List<PublicUser>> homeUsers(Server server) async {
    final token = _plexToken(server.id);
    if (token == null) return const [];
    try {
      return [
        for (final user in await _plexTv.getHomeUsers(token))
          PublicUser(
            id: user.id,
            name: user.name,
            serverId: server.id,
            hasPassword: user.hasPin,
          ),
      ];
    } catch (_) {
      return const [];
    }
  }

  /// [PlexTvService.switchHomeUser], asked as whoever used [serverId] last.
  Future<String?> homeUserToken(String serverId, String userId, {String? pin}) {
    final token = _plexToken(serverId);
    if (token == null) throw StateError('No Plex account on $serverId');
    return _plexTv.switchHomeUser(token, userId, pin: pin);
  }

  /// Opens a session on [server] as the Home member [userId], with the server
  /// token plex.tv gives that member. False when the member can't reach it.
  Future<bool> signInHomeUser(
    Server server, {
    required String userId,
    required String name,
    required String plexToken,
  }) async {
    final servers = await _plexTv.getServers(plexToken);
    final match = servers.where((s) => s.id == server.id).firstOrNull;
    if (match == null) return false;
    await _authStore.putUser(
      PrivateUser(
        id: userId,
        name: name,
        serverId: server.id,
        accessToken: match.accessToken,
        plexToken: plexToken,
        lastUsed: DateTime.now(),
      ),
    );
    return _sessionRepository.switchCurrentSession(
      serverId: server.id,
      userId: userId,
    );
  }

  /// The plex.tv token of whoever used [serverId] last. An owner's server
  /// token is their plex.tv token, which covers users saved before the
  /// plex.tv one was kept.
  String? _plexToken(String serverId) {
    final users = _authStore.getUsers(serverId)
      ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));
    final user = users.firstOrNull;
    return user == null ? null : user.plexToken ?? user.accessToken;
  }
}
