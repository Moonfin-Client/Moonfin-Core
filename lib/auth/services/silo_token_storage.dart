import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../../data/offline/connectivity_aware_media_server_client.dart';
import '../models/user.dart';
import '../store/authentication_store.dart';

/// The Silo client behind [client], or null for a Jellyfin or Emby client.
///
/// The client factory wraps every client in the offline-aware
/// [ConnectivityAwareMediaServerClient], so the Silo client is looked for
/// inside it too.
SiloMediaServerClient? siloClientOf(MediaServerClient client) {
  final online = client is ConnectivityAwareMediaServerClient
      ? client.onlineClient
      : client;
  return online is SiloMediaServerClient ? online : null;
}

/// Keeps a Silo account's stored token pair in step with its session.
///
/// Silo rotates the refresh token on every refresh and the old one stops
/// working, so each new pair must replace the stored one, or the next app
/// start would present a dead refresh token. [bind] saves every pair the
/// session refreshes into [AuthenticationStore] under (server, account).
class SiloTokenStorage {
  SiloTokenStorage(this._store);

  final AuthenticationStore _store;

  /// The stored pair for [accountId] on [serverId], or null.
  SiloTokens? read(String serverId, String accountId) =>
      SiloTokens.fromJson(_store.getSiloTokens(serverId, accountId));

  /// Stores [tokens] for [accountId] on [serverId]. At sign-in
  /// ([newLogin]) the profiles' PIN proofs of the earlier login go, and a
  /// refresh keeps them.
  Future<void> save(
    String serverId,
    String accountId,
    SiloTokens tokens, {
    bool newLogin = false,
  }) => _store.putSiloTokens(
    serverId,
    accountId,
    tokens.toJson(),
    newLogin: newLogin,
  );

  /// The stored PIN proof of Silo profile [user], unless it has expired.
  /// Null for a profile without one and for Jellyfin and Emby users. [now]
  /// is for tests.
  String? profileToken(PrivateUser user, {DateTime? now}) {
    final accountId = user.siloAccountId;
    if (accountId == null) return null;
    final proof = _store.getSiloProfileToken(user.serverId, accountId, user.id);
    final token = proof?['token'];
    if (token is! String || token.isEmpty) return null;
    final expires = DateTime.tryParse(proof?['expiresAt'] as String? ?? '');
    if (expires != null && !expires.isAfter(now ?? DateTime.now())) {
      return null;
    }
    return token;
  }

  /// Whether switching to Silo profile [user] needs its PIN first: it's
  /// locked and holds no live proof.
  bool needsPin(PrivateUser user, {DateTime? now}) =>
      user.siloHasPin && profileToken(user, now: now) == null;

  /// Keeps the proof Silo gave for [user]'s PIN, under its account.
  Future<void> saveProfileToken(
    PrivateUser user,
    String token, {
    DateTime? expiresAt,
  }) async {
    final accountId = user.siloAccountId;
    if (accountId == null) return;
    await _store.putSiloProfileToken(user.serverId, accountId, user.id, {
      'token': token,
      if (expiresAt != null) 'expiresAt': expiresAt.toUtc().toIso8601String(),
    });
  }

  /// Saves every pair [client]'s session refreshes from now on, for
  /// [accountId] on [serverId]. Rebinding (another account on the same
  /// client) replaces the earlier binding.
  ///
  /// A failed save is swallowed: the session in memory is already renewed,
  /// and the worst case is a sign-in on the next start.
  ///
  /// When Silo refuses the refresh token (the login was revoked or has
  /// expired), the dead pair is forgotten so nothing restores it again, and
  /// [onEnded] runs: the session repository uses it to send the person back
  /// to sign-in.
  void bind({
    required SiloMediaServerClient client,
    required String serverId,
    required String accountId,
    void Function()? onEnded,
  }) {
    client.session.onTokensChanged = (tokens) {
      save(serverId, accountId, tokens).ignore();
    };
    client.session.onSessionEnded = (_) {
      _store.removeSiloAccount(serverId, accountId).ignore();
      onEnded?.call();
    };
    _bindings[client.session] = '$serverId\u0000$accountId';
  }

  /// Which (server, account) each session is bound to, so a repeated
  /// [restore] can keep an existing binding and its [bind] `onEnded`.
  static final _bindings = Expando<String>('silo binding');

  /// Stops saving refreshes from [client] (sign-out).
  void unbind(SiloMediaServerClient client) {
    client.session.onTokensChanged = null;
    client.session.onSessionEnded = null;
    _bindings[client.session] = null;
  }

  /// Puts a stored Silo [user]'s login on [client]: the account's token pair
  /// (so the session can refresh), the user's profile as `X-Profile-Id`
  /// with its stored PIN proof if it has one, and the binding that
  /// saves later refreshes. Returns false for a Jellyfin or
  /// Emby user or client, which the caller sets up as before.
  ///
  /// Every place that hands a stored user's login to a client goes through
  /// here instead of `client.accessToken = user.accessToken`. That setter
  /// with the stored access token would replace a live pair with a bare,
  /// possibly expired token and drop the refresh token.
  ///
  /// A client already holding this account's current pair is left alone, so
  /// calling this again (multi-server rows reuse the active client) doesn't
  /// count as a new login. Bound sessions save each refresh before anything
  /// else runs, so the stored pair is the current one. With no stored pair,
  /// it falls back to the stored access token.
  ///
  /// An expired access token is fine: the session interceptor refreshes it
  /// before the first request.
  ///
  /// [onEnded] is passed to [bind]. Without it, a client already bound to
  /// this account keeps its binding, so the multi-server rows restoring the
  /// active client don't drop the session repository's sign-out handling.
  bool restore({
    required MediaServerClient client,
    required PrivateUser user,
    void Function()? onEnded,
  }) {
    final silo = siloClientOf(client);
    final accountId = user.siloAccountId;
    if (silo == null || accountId == null) return false;

    final stored = read(user.serverId, accountId);
    final current = silo.session.tokens;
    if (stored != null) {
      if (current?.refreshToken != stored.refreshToken) {
        silo.session.setTokens(stored);
      }
    } else if (current == null && user.accessToken.isNotEmpty) {
      silo.accessToken = user.accessToken;
    }
    // The stored user is one of the account's profiles, and a locked one
    // sends its PIN proof.
    silo.profileId = user.id;
    silo.profileToken = profileToken(user);
    silo.userId = user.id;
    final alreadyBound =
        _bindings[silo.session] == '${user.serverId}\u0000$accountId';
    if (onEnded != null || !alreadyBound) {
      bind(
        client: silo,
        serverId: user.serverId,
        accountId: accountId,
        onEnded: onEnded,
      );
    }
    return true;
  }

  /// Puts [user]'s login on [client]: [restore] for a Silo profile, and for
  /// a Jellyfin or Emby user, or a Silo one with nothing stored, the bare
  /// [accessToken].
  void putLogin({
    required MediaServerClient client,
    required PrivateUser user,
    required String accessToken,
    void Function()? onEnded,
  }) {
    if (!restore(client: client, user: user, onEnded: onEnded)) {
      client.accessToken = accessToken;
    }
  }
}
