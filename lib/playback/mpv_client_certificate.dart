import 'package:media_kit/media_kit.dart';
import 'package:server_core/server_core.dart';

import '../data/services/client_certificate_service.dart';

/// Points mpv at the client certificate for [url]'s host, or clears the one a
/// previous open set. mpv only takes file paths and has no key password, so
/// the key is written unencrypted to app-private storage. Also turns off mpv's
/// certificate check for the user's own servers while self-signed ones are
/// allowed.
Future<void> applyMpvClientCertificate(Player player, String url) async {
  final platform = player.platform;
  if (platform is! NativePlayer) return;
  try {
    // NativePlayer's web stub has no setProperty or getProperty, so the web
    // build needs dynamic here.
    final dynamic native = platform;
    final host = Uri.tryParse(url)?.host ?? '';
    // Everything else gets mpv's own default back rather than a forced yes,
    // because the OpenSSL and mbedtls backends in older FFmpeg like 6.1 load
    // no system certificates and would refuse every https server.
    await native.setProperty(
      'tls-verify',
      acceptsUntrustedCertificate(host)
          ? 'no'
          : await native.getProperty('option-info/tls-verify/default-value'),
    );
    final certificate = clientCertificateFor(host);
    var certPath = '';
    var keyPath = '';
    if (certificate != null) {
      final certFile = await clientCertificateFile(certificate.host, 'crt');
      final keyFile = await clientCertificateFile(certificate.host, 'key');
      await certFile.writeAsString(certificate.chainPem);
      await keyFile.writeAsString(certificate.keyPem);
      certPath = certFile.path;
      keyPath = keyFile.path;
    }
    await native.setProperty('tls-cert-file', certPath);
    await native.setProperty('tls-key-file', keyPath);
  } catch (_) {
    // Playback still goes ahead, and a server that needs the certificate
    // refuses it.
  }
}
