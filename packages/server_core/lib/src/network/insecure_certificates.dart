import 'package:dio/dio.dart';

/// Whether connections accept self-signed or otherwise untrusted TLS
/// certificates.
///
/// The app keeps it in step with its "Allow self-signed certificates" setting.
/// It's read on every failed handshake, so a change applies right away without
/// rebuilding any client. Unused on web, where the browser owns certificate
/// validation.
bool gAllowSelfSignedCertificates = false;

/// Whether [host] belongs to one of the user's own servers. The setting only
/// reaches those, so plex.tv, Emby Connect and the other outside services
/// can't be intercepted while it's on. The app points this at its servers.
bool Function(String host) gIsOwnServerHost = (_) => false;

/// Whether an untrusted certificate from [host] is let through.
bool acceptsUntrustedCertificate(String host) =>
    gAllowSelfSignedCertificates && gIsOwnServerHost(host.toLowerCase());

/// Whether [error] is a TLS handshake that failed because the server's
/// certificate isn't trusted, which [gAllowSelfSignedCertificates] lets
/// through. dart:io's handshake error reaches Dio untyped, so it's matched by
/// the reason BoringSSL gives, which also keeps this safe to build for web.
bool isUntrustedCertificate(Object? error) {
  if (error is! DioException) return false;
  return error.type == DioExceptionType.badCertificate ||
      '${error.error}'.contains('CERTIFICATE_VERIFY_FAILED');
}

/// Whether [error] means the server wanted a client certificate (mTLS) and
/// didn't get one it accepts.
bool isClientCertificateRejected(Object? error) {
  if (error is! DioException) return false;
  final reason = '${error.error}';
  // TLS 1.3 servers send certificate_required. Over TLS 1.2 OpenSSL sends
  // handshake_failure and Go sends bad_certificate.
  if (reason.contains('CERTIFICATE_REQUIRED') ||
      reason.contains('SSLV3_ALERT_BAD_CERTIFICATE') ||
      reason.contains('SSLV3_ALERT_HANDSHAKE_FAILURE')) {
    return true;
  }
  // nginx finishes the handshake and answers with a 400 page instead.
  final statusCode = error.response?.statusCode;
  if (statusCode == 400 || statusCode == 496) {
    return '${error.response?.data}'.contains(
      'No required SSL certificate was sent',
    );
  }
  return false;
}
