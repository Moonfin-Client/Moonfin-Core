import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart';

import '../../util/server_url.dart';

/// A plex.tv sign-in code the user approves at plex.tv/link.
class PlexPin {
  final int id;
  final String code;

  /// Counted from expiresIn, so a wrong device clock can't expire every code
  /// as soon as it arrives.
  final DateTime expiresAt;

  const PlexPin({
    required this.id,
    required this.code,
    required this.expiresAt,
  });

  /// plex.tv/link fills in the code from the pin parameter.
  String get linkUrl => 'https://plex.tv/link/?pin=$code';
}

class PlexServer {
  /// The server's machineIdentifier.
  final String id;
  final String name;
  final String version;
  final String accessToken;

  /// Best first: local, then remote, relay last. [address] is host:port for
  /// display, since a plex.direct uri hides the IP behind a long host name.
  final List<({String uri, String address})> connections;

  const PlexServer({
    required this.id,
    required this.name,
    required this.version,
    required this.accessToken,
    required this.connections,
  });

  factory PlexServer.fromJson(Map<String, dynamic> json) {
    int rank(Map c) => c['relay'] == true ? 2 : (c['local'] == true ? 0 : 1);
    final connections =
        (json['connections'] as List? ?? const []).whereType<Map>().toList()
          ..sort((a, b) => rank(a).compareTo(rank(b)));
    final plainAllowed = json['httpsRequired'] != true;
    return PlexServer(
      id: json['clientIdentifier'] as String? ?? '',
      name: json['name'] as String? ?? '',
      version: plexVersion(json['productVersion']) ?? '',
      accessToken: json['accessToken'] as String? ?? '',
      connections: [
        for (final c in connections)
          if (c['uri'] case final String uri) ...[
            (uri: uri, address: '${c['address']}:${c['port']}'),
            // Some routers block plex.direct names because they point at
            // private IPs, so the plain local address comes next, the same
            // fallback Plex's own apps use.
            if (c['address'] case final String address
                when plainAllowed &&
                    c['local'] == true &&
                    c['relay'] != true &&
                    uri.startsWith('https:'))
              (
                uri: Uri(
                  scheme: 'http',
                  host: address,
                  port: c['port'] as int?,
                ).toString(),
                address: '$address:${c['port']}',
              ),
          ],
      ],
    );
  }

  /// [lanUris] answered GDM on this network, which plex.tv can't see past a
  /// container or NAT, so they go first.
  PlexServer withLanUris(Iterable<String> lanUris) => PlexServer(
    id: id,
    name: name,
    version: version,
    accessToken: accessToken,
    connections: [
      for (final uri in lanUris) (uri: uri, address: Uri.parse(uri).authority),
      ...connections,
    ],
  );

  String? get address => connections.firstOrNull?.address;
}

class PlexTvService {
  static const _probeTimeout = Duration(seconds: 4);

  final DeviceInfo _deviceInfo;
  final Dio _dio;

  /// A server can list dozens of addresses, each its own host, so the probes
  /// skip the request slots and all go out at once. A dead one gives up at
  /// the timeout instead of keeping its connection.
  final Dio _probeDio;

  PlexTvService({required this._deviceInfo})
    : _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Accept': 'application/json'},
        ),
      ),
      _probeDio = Dio(
        BaseOptions(
          connectTimeout: _probeTimeout,
          receiveTimeout: _probeTimeout,
          headers: {'Accept': 'application/json'},
        ),
      ) {
    configureServerDio(_dio);
    configureServerDio(_probeDio, limitRequests: false);
  }

  Map<String, String> get _identity => plexIdentity(_deviceInfo);

  Future<PlexPin> createPin() async {
    final response = await _dio.post<Map<String, dynamic>>(
      'https://plex.tv/api/v2/pins',
      queryParameters: _identity,
    );
    final json = response.data!;
    return PlexPin(
      id: json['id'] as int,
      code: json['code'] as String,
      expiresAt: DateTime.now().add(
        Duration(seconds: json['expiresIn'] as int),
      ),
    );
  }

  /// The account token once the user approves [pinId], else null.
  Future<String?> checkPin(int pinId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://plex.tv/api/v2/pins/$pinId',
      queryParameters: _identity,
    );
    return response.data!['authToken'] as String?;
  }

  /// The account token for an email or username and password. [code] is the
  /// account's two-step verification code, when it has one.
  Future<String> signIn(String login, String password, {String? code}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'https://plex.tv/api/v2/users/signin',
      queryParameters: _identity,
      data: {
        'login': login,
        'password': password,
        'rememberMe': true,
        'verificationCode': ?code,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return response.data!['authToken'] as String;
  }

  /// The account's uuid, which is also the key to its public avatar, and its
  /// display name.
  Future<({String id, String name})> getAccount(String authToken) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://plex.tv/api/v2/user',
      queryParameters: _identity,
      options: Options(headers: {'X-Plex-Token': authToken}),
    );
    final user = response.data!;
    return (
      id: user['uuid'] as String,
      name: (user['title'] ?? user['username']) as String,
    );
  }

  /// The members of the account's Plex Home, each by uuid, and whether a PIN
  /// guards it.
  Future<List<({String id, String name, bool hasPin})>> getHomeUsers(
    String authToken,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://plex.tv/api/v2/home/users',
      queryParameters: _identity,
      options: Options(headers: {'X-Plex-Token': authToken}),
    );
    return [
      for (final user in response.data?['users'] as List? ?? const [])
        if (user case {'uuid': final String id, 'title': final String name})
          (id: id, name: name, hasPin: user['protected'] == true),
    ];
  }

  /// The plex.tv token of the Home member [userId], or null when [pin] is
  /// wrong.
  Future<String?> switchHomeUser(
    String authToken,
    String userId, {
    String? pin,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'https://plex.tv/api/v2/home/users/$userId/switch',
        queryParameters: {..._identity, 'pin': ?pin},
        options: Options(headers: {'X-Plex-Token': authToken}),
      );
      return response.data!['authToken'] as String;
    } catch (e) {
      if (plexWrongPin(e)) return null;
      rethrow;
    }
  }

  Future<List<PlexServer>> getServers(String authToken) async {
    final response = await _dio.get<List<dynamic>>(
      'https://clients.plex.tv/api/v2/resources',
      queryParameters: {..._identity, 'includeHttps': 1, 'includeRelay': 1},
      options: Options(headers: {'X-Plex-Token': authToken}),
    );
    return response.data!
        .whereType<Map<String, dynamic>>()
        .where((r) => (r['provides'] as String? ?? '').contains('server'))
        .map(PlexServer.fromJson)
        .toList(growable: false);
  }

  /// The best of [uris] where the Plex server [machineId] answers.
  Future<String?> findReachableUri(List<String> uris, String machineId) =>
      firstAnswering(uris, (uri) async => await machineIdAt(uri) == machineId);

  /// Where a Plex server answers at a typed [address], or null when nothing
  /// there is one.
  Future<String?> findServerAt(String address) async {
    final candidates = plexAddressCandidates(address);
    final ids = await Future.wait(candidates.map(machineIdAt));
    final index = ids.indexWhere((id) => id != null);
    return index < 0 ? null : candidates[index];
  }

  /// The machineIdentifier of the Plex server at [uri], or null when nothing
  /// there answers as one.
  Future<String?> machineIdAt(String uri) async {
    try {
      final response = await _probeDio
          .get<Map<String, dynamic>>('$uri/identity')
          .timeout(_probeTimeout);
      final identity = response.data?['MediaContainer'] as Map?;
      return identity?['machineIdentifier'] as String?;
    } catch (_) {
      return null;
    }
  }
}

/// The first of [uris], in their order, that [answers]. They're all tried at
/// once, and after one answers, the ones ahead of it only get [grace] more,
/// so an address that never answers, like a container's, doesn't hold things
/// up for its whole timeout.
Future<String?> firstAnswering(
  List<String> uris,
  Future<bool> Function(String uri) answers, {
  Duration grace = const Duration(seconds: 1),
}) async {
  final answered = <int>{};
  final anyAnswered = Completer<void>();
  final probes = [
    for (var i = 0; i < uris.length; i++)
      answers(uris[i]).then((ok) {
        if (!ok) return;
        answered.add(i);
        if (!anyAnswered.isCompleted) anyAnswered.complete();
      }),
  ];
  final graceOver = anyAnswered.future.then((_) => Future<void>.delayed(grace));
  for (var i = 0; i < uris.length; i++) {
    await Future.any([probes[i], graceOver]);
    if (answered.contains(i)) return uris[i];
  }
  return null;
}

int? _plexErrorCode(Object error) => switch (error) {
  DioException(
    response: Response(data: {'errors': [{'code': final int code}, ...]}),
  ) =>
    code,
  _ => null,
};

/// Whether plex.tv turned a password sign-in down because the account's
/// two-step verification code was missing.
bool plexNeedsVerificationCode(Object error) => _plexErrorCode(error) == 1029;

/// Whether plex.tv turned a Plex Home switch down for a wrong or missing PIN.
bool plexWrongPin(Object error) => _plexErrorCode(error) == 1041;

/// The uris to look for a Plex server at for a typed [address]. Plex's own
/// port goes first when none was typed, and a bare address means http, since
/// a LAN IP has no certificate to match.
List<String> plexAddressCandidates(String address) {
  final typed = normalizeServerBaseUrl(
    address.contains('://') ? address : 'http://$address',
  );
  final uri = Uri.tryParse(typed);
  if (uri == null || uri.host.isEmpty) return const [];
  return [if (!uri.hasPort) uri.replace(port: 32400).toString(), typed];
}
