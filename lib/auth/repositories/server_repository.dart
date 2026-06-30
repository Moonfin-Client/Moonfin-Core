import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../../data/services/media_server_client_factory.dart';
import '../../util/server_url.dart';
import '../models/server.dart';
import '../models/server_addition_state.dart';
import '../store/authentication_store.dart';

class ServerRepository {
  final AuthenticationStore _authStore;
  final MediaServerClientFactory _clientFactory;

  final List<Server> _servers = [];
  final _stateController = StreamController<ServerAdditionState>.broadcast();

  ServerRepository(this._authStore, this._clientFactory);

  List<Server> get servers => List.unmodifiable(_servers);
  Stream<ServerAdditionState> get additionState => _stateController.stream;

  static const _defaultPorts = [8096, 8920];

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

  Future<Server?> addServer(String address) async {
    address = normalizeServerBaseUrl(address.trim());
    if (address.isEmpty) {
      return null;
    }

    final candidates = _buildCandidates(address);
    _stateController.add(ServerConnecting(address: address));

    String? lastCandidate;
    String? lastErrorType;
    int? lastStatusCode;
    String? lastErrorMessage;

    for (final candidate in candidates) {
      try {
        final (info, serverType, resolvedUrl) = await _probeServer(candidate);
        final serverAddress = resolvedUrl.isNotEmpty ? resolvedUrl : candidate;

        final existingIndex = _servers.indexWhere(
          (s) =>
              s.address == serverAddress ||
              _endpointIdentity(s.address) == _endpointIdentity(serverAddress),
        );
        if (existingIndex >= 0) {
          final existing = _servers[existingIndex];
          final updated = existing.copyWith(
            name: info['ServerName'] as String? ?? existing.name,
            version: info['Version'] as String? ?? existing.version,
            serverType: serverType,
            dateLastAccessed: DateTime.now(),
          );
          await _authStore.putServer(updated);
          _servers[existingIndex] = updated;
          _stateController.add(
            ServerConnected(id: updated.id, publicInfo: info),
          );
          return updated;
        }

        final server = Server(
          id: const Uuid().v4(),
          name: info['ServerName'] as String? ?? address,
          address: serverAddress,
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
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        final detail =
            e.response?.data?.toString() ?? e.message ?? e.error?.toString();
        lastCandidate = candidate;
        lastErrorType = e.type.name;
        lastStatusCode = status;
        lastErrorMessage = detail;
      } catch (e) {
        lastCandidate = candidate;
        lastErrorType = 'exception';
        lastStatusCode = null;
        lastErrorMessage = e.toString();
      }
    }

    _stateController.add(
      ServerUnableToConnect(
        candidatesTried: candidates,
        lastCandidate: lastCandidate,
        lastErrorType: lastErrorType,
        lastStatusCode: lastStatusCode,
        lastErrorMessage: lastErrorMessage,
      ),
    );
    return null;
  }

  Future<void> updateServer(Server server) async {
    final index = _servers.indexWhere((s) => s.id == server.id);
    if (index >= 0) {
      _servers[index] = server;
    }
    await _authStore.putServer(server);
  }

  Future<void> deleteServer(String serverId) async {
    _servers.removeWhere((s) => s.id == serverId);
    _clientFactory.removeClient(serverId);
    await _authStore.removeServer(serverId);
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
        throw const FormatException('No Jellyfin or Emby server at this address');
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
