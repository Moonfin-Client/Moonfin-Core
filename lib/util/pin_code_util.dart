import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

/// Utility for PIN code hashing and verification.
///
/// Uses SHA-256 to store and verify user PINs securely.
/// PIN preferences are scoped per-user via prefixed keys.
class PinCodeUtil {
  final PreferenceStore _store;
  final String _userId;

  /// Which PIN this is. The sign in PIN and the Kids Mode PIN are separate
  /// codes for the same user, so they need separate keys.
  final String _namespace;

  PinCodeUtil(this._store, this._userId) : _namespace = 'user';

  /// The PIN that unlocks Kids Mode, independent of the sign in PIN.
  PinCodeUtil.kidsMode(this._store, this._userId) : _namespace = 'kids';

  String get _pinHashKey => '${_namespace}_pin_hash_$_userId';
  String get _pinEnabledKey => '${_namespace}_pin_enabled_$_userId';
  String get _failedAttemptsKey => '${_namespace}_pin_failed_$_userId';
  String get _lockedUntilKey => '${_namespace}_pin_locked_until_$_userId';

  /// Wrong guesses allowed before each further one costs a wait.
  static const _freeAttempts = 5;

  /// How far the wait grows per wrong guess past [_freeAttempts], capped at
  /// [_maxLockout]. Four digits is only 10,000 combinations, which is an
  /// evening's work for a determined child if guessing is free.
  static const _lockoutStep = Duration(seconds: 30);
  static const _maxLockout = Duration(minutes: 15);

  /// Whether the user has a PIN enabled.
  bool get isPinEnabled => _store.getBool(_pinEnabledKey) ?? false;

  /// Hash a PIN string using SHA-256.
  static String hashPin(String pin) {
    final bytes = utf8.encode(pin);
    return sha256.convert(bytes).toString();
  }

  /// How long until another guess is accepted, or zero when one is accepted
  /// now.
  Duration get lockoutRemaining {
    final until = _store.getInt(_lockedUntilKey) ?? 0;
    if (until == 0) return Duration.zero;
    final remaining = until - DateTime.now().toUtc().millisecondsSinceEpoch;
    return remaining <= 0 ? Duration.zero : Duration(milliseconds: remaining);
  }

  bool get isLockedOut => lockoutRemaining > Duration.zero;

  /// Verify a PIN against the stored hash.
  ///
  /// Refuses while locked out without looking at [pin], so waiting is the only
  /// way through.
  bool verifyPin(String pin) {
    if (isLockedOut) return false;
    final storedHash = _store.getString(_pinHashKey);
    if (storedHash == null || storedHash.isEmpty) return false;
    return hashPin(pin) == storedHash;
  }

  /// Records a wrong guess and returns how long the next one has to wait.
  Future<Duration> registerFailedAttempt() async {
    final failed = (_store.getInt(_failedAttemptsKey) ?? 0) + 1;
    await _store.setInt(_failedAttemptsKey, failed);
    if (failed <= _freeAttempts) return Duration.zero;

    final steps = failed - _freeAttempts;
    var lockout = _lockoutStep * steps;
    if (lockout > _maxLockout) lockout = _maxLockout;
    await _store.setInt(
      _lockedUntilKey,
      DateTime.now().toUtc().add(lockout).millisecondsSinceEpoch,
    );
    return lockout;
  }

  Future<void> clearFailedAttempts() async {
    await _store.remove(_failedAttemptsKey);
    await _store.remove(_lockedUntilKey);
  }

  /// Set a new PIN (hashes and stores it).
  Future<void> setPin(String pin) async {
    await _store.setString(_pinHashKey, hashPin(pin));
    await _store.setBool(_pinEnabledKey, true);
    await clearFailedAttempts();
  }

  /// Remove the PIN and disable it.
  Future<void> removePin() async {
    await _store.remove(_pinHashKey);
    await _store.setBool(_pinEnabledKey, false);
    await clearFailedAttempts();
  }

  /// Enable or disable PIN without changing the hash.
  Future<void> setPinEnabled(bool enabled) async {
    await _store.setBool(_pinEnabledKey, enabled);
  }
}
