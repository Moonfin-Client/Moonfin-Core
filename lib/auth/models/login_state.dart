import '../../util/silo_failure_message.dart';
import 'server.dart';

sealed class LoginState {
  const LoginState();
}

class Authenticating extends LoginState {
  const Authenticating();
}

class RequireSignIn extends LoginState {
  const RequireSignIn();
}

class ServerUnavailable extends LoginState {
  const ServerUnavailable();
}

class UntrustedCertificate extends LoginState {
  const UntrustedCertificate();
}

class ClientCertificateRequired extends LoginState {
  const ClientCertificateRequired();
}

class VersionNotSupported extends LoginState {
  final Server server;
  const VersionNotSupported({required this.server});
}

/// The server refused the sign in with a 403: the account can't be used right
/// now. Jellyfin doesn't say why outside development, and it can be the user's
/// access schedule, a disabled account or a lockout.
class SignInForbidden extends LoginState {
  const SignInForbidden();
}

class ApiClientError extends LoginState {
  final String error;
  final String? errorType;
  final int? statusCode;

  const ApiClientError({required this.error, this.errorType, this.statusCode});
}

/// A Silo sign-in stored the account's household profiles, and one has to be
/// chosen: there are several, or the only one has a PIN. The login is open
/// and stored, but nobody is the current user yet. The login screen opens
/// [serverId]'s user grid.
class SiloChooseProfile extends LoginState {
  final String serverId;
  const SiloChooseProfile({required this.serverId});
}

/// Silo refused the sign-in for a reason a person can act on: wait and try
/// again, or update Moonfin or Silo. [failure] has the text.
class SiloRequestRefused extends LoginState {
  final SiloFailure failure;
  const SiloRequestRefused(this.failure);
}

class Authenticated extends LoginState {
  final String userId;
  final String serverId;
  const Authenticated({required this.userId, required this.serverId});
}

/// Silo accepted the password, but it is a temporary one the account has to
/// replace before it can do anything else. The login stays open
/// for the change: finish it with `AuthRepository.changeRequiredSiloPassword`
/// or end it with `cancelRequiredSiloPasswordChange`.
class SiloPasswordChangeRequired extends LoginState {
  /// Fewest characters the new password may have.
  final int minimumLength;

  /// Most UTF-8 bytes the new password may have.
  final int maximumBytes;

  const SiloPasswordChangeRequired({
    required this.minimumLength,
    required this.maximumBytes,
  });
}

/// Silo refused the new password, or the change couldn't be sent. The login
/// is still open, so the person can try another one. [detail] is Silo's own
/// text for a refused password, null when the request itself failed.
class SiloPasswordChangeRejected extends LoginState {
  final String? detail;

  const SiloPasswordChangeRejected({this.detail});
}

/// The account has a temporary password, and Silo doesn't let it be changed
/// from here (password changes are switched off on the server). The login
/// has been ended, and the person changes it in Silo's web app.
class SiloPasswordChangeUnavailable extends LoginState {
  const SiloPasswordChangeUnavailable();
}

/// A sign-in with a code was approved for an account holding a
/// temporary password. Replacing it needs the password in use, which a code
/// sign-in doesn't have, so the login has been ended: sign in with the
/// password once to replace it.
class SiloCodeSignInPasswordChangeRequired extends LoginState {
  const SiloCodeSignInPasswordChangeRequired();
}

/// The new password was saved, but the login couldn't be renewed to lift
/// the temporary restriction (no network, say). The login has been ended,
/// and signing in with the new password works.
class SiloPasswordChangedSignInAgain extends LoginState {
  const SiloPasswordChangedSignInAgain();
}
