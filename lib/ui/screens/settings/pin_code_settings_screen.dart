import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../auth/repositories/session_repository.dart';
import '../../../util/pin_code_util.dart';
import '../../widgets/pin_entry_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../../l10n/app_localizations.dart';
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
  bool _pinEnabled = false;
  DateTime? _suppressEnableUntil;
  bool _pinActionInProgress = false;

  @override
  void initState() {
    super.initState();
    final session = GetIt.instance<SessionRepository>();
    final store = GetIt.instance<PreferenceStore>();
    final userId = session.activeUserId ?? '';
    _pinUtil = PinCodeUtil(store, userId);
    _pinEnabled = _pinUtil.isPinEnabled;
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
        onPinSet: (pin) async {
          await _pinUtil.setPin(pin);
        },
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
      final verified = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.verify,
        onVerify: _pinUtil.verifyPin,
      );
      if (!verified || !mounted) return;

      final changed = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.set,
        onPinSet: (pin) async {
          await _pinUtil.setPin(pin);
        },
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
      final verified = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.verify,
        onVerify: _pinUtil.verifyPin,
      );
      if (!verified || !mounted) return;

      await _pinUtil.removePin();
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
        final verified = await PinEntryDialog.show(
          context,
          mode: PinEntryMode.verify,
          onVerify: _pinUtil.verifyPin,
        );
        if (!verified || !mounted) return;
        await _pinUtil.setPinEnabled(false);
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
            adaptiveListSection(
              children: [
                SwitchListTile.adaptive(
                  title: Text(l10n.enablePinCode),
                  subtitle: Text(l10n.requirePinToAccess),
                  secondary: const Icon(Icons.lock),
                  value: _pinEnabled,
                  onChanged: _togglePinEnabled,
                ),
              ],
            ),
            if (_pinEnabled)
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
        ),
      ),
    );
  }
}
