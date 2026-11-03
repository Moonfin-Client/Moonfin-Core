import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_user_mapper.dart';
import '../silo_session.dart';

/// Sign-in against Silo's native auth routes, answered in the shapes
/// Moonfin's auth flow reads.
///
/// A Silo sign-in opens a session for the **account**, whose household
/// profiles are Moonfin's users. So [authenticateByName] answers with the
/// account as `User` and puts the new token pair on the client's
/// [SiloSession].
class SiloAuthApi implements AuthApi {
  SiloAuthApi(
    this._dio,
    this._authDio,
    this._session, {
    this.deviceName,
    this.devicePlatform,
  });

  /// The client's main Dio, with the session interceptor.
  final Dio _dio;

  /// The client's sign-in Dio: same headers and error parsing as the main one,
  /// but without the session interceptor (see `SiloSessionInterceptor`).
  final Dio _authDio;
  final SiloSession _session;

  /// This device's name and platform, shown to the person approving a
  /// sign-in with a code.
  final String? deviceName;
  final String? devicePlatform;

  /// Token pairs of approved code sign-ins, by device code, between the poll
  /// that collected them and [authenticateWithQuickConnect]. Silo hands the
  /// pair out exactly once, on the poll that sees the approval.
  final _approved = <String, Map<String, dynamic>>{};

  /// Public, sign-in and code-flow requests: no bearer token (a token left
  /// over from another login must not ride along), never refreshed for or
  /// replayed.
  static final _public = Options(
    extra: const {siloNoAuthExtra: true, siloNoRefreshExtra: true},
  );

  /// Key in an authentication result holding the [SiloTokens] as JSON
  /// ([SiloTokens.toJson]), for the app to store.
  static const siloTokensKey = 'SiloTokens';

  /// Key in an authentication result that is `true` when the account holds a
  /// temporary password. Until it's changed, Silo only lets the session read
  /// the account, change the password and sign out, and everything else
  /// answers `403 password_change_required`.
  static const siloPasswordChangeRequiredKey = 'SiloPasswordChangeRequired';

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async {
    final response = await _authDio.post<dynamic>(
      '/api/v2/auth/login',
      data: {'username': username, 'password': password},
      options: Options(
        extra: const {
          // No bearer token: the password is the credential, and a token left
          // over from another login must not ride along.
          siloNoAuthExtra: true,
          // Never refreshed for or replayed. Silo answers a wrong password
          // with `401 invalid_token`, the same code as an expired token, and
          // a replay would count as a second attempt against rate limits.
          siloNoRefreshExtra: true,
        },
      ),
    );
    final pair = asJsonMap(response.data);
    if (pair == null) {
      throw FormatException(
        'Expected a JSON object from Silo sign-in, got '
        '${response.data.runtimeType}',
      );
    }
    return _openLogin(pair);
  }

  /// Puts a token pair Silo issued (`TokenPair`: a password sign-in or an
  /// approved code) on the session and answers in the shape Moonfin's
  /// sign-in reads.
  Map<String, dynamic> _openLogin(Map<String, dynamic> pair) {
    final tokens = SiloTokens.fromResponse(pair, now: _session.now);
    if (tokens.accessToken.isEmpty || tokens.refreshToken.isEmpty) {
      throw const FormatException('Silo sign-in answered without a token pair');
    }
    final account = asJsonMap(pair['user']) ?? const <String, dynamic>{};
    final user = siloAccountToUserDto(account);
    if (user['Id'] == null) {
      throw const FormatException('Silo sign-in answered without an account');
    }

    // A new login: this replaces any earlier one and drops its profile.
    _session.setTokens(tokens);
    return {
      'AccessToken': tokens.accessToken,
      'User': user,
      siloTokensKey: tokens.toJson(),
      siloPasswordChangeRequiredKey:
          account['password_change_required'] == true,
    };
  }

  /// Ends the login on Silo and on this client.
  ///
  /// `POST /auth/logout` revokes the session server-side, which also kills
  /// its refresh token. Only dropping the tokens locally would leave that
  /// refresh token valid on the server until it expires. The request goes
  /// through the main Dio, so an access token that has expired is refreshed
  /// first and the logout replayed once: Silo marks logout as naturally
  /// idempotent, so a replay is safe.
  ///
  /// The client is signed out locally whatever the server answers. A `401`
  /// means the session is already gone and counts as success. Any other
  /// failure (no network, `503`) is rethrown after the local sign-out so the
  /// caller can log it.
  @override
  Future<void> logout() async {
    if (_session.tokens == null) {
      _session.clear();
      return;
    }
    try {
      await _dio.post<dynamic>('/api/v2/auth/logout');
    } on DioException catch (e) {
      if (e.response?.statusCode != 401) rethrow;
    } finally {
      _session.clear();
    }
  }

  /// Opens a device sign-in request (`POST /auth/device/start`) after
  /// checking that the server offers it (`GET /auth/device/capability`).
  ///
  /// `Code` is Silo's user code without its separator (eight digits, shown
  /// 4+4), and `Secret` is the device code. Also answers the verification page,
  /// the same with the code filled in (for the QR code), the expiry and the
  /// poll interval ([QuickConnectKeys]).
  @override
  Future<Map<String, dynamic>> initiateQuickConnect() async {
    final capability = asJsonMap(
      (await _authDio.get<dynamic>(
        '/api/v2/auth/device/capability',
        options: _public,
      )).data,
    );
    final state = capability?['state'] as String?;
    if (state != 'available' || capability?['allowed'] == false) {
      throw QuickConnectUnavailableError(state ?? 'unknown');
    }

    final response = await _authDio.post<dynamic>(
      '/api/v2/auth/device/start',
      data: {
        if (_clamped(deviceName, 128) case final name?) 'device_name': name,
        if (_clamped(devicePlatform, 64) case final platform?)
          'device_platform': platform,
      },
      options: _public,
    );
    final start = asJsonMap(response.data);
    final deviceCode = start?['device_code'] as String?;
    final userCode = (start?['user_code'] as String?)?.replaceAll(
      RegExp(r'[\s-]'),
      '',
    );
    if (deviceCode == null ||
        deviceCode.isEmpty ||
        userCode == null ||
        userCode.isEmpty) {
      throw const FormatException('Silo device sign-in answered without codes');
    }
    return {
      'Code': userCode,
      'Secret': deviceCode,
      'Authenticated': false,
      if (start!['verification_uri'] case final String uri when uri.isNotEmpty)
        QuickConnectKeys.verificationUri: uri,
      if (start['verification_uri_complete'] case final String uri
          when uri.isNotEmpty)
        QuickConnectKeys.verificationUriComplete: uri,
      ..._expiresAt(start, fallbackSeconds: start['expires_in']),
      QuickConnectKeys.pollAfterSeconds: _seconds(start['interval']),
    };
  }

  /// Polls the request (`POST /auth/device/poll`). An approval carries the
  /// token pair exactly once: it is kept for [authenticateWithQuickConnect]
  /// and answered as `Authenticated: true`.
  ///
  /// A pending request answers whether someone has opened it and its current
  /// expiry, which an approver's lookup can move later. `denied`, `expired`
  /// (or a device code Silo no longer knows: `404`), and `consumed` or
  /// `canceled` (`used`) answer `Status`: that code is done.
  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) async {
    final Map<String, dynamic>? poll;
    try {
      poll = asJsonMap(
        (await _authDio.post<dynamic>(
          '/api/v2/auth/device/poll',
          data: {'device_code': secret},
          options: _public,
        )).data,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return {
          'Authenticated': false,
          QuickConnectKeys.status: QuickConnectKeys.statusExpired,
        };
      }
      rethrow;
    }
    if (poll == null) {
      throw const FormatException('Silo device poll answered without a body');
    }
    final status = poll['status'] as String?;
    final pollAfter = _seconds(poll['poll_after']);
    if (status == 'approved') {
      final tokens = asJsonMap(poll['tokens']);
      if (tokens == null) {
        throw const FormatException(
          'Silo approved the device sign-in without tokens',
        );
      }
      _approved[secret] = tokens;
      return {'Authenticated': true};
    }
    return {
      'Authenticated': false,
      QuickConnectKeys.pollAfterSeconds: pollAfter,
      if (status == 'pending') ...{
        QuickConnectKeys.opened: poll['opened'] == true,
        ..._expiresAt(poll),
      } else
        QuickConnectKeys.status: switch (status) {
          'denied' => QuickConnectKeys.statusDenied,
          'consumed' || 'canceled' => QuickConnectKeys.statusUsed,
          _ => QuickConnectKeys.statusExpired,
        },
    };
  }

  /// Approves another device's sign-in request with the code it shows
  /// (`POST /auth/device/approve`), as this login's account: the device then
  /// signs in to the account and picks its own profile. [userId] isn't sent,
  /// since Silo approves for the account.
  ///
  /// True when Silo answers `approved`. A code no request is waiting with
  /// answers false: unknown (`404`), already used, declined or withdrawn
  /// (`409`), or expired (`410`). Other refusals reach the caller: `403`
  /// (this login can't approve: an API key or an impersonation session),
  /// `429` (too many attempts).
  ///
  /// Through the main client: a token that is due is refreshed first, and a
  /// `401` before Silo acted is refreshed and sent once more.
  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async {
    final digits = code.replaceAll(RegExp(r'[\s-]'), '');
    try {
      final response = await _dio.post<dynamic>(
        '/api/v2/auth/device/approve',
        data: {'code': digits},
      );
      return asJsonMap(response.data)?['status'] == 'approved';
    } on DioException catch (e) {
      if (const {404, 409, 410}.contains(e.response?.statusCode)) return false;
      rethrow;
    }
  }

  /// Signs in with the token pair the approving poll collected, as
  /// [authenticateByName] does with a password.
  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(
    String secret,
  ) async {
    final pair = _approved.remove(secret);
    if (pair == null) {
      throw StateError('No approved Silo device sign-in for this code');
    }
    return _openLogin(pair);
  }

  static String? _clamped(String? value, int max) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return null;
    return text.length <= max ? text : text.substring(0, max);
  }

  static int _seconds(Object? value) =>
      value is num && value > 0 ? value.ceil() : 5;

  /// [QuickConnectKeys.expiresAt] from Silo's `expires_at`, or from
  /// [fallbackSeconds] from now.
  Map<String, dynamic> _expiresAt(
    Map<String, dynamic> body, {
    Object? fallbackSeconds,
  }) {
    final at = DateTime.tryParse(body['expires_at'] as String? ?? '');
    final expires =
        at ??
        (fallbackSeconds is num
            ? _session.now.add(Duration(seconds: fallbackSeconds.toInt()))
            : null);
    if (expires == null) return const {};
    return {QuickConnectKeys.expiresAt: expires.toUtc().toIso8601String()};
  }
}
