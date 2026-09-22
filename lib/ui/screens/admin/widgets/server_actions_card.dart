import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import 'admin_form_styles.dart';

class ServerActionsCard extends StatelessWidget {
  final MediaServerClient client;
  final bool canSelfRestart;
  final VoidCallback onActionComplete;

  const ServerActionsCard({
    super.key,
    required this.client,
    required this.canSelfRestart,
    required this.onActionComplete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        adminSectionLabel(context, l10n.adminServerActions,
            icon: Icons.settings_power),
        adminGlassGroup(
          context,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spaceLg,
                vertical: AppSpacing.spaceMd,
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (canSelfRestart)
                  FilledButton.tonalIcon(
                    icon: const Icon(Icons.restart_alt),
                    label: Text(l10n.adminRestartServer),
                    onPressed: () => _confirmAction(
                      context,
                      title: l10n.adminRestartServer,
                      message: l10n.adminRestartServerConfirmation,
                      onConfirm: () async {
                        await client.adminSystemApi.restartServer();
                        if (!context.mounted) return;
                        await _showRestartMessage(context);
                      },
                    ),
                  ),
                FilledButton.tonalIcon(
                  icon: const Icon(Icons.power_settings_new),
                  label: Text(l10n.adminShutdownServer),
                  onPressed: () => _confirmAction(
                    context,
                    title: l10n.adminShutdownServer,
                    message: l10n.adminShutdownServerConfirmation,
                    onConfirm: () async {
                      await client.adminSystemApi.shutdownServer();
                    },
                  ),
                ),
                FilledButton.tonalIcon(
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.adminScanLibraries),
                  onPressed: () async {
                    try {
                      await client.adminLibraryApi.refreshLibrary();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.adminLibraryScanStarted)),
                        );
                      }
                      onActionComplete();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.errorGeneric(describeError(e, l10n)))),
                        );
                      }
                    }
                  },
                ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showRestartMessage(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => PopScope(
        canPop: true,
        child: AlertDialog.adaptive(
          title: Text(l10n.adminServerRebootInProgress),
          content: Text(l10n.adminServerRebootMessage),
          actions: [
            adaptiveDialogAction(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(l10n.ok),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmAction(
    BuildContext context, {
    required String title,
    required String message,
    required Future<void> Function() onConfirm,
  }) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(message),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      try {
        await onConfirm();
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.errorGeneric(describeError(e, l10n)))),
          );
        }
      }
    }
  }
}
