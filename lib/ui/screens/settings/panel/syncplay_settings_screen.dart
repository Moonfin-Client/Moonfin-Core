part of '../settings_side_panel.dart';

class _SyncPlaySettingsScreen extends StatefulWidget {
  const _SyncPlaySettingsScreen();

  @override
  State<_SyncPlaySettingsScreen> createState() =>
      _SyncPlaySettingsScreenState();
}

class _SyncPlaySettingsScreenState extends State<_SyncPlaySettingsScreen> {
  final _syncPlayScope = FocusScopeNode(
    debugLabel: 'SyncPlaySettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  late final PreferenceBinding<double> _minDelaySpeed;
  late final PreferenceBinding<double> _maxDelaySpeed;
  late final PreferenceBinding<double> _speedDuration;
  late final PreferenceBinding<double> _minDelaySkip;
  late final PreferenceBinding<double> _extraOffset;
  late final bool _hasSyncPlay;

  @override
  void initState() {
    super.initState();
    final store = GetIt.instance<PreferenceStore>();
    _minDelaySpeed = PreferenceBinding(
      store,
      UserPreferences.syncPlayMinDelaySpeedToSync,
    );
    _maxDelaySpeed = PreferenceBinding(
      store,
      UserPreferences.syncPlayMaxDelaySpeedToSync,
    );
    _speedDuration = PreferenceBinding(
      store,
      UserPreferences.syncPlaySpeedToSyncDuration,
    );
    _minDelaySkip = PreferenceBinding(
      store,
      UserPreferences.syncPlayMinDelaySkipToSync,
    );
    _extraOffset = PreferenceBinding(
      store,
      UserPreferences.syncPlayExtraTimeOffset,
    );
    // The Start parties with setting only shows on Jellyfin once Moonbase
    // answers.
    final getIt = GetIt.instance;
    _hasSyncPlay =
        getIt.isRegistered<MediaServerClient>() &&
        getIt<MediaServerClient>().features.supportsSyncPlay;
    if (_hasSyncPlay && getIt.isRegistered<SiloWatchPartyManager>()) {
      unawaited(
        getIt<SiloWatchPartyManager>().availability().then((_) {
          if (mounted) setState(() {});
        }),
      );
    }
  }

  @override
  void dispose() {
    _syncPlayScope.dispose();
    _minDelaySpeed.dispose();
    _maxDelaySpeed.dispose();
    _speedDuration.dispose();
    _minDelaySkip.dispose();
    _extraOffset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad =
        (PlatformDetection.isTV ? 96.0 : 24.0) +
        MediaQuery.paddingOf(context).bottom;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.watchParties)),
      body: FocusScope(
        node: _syncPlayScope,
        autofocus: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.syncPlayEnabled,
                  title: l10n.settingsSyncplayEnabled,
                  subtitle: l10n.settingsSyncplayEnabledSubtitle,
                  icon: Icons.groups,
                ),
                if (offersWatchPartyChoice())
                  EnumPreferenceTile<WatchPartyServiceChoice>(
                    preference: UserPreferences.watchPartyService,
                    title: l10n.watchPartyStartWith,
                    description: l10n.watchPartyServiceNote,
                    icon: Icons.hub_outlined,
                    labelOf: (v) => switch (v) {
                      WatchPartyServiceChoice.moonbase => l10n.watchParty,
                      WatchPartyServiceChoice.syncplay => l10n.syncPlay,
                    },
                    dialogSubtitleOf: (v) => switch (v) {
                      WatchPartyServiceChoice.moonbase =>
                        l10n.watchPartyServiceMoonbaseHint,
                      WatchPartyServiceChoice.syncplay =>
                        l10n.watchPartyServiceSyncPlayHint,
                    },
                  ),
                _TvSettingsListTile(
                  leading: const Icon(Icons.group_work),
                  title: Text(l10n.settingsOpenGroups),
                  subtitle: Text(l10n.settingsOpenGroupsSubtitle),
                  // Full screen above settings, not inside its list column,
                  // and Back comes straight back here.
                  onTap: () => Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute<void>(
                      builder: (_) => watchTogetherScreen(),
                    ),
                  ),
                ),
              ],
            ),
            _SectionHeader(l10n.watchPartyDuringParty),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.watchPartyChatOverlay,
                  title: l10n.watchPartyChatOverlay,
                  subtitle: l10n.watchPartyChatOverlaySubtitle,
                  icon: Icons.chat_bubble_outline,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.watchPartyAlerts,
                  title: l10n.watchPartyAlerts,
                  subtitle: l10n.watchPartyAlertsSubtitle,
                  icon: Icons.notifications_active_outlined,
                ),
              ],
            ),
            // Only SyncPlay groups use these, and only Jellyfin has SyncPlay.
            if (_hasSyncPlay) ...[
              _SectionHeader(l10n.syncPlay),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.syncPlayEnableSyncCorrection,
                    title: l10n.settingsSyncplaySyncCorrection,
                    subtitle: l10n.settingsSyncplaySyncCorrectionSubtitle,
                    icon: Icons.sync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.syncPlayUseSpeedToSync,
                    title: l10n.settingsSyncplaySpeedToSync,
                    subtitle: l10n.settingsSyncplaySpeedToSyncSubtitle,
                    icon: Icons.speed,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.syncPlayUseSkipToSync,
                    title: l10n.settingsSyncplaySkipToSync,
                    subtitle: l10n.settingsSyncplaySkipToSyncSubtitle,
                    icon: Icons.skip_next,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.syncPlayAdvancedCorrectionEnabled,
                    title: l10n.settingsSyncplayAdvancedCorrection,
                    subtitle: l10n.settingsSyncplayAdvancedCorrectionSubtitle,
                    icon: Icons.tune,
                  ),
                  _DoubleSliderTile(
                    title: l10n.settingsSyncplayMinimumSpeedDelay,
                    icon: Icons.timer,
                    binding: _minDelaySpeed,
                    min: 0,
                    max: 5000,
                  ),
                  _DoubleSliderTile(
                    title: l10n.settingsSyncplayMaximumSpeedDelay,
                    icon: Icons.timer,
                    binding: _maxDelaySpeed,
                    min: 0,
                    max: 15000,
                  ),
                  _DoubleSliderTile(
                    title: l10n.settingsSyncplaySpeedDuration,
                    icon: Icons.schedule,
                    binding: _speedDuration,
                    min: 100,
                    max: 5000,
                  ),
                  _DoubleSliderTile(
                    title: l10n.settingsSyncplayMinimumSkipDelay,
                    icon: Icons.timer,
                    binding: _minDelaySkip,
                    min: 0,
                    max: 15000,
                  ),
                  _DoubleSliderTile(
                    title: l10n.settingsSyncplayExtraOffset,
                    icon: Icons.schedule,
                    binding: _extraOffset,
                    min: -2000,
                    max: 2000,
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
