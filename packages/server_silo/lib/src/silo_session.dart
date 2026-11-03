import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// One Silo login: the access/refresh token pair of an account.
///
/// Several household profiles share one login, so the tokens belong to the
/// account, never to a profile.
class SiloTokens {
  final String accessToken;
  final String refreshToken;

  /// When the access token stops being accepted, in UTC.
  final DateTime expiresAt;

  /// How long the access token was issued for. Proactive refresh happens once
  /// most of it has passed.
  final Duration lifetime;

  const SiloTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.lifetime,
  });

  /// Tokens from a `TokenPair` (sign-in) or `RefreshedTokens` (refresh)
  /// response received at [now]: `access_token`, `refresh_token` and
  /// `expires_in` seconds.
  factory SiloTokens.fromResponse(Map<String, dynamic> json, {DateTime? now}) {
    final issuedAt = (now ?? DateTime.now()).toUtc();
    final rawSeconds = json['expires_in'];
    final seconds = rawSeconds is num ? rawSeconds.toInt() : 0;
    final lifetime = Duration(seconds: seconds > 0 ? seconds : 0);
    final access = json['access_token'];
    final refresh = json['refresh_token'];
    return SiloTokens(
      accessToken: access is String ? access : '',
      refreshToken: refresh is String ? refresh : '',
      expiresAt: issuedAt.add(lifetime),
      lifetime: lifetime,
    );
  }

  /// Whether the access token should be refreshed before the next request:
  /// four fifths of its life has passed, or less than a minute is left.
  bool needsRefresh(DateTime now) {
    if (refreshToken.isEmpty) return false;
    final remaining = expiresAt.difference(now.toUtc());
    if (remaining <= const Duration(minutes: 1)) return true;
    return remaining <= lifetime * 0.2;
  }

  /// The form the app stores.
  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'expiresAt': expiresAt.toIso8601String(),
    'lifetimeSeconds': lifetime.inSeconds,
  };

  /// Reads [toJson]'s output back, or null when anything essential is missing.
  static SiloTokens? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final access = json['accessToken'];
    final refresh = json['refreshToken'];
    final expires = DateTime.tryParse(
      json['expiresAt'] is String ? json['expiresAt'] as String : '',
    );
    if (access is! String || access.isEmpty || refresh is! String) return null;
    if (expires == null) return null;
    final seconds = json['lifetimeSeconds'];
    return SiloTokens(
      accessToken: access,
      refreshToken: refresh,
      expiresAt: expires.toUtc(),
      lifetime: Duration(seconds: seconds is num ? seconds.toInt() : 0),
    );
  }
}

/// Why a Silo session ended.
enum SiloSessionEnd {
  /// The server refused the refresh token: sign in again.
  expired,
}

/// Holds an account's tokens and refreshes them, one refresh at a time.
///
/// The app supplies [onTokensChanged] to persist a rotated pair and
/// [onSessionEnded] to send the user back to sign-in. Silo rotates the
/// refresh token on every refresh, so the stored pair must be replaced each
/// time.
///
/// Only a `401` from `POST /api/v2/auth/refresh` ends the session. A refresh
/// that fails any other way (no network, `503`, a malformed answer) keeps the
/// tokens, because it says nothing about whether the login is still good.
class SiloSession {
  SiloSession({DateTime Function()? clock}) : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;

  SiloTokens? _tokens;
  Future<bool>? _refreshing;
  int _identity = 0;

  /// Changes whenever the login or profile that requests act for changes
  /// (sign-in, a stored session restored, sign-out, a profile switch), but not
  /// when a refresh renews the same login. The request interceptor only
  /// refreshes and replays a request while this still matches the value it
  /// was sent under, so a late reply is never retried as someone else.
  int get identity => _identity;

  /// Marks that requests now act for a different login or profile.
  void identityChanged() => _identity++;

  final _accountListeners = <void Function()>[];

  /// Calls [listener] whenever the login itself is replaced or ends: new
  /// tokens set, a bare token set or removed, sign-out, or a refused refresh.
  /// A refresh that renews the same login doesn't call it. The client uses
  /// this to drop the profile selection and PIN proof, which belong to the
  /// login they were made under.
  void addAccountChangedListener(void Function() listener) =>
      _accountListeners.add(listener);

  void _accountChanged() {
    _identity++;
    for (final listener in List.of(_accountListeners)) {
      listener();
    }
  }

  /// Called with the new pair after every successful refresh.
  void Function(SiloTokens tokens)? onTokensChanged;

  /// Called once when the server refuses the refresh token.
  void Function(SiloSessionEnd reason)? onSessionEnded;

  SiloTokens? get tokens => _tokens;

  String? get accessToken => _tokens?.accessToken;

  /// Replaces the tokens without calling [onTokensChanged]: used at sign-in
  /// and when restoring a stored session.
  void setTokens(SiloTokens? tokens) {
    _tokens = tokens;
    _accountChanged();
  }

  /// Sets only the access token, as the generic `MediaServerClient` API does.
  /// Setting the access token the session already holds changes nothing, so
  /// the refresh token survives. Any other token is kept without a refresh
  /// token (for example a personal API key), and null or empty signs out.
  void setAccessToken(String? token) {
    if (token == null || token.isEmpty) {
      final had = _tokens != null;
      _tokens = null;
      if (had) _accountChanged();
      return;
    }
    if (_tokens?.accessToken == token) return;
    _tokens = SiloTokens(
      accessToken: token,
      refreshToken: '',
      expiresAt: DateTime.utc(9999),
      lifetime: Duration.zero,
    );
    _accountChanged();
  }

  /// Whether a refresh token is held.
  bool get canRefresh => _tokens?.refreshToken.isNotEmpty ?? false;

  /// The current time on this session's clock (tests move it).
  DateTime get now => _clock();

  /// Whether the access token is close enough to expiry to refresh first.
  bool get needsRefresh => _tokens?.needsRefresh(_clock()) ?? false;

  /// Refreshes the pair through [dio], which must not itself refresh (the
  /// client passes a Dio without the session interceptor). Concurrent callers
  /// share one request. Returns whether a new access token is in place.
  Future<bool> refresh(Dio dio) {
    return _refreshing ??= _refresh(dio).whenComplete(() => _refreshing = null);
  }

  Future<bool> _refresh(Dio dio) async {
    final current = _tokens;
    final identity = _identity;
    if (current == null || current.refreshToken.isEmpty) return false;
    try {
      final response = await dio.post<dynamic>(
        '/api/v2/auth/refresh',
        data: {'refresh_token': current.refreshToken},
        options: Options(
          extra: const {siloNoAuthExtra: true, siloNoRefreshExtra: true},
        ),
      );
      final data = asJsonMap(response.data);
      if (data == null) return false;
      final next = SiloTokens.fromResponse(data, now: _clock());
      if (next.accessToken.isEmpty || next.refreshToken.isEmpty) return false;
      // A refresh that lost a race with a sign-out or a new login must not
      // bring the old login back, nor report success on the new one's behalf.
      if (_identity != identity || !identical(_tokens, current)) return false;
      _tokens = next;
      try {
        onTokensChanged?.call(next);
      } catch (_) {
        // Saving the new pair failed. The session in memory is renewed and
        // waiting requests can go ahead. The stored pair is the old one, so
        // the next cold start meets a refused refresh and signs in again.
      }
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        if (_identity == identity && identical(_tokens, current)) {
          _tokens = null;
          _accountChanged();
          try {
            onSessionEnded?.call(SiloSessionEnd.expired);
          } catch (_) {
            // The session is already over, and a failing listener must not
            // turn that into an error for every request waiting on it.
          }
        }
        return false;
      }
      // No network, a 503 or any other failure: whether the login is still
      // good is unknown, so keep it.
      return false;
    }
  }

  /// Forgets the tokens after a deliberate sign-out.
  void clear() {
    _tokens = null;
    _accountChanged();
  }
}

/// Request `extra` flag: don't send the bearer token (sign-in, refresh).
const siloNoAuthExtra = 'silo.noAuth';

/// Request `extra` flag: don't send the household profile (`X-Profile-Id`,
/// `X-Profile-Token`). For the account-wide profile routes (listing the
/// profiles, checking a PIN): Silo refuses a request naming a PIN-locked
/// profile without its proof, which is exactly the case when a profile is
/// still to be unlocked.
const siloNoProfileExtra = 'silo.noProfile';

/// Request `extra` flag: never refresh-and-retry this request. Set on the
/// operations Silo declares non-retryable (login, refresh, device sign-in
/// start and poll, PIN checks) and on retries themselves.
const siloNoRefreshExtra = 'silo.noRefresh';
