import 'dart:io';

import 'client_certificate_material.dart';
import 'insecure_certificates.dart';

final _contexts = Expando<SecurityContext>();

/// Makes [client] present the certificate bound to each host it connects to.
///
/// An [HttpClient] holds one [SecurityContext] for its whole life, so the
/// context has to be picked per connection instead. dart:io tunnels proxied
/// connections with the client's own context, so mTLS through a proxy isn't
/// supported.
void applyClientCertificates(HttpClient client, {SecurityContext? fallback}) {
  client.connectionFactory = (uri, proxyHost, proxyPort) {
    if (proxyHost != null) return Socket.startConnect(proxyHost, proxyPort!);
    final secure = uri.isScheme('https') || uri.isScheme('wss');
    // WebSocket upgrades arrive here as https://host:0, and dart:io only fills
    // in the default port on its own connect path.
    final port = uri.port != 0 ? uri.port : (secure ? 443 : 80);
    if (!secure) return Socket.startConnect(uri.host, port);
    final certificate = clientCertificateFor(uri.host);
    return SecureSocket.startConnect(
      uri.host,
      port,
      context: certificate == null
          ? fallback
          : _contexts[certificate] ??= _contextFor(certificate),
      onBadCertificate: (_) => gAllowSelfSignedCertificates,
    );
  };
}

SecurityContext _contextFor(ClientCertificateMaterial certificate) {
  return SecurityContext(withTrustedRoots: true)
    ..useCertificateChainBytes(certificate.chainPem.codeUnits)
    ..usePrivateKeyBytes(certificate.keyPem.codeUnits)
    // Same as the default context, for proxies that still renegotiate.
    ..allowLegacyUnsafeRenegotiation = true;
}
