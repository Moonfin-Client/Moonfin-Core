part of '../settings_side_panel.dart';

class _ExternalListsScreen extends StatefulWidget {
  const _ExternalListsScreen();

  @override
  State<_ExternalListsScreen> createState() => _ExternalListsScreenState();
}

class _ExternalListsScreenState extends State<_ExternalListsScreen> {
  final _imdbScope = FocusScopeNode(
    debugLabel: 'ExternalListsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  final _imdbListsFocusNode = FocusNode(
    debugLabel: 'imdb_lists_button',
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
    _imdbScope.dispose();
    _imdbListsFocusNode.dispose();
    super.dispose();
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
            targetNode: PlatformDetection.isTV ? _imdbListsFocusNode : null,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.externalLists),
              ),
              body: FocusScope(
                node: _imdbScope,
                autofocus: true,
                child: ListView(
                  children: [
                    _TvSettingsListTile(
                      focusNode: _imdbListsFocusNode,
                      leading: const Icon(Icons.movie_outlined),
                      title: const Text('IMDb Lists'),
                      subtitle: const Text('Configure IMDb Top 250, Popular, and other charts.'),
                      onTap: () => context.pushSettingsScreen(const _ImdbListsScreen()),
                    ),
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
                        subtitle: const Text('Configure Seerr Discovery Rows'),
                        onTap: () =>
                            context.pushSettingsScreen(const _SeerrListsScreen()),
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

class _ImdbListsScreen extends StatefulWidget {
  const _ImdbListsScreen();

  @override
  State<_ImdbListsScreen> createState() => _ImdbListsScreenState();
}

class _ImdbListsScreenState extends State<_ImdbListsScreen> {
  bool _isFetching = false;
  final _scope = FocusScopeNode(debugLabel: 'ImdbListsScope');
  final _firstFocusNode = FocusNode(debugLabel: 'imdb_top_250_movies');

  @override
  void dispose() {
    _scope.dispose();
    _firstFocusNode.dispose();
    super.dispose();
  }

  Future<bool> _fetchAndCacheList(HomeSectionType type, String title) async {
    return true;
  }

  void _syncSingleImdbSectionState(HomeSectionType type, bool enabled) {
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
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV ? _firstFocusNode : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('IMDb Lists'),
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
                      preference: UserPreferences.imdbTop250MoviesEnabled,
                      title: l10n.imdbTop250Movies,
                      icon: Icons.movie_outlined,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbTop250Movies,
                            l10n.imdbTop250Movies,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbTop250MoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbTop250Movies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.imdbTop250TvShowsEnabled,
                      title: l10n.imdbTop250TvShows,
                      icon: Icons.live_tv,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbTop250TvShows,
                            l10n.imdbTop250TvShows,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbTop250TvShowsEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbTop250TvShows,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.imdbMostPopularMoviesEnabled,
                      title: l10n.imdbMostPopularMovies,
                      icon: Icons.trending_up,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbMostPopularMovies,
                            l10n.imdbMostPopularMovies,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbMostPopularMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbMostPopularMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.imdbMostPopularTvShowsEnabled,
                      title: l10n.imdbMostPopularTvShows,
                      icon: Icons.live_tv,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbMostPopularTvShows,
                            l10n.imdbMostPopularTvShows,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbMostPopularTvShowsEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbMostPopularTvShows,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.imdbLowestRatedMoviesEnabled,
                      title: l10n.imdbLowestRatedMovies,
                      icon: Icons.trending_down,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbLowestRatedMovies,
                            l10n.imdbLowestRatedMovies,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbLowestRatedMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbLowestRatedMovies,
                          isEnabled,
                        );
                      },
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.imdbTopEnglishMoviesEnabled,
                      title: l10n.imdbTopEnglishMovies,
                      icon: Icons.language,
                      enabled: !_isFetching,
                      onChangedValue: (isEnabled) async {
                        if (_isFetching) return;
                        if (isEnabled) {
                          final success = await _fetchAndCacheList(
                            HomeSectionType.imdbTopEnglishMovies,
                            l10n.imdbTopEnglishMovies,
                          );
                          if (!success) {
                            await prefs.set(UserPreferences.imdbTopEnglishMoviesEnabled, false);
                            setState(() {});
                            return;
                          }
                        }
                        _syncSingleImdbSectionState(
                          HomeSectionType.imdbTopEnglishMovies,
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
  late final SeerrPreferences _seerrPrefs;
  late List<SeerrRowConfig> _rows;
  final _syncService = GetIt.instance<PluginSyncService>();
  final _scope = FocusScopeNode(debugLabel: 'SeerrListsScope');
  final _firstFocusNode = FocusNode(debugLabel: 'seerr_display_rows');

  @override
  void initState() {
    super.initState();
    _seerrPrefs = GetIt.instance<SeerrPreferences>();
    _rows = List.of(_seerrPrefs.rowsConfig);
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

  void _saveRows() {
    _seerrPrefs.setRowsConfig(_rows);
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
                  children: _rows.map((row) {
                    final rowIndex = _rows.indexOf(row);
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
        final iconColor = focused
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColorScheme.onSurface,
            ),
          ),
          value: value,
          onChanged: onChanged,
        );
      },
    );
  }
}
