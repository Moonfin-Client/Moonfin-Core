import 'dart:async';
import 'dart:collection';
import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:web/web.dart' as web;

import '../../platform/web_runtime_config.dart';
import '../../util/server_url.dart';
import 'server_discovery_types.dart';

class ServerDiscoveryService {
  static const _requestTimeout = Duration(milliseconds: 1200);
  static const _maxInFlight = 16;
  static const _commonPorts = <int>[8096, 8920];
  static const _webrtcGatherTimeout = Duration(milliseconds: 2200);
  static const _webrtcPollInterval = Duration(milliseconds: 120);

  Stream<DiscoveredServer> discoverLocalServers() async* {
    var canceled = false;
    final controller = StreamController<DiscoveredServer>(
      onCancel: () {
        canceled = true;
      },
    );
    final seen = <String>{};

    void emit(DiscoveredServer server) {
      if (canceled) return;
      final normalizedAddress = normalizeServerBaseUrl(
        server.address,
      ).toLowerCase();
      if (normalizedAddress.isEmpty || !seen.add(normalizedAddress)) {
        return;
      }
      if (!controller.isClosed) {
        controller.add(server);
      }
    }

    unawaited(() async {
      final dio = Dio(
        BaseOptions(
          connectTimeout: _requestTimeout,
          receiveTimeout: _requestTimeout,
          followRedirects: false,
          validateStatus: (status) => status != null && status >= 200,
        ),
      );

      try {
        await _discoverSameOriginAndCommonHosts(
          dio,
          emit,
          isCanceled: () => canceled,
        );
        if (canceled) return;

        await _discoverViaProxy(dio, emit, isCanceled: () => canceled);
        if (canceled) return;

        if (webRuntimeConfig.enableWebRtcScan) {
          await _discoverPrivateSubnet(dio, emit, isCanceled: () => canceled);
        }
      } catch (_) {
      } finally {
        dio.close(force: true);
        if (!controller.isClosed) {
          await controller.close();
        }
      }
    }());

    yield* controller.stream;
  }

  Future<void> _discoverSameOriginAndCommonHosts(
    Dio dio,
    void Function(DiscoveredServer server) onFound, {
    required bool Function() isCanceled,
  }) async {
    if (isCanceled()) return;
    final origin = Uri.base;
    if (origin.host.trim().isEmpty) return;

    final candidates = <String>{};

    void addCandidate(String value) {
      final normalized = normalizeServerBaseUrl(value);
      if (normalized.isNotEmpty) {
        candidates.add(normalized);
      }
    }

    final originBase = '${origin.scheme}://${origin.authority}';
    addCandidate(originBase);

    final hostCandidates = <String>{origin.host};
    if (origin.host == 'localhost') {
      hostCandidates.add('127.0.0.1');
    }
    if (origin.host == '127.0.0.1') {
      hostCandidates.add('localhost');
    }

    final schemes = origin.scheme.toLowerCase() == 'https'
        ? const <String>['https']
        : const <String>['http', 'https'];

    for (final host in hostCandidates) {
      if (isCanceled()) return;
      final hostForUrl = _formatHostForUrl(host);
      for (final scheme in schemes) {
        for (final port in _commonPorts) {
          addCandidate('$scheme://$hostForUrl:$port');
        }
      }
    }

    await _probeCandidates(dio, candidates, onFound, isCanceled: isCanceled);
  }

  Future<void> _discoverViaProxy(
    Dio dio,
    void Function(DiscoveredServer server) onFound, {
    required bool Function() isCanceled,
  }) async {
    if (isCanceled()) return;
    final rawProxy = webRuntimeConfig.discoveryProxyUrl?.trim() ?? '';
    if (rawProxy.isEmpty) return;

    Uri proxyUri;
    try {
      proxyUri = Uri.parse(rawProxy);
    } catch (_) {
      return;
    }

    final discoverUrl = proxyUri.resolve('discover').toString();

    Response<dynamic> response;
    try {
      response = await dio.get<dynamic>(discoverUrl);
    } catch (_) {
      return;
    }

    if (response.statusCode == null || response.statusCode! >= 400) {
      return;
    }

    final data = response.data;
    final entries = switch (data) {
      List<dynamic> list => list,
      Map<dynamic, dynamic> map when map['servers'] is List<dynamic> =>
        map['servers'] as List<dynamic>,
      _ => const <dynamic>[],
    };

    for (final entry in entries) {
      if (isCanceled()) return;
      if (entry is! Map) continue;
      final normalizedEntry = entry.map(
        (key, value) => MapEntry(key.toString(), value),
      );

      final address = _readString(normalizedEntry, const [
        'address',
        'url',
        'baseUrl',
      ]);
      final normalizedAddress = normalizeServerBaseUrl(address);
      if (normalizedAddress.isEmpty) continue;

      final serverType = _detectServerType(
        typeHint: _readString(normalizedEntry, const ['type', 'serverType']),
        productName: _readString(normalizedEntry, const ['productName']),
        version: _readString(normalizedEntry, const ['version']),
      );

      final id = _readString(normalizedEntry, const ['id', 'serverId']);
      final name = _readString(normalizedEntry, const ['name', 'serverName']);
      final fallbackName =
          Uri.tryParse(normalizedAddress)?.host ?? normalizedAddress;

      onFound(
        DiscoveredServer(
          id: id.isNotEmpty ? id : '$serverType-$normalizedAddress',
          name: name.isNotEmpty ? name : fallbackName,
          address: normalizedAddress,
          serverType: serverType,
        ),
      );
    }
  }

  Future<void> _discoverPrivateSubnet(
    Dio dio,
    void Function(DiscoveredServer server) onFound, {
    required bool Function() isCanceled,
  }) async {
    if (isCanceled()) return;

    final prefixes = <String>{};
    final currentHostByPrefix = <String, int>{};

    final origin = Uri.base;
    final originOctets = _parseIpv4(origin.host);
    if (originOctets != null && _isPrivateIpv4(originOctets)) {
      final prefix = '${originOctets[0]}.${originOctets[1]}.${originOctets[2]}';
      prefixes.add(prefix);
      currentHostByPrefix[prefix] = originOctets[3];
    }

    final webRtcIps = await _collectPrivateIpv4FromWebRtc();
    if (isCanceled()) return;

    for (final octets in webRtcIps) {
      final prefix = '${octets[0]}.${octets[1]}.${octets[2]}';
      prefixes.add(prefix);
      currentHostByPrefix[prefix] = octets[3];
    }

    final candidates = _buildPrivateSubnetCandidates(
      prefixes: prefixes,
      currentHostByPrefix: currentHostByPrefix,
      originScheme: origin.scheme,
    );
    if (candidates.isEmpty) return;
    await _probeCandidates(dio, candidates, onFound, isCanceled: isCanceled);
  }

  Future<List<List<int>>> _collectPrivateIpv4FromWebRtc() async {
    web.RTCPeerConnection? peer;
    try {
      peer = web.RTCPeerConnection();
      peer.createDataChannel('moonfin-discovery');

      await peer.setLocalDescription().toDart;

      final deadline = DateTime.now().add(_webrtcGatherTimeout);
      while (DateTime.now().isBefore(deadline) &&
          peer.iceGatheringState != 'complete') {
        await Future.delayed(_webrtcPollInterval);
      }

      final sdp = peer.localDescription?.sdp ?? '';
      if (sdp.trim().isEmpty) {
        return const <List<int>>[];
      }

      return _extractPrivateIpv4FromSdp(sdp);
    } catch (_) {
      return const <List<int>>[];
    } finally {
      peer?.close();
    }
  }

  List<List<int>> _extractPrivateIpv4FromSdp(String sdp) {
    final result = <List<int>>[];
    final seen = <String>{};
    final candidateRegex = RegExp(
      r'candidate:[^\r\n]*?\s(\d{1,3}(?:\.\d{1,3}){3})\s\d+\s',
    );

    for (final match in candidateRegex.allMatches(sdp)) {
      final ip = match.group(1);
      if (ip == null || ip.isEmpty || !seen.add(ip)) continue;
      final octets = _parseIpv4(ip);
      if (octets == null || !_isPrivateIpv4(octets)) continue;
      result.add(octets);
    }

    return result;
  }

  List<String> _buildPrivateSubnetCandidates({
    required Set<String> prefixes,
    required Map<String, int> currentHostByPrefix,
    required String originScheme,
  }) {
    if (prefixes.isEmpty) return const <String>[];

    final schemes = originScheme.toLowerCase() == 'https'
        ? const <String>['https']
        : const <String>['http', 'https'];

    final candidates = <String>{};
    for (final prefix in prefixes) {
      final currentHost = currentHostByPrefix[prefix];
      for (var hostPart = 1; hostPart <= 254; hostPart++) {
        if (currentHost != null && hostPart == currentHost) continue;

        final host = '$prefix.$hostPart';
        for (final scheme in schemes) {
          for (final port in _commonPorts) {
            final normalized = normalizeServerBaseUrl('$scheme://$host:$port');
            if (normalized.isNotEmpty) {
              candidates.add(normalized);
            }
          }
        }
      }
    }

    return candidates.toList(growable: false);
  }

  Future<void> _probeCandidates(
    Dio dio,
    Iterable<String> candidates,
    void Function(DiscoveredServer server) onFound, {
    required bool Function() isCanceled,
  }) async {
    final queue = Queue<String>.from(candidates);
    if (queue.isEmpty || isCanceled()) return;

    final workerCount = queue.length < _maxInFlight
        ? queue.length
        : _maxInFlight;
    final workers = List<Future<void>>.generate(workerCount, (_) async {
      while (queue.isNotEmpty && !isCanceled()) {
        final candidate = queue.removeFirst();
        final discovered = await _probeServer(dio, candidate);
        if (discovered != null) {
          onFound(discovered);
        }
      }
    });

    await Future.wait(workers);
  }

  Future<DiscoveredServer?> _probeServer(Dio dio, String baseUrl) async {
    ServerProbeResult? result;
    try {
      result = await probeServerPublicInfo(dio, baseUrl);
    } catch (_) {
      return null;
    }
    if (result == null) return null;

    final data = result.info;
    final address = normalizeServerBaseUrl(result.resolvedBaseUrl);
    final id = _readString(data, const ['Id', 'ServerId']);
    final name = _readString(data, const ['ServerName', 'Name', 'ProductName']);
    final host = Uri.tryParse(address)?.host ?? '';
    final fallbackName = host.isNotEmpty ? host : address;

    return DiscoveredServer(
      id: id.isNotEmpty ? id : '${result.serverType}-$address',
      name: name.isNotEmpty ? name : fallbackName,
      address: address,
      serverType: result.serverType,
    );
  }

  String _readString(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value == null) continue;
      final text = value.toString().trim();
      if (text.isNotEmpty) return text;
    }
    return '';
  }

  ServerType _detectServerType({
    String? typeHint,
    String? productName,
    String? version,
  }) {
    final normalizedHint = typeHint?.trim().toLowerCase();
    if (normalizedHint == 'emby') return ServerType.emby;
    if (normalizedHint == 'jellyfin') return ServerType.jellyfin;
    return ServerType.detect(productName, version);
  }

  List<int>? _parseIpv4(String host) {
    final parts = host.split('.');
    if (parts.length != 4) return null;

    final octets = <int>[];
    for (final part in parts) {
      final value = int.tryParse(part);
      if (value == null || value < 0 || value > 255) {
        return null;
      }
      octets.add(value);
    }

    return octets;
  }

  bool _isPrivateIpv4(List<int> octets) {
    final first = octets[0];
    final second = octets[1];
    return first == 10 ||
        (first == 172 && second >= 16 && second <= 31) ||
        (first == 192 && second == 168) ||
        (first == 169 && second == 254) ||
        (first == 100 && second >= 64 && second <= 127) ||
        first == 127;
  }

  String _formatHostForUrl(String host) {
    if (host.contains(':') && !host.startsWith('[') && !host.endsWith(']')) {
      return '[$host]';
    }
    return host;
  }
}
