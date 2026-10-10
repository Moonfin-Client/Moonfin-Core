import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_user_mapper.dart';
import '../silo_session.dart';

/// Sign-in against Silo's native auth routes, answered in the shapes
/// Moonfin's auth flow reads.
///
/// A Silo sign-in opens an account session; the household profile is picked
/// afterwards. So [authenticateByName] answers with the account as `User` and
/// the token pair under [siloTokensKey]; the app then lists profiles and
/// stores one Moonfin user per profile (plan §4.2).
///
/// QuickConnect maps onto Silo device sign-in: the TV starts a request and
/// shows a code, another signed-in device approves it, and the TV collects the
/// tokens together with the profile the approver picked.
class SiloAuthApi implements AuthApi {
  SiloAuthApi(
    this._dio,
    this._session, {
    required DeviceInfo deviceInfo,
    required Future<String?> Function() serverId,
  }) : _deviceInfo = deviceInfo,
       _serverId = serverId;

  final Dio _dio;
  final SiloSession _session;
  final DeviceInfo _deviceInfo;
  final Future<String?> Function() _serverId;

  /// Key in an authentication result holding the [SiloTokens] as JSON.
  static const siloTokensKey = 'SiloTokens';

  /// Key in a QuickConnect (device sign-in) result naming the profile the
  /// approver chose, and its PIN proof when it has one.
  static const siloProfileIdKey = 'SiloProfileId';
  static const siloProfileTokenKey = 'SiloProfileToken';

  static const _noReplay = {siloNoAuthExtra: true, siloNoRefreshExtra: true};

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async {
    // Never replayed automatically: a login creates a fresh session.
    final response = await _dio.post<dynamic>(
      '/api/v2/auth/login',
      data: {'username': username, 'password': password},
      options: Options(extra: _noReplay),
    );
    return _authenticationResult(_asMap(response.data));
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post<dynamic>(
        '/api/v2/auth/logout',
        options: Options(extra: const {siloNoRefreshExtra: true}),
      );
    } finally {
      _session.clear();
    }
  }

  @override
  Future<Map<String, dynamic>> initiateQuickConnect() async {
    final response = await _dio.post<dynamic>(
      '/api/v2/auth/device/start',
      data: {
        'device_name': _deviceInfo.name,
        'device_platform': _deviceInfo.appName,
        'client_purpose': 'device_login',
      },
      options: Options(extra: _noReplay),
    );
    final start = _asMap(response.data);
    return {
      'Secret': start['device_code'],
      'Code': start['user_code'],
      'Authenticated': false,
      'DeviceName': start['device_name'],
      // Not read by the Jellyfin flow; a Silo-aware screen can show a QR code
      // or "go to this address" text and pace polling with these.
      'SiloVerificationUri': start['verification_uri'],
      'SiloVerificationUriComplete': start['verification_uri_complete'],
      'SiloPollIntervalSeconds': start['interval'],
      'SiloExpiresAt': start['expires_at'],
    };
  }

  /// One poll of a pending device sign-in.
  ///
  /// Silo hands the tokens over on the first poll that sees the approval and
  /// marks the request consumed, so an approved answer is remembered here and
  /// returned by [authenticateWithQuickConnect] instead of polling again.
  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) async {
    final poll = await _poll(secret);
    final status = poll['status'] as String?;
    if (status == 'approved' && poll['tokens'] is Map) {
      _approved[secret] = poll;
    }
    return {
      'Secret': secret,
      'Authenticated': _approved.containsKey(secret),
      'SiloStatus': status,
      'SiloPollAfterSeconds': poll['poll_after'],
    };
  }

  final _approved = <String, Map<String, dynamic>>{};

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(
    String secret,
  ) async {
    final poll = _approved.remove(secret) ?? await _poll(secret);
    final tokens = poll['tokens'];
    if (poll['status'] != 'approved' || tokens is! Map) {
      throw StateError('Silo device sign-in is ${poll['status'] ?? 'not approved'}');
    }
    final result = await _authenticationResult(Map<String, dynamic>.from(tokens));
    final profileId = poll['profile_id'] as String?;
    final profileToken = poll['profile_token'] as String?;
    return {
      ...result,
      if (profileId != null && profileId.isNotEmpty) siloProfileIdKey: profileId,
      if (profileToken != null && profileToken.isNotEmpty)
        siloProfileTokenKey: profileToken,
    };
  }

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/auth/device/approve',
      data: {'code': code},
      options: Options(extra: const {siloNoRefreshExtra: true}),
    );
    return _asMap(response.data)['status'] == 'approved';
  }

  Future<Map<String, dynamic>> _poll(String deviceCode) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/auth/device/poll',
      data: {'device_code': deviceCode},
      options: Options(extra: _noReplay),
    );
    return _asMap(response.data);
  }

  /// The Jellyfin `AuthenticationResult` shape for a Silo `TokenPair`, and the
  /// tokens put in place on this client's session.
  Future<Map<String, dynamic>> _authenticationResult(
    Map<String, dynamic> tokenPair,
  ) async {
    final tokens = SiloTokens.fromResponse(tokenPair);
    if (tokens.accessToken.isEmpty) {
      throw const FormatException('Silo sign-in answered without an access token');
    }
    _session.setTokens(tokens);
    final account = tokenPair['user'] is Map
        ? Map<String, dynamic>.from(tokenPair['user'] as Map)
        : <String, dynamic>{};
    final serverId = await _serverId();
    return {
      'AccessToken': tokens.accessToken,
      'ServerId': ?serverId,
      'User': siloAccountToUserDto(account, serverId: serverId),
      siloTokensKey: tokens.toJson(),
      'SiloAccount': account,
    };
  }

  static Map<String, dynamic> _asMap(Object? data) =>
      asJsonMap(data) ??
      (throw FormatException(
        'Expected a JSON object from Silo, got ${data.runtimeType}',
      ));
}

/// A Jellyfin `UserDto` for a Silo account before a profile is chosen.
Map<String, dynamic> siloAccountToUserDto(
  Map<String, dynamic> account, {
  String? serverId,
}) => {
  'Id': account['id']?.toString(),
  'Name': account['username'] as String? ?? '',
  'ServerId': ?serverId,
  'HasPassword': true,
  siloAccountIdKey: account['id']?.toString(),
  'Policy': {
    'IsAdministrator': account['role'] == 'admin',
    'EnableContentDownloading': account['download_allowed'] == true,
    'EnableCollectionManagement': true,
  },
  'SiloAccount': account,
};
