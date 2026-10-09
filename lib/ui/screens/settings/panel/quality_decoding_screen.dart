part of '../settings_side_panel.dart';

class _QualityDecodingScreen extends StatelessWidget {
  const _QualityDecodingScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAndroidTv = PlatformDetection.isAndroid && PlatformDetection.isTV;
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.qualityAndDecoding)),
      body: ListView(
        children: [
          _SectionHeader(l10n.streaming),
          adaptiveListSection(
            children: [
              StringPickerPreferenceTile(
                preference: UserPreferences.maxBitrate,
                title: l10n.maxStreamingBitrate,
                description: l10n.settingsMaxBitrateDescription,
                icon: Icons.network_check,
                options: {
                  'auto': l10n.auto,
                  '200': '200 Mbps',
                  '120': '120 Mbps',
                  '80': '80 Mbps',
                  '40': '40 Mbps',
                  '20': '20 Mbps',
                  '10': '10 Mbps',
                  '5': '5 Mbps',
                  '2': '2 Mbps',
                  '1': '1 Mbps',
                },
              ),
              EnumPreferenceTile<MaxVideoResolution>(
                preference: UserPreferences.maxVideoResolution,
                title: l10n.maxResolution,
                description: l10n.settingsMaxResolutionDescription,
                icon: Icons.high_quality,
                labelOf: (v) => switch (v) {
                  MaxVideoResolution.auto => l10n.auto,
                  MaxVideoResolution.res480p => '480p',
                  MaxVideoResolution.res720p => '720p',
                  MaxVideoResolution.res1080p => '1080p',
                  MaxVideoResolution.res2160p => '2160p (4K)',
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.liveTvDirectPlayEnabled,
                title: l10n.settingsLiveTvDirect,
                subtitle: l10n.settingsLiveTvDirectSubtitle,
                icon: Icons.live_tv,
              ),
            ],
          ),

          const _SectionHeader('Decoding & Rendering'),
          adaptiveListSection(
            children: [
              if (PlatformDetection.isAndroid)
                EnumPreferenceTile<PlaybackEnginePreference>(
                  preference: UserPreferences.playbackEnginePreference,
                  title: PlatformDetection.isTV
                      ? l10n.settingsPlaybackEngineAndroidTv
                      : l10n.settingsPlaybackEngineAndroidTv.replaceAll(
                          'Android TV',
                          'Android',
                        ),
                  description: PlatformDetection.isTV
                      ? l10n.settingsPlaybackEngineAndroidTvDescription
                      : l10n.settingsPlaybackEngineAndroidTvDescription
                            .replaceAll('Android TV', 'Android'),
                  icon: Icons.video_settings,
                  labelOf: (v) => switch (v) {
                    PlaybackEnginePreference.media3 =>
                      l10n.settingsPlaybackEngineMedia3Recommended,
                    PlaybackEnginePreference.mpv =>
                      l10n.settingsPlaybackEngineMpvLegacy,
                  },
                ),
              // Hidden on Apple TV: AetherEngine always uses VideoToolbox for
              // hardware-capable codecs and software decode otherwise, so there
              // is no user-facing toggle to honor.
              if (!PlatformDetection.isWeb && !PlatformDetection.isAppleTV)
                SwitchPreferenceTile(
                  preference: UserPreferences.hardwareDecoding,
                  title: l10n.hardwareDecoding,
                  subtitle: l10n.hardwareDecodingSubtitle,
                  icon: Icons.memory,
                ),
              if (isAndroidTv)
                SwitchPreferenceTile(
                  preference: UserPreferences.preferExoPlayerFfmpeg,
                  title: l10n.preferSoftwareDecoders,
                  subtitle: l10n.preferSoftwareDecodersSubtitle,
                  icon: Icons.memory,
                ),
              if (DisplayHdrProbe.isSupported) const _RedetectDisplayTile(),
              if (isAndroidTv)
                EnumPreferenceTile<RefreshRateSwitchingBehavior>(
                  preference: UserPreferences.refreshRateSwitchingBehavior,
                  title: l10n.refreshRateSwitching,
                  icon: Icons.speed,
                  labelOf: (v) => switch (v) {
                    RefreshRateSwitchingBehavior.disabled => l10n.disabled,
                    RefreshRateSwitchingBehavior.scaleOnTv => l10n.scaleOnTv,
                    RefreshRateSwitchingBehavior.scaleOnDevice =>
                      l10n.scaleOnDevice,
                  },
                ),
              SliderPreferenceTile(
                preference: UserPreferences.videoStartDelay,
                title: l10n.settingsVideoStartDelay,
                icon: Icons.schedule,
                min: 0,
                max: 5000,
                divisions: 20,
                labelOf: (v) => l10n.settingsMillisecondsValue(v.round()),
              ),
              if (PlatformDetection.isWindows)
                EnumPreferenceTile<AutoHdrSwitchingBehavior>(
                  preference: UserPreferences.autoHdrSwitchingBehavior,
                  title: l10n.autoHdrSwitching,
                  description: l10n.autoHdrSwitchingDescription,
                  icon: Icons.hdr_strong,
                  labelOf: (v) => switch (v) {
                    AutoHdrSwitchingBehavior.disabled => l10n.disabled,
                    AutoHdrSwitchingBehavior.whenFullscreen =>
                      l10n.whenFullscreen,
                    AutoHdrSwitchingBehavior.always => l10n.always,
                  },
                ),
              if (PlatformDetection.supportsNativeHdrWindow)
                SwitchPreferenceTile(
                  preference: UserPreferences.nativeHdrOutput,
                  title: l10n.nativeHdrOutput,
                  subtitle: l10n.nativeHdrOutputDescription,
                  icon: Icons.hdr_on,
                ),
            ],
          ),

          if (isAndroidTv) ...[
            _SectionHeader(l10n.dolbyVision),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<DolbyVisionFallbackBehavior>(
                  preference: UserPreferences.dolbyVisionFallbackBehavior,
                  title: l10n.settingsDolbyVisionFallback,
                  description: l10n.settingsDolbyVisionFallbackDescription,
                  icon: Icons.hdr_strong,
                  labelOf: (v) => switch (v) {
                    DolbyVisionFallbackBehavior.ask => l10n.settingsAskEachTime,
                    DolbyVisionFallbackBehavior.hdr10Fallback =>
                      l10n.settingsPreferHdr10Fallback,
                    DolbyVisionFallbackBehavior.transcode =>
                      l10n.settingsPreferServerTranscode,
                  },
                ),
                EnumPreferenceTile<DolbyVisionProfile7DirectPlayBehavior>(
                  preference:
                      UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
                  title: l10n.settingsDolbyVisionProfile7DirectPlay,
                  description:
                      l10n.settingsDolbyVisionProfile7DirectPlayDescription,
                  icon: Icons.movie_filter,
                  labelOf: (v) => switch (v) {
                    DolbyVisionProfile7DirectPlayBehavior.auto =>
                      l10n.settingsAutoAftkrtEnabled,
                    DolbyVisionProfile7DirectPlayBehavior.enabled =>
                      l10n.settingsEnabledOnThisDevice,
                    DolbyVisionProfile7DirectPlayBehavior.disabled =>
                      l10n.settingsDisabledPreferTranscode,
                  },
                ),
                SwitchPreferenceTile(
                  preference:
                      UserPreferences.media3MapDolbyVisionProfile7ToHevc,
                  title: l10n.mapDolbyVisionP7Title,
                  subtitle: l10n.mapDolbyVisionP7Subtitle,
                  icon: Icons.hdr_strong,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
