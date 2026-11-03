import 'dart:convert';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../auth/models/login_state.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/overlay_sheet.dart';
import 'silo_secret_field.dart';

/// Why a new Silo password can't be sent as typed.
enum SiloNewPasswordIssue { tooShort, tooLong, mismatch, sameAsTemporary }

/// Checks a new password against the limits Silo published
/// (`GET /account/password/capability`) before sending it, so the common
/// mistakes get a translated message instead of Silo's English one. Silo
/// counts the minimum in characters and the maximum in UTF-8 bytes (bcrypt's
/// 72-byte limit), and refuses the temporary password itself.
SiloNewPasswordIssue? checkSiloNewPassword({
  required String newPassword,
  required String confirmation,
  required String temporaryPassword,
  required int minimumLength,
  required int maximumBytes,
}) {
  if (newPassword.runes.length < minimumLength) {
    return SiloNewPasswordIssue.tooShort;
  }
  if (utf8.encode(newPassword).length > maximumBytes) {
    return SiloNewPasswordIssue.tooLong;
  }
  if (newPassword == temporaryPassword) {
    return SiloNewPasswordIssue.sameAsTemporary;
  }
  if (newPassword != confirmation) return SiloNewPasswordIssue.mismatch;
  return null;
}

/// How the dialog closed after a change was sent: the sign-in [state] it
/// ended in, and the [newPassword] (the login screen hands it on, as it does
/// the typed password after a normal sign-in).
class SiloPasswordChangeOutcome {
  const SiloPasswordChangeOutcome(this.state, this.newPassword);

  final LoginState state;
  final String newPassword;
}

/// Asks for a new password after a Silo sign-in with a temporary one.
///
/// [onSubmit] sends the change (`AuthRepository.changeRequiredSiloPassword`).
/// A refused password ([SiloPasswordChangeRejected]) keeps the dialog open
/// with the reason. Any other answer closes it with that answer. Closing it
/// without a change (Cancel, Back) calls [onCancel], which ends the login.
class SiloPasswordChangeDialog extends StatefulWidget {
  const SiloPasswordChangeDialog({
    super.key,
    required this.minimumLength,
    required this.maximumBytes,
    required this.temporaryPassword,
    required this.onSubmit,
  });

  final int minimumLength;
  final int maximumBytes;
  final String temporaryPassword;
  final Future<LoginState> Function(String newPassword) onSubmit;

  /// Shows the dialog. Returns null when it was closed without a change,
  /// after [onCancel] has finished.
  static Future<SiloPasswordChangeOutcome?> show(
    BuildContext context, {
    required int minimumLength,
    required int maximumBytes,
    required String temporaryPassword,
    required Future<LoginState> Function(String newPassword) onSubmit,
    required Future<void> Function() onCancel,
  }) async {
    final outcome = await showFocusRestoringDialog<SiloPasswordChangeOutcome>(
      context: context,
      barrierDismissible: false,
      builder: (_) => SiloPasswordChangeDialog(
        minimumLength: minimumLength,
        maximumBytes: maximumBytes,
        temporaryPassword: temporaryPassword,
        onSubmit: onSubmit,
      ),
    );
    if (outcome == null) await onCancel();
    return outcome;
  }

  @override
  State<SiloPasswordChangeDialog> createState() =>
      _SiloPasswordChangeDialogState();
}

class _SiloPasswordChangeDialogState extends State<SiloPasswordChangeDialog> {
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  // A remote has no way out of a plain text field, so on TV each field owns
  // its focus and moves it on up and down.
  final _newFocus = FocusNode();
  final _confirmFocus = FocusNode();
  final _submitFocus = FocusNode();
  final _newTvKey = GlobalKey<CustomTVTextFieldState>();
  final _confirmTvKey = GlobalKey<CustomTVTextFieldState>();

  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _newController.dispose();
    _confirmController.dispose();
    _newFocus.dispose();
    _confirmFocus.dispose();
    _submitFocus.dispose();
    super.dispose();
  }

  String _issueText(AppLocalizations l10n, SiloNewPasswordIssue issue) =>
      switch (issue) {
        SiloNewPasswordIssue.tooShort => l10n.siloPasswordChangeTooShort(
          widget.minimumLength,
        ),
        SiloNewPasswordIssue.tooLong => l10n.siloPasswordChangeTooLong,
        SiloNewPasswordIssue.mismatch => l10n.siloPasswordChangeMismatch,
        SiloNewPasswordIssue.sameAsTemporary =>
          l10n.siloPasswordChangeSameAsTemporary,
      };

  Future<void> _submit() async {
    if (_busy) return;
    final l10n = AppLocalizations.of(context);
    final newPassword = _newController.text;
    final issue = checkSiloNewPassword(
      newPassword: newPassword,
      confirmation: _confirmController.text,
      temporaryPassword: widget.temporaryPassword,
      minimumLength: widget.minimumLength,
      maximumBytes: widget.maximumBytes,
    );
    if (issue != null) {
      setState(() => _error = _issueText(l10n, issue));
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });
    final LoginState state;
    try {
      state = await widget.onSubmit(newPassword);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = l10n.siloPasswordChangeFailed;
      });
      return;
    }
    if (!mounted) return;
    if (state case SiloPasswordChangeRejected(:final detail)) {
      setState(() {
        _busy = false;
        _error = detail ?? l10n.siloPasswordChangeFailed;
      });
      return;
    }
    Navigator.of(context).pop(SiloPasswordChangeOutcome(state, newPassword));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final insets = MediaQuery.of(context).viewInsets;
    final onSurface = AppColorScheme.onSurface;

    return PopScope(
      // Not while the change is in flight: closing would end the login
      // under it.
      canPop: !_busy,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.only(bottom: insets.bottom),
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(minWidth: 320, maxWidth: 440),
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
                    l10n.siloPasswordChangeTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.siloPasswordChangeMessage,
                    style: TextStyle(color: onSurface.withValues(alpha: 0.7)),
                  ),
                  const SizedBox(height: 16),
                  SiloSecretField(
                    controller: _newController,
                    focusNode: _newFocus,
                    tvKey: _newTvKey,
                    label: l10n.siloPasswordChangeNew,
                    autofocus: true,
                    enabled: !_busy,
                    autofillHints: const [AutofillHints.newPassword],
                    down: _confirmFocus,
                    last: false,
                    onSubmitted: (_) => _confirmFocus.requestFocus(),
                  ),
                  const SizedBox(height: 12),
                  SiloSecretField(
                    controller: _confirmController,
                    focusNode: _confirmFocus,
                    tvKey: _confirmTvKey,
                    label: l10n.siloPasswordChangeConfirm,
                    enabled: !_busy,
                    autofillHints: const [AutofillHints.newPassword],
                    up: _newFocus,
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
                            : () => Navigator.of(context).pop(),
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
                            : Text(l10n.siloPasswordChangeSubmit),
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
