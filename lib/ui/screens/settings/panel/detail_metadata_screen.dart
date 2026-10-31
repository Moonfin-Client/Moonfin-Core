part of '../settings_side_panel.dart';

/// Switches and ordering for the metadata items on the details screen.
class _DetailMetadataScreen extends StatelessWidget {
  const _DetailMetadataScreen();

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
          appBar: buildSettingsAppBar(context, Text(l10n.detailMetadata)),
          body: SettingsPreviewReporter(
            describe: () => SettingsPreviewEntry(
              prefKey: detailMetadataLayout.orderPreference.key,
              title: l10n.detailMetadata,
              description: l10n.detailMetadataDescription,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    l10n.detailMetadataSectionDescription,
                    style: hint,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Text(l10n.buttonOrderHint, style: hint),
                ),
                ButtonLayoutList(
                  layout: detailMetadataLayout,
                  entries: [
                    for (final item in DetailMetadataItem.values.where(
                      (item) => item.isOffered,
                    ))
                      ButtonLayoutEntry(
                        id: item.id,
                        title: item.label(l10n),
                        subtitle: item.subtitle(l10n),
                        icon: item.icon,
                        canHide: true,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
