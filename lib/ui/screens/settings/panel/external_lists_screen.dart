part of '../settings_side_panel.dart';

class _ExternalListsScreen extends StatefulWidget {
  const _ExternalListsScreen();

  @override
  State<_ExternalListsScreen> createState() => _ExternalListsScreenState();
}

class _ExternalListsScreenState extends State<_ExternalListsScreen> {
  final _externalListsScope = FocusScopeNode(
    debugLabel: 'ExternalListsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  final _homeSectionsFocusNode = FocusNode(
    debugLabel: 'home_sections_shortcut_button',
  );
  final _refreshFocusNode = FocusNode(
    debugLabel: 'refresh_lists_button',
  );

  bool _radarrInstalled = false;
  bool _sonarrInstalled = false;
  bool _checkingServices = true;

  @override
  void initState() {
    super.initState();
    _checkServices();
  }

  Future<void> _checkServices() async {
    try {
      final repo = GetIt.instance<SeerrRepository>();
      final radarr = await repo.getRadarrSettings();
      final sonarr = await repo.getSonarrSettings();
      if (mounted) {
        setState(() {
          _radarrInstalled = radarr.isNotEmpty;
          _sonarrInstalled = sonarr.isNotEmpty;
          _checkingServices = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _checkingServices = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _externalListsScope.dispose();
    _homeSectionsFocusNode.dispose();
    _refreshFocusNode.dispose();
    super.dispose();
  }

  Future<void> _refreshAllEnabledLists() async {
    final prefs = GetIt.instance<UserPreferences>();
    
    bool dialogDismissed = false;
    unawaited(
      showFocusRestoringDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return withCleanSettingsTypography(
            ctx,
            PopScope(
              canPop: false,
              child: const AlertDialog(
                title: Text('Refreshing Lists'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Refreshing all enabled external lists and updating caches...',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).then((_) {
        dialogDismissed = true;
      }),
    );

    try {
      final futures = <Future<void>>[];

      // Custom Enabled Rows
      final customService = GetIt.instance<CustomExternalListsService>();
      final configs = prefs.homeSectionsConfig;
      for (final config in configs) {
        if (config.pluginSource == HomeSectionPluginSource.custom && config.enabled) {
          futures.add(() async {
            try {
              final items = await customService.fetchCustomRow(config, forceRefresh: true);
              if (items.isNotEmpty) {
                await customService.saveCustomRowToCache(config, items);
              }
            } catch (e) {
              debugPrint('[RefreshAll] Failed to refresh custom row ${config.pluginSection}: $e');
            }
          }());
        }
      }

      if (futures.isNotEmpty) {
        await Future.wait(futures);
      }

      await prefs.set(
        UserPreferences.lastExternalRowsRefreshTime,
        DateTime.now().millisecondsSinceEpoch,
      );

      if (GetIt.instance.isRegistered<HomeViewModel>()) {
        GetIt.instance<HomeViewModel>().load(preserveExisting: true);
      }

      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully refreshed all enabled lists.')),
        );
      }
    } catch (e) {
      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to refresh lists: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          final syncService = GetIt.instance<PluginSyncService>();
          final tmdbAvailable = syncService.tmdbAvailable;
          final showUpcomingCalendars = !_checkingServices && (_radarrInstalled || _sonarrInstalled);

          return RequestInitialFocus(
            targetNode: PlatformDetection.isTV ? _homeSectionsFocusNode : null,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.externalLists),
              ),
              body: FocusScope(
                node: _externalListsScope,
                autofocus: true,
                child: ListView(
                  children: [
                    const _SectionHeader('Home Row Maintenance'),
                    adaptiveListSection(
                      children: [
                        _TvSettingsListTile(
                          focusNode: _homeSectionsFocusNode,
                          leading: const Icon(Icons.list),
                          title: Text(l10n.homeSections),
                          subtitle: Text(l10n.reorderToggleHomeRows),
                          onTap: () => context.pushSettingsScreen(
                            const HomeSectionsScreen(showGeneralOptions: false),
                          ),
                        ),
                        _TvSettingsListTile(
                          focusNode: _refreshFocusNode,
                          leading: const Icon(Icons.refresh),
                          title: const Text('Refresh All Enabled Lists'),
                          subtitle: const Text('Force a full update of TMDB and fully custom lists cache.'),
                          onTap: _refreshAllEnabledLists,
                        ),
                      ],
                    ),
                    const _SectionHeader('External Home Row Configurations'),
                    adaptiveListSection(
                      children: [
                        _TvSettingsListTile(
                          leading: const Icon(Icons.trending_up),
                          title: const Text('TMDB Lists'),
                          subtitle: Text(
                            tmdbAvailable
                                ? 'Configure Popular, Top Rated, and Trending TMDB lists.'
                                : 'TMDB API key must be configured in Moonbase settings to use this feature.',
                          ),
                          onTap: tmdbAvailable
                              ? () => context.pushSettingsScreen(const _TmdbListsScreen())
                              : null,
                        ),
                        if (showUpcomingCalendars)
                          _TvSettingsListTile(
                            leading: const Icon(Icons.calendar_month),
                            title: const Text('Upcoming Calendars'),
                            subtitle: const Text('Toggle Upcoming Calendars from Radarr/Sonarr.'),
                            onTap: () => context.pushSettingsScreen(const _UpcomingCalendarsScreen()),
                          ),
                        if (syncService.seerrAvailable)
                          _TvSettingsListTile(
                            leading: Image.asset(
                              'assets/icons/seerr.png',
                              width: 24,
                              height: 24,
                            ),
                            title: const Text('Seerr Lists'),
                            subtitle: const Text('Configure Seerr Discovery Rows.'),
                            onTap: () =>
                                context.pushSettingsScreen(const _SeerrListsScreen()),
                          ),
                        _TvSettingsListTile(
                          leading: const Icon(Icons.tune_outlined),
                          title: const Text('Custom Home Rows Wizard'),
                          subtitle: const Text(
                              'ADVANCED: Configure customized home rows from a variety of sources.'),
                          onTap: () => context
                              .pushSettingsScreen(const _CustomListsScreen()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TmdbListsScreen extends StatefulWidget {
  const _TmdbListsScreen();

  @override
  State<_TmdbListsScreen> createState() => _TmdbListsScreenState();
}

class _TmdbListsScreenState extends State<_TmdbListsScreen> {
  bool _isFetching = false;
  final _scope = FocusScopeNode(debugLabel: 'TmdbListsScope');
  final _firstFocusNode = FocusNode(debugLabel: 'tmdb_popular_movies');

  @override
  void dispose() {
    _scope.dispose();
    _firstFocusNode.dispose();
    super.dispose();
  }

  Future<bool> _fetchAndCacheList(HomeSectionType type, String title) async {
    return true;
  }

  void _syncSingleTmdbSectionState(HomeSectionType type, bool enabled) {
    final prefs = GetIt.instance<UserPreferences>();
    final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);

    final idx = configs.indexWhere((c) => c.type == type);
    var changed = false;
    if (idx >= 0) {
      if (configs[idx].enabled != enabled) {
        configs[idx] = configs[idx].copyWith(enabled: enabled);
        changed = true;
      }
    } else {
      configs.add(HomeSectionConfig(
        type: type,
        enabled: enabled,
        order: configs.length,
      ));
      changed = true;
    }

    if (changed) {
      prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstFocusNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('TMDB Lists'),
          ),
          body: FocusScope(
            node: _scope,
            autofocus: true,
            child: ListView(
              children: [
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      focusNode: _firstFocusNode,
                      preference: UserPreferences.tmdbPopularMoviesEnabled,
                      title: 'Popular Movies',
                      icon: Icons.movie_outlined,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbPopularMovies,
                            'Popular Movies',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbPopularMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbPopularMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTopRatedMoviesEnabled,
                      title: 'Top Rated Movies',
                      icon: Icons.star_border,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTopRatedMovies,
                            'Top Rated Movies',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTopRatedMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTopRatedMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbNowPlayingMoviesEnabled,
                      title: 'Now Playing Movies',
                      icon: Icons.play_arrow_outlined,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbNowPlayingMovies,
                            'Now Playing Movies',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbNowPlayingMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbNowPlayingMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbUpcomingMoviesEnabled,
                      title: 'Upcoming Movies',
                      icon: Icons.upcoming,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbUpcomingMovies,
                            'Upcoming Movies',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbUpcomingMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbUpcomingMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbPopularTvEnabled,
                      title: 'Popular TV',
                      icon: Icons.live_tv,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbPopularTv,
                            'Popular TV',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbPopularTvEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbPopularTv,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTopRatedTvEnabled,
                      title: 'Top Rated TV',
                      icon: Icons.live_tv,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTopRatedTv,
                            'Top Rated TV',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTopRatedTvEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTopRatedTv,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbAiringTodayTvEnabled,
                      title: 'Airing Today TV',
                      icon: Icons.calendar_today,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbAiringTodayTv,
                            'Airing Today TV',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbAiringTodayTvEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbAiringTodayTv,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbOnTheAirTvEnabled,
                      title: 'On The Air TV',
                      icon: Icons.live_tv,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbOnTheAirTv,
                            'On The Air TV',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbOnTheAirTvEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbOnTheAirTv,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTrendingMovieDailyEnabled,
                      title: 'Trending Movies (Daily)',
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTrendingMovieDaily,
                            'Trending Movies (Daily)',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTrendingMovieDailyEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTrendingMovieDaily,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTrendingMovieWeeklyEnabled,
                      title: 'Trending Movies (Weekly)',
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTrendingMovieWeekly,
                            'Trending Movies (Weekly)',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTrendingMovieWeeklyEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTrendingMovieWeekly,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTrendingTvDailyEnabled,
                      title: 'Trending TV (Daily)',
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTrendingTvDaily,
                            'Trending TV (Daily)',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTrendingTvDailyEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTrendingTvDaily,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTrendingTvWeeklyEnabled,
                      title: 'Trending TV (Weekly)',
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTrendingTvWeekly,
                            'Trending TV (Weekly)',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTrendingTvWeeklyEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTrendingTvWeekly,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.tmdbTrendingAllWeeklyEnabled,
                      title: 'Trending All (Weekly)',
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.tmdbTrendingAllWeekly,
                            'Trending All (Weekly)',
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.tmdbTrendingAllWeeklyEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleTmdbSectionState(
                          HomeSectionType.tmdbTrendingAllWeekly,
                          isEnabled,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpcomingCalendarsScreen extends StatefulWidget {
  const _UpcomingCalendarsScreen();

  @override
  State<_UpcomingCalendarsScreen> createState() => _UpcomingCalendarsScreenState();
}

class _UpcomingCalendarsScreenState extends State<_UpcomingCalendarsScreen> {
  final _scope = FocusScopeNode(debugLabel: 'UpcomingCalendarsScope');
  final _firstNode = FocusNode(debugLabel: 'radarr_calendar_enable');

  @override
  void dispose() {
    _scope.dispose();
    _firstNode.dispose();
    super.dispose();
  }

  void _syncCalendarSectionState(HomeSectionType type, bool enabled) {
    final prefs = GetIt.instance<UserPreferences>();
    final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);

    final idx = configs.indexWhere((c) => c.type == type);
    var changed = false;
    if (idx >= 0) {
      if (configs[idx].enabled != enabled) {
        configs[idx] = configs[idx].copyWith(enabled: enabled);
        changed = true;
      }
    } else {
      configs.add(HomeSectionConfig(
        type: type,
        enabled: enabled,
        order: configs.length,
      ));
      changed = true;
    }

    if (changed) {
      prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();

    final radarrEnabled = prefs.get(UserPreferences.enableRadarrCalendar);
    final sonarrEnabled = prefs.get(UserPreferences.enableSonarrCalendar);
    final calendarsCanMerge = radarrEnabled && sonarrEnabled;

    if (!calendarsCanMerge && prefs.get(UserPreferences.mergeRadarrSonarrCalendars)) {
      prefs.set(UserPreferences.mergeRadarrSonarrCalendars, false);
    }

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('Upcoming Calendars'),
          ),
          body: FocusScope(
            node: _scope,
            autofocus: true,
            child: ListView(
              children: [
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      key: const ValueKey('mergeRadarrSonarrCalendars'),
                      preference: UserPreferences.mergeRadarrSonarrCalendars,
                      title: "Merge Sonarr and Radarr Calendars?",
                      icon: Icons.merge_type,
                      enabled: calendarsCanMerge,
                      onChanged: () => setState(() {}),
                    ),
                  ],
                ),
                const _SectionHeader('Radarr'),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      key: const ValueKey('enableRadarrCalendar'),
                      focusNode: _firstNode,
                      preference: UserPreferences.enableRadarrCalendar,
                      title: "Enable Radarr's Upcoming Calendar",
                      icon: Icons.movie_outlined,
                      onChangedValue: (isEnabled) {
                        _syncCalendarSectionState(
                          HomeSectionType.radarrCalendar,
                          isEnabled,
                        );
                        setState(() {});
                      },
                    ),
                    if (radarrEnabled) ...[
                      SwitchPreferenceTile(
                        key: const ValueKey('radarrCalendarShowCinema'),
                        preference: UserPreferences.radarrCalendarShowCinema,
                        title: 'Show Upcoming Cinema Releases',
                        icon: Icons.theater_comedy,
                        onChanged: () => setState(() {}),
                      ),
                      SwitchPreferenceTile(
                        key: const ValueKey('radarrCalendarShowDigital'),
                        preference: UserPreferences.radarrCalendarShowDigital,
                        title: 'Show Upcoming Digital Releases',
                        icon: Icons.tv,
                        onChanged: () => setState(() {}),
                      ),
                      SwitchPreferenceTile(
                        key: const ValueKey('radarrCalendarShowPhysical'),
                        preference: UserPreferences.radarrCalendarShowPhysical,
                        title: 'Show Upcoming Physical Releases',
                        icon: Icons.album,
                        onChanged: () => setState(() {}),
                      ),
                      SwitchPreferenceTile(
                        key: const ValueKey('radarrCalendarShowDate'),
                        preference: UserPreferences.radarrCalendarShowDate,
                        title: 'Show Release Date on Home Screen?',
                        icon: Icons.calendar_month,
                        onChanged: () => setState(() {}),
                      ),
                    ],
                  ],
                ),
                const _SectionHeader('Sonarr'),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      key: const ValueKey('enableSonarrCalendar'),
                      preference: UserPreferences.enableSonarrCalendar,
                      title: "Enable Sonarr's Upcoming Calendar",
                      icon: Icons.live_tv,
                      onChangedValue: (isEnabled) {
                        _syncCalendarSectionState(
                          HomeSectionType.sonarrCalendar,
                          isEnabled,
                        );
                        setState(() {});
                      },
                    ),
                    if (sonarrEnabled) ...[
                      SwitchPreferenceTile(
                        key: const ValueKey('sonarrCalendarShowEpisodeInfo'),
                        preference: UserPreferences.sonarrCalendarShowEpisodeInfo,
                        title: 'Display Episode Information?',
                        icon: Icons.info_outline,
                        onChanged: () => setState(() {}),
                      ),
                      SwitchPreferenceTile(
                        key: const ValueKey('sonarrCalendarShowDate'),
                        preference: UserPreferences.sonarrCalendarShowDate,
                        title: 'Show Release Date on Home Screen?',
                        icon: Icons.calendar_month,
                        onChanged: () => setState(() {}),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SeerrListsScreen extends StatefulWidget {
  const _SeerrListsScreen();

  @override
  State<_SeerrListsScreen> createState() => _SeerrListsScreenState();
}

class _SeerrListsScreenState extends State<_SeerrListsScreen> {
  late List<SeerrRowConfig> _rows;
  final _syncService = GetIt.instance<PluginSyncService>();
  final _seerrPrefs = GetIt.instance<SeerrPreferences>();
  final _scope = FocusScopeNode(debugLabel: 'SeerrListsScope');
  final _firstFocusNode = FocusNode(debugLabel: 'seerr_display_rows');

  @override
  void initState() {
    super.initState();
    _rows = List.of(_seerrPrefs.homeRowsConfig);
  }

  @override
  void dispose() {
    _scope.dispose();
    _firstFocusNode.dispose();
    super.dispose();
  }

  void _pushPersonalizationSync() {
    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client != null) {
      _syncService.pushSettings(client);
    }
  }

  HomeSectionType? _mapSeerrRowTypeToHomeSection(SeerrRowType type) {
    return switch (type) {
      SeerrRowType.recentRequests => HomeSectionType.seerrRecentRequests,
      SeerrRowType.recentlyAdded => HomeSectionType.seerrRecentlyAdded,
      SeerrRowType.trending => HomeSectionType.seerrTrending,
      SeerrRowType.popularMovies => HomeSectionType.seerrPopularMovies,
      SeerrRowType.movieGenres => HomeSectionType.seerrMovieGenres,
      SeerrRowType.upcomingMovies => HomeSectionType.seerrUpcomingMovies,
      SeerrRowType.studios => HomeSectionType.seerrStudios,
      SeerrRowType.popularSeries => HomeSectionType.seerrPopularSeries,
      SeerrRowType.seriesGenres => HomeSectionType.seerrSeriesGenres,
      SeerrRowType.upcomingSeries => HomeSectionType.seerrUpcomingSeries,
      SeerrRowType.networks => HomeSectionType.seerrNetworks,
    };
  }

  void _saveRows() {
    _seerrPrefs.setHomeRowsConfig(_rows);

    final prefs = GetIt.instance<UserPreferences>();
    final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);
    var changed = false;
    for (final row in _rows) {
      final type = _mapSeerrRowTypeToHomeSection(row.type);
      if (type != null) {
        final idx = configs.indexWhere((c) => c.type == type);
        if (idx >= 0) {
          if (configs[idx].enabled != row.enabled) {
            configs[idx] = configs[idx].copyWith(enabled: row.enabled);
            changed = true;
          }
        } else {
          configs.add(HomeSectionConfig(
            type: type,
            enabled: row.enabled,
            order: configs.length,
          ));
          changed = true;
        }
      }
    }
    if (changed) {
      prefs.setHomeSectionsConfig(configs);
    }

    _pushPersonalizationSync();
    if (mounted) setState(() {});
  }

  String _rowLabel(SeerrRowType type, AppLocalizations l10n) => switch (type) {
    SeerrRowType.recentRequests => l10n.recentRequests,
    SeerrRowType.recentlyAdded => l10n.recentlyAdded,
    SeerrRowType.trending => l10n.trending,
    SeerrRowType.popularMovies => l10n.popularMovies,
    SeerrRowType.movieGenres => l10n.movieGenres,
    SeerrRowType.upcomingMovies => l10n.upcomingMovies,
    SeerrRowType.studios => l10n.studios,
    SeerrRowType.popularSeries => l10n.popularSeries,
    SeerrRowType.seriesGenres => l10n.seriesGenres,
    SeerrRowType.upcomingSeries => l10n.upcomingSeries,
    SeerrRowType.networks => l10n.networks,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstFocusNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('Seerr Lists'),
          ),
          body: FocusScope(
            node: _scope,
            autofocus: true,
            child: ListView(
              children: [
                const _SectionHeader('Seerr Home Page Rows'),
                adaptiveListSection(
                  children: _rows.asMap().entries.map((entry) {
                    final rowIndex = entry.key;
                    final row = entry.value;
                    return _SeerrRowSwitchTile(
                      focusNode: rowIndex == 0 ? _firstFocusNode : null,
                      title: _rowLabel(row.type, l10n),
                      value: row.enabled,
                      onChanged: (enabled) {
                        setState(() {
                          _rows[rowIndex] = row.copyWith(enabled: enabled);
                        });
                        _saveRows();
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SeerrRowSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final FocusNode? focusNode;

  const _SeerrRowSwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      enabled: true,
      builder: (context, focused) {
        final iconColor = focused && settingsTileInvertsOnFocus
            ? AppColors.black.withValues(alpha: 0.54)
            : (Theme.of(context).iconTheme.color ?? AppColorScheme.onSurface);
        final secondary = buildSettingsLeadingIconShell(
          context,
          icon: const Icon(Icons.list_alt),
          focused: focused,
          iconColor: iconColor,
        );

        return SwitchListTile.adaptive(
          focusNode: focusNode,
          secondary: secondary,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          value: value,
          onChanged: onChanged,
        );
      },
    );
  }
}

class _CustomListsScreen extends StatefulWidget {
  const _CustomListsScreen();

  @override
  State<_CustomListsScreen> createState() => _CustomListsScreenState();
}

class _CustomListsScreenState extends State<_CustomListsScreen> {
  final _scope = FocusScopeNode(debugLabel: 'CustomListsScope');
  final _addFocusNode = FocusNode(debugLabel: 'custom_add_button');
  final _syncService = GetIt.instance<PluginSyncService>();

  void _pushPersonalizationSync() {
    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client != null) {
      _syncService.pushSettings(client);
    }
  }

  List<HomeSectionConfig> _getCustomConfigs() {
    final prefs = GetIt.instance<UserPreferences>();
    return prefs.homeSectionsConfig
        .where((c) => c.isPluginDynamic && c.pluginSource == HomeSectionPluginSource.custom)
        .toList();
  }

  void _toggleConfig(HomeSectionConfig config, bool enabled) async {
    final prefs = GetIt.instance<UserPreferences>();
    final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);
    final idx = configs.indexWhere((c) => c.stableId == config.stableId);
    if (idx >= 0) {
      configs[idx] = configs[idx].copyWith(enabled: enabled);
      await prefs.setHomeSectionsConfig(configs);
      _pushPersonalizationSync();
      setState(() {});
    }
  }

  void _deleteConfig(HomeSectionConfig config) async {
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => withCleanSettingsTypography(
        ctx,
        AlertDialog(
          title: const Text('Delete Custom Row'),
          content: Text('Are you sure you want to delete "${config.pluginDisplayText}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );

    if (confirmed == true) {
      final prefs = GetIt.instance<UserPreferences>();
      final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);
      configs.removeWhere((c) => c.stableId == config.stableId);
      await prefs.setHomeSectionsConfig(configs);
      _pushPersonalizationSync();
      setState(() {});
    }
  }

  void _showAddEditDialog(HomeSectionConfig? existing) async {
    final saved = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => _AddEditCustomRowDialog(existing: existing),
    );
    if (saved == true) {
      setState(() {});
    }
  }

  String _getSourceLabel(String source) {
    switch (source) {
      case 'imdb':
        return 'IMDb';
      case 'tmdb':
        return 'TMDB';
      case 'letterboxd':
        return 'Letterboxd';
      case 'mdblist':
        return 'MDBList';
      default:
        return source.toUpperCase();
    }
  }

  String _getTypeLabel(String type, String source) {
    switch (type) {
      case 'user_list':
        if (source == 'tmdb') {
          return 'List';
        }
        if (source == 'mdblist') {
          return 'List from User ID';
        }
        return 'List from URL';
      case 'list_url':
        if (source == 'mdblist') {
          return 'List from URL';
        }
        return 'List from URL';
      case 'user_diary':
        return 'Diary';
      case 'watchlist':
        return 'Watchlist';
      case 'films':
        return 'Complete Films';
      case 'awards_events':
        return 'Awards/Events';
      case 'movie_collection':
        if (source == 'tmdb') {
          return 'Collection';
        }
        return 'Movie Collection';
      default:
        return type;
    }
  }

  @override
  void dispose() {
    _scope.dispose();
    _addFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customConfigs = _getCustomConfigs();

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _addFocusNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('Custom Home Rows Wizard'),
          ),
          body: FocusScope(
            node: _scope,
            autofocus: true,
            child: ListView(
              children: [
                adaptiveListSection(
                  children: [
                    _TvSettingsListTile(
                      focusNode: _addFocusNode,
                      leading: const Icon(Icons.add),
                      title: const Text('Add a New Custom Home Row'),
                      subtitle: const Text('Create a custom row from TMDB, Letterboxd, or MDBList.'),
                      onTap: () => _showAddEditDialog(null),
                    ),
                  ],
                ),
                if (customConfigs.isNotEmpty) ...[
                  const _SectionHeader('Saved Custom Home Rows'),
                  adaptiveListSection(
                    children: customConfigs.map((config) {
                      Map<String, dynamic> rowConfig = {};
                      try {
                        rowConfig = jsonDecode(config.pluginAdditionalData ?? '{}') as Map<String, dynamic>;
                      } catch (_) {}
                      final source = rowConfig['source'] as String? ?? 'imdb';
                      final type = rowConfig['type'] as String? ?? 'user_list';

                      return TvFocusHighlight(
                        enabled: true,
                        builder: (ctx, focused) {
                          final iconColor = focused && settingsTileInvertsOnFocus
                              ? AppColors.black.withValues(alpha: 0.54)
                              : (Theme.of(ctx).iconTheme.color ??
                                  AppColorScheme.onSurface);
                          final leadingIcon = buildSettingsLeadingIconShell(
                            ctx,
                            icon: const Icon(Icons.tune_outlined),
                            focused: focused,
                            iconColor: iconColor,
                          );

                          return SwitchListTile.adaptive(
                            secondary: leadingIcon,
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    config.pluginDisplayText ?? 'Custom Row',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit_outlined, size: 20),
                                      onPressed: () => _showAddEditDialog(config),
                                      color: focused ? Colors.black87 : AppColorScheme.onSurface.withValues(alpha: 0.7),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline, size: 20, color: Colors.redAccent),
                                      onPressed: () => _deleteConfig(config),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Source: ${_getSourceLabel(source)} | Type: ${_getTypeLabel(type, source)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: focused ? Colors.black54 : AppColorScheme.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                            value: config.enabled,
                            onChanged: (enabled) => _toggleConfig(config, enabled),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddEditCustomRowDialog extends StatefulWidget {
  final HomeSectionConfig? existing;

  const _AddEditCustomRowDialog({this.existing});

  @override
  State<_AddEditCustomRowDialog> createState() => _AddEditCustomRowDialogState();
}

class _AddEditCustomRowDialogState extends State<_AddEditCustomRowDialog> {
  final _formKey = GlobalKey<FormState>();

  late String _source;
  late String _type;
  String _sortBy = 'none';
  String _sortOrder = 'desc';
  bool _showUserRatings = false;
  bool _isValidating = false;
  bool _allowPop = false;

  final _nameController = TextEditingController();
  final _letterboxdUsernameController = TextEditingController();
  final _tmdbIdController = TextEditingController();
  final _mdblistUsernameController = TextEditingController();
  final _mdblistListNameController = TextEditingController();

  final _nameFocusNode = FocusNode(debugLabel: 'custom_row_name_field');
  final _letterboxdUsernameFocusNode = FocusNode(debugLabel: 'letterboxd_user_field');
  final _tmdbIdFocusNode = FocusNode(debugLabel: 'tmdb_id_field');
  final _mdblistUsernameFocusNode = FocusNode(debugLabel: 'mdblist_user_field');
  final _mdblistListNameFocusNode = FocusNode(debugLabel: 'mdblist_list_field');
  final _sortByFocusNode = FocusNode(debugLabel: 'custom_row_sort_by_field');
  final _sortOrderFocusNode = FocusNode(debugLabel: 'custom_row_sort_order_field');
  final _sourceFocusNode = FocusNode(debugLabel: 'custom_row_source_field');
  final _typeFocusNode = FocusNode(debugLabel: 'custom_row_type_field');
  final _showUserRatingsFocusNode = FocusNode(debugLabel: 'custom_row_show_user_ratings');

  final _syncService = GetIt.instance<PluginSyncService>();

  @override
  void initState() {
    super.initState();
    CustomTVTextField.isKeyboardVisibleNotifier.value = false;
    if (widget.existing != null) {
      _nameController.text = widget.existing!.pluginDisplayText ?? '';
      Map<String, dynamic> rowConfig = {};
      try {
        rowConfig = jsonDecode(widget.existing!.pluginAdditionalData ?? '{}') as Map<String, dynamic>;
      } catch (_) {}
      _source = rowConfig['source'] as String? ?? 'tmdb';
      _type = rowConfig['type'] as String? ?? 'user_list';
      _sortBy = rowConfig['sort_by'] as String? ?? 'none';
      _sortOrder = rowConfig['sort_order'] as String? ?? 'desc';
      _showUserRatings = rowConfig['show_user_ratings'] as bool? ?? false;
      final params = rowConfig['params'] as Map<String, dynamic>? ?? {};

      if (_source == 'imdb') {
        _source = 'tmdb';
        _type = 'user_list';
      }

      if (_source == 'letterboxd') {
        _letterboxdUsernameController.text = params['user'] as String? ?? '';
      } else if (_source == 'tmdb') {
        _tmdbIdController.text = params['id'] as String? ?? '';
      } else if (_source == 'mdblist') {
        _mdblistUsernameController.text = params['username'] as String? ?? '';
        if (_type == 'list_url') {
          final user = params['username'] as String? ?? '';
          final list = params['listname'] as String? ?? '';
          if (user.isNotEmpty && list.isNotEmpty) {
            _mdblistListNameController.text = 'https://mdblist.com/lists/$user/$list';
          } else {
            _mdblistListNameController.text = '';
          }
        } else {
          _mdblistListNameController.text = params['listname'] as String? ?? '';
        }
      }
    } else {
      _source = 'tmdb';
      _type = 'user_list';
      _sortBy = 'none';
      _sortOrder = 'desc';
    }
  }

  @override
  void dispose() {
    CustomTVTextField.isKeyboardVisibleNotifier.value = false;
    _nameController.dispose();
    _letterboxdUsernameController.dispose();
    _tmdbIdController.dispose();
    _mdblistUsernameController.dispose();
    _mdblistListNameController.dispose();

    _nameFocusNode.dispose();
    _letterboxdUsernameFocusNode.dispose();
    _tmdbIdFocusNode.dispose();
    _mdblistUsernameFocusNode.dispose();
    _mdblistListNameFocusNode.dispose();
    _sortByFocusNode.dispose();
    _sortOrderFocusNode.dispose();
    _sourceFocusNode.dispose();
    _typeFocusNode.dispose();
    _showUserRatingsFocusNode.dispose();

    super.dispose();
  }

  List<String> _getTypesForSource(String source) {
    switch (source) {
      case 'tmdb':
        return ['user_list', 'movie_collection'];
      case 'letterboxd':
        return ['user_diary'];
      case 'mdblist':
        return ['list_url', 'user_list'];
      default:
        return ['user_list'];
    }
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'user_list':
        if (_source == 'tmdb') {
          return 'List from TMDB List ID or URL';
        }
        if (_source == 'mdblist') {
          return 'List from User ID';
        }
        return 'List from URL';
      case 'list_url':
        if (_source == 'mdblist') {
          return 'List from URL';
        }
        return 'List from URL';
      case 'user_diary':
        return 'Diary';
      case 'watchlist':
        return 'Watchlist';
      case 'films':
        return 'Complete Films';
      case 'awards_events':
        return 'Awards/Events';
      case 'movie_collection':
        if (_source == 'tmdb') {
          return 'Collection from TMDB Collection ID or URL';
        }
        return 'Movie Collection';
      default:
        return type;
    }
  }

  void _dismiss(bool result) {
    setState(() => _allowPop = true);
    Navigator.pop(context, result);
  }

  void _maybeExit() async {
    final bool exit = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => withCleanSettingsTypography(
        ctx,
        AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Discard Changes?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Unsaved changes, do you want to exit the wizard?',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Yes'),
            ),
          ],
        ),
      ),
    ) ?? false;

    if (exit && mounted) {
      _dismiss(false);
    }
  }

  void _pushPersonalizationSync() {
    final client = GetIt.instance.isRegistered<MediaServerClient>()
        ? GetIt.instance<MediaServerClient>()
        : null;
    if (client != null) {
      _syncService.pushSettings(client);
    }
  }

  void _save() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final params = <String, dynamic>{};
    if (_source == 'letterboxd') {
      params['user'] = _letterboxdUsernameController.text.trim().toLowerCase();
    } else if (_source == 'tmdb') {
      var rawId = _tmdbIdController.text.trim();
      if (rawId.contains('/') || rawId.startsWith('http')) {
        if (rawId.endsWith('/')) {
          rawId = rawId.substring(0, rawId.length - 1);
        }
        final parts = rawId.split('/');
        if (parts.isNotEmpty) {
          rawId = parts.last;
        }
      }
      params['id'] = rawId;
    } else if (_source == 'mdblist') {
      if (_type == 'list_url') {
        var rawUrl = _mdblistListNameController.text.trim();
        if (rawUrl.endsWith('/')) {
          rawUrl = rawUrl.substring(0, rawUrl.length - 1);
        }
        final parts = rawUrl.split('/');
        String parsedUser = '';
        String parsedList = '';
        if (parts.length >= 2) {
          parsedList = parts.last;
          parsedUser = parts[parts.length - 2];
        }
        params['username'] = parsedUser;
        params['listname'] = parsedList;
      } else {
        params['username'] = _mdblistUsernameController.text.trim();
        params['listname'] = _mdblistListNameController.text.trim();
      }
    }

    final additionalData = jsonEncode({
      'source': _source,
      'type': _type,
      'params': params,
      'sort_by': _sortBy,
      'sort_order': _sortOrder,
      'show_user_ratings': _showUserRatings,
    });

    final prefs = GetIt.instance<UserPreferences>();
    final configs = List<HomeSectionConfig>.from(prefs.homeSectionsConfig);

    setState(() => _isValidating = true);

    final isEditing = widget.existing != null;
    final newConfig = HomeSectionConfig.pluginDynamic(
      serverId: 'custom',
      pluginSection: isEditing ? widget.existing!.pluginSection! : 'custom_row_${DateTime.now().millisecondsSinceEpoch}',
      pluginDisplayText: name,
      pluginAdditionalData: additionalData,
      pluginSource: HomeSectionPluginSource.custom,
      enabled: isEditing ? widget.existing!.enabled : true,
      order: isEditing ? widget.existing!.order : configs.length,
    );

    try {
      final customService = GetIt.instance<CustomExternalListsService>();
      final items = await customService.fetchCustomRow(newConfig);
      if (items.isEmpty) {
        throw Exception('No results returned.');
      }
    } catch (e) {
      final customService = GetIt.instance<CustomExternalListsService>();
      final url = customService.constructSourceUrl(_source, _type, params);
      setState(() => _isValidating = false);

      final errorString = e.toString()
          .replaceAll('Exception: ', '')
          .replaceAll('Constructed URL: $url. ', '')
          .replaceAll('Constructed URL: $url', '');

      showFocusRestoringDialog(
        context: context,
        builder: (ctx) => withCleanSettingsTypography(
          ctx,
          AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text(
              'Warning: Custom Row Validation Failed',
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Failed to fetch items from the custom row.',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    url,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColorScheme.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Error details: $errorString',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
      return;
    }

    setState(() => _isValidating = false);

    if (isEditing) {
      final idx = configs.indexWhere((c) => c.stableId == widget.existing!.stableId);
      if (idx >= 0) {
        configs[idx] = newConfig;
      }
    } else {
      configs.add(newConfig);
    }

    // Proactively clear row data source cache so it forces a reload of the new config
    try {
      final customService = GetIt.instance<CustomExternalListsService>();
      final file = await customService.cacheFile(newConfig);
      if (file.existsSync()) {
        await file.delete();
      }
    } catch (_) {}

    await prefs.setHomeSectionsConfig(configs);
    _pushPersonalizationSync();

    if (mounted) {
      _dismiss(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeOptions = _getTypesForSource(_source);
    if (!typeOptions.contains(_type)) {
      _type = typeOptions.first;
    }

    final prefs = GetIt.instance<UserPreferences>();
    final tmdbApiKey = prefs.get(UserPreferences.tmdbApiKey);
    final mdblistApiKey = prefs.get(UserPreferences.mdblistApiKey);

    return withCleanSettingsTypography(
      context,
      PopScope(
        canPop: _allowPop,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _maybeExit();
        },
        child: Align(
          alignment: PlatformDetection.isTV ? const Alignment(0, -0.8) : Alignment.center,
          child: ValueListenableBuilder<bool>(
            valueListenable: CustomTVTextField.isKeyboardVisibleNotifier,
            builder: (context, isKeyboardVisible, child) {
              return AlertDialog(
                backgroundColor: Colors.grey[900],
                insetPadding: PlatformDetection.isTV
                    ? EdgeInsets.fromLTRB(40, 24, 40, isKeyboardVisible ? 280 : 24)
                    : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
                title: Text(
                  widget.existing != null ? 'Edit Custom Home Row' : 'Add Custom Home Row',
                  style: const TextStyle(color: Colors.white),
                ),
                content: child!,
                actions: _isValidating
                    ? [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      ]
                    : [
                        TextButton(
                          onPressed: () => _dismiss(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: _save,
                          child: const Text('Save'),
                        ),
                      ],
              );
            },
            child: Form(
              key: _formKey,
              child: AbsorbPointer(
                absorbing: _isValidating,
            child: SizedBox(
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text('Source', style: TextStyle(color: Colors.grey, fontSize: 12)),
                   const SizedBox(height: 4),
                   ListenableBuilder(
                     listenable: _sourceFocusNode,
                     builder: (context, child) {
                       final hasFocus = _sourceFocusNode.hasFocus;
                       return Theme(
                         data: Theme.of(context).copyWith(
                           canvasColor: Colors.grey[900],
                           focusColor: AppColorScheme.accent.withValues(alpha: 0.25),
                         ),
                         child: DropdownButtonFormField<String>(
                           value: _source,
                           focusNode: _sourceFocusNode,
                           dropdownColor: Colors.grey[900],
                           style: const TextStyle(color: Colors.white, fontSize: 14),
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: hasFocus
                                 ? AppColorScheme.buttonFocused.withValues(alpha: 0.22)
                                 : Colors.black26,
                             border: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: hasFocus
                                     ? AppColorScheme.accent.withValues(alpha: 0.72)
                                     : Colors.transparent,
                                 width: 1.0,
                               ),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: hasFocus
                                     ? AppColorScheme.accent.withValues(alpha: 0.72)
                                     : Colors.transparent,
                                 width: 1.0,
                               ),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: AppColorScheme.accent.withValues(alpha: 0.72),
                                 width: 1.5,
                               ),
                             ),
                             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                           ),
                           items: const [
                             DropdownMenuItem(value: 'tmdb', child: Text('TMDB')),
                             DropdownMenuItem(value: 'letterboxd', child: Text('Letterboxd')),
                             DropdownMenuItem(value: 'mdblist', child: Text('MDBList')),
                           ],
                           onChanged: (val) {
                             if (val != null) {
                               setState(() {
                                 _source = val;
                                 _type = _getTypesForSource(val).first;
                               });
                             }
                           },
                         ),
                       );
                     },
                   ),
                     if (typeOptions.length > 1) ...[
                       const SizedBox(height: 16),
                       const Text('Type', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       const SizedBox(height: 4),
                       ListenableBuilder(
                         listenable: _typeFocusNode,
                         builder: (context, child) {
                           final hasFocus = _typeFocusNode.hasFocus;
                           return Theme(
                             data: Theme.of(context).copyWith(
                               canvasColor: Colors.grey[900],
                               focusColor: AppColorScheme.accent.withValues(alpha: 0.25),
                             ),
                             child: DropdownButtonFormField<String>(
                               value: _type,
                               focusNode: _typeFocusNode,
                               dropdownColor: Colors.grey[900],
                               style: const TextStyle(color: Colors.white, fontSize: 14),
                               decoration: InputDecoration(
                                 filled: true,
                                 fillColor: hasFocus
                                     ? AppColorScheme.buttonFocused.withValues(alpha: 0.22)
                                     : Colors.black26,
                                 border: OutlineInputBorder(
                                   borderRadius: AppRadius.circular(8),
                                   borderSide: BorderSide(
                                     color: hasFocus
                                         ? AppColorScheme.accent.withValues(alpha: 0.72)
                                         : Colors.transparent,
                                     width: 1.0,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: AppRadius.circular(8),
                                   borderSide: BorderSide(
                                     color: hasFocus
                                         ? AppColorScheme.accent.withValues(alpha: 0.72)
                                         : Colors.transparent,
                                     width: 1.0,
                                   ),
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: AppRadius.circular(8),
                                   borderSide: BorderSide(
                                     color: AppColorScheme.accent.withValues(alpha: 0.72),
                                     width: 1.5,
                                   ),
                                 ),
                                 contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                               ),
                               items: typeOptions.map((t) {
                                 return DropdownMenuItem(value: t, child: Text(_getTypeLabel(t)));
                               }).toList(),
                               onChanged: (val) {
                                 if (val != null) {
                                   setState(() {
                                     _type = val;
                                   });
                                 }
                               },
                             ),
                           );
                         },
                       ),
                     ],
                   const SizedBox(height: 16),
 
                   // Source + Type specific parameters
 
                   if (_source == 'letterboxd') ...[
                     const Text('Letterboxd Username', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     const SizedBox(height: 4),
                     _SettingsTextField(
                       controller: _letterboxdUsernameController,
                       hint: 'Username',
                       focusNode: _letterboxdUsernameFocusNode,
                     ),
                     if (tmdbApiKey.isEmpty) ...[
                       const SizedBox(height: 12),
                       const Text(
                         'WARNING: TMDB API Key must be configured in settings to resolve Letterboxd list items.',
                         style: TextStyle(color: Colors.orangeAccent, fontSize: 11, fontWeight: FontWeight.bold),
                       ),
                     ],
                   ],
 
                   if (_source == 'tmdb') ...[
                     Text(_type == 'movie_collection' ? 'TMDB Collection ID or URL' : 'TMDB List ID or URL', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                     const SizedBox(height: 4),
                     _SettingsTextField(
                       controller: _tmdbIdController,
                       hint: _type == 'movie_collection'
                           ? '12345 OR https://www.themoviedb.org/collection/12345'
                           : '12345 OR https://www.themoviedb.org/list/12345',
                       focusNode: _tmdbIdFocusNode,
                     ),
                     if (tmdbApiKey.isEmpty) ...[
                       const SizedBox(height: 12),
                       const Text(
                         'WARNING: TMDB API Key must be configured in settings to fetch TMDB lists.',
                         style: TextStyle(color: Colors.orangeAccent, fontSize: 11, fontWeight: FontWeight.bold),
                       ),
                     ],
                   ],
 
                   if (_source == 'mdblist') ...[
                     if (_type == 'list_url') ...[
                       const Text('MDBList URL', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       const SizedBox(height: 4),
                       _SettingsTextField(
                         controller: _mdblistListNameController,
                         hint: 'e.g. https://mdblist.com/lists/username/list-slug',
                         focusNode: _mdblistListNameFocusNode,
                       ),
                     ] else ...[
                       const Text('MDBList Username', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       const SizedBox(height: 4),
                       _SettingsTextField(
                         controller: _mdblistUsernameController,
                         hint: 'Username',
                         focusNode: _mdblistUsernameFocusNode,
                       ),
                       const SizedBox(height: 16),
                       const Text('List Name (slug)', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       const SizedBox(height: 4),
                       _SettingsTextField(
                         controller: _mdblistListNameController,
                         hint: 'list-name-slug',
                         focusNode: _mdblistListNameFocusNode,
                       ),
                     ],
                     if (mdblistApiKey.isEmpty) ...[
                       const SizedBox(height: 12),
                       const Text(
                         'WARNING: MDBList API Key must be configured in settings to fetch MDBList lists.',
                         style: TextStyle(color: Colors.orangeAccent, fontSize: 11, fontWeight: FontWeight.bold),
                       ),
                     ],
                   ],
 
                   const SizedBox(height: 16),
                   const Text('Sort By', style: TextStyle(color: Colors.grey, fontSize: 12)),
                   const SizedBox(height: 4),
                   ListenableBuilder(
                     listenable: _sortByFocusNode,
                     builder: (context, child) {
                       final hasFocus = _sortByFocusNode.hasFocus;
                       return Theme(
                         data: Theme.of(context).copyWith(
                           canvasColor: Colors.grey[900],
                           focusColor: AppColorScheme.accent.withValues(alpha: 0.25),
                         ),
                         child: DropdownButtonFormField<String>(
                           value: _sortBy,
                           focusNode: _sortByFocusNode,
                           dropdownColor: Colors.grey[900],
                           style: const TextStyle(color: Colors.white, fontSize: 14),
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: hasFocus
                                 ? AppColorScheme.buttonFocused.withValues(alpha: 0.22)
                                 : Colors.black26,
                             border: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: hasFocus
                                     ? AppColorScheme.accent.withValues(alpha: 0.72)
                                     : Colors.transparent,
                                 width: 1.0,
                               ),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: hasFocus
                                     ? AppColorScheme.accent.withValues(alpha: 0.72)
                                     : Colors.transparent,
                                 width: 1.0,
                               ),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: AppRadius.circular(8),
                               borderSide: BorderSide(
                                 color: AppColorScheme.accent.withValues(alpha: 0.72),
                                 width: 1.5,
                               ),
                             ),
                             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                           ),
                           items: const [
                             DropdownMenuItem(value: 'none', child: Text('Default (When Added)')),
                             DropdownMenuItem(value: 'title', child: Text('Film Name')),
                             DropdownMenuItem(value: 'popularity', child: Text('Film Popularity')),
                             DropdownMenuItem(value: 'year', child: Text('Release Date')),
                             DropdownMenuItem(value: 'rating', child: Text('Average Rating')),
                             DropdownMenuItem(value: 'shuffle', child: Text('Shuffle')),
                           ],
                           onChanged: (val) {
                             if (val != null) {
                               setState(() {
                                 _sortBy = val;
                                 if (val == 'title') {
                                   _sortOrder = 'asc';
                                 } else {
                                   _sortOrder = 'desc';
                                 }
                               });
                             }
                           },
                         ),
                       );
                     },
                   ),
                   if (_sortBy != 'none' && _sortBy != 'shuffle') ...[
                     const SizedBox(height: 16),
                     const Text('Sort Order', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     const SizedBox(height: 4),
                     ListenableBuilder(
                       listenable: _sortOrderFocusNode,
                       builder: (context, child) {
                         final hasFocus = _sortOrderFocusNode.hasFocus;
                         return Theme(
                           data: Theme.of(context).copyWith(
                             canvasColor: Colors.grey[900],
                             focusColor: AppColorScheme.accent.withValues(alpha: 0.25),
                           ),
                           child: DropdownButtonFormField<String>(
                             value: _sortOrder,
                             focusNode: _sortOrderFocusNode,
                             dropdownColor: Colors.grey[900],
                             style: const TextStyle(color: Colors.white, fontSize: 14),
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: hasFocus
                                 ? AppColorScheme.buttonFocused.withValues(alpha: 0.22)
                                 : Colors.black26,
                               border: OutlineInputBorder(
                                 borderRadius: AppRadius.circular(8),
                                 borderSide: BorderSide(
                                   color: hasFocus
                                       ? AppColorScheme.accent.withValues(alpha: 0.72)
                                       : Colors.transparent,
                                   width: 1.0,
                                 ),
                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: AppRadius.circular(8),
                                 borderSide: BorderSide(
                                   color: hasFocus
                                       ? AppColorScheme.accent.withValues(alpha: 0.72)
                                       : Colors.transparent,
                                   width: 1.0,
                                 ),
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: AppRadius.circular(8),
                                 borderSide: BorderSide(
                                   color: AppColorScheme.accent.withValues(alpha: 0.72),
                                   width: 1.5,
                                 ),
                               ),
                               contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                             ),
                             items: _sortBy == 'title'
                                 ? const [
                                     DropdownMenuItem(value: 'asc', child: Text('A to Z')),
                                     DropdownMenuItem(value: 'desc', child: Text('Z to A')),
                                   ]
                                 : (_sortBy == 'year'
                                     ? const [
                                         DropdownMenuItem(value: 'desc', child: Text('Newest First')),
                                         DropdownMenuItem(value: 'asc', child: Text('Earliest First')),
                                       ]
                                     : (_sortBy == 'popularity'
                                         ? const [
                                             DropdownMenuItem(value: 'desc', child: Text('Most Popular First')),
                                             DropdownMenuItem(value: 'asc', child: Text('Least Popular First')),
                                           ]
                                         : const [
                                             DropdownMenuItem(value: 'desc', child: Text('Highest First')),
                                             DropdownMenuItem(value: 'asc', child: Text('Lowest First')),
                                           ])),
                             onChanged: (val) {
                               if (val != null) {
                                 setState(() {
                                   _sortOrder = val;
                                 });
                               }
                             },
                           ),
                         );
                       },
                     ),
                   ],

                  (() {
                    final isUserRatingRelevant = _source == 'letterboxd';
                    if (isUserRatingRelevant) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          TvFocusHighlight(
                            enabled: true,
                            builder: (context, focused) {
                              return SwitchListTile.adaptive(
                                focusNode: _showUserRatingsFocusNode,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                title: Text(
                                  'Show User Ratings?',
                                  style: TextStyle(
                                    color: focused && settingsTileInvertsOnFocus
                                        ? AppColors.black.withValues(alpha: 0.87)
                                        : Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                value: _showUserRatings,
                                onChanged: (val) {
                                  setState(() {
                                    _showUserRatings = val;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  })(),

                  const SizedBox(height: 16),
                  const Text('Home Row Custom Name', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  _SettingsTextField(
                    controller: _nameController,
                    hint: 'Enter row name...',
                    focusNode: _nameFocusNode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ),
),
);
  }
}

class _SettingsTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FocusNode focusNode;

  const _SettingsTextField({
    required this.controller,
    required this.hint,
    required this.focusNode,
  });

  @override
  State<_SettingsTextField> createState() => _SettingsTextFieldState();
}

class _SettingsTextFieldState extends State<_SettingsTextField> {
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
    CustomTVTextField.isKeyboardVisibleNotifier.addListener(_onKeyboardVisibilityChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    CustomTVTextField.isKeyboardVisibleNotifier.removeListener(_onKeyboardVisibilityChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (widget.focusNode.hasFocus) {
      _ensureVisible();
    }
  }

  void _onKeyboardVisibilityChange() {
    if (widget.focusNode.hasFocus && CustomTVTextField.isKeyboardVisibleNotifier.value) {
      _ensureVisible();
    }
  }

  void _ensureVisible() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (!mounted) return;
      try {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          alignment: 0.5,
          curve: Curves.easeInOut,
        );
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTV = PlatformDetection.isTV;
    if (isTV) {
      return Focus(
        focusNode: widget.focusNode,
        onKeyEvent: (node, event) {
          if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
            return KeyEventResult.ignored;
          }
          final isKeyboardVisible = _tvFieldKey.currentState?.isKeyboardVisible ?? false;
          if (event.logicalKey.isBackKey) {
            if (isKeyboardVisible) {
              _tvFieldKey.currentState?.closeKeyboard();
              widget.focusNode.requestFocus();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          }
          if (event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.select) {
            if (!isKeyboardVisible) {
              _tvFieldKey.currentState?.openKeyboard();
              return KeyEventResult.handled;
            }
          }
          if (!isKeyboardVisible) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              FocusScope.of(context).nextFocus();
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              FocusScope.of(context).previousFocus();
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: ListenableBuilder(
          listenable: widget.focusNode,
          builder: (_, _) {
            final focused = widget.focusNode.hasFocus;
            return CustomTVTextField(
              key: _tvFieldKey,
              controller: widget.controller,
              isFocused: focused,
              hint: widget.hint,
              preferSystemIme: GetIt.instance<UserPreferences>().get(
                UserPreferences.preferSystemImeKeyboard,
              ),
              filled: true,
              fillColor: focused
                  ? AppColorScheme.buttonFocused.withValues(alpha: 0.22)
                  : Colors.black26,
              borderRadius: 8,
              borderColor: focused
                  ? AppColorScheme.accent.withValues(alpha: 0.72)
                  : Colors.transparent,
              focusedBorderColor: AppColorScheme.accent,
              hintStyle: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.4),
              ),
              onFieldSubmitted: (_) {
                widget.focusNode.requestFocus();
              },
            );
          },
        ),
      );
    } else {
      return TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: TextStyle(color: AppColorScheme.onSurface),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.4),
          ),
          filled: true,
          fillColor: AppColorScheme.onSurface.withValues(alpha: 0.08),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );
    }
  }
}

