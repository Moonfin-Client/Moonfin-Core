import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../../util/network_errors.dart';
import '../models/login_state.dart';
import '../models/user.dart';
import '../services/silo_household.dart';
import '../services/silo_token_storage.dart';
import '../store/authentication_store.dart';
import '../store/authentication_preferences.dart';
import '../../util/silo_failure_message.dart';
import 'session_repository.dart';
import 'user_repository.dart';

class AuthRepository {
  final AuthenticationStore _authStore;
  final AuthenticationPreferences _authPrefs;
  final SessionRepository _sessionRepository;
  final UserRepository _userRepository;
  final _logger = Logger();

  final _stateController = StreamController<LoginState>.broadcast();

  late final SiloTokenStorage _siloTokens = SiloTokenStorage(_authStore);

  /// A Silo login waiting for its temporary password to be replaced.
  _PendingSiloPasswordChange? _pendingPasswordChange;

  AuthRepository(
    this._authStore,
    this._authPrefs,
    this._sessionRepository,
    this._userRepository,
  );

  Stream<LoginState> get stateStream => _stateController.stream;

  Future<LoginState> authenticate({
    required MediaServerClient client,
    required String serverId,
    required String username,
    required String password,
  }) async {
    // A new attempt replaces a password change left unfinished.
    await cancelRequiredSiloPasswordChange();
    _stateController.add(const Authenticating());
    try {
      final result = await client.authApi.authenticateByName(
        username,
        password,
      );
      final silo = siloClientOf(client);
      if (silo != null) {
        return await _handleSiloSignIn(
          result: result,
          client: client,
          silo: silo,
          serverId: serverId,
          password: password,
        );
      }
      return _handleAuthResult(
        result: result,
        client: client,
        serverId: serverId,
        fallbackName: username,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      _logger.e('Authentication failed', error: e);
      final state = ApiClientError(error: e.toString(), errorType: 'exception');
      _stateController.add(state);
      return state;
    }
  }

  Future<LoginState> authenticateWithQuickConnect({
    required MediaServerClient client,
    required String serverId,
    required String secret,
  }) async {
    // A new attempt replaces a password change left unfinished.
    await cancelRequiredSiloPasswordChange();
    _stateController.add(const Authenticating());
    try {
      final result = await client.authApi.authenticateWithQuickConnect(secret);
      final silo = siloClientOf(client);
      if (silo != null) {
        return await _handleSiloCodeSignIn(
          result: result,
          client: client,
          silo: silo,
          serverId: serverId,
        );
      }
      return _handleAuthResult(
        result: result,
        client: client,
        serverId: serverId,
        fallbackName: '',
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      _logger.e('QuickConnect auth failed', error: e);
      final state = ApiClientError(error: e.toString(), errorType: 'exception');
      _stateController.add(state);
      return state;
    }
  }

  Future<LoginState> _handleAuthResult({
    required Map<String, dynamic> result,
    required MediaServerClient client,
    required String serverId,
    required String fallbackName,
  }) async {
    final accessToken = result['AccessToken'] as String?;
    final userJson = result['User'] as Map<String, dynamic>?;
    final userId = userJson?['Id']?.toString() ?? result['UserId']?.toString();
    final userName = userJson?['Name'] as String? ?? fallbackName;
    final imageTag =
        (userJson?['PrimaryImageTag'] as String?) ??
        ((userJson?['ImageTags'] as Map<String, dynamic>?)?['Primary']
            as String?);
    final policyJson = userJson?['Policy'] as Map<String, dynamic>?;
    final policy = policyJson == null ? null : UserPolicy.fromJson(policyJson);
    final isAdmin = policy?.isAdministrator ?? false;
    final canDownload = policy?.enableContentDownloading ?? false;
    final canManageSubtitles = policy?.canFetchRemoteSubtitles ?? false;
    final canManageCollections = policy?.enableCollectionManagement ?? false;
    final canManageLiveTv = policy?.enableLiveTvManagement ?? false;

    if (accessToken == null || userId == null) {
      const state = ApiClientError(error: 'Invalid auth response');
      _stateController.add(state);
      return state;
    }

    client.accessToken = accessToken;
    client.userId = userId;

    final user = PrivateUser(
      id: userId,
      name: userName,
      serverId: serverId,
      accessToken: accessToken,
      lastUsed: DateTime.now(),
      imageTag: imageTag,
      isAdministrator: isAdmin,
      canDownload: canDownload,
      canManageSubtitles: canManageSubtitles,
      canManageCollections: canManageCollections,
      canManageLiveTv: canManageLiveTv,
    );

    await _authStore.putUser(user);
    await _authPrefs.setLastServerId(serverId);
    await _authPrefs.setLastUserId(userId);
    _userRepository.setCurrentUser(user);

    final state = Authenticated(userId: userId, serverId: serverId);
    _stateController.add(state);
    return state;
  }

  /// A Silo sign-in opens the **account**, and Moonfin's users are its
  /// household profiles. After the password is accepted,
  /// [_finishSiloSignIn] stores them and the account's token pair.
  ///
  /// A temporary password stops here instead, see
  /// [_startRequiredPasswordChange].
  Future<LoginState> _handleSiloSignIn({
    required Map<String, dynamic> result,
    required MediaServerClient client,
    required SiloMediaServerClient silo,
    required String serverId,
    required String password,
  }) async {
    final tokens = SiloTokens.fromJson(
      result[SiloAuthApi.siloTokensKey] as Map<String, dynamic>?,
    );
    final accountId =
        (result['User'] as Map<String, dynamic>?)?[siloAccountIdKey] as String?;
    if (tokens == null || accountId == null) {
      return _emit(const ApiClientError(error: 'Invalid auth response'));
    }

    if (result[SiloAuthApi.siloPasswordChangeRequiredKey] == true) {
      return _startRequiredPasswordChange(
        _PendingSiloPasswordChange(
          client: client,
          silo: silo,
          serverId: serverId,
          accountId: accountId,
          currentPassword: password,
        ),
      );
    }
    return _finishSiloSignIn(
      client: client,
      silo: silo,
      serverId: serverId,
      accountId: accountId,
    );
  }

  /// A Silo sign-in with a code opens the account like a password sign-in,
  /// and goes on the same way ([_finishSiloSignIn]).
  ///
  /// An account holding a temporary password can't continue here: replacing
  /// it needs the password in use, which a code sign-in never had. The
  /// login is ended, and the screen says to sign in with the password.
  Future<LoginState> _handleSiloCodeSignIn({
    required Map<String, dynamic> result,
    required MediaServerClient client,
    required SiloMediaServerClient silo,
    required String serverId,
  }) async {
    final accountId =
        (result['User'] as Map<String, dynamic>?)?[siloAccountIdKey] as String?;
    if (accountId == null || silo.session.tokens == null) {
      await _endSiloLogin(client);
      return _emit(const ApiClientError(error: 'Invalid auth response'));
    }
    if (result[SiloAuthApi.siloPasswordChangeRequiredKey] == true) {
      await _endSiloLogin(client);
      return _emit(const SiloCodeSignInPasswordChangeRequired());
    }
    return _finishSiloSignIn(
      client: client,
      silo: silo,
      serverId: serverId,
      accountId: accountId,
    );
  }

  /// The account holds a temporary password. Until it is replaced, Silo lets
  /// this login read the account, change the password and sign out, and
  /// answers everything else (listing the profiles included) with
  /// `403 password_change_required`.
  ///
  /// So the login is kept open, unsaved, and the screen asks for a new
  /// password ([SiloPasswordChangeRequired]). If Silo doesn't allow changing
  /// it here, the login is ended and the screen points to Silo's web app.
  Future<LoginState> _startRequiredPasswordChange(
    _PendingSiloPasswordChange pending,
  ) async {
    final SiloPasswordCapability capability;
    try {
      capability = await pending.silo.accountApi.passwordCapability();
    } catch (e) {
      _logger.e('Silo password capability could not be read', error: e);
      await _endSiloLogin(pending.client);
      return _failed(e);
    }

    if (!capability.canChange) {
      await _endSiloLogin(pending.client);
      return _emit(const SiloPasswordChangeUnavailable());
    }

    _pendingPasswordChange = pending;
    return _emit(
      SiloPasswordChangeRequired(
        minimumLength: capability.minimumLength,
        maximumBytes: capability.maximumBytes,
      ),
    );
  }

  /// Replaces the temporary password of the login [authenticate] left open
  /// with [SiloPasswordChangeRequired], then finishes signing in.
  ///
  /// Silo needs the password in use with every change. That's the one the
  /// person just signed in with, so they only type the new one.
  ///
  /// - [SiloPasswordChangeRejected]: the new password was refused, or the
  ///   request failed (no network, `503`). The login stays open: try again.
  /// - [SiloPasswordChangedSignInAgain]: the password changed but the login
  ///   couldn't be renewed, so it's ended.
  /// - otherwise what a normal sign-in returns ([Authenticated], or the
  ///   error that ended the login).
  ///
  /// After the change Silo signs out every **other** session of the account
  /// (the temporary password may have been known to someone else). This one
  /// is renewed: the refreshed tokens no longer carry the restriction.
  Future<LoginState> changeRequiredSiloPassword(String newPassword) async {
    final pending = _pendingPasswordChange;
    if (pending == null) {
      return _emit(const RequireSignIn());
    }

    _stateController.add(const Authenticating());
    try {
      await pending.silo.accountApi.changePassword(
        currentPassword: pending.currentPassword,
        newPassword: newPassword,
      );
    } on SiloPasswordRejectedError catch (e) {
      if (e.field == 'new_password') {
        return _emit(SiloPasswordChangeRejected(detail: e.detail));
      }
      // The sign-in password no longer matches: it was changed elsewhere in
      // the meantime. Start over.
      _logger.w('Silo refused the current password during the change: $e');
      return _abandonPasswordChange(pending);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // The login itself is gone (revoked, or the refresh was refused).
        _logger.w('Silo login ended during the password change', error: e);
        return _abandonPasswordChange(pending);
      }
      _logger.w('Silo password change failed', error: e);
      return _emit(const SiloPasswordChangeRejected());
    }

    _pendingPasswordChange = null;
    // The access token still carries the restriction. A refresh reissues it
    // from the account, which no longer holds a temporary password.
    final renewed = await pending.silo.refreshSession().catchError(
      (_) => false,
    );
    if (!renewed) {
      await _endSiloLogin(pending.client);
      return _emit(const SiloPasswordChangedSignInAgain());
    }
    return _finishSiloSignIn(
      client: pending.client,
      silo: pending.silo,
      serverId: pending.serverId,
      accountId: pending.accountId,
    );
  }

  /// Ends a login left open for a password change (the person canceled the
  /// dialog). Does nothing when none is waiting.
  Future<void> cancelRequiredSiloPasswordChange() async {
    final pending = _pendingPasswordChange;
    if (pending == null) return;
    _pendingPasswordChange = null;
    await _endSiloLogin(pending.client);
  }

  Future<LoginState> _abandonPasswordChange(
    _PendingSiloPasswordChange pending,
  ) async {
    _pendingPasswordChange = null;
    await _endSiloLogin(pending.client);
    return _emit(const RequireSignIn());
  }

  /// Ends a Silo login on the server and the client, ignoring failures: the
  /// client forgets the tokens either way (`SiloAuthApi.logout`).
  Future<void> _endSiloLogin(MediaServerClient client) async {
    try {
      await client.authApi.logout();
    } catch (_) {}
  }

  /// The rest of a Silo sign-in: every household profile of the account is
  /// stored as a user, all sharing the account's token pair, which is stored
  /// and kept saved on every refresh. Reads the pair from the session rather
  /// than the sign-in answer, because a password change refreshes it.
  ///
  /// An account with a single profile, without a PIN, goes straight in as
  /// it. Any other household (several profiles, or a PIN to enter) answers
  /// [SiloChooseProfile]: the login screen then opens the server's user grid,
  /// where a locked profile asks for its PIN. Nobody is the current user
  /// until then.
  ///
  /// A failure after the password ends the new login on Silo too, so no
  /// session is left open that the app no longer knows about.
  Future<LoginState> _finishSiloSignIn({
    required MediaServerClient client,
    required SiloMediaServerClient silo,
    required String serverId,
    required String accountId,
  }) async {
    final List<SiloHouseholdMember> members;
    try {
      // No profile until one is chosen, so the household is read as the
      // account.
      silo.profileId = null;
      silo.profileToken = null;
      members = await (silo.usersApi as SiloUsersApi).getHousehold();
      if (members.isEmpty) {
        throw StateError('Silo listed no profiles for this account');
      }
    } catch (e) {
      _logger.e('Silo sign-in could not read the household', error: e);
      await _endSiloLogin(client);
      return _failed(e);
    }

    final tokens = silo.session.tokens;
    if (tokens == null) {
      // Signed out while the household was read.
      return _emit(const RequireSignIn());
    }

    await _siloTokens.save(serverId, accountId, tokens, newLogin: true);
    _siloTokens.bind(client: silo, serverId: serverId, accountId: accountId);
    final users = await SiloHousehold(_authStore).store(
      serverId: serverId,
      accountId: accountId,
      members: members,
      accessToken: tokens.accessToken,
    );
    await _authPrefs.setLastServerId(serverId);

    if (users.length != 1 || users.single.siloHasPin) {
      return _emit(SiloChooseProfile(serverId: serverId));
    }

    var user = users.single.copyWith(lastUsed: DateTime.now());
    silo.profileId = user.id;
    client.userId = user.id;
    try {
      // Silo decides downloads per profile, and the household listing only
      // has the account's flag.
      final current = await client.usersApi.getCurrentUser();
      user = user.copyWith(
        canDownload:
            current.policy?.enableContentDownloading ?? user.canDownload,
      );
    } catch (e) {
      _logger.w('Silo profile could not be read after sign-in', error: e);
    }
    await _authStore.putUser(user);
    await _authPrefs.setLastUserId(user.id);
    _userRepository.setCurrentUser(user);

    return _emit(Authenticated(userId: user.id, serverId: serverId));
  }

  LoginState _emit(LoginState state) {
    _stateController.add(state);
    return state;
  }

  /// The state for a sign-in step that failed with [error].
  LoginState _failed(Object error) => error is DioException
      ? _handleDioError(error)
      : _emit(ApiClientError(error: error.toString(), errorType: 'exception'));

  LoginState _handleDioError(DioException e) {
    if (isClientCertificateRejected(e)) {
      const state = ClientCertificateRequired();
      _stateController.add(state);
      return state;
    }
    if (isUntrustedCertificate(e)) {
      const state = UntrustedCertificate();
      _stateController.add(state);
      return state;
    }
    if (isSignInForbidden(e)) {
      const state = SignInForbidden();
      _stateController.add(state);
      return state;
    }
    // Silo's "not now" and "not with this version" answers.
    final siloFailure = SiloFailure.of(e);
    if (siloFailure != null) {
      final state = SiloRequestRefused(siloFailure);
      _stateController.add(state);
      return state;
    }
    final statusCode = e.response?.statusCode;
    if (statusCode == 401) {
      final state = ApiClientError(
        error: 'Invalid username or password',
        errorType: e.type.name,
        statusCode: statusCode,
      );
      _stateController.add(state);
      return state;
    }
    if (statusCode == 500) {
      final state = ApiClientError(
        error: 'Server error (500) - authentication failed',
        errorType: DioExceptionType.badResponse.name,
        statusCode: statusCode,
      );
      _stateController.add(state);
      return state;
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      const state = ServerUnavailable();
      _stateController.add(state);
      return state;
    }
    final detail = statusCode != null ? 'HTTP $statusCode' : e.type.name;
    final state = ApiClientError(
      error: 'Connection failed (${e.type.name}): $detail',
      errorType: e.type.name,
      statusCode: statusCode,
    );
    _stateController.add(state);
    return state;
  }

  Future<void> logout(MediaServerClient client) async {
    try {
      await client.authApi.logout();
    } catch (_) {}

    final user = _userRepository.currentUser;
    if (user != null) {
      await _authStore.removeUser(user.serverId, user.id);
    }

    _userRepository.setCurrentUser(null);
    await _sessionRepository.destroyCurrentSession();
    _stateController.add(const RequireSignIn());
  }

  String? getUserImageUrl(MediaServerClient client, User user) {
    if (user.imageTag == null) return null;
    return client.imageApi.getUserImageUrl(user.id);
  }

  void dispose() {
    _stateController.close();
  }
}

/// A Silo login that signed in with a temporary password, kept open (and
/// unsaved) until the password is replaced or the change is canceled.
class _PendingSiloPasswordChange {
  _PendingSiloPasswordChange({
    required this.client,
    required this.silo,
    required this.serverId,
    required this.accountId,
    required this.currentPassword,
  });

  final MediaServerClient client;
  final SiloMediaServerClient silo;
  final String serverId;
  final String accountId;

  /// The temporary password the person signed in with. Silo asks for it with
  /// the change. Held in memory only, for as long as the change is pending.
  final String currentPassword;
}
