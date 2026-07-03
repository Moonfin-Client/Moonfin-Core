import 'dart:io';

import 'insecure_certificates.dart';

void configureHttpOverrides() {
  HttpOverrides.global = _MoonfinHttpOverrides();
}

class _MoonfinHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    // Only bypass certificate validation when the user has explicitly opted in
    // (self-signed / private-CA servers). The flag is read on every failed
    // handshake, so the toggle applies live without reinstalling the override.
    client.badCertificateCallback = (_, _, _) => gAllowSelfSignedCertificates;
    return client;
  }
}
