import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// One Silo login: the access/refresh token pair of an account.
///
/// Several household profiles share one login, so the tokens belong to the
/// account, never to a profile (plan §4.2.1).
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

  /// Tokens from a `TokenPair`/`RefreshedTokens` response received at [now].
  factory SiloTokens.fromResponse(
    Map<String, dynamic> json, {
    DateTime? now,
  }) {
    final issuedAt = (now ?? DateTime.now()).toUtc();
    final seconds = (json['expires_in'] as num?)?.toInt() ?? 0;
    final lifetime = Duration(seconds: seconds > 0 ? seconds : 0);
    return SiloTokens(
      accessToken: json['access_token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
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

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'expiresAt': expiresAt.toIso8601String(),
    'lifetimeSeconds': lifetime.inSeconds,
  };

  static SiloTokens? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final access = json['accessToken'] as String?;
    final refresh = json['refreshToken'] as String?;
    final expires = DateTime.tryParse(json['expiresAt'] as String? ?? '');
    if (access == null || access.isEmpty || refresh == null || expires == null) {
      return null;
    }
    return SiloTokens(
      accessToken: access,
      refreshToken: refresh,
      expiresAt: expires.toUtc(),
      lifetime: Duration(seconds: (json['lifetimeSeconds'] as num?)?.toInt() ?? 0),
    );
  }
}

/// Why a Silo session ended.
enum SiloSessionEnd {
  /// The refresh token was refused: sign in again.
  expired,

  /// The client signed out on purpose.
  signedOut,
}

/// Holds an account's tokens and refreshes them, one refresh at a time.
///
/// The app supplies [onTokensChanged] to persist a rotated pair and
/// [onSessionEnded] to send the user back to sign-in. A refresh that fails for
/// any reason other than the server refusing the refresh token (network,
/// `503`) keeps the tokens: per Silo's contract the client signs out only on a
/// refused refresh.
class SiloSession {
  SiloSession({DateTime Function()? clock}) : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;

  SiloTokens? _tokens;
  Future<bool>? _refreshing;
  int _identity = 0;

  /// Changes whenever the login or profile that requests act for changes
  /// (sign-in, a stored session restored, sign-out, a profile switch), but not
  /// when a refresh renews the same login. A request is only refreshed and
  /// replayed while this still matches the value it was sent under, so a
  /// late reply can never be retried as someone else.
  int get identity => _identity;

  /// Marks that requests now act for a different login or profile.
  void identityChanged() => _identity++;

  /// Called with the new pair after every successful refresh.
  void Function(SiloTokens tokens)? onTokensChanged;

  /// Called once when the server refuses the refresh token.
  void Function(SiloSessionEnd reason)? onSessionEnded;

  SiloTokens? get tokens => _tokens;

  String? get accessToken => _tokens?.accessToken;

  /// Replaces the tokens without notifying [onTokensChanged]: used at sign-in
  /// and when restoring a stored session.
  void setTokens(SiloTokens? tokens) {
    _tokens = tokens;
    _identity++;
  }

  /// Sets only the access token, as the generic client API does. Keeps the
  /// refresh token when the access token matches the current pair; anything
  /// else is a bare token (for example a personal API key) with no refresh.
  void setAccessToken(String? token) {
    if (token == null || token.isEmpty) {
      if (_tokens != null) _identity++;
      _tokens = null;
      return;
    }
    if (_tokens?.accessToken == token) return;
    _identity++;
    _tokens = SiloTokens(
      accessToken: token,
      refreshToken: '',
      expiresAt: DateTime.utc(9999),
      lifetime: Duration.zero,
    );
  }

  bool get canRefresh => (_tokens?.refreshToken.isNotEmpty ?? false);

  bool get needsRefresh => _tokens?.needsRefresh(_clock()) ?? false;

  /// Refreshes the pair through [dio]. Concurrent callers share one request.
  /// Returns whether a new access token is in place.
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
        options: Options(extra: const {siloNoAuthExtra: true, siloNoRefreshExtra: true}),
      );
      final data = asJsonMap(response.data);
      if (data == null) return false;
      final next = SiloTokens.fromResponse(data, now: _clock());
      if (next.accessToken.isEmpty) return false;
      // A refresh that lost a race with a sign-out or a new login must not
      // resurrect the old one, nor report success on the new one's behalf.
      if (_identity != identity || !identical(_tokens, current)) return false;
      _tokens = next;
      onTokensChanged?.call(next);
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        if (_identity == identity && identical(_tokens, current)) {
          _tokens = null;
          _identity++;
          onSessionEnded?.call(SiloSessionEnd.expired);
        }
        return false;
      }
      // 503 or no network: the session's validity is unknown, so keep it.
      return false;
    }
  }

  /// Forgets the tokens after a deliberate sign-out.
  void clear() {
    _tokens = null;
    _identity++;
  }
}

/// Request `extra` flag: do not send the bearer token (sign-in, refresh).
const siloNoAuthExtra = 'silo.noAuth';

/// Request `extra` flag: never refresh-and-retry this request. Set on
/// operations Silo declares non-retryable (login, refresh, device sign-in
/// start and poll, PIN checks) and on retries themselves.
const siloNoRefreshExtra = 'silo.noRefresh';

/// Whether [error] is a `401` that a refresh can repair.
///
/// Silo answers an expired access token with `invalid_token` ("invalid or
/// expired"), a role change with `token_refresh_required`, a missing session
/// with `session_expired`, and anything else with `authentication_required`.
/// They can't be told apart before trying, and a refresh is cheap and decisive:
/// a dead session refuses it, which ends the session cleanly.
bool isSiloRefreshableAuthError(DioException error) =>
    error.response?.statusCode == 401;
