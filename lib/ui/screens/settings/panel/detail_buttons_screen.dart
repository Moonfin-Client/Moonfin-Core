part of '../settings_side_panel.dart';

/// Switches and ordering for the action buttons on the details screen.
/// Only the buttons this kind of device can draw are listed, and the
/// arrangement it writes to is the one for this kind of device.
class _DetailButtonsScreen extends StatefulWidget {
  const _DetailButtonsScreen();

  @override
  State<_DetailButtonsScreen> createState() => _DetailButtonsScreenState();
}

class _DetailButtonsScreenState extends State<_DetailButtonsScreen> {
  // Keep as Complete only ever shows on a recording, so it stays out until
  // the server turns out to have Live TV.
  bool _hasLiveTv = false;

  @override
  void initState() {
    super.initState();
    _checkLiveTv();
  }

  Future<void> _checkLiveTv() async {
    try {
      final views = await GetIt.instance<UserViewsRepository>()
          .getAllViewsIncludingHidden();
      if (mounted && views.any(isLiveTvLibrary)) {
        setState(() => _hasLiveTv = true);
      }
    } catch (_) {}
  }

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
          appBar: buildSettingsAppBar(context, Text(l10n.detailButtons)),
          body: SettingsPreviewReporter(
            describe: () => SettingsPreviewEntry(
              prefKey: detailButtonLayout.orderPreference.key,
              title: l10n.detailButtons,
              description: l10n.detailButtonsDescription,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    l10n.detailButtonsSectionDescription,
                    style: hint,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Text(l10n.buttonOrderHint, style: hint),
                ),
                ButtonLayoutList(
                  layout: detailButtonLayout,
                  entries: [
                    for (final button in DetailButton.values.where(
                      (button) =>
                          button.isOffered &&
                          (button != DetailButton.keepAsComplete || _hasLiveTv),
                    ))
                      ButtonLayoutEntry(
                        id: button.id,
                        title: button.label(l10n),
                        subtitle: button == DetailButton.watchWithGroup
                            ? l10n.buttonShownInSyncPlayGroup
                            : null,
                        icon: button.icon,
                        canHide: button.canHide,
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
