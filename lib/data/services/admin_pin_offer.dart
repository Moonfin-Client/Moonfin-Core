import 'package:jellyfin_preference/jellyfin_preference.dart';

import 'pin_guard.dart';
import 'server_pin_service.dart';

/// Whether to offer an administrator a PIN after they sign in, and what they
/// said to it.
///
/// An administrator can change settings and reach every account, so the app
/// suggests protecting theirs. When the server's plugin keeps PINs, setting
/// one is part of setting up the plugin, so there is no offer and no extra
/// prompt on every device. Without it, the app offers once and respects a no.
class AdminPinOffer {
  AdminPinOffer(this._store);

  final PreferenceStore _store;

  static String _declinedKey(String userId) => 'admin_pin_offer_declined_$userId';

  bool hasDeclined(String userId) =>
      _store.getBool(_declinedKey(userId)) ?? false;

  Future<void> decline(String userId) =>
      _store.setBool(_declinedKey(userId), true);

  /// Whether to make the offer to [userId] now. [guard] is for their account,
  /// and tells whether the server has a place to keep a PIN.
  Future<bool> shouldOffer({
    required String userId,
    required bool isAdministrator,
    required PinGuard guard,
  }) async {
    if (!isAdministrator || hasDeclined(userId)) return false;
    if (guard.pin.isPinEnabled) return false;

    final account = guard.account;
    if (account != null &&
        await guard.service.status(account) !=
            ServerPinAvailability.unavailable) {
      return false;
    }
    return true;
  }
}
