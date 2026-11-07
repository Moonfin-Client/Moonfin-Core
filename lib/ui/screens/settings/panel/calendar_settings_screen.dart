part of '../settings_side_panel.dart';

/// Arr titles only land in these, so other kinds of library aren't offered.
const _calendarLibraryTypes = {'movies', 'tvshows', 'mixed', ''};

/// The Calendar screen's own settings, under Integrations next to Seerr.
class _CalendarSettingsScreen extends StatefulWidget {
  const _CalendarSettingsScreen();

  @override
  State<_CalendarSettingsScreen> createState() =>
      _CalendarSettingsScreenState();
}

class _CalendarSettingsScreenState extends State<_CalendarSettingsScreen> {
  final _scope = FocusScopeNode(debugLabel: 'CalendarSettingsScope');
  final _firstNode = FocusNode(debugLabel: 'calendar_style');
  Map<String, String> _libraries = const {};

  @override
  void initState() {
    super.initState();
    unawaited(_loadLibraries());
  }

  @override
  void dispose() {
    _scope.dispose();
    _firstNode.dispose();
    super.dispose();
  }

  Future<void> _loadLibraries() async {
    try {
      final views = await GetIt.instance<UserViewsRepository>()
          .getAllViewsIncludingHidden();
      if (!mounted) return;
      setState(() {
        _libraries = {
          for (final view in views)
            if (_calendarLibraryTypes.contains(view.collectionType))
              view.id: view.name,
        };
      });
    } catch (_) {}
  }

  void _changed() {
    _pushPersonalizationSync();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    final sync = GetIt.instance<PluginSyncService>();
    final showMovies = prefs.get(UserPreferences.calendarShowMovies);
    final offerReminders =
        PlatformDetection.useMobileUi && sync.calendarRemindersAvailable;

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(context, Text(l10n.calendar)),
          body: FocusScope(
            node: _scope,
            autofocus: true,
            child: ListView(
              children: [
                _SectionHeader(l10n.calendarSettingsView),
                adaptiveListSection(
                  children: [
                    EnumPreferenceTile<CalendarStyle>(
                      focusNode: _firstNode,
                      preference: UserPreferences.calendarStyle,
                      title: l10n.calendarSettingsStyle,
                      description: l10n.calendarSettingsStyleDescription,
                      icon: Icons.view_agenda_outlined,
                      labelOf: (v) => switch (v) {
                        CalendarStyle.agenda =>
                          l10n.calendarSettingsStyleAgenda,
                        CalendarStyle.countdown =>
                          l10n.calendarSettingsStyleCountdown,
                      },
                      onChanged: _changed,
                    ),
                    EnumPreferenceTile<CalendarWeekStart>(
                      preference: UserPreferences.calendarWeekStart,
                      title: l10n.calendarSettingsWeekStart,
                      icon: Icons.date_range_outlined,
                      labelOf: (v) => switch (v) {
                        CalendarWeekStart.locale => l10n.auto,
                        CalendarWeekStart.sunday => l10n.adminDaySunday,
                        CalendarWeekStart.monday => l10n.adminDayMonday,
                      },
                      onChanged: _changed,
                    ),
                  ],
                ),
                _SectionHeader(l10n.calendarSettingsWhatShows),
                adaptiveListSection(
                  children: [
                    EnumPreferenceTile<CalendarScope>(
                      preference: UserPreferences.calendarScope,
                      title: l10n.calendarSettingsScope,
                      description: l10n.calendarSettingsScopeDescription,
                      icon: Icons.filter_list,
                      labelOf: (v) => switch (v) {
                        CalendarScope.everything =>
                          l10n.calendarSettingsScopeEverything,
                        CalendarScope.myShows =>
                          l10n.calendarSettingsScopeMyShows,
                      },
                      onChanged: _changed,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarShowEpisodes,
                      title: l10n.episodes,
                      icon: Icons.live_tv,
                      onChanged: _changed,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarShowMovies,
                      title: l10n.movies,
                      icon: Icons.movie_outlined,
                      onChanged: _changed,
                    ),
                    // Shared with the Upcoming Movies row, so the row and the
                    // screen list the same release types.
                    if (showMovies) ...[
                      SwitchPreferenceTile(
                        preference: UserPreferences.radarrCalendarShowCinema,
                        title: l10n.radarrCalendarShowCinema,
                        icon: Icons.theater_comedy,
                        onChanged: _changed,
                      ),
                      SwitchPreferenceTile(
                        preference: UserPreferences.radarrCalendarShowDigital,
                        title: l10n.radarrCalendarShowDigital,
                        icon: Icons.tv,
                        onChanged: _changed,
                      ),
                      SwitchPreferenceTile(
                        preference: UserPreferences.radarrCalendarShowPhysical,
                        title: l10n.radarrCalendarShowPhysical,
                        icon: Icons.album,
                        onChanged: _changed,
                      ),
                    ],
                    if (_libraries.isNotEmpty)
                      MultiSelectPreferenceTile(
                        preference: UserPreferences.calendarLibraryIds,
                        title: l10n.libraries,
                        icon: Icons.video_library_outlined,
                        options: _libraries,
                        emptyLabel: l10n.allLibraries,
                      ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarIncludeUnmonitored,
                      title: l10n.calendarSettingsUnmonitored,
                      subtitle: l10n.calendarSettingsUnmonitoredSubtitle,
                      icon: Icons.visibility_outlined,
                      onChanged: _changed,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarShowSpecials,
                      title: l10n.calendarSettingsSpecials,
                      subtitle: l10n.calendarSettingsSpecialsSubtitle,
                      icon: Icons.star_outline,
                      onChanged: _changed,
                    ),
                  ],
                ),
                _SectionHeader(l10n.settingsLooksSection),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarShowBadges,
                      title: l10n.calendarSettingsBadges,
                      subtitle: l10n.calendarSettingsBadgesSubtitle,
                      icon: Icons.new_releases_outlined,
                      onChanged: _changed,
                    ),
                    EnumPreferenceTile<CalendarColorBy>(
                      preference: UserPreferences.calendarColorBy,
                      title: l10n.calendarSettingsColorBy,
                      description: l10n.calendarSettingsColorByDescription,
                      icon: Icons.palette_outlined,
                      labelOf: (v) => switch (v) {
                        CalendarColorBy.type =>
                          l10n.calendarSettingsColorByType,
                        CalendarColorBy.status => l10n.status,
                      },
                      onChanged: _changed,
                    ),
                    // Only the Countdown rows have cards.
                    if (prefs.get(UserPreferences.calendarStyle) ==
                        CalendarStyle.countdown)
                      EnumPreferenceTile<CalendarImageType>(
                        preference: UserPreferences.calendarImageType,
                        title: l10n.calendarSettingsImageType,
                        description: l10n.calendarSettingsImageTypeDescription,
                        icon: Icons.image_outlined,
                        labelOf: (v) => switch (v) {
                          CalendarImageType.poster => l10n.imageTypePoster,
                          CalendarImageType.thumb => l10n.imageTypeThumbnail,
                        },
                        onChanged: _changed,
                      ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.calendarSpoilerSafe,
                      title: l10n.calendarSettingsSpoilerSafe,
                      subtitle: l10n.calendarSettingsSpoilerSafeSubtitle,
                      icon: Icons.visibility_off_outlined,
                      onChanged: _changed,
                    ),
                  ],
                ),
                _SectionHeader(l10n.calendarSettingsActions),
                adaptiveListSection(
                  children: [
                    EnumPreferenceTile<CalendarSelectAction>(
                      preference: UserPreferences.calendarSelectAction,
                      title: l10n.calendarSettingsSelectAction,
                      description: l10n.calendarSettingsSelectActionDescription,
                      icon: Icons.touch_app_outlined,
                      labelOf: (v) => switch (v) {
                        CalendarSelectAction.details =>
                          l10n.calendarSettingsSelectDetails,
                        CalendarSelectAction.play =>
                          l10n.calendarSettingsSelectPlay,
                      },
                      onChanged: _changed,
                    ),
                    if (sync.seerrAvailable)
                      SwitchPreferenceTile(
                        preference: UserPreferences.calendarRequestButton,
                        title: l10n.calendarSettingsRequestButton,
                        subtitle: seerrBrand(
                          l10n.calendarSettingsRequestButtonSubtitle,
                        ),
                        icon: Icons.add_circle_outline,
                        onChanged: _changed,
                      ),
                    if (offerReminders)
                      SwitchPreferenceTile(
                        preference: UserPreferences.calendarReminders,
                        title: l10n.calendarSettingsReminders,
                        subtitle: l10n.calendarSettingsRemindersSubtitle,
                        icon: Icons.notifications_active_outlined,
                        onChanged: _changed,
                      ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The Calendar settings page on its own, which the panel otherwise only opens
/// from inside its private navigator.
@visibleForTesting
Widget calendarSettingsScreenForTesting() => const _CalendarSettingsScreen();
