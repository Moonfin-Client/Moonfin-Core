import 'package:dio/dio.dart';

abstract class SystemApi {
  /// How long [ping] waits for an answer. The connectivity check sends the
  /// whole app to the downloads catalog on a failed ping, so a server that
  /// accepts the connection and then hangs has to count as down quickly.
  static const pingTimeout = Duration(seconds: 5);

  /// No auth required.
  Future<Map<String, dynamic>> getPublicSystemInfo();

  /// Requires auth.
  Future<Map<String, dynamic>> getSystemInfo();

  /// Whether the server is up and answering at this address, within
  /// [pingTimeout]. A `401` still counts: the server answered, and whether
  /// the login is still good is for the requests that need it to find out.
  /// Any other refusal (a `404` from an address that isn't the server any
  /// more, a `502` from a proxy with nothing behind it) and any network
  /// failure count as down. Never throws.
  Future<bool> ping();
}

/// Whether a failed ping still heard from the server (see [SystemApi.ping]).
bool pingAnsweredDespite(Object error) {
  final status = switch (error) {
    final DioException e => e.response?.statusCode,
    _ => null,
  };
  return status == 401;
}
