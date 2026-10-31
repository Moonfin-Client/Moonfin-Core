part of '../settings_side_panel.dart';

/// Switches and ordering for the buttons around the playback controls.
/// Only the buttons this kind of device can draw are listed, and the
/// arrangement it writes to is the one for this kind of device.
class _OsdButtonsScreen extends StatelessWidget {
  const _OsdButtonsScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final hint = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(context, Text(l10n.osdButtons)),
          body: ListView(
            children: [
              if (!PlatformDetection.isTV)
                EnumPreferenceTile<PlayerTransportPosition>(
                  preference: UserPreferences.playerTransportPosition,
                  title: l10n.playerTransportPosition,
                  description: l10n.playerTransportPositionDescription,
                  icon: Icons.play_circle_outline,
                  labelOf: (v) => switch (v) {
                    PlayerTransportPosition.onScreen =>
                      l10n.playerTransportOnScreen,
                    PlayerTransportPosition.docked => l10n.playerTransportDocked,
                  },
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(l10n.osdButtonsSectionDescription, style: hint),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Text(l10n.buttonOrderHint, style: hint),
              ),
              SettingsPreviewReporter(
                describe: () => SettingsPreviewEntry(
                  prefKey: osdButtonLayout.orderPreference.key,
                  title: l10n.osdButtons,
                  description: l10n.osdButtonsDescription,
                ),
                child: ButtonLayoutList(
                  layout: osdButtonLayout,
                  entries: [
                    for (final button in OsdButton.values.where(
                      (button) => button.isOffered,
                    ))
                      ButtonLayoutEntry(
                        id: button.id,
                        title: button.label(l10n),
                        subtitle: button == OsdButton.syncPlay
                            ? l10n.buttonShownInSyncPlayGroup
                            : null,
                        icon: button.icon,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
