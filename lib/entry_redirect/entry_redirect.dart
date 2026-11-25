// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// A server added through a stable name that answers with a redirect to a
// dynamic `host:port` (VPN port forwarding behind a fixed name) keeps the
// redirect target as its address. When the target moves, only the entered
// address knows where it went. This service remembers that address and
// follows it again: at sign-in, when the server list opens, when a request
// can't connect and when the reachability check or the player loses the
// server. ServerRepository calls it from a few hooks marked `// entry
// redirect`.
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../auth/models/server.dart';
import '../auth/repositories/server_repository.dart';
import '../data/services/media_server_client_factory.dart';
import 'entry_address_store.dart';

/// A saved server that answers on a new address now: [from] is where it
/// was, [server] is it as saved at its new address.
class ServerMove {
  const ServerMove({required this.from, required this.server});

  final String from;
  final Server server;
}

class EntryRedirect {
  EntryRedirect(this._repository, this._store, this._clients);

  final ServerRepository _repository;
  final EntryAddressStore _store;
  final MediaServerClientFactory _clients;

  /// The entered address of the saved server [serverId], when it was added
  /// through a redirect.
  EntryAddress? entryOf(String serverId) => _store.of(serverId);

  /// Hook from [ServerRepository.addServer]: [server] was saved after the
  /// user entered [entered], whose first probe ended at [probed] (empty when
  /// it stayed). Only a redirect the entered address answered with counts,
  /// and only when the server was saved there: a switch to Silo's native
  /// API lands on another port too, but following the entry address again
  /// would lead back to the compat service. A server added at its target
  /// directly drops an old entry address, so it can't move it away from the
  /// address the user picked.
  Future<void> recordAdded(
    Server server, {
    required String entered,
    required String probed,
    required Map<String, dynamic> info,
  }) async {
    final landed = probed.isNotEmpty ? probed : entered;
    final id = info['Id']?.toString();
    final redirected =
        id != null &&
        server.address == landed &&
        isRedirectToOtherOrigin(entered, landed);
    await _store.put(
      server.id,
      redirected ? EntryAddress(address: entered, serverId: id) : null,
    );
  }

  /// [server] at the address its entry address redirects to now, saved when
  /// that changed. The new target is only taken when it answers with the
  /// same server `Id`. It waits at most two seconds and otherwise hands
  /// [server] back as it was, though an answer that comes later is still
  /// saved for next time.
  Future<Server> withFollowedEntryAddress(Server server) =>
      _followed(server)
          .timeout(const Duration(seconds: 2), onTimeout: () => server);

  /// The new address of the saved server [serverId] when its entry address
  /// now redirects somewhere else that answers with the same server `Id`,
  /// saved and handed to a cached client; null when nothing moved.
  Future<String?> followEntryAddressOf(String serverId) async {
    final server = _repository.getServer(serverId);
    if (server == null || entryOf(serverId) == null) return null;
    final followed = await _followed(server);
    return followed.address == server.address ? null : followed.address;
  }

  /// Saved servers whose entry address led somewhere new.
  Stream<ServerMove> get serverMoved => _moved.stream;
  final _moved = StreamController<ServerMove>.broadcast();

  /// Asks the entry address of every saved server that has one, all at once,
  /// so a list of servers shows where they answer now.
  Future<void> followAllEntryAddresses() => Future.wait([
    for (final server in _repository.servers)
      if (entryOf(server.id) != null) withFollowedEntryAddress(server),
  ]);

  /// For `ServerMoved.resolver`: the new address of the saved server
  /// [serverId] that a request to [baseUrl] was for, when it couldn't
  /// connect. All requests that fail together share one ask, and an ask that
  /// found nothing holds for a few seconds, so a dead server isn't asked once
  /// per request.
  ///
  /// A request that started before its server moved and failed after it gets
  /// the address that server is at now. It never goes to another server's
  /// address, whatever server uses or used its own address.
  Future<String?> followMovedAddress(String baseUrl, {String? serverId}) {
    final wanted = _withoutTrailingSlash(baseUrl);
    final server = serverId == null ? null : _repository.getServer(serverId);
    if (server == null) return Future.value();
    if (_withoutTrailingSlash(server.address) != wanted) {
      return Future.value(server.address);
    }
    if (entryOf(server.id) == null) return Future.value();
    final asked = _lastFruitlessAsk[server.id];
    if (asked != null && DateTime.now().difference(asked) < _fruitlessAskHold) {
      return Future.value();
    }
    return _movingAsks[server.id] ??= () async {
      try {
        final moved = await followEntryAddressOf(server.id);
        if (moved == null) {
          _lastFruitlessAsk[server.id] = DateTime.now();
        } else {
          _lastFruitlessAsk.remove(server.id);
        }
        return moved;
      } finally {
        _movingAsks.remove(server.id);
      }
    }();
  }

  /// For `ServerMoved.serverAt`: the saved server a request to [baseUrl] is
  /// for, taken when it starts, so a move can only send it to that server.
  ///
  /// When more than one saved server is at [baseUrl], the address alone
  /// can't tell whose request it is, so it gets none and is never sent
  /// elsewhere: following it could hand one server's token to another.
  String? serverIdAt(String baseUrl) {
    final wanted = _withoutTrailingSlash(baseUrl);
    final at = _repository.servers
        .where((s) => _withoutTrailingSlash(s.address) == wanted)
        .toList();
    return at.length == 1 ? at.single.id : null;
  }

  /// For `ServerMoved.canMove`: whether [baseUrl] is the address of a saved
  /// server added through a redirect.
  bool canMove(String baseUrl) {
    final wanted = _withoutTrailingSlash(baseUrl);
    return _repository.servers.any(
      (s) =>
          entryOf(s.id) != null && _withoutTrailingSlash(s.address) == wanted,
    );
  }

  final _movingAsks = <String, Future<String?>>{};
  final _lastFruitlessAsk = <String, DateTime>{};
  static const _fruitlessAskHold = Duration(seconds: 3);

  /// Moves found are saved one after another, so a slow save can't finish
  /// after a later one.
  Future<void> _saving = Future.value();

  static String _withoutTrailingSlash(String url) =>
      url.endsWith('/') ? url.substring(0, url.length - 1) : url;

  Future<Server> _followed(Server server) async {
    final entry = entryOf(server.id);
    if (entry == null) return server;
    // A plain HTTP reply can be changed by anyone on the way, and a matching
    // public `Id` proves nothing, so it never takes a server's token away
    // from an HTTPS address. Only an HTTPS entry may move it there.
    if (Uri.tryParse(entry.address)?.scheme != 'https' &&
        Uri.tryParse(server.address)?.scheme == 'https') {
      return server;
    }
    final wasSaved = _repository.getServer(server.id) != null;
    try {
      final (info, _, resolvedUrl) = await _repository.probeServer(
        entry.address,
      );
      if (resolvedUrl.isEmpty || resolvedUrl == server.address) return server;
      if (info['Id']?.toString() != entry.serverId) return server;
      return await _save(server, resolvedUrl, entry, wasSaved);
    } catch (_) {
      return server;
    }
  }

  Future<Server> _save(
    Server server,
    String address,
    EntryAddress entry,
    bool wasSaved,
  ) {
    final done = _saving.then((_) async {
      // The answer only holds for the record the probe started from: one
      // removed meanwhile stays removed, and one that moved or was added
      // again meanwhile keeps what it has now.
      final current = _repository.getServer(server.id);
      if (wasSaved) {
        if (current == null) return server;
        if (current.address != server.address) return current;
      }
      if (!identical(entryOf(server.id), entry)) return current ?? server;
      final moved = (current ?? server).copyWith(address: address);
      try {
        await _repository.updateServer(moved);
      } catch (_) {
        // The list already took it: put back what was there, unless another
        // update or a removal replaced it meanwhile, which then stays.
        final after = _repository.getServer(server.id);
        if (after == null) return server;
        if (current != null && after.address == moved.address) {
          try {
            await _repository.updateServer(current);
          } catch (_) {}
          return _repository.getServer(server.id) ?? server;
        }
        return after;
      }
      // A removal that came in while this one saved stays a removal; a
      // server not in the list yet (being signed in to) just moved.
      final saved = _repository.getServer(server.id);
      if (saved == null && wasSaved) return server;
      if (saved == null || saved.address == moved.address) {
        _pointClient(moved);
        _moved.add(ServerMove(from: server.address, server: moved));
        return moved;
      }
      var now = saved;
      // Another update that came in while this one saved wins, on disk too.
      // Its own write may have landed before this one, so write what the
      // list holds now, and again while it keeps changing underneath.
      for (var i = 0; i < 3; i++) {
        try {
          await _repository.updateServer(now);
        } catch (_) {}
        final again = _repository.getServer(server.id);
        if (again == null) return server;
        if (again.address == now.address) break;
        now = again;
      }
      final latest = _repository.getServer(server.id);
      if (latest == null) return server;
      _pointClient(latest);
      return latest;
    });
    _saving = done.then((_) {}, onError: (_) {});
    return done;
  }

  void _pointClient(Server server) {
    final client = _clients.getClientIfExists(server.id);
    if (client != null && client.baseUrl != server.address) {
      client.baseUrl = server.address;
    }
  }

  /// Whether probing [entered] ended on another scheme, host or port than it
  /// started on, which only a redirect does. A path the probe added (Emby's
  /// `/emby`) doesn't count, and neither does a proxy upgrading plain HTTP to
  /// HTTPS on the same host and default ports: following that again would
  /// only send an unencrypted request that always lands on the same address.
  @visibleForTesting
  static bool isRedirectToOtherOrigin(String entered, String resolved) {
    final from = Uri.tryParse(entered);
    final to = Uri.tryParse(resolved);
    if (from == null || to == null || !from.hasAuthority || !to.hasAuthority) {
      return false;
    }
    final sameHost = from.host.toLowerCase() == to.host.toLowerCase();
    final httpsUpgrade =
        sameHost &&
        from.scheme == 'http' &&
        to.scheme == 'https' &&
        from.port == 80 &&
        to.port == 443;
    if (httpsUpgrade) return false;
    return from.scheme != to.scheme || !sameHost || from.port != to.port;
  }
}
