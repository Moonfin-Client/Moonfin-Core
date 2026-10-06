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

class VersionNotSupported extends LoginState {
  final Server server;
  const VersionNotSupported({required this.server});
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
