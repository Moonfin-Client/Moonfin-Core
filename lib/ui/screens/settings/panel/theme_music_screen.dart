part of '../settings_side_panel.dart';

class _ThemeMusicScreen extends StatelessWidget {
  const _ThemeMusicScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.themeMusic)),
        body: ListView(
          children: [
            _SectionHeader(l10n.themeMusic),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.themeMusicEnabled,
                  title: l10n.themeMusic,
                  subtitle: l10n.playThemeMusicOnDetailPages,
                  icon: Icons.music_note,
                  onChanged: _pushPersonalizationSync,
                ),
                SliderPreferenceTile(
                  preference: UserPreferences.themeMusicVolume,
                  title: l10n.themeMusicVolume,
                  icon: Icons.volume_down,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  labelOf: (v) => '$v%',
                  onChangeEnd: _pushPersonalizationSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.themeMusicOnHomeRows,
                  title: l10n.themeMusicOnHomeRows,
                  subtitle: l10n.playWhenBrowsingHomeScreen,
                  icon: Icons.queue_music,
                  onChanged: _pushPersonalizationSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.themeMusicLoop,
                  title: l10n.loopThemeMusic,
                  subtitle: l10n.loopThemeMusicSubtitle,
                  icon: Icons.repeat,
                  onChanged: _pushPersonalizationSync,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
