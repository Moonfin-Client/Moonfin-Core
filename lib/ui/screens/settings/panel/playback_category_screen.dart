part of '../settings_side_panel.dart';

class _PlaybackCategoryScreen extends StatelessWidget {
  const _PlaybackCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.settingsPlaybackSyncplay),
        ),
        body: ListView(
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.play_circle),
              title: Text(l10n.settingsVideoPlaybackPreferences),
              subtitle: Text(l10n.settingsVideoPlaybackPreferencesSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _VideoPlaybackScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.volume_up),
              title: Text(l10n.settingsAudioPreferences),
              subtitle: Text(l10n.settingsAudioPreferencesSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AudioPreferencesScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.subtitles),
              title: Text(l10n.subtitlePreferences),
              subtitle: Text(l10n.subtitlePreferencesDescription),
              onTap: () =>
                  context.pushSettingsScreen(const SubtitleSettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.queue_play_next),
              title: Text(l10n.settingsAutomationAndQueue),
              subtitle: Text(l10n.settingsAutomationAndQueueSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AutomationQueueScreen()),
            ),
            if (!PlatformDetection.isTV && !PlatformDetection.isWeb)
              _TvSettingsListTile(
                leading: const Icon(Icons.download),
                title: Text(l10n.settingsOfflineDownloads),
                subtitle: Text(l10n.settingsOfflineDownloadsSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const _OfflineDownloadsScreen()),
              ),
            _TvSettingsListTile(
              leading: const Icon(Icons.groups),
              title: Text(l10n.syncPlay),
              subtitle: Text(l10n.settingsSyncplaySubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _SyncPlaySettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.settings),
              title: Text(l10n.advancedOptions),
              subtitle: Text(l10n.settingsAdvancedOptionsSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AdvancedOptionsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
