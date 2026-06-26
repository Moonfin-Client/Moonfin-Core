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
    final bottomPad = PlatformDetection.isTV ? 96.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.syncPlay)),
      body: FocusScope(
        node: _syncPlayScope,
        autofocus: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            const _SectionHeader('Active Sessions'),
            adaptiveListSection(
              children: [
                _TvSettingsListTile(
                  autofocus: true,
                  leading: const Icon(Icons.group_work),
                  title: Text(l10n.settingsOpenGroups),
                  subtitle: Text(l10n.settingsOpenGroupsSubtitle),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const SyncPlayScreen(),
                    ),
                  ),
                ),
              ],
            ),
            const _SectionHeader('SyncPlay Options'),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.syncPlayEnabled,
                  title: l10n.settingsSyncplayEnabled,
                  subtitle: l10n.settingsSyncplayEnabledSubtitle,
                  icon: Icons.groups,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showSyncPlayButton,
                  title: l10n.settingsSyncplayButton,
                  subtitle: l10n.settingsSyncplayButtonSubtitle,
                  icon: Icons.toggle_on,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.syncPlayAdvancedCorrectionEnabled,
                  title: l10n.settingsSyncplayAdvancedCorrection,
                  subtitle: l10n.settingsSyncplayAdvancedCorrectionSubtitle,
                  icon: Icons.tune,
                ),
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
        ),
      ),
    );
  }
}
