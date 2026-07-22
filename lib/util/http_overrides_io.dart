import 'dart:io';

import 'insecure_certificates.dart';

void configureHttpOverrides() {
  try {
    SecurityContext.defaultContext.allowLegacyUnsafeRenegotiation = true;
  } catch (_) {}
  HttpOverrides.global = _MoonfinHttpOverrides();
}

class _MoonfinHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final secContext = context ?? SecurityContext.defaultContext;
    try {
      secContext.allowLegacyUnsafeRenegotiation = true;
    } catch (_) {}
    final client = super.createHttpClient(secContext);
    client.maxConnectionsPerHost = 12;
    // Only bypass certificate validation when the user has explicitly opted in
    // (self-signed / private-CA servers). The flag is read on every failed
    // handshake, so the toggle applies live without reinstalling the override.
    client.badCertificateCallback = (_, _, _) => gAllowSelfSignedCertificates;
    return client;
  }
}
