part of '../settings_side_panel.dart';

class _PlaybackCategoryScreen extends StatelessWidget {
  const _PlaybackCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.playback)),
        // Rebuild on preference changes so the Emulator Cores tile appears or
        // disappears the moment the emulator backend toggle flips.
        body: ListenableBuilder(
          listenable: GetIt.instance<UserPreferences>(),
          builder: (context, _) => ListView(
            children: [
              _SectionHeader(l10n.video),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    autofocus: true,
                    leading: const Icon(Icons.play_circle),
                    title: Text(l10n.player),
                    subtitle: Text(l10n.playerSettingsSubtitle),
                    onTap: () =>
                        context.pushSettingsScreen(const _VideoPlaybackScreen()),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.high_quality_outlined),
                    title: Text(l10n.qualityAndDecoding),
                    subtitle: Text(l10n.qualityAndDecodingSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _QualityDecodingScreen(),
                    ),
                  ),
                ],
              ),
              _SectionHeader(l10n.settingsAudioAndSubtitlesSection),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.volume_up),
                    title: Text(l10n.audio),
                    subtitle: Text(l10n.settingsAudioPreferencesSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _AudioPreferencesScreen(),
                    ),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.subtitles),
                    title: Text(l10n.subtitles),
                    subtitle: Text(l10n.subtitlePreferencesDescription),
                    onTap: () => context.pushSettingsScreen(
                      const SubtitleSettingsScreen(),
                    ),
                  ),
                ],
              ),
              _SectionHeader(l10n.settingsSkippingAndQueueSection),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.queue_play_next),
                    title: Text(l10n.skippingAndAutoplay),
                    subtitle: Text(l10n.settingsAutomationAndQueueSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _AutomationQueueScreen(),
                    ),
                  ),
                ],
              ),
              _SectionHeader(l10n.settingsWatchTogetherSection),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.groups),
                    title: Text(l10n.syncPlay),
                    subtitle: Text(l10n.settingsSyncplaySubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _SyncPlaySettingsScreen(),
                    ),
                  ),
                ],
              ),
              if (canToggleGameBackend || usesNativeGameBackend) ...[
                _SectionHeader(l10n.games),
                adaptiveListSection(
                  children: [
                    if (canToggleGameBackend)
                      SwitchPreferenceTile(
                        preference: UserPreferences.useNativeEmulator,
                        title: l10n.useNativeEmulator,
                        subtitle: l10n.useNativeEmulatorSubtitle,
                        icon: Icons.sports_esports,
                      ),
                    if (supportsCoreDownloads && usesNativeGameBackend)
                      _TvSettingsListTile(
                        leading: const Icon(Icons.videogame_asset),
                        title: Text(l10n.emulatorCores),
                        subtitle: Text(l10n.emulatorCoresSubtitle),
                        onTap: () => context.pushSettingsScreen(
                          const EmulatorCoresScreen(),
                        ),
                      ),
                    if (usesNativeGameBackend)
                      _TvSettingsListTile(
                        leading: const Icon(Icons.sd_storage),
                        title: Text(l10n.downloadedGames),
                        subtitle: Text(l10n.downloadedGamesSubtitle),
                        onTap: () => context.pushSettingsScreen(
                          const DownloadedGamesScreen(),
                        ),
                      ),
                  ],
                ),
              ],
              // Everything left on Advanced Playback is either Android player
              // routing or mpv, so other platforms would open an empty screen.
              if (PlatformDetection.isAndroid ||
                  (!PlatformDetection.isTV &&
                      !PlatformDetection.isIOS &&
                      !PlatformDetection.isWeb)) ...[
                _SectionHeader(l10n.settingsAdvancedSection),
                adaptiveListSection(
                  children: [
                    _TvSettingsListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(l10n.advancedPlayback),
                      subtitle: Text(l10n.advancedPlaybackSubtitle),
                      onTap: () => context.pushSettingsScreen(
                        const _AdvancedOptionsScreen(),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
