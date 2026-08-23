part of '../settings_side_panel.dart';

class _AutomationQueueScreen extends StatefulWidget {
  const _AutomationQueueScreen();

  @override
  State<_AutomationQueueScreen> createState() => _AutomationQueueScreenState();
}

class _AutomationQueueScreenState extends State<_AutomationQueueScreen> {
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

  /// The three choices for one segment type, each carrying the whole
  /// preference value.
  ///
  /// The selected action maps back to [current] verbatim rather than to a
  /// freshly serialised string, so the picker still marks it as selected
  /// when the stored value lists its types in some other order.
  Map<String, String> _segmentActionOptions(
    AppLocalizations l10n,
    String current,
    Map<MediaSegmentType, MediaSegmentAction> actions,
    MediaSegmentType type,
  ) {
    final selected = actions[type] ?? MediaSegmentAction.nothing;
    String valueFor(MediaSegmentAction action) => action == selected
        ? current
        : withMediaSegmentAction(current, type, action);
    return {
      valueFor(MediaSegmentAction.askToSkip): l10n.settingsPromptUser,
      valueFor(MediaSegmentAction.skip): l10n.settingsSkip,
      valueFor(MediaSegmentAction.nothing): l10n.settingsDoNothing,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextUpBehavior = _prefs.get(UserPreferences.nextUpBehavior);
    final mediaSegmentActions = _prefs.get(UserPreferences.mediaSegmentActions);
    final segmentActions = parseMediaSegmentActions(mediaSegmentActions);
    final promptsForAnySegment = segmentActions.values.any(
      (action) => action == MediaSegmentAction.askToSkip,
    );
    final showNextUpOptions = nextUpBehavior != NextUpBehavior.disabled;
    // Gated on the outro, since this replaces the Skip Outro button.
    final showReplaceSkipOutroWithNextUp =
        showNextUpOptions &&
        segmentActions[MediaSegmentType.outro] == MediaSegmentAction.askToSkip;

    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsAutomationAndQueue),
      ),
      body: ListView(
        children: [
          _SectionHeader(l10n.playbackEnhancements),
          adaptiveListSection(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.cinemaModeEnabled,
                title: l10n.settingsCinemaMode,
                subtitle: l10n.settingsCinemaModeSubtitle,
                icon: Icons.movie_filter,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.cinemaModeEpisodesEnabled,
                title: l10n.settingsCinemaModeEpisodes,
                subtitle: l10n.settingsCinemaModeEpisodesSubtitle,
                icon: Icons.live_tv,
              ),
              // Every type writes to the one preference, so each tile is
              // keyed on the current value. The tiles seed their notifier in
              // initState, so without the key a tile left over from the
              // previous value would keep showing it and overwrite a
              // sibling's change on the next pick.
              for (final type in configurableMediaSegmentTypes)
                StringPickerPreferenceTile(
                  key: ValueKey(
                    'segmentAction_${type.name}_$mediaSegmentActions',
                  ),
                  preference: UserPreferences.mediaSegmentActions,
                  title: l10n.settingsMediaSegmentTypeAction(type.displayName),
                  icon: Icons.content_cut,
                  options: _segmentActionOptions(
                    l10n,
                    mediaSegmentActions,
                    segmentActions,
                    type,
                  ),
                ),
              if (promptsForAnySegment || showNextUpOptions)
                EnumPreferenceTile<MediaSegmentCountdown>(
                  preference: UserPreferences.mediaSegmentCountdown,
                  title: l10n.settingsMediaSegmentCountdown,
                  icon: Icons.timer_outlined,
                  labelOf: (v) => switch (v) {
                    MediaSegmentCountdown.progressBar =>
                      l10n.settingsProgressBar,
                    MediaSegmentCountdown.timer => l10n.settingsTimer,
                    MediaSegmentCountdown.both => l10n.settingsBoth,
                    MediaSegmentCountdown.none => l10n.settingsNone,
                  },
                ),
              if (promptsForAnySegment)
                EnumPreferenceTile<MediaSegmentAutoHide>(
                  preference: UserPreferences.mediaSegmentAutoHide,
                  title: l10n.settingsSkipButtonAutoHide,
                  description: l10n.settingsSkipButtonAutoHideDescription,
                  icon: Icons.visibility_off_outlined,
                  labelOf: (v) => switch (v) {
                    MediaSegmentAutoHide.off => l10n.off,
                    _ => l10n.secondsValue(v.seconds),
                  },
                ),
            ],
          ),
          _SectionHeader(l10n.automaticQueuing),
          adaptiveListSection(
            children: [
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
        ],
      ),
    );
  }
}
