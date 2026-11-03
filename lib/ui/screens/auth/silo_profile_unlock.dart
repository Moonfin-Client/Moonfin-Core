import 'dart:convert';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_silo/server_silo.dart';

import '../../../auth/models/server.dart';
import '../../../auth/models/user.dart';
import '../../../auth/services/silo_token_storage.dart';
import '../../../auth/store/authentication_store.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/silo_failure_message.dart';
import '../../widgets/overlay_sheet.dart';
import 'silo_secret_field.dart';

/// Before switching to Silo profile [user] on [server], asks for its PIN
/// when it's locked and has no live proof, and keeps the proof Silo gives.
/// True when the profile can be used now (no PIN needed, or the right one
/// entered), false when the dialog was closed.
///
/// The check goes through the server's client as the account. If that
/// client holds another login, or none (the picker after a restart), a
/// separate client with the account's stored login does it.
Future<bool> unlockSiloProfileIfNeeded(
  BuildContext context, {
  required Server server,
  required PrivateUser user,
}) async {
  final store = GetIt.instance<AuthenticationStore>();
  final storage = SiloTokenStorage(store);
  if (!storage.needsPin(user)) return true;

  final client = GetIt.instance<MediaServerClientFactory>().getClient(
    serverId: server.id,
    serverType: server.serverType,
    baseUrl: server.address,
  );
  final silo = siloClientOf(client);
  final accountId = user.siloAccountId;
  if (silo == null || accountId == null) return true;
  final stored = storage.read(server.id, accountId);
  // Another login (or none) on the server's client: check on a client of
  // its own, so closing the dialog leaves the current session as it was.
  SiloMediaServerClient? own;
  if (stored != null &&
      silo.session.tokens?.refreshToken != stored.refreshToken) {
    own = SiloMediaServerClient(
      baseUrl: silo.baseUrl,
      deviceInfo: silo.deviceInfo,
      platform: silo.platform,
    );
    storage.restore(client: own, user: user);
  }
  final checker = own ?? silo;

  try {
    if (!context.mounted) return false;
    return await SiloPinDialog.show(
      context,
      profileName: user.name,
      onSubmit: (pin) async {
        final result = await checker.profilesApi.verifyPin(user.id, pin);
        if (result case SiloPinAccepted(
          :final profileToken,
          :final expiresAt,
        )) {
          await storage.saveProfileToken(
            user,
            profileToken,
            expiresAt: expiresAt,
          );
        }
        return result;
      },
    );
  } finally {
    own?.dispose();
  }
}

/// Asks for a Silo profile's PIN.
///
/// Silo PINs are 1 to 72 characters of any text, so the field is a plain
/// obscured text field, not the digit pad of Moonfin's own app PIN. A wrong
/// PIN keeps the dialog open. After five, Silo locks the profile for five
/// minutes, and the dialog says how long is left. [onSubmit] checks the PIN
/// (`SiloProfilesApi.verifyPin`) and is only called when the person submits.
class SiloPinDialog extends StatefulWidget {
  const SiloPinDialog({
    super.key,
    required this.profileName,
    required this.onSubmit,
  });

  final String profileName;
  final Future<SiloPinResult> Function(String pin) onSubmit;

  /// True when the right PIN was entered, false when the dialog was closed.
  static Future<bool> show(
    BuildContext context, {
    required String profileName,
    required Future<SiloPinResult> Function(String pin) onSubmit,
  }) async {
    final unlocked = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (_) =>
          SiloPinDialog(profileName: profileName, onSubmit: onSubmit),
    );
    return unlocked == true;
  }

  @override
  State<SiloPinDialog> createState() => _SiloPinDialogState();
}

class _SiloPinDialogState extends State<SiloPinDialog> {
  /// Silo's limit, in UTF-8 bytes (bcrypt's).
  static const _maxPinBytes = 72;

  final _controller = TextEditingController();
  final _fieldFocus = FocusNode();
  final _submitFocus = FocusNode();
  final _tvKey = GlobalKey<CustomTVTextFieldState>();

  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    _fieldFocus.dispose();
    _submitFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final pin = _controller.text;
    if (_busy || pin.isEmpty) return;
    final l10n = AppLocalizations.of(context);
    if (utf8.encode(pin).length > _maxPinBytes) {
      // Longer than any Silo PIN can be: wrong, without spending an attempt.
      setState(() => _error = l10n.siloPinWrong);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    SiloPinResult result;
    String? failure;
    try {
      result = await widget.onSubmit(pin);
    } on DioException catch (e) {
      result = const SiloPinRejected();
      failure = SiloFailure.of(e)?.message(l10n) ?? l10n.siloPinFailed;
    } catch (_) {
      result = const SiloPinRejected();
      failure = l10n.siloPinFailed;
    }
    if (!mounted) return;
    if (failure == null && result is SiloPinAccepted) {
      Navigator.of(context).pop(true);
      return;
    }
    setState(() {
      _busy = false;
      _controller.clear();
      _error =
          failure ??
          switch (result) {
            SiloPinLocked(:final retryAfter)
                when retryAfter != null && retryAfter > Duration.zero =>
              l10n.siloPinLockedWait(siloWaitText(retryAfter, l10n)),
            SiloPinLocked() => l10n.siloPinLocked,
            _ => l10n.siloPinWrong,
          };
    });
    _fieldFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final insets = MediaQuery.of(context).viewInsets;
    final onSurface = AppColorScheme.onSurface;

    return PopScope(
      canPop: !_busy,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.only(bottom: insets.bottom),
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(minWidth: 320, maxWidth: 400),
              decoration: BoxDecoration(
                color: AppColorScheme.surface.withValues(alpha: 0.9),
                borderRadius: AppRadius.circular(20),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder,
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.siloPinTitle(widget.profileName),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SiloSecretField(
                    controller: _controller,
                    focusNode: _fieldFocus,
                    tvKey: _tvKey,
                    label: l10n.siloPinHint,
                    autofocus: true,
                    enabled: !_busy,
                    down: _submitFocus,
                    onSubmitted: (_) => _submit(),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _error!,
                      style: TextStyle(color: AppColorScheme.statusRequested),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _busy
                            ? null
                            : () => Navigator.of(context).pop(false),
                        child: Text(
                          l10n.cancel,
                          style: TextStyle(
                            color: onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        focusNode: _submitFocus,
                        onPressed: _busy ? null : _submit,
                        child: _busy
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(l10n.siloPinUnlock),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
