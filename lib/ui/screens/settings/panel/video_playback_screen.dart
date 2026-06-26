part of '../settings_side_panel.dart';

class _VideoPlaybackScreen extends StatelessWidget {
  const _VideoPlaybackScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsVideoPlaybackPreferences),
      ),
      body: ListView(
        children: [
          const _SectionHeader('Media Player Behavior'),
          adaptiveListSection(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.showDescriptionOnPause,
                title: l10n.showDescriptionOnPause,
                subtitle: l10n.dimVideoShowOverview,
                icon: Icons.pause_circle_outline,
              ),
              EnumPreferenceTile<ZoomMode>(
                preference: UserPreferences.playerZoomMode,
                title: l10n.playerZoomMode,
                description: l10n.settingsPlayerZoomDescription,
                icon: Icons.zoom_out_map,
                labelOf: (v) => switch (v) {
                  ZoomMode.fit => l10n.fit,
                  ZoomMode.autoCrop => l10n.autoCrop,
                  ZoomMode.stretch => l10n.stretch,
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.trickPlayEnabled,
                title: l10n.trickPlay,
                subtitle: l10n.showPreviewThumbnailsWhenSeeking,
                icon: Icons.image_search,
              ),
              if (PlatformDetection.useDesktopUi)
                EnumPreferenceTile<DesktopScrollWheelAction>(
                  preference: UserPreferences.desktopScrollWheelAction,
                  title: l10n.settingsScrollWheelAction,
                  description: l10n.settingsScrollWheelActionDescription,
                  icon: Icons.mouse_outlined,
                  labelOf: (v) => switch (v) {
                    DesktopScrollWheelAction.off => l10n.scrollWheelActionOff,
                    DesktopScrollWheelAction.seek => l10n.scrollWheelActionSeek,
                    DesktopScrollWheelAction.volume =>
                      l10n.scrollWheelActionVolume,
                  },
                ),
              StringPickerPreferenceTile(
                preference: UserPreferences.resumeSubtractDuration,
                title: l10n.resumeRewind,
                description: l10n.settingsResumeRewindDescription,
                icon: Icons.replay,
                options: {
                  '0': l10n.disabled,
                  '5': l10n.fiveSeconds,
                  '10': l10n.tenSeconds,
                  '15': l10n.fifteenSeconds,
                  '30': l10n.thirtySeconds,
                },
              ),
              IntPickerPreferenceTile(
                preference: UserPreferences.unpauseRewindDuration,
                title: l10n.unpauseRewind,
                description: l10n.settingsUnpauseRewindDescription,
                icon: Icons.replay_circle_filled,
                options: {
                  0: l10n.disabled,
                  5000: l10n.fiveSeconds,
                  10000: l10n.tenSeconds,
                  15000: l10n.fifteenSeconds,
                  30000: l10n.thirtySeconds,
                },
              ),
              IntPickerPreferenceTile(
                preference: UserPreferences.skipBackLength,
                title: l10n.skipBackLength,
                description: l10n.settingsSkipBackLengthDescription,
                icon: Icons.fast_rewind,
                options: {
                  1000: l10n.settingsOneSecond,
                  3000: l10n.settingsThreeSeconds,
                  5000: l10n.fiveSeconds,
                  10000: l10n.tenSeconds,
                  15000: l10n.fifteenSeconds,
                  30000: l10n.thirtySeconds,
                  45000: l10n.settingsFortyFiveSeconds,
                  60000: l10n.settingsSixtySeconds,
                },
              ),
              IntPickerPreferenceTile(
                preference: UserPreferences.skipForwardLength,
                title: l10n.skipForwardLength,
                description: l10n.settingsSkipForwardLengthDescription,
                icon: Icons.fast_forward,
                options: {
                  1000: l10n.settingsOneSecond,
                  3000: l10n.settingsThreeSeconds,
                  5000: l10n.fiveSeconds,
                  10000: l10n.tenSeconds,
                  15000: l10n.fifteenSeconds,
                  30000: l10n.thirtySeconds,
                  45000: l10n.settingsFortyFiveSeconds,
                  60000: l10n.settingsSixtySeconds,
                },
              ),
              if (PlatformDetection.useMobileUi)
                SwitchPreferenceTile(
                  preference: UserPreferences.osdLockEnabled,
                  title: l10n.osdLockButton,
                  subtitle: l10n.osdLockButtonDescription,
                  icon: Icons.lock,
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
                      PlatformDetection.isTV
                          ? l10n.settingsPlaybackEngineMedia3Recommended
                          : l10n.settingsPlaybackEngineMedia3Legacy,
                    PlaybackEnginePreference.mpv =>
                      PlatformDetection.isTV
                          ? l10n.settingsPlaybackEngineMpvLegacy
                          : l10n.settingsPlaybackEngineMpvRecommended,
                  },
                ),
              if (PlatformDetection.isAndroid && PlatformDetection.isTV)
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
              if (PlatformDetection.isAndroid && PlatformDetection.isTV)
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
                      l10n.supportedOnThisDevice,
                    DolbyVisionProfile7DirectPlayBehavior.disabled =>
                      l10n.settingsDisabledPreferTranscode,
                  },
                ),
              if (!PlatformDetection.isWeb)
                SwitchPreferenceTile(
                  preference: UserPreferences.hardwareDecoding,
                  title: l10n.hardwareDecoding,
                  subtitle: l10n.hardwareDecodingSubtitle,
                  icon: Icons.memory,
                ),
              if (PlatformDetection.isAndroid && PlatformDetection.isTV)
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
              SwitchPreferenceTile(
                preference: UserPreferences.liveTvDirectPlayEnabled,
                title: l10n.settingsLiveTvDirect,
                subtitle: l10n.settingsLiveTvDirectSubtitle,
                icon: Icons.live_tv,
              ),
            ],
          ),

          _SectionHeader(l10n.transcodingLimits),
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
            ],
          ),
        ],
      ),
    );
  }
}

class _ExternalPlayerAppPickerTile extends StatefulWidget {
  const _ExternalPlayerAppPickerTile();

  @override
  State<_ExternalPlayerAppPickerTile> createState() =>
      _ExternalPlayerAppPickerTileState();
}

class _ExternalPlayerAppPickerTileState
    extends State<_ExternalPlayerAppPickerTile> {
  final _service = GetIt.instance<ExternalPlayerService>();
  late final PreferenceBinding<String> _componentBinding;
  List<ExternalPlayerApp> _players = const [];
  bool _loading = false;
  bool _pickerOpen = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    final store = GetIt.instance<PreferenceStore>();
    _componentBinding = PreferenceBinding(
      store,
      UserPreferences.externalPlayerComponentName,
    );
    unawaited(_loadPlayers());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _componentBinding.dispose();
    super.dispose();
  }

  Future<void> _loadPlayers() async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      final players = await _service.listPlayers();
      if (!mounted) return;
      setState(() {
        _players = players;
      });
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  String _selectedLabel(String component) {
    final normalized = component.trim();
    if (normalized.isEmpty) {
      return AppLocalizations.of(context).settingsAskEachTime;
    }

    for (final player in _players) {
      if (player.component == normalized) {
        return player.label;
      }
    }

    return normalized;
  }

  Future<void> _showPicker(String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    await _loadPlayers();
    try {
      if (!mounted) return;

      final normalizedCurrent = current.trim();
      final selectedIndex = _players.indexWhere(
        (player) => player.component == normalizedCurrent,
      );
      final autofocusIndex = selectedIndex >= 0 ? selectedIndex : -1;
      var picked = false;

      final result = await showFocusRestoringDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (dialogContext) => SimpleDialog(
          title: Text(AppLocalizations.of(dialogContext).externalPlayerApp),
          children: [
            TvFocusHighlight(
              builder: (_, _) => ListTile(
                autofocus: normalizedCurrent.isEmpty,
                leading: const Icon(Icons.help_outline),
                title: Text(
                  AppLocalizations.of(dialogContext).settingsAskEachTime,
                ),
                subtitle: Text(
                  AppLocalizations.of(
                    dialogContext,
                  ).externalPlayerAskEachTimeSubtitle,
                ),
                trailing: normalizedCurrent.isEmpty
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  if (picked) return;
                  picked = true;
                  Navigator.pop(dialogContext, '');
                },
              ),
            ),
            ..._players.asMap().entries.map((entry) {
              final index = entry.key;
              final player = entry.value;
              final selected = player.component == normalizedCurrent;
              return TvFocusHighlight(
                builder: (_, _) => ListTile(
                  autofocus: index == autofocusIndex,
                  leading: _ExternalPlayerAppIcon(player: player),
                  title: Text(player.label),
                  subtitle: Text(player.packageName),
                  trailing: selected ? const Icon(Icons.check) : null,
                  onTap: () {
                    if (picked) return;
                    picked = true;
                    Navigator.pop(dialogContext, player.component);
                  },
                ),
              );
            }),
          ],
        ),
      );

      if (!mounted || result == null || result == _componentBinding.value) {
        return;
      }

      _componentBinding.value = result;
    } finally {
      _pickerOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _componentBinding,
      builder: (context, component, _) {
        final label = _loading
            ? AppLocalizations.of(context).loadingInstalledPlayers
            : _selectedLabel(component);
        return Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: (_, event) {
            if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
            if (event is KeyDownEvent) {
              _showPicker(component);
            }
            return KeyEventResult.handled;
          },
          child: TvFocusHighlight(
            builder: (context, focused) => ListTile(
              focusNode: _focusNode,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              leading: buildSettingsLeadingIconShell(
                context,
                icon: const Icon(Icons.apps),
                focused: focused,
                iconColor: focused
                    ? AppColors.black.withValues(alpha: 0.54)
                    : AppColorScheme.onSurface.withValues(alpha: 0.78),
              ),
              title: DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.87)
                      : AppColorScheme.onSurface,
                ),
                child: Text(AppLocalizations.of(context).externalPlayerApp),
              ),
              subtitle: DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: 12,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
                child: Text(
                  AppLocalizations.of(context).externalPlayerAppDescription,
                ),
              ),
              isThreeLine: true,
              trailing: buildSettingsSelectionBubble(context, label, focused),
              onTap: () => _showPicker(component),
            ),
          ),
        );
      },
    );
  }
}

class _ExternalPlayerAppIcon extends StatelessWidget {
  final ExternalPlayerApp player;

  const _ExternalPlayerAppIcon({required this.player});

  @override
  Widget build(BuildContext context) {
    final bytes = player.iconPngBytes;
    if (bytes == null || bytes.isEmpty) {
      return const Icon(Icons.ondemand_video);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.memory(
        bytes,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const Icon(Icons.ondemand_video),
      ),
    );
  }
}
