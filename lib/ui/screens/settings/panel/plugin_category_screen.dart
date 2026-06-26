part of '../settings_side_panel.dart';

class _PluginCategoryScreen extends StatelessWidget {
  const _PluginCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.settingsDynamicContent)),
        body: ListView(
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.featured_play_list),
              title: Text(l10n.mediaBar),
              subtitle: Text(l10n.featuredContentAppearance),
              onTap: () =>
                  context.pushSettingsScreen(const MediaBarSettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.preview),
              title: Text(l10n.localPreviews),
              subtitle: Text(l10n.localPreviewsDescription),
              onTap: () => context.pushSettingsScreen(
                const LocalPreviewsSettingsScreen(),
              ),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.auto_awesome),
              title: Text(l10n.seasonalEffects),
              subtitle: Text(l10n.seasonalEffectsDescription),
              onTap: () =>
                  context.pushSettingsScreen(const _SeasonalEffectsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
