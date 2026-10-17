sealed class ServerAdditionState {
  const ServerAdditionState();
}

class ServerConnecting extends ServerAdditionState {
  final String address;
  const ServerConnecting({required this.address});
}

class ServerUnableToConnect extends ServerAdditionState {
  final List<String> candidatesTried;
  final String? lastCandidate;
  final String? lastErrorType;
  final int? lastStatusCode;
  final String? lastErrorMessage;

  /// An address that answered but whose certificate wasn't trusted. A later
  /// address failing some other way would otherwise hide it.
  final String? untrustedCandidate;

  /// An address that asked for a client certificate (mTLS). The connection can
  /// be retried once one is imported for that host.
  final String? clientCertCandidate;

  /// The first https address that was actually reached before failing, which
  /// a proxy demanding a client certificate can look like when its refusal
  /// isn't recognised: over TLS 1.3 Android often sees a broken pipe instead
  /// of the certificate_required alert. Refused, timed out and unresolved
  /// addresses never count, so a later port can be the one picked.
  final String? possibleClientCertCandidate;

  const ServerUnableToConnect({
    required this.candidatesTried,
    this.lastCandidate,
    this.lastErrorType,
    this.lastStatusCode,
    this.lastErrorMessage,
    this.untrustedCandidate,
    this.clientCertCandidate,
    this.possibleClientCertCandidate,
  });
}

class ServerConnected extends ServerAdditionState {
  final String id;
  final Map<String, dynamic> publicInfo;
  const ServerConnected({required this.id, required this.publicInfo});
}
