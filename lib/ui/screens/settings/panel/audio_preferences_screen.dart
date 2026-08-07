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
    AudioCapabilityProbe.apply(profile);

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

    final iso3ToIso1 = {
      for (final entry in kIso6391To6392.entries) entry.value: entry.key,
    };

    final supportedIso3Codes = AppLocalizations.supportedLocales.map((locale) {
      final lang1 = locale.languageCode;
      return kIso6391To6392[lang1] ?? lang1;
    }).toSet();

    final defaultAudioLangOptions = {'auto': l10n.autoServerDefault};
    final fallbackAudioLangOptions = {'': l10n.none};

    for (final entry in kIso6392Languages.entries) {
      final code = entry.key;
      if (!supportedIso3Codes.contains(code)) {
        continue;
      }
      final englishName = entry.value;
      final iso1 = iso3ToIso1[code];
      final displayName =
          (iso1 != null ? kLocaleDisplayNames[iso1] : null) ?? englishName;
      defaultAudioLangOptions[code] = displayName;
      fallbackAudioLangOptions[code] = displayName;
    }

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
                  labelOf: (mode) => switch (mode) {
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
