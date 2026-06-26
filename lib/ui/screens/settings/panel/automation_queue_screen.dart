part of '../settings_side_panel.dart';

class _AutomationQueueScreen extends StatefulWidget {
  const _AutomationQueueScreen();

  @override
  State<_AutomationQueueScreen> createState() => _AutomationQueueScreenState();
}

class _AutomationQueueScreenState extends State<_AutomationQueueScreen> {
  static const _promptSkipSegments = 'intro:askToSkip,outro:askToSkip';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextUpBehavior = _prefs.get(UserPreferences.nextUpBehavior);
    final mediaSegmentActions = _prefs.get(UserPreferences.mediaSegmentActions);
    final showNextUpOptions = nextUpBehavior != NextUpBehavior.disabled;
    final showReplaceSkipOutroWithNextUp =
        showNextUpOptions && mediaSegmentActions == _promptSkipSegments;

    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsAutomationAndQueue),
      ),
      body: ListView(
        children: [
          _SectionHeader(l10n.playbackEnhancements),
          SwitchPreferenceTile(
            preference: UserPreferences.cinemaModeEnabled,
            title: l10n.settingsCinemaMode,
            subtitle: l10n.settingsCinemaModeSubtitle,
            icon: Icons.movie_filter,
          ),
          StringPickerPreferenceTile(
            preference: UserPreferences.mediaSegmentActions,
            title: l10n.settingsSkipIntrosAndOutros,
            icon: Icons.content_cut,
            options: {
              _promptSkipSegments: l10n.settingsPromptUser,
              'intro:skip,outro:skip': l10n.settingsSkip,
              'intro:doNothing,outro:doNothing': l10n.settingsDoNothing,
            },
          ),
          if (mediaSegmentActions == _promptSkipSegments || showNextUpOptions)
            EnumPreferenceTile<MediaSegmentCountdown>(
              preference: UserPreferences.mediaSegmentCountdown,
              title: l10n.settingsMediaSegmentCountdown,
              icon: Icons.timer_outlined,
              labelOf: (v) => switch (v) {
                MediaSegmentCountdown.progressBar => l10n.settingsProgressBar,
                MediaSegmentCountdown.timer => l10n.settingsTimer,
                MediaSegmentCountdown.both => l10n.settingsBoth,
                MediaSegmentCountdown.none => l10n.settingsNone,
              },
            ),

          _SectionHeader(l10n.automaticQueuing),
          ListTile(
            leading: const Icon(Icons.queue),
            title: Text(l10n.mediaQueuing),
            subtitle: Text(l10n.alwaysOn),
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.autoplayNextEpisode,
            title: l10n.autoplayNextEpisode,
            subtitle: l10n.autoplayNextEpisodeSubtitle,
            icon: Icons.play_circle,
          ),
          EnumPreferenceTile<NextUpBehavior>(
            preference: UserPreferences.nextUpBehavior,
            title: l10n.nextUpDisplay,
            description: l10n.settingsNextUpDisplayDescription,
            icon: Icons.skip_next,
            labelOf: (v) => switch (v) {
              NextUpBehavior.extended => l10n.extended,
              NextUpBehavior.minimal => l10n.minimal,
              NextUpBehavior.disabled => l10n.disabled,
            },
          ),
          if (showNextUpOptions)
            SliderPreferenceTile(
              preference: UserPreferences.nextUpTimeout,
              title: l10n.nextUpTimeout,
              icon: Icons.timer,
              min: 0,
              max: 30000,
              divisions: 30,
              labelOf: (v) => l10n.secondsValue((v / 1000).round()),
            ),
          if (showReplaceSkipOutroWithNextUp)
            SwitchPreferenceTile(
              preference: UserPreferences.replaceSkipOutroWithNextUp,
              title: l10n.replaceSkipOutroWithNextUpDisplay,
              subtitle: l10n.replaceSkipOutroWithNextUpDisplaySubtitle,
              icon: Icons.skip_next,
            ),
          EnumPreferenceTile<StillWatchingBehavior>(
            preference: UserPreferences.stillWatchingBehavior,
            title: l10n.stillWatchingPrompt,
            description:
                'Prompt to Continue Watching after X consecutive episodes.',
            icon: Icons.visibility,
            labelOf: (v) => switch (v) {
              StillWatchingBehavior.short_ => '2 episodes',
              StillWatchingBehavior.medium => '3 episodes',
              StillWatchingBehavior.long_ => '5 episodes',
              StillWatchingBehavior.veryLong => '8 episodes',
              StillWatchingBehavior.disabled => 'Off',
            },
          ),
        ],
      ),
    );
  }
}
