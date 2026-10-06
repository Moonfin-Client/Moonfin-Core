import 'package:dio/dio.dart';

/// Whether connections accept self-signed or otherwise untrusted TLS
/// certificates.
///
/// The app keeps it in step with its "Allow self-signed certificates" setting.
/// It's read on every failed handshake, so a change applies right away without
/// rebuilding any client. Unused on web, where the browser owns certificate
/// validation.
bool gAllowSelfSignedCertificates = false;

/// Whether [error] is a TLS handshake that failed because the server's
/// certificate isn't trusted, which [gAllowSelfSignedCertificates] lets
/// through. dart:io's handshake error reaches Dio untyped, so it's matched by
/// the reason BoringSSL gives, which also keeps this safe to build for web.
bool isUntrustedCertificate(Object? error) {
  if (error is! DioException) return false;
  return error.type == DioExceptionType.badCertificate ||
      '${error.error}'.contains('CERTIFICATE_VERIFY_FAILED');
}
