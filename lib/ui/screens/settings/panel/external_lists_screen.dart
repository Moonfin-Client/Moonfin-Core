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
    if (_isFetching) return false;
    _isFetching = true;

    final progressNotifier = ValueNotifier<double>(0.0);
    var dialogDismissed = false;

    unawaited(
      showFocusRestoringDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return withCleanSettingsTypography(
            ctx,
            PopScope(
              canPop: false,
              child: AlertDialog(
                title: Text('Fetching $title'),
                content: const Column(
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
                      'Downloading list from IMDb and saving locally...',
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
      final imdbService = GetIt.instance<ImdbExternalListsService>();
      final items = await imdbService
          .fetchChart(type, limit: 250)
          .timeout(const Duration(seconds: 15));
      await imdbService.saveChartToCache(type, items);
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch $title from IMDb: $e')),
        );
      }
      return false;
    } finally {
      _isFetching = false;
      progressNotifier.dispose();
      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
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
    if (_isFetching) return false;
    _isFetching = true;

    final progressNotifier = ValueNotifier<double>(0.0);
    var dialogDismissed = false;

    unawaited(
      showFocusRestoringDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return withCleanSettingsTypography(
            ctx,
            PopScope(
              canPop: false,
              child: AlertDialog(
                title: Text('Fetching $title'),
                content: const Column(
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
                      'Downloading list from TMDB and saving locally...',
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
      final tmdbService = GetIt.instance<TmdbExternalListsService>();
      final items = await tmdbService
          .fetchChart(type, limit: 250)
          .timeout(const Duration(seconds: 15));
      await tmdbService.saveChartToCache(type, items);
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch $title from TMDB: $e')),
        );
      }
      return false;
    } finally {
      _isFetching = false;
      progressNotifier.dispose();
      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
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
