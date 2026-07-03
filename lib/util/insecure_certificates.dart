/// Whether the native HTTP stack should accept self-signed / otherwise
/// untrusted TLS certificates.
///
/// Mirrors the [UserPreferences.allowSelfSignedCerts] preference and is read
/// per-connection by the bad-certificate callback installed in
/// http_overrides_io.dart, so flipping the setting takes effect immediately
/// without reinstalling the global override or restarting the app.
///
/// Kept in its own dart:io-free library so both the native override and the
/// (web-safe) preference layer can touch it. Unused on web, where the browser
/// owns certificate validation.
bool gAllowSelfSignedCertificates = false;
