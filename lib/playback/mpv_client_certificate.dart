import 'dart:io';

import 'package:media_kit/media_kit.dart';
import 'package:server_core/server_core.dart';

import '../data/services/client_certificate_service.dart';
import '../util/platform_detection.dart';

/// The Linux packages bundle Ubuntu's FFmpeg, whose gnutls only looks for
/// Debian's CA bundle, so on distros like openSUSE mpv gets the system's own.
final String? _linuxCaBundle = PlatformDetection.isLinux
    ? const [
        '/etc/ssl/certs/ca-certificates.crt',
        '/etc/pki/tls/certs/ca-bundle.crt',
        '/etc/ssl/ca-bundle.pem',
      ].where((path) => File(path).existsSync()).firstOrNull
    : null;

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
    if (_linuxCaBundle case final caBundle?) {
      await native.setProperty('tls-ca-file', caBundle);
    }
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
