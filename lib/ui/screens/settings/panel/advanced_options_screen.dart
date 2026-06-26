part of '../settings_side_panel.dart';

class _AdvancedOptionsScreen extends StatefulWidget {
  const _AdvancedOptionsScreen();

  @override
  State<_AdvancedOptionsScreen> createState() => _AdvancedOptionsScreenState();
}

class _AdvancedOptionsScreenState extends State<_AdvancedOptionsScreen> {
  final _advancedScope = FocusScopeNode(
    debugLabel: 'AdvancedOptionsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _advancedScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.advancedOptions)),
      body: FocusScope(
        node: _advancedScope,
        autofocus: true,
        child: ListView(
          children: [
            adaptiveListSection(
              children: [
                SliderPreferenceTile(
                  preference: UserPreferences.videoStartDelay,
                  title: l10n.settingsVideoStartDelay,
                  icon: Icons.schedule,
                  min: 0,
                  max: 5000,
                  divisions: 20,
                  labelOf: (v) => l10n.settingsMillisecondsValue(v.round()),
                ),
              ],
            ),
            if (PlatformDetection.isAndroid && PlatformDetection.isTV) ...[
              _SectionHeader(l10n.playerRouting),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.preferExoPlayerFfmpeg,
                    title: l10n.preferSoftwareDecoders,
                    subtitle: l10n.preferSoftwareDecodersSubtitle,
                    icon: Icons.memory,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.media3SkipSilence,
                    title: l10n.skipSilenceTitle,
                    subtitle: l10n.skipSilenceSubtitle,
                    icon: Icons.graphic_eq,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.media3AllowExternalAudioEffects,
                    title: l10n.allowExternalAudioEffectsTitle,
                    subtitle: l10n.allowExternalAudioEffectsSubtitle,
                    icon: Icons.equalizer,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.media3TunnelingDisabled,
                    inverted: true,
                    title: l10n.enableTunnelingTitle,
                    subtitle: l10n.enableTunnelingSubtitle,
                    icon: Icons.tv,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.media3MapDolbyVisionProfile7ToHevc,
                    title: l10n.mapDolbyVisionP7Title,
                    subtitle: l10n.mapDolbyVisionP7Subtitle,
                    icon: Icons.hdr_strong,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.useExternalPlayer,
                    title: l10n.useExternalPlayer,
                    subtitle: l10n.useExternalPlayerSubtitle,
                    icon: Icons.open_in_new,
                  ),
                  const _ExternalPlayerAppPickerTile(),
                ],
              ),
            ],
            if (!PlatformDetection.isTV &&
                !PlatformDetection.isIOS &&
                !PlatformDetection.isWeb) ...[
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.customMpvConfEnabled,
                    title: l10n.enableCustomMpvConf,
                    subtitle: l10n.applyMpvConfBeforePlayback,
                    icon: Icons.tune,
                  ),
                  _EditableStringPreferenceTile(
                    preference: UserPreferences.customMpvConfPath,
                    title: l10n.customMpvConfPath,
                    icon: Icons.description,
                    hintText: l10n.pathToMpvConf,
                    pickPath: () async {
                      String? initialDir;
                      try {
                        initialDir =
                            (await getApplicationSupportDirectory()).path;
                      } catch (_) {}
                      final result = await FilePicker.pickFiles(
                        dialogTitle: l10n.selectMpvConf,
                        initialDirectory: initialDir,
                      );
                      return result?.files.single.path;
                    },
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.customMpvConfUnsafeAdvanced,
                    title: l10n.unsafeAdvancedMpvOptions,
                    subtitle: l10n.unsafeMpvOptionsDescription,
                    icon: Icons.warning_amber,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
