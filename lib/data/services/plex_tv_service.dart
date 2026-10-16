import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

/// A plex.tv sign-in code the user approves at plex.tv/link.
class PlexPin {
  final int id;
  final String code;

  /// Counted from expiresIn, so a wrong device clock can't expire every code
  /// as soon as it arrives.
  final DateTime expiresAt;

  final SimpleKeyPair _keyPair;
  final String _keyId;

  /// plex.tv time minus device time, for the JWT timestamps.
  final Duration _clockOffset;

  PlexPin._({
    required this.id,
    required this.code,
    required this.expiresAt,
    required this._keyPair,
    required this._keyId,
    required this._clockOffset,
  });

  /// plex.tv/link fills in the code from the pin parameter.
  String get linkUrl => 'https://plex.tv/link/?pin=$code';
}

class PlexServer {
  final String name;

  /// host:port of the best connection, local first and relay last, or null
  /// when plex.tv lists none.
  final String? address;

  const PlexServer({required this.name, this.address});

  factory PlexServer.fromJson(Map<String, dynamic> json) {
    int rank(Map c) => c['relay'] == true ? 2 : (c['local'] == true ? 0 : 1);
    final connections =
        (json['connections'] as List? ?? const []).whereType<Map>().toList()
          ..sort((a, b) => rank(a).compareTo(rank(b)));
    final best = connections.firstOrNull;
    return PlexServer(
      name: json['name'] as String? ?? '',
      address: best == null ? null : '${best['address']}:${best['port']}',
    );
  }
}

class PlexTvService {
  final DeviceInfo _deviceInfo;
  final Dio _dio;
  final _ed25519 = Ed25519();

  PlexTvService({required this._deviceInfo})
    : _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Accept': 'application/json'},
        ),
      ) {
    configureServerDio(_dio);
  }

  // Plex takes any X-Plex- header as a query parameter too, which keeps
  // non-ASCII device names out of the headers.
  Map<String, String> get _identity => {
    'X-Plex-Product': _deviceInfo.appName,
    'X-Plex-Version': _deviceInfo.appVersion,
    'X-Plex-Client-Identifier': _deviceInfo.id,
    'X-Plex-Device-Name': _deviceInfo.name,
  };

  /// Registers a new device key with the PIN, so the token plex.tv hands
  /// back is a JWT.
  Future<PlexPin> createPin() async {
    final keyPair = await _ed25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final keyId = const Uuid().v4();
    final response = await _dio.post<Map<String, dynamic>>(
      'https://clients.plex.tv/api/v2/pins',
      queryParameters: _identity,
      data: {
        'jwk': {
          'kty': 'OKP',
          'crv': 'Ed25519',
          'x': _base64Url(publicKey.bytes),
          'kid': keyId,
          'alg': 'EdDSA',
        },
      },
    );
    final json = response.data!;
    final now = DateTime.now();
    return PlexPin._(
      id: json['id'] as int,
      code: json['code'] as String,
      expiresAt: now.add(Duration(seconds: json['expiresIn'] as int)),
      keyPair: keyPair,
      keyId: keyId,
      clockOffset: DateTime.parse(json['createdAt'] as String).difference(now),
    );
  }

  /// The account's JWT once the user approves [pin], else null.
  Future<String?> checkPin(PlexPin pin) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://clients.plex.tv/api/v2/pins/${pin.id}',
      queryParameters: {..._identity, 'deviceJWT': await _deviceJwt(pin)},
    );
    return response.data!['authToken'] as String?;
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

  Future<String> _deviceJwt(PlexPin pin) async {
    final iat =
        DateTime.now().add(pin._clockOffset).millisecondsSinceEpoch ~/ 1000;
    final unsigned = [
      {'kid': pin._keyId, 'alg': 'EdDSA', 'typ': 'JWT'},
      {'aud': 'plex.tv', 'iss': _deviceInfo.id, 'iat': iat, 'exp': iat + 300},
    ].map((part) => _base64Url(utf8.encode(jsonEncode(part)))).join('.');
    final signature = await _ed25519.sign(
      utf8.encode(unsigned),
      keyPair: pin._keyPair,
    );
    return '$unsigned.${_base64Url(signature.bytes)}';
  }

  static String _base64Url(List<int> bytes) =>
      base64Url.encode(bytes).replaceAll('=', '');
}
