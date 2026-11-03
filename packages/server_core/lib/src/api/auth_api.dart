abstract class AuthApi {
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  );

  /// Opens a sign-in request this device shows a code for, answered in
  /// Jellyfin's `QuickConnectResult` shape: `Code` (what the person types
  /// where they are signed in) and `Secret` (what this device polls with,
  /// never shown). A server may add the optional [QuickConnectKeys].
  ///
  /// Throws [QuickConnectUnavailableError] when the server has sign-in with a
  /// code switched off.
  Future<Map<String, dynamic>> initiateQuickConnect();

  /// Asks whether the request opened with [secret] was approved:
  /// `Authenticated` is true once it was. A server may add the optional
  /// [QuickConnectKeys] (`Status` when the request can no longer be approved).
  Future<Map<String, dynamic>> checkQuickConnect(String secret);

  Future<bool> authorizeQuickConnect(String code, {String? userId});

  Future<Map<String, dynamic>> authenticateWithQuickConnect(String secret);

  Future<void> logout();
}

/// Optional members a server may add to the answers of
/// [AuthApi.initiateQuickConnect] and [AuthApi.checkQuickConnect], for a
/// sign-in screen that shows more than the code. Jellyfin sends none of
/// them, and a screen that finds none behaves as it does for Jellyfin.
abstract final class QuickConnectKeys {
  /// Page where the person enters the code (initiate).
  static const verificationUri = 'VerificationUri';

  /// [verificationUri] with the code filled in, for a QR code (initiate).
  static const verificationUriComplete = 'VerificationUriComplete';

  /// When the request expires, ISO 8601 (initiate, and check may move it).
  static const expiresAt = 'ExpiresAt';

  /// Seconds to wait before the next check (initiate and check).
  static const pollAfterSeconds = 'PollAfterSeconds';

  /// True once someone has looked the code up to approve it (check).
  static const opened = 'Opened';

  /// The request's state when it can't be approved any more (check): one of
  /// [statusDenied], [statusExpired], [statusUsed].
  static const status = 'Status';

  /// The person approving refused it.
  static const statusDenied = 'denied';

  /// The code outlived its time, or the server no longer knows it.
  static const statusExpired = 'expired';

  /// The request was collected or withdrawn already. A new code is needed.
  static const statusUsed = 'used';
}

/// The server has sign-in with a code (Quick Connect) switched off.
class QuickConnectUnavailableError implements Exception {
  const QuickConnectUnavailableError([this.reason]);

  /// The server's own word for why, when it gave one (Silo: `disabled`,
  /// `not_configured`).
  final String? reason;

  @override
  String toString() =>
      'QuickConnectUnavailableError${reason == null ? '' : ': $reason'}';
}
