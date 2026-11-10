import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/server_user_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../data/services/pin_guard.dart';
import '../../../data/services/server_pin_service.dart';
import '../../../util/pin_code_util.dart';
import '../../widgets/pin_entry_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/settings/settings_section_header.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';

/// Settings screen for managing PIN code protection.
class PinCodeSettingsScreen extends StatefulWidget {
  const PinCodeSettingsScreen({super.key});

  @override
  State<PinCodeSettingsScreen> createState() => _PinCodeSettingsScreenState();
}

class _PinCodeSettingsScreenState extends State<PinCodeSettingsScreen> {
  late final PinCodeUtil _pinUtil;
  late final PinGuard _guard;
  late final ServerPinService _server;
  bool _pinEnabled = false;
  DateTime? _suppressEnableUntil;
  bool _pinActionInProgress = false;

  @override
  void initState() {
    super.initState();
    final session = GetIt.instance<SessionRepository>();
    final store = GetIt.instance<PreferenceStore>();
    final userId = session.activeUserId ?? '';
    final serverId = session.activeServerId;
    _server = GetIt.instance<ServerPinService>();
    _guard = PinGuard.forAccount(
      store: store,
      service: _server,
      userId: userId,
      server: serverId == null
          ? null
          : GetIt.instance<ServerRepository>().getServer(serverId),
      accessToken: serverId == null
          ? null
          : GetIt.instance<ServerUserRepository>()
                .getStoredServerUsers(serverId)
                .where((stored) => stored.id == userId)
                .map((stored) => stored.accessToken)
                .firstOrNull,
    );
    _pinUtil = _guard.pin;
    _pinEnabled = _pinUtil.isPinEnabled;
    // The PIN may have been set or removed on another device since.
    _guard.refresh().then((_) {
      if (mounted) _refresh();
    }).catchError((_) {});
  }

  /// Checks the current PIN, and keeps what was typed for the server, which
  /// wants it again to change or remove a PIN it holds.
  Future<bool> _verifyCurrent(void Function(String pin) typed) {
    return PinEntryDialog.show(
      context,
      mode: PinEntryMode.verify,
      onVerifyAsync: (pin) async {
        final outcome = await _guard.verify(pin);
        if (outcome is PinAccepted) typed(pin);
        return outcome;
      },
    );
  }

  /// Turns a verdict that refuses the change into [PinChangeRefused], so the
  /// caller says so instead of going on as if it worked.
  void _throwIfRefused(ServerPinVerdict verdict) {
    // A PIN the server holds is only changed once the server says so, or the
    // copy here would differ from the one every other device is asked.
    if (verdict is ServerPinUnavailable && _pinUtil.isServerBacked) {
      throw const PinChangeRefused.unreachable();
    }
    if (verdict is ServerPinWrong) {
      throw const PinChangeRefused(PinRejected());
    }
    if (verdict is ServerPinLocked) {
      throw PinChangeRefused(PinLockedOut(verdict.retryAfter));
    }
  }

  void _showRefusal(PinChangeRefused refused) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final outcome = refused.outcome;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          refused.unreachable
              ? l10n.unableToConnectToServer
              : outcome is PinLockedOut
              ? l10n.pinTryAgainIn(PinEntryDialog.formatWait(outcome.wait))
              : l10n.pinIncorrect,
        ),
      ),
    );
  }

  /// Sets the PIN on the server when there is one to ask, and keeps a copy here
  /// either way, for when the server cannot be asked. A PIN the server turned
  /// down is not kept, or this device would hold one nobody else has.
  Future<void> _storePin(String pin, {String? currentPin}) async {
    final account = _guard.account;
    if (account != null) {
      final verdict = await _server.setPin(
        account,
        pin,
        currentPin: currentPin,
      );
      _throwIfRefused(verdict);
      if (verdict is ServerPinValid) await _pinUtil.setServerBacked(true);
    }
    await _pinUtil.setPin(pin);
  }

  Future<void> _dropPin(String? currentPin) async {
    final account = _guard.account;
    if (account != null && _pinUtil.isServerBacked) {
      final verdict = await _server.removePin(
        account,
        currentPin: currentPin,
      );
      _throwIfRefused(verdict);
    }
    await _pinUtil.removePin();
  }

  void _refresh() {
    setState(() {
      _pinEnabled = _pinUtil.isPinEnabled;
    });
  }

  Future<void> _setPin() async {
    if (_pinActionInProgress) return;
    _pinActionInProgress = true;
    try {
      final result = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.set,
        onPinSet: _storePin,
      );
      if (result) _refresh();
    } finally {
      _pinActionInProgress = false;
    }
  }

  Future<void> _changePin() async {
    if (_pinActionInProgress) return;
    _pinActionInProgress = true;
    try {
      String? current;
      final verified = await _verifyCurrent((pin) => current = pin);
      if (!verified || !mounted) return;

      final changed = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.set,
        onPinSet: (pin) => _storePin(pin, currentPin: current),
      );
      if (changed) _refresh();
    } finally {
      _pinActionInProgress = false;
    }
  }

  Future<void> _removePin() async {
    if (_pinActionInProgress) return;
    _pinActionInProgress = true;
    try {
      String? current;
      final verified = await _verifyCurrent((pin) => current = pin);
      if (!verified || !mounted) return;

      try {
        await _dropPin(current);
      } on PinChangeRefused catch (refused) {
        _showRefusal(refused);
        return;
      }
      _suppressEnableUntil = DateTime.now().add(
        const Duration(milliseconds: 500),
      );
      _refresh();
    } finally {
      _pinActionInProgress = false;
    }
  }

  Future<void> _togglePinEnabled(bool enabled) async {
    if (_pinActionInProgress) return;
    if (enabled && !_pinEnabled) {
      final suppressUntil = _suppressEnableUntil;
      if (suppressUntil != null && DateTime.now().isBefore(suppressUntil)) {
        return;
      }
      await _setPin();
      return;
    }

    if (!enabled && _pinEnabled) {
      _pinActionInProgress = true;
      try {
        String? current;
        final verified = await _verifyCurrent((pin) => current = pin);
        if (!verified || !mounted) return;
        if (_pinUtil.isServerBacked) {
          // A PIN on the server has no off switch, only removal.
          try {
            await _dropPin(current);
          } on PinChangeRefused catch (refused) {
            _showRefusal(refused);
            return;
          }
        } else {
          await _pinUtil.setPinEnabled(false);
        }
        _refresh();
      } finally {
        _pinActionInProgress = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.pinCode)),
        body: ListView(
          children: [
            SettingsSectionHeader(l10n.general),
            adaptiveListSection(
              children: [
                SwitchListTile.adaptive(
                  title: Text(l10n.enablePinCode),
                  subtitle: Text(
                    _pinUtil.isServerBacked
                        ? l10n.pinSynced
                        : l10n.requirePinToAccess,
                  ),
                  secondary: const Icon(Icons.lock),
                  value: _pinEnabled,
                  onChanged: _togglePinEnabled,
                ),
              ],
            ),
            if (_pinEnabled) ...[
              SettingsSectionHeader(l10n.manage),
              adaptiveListSection(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: Text(l10n.changePin),
                    subtitle: Text(l10n.setNewPinCode),
                    onTap: _changePin,
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: Text(l10n.removePin),
                    subtitle: Text(l10n.removePinProtection),
                    onTap: _removePin,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
