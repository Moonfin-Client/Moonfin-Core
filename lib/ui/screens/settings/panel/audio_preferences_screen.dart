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

  /// The packer choice only exists on the Media3 engine on Android TV.
  /// Everywhere else the tile is hidden and the preference is inert.
  bool get _showPassthroughOutputTile =>
      PlatformDetection.isAndroid &&
      PlatformDetection.isTV &&
      _prefs.get(UserPreferences.playbackEnginePreference) ==
          PlaybackEnginePreference.media3;

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
      AudioRouteType.headphones => l10n.settingsAudioRouteHeadphones,
      AudioRouteType.other => l10n.unknown,
    };
  }

  String _joinedOrUnknown(AppLocalizations l10n, List<String> values) {
    if (values.isEmpty) {
      return l10n.unknown;
    }
    return values.join(', ');
  }

  // Media3 on Android, AetherEngine on Apple and mpv on Linux and Windows all
  // decode these on the device, so the list doesn't depend on the engine.
  static const _locallyDecodedCodecs =
      'AAC, AC3, EAC3, DTS, DTS-HD, TrueHD, FLAC';

  List<Widget> _buildCodecRows(AppLocalizations l10n) {
    final transcodeCodecs = DeviceProfileBuilder.transcodeTargetAudioCodecs(
      fallbackCodec: _prefs.get(UserPreferences.audioFallbackCodec),
      forAvFoundation: PlatformDetection.isApple || PlatformDetection.isAppleTV,
    ).map((codec) => codec == 'opus' ? 'Opus' : codec.toUpperCase());

    return <Widget>[
      _TvSettingsListTile(
        leading: const Icon(Icons.memory),
        title: Text(l10n.locallyDecodedCodecs),
        subtitle: const Text(_locallyDecodedCodecs),
      ),
      _TvSettingsListTile(
        leading: const Icon(Icons.swap_horiz),
        title: Text(l10n.transcodeTargetCodecs),
        subtitle: Text(transcodeCodecs.join(', ')),
      ),
    ];
  }

  List<Widget> _buildDetectedCapabilities(AppLocalizations l10n) {
    if (!AudioCapabilityProbe.isSupported) {
      return _buildCodecRows(l10n);
    }

    if (!PlatformDetection.hasAudioCapabilities) {
      return <Widget>[
        _TvSettingsListTile(
          leading: const Icon(Icons.hearing_disabled),
          title: Text(l10n.settingsDetectedAudioCapabilitiesUnavailable),
        ),
        ..._buildCodecRows(l10n),
      ];
    }

    final profile = _audioCapabilityProfile;
    final passthroughCodecs = <String>[
      if (profile.canPassthroughAc3) 'AC3',
      if (profile.canPassthroughEac3) 'EAC3',
      if (profile.canPassthroughDts) 'DTS',
      if (profile.canPassthroughDtsHd) 'DTS-HD',
      if (profile.canPassthroughTrueHd) 'TrueHD',
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
      ..._buildCodecRows(l10n),
      _TvSettingsListTile(
        leading: const Icon(Icons.settings_input_hdmi),
        title: Text(l10n.passthrough),
        subtitle: Text(_joinedOrUnknown(l10n, passthroughCodecs)),
      ),
    ];
  }

  String _fallbackCodecLabel(AppLocalizations l10n, AudioFallbackCodec codec) =>
      switch (codec) {
        AudioFallbackCodec.auto => l10n.settingsAudioFallbackCodecAuto,
        AudioFallbackCodec.aac => l10n.settingsAudioFallbackCodecAac,
        AudioFallbackCodec.ac3 => l10n.settingsAudioFallbackCodecAc3,
        AudioFallbackCodec.eac3 => l10n.settingsAudioFallbackCodecEac3,
        AudioFallbackCodec.mp3 => l10n.settingsAudioFallbackCodecMp3,
        AudioFallbackCodec.opus => l10n.settingsAudioFallbackCodecOpus,
        AudioFallbackCodec.flac => l10n.settingsAudioFallbackCodecFlac,
      };

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

  /// Manual mode only makes sense where the per-format toggles render.
  List<AudioPassthroughMode> get _availableModes => _showPassthroughToggles
      ? const [
          AudioPassthroughMode.auto,
          AudioPassthroughMode.manual,
          AudioPassthroughMode.disabled,
        ]
      : const [AudioPassthroughMode.auto, AudioPassthroughMode.disabled];

  Widget _buildRedetectTile() {
    return _TvSettingsListTile(
      leading: const Icon(Icons.refresh),
      title: const Text('Re-detect & apply recommended'),
      subtitle: const Text(
        'Re-run audio detection and reset to the recommended settings.',
      ),
      onTap: _redetectAndReset,
    );
  }

  Future<void> _redetectAndReset() async {
    // Retry like startup detection does: a one-shot query can race audio
    // output enumeration and return a degenerate stereo result.
    final profile = await AudioCapabilityProbe.queryWithRetry();
    // The user asked for this answer and the snackbar below names it, so it
    // lands now rather than waiting out the downgrade settle window.
    AudioCapabilityProbe.apply(profile, immediate: true);

    // Auto is right for every sink under never-transcode, so the reset just
    // hands control back to detection.
    await _prefs.setAudioPassthroughMode(AudioPassthroughMode.auto);
    await _prefs.set(UserPreferences.downmixToStereo, false);
    await _prefs.set(UserPreferences.maxAudioChannels, 0);
    await _prefs.clearPassthroughOverrides();

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
    final isManual =
        _prefs.get(UserPreferences.audioPassthroughMode) ==
        AudioPassthroughMode.manual;
    final capabilities = _audioCapabilityProfile;

    final languages = supportedLanguageOptions;
    final defaultAudioLangOptions = {
      'auto': l10n.autoServerDefault,
      ...languages,
    };
    final fallbackAudioLangOptions = {'': l10n.none, ...languages};

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
            ],
          ),
          const _SectionHeader('Audio Stream'),
          adaptiveListSection(
            children: [
              StringPickerPreferenceTile(
                preference: UserPreferences.defaultAudioLanguage,
                title: l10n.defaultAudioLanguage,
                icon: Icons.language,
                options: defaultAudioLangOptions,
              ),
              StringPickerPreferenceTile(
                preference: UserPreferences.fallbackAudioLanguage,
                title: l10n.fallbackAudioLanguage,
                icon: Icons.language,
                options: fallbackAudioLangOptions,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.preferDefaultAudioTrack,
                title: l10n.preferDefaultAudioTrack,
                subtitle: l10n.preferDefaultAudioTrackDescription,
                icon: Icons.audiotrack,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.preferAudioDescription,
                title: l10n.preferAudioDescription,
                subtitle: l10n.preferAudioDescriptionDescription,
                icon: Icons.hearing,
              ),
            ],
          ),

          if (!PlatformDetection.isWeb) ...[
            const _SectionHeader('Audio Output'),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<AudioPassthroughMode>(
                  preference: UserPreferences.audioPassthroughMode,
                  values: _availableModes,
                  title: l10n.settingsAudioPassthroughMode,
                  description: l10n.settingsAudioPassthroughModeDescription,
                  icon: Icons.surround_sound,
                  // The chip has room for the value, not the explanation, so
                  // that stays on the picker rows.
                  labelOf: (mode) => switch (mode) {
                    AudioPassthroughMode.disabled => l10n.disabled,
                    AudioPassthroughMode.auto => l10n.auto,
                    AudioPassthroughMode.manual => l10n.manual,
                  },
                  dialogLabelOf: (mode) => switch (mode) {
                    AudioPassthroughMode.disabled =>
                      l10n.settingsAudioPassthroughModeDisabled,
                    AudioPassthroughMode.auto =>
                      l10n.settingsAudioPassthroughModeAuto,
                    AudioPassthroughMode.manual =>
                      l10n.settingsAudioPassthroughModeManual,
                  },
                  onChangedValue: (mode) =>
                      _prefs.setAudioPassthroughMode(mode),
                ),
                // The IEC option packs IEC 61937 in the app instead of
                // trusting the platform packer, which is broken on some
                // devices.
                if (_showPassthroughOutputTile)
                  EnumPreferenceTile<AudioPassthroughOutput>(
                    preference: UserPreferences.audioPassthroughOutput,
                    title: l10n.settingsAudioPassthroughOutput,
                    description: _capabilitySubtitle(
                      l10n,
                      baseSubtitle:
                          l10n.settingsAudioPassthroughOutputDescription,
                      isSupported: capabilities.canIecLow,
                    ),
                    icon: Icons.settings_input_hdmi,
                    labelOf: (output) => switch (output) {
                      AudioPassthroughOutput.platform => l10n.auto,
                      AudioPassthroughOutput.iecPacker =>
                        l10n.settingsAudioPassthroughOutputIecLabel,
                    },
                    dialogLabelOf: (output) => switch (output) {
                      AudioPassthroughOutput.platform =>
                        l10n.settingsAudioPassthroughOutputPlatform,
                      AudioPassthroughOutput.iecPacker =>
                        l10n.settingsAudioPassthroughOutputIec,
                    },
                  ),
                SwitchPreferenceTile(
                  preference: UserPreferences.downmixToStereo,
                  title: l10n.downmixToStereo,
                  subtitle: l10n.settingsDownmixToStereoDescription,
                  icon: Icons.speaker,
                ),
              ],
            ),
            if (isManual && _showPassthroughToggles) ...[
              const _SectionHeader('Passthrough Settings'),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.ac3PassthroughEnabled,
                    title: l10n.ac3Passthrough,
                    subtitle: _capabilitySubtitle(
                      l10n,
                      baseSubtitle: l10n.settingsBitstreamAc3ToExternalDecoder,
                      isSupported: capabilities.canPassthroughAc3,
                    ),
                    icon: Icons.speaker,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.eac3PassthroughEnabled,
                    title: l10n.settingsAudioEac3Passthrough,
                    subtitle: _capabilitySubtitle(
                      l10n,
                      baseSubtitle: l10n.settingsAudioEac3IncludesAtmos,
                      isSupported: capabilities.canPassthroughEac3,
                    ),
                    icon: Icons.surround_sound,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.dtsCorePassthroughEnabled,
                    title: l10n.settingsAudioDtsCorePassthrough,
                    subtitle: _capabilitySubtitle(
                      l10n,
                      baseSubtitle: l10n.enableDtsPassthrough,
                      isSupported: capabilities.canPassthroughDts,
                    ),
                    icon: Icons.audiotrack,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.dtsHdPassthroughEnabled,
                    title: l10n.settingsAudioDtsHdPassthrough,
                    subtitle: _capabilitySubtitle(
                      l10n,
                      baseSubtitle: l10n.settingsAudioDtsHdIncludesDtsX,
                      isSupported: capabilities.canPassthroughDtsHd,
                    ),
                    icon: Icons.high_quality,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.trueHdPassthroughEnabled,
                    title: l10n.settingsAudioTrueHdPassthrough,
                    subtitle: _capabilitySubtitle(
                      l10n,
                      baseSubtitle: l10n.settingsAudioTrueHdIncludesAtmos,
                      isSupported: capabilities.canPassthroughTrueHd,
                    ),
                    icon: Icons.graphic_eq,
                  ),
                ],
              ),
            ],
            const _SectionHeader('Advanced'),
            adaptiveListSection(
              children: [
                IntPickerPreferenceTile(
                  preference: UserPreferences.maxAudioChannels,
                  title: l10n.settingsMaxAudioChannels,
                  description: l10n.settingsMaxAudioChannelsDescription,
                  icon: Icons.speaker_group,
                  options: <int, String>{
                    0: l10n.autoDetect,
                    1: l10n.settingsMaxAudioChannelsMono,
                    2: l10n.settingsMaxAudioChannelsStereo,
                    3: l10n.settingsMaxAudioChannels3_0,
                    4: l10n.settingsMaxAudioChannels4_0,
                    5: l10n.settingsMaxAudioChannels5_0,
                    6: l10n.settingsMaxAudioChannels5_1,
                    7: l10n.settingsMaxAudioChannels6_1,
                    8: l10n.settingsMaxAudioChannels7_1,
                  },
                  dialogOptions: <int, String>{
                    0: l10n.settingsMaxAudioChannelsAuto,
                  },
                ),
                EnumPreferenceTile<AudioFallbackCodec>(
                  preference: UserPreferences.audioFallbackCodec,
                  title: l10n.settingsAudioFallbackCodec,
                  description: l10n.settingsAudioFallbackCodecDescription,
                  icon: Icons.hearing,
                  labelOf: (v) => v == AudioFallbackCodec.auto
                      ? l10n.autoDetect
                      : _fallbackCodecLabel(l10n, v),
                  dialogLabelOf: (v) => v == AudioFallbackCodec.auto
                      ? l10n.settingsAudioFallbackCodecAuto
                      : _fallbackCodecLabel(l10n, v),
                ),
              ],
            ),
          ],

          if (!PlatformDetection.isWeb) ...[
            _SectionHeader(l10n.settingsDetectedAudioCapabilities),
            adaptiveListSection(
              children: [
                ..._buildDetectedCapabilities(l10n),
                if (AudioCapabilityProbe.isSupported) _buildRedetectTile(),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
