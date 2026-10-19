import 'package:jellyfin_preference/jellyfin_preference.dart';

import 'pin_guard.dart';

/// Whether to offer an administrator a PIN after they sign in, and what they
/// said to it.
///
/// An administrator can change settings and reach every account, so the app
/// suggests protecting theirs. With the server's plugin the PIN is kept on the
/// server and applies on every device, and without it the PIN stays on this
/// device. Either way the offer is made once, and a no is respected.
class AdminPinOffer {
  AdminPinOffer(this._store);

  final PreferenceStore _store;

  static String _declinedKey(String userId) => 'admin_pin_offer_declined_$userId';

  bool hasDeclined(String userId) =>
      _store.getBool(_declinedKey(userId)) ?? false;

  Future<void> decline(String userId) =>
      _store.setBool(_declinedKey(userId), true);

  static String _syncedNoticeKey(String userId) =>
      'admin_pin_synced_notice_seen_$userId';

  /// Whether to tell [userId] that a PIN kept on the server is now enabled on
  /// this device, in place of offering one. Said once per user on a device.
  bool shouldNoteSyncedPin({
    required String userId,
    required bool isAdministrator,
    required PinGuard guard,
  }) =>
      isAdministrator &&
      guard.pin.isServerBacked &&
      !(_store.getBool(_syncedNoticeKey(userId)) ?? false);

  Future<void> markSyncedPinNoted(String userId) =>
      _store.setBool(_syncedNoticeKey(userId), true);

  /// Whether to make the offer to [userId] now. [guard] is for their account,
  /// and knows whether a PIN is already enabled, here or on the server.
  bool shouldOffer({
    required String userId,
    required bool isAdministrator,
    required PinGuard guard,
  }) => isAdministrator && !hasDeclined(userId) && !guard.pin.isPinEnabled;
}
