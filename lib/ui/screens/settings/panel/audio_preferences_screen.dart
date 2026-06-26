part of '../settings_side_panel.dart';

class _AudioPreferencesScreen extends StatefulWidget {
  const _AudioPreferencesScreen();

  @override
  State<_AudioPreferencesScreen> createState() =>
      _AudioPreferencesScreenState();
}

class _AudioPreferencesScreenState extends State<_AudioPreferencesScreen> {
  late final UserPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = GetIt.instance<UserPreferences>();
    _prefs.addListener(_onPreferencesChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPreferencesChanged);
    super.dispose();
  }

  void _onPreferencesChanged() {
    if (!mounted) return;
    setState(() {});
  }

  bool get _showPassthroughToggles {
    if (PlatformDetection.isWeb || PlatformDetection.useMobileUi) {
      return false;
    }
    return (PlatformDetection.isAndroid && PlatformDetection.isTV) ||
        PlatformDetection.isDesktop;
  }

  AudioCapabilityProfile get _audioCapabilityProfile =>
      AudioCapabilityProfile.fromMap(
        PlatformDetection.hasAudioCapabilities
            ? PlatformDetection.audioCapabilitiesSnapshot
            : null,
      );

  String _audioRouteLabel(AppLocalizations l10n, AudioRouteType routeType) {
    return switch (routeType) {
      AudioRouteType.hdmi => l10n.settingsAudioRouteHdmi,
      AudioRouteType.arc => l10n.settingsAudioRouteArc,
      AudioRouteType.earc => l10n.settingsAudioRouteEarc,
      AudioRouteType.bluetooth => l10n.settingsAudioRouteBluetooth,
      AudioRouteType.speaker => l10n.settingsAudioRouteSpeaker,
      AudioRouteType.other => l10n.unknown,
    };
  }

  String _joinedOrUnknown(AppLocalizations l10n, List<String> values) {
    if (values.isEmpty) {
      return l10n.unknown;
    }
    return values.join(', ');
  }

  List<Widget> _buildDetectedCapabilities(AppLocalizations l10n) {
    final hasSnapshot = PlatformDetection.hasAudioCapabilities;
    if (!hasSnapshot) {
      return <Widget>[
        _TvSettingsListTile(
          leading: const Icon(Icons.hearing_disabled),
          title: Text(l10n.settingsDetectedAudioCapabilitiesUnavailable),
        ),
      ];
    }

    final profile = _audioCapabilityProfile;
    final decodeCodecs = <String>[
      'AAC',
      if (profile.canDecodeAc3) 'AC3',
      if (profile.canDecodeEac3) 'EAC3',
      if (profile.canDecodeDts) 'DTS',
      if (profile.canDecodeDtsHd) 'DTS-HD',
      if (profile.canDecodeTrueHd) 'TrueHD',
      if (profile.canDecodeFlac) 'FLAC',
    ];

    final passthroughCodecs = <String>[
      if (profile.canPassthroughAc3) 'AC3',
      if (profile.canPassthroughEac3) 'EAC3',
      if (profile.canPassthroughEac3Joc) 'EAC3 JOC',
      if (profile.canPassthroughDts) 'DTS',
      if (profile.canPassthroughDtsHd) 'DTS-HD',
      if (profile.canPassthroughDtsX) 'DTS:X',
      if (profile.canPassthroughTrueHd) 'TrueHD',
      if (profile.canPassthroughTrueHdJoc) 'TrueHD JOC',
    ];

    final routeSubtitleParts = <String>[
      _audioRouteLabel(l10n, profile.activeRouteType),
      l10n.settingsAudioPcmChannels(profile.maxPcmChannels),
      if (profile.routeSupportsHdAudio) l10n.settingsAudioHdRoute,
    ];

    return <Widget>[
      _TvSettingsListTile(
        leading: const Icon(Icons.router),
        title: Text(l10n.connection),
        subtitle: Text(routeSubtitleParts.join(' • ')),
      ),
      _TvSettingsListTile(
        leading: const Icon(Icons.memory),
        title: Text(l10n.audioTranscodeTarget),
        subtitle: Text(_joinedOrUnknown(l10n, decodeCodecs)),
      ),
      _TvSettingsListTile(
        leading: const Icon(Icons.settings_input_hdmi),
        title: Text(l10n.passthrough),
        subtitle: Text(_joinedOrUnknown(l10n, passthroughCodecs)),
      ),
    ];
  }

  String _capabilitySubtitle(
    AppLocalizations l10n, {
    required String baseSubtitle,
    required bool isSupported,
  }) {
    if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) {
      return baseSubtitle;
    }

    if (!PlatformDetection.hasAudioCapabilities) {
      return baseSubtitle;
    }

    final status = isSupported
        ? l10n.supportedOnThisDevice
        : l10n.notSupportedOnThisDevice;
    return '$baseSubtitle\n${l10n.status}: $status';
  }

  List<AudioPassthroughPreset> get _availablePresets =>
      PlatformDetection.isAppleTV
      ? const [AudioPassthroughPreset.auto, AudioPassthroughPreset.stereo]
      : const [
          AudioPassthroughPreset.auto,
          AudioPassthroughPreset.surroundReceiver,
          AudioPassthroughPreset.stereo,
          AudioPassthroughPreset.advanced,
        ];

  String _audioPresetLabel(AudioPassthroughPreset preset) => switch (preset) {
    AudioPassthroughPreset.auto =>
      PlatformDetection.isAppleTV ? 'Auto (multichannel)' : 'Auto',
    AudioPassthroughPreset.surroundReceiver => 'AV receiver (Atmos / DTS:X)',
    AudioPassthroughPreset.stereo => 'Stereo',
    AudioPassthroughPreset.advanced => 'Advanced',
  };

  Widget _buildRedetectTile() {
    return _TvSettingsListTile(
      leading: const Icon(Icons.refresh),
      title: const Text('Re-detect & apply recommended'),
      subtitle: const Text(
        'Re-run audio detection and reset to the recommended settings.',
      ),
      onTap: _redetectAndApplyRecommended,
    );
  }

  Future<void> _redetectAndApplyRecommended() async {
    final profile = await AudioCapabilityProbe.query();
    AudioCapabilityProbe.apply(profile);

    final AudioPassthroughPreset preset;
    if (profile != null &&
        profile.isAvReceiverRoute &&
        profile.hasCompressedPassthroughRoute) {
      preset = AudioPassthroughPreset.surroundReceiver;
    } else if (profile != null && profile.maxPcmChannels <= 2) {
      preset = AudioPassthroughPreset.stereo;
    } else {
      preset = AudioPassthroughPreset.auto;
    }
    await _prefs.applyAudioPassthroughPreset(preset);

    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final route = profile == null
        ? l10n.unknown
        : _audioRouteLabel(l10n, profile.activeRouteType);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Audio re-detected: $route')));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAdvanced =
        _prefs.get(UserPreferences.audioPassthroughPreset) ==
        AudioPassthroughPreset.advanced;
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsAudioPreferences)),
      body: ListView(
        children: [
          _SectionHeader(l10n.mediaPlayerBehavior),
          adaptiveListSection(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.audioNightMode,
                title: l10n.nightMode,
                subtitle: l10n.compressDynamicRange,
                icon: Icons.nights_stay,
              ),
              StringPickerPreferenceTile(
                preference: UserPreferences.defaultAudioLanguage,
                title: l10n.defaultAudioLanguage,
                icon: Icons.language,
                options: {'auto': l10n.autoServerDefault, ...kIso6392Languages},
              ),
            ],
          ),

          if (!PlatformDetection.isWeb) ...[
            const _SectionHeader('Audio Output'),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<AudioPassthroughPreset>(
                  preference: UserPreferences.audioPassthroughPreset,
                  values: _availablePresets,
                  title: 'Audio Output',
                  description: PlatformDetection.isAppleTV
                      ? 'How audio is sent to your TV or receiver.'
                      : 'How audio is sent to your TV or receiver. Choose Advanced for per-codec control.',
                  icon: Icons.surround_sound,
                  labelOf: _audioPresetLabel,
                  onChangedValue: (preset) =>
                      _prefs.applyAudioPassthroughPreset(preset),
                ),
              ],
            ),
            if (isAdvanced) ...[
              const _SectionHeader('Advanced'),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<AudioOutputMode>(
                    preference: UserPreferences.audioOutputMode,
                    title: l10n.settingsAudioOutputMode,
                    description: l10n.settingsAudioOutputModeDescription,
                    icon: Icons.surround_sound,
                    labelOf: (v) => switch (v) {
                      AudioOutputMode.auto => l10n.auto,
                      AudioOutputMode.forceStereo => l10n.downmixToStereo,
                      AudioOutputMode.avrPassthrough =>
                        l10n.settingsAudioOutputModeAvrPassthrough,
                    },
                  ),
                  IntPickerPreferenceTile(
                    preference: UserPreferences.maxAudioChannels,
                    title: l10n.settingsMaxAudioChannels,
                    description: l10n.settingsMaxAudioChannelsDescription,
                    icon: Icons.speaker_group,
                    options: <int, String>{
                      0: l10n.settingsMaxAudioChannelsAuto,
                      1: l10n.settingsMaxAudioChannelsMono,
                      2: l10n.settingsMaxAudioChannelsStereo,
                      3: l10n.settingsMaxAudioChannels3_0,
                      4: l10n.settingsMaxAudioChannels4_0,
                      5: l10n.settingsMaxAudioChannels5_0,
                      6: l10n.settingsMaxAudioChannels5_1,
                      7: l10n.settingsMaxAudioChannels6_1,
                      8: l10n.settingsMaxAudioChannels7_1,
                    },
                  ),
                  EnumPreferenceTile<AudioFallbackCodec>(
                    preference: UserPreferences.audioFallbackCodec,
                    title: l10n.settingsAudioFallbackCodec,
                    description: l10n.settingsAudioFallbackCodecDescription,
                    icon: Icons.hearing,
                    labelOf: (v) => switch (v) {
                      AudioFallbackCodec.auto =>
                        l10n.settingsAudioFallbackCodecAuto,
                      AudioFallbackCodec.aac =>
                        l10n.settingsAudioFallbackCodecAac,
                      AudioFallbackCodec.ac3 =>
                        l10n.settingsAudioFallbackCodecAc3,
                      AudioFallbackCodec.eac3 =>
                        l10n.settingsAudioFallbackCodecEac3,
                      AudioFallbackCodec.truehd =>
                        l10n.settingsAudioFallbackCodecTrueHd,
                      AudioFallbackCodec.mp3 =>
                        l10n.settingsAudioFallbackCodecMp3,
                      AudioFallbackCodec.opus =>
                        l10n.settingsAudioFallbackCodecOpus,
                      AudioFallbackCodec.flac =>
                        l10n.settingsAudioFallbackCodecFlac,
                    },
                  ),
                ],
              ),

              if (_showPassthroughToggles) ...[
                const _SectionHeader('Passthrough Settings'),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference: UserPreferences.ac3PassthroughEnabled,
                      title: l10n.ac3Passthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle:
                            l10n.settingsBitstreamAc3ToExternalDecoder,
                        isSupported: PlatformDetection.supportsAc3Audio,
                      ),
                      icon: Icons.speaker,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.eac3PassthroughEnabled,
                      title: l10n.settingsAudioEac3Passthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle:
                            l10n.settingsAudioBitstreamEac3ToExternalDecoder,
                        isSupported: PlatformDetection.supportsEac3Audio,
                      ),
                      icon: Icons.surround_sound,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.eac3JocPassthroughEnabled,
                      title: l10n.settingsAudioEac3JocPassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle:
                            l10n.settingsAudioBitstreamEac3JocToExternalDecoder,
                        isSupported: PlatformDetection.supportsEac3JocAudio,
                      ),
                      icon: Icons.surround_sound,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.dtsCorePassthroughEnabled,
                      title: l10n.settingsAudioDtsCorePassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle: l10n.enableDtsPassthrough,
                        isSupported: PlatformDetection.supportsDtsAudio,
                      ),
                      icon: Icons.audiotrack,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.dtsHdPassthroughEnabled,
                      title: l10n.settingsAudioDtsHdPassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle:
                            l10n.settingsAudioBitstreamDtsHdToExternalDecoder,
                        isSupported: PlatformDetection.supportsDtsHdAudio,
                      ),
                      icon: Icons.high_quality,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.dtsXPassthroughEnabled,
                      title: l10n.settingsAudioDtsXPassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle:
                            l10n.settingsAudioBitstreamDtsXToExternalDecoder,
                        isSupported: PlatformDetection.supportsDtsXAudio,
                      ),
                      icon: Icons.high_quality,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.trueHdPassthroughEnabled,
                      title: l10n.settingsAudioTrueHdPassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle: l10n.enableTrueHdAudio,
                        isSupported: PlatformDetection.supportsTrueHdAudio,
                      ),
                      icon: Icons.graphic_eq,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.trueHdAtmosPassthroughEnabled,
                      title: l10n.settingsAudioTrueHdJocPassthrough,
                      subtitle: _capabilitySubtitle(
                        l10n,
                        baseSubtitle: l10n
                            .settingsAudioBitstreamTrueHdAtmosToExternalDecoder,
                        isSupported: PlatformDetection.supportsTrueHdJocAudio,
                      ),
                      icon: Icons.graphic_eq,
                    ),
                  ],
                ),
              ],
            ],
          ],

          if (AudioCapabilityProbe.isSupported) ...[
            _SectionHeader(l10n.settingsDetectedAudioCapabilities),
            adaptiveListSection(
              children: [
                ..._buildDetectedCapabilities(l10n),
                _buildRedetectTile(),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
