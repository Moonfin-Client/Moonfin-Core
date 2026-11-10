import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../auth/models/server.dart';
import '../../util/pin_code_util.dart';
import 'server_pin_service.dart';

/// How a PIN that was typed fared.
sealed class PinOutcome {
  const PinOutcome();
}

class PinAccepted extends PinOutcome {
  const PinAccepted();
}

class PinRejected extends PinOutcome {
  const PinRejected();
}

/// Too many wrong guesses, so the next one has to wait.
class PinLockedOut extends PinOutcome {
  const PinLockedOut(this.wait);

  final Duration wait;
}

/// The server turned down setting or removing a PIN, so the caller can say why
/// instead of acting as if it worked.
class PinChangeRefused implements Exception {
  const PinChangeRefused(this.outcome) : unreachable = false;

  /// The server could not be asked, so a PIN it holds cannot be changed from
  /// here without this device and the server disagreeing.
  const PinChangeRefused.unreachable()
    : outcome = const PinRejected(),
      unreachable = true;

  final PinOutcome outcome;
  final bool unreachable;
}

/// Checks a user's sign in PIN, asking the server when it can be reached and
/// the PIN on the device otherwise.
///
/// A PIN set on one device then holds on every other, and the server counts the
/// wrong guesses. When the server cannot answer the PIN last typed correctly on
/// this device decides, so a server that is down never locks a family out of
/// the app.
class PinGuard {
  PinGuard({required this.pin, required this.service, this.account});

  /// The guard for a user's sign in PIN. Without a token to ask the server with
  /// the PIN on the device decides.
  factory PinGuard.forAccount({
    required PreferenceStore store,
    required ServerPinService service,
    required String userId,
    Server? server,
    String? accessToken,
  }) => PinGuard(
    pin: PinCodeUtil(store, userId),
    service: service,
    account:
        (server?.address ?? '').isEmpty || (accessToken ?? '').isEmpty
        ? null
        : ServerPinAccount(
            baseUrl: server!.address,
            accessToken: accessToken!,
            plexServerId: server.serverType == ServerType.plex
                ? server.id
                : null,
          ),
  );

  final PinCodeUtil pin;
  final ServerPinService service;

  /// Where to ask, or null when the account has no token to ask with.
  final ServerPinAccount? account;

  /// Learns whether the server holds a PIN for the account. This is how a
  /// device that has never seen the PIN comes to ask for it, and how a PIN an
  /// administrator removed stops being asked for.
  Future<void> refresh() async {
    final asking = account;
    if (asking == null) return;
    switch (await service.status(asking)) {
      case ServerPinAvailability.enabled:
        await pin.setServerBacked(true);
      case ServerPinAvailability.disabled:
        if (pin.isServerBacked) await pin.removePin();
      case ServerPinAvailability.unavailable:
        break;
    }
  }

  /// Clears a PIN the user says they forgot, after a sign in that proved who
  /// they are. A PIN on the server can only be cleared by an administrator, so
  /// for anyone else it stays and this says so.
  Future<bool> resetForgotten(String userId) async {
    final asking = account;
    if (asking != null && pin.isServerBacked) {
      if (await service.removePinFor(asking, userId) is! ServerPinValid) {
        return false;
      }
    }
    await pin.removePin();
    return true;
  }

  Future<PinOutcome> verify(String entered) async {
    final asking = account;
    if (asking == null) return _verifyHere(entered);

    final verdict = await service.verify(asking, entered);
    switch (verdict) {
      case ServerPinValid():
        await pin.setPin(entered);
        await pin.setServerBacked(true);
        return const PinAccepted();
      case ServerPinWrong():
        return const PinRejected();
      case ServerPinLocked(:final retryAfter):
        return PinLockedOut(retryAfter);
      case ServerPinNone():
        if (pin.isServerBacked) {
          // An administrator took the PIN away.
          await pin.removePin();
          return const PinAccepted();
        }
        // A PIN that only this device knows, on a server that now has the
        // plugin. It decides, and then moves to the server.
        final outcome = await _verifyHere(entered);
        if (outcome is PinAccepted &&
            await service.setPin(asking, entered) is ServerPinValid) {
          await pin.setServerBacked(true);
        }
        return outcome;
      case ServerPinUnavailable():
        return _verifyHere(entered);
    }
  }

  Future<PinOutcome> _verifyHere(String entered) async {
    if (pin.isLockedOut) return PinLockedOut(pin.lockoutRemaining);
    if (pin.verifyPin(entered)) {
      await pin.clearFailedAttempts();
      return const PinAccepted();
    }
    final wait = await pin.registerFailedAttempt();
    return wait > Duration.zero ? PinLockedOut(wait) : const PinRejected();
  }
}
