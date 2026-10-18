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

class Authenticated extends LoginState {
  final String userId;
  final String serverId;
  const Authenticated({required this.userId, required this.serverId});
}
