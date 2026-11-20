import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../../data/services/client_certificate_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../util/server_url.dart';
import '../models/server.dart';
import '../models/server_addition_state.dart';
import '../models/silo_native_offer.dart';
import '../store/authentication_store.dart';
import '../store/client_certificate_store.dart';

/// A saved server that answers on a new address now: [from] is where it
/// was, [server] is it as saved at its new address.
class ServerMove {
  const ServerMove({required this.from, required this.server});

  final String from;
  final Server server;
}

class ServerRepository {
  final AuthenticationStore _authStore;
  final MediaServerClientFactory _clientFactory;
  final ClientCertificateStore? _certStore;

  final List<Server> _servers = [];
  final _stateController = StreamController<ServerAdditionState>.broadcast();

  ServerRepository(this._authStore, this._clientFactory, [this._certStore]) {
    gIsOwnServerHost = _isOwnServerHost;
  }

  /// Hosts the user typed this session, which have no saved server yet while
  /// they're being added.
  final Set<String> _typedHosts = {};

  /// Whether [host] belongs to a saved server at any address it's reached on,
  /// the entry address it was added through included, or to one the user
  /// typed. Self-signed certificates are only accepted for these.
  bool _isOwnServerHost(String host) =>
      _typedHosts.contains(host) ||
      _servers.any(
        (s) => [
          s.address,
          ?s.entryAddress,
          ...s.candidateAddresses,
        ].any((a) => Uri.tryParse(a)?.host == host),
      );

  List<Server> get servers => List.unmodifiable(_servers);
  Stream<ServerAdditionState> get additionState => _stateController.stream;

  /// The most recent server that couldn't be added, for a caller that only
  /// sees the null result.
  ServerUnableToConnect? get lastFailure => _lastFailure;
  ServerUnableToConnect? _lastFailure;

  static const _defaultPorts = [8096, 8920];

  /// Where Silo's native API listens next to its Jellyfin-compatible service
  /// (8096): 8090 is the port Silo's Docker Compose file publishes, 8080 the
  /// listener's own default. Tried in this order.
  @visibleForTesting
  List<int> siloNativePorts = const [8090, 8080];

  Future<void> loadStoredServers() async {
    final stored = _authStore.getServers();
    _servers.clear();

    final seenEndpoints = <String, String>{};

    for (final server in stored) {
      final normalizedAddress = normalizeServerBaseUrl(server.address);
      final normalizedServer =
          normalizedAddress != server.address && normalizedAddress.isNotEmpty
          ? server.copyWith(address: normalizedAddress)
          : server;

      if (normalizedAddress != server.address && normalizedAddress.isNotEmpty) {
        await _authStore.putServer(normalizedServer);
      }

      final endpointKey = _endpointIdentity(normalizedServer.address);
      final existingServerId = seenEndpoints[endpointKey];
      if (existingServerId != null && existingServerId != normalizedServer.id) {
        await _authStore.removeServer(normalizedServer.id);
        continue;
      }

      seenEndpoints[endpointKey] = normalizedServer.id;
      _servers.add(normalizedServer);
    }
  }

  Server? getServer(String serverId) {
    final index = _servers.indexWhere((s) => s.id == serverId);
    return index >= 0 ? _servers[index] : null;
  }

  /// Adds the server at [address].
  ///
  /// When the address turns out to be Silo's Jellyfin-compatible service and
  /// Silo's native API answers on the same host, [offerSiloNative] is asked
  /// whether to add the native server instead. Without it, or when it
  /// answers false, the Jellyfin server is added as before.
  Future<Server?> addServer(
    String address, {
    SiloNativeOfferHandler? offerSiloNative,
  }) async {
    final enteredAddress = address;
    address = normalizeServerBaseUrl(address.trim());
    if (address.isEmpty) {
      return null;
    }
    final typedHost = Uri.tryParse(address)?.host;
    if (typedHost != null && typedHost.isNotEmpty) _typedHosts.add(typedHost);

    final candidates = _buildCandidates(address);
    _stateController.add(ServerConnecting(address: address));

    String? lastCandidate;
    String? lastErrorType;
    int? lastStatusCode;
    String? lastErrorMessage;
    String? untrustedCandidate;
    String? clientCertCandidate;
    String? possibleClientCertCandidate;
    SiloApiUnsupported? unsupportedSilo;

    for (final candidate in candidates) {
      try {
        var (info, serverType, resolvedUrl) = await _probeServer(candidate);
        // Only a redirect the entered address answered with counts. Switching
        // to Silo's native API below lands on another port too, but following
        // the entry address again would lead back to the compat service.
        var redirected = isRedirectToOtherOrigin(
          candidate,
          resolvedUrl.isNotEmpty ? resolvedUrl : candidate,
        );
        if (serverType == ServerType.jellyfin && offerSiloNative != null) {
          final jellyfinAddress = resolvedUrl.isNotEmpty
              ? resolvedUrl
              : candidate;
          final native = await _findSiloNative(jellyfinAddress);
          if (native != null &&
              await offerSiloNative(
                SiloNativeOffer(
                  jellyfinAddress: jellyfinAddress,
                  siloAddress: native.$3,
                  serverName: native.$1['ServerName'] as String? ?? 'Silo',
                ),
              )) {
            (info, serverType, resolvedUrl) = native;
            redirected = false;
          }
        }
        if (serverType == ServerType.silo) {
          final apiMajor = info['SiloApiMajor'];
          if (apiMajor is num && apiMajor.toInt() != siloSupportedApiMajor) {
            throw SiloApiUnsupported(apiMajor: apiMajor.toInt());
          }
        }
        final serverAddress = resolvedUrl.isNotEmpty ? resolvedUrl : candidate;
        final entryServerId = redirected ? info['Id']?.toString() : null;

        final existingIndex = _servers.indexWhere(
          (s) =>
              s.address == serverAddress ||
              _endpointIdentity(s.address) == _endpointIdentity(serverAddress),
        );
        if (existingIndex >= 0) {
          final existing = _servers[existingIndex];
          final displayAddress = serverDisplayAddress(
            enteredAddress: enteredAddress,
            resolvedAddress: existing.address,
          );
          final updated = existing.copyWith(
            name: info['ServerName'] as String? ?? existing.name,
            displayAddress: displayAddress,
            clearDisplayAddress: displayAddress == null,
            version: info['Version'] as String? ?? existing.version,
            serverType: serverType,
            entryAddress: redirected ? candidate : null,
            entryServerId: entryServerId,
            // Added at its target directly: the old entry address must not
            // move it away from the address the user picked.
            clearEntryAddress: !redirected,
            dateLastAccessed: DateTime.now(),
          );
          await _authStore.putServer(updated);
          _servers[existingIndex] = updated;
          _stateController.add(
            ServerConnected(id: updated.id, publicInfo: info),
          );
          return updated;
        }

        final displayAddress = serverDisplayAddress(
          enteredAddress: enteredAddress,
          resolvedAddress: serverAddress,
        );
        final server = Server(
          id: const Uuid().v4(),
          name: info['ServerName'] as String? ?? displayAddress ?? address,
          address: serverAddress,
          displayAddress: displayAddress,
          entryAddress: redirected ? candidate : null,
          entryServerId: entryServerId,
          version: info['Version'] as String? ?? '',
          serverType: serverType,
          loginDisclaimer: info['LoginDisclaimer'] as String?,
          setupCompleted: info['StartupWizardCompleted'] as bool? ?? true,
          dateAdded: DateTime.now(),
        );

        await _authStore.putServer(server);
        _servers.add(server);
        _stateController.add(ServerConnected(id: server.id, publicInfo: info));
        return server;
      } on SiloApiUnsupported catch (e) {
        // The server is found. Trying other schemes and ports would only
        // find it again, or something else at the same host.
        lastCandidate = candidate;
        lastErrorType = 'silo_api_unsupported';
        lastErrorMessage = e.toString();
        unsupportedSilo = e;
        break;
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        final detail =
            e.response?.data?.toString() ?? e.message ?? e.error?.toString();
        lastCandidate = candidate;
        lastErrorType = e.type.name;
        lastStatusCode = status;
        lastErrorMessage = detail;
        if (isUntrustedCertificate(e)) untrustedCandidate ??= candidate;
        if (isClientCertificateRejected(e)) clientCertCandidate ??= candidate;
        if (candidate.startsWith('https:') && _reachedServer(e)) {
          possibleClientCertCandidate ??= candidate;
        }
      } catch (e) {
        lastCandidate = candidate;
        lastErrorType = 'exception';
        lastStatusCode = null;
        lastErrorMessage = e.toString();
      }
    }

    final failure = ServerUnableToConnect(
      candidatesTried: candidates,
      lastCandidate: lastCandidate,
      lastErrorType: lastErrorType,
      lastStatusCode: lastStatusCode,
      lastErrorMessage: lastErrorMessage,
      untrustedCandidate: untrustedCandidate,
      clientCertCandidate: clientCertCandidate,
      possibleClientCertCandidate: possibleClientCertCandidate,
      unsupportedSilo: unsupportedSilo,
    );
    _lastFailure = failure;
    _stateController.add(failure);
    return null;
  }

  /// [server] with its type checked against what its address reports now,
  /// saved when it was stored as Jellyfin but is Emby or the other way round.
  /// It waits at most two seconds and otherwise hands [server] back as it was,
  /// though an answer that comes later is still saved for next time.
  Future<Server> withCheckedType(Server server) => _checkedType(
    server,
  ).timeout(const Duration(seconds: 2), onTimeout: () => server);

  Future<Server> _checkedType(Server server) async {
    const switchable = {ServerType.jellyfin, ServerType.emby};
    if (!switchable.contains(server.serverType)) return server;
    final wasSaved = getServer(server.id) != null;
    try {
      final (_, detected, _) = await _probeServer(server.address);
      if (!switchable.contains(detected) || detected == server.serverType) {
        return server;
      }
      // The record as saved now: an entry address followed during the probe
      // may have moved it, and a removed server must stay removed.
      final current = getServer(server.id);
      if (wasSaved && current == null) return server;
      final corrected = (current ?? server).copyWith(serverType: detected);
      await saveServer(corrected);
      return corrected;
    } catch (_) {
      return server;
    }
  }

  /// [server] at the address its [Server.entryAddress] redirects to now,
  /// saved when that changed. A server added through a redirect to another
  /// host or port (a stable name in front of a dynamic `host:port`) would
  /// otherwise keep the old target after it moves. The new target is only
  /// taken when it answers with the same server `Id`. It waits at most two
  /// seconds and otherwise hands [server] back as it was, though an answer
  /// that comes later is still saved for next time.
  Future<Server> withFollowedEntryAddress(Server server) => _followedEntry(
    server,
  ).timeout(const Duration(seconds: 2), onTimeout: () => server);

  /// The new address of the saved server [serverId] when its entry address
  /// now redirects somewhere else that answers with the same server `Id`,
  /// saved and handed to a cached client; null when nothing moved. Asked by
  /// the reachability check once the current address stops answering, so a
  /// target that moves while the app is open is found without a restart.
  Future<String?> followEntryAddressOf(String serverId) async {
    final server = getServer(serverId);
    if (server == null || server.entryAddress == null) return null;
    final followed = await _followedEntry(server);
    return followed.address == server.address ? null : followed.address;
  }

  /// Saved servers whose entry address led somewhere new.
  Stream<ServerMove> get serverMoved => _movedController.stream;
  final _movedController = StreamController<ServerMove>.broadcast();

  /// Asks the entry address of every saved server that has one, all at once,
  /// so a list of servers shows where they answer now.
  Future<void> followAllEntryAddresses() => Future.wait([
    for (final server in List.of(_servers))
      if (server.entryAddress != null) withFollowedEntryAddress(server),
  ]);

  /// For [ServerMoved.resolver]: the new address of the saved server that
  /// [baseUrl] belongs to, when a request to it couldn't connect. All requests
  /// that fail together share one ask, and an ask that found nothing holds for
  /// a few seconds, so a dead server isn't asked once per request.
  ///
  /// A request to an address its server already moved away from gets the
  /// address it moved to, since a request that started before the move can
  /// fail after it, when no saved server uses its address any more. Once
  /// another saved server answers there, the address is that server's again.
  Future<String?> followMovedAddress(String baseUrl) {
    final wanted = _withoutTrailingSlash(baseUrl);
    final atWanted = _servers
        .where((s) => _withoutTrailingSlash(s.address) == wanted)
        .toList();
    final server = atWanted.where((s) => s.entryAddress != null).firstOrNull;
    if (server == null) {
      if (atWanted.isNotEmpty) return Future.value();
      final movedId = _movedAway[wanted];
      final current = movedId == null ? null : getServer(movedId);
      if (current == null || _withoutTrailingSlash(current.address) == wanted) {
        return Future.value();
      }
      return Future.value(current.address);
    }
    final asked = _lastFruitlessAsk[server.id];
    if (asked != null &&
        DateTime.now().difference(asked) < _fruitlessAskHold) {
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

  /// For [ServerMoved.canMove]: whether [baseUrl] is the address of a saved
  /// server added through a redirect.
  bool canMove(String baseUrl) {
    final wanted = _withoutTrailingSlash(baseUrl);
    return _servers.any(
      (s) =>
          s.entryAddress != null && _withoutTrailingSlash(s.address) == wanted,
    );
  }

  final _movingAsks = <String, Future<String?>>{};
  final _lastFruitlessAsk = <String, DateTime>{};
  static const _fruitlessAskHold = Duration(seconds: 3);

  /// Addresses saved servers moved away from, without a trailing slash, to
  /// the id of the server that moved, oldest first. Only the latest
  /// [_movedAwayLimit] are kept: they're for requests still on the way.
  final _movedAway = <String, String>{};
  static const _movedAwayLimit = 16;

  void _rememberMovedAway(String from, String serverId) {
    final key = _withoutTrailingSlash(from);
    _movedAway
      ..remove(key)
      ..[key] = serverId;
    while (_movedAway.length > _movedAwayLimit) {
      _movedAway.remove(_movedAway.keys.first);
    }
  }

  static String _withoutTrailingSlash(String url) =>
      url.endsWith('/') ? url.substring(0, url.length - 1) : url;

  Future<Server> _followedEntry(Server server) async {
    final entry = server.entryAddress;
    final entryServerId = server.entryServerId;
    if (entry == null || entryServerId == null) return server;
    final wasSaved = getServer(server.id) != null;
    try {
      final (info, _, resolvedUrl) = await _probeServer(entry);
      if (resolvedUrl.isEmpty || resolvedUrl == server.address) return server;
      if (info['Id']?.toString() != entryServerId) return server;
      // The answer only holds for the record the probe started from: one
      // removed meanwhile stays removed, and one that moved or was added
      // again meanwhile keeps what it has now.
      final current = getServer(server.id);
      if (wasSaved) {
        if (current == null) return server;
        if (current.address != server.address ||
            current.entryAddress != entry ||
            current.entryServerId != entryServerId) {
          return current;
        }
      }
      final moved = (current ?? server).copyWith(address: resolvedUrl);
      await updateServer(moved);
      _clientFactory.getClientIfExists(server.id)?.baseUrl = resolvedUrl;
      _rememberMovedAway(server.address, server.id);
      _movedController.add(ServerMove(from: server.address, server: moved));
      return moved;
    } catch (_) {
      return server;
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
    final httpsUpgrade = sameHost &&
        from.scheme == 'http' &&
        to.scheme == 'https' &&
        from.port == 80 &&
        to.port == 443;
    if (httpsUpgrade) return false;
    return from.scheme != to.scheme || !sameHost || from.port != to.port;
  }

  /// Adds [server] as is, or replaces the one with its id, for servers that
  /// can't go through the [addServer] probe.
  Future<void> saveServer(Server server) async {
    _servers.removeWhere((s) => s.id == server.id);
    _servers.add(server);
    await _authStore.putServer(server);
  }

  /// Saves [server] and then replaces the one with its id in the list, so a
  /// save that fails leaves the list as it was.
  Future<void> updateServer(Server server) async {
    await _authStore.putServer(server);
    final index = _servers.indexWhere((s) => s.id == server.id);
    if (index >= 0) {
      _servers[index] = server;
    }
  }

  Future<void> deleteServer(String serverId) async {
    final removed = getServer(serverId);
    _servers.removeWhere((s) => s.id == serverId);
    _clientFactory.removeClient(serverId);
    await _authStore.removeServer(serverId);
    final certStore = _certStore;
    if (removed == null || certStore == null) return;
    final host = Uri.tryParse(removed.address)?.host ?? '';
    if (clientCertificateFor(host) == null ||
        _servers.any((s) => Uri.tryParse(s.address)?.host == host)) {
      return;
    }
    await removeClientCertificate(certStore, host);
  }

  Future<(Map<String, dynamic>, ServerType, String)> _probeServer(
    String baseUrl,
  ) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        followRedirects: false,
        validateStatus: (status) => status != null && status < 400,
      ),
    );
    configureServerDio(dio);

    try {
      final result = await probeServerPublicInfo(dio, baseUrl);
      if (result == null) {
        throw const FormatException(
          'No Jellyfin, Emby or Silo server at this address',
        );
      }
      return (
        result.info,
        result.serverType,
        normalizeServerBaseUrl(result.resolvedBaseUrl),
      );
    } finally {
      dio.close();
    }
  }

  /// Whether [e] came after something answered at the address. A refused,
  /// unreachable, timed out or unresolved connection means nothing is
  /// listening there. The OS message is localised, so it goes by errno.
  static bool _reachedServer(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) return false;
    final reason = '${e.error}';
    if (reason.contains('Failed host lookup')) return false;
    final errno = int.tryParse(
      _errnoPattern.firstMatch(reason)?.group(1) ?? '',
    );
    return errno == null || !_unreachableErrnos.contains(errno);
  }

  static final _errnoPattern = RegExp(r'errno = (\d+)');

  /// Connection refused, network down, network or host unreachable and timed
  /// out, as Linux and Android, Apple platforms and Windows number them.
  static const _unreachableErrnos = {
    111, 100, 101, 113, 110, // Linux, Android
    61, 50, 51, 65, 60, // macOS, iOS
    10061, 10050, 10051, 10065, 10060, 1225, 1231, 1232, // Windows
  };

  /// The native Silo server behind Silo's Jellyfin-compatible service at
  /// [jellyfinBaseUrl], or null. Only looked for when the compat service
  /// identifies itself as Silo's (its branding disclaimer), so adding a real
  /// Jellyfin server costs one extra request. The native ports are then
  /// probed in parallel with a short timeout, on the compat address's scheme
  /// only: an HTTPS address is never swapped for plain HTTP, which would send
  /// the password in the clear.
  Future<(Map<String, dynamic>, ServerType, String)?> _findSiloNative(
    String jellyfinBaseUrl,
  ) async {
    final jellyfin = Uri.tryParse(jellyfinBaseUrl);
    if (jellyfin == null || jellyfin.host.isEmpty) return null;

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 5),
        followRedirects: false,
        validateStatus: (status) => status != null && status < 400,
      ),
    );
    configureServerDio(dio);

    try {
      if (!await looksLikeSiloJellyfinCompat(dio, jellyfinBaseUrl)) {
        return null;
      }
      final candidates = [
        for (final port in siloNativePorts)
          if (port != jellyfin.port)
            Uri(
              scheme: jellyfin.scheme,
              host: jellyfin.host,
              port: port,
            ).toString(),
      ];
      final found = await Future.wait(
        candidates.map((candidate) async {
          try {
            return await probeSiloServer(dio, candidate);
          } catch (_) {
            return null;
          }
        }),
      );
      for (final result in found) {
        if (result != null) {
          return (
            result.info,
            result.serverType,
            normalizeServerBaseUrl(result.resolvedBaseUrl),
          );
        }
      }
      return null;
    } finally {
      dio.close();
    }
  }

  List<String> _buildCandidates(String address) {
    final candidates = <String>{};

    void addCandidate(String value) {
      final normalized = normalizeServerBaseUrl(value);
      if (normalized.isNotEmpty) {
        candidates.add(normalized);
      }
    }

    final explicitScheme =
        address.startsWith('http://') || address.startsWith('https://');
    final parseTarget = explicitScheme ? address : 'https://$address';
    final parsed = Uri.tryParse(parseTarget);

    if (parsed == null || parsed.host.isEmpty) {
      addCandidate(address);
      return candidates.toList();
    }

    String buildCandidate(String scheme, {int? port}) {
      final candidate = Uri(
        scheme: scheme,
        host: parsed.host,
        port: port,
        path: parsed.path,
      );
      return candidate.toString();
    }

    if (explicitScheme) {
      final preferredScheme = parsed.scheme.toLowerCase() == 'http'
          ? 'http'
          : 'https';
      final fallbackScheme = preferredScheme == 'https' ? 'http' : 'https';

      if (parsed.hasPort) {
        addCandidate(buildCandidate(preferredScheme, port: parsed.port));
        addCandidate(buildCandidate(fallbackScheme, port: parsed.port));
        return candidates.toList();
      }

      addCandidate(buildCandidate(preferredScheme));
      addCandidate(buildCandidate(fallbackScheme));

      for (final port in _defaultPorts) {
        addCandidate(buildCandidate(preferredScheme, port: port));
      }
      for (final port in _defaultPorts) {
        addCandidate(buildCandidate(fallbackScheme, port: port));
      }
      return candidates.toList();
    }

    if (parsed.hasPort) {
      addCandidate(buildCandidate('https', port: parsed.port));
      addCandidate(buildCandidate('http', port: parsed.port));
      return candidates.toList();
    }

    addCandidate(buildCandidate('https'));
    addCandidate(buildCandidate('http'));

    for (final port in _defaultPorts) {
      addCandidate(buildCandidate('https', port: port));
    }
    for (final port in _defaultPorts) {
      addCandidate(buildCandidate('http', port: port));
    }
    return candidates.toList();
  }

  String _endpointIdentity(String address) {
    final normalized = normalizeServerBaseUrl(address);
    final parseTarget =
        normalized.startsWith('http://') || normalized.startsWith('https://')
        ? normalized
        : 'https://$normalized';

    final uri = Uri.tryParse(parseTarget);
    if (uri == null || uri.host.isEmpty) {
      return normalized.toLowerCase();
    }

    final host = uri.host.toLowerCase();
    final path = uri.path.isEmpty ? '' : uri.path;
    final port = uri.hasPort
        ? uri.port
        : (uri.scheme == 'http'
              ? 80
              : uri.scheme == 'https'
              ? 443
              : null);

    return '$host:${port ?? ''}$path';
  }

  void dispose() {
    _stateController.close();
  }
}
