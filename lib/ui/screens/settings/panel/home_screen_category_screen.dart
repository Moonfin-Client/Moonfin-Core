part of '../settings_side_panel.dart';

class _HomeScreenCategoryScreen extends StatefulWidget {
  const _HomeScreenCategoryScreen();

  @override
  State<_HomeScreenCategoryScreen> createState() =>
      _HomeScreenCategoryScreenState();
}

class _HomeScreenCategoryScreenState extends State<_HomeScreenCategoryScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  bool _radarrInstalled = false;
  bool _sonarrInstalled = false;
  bool _checkingServices = true;

  @override
  void initState() {
    super.initState();
    // The calendars come from Seerr's Radarr and Sonarr servers, so there is
    // nothing to ask when Seerr isn't set up.
    if (GetIt.instance<PluginSyncService>().seerrAvailable) {
      _checkServices();
    } else {
      _checkingServices = false;
    }
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

  String _mediaTypeBadgeBehaviorLabel(
    AppLocalizations l10n,
    MediaTypeBadgeBehavior behavior,
  ) => switch (behavior) {
    MediaTypeBadgeBehavior.always => l10n.always,
    MediaTypeBadgeBehavior.mixedRowsOnly => l10n.mixedRowsOnly,
    MediaTypeBadgeBehavior.never => l10n.never,
  };

  Future<void> _refreshCustomRows() async {
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
                title: Text('Refreshing Custom Rows'),
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
                      'Refreshing your custom rows and updating their caches...',
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
      final customService = GetIt.instance<CustomExternalListsService>();
      await Future.wait([
        for (final config in _prefs.homeSectionsConfig)
          if (config.pluginSource == HomeSectionPluginSource.custom &&
              config.enabled)
            () async {
              try {
                final items = await customService.fetchCustomRow(
                  config,
                  forceRefresh: true,
                );
                if (items.isNotEmpty) {
                  await customService.saveCustomRowToCache(config, items);
                }
              } catch (e) {
                debugPrint(
                  '[RefreshCustomRows] Failed to refresh ${config.pluginSection}: $e',
                );
              }
            }(),
      ]);

      await _prefs.set(
        UserPreferences.lastExternalRowsRefreshTime,
        DateTime.now().millisecondsSinceEpoch,
      );
      _reloadHomeRows();

      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Refreshed your custom rows.')),
        );
      }
    } catch (e) {
      if (mounted && !dialogDismissed) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      if (mounted) {
        final detail = describeError(e, AppLocalizations.of(context));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to refresh custom rows: $detail')),
        );
      }
    }
  }

  String _rowsStyleLabel(AppLocalizations l10n, HomeRowsStyle style) =>
      switch (style) {
        HomeRowsStyle.v1 => l10n.homeRowsStyleClassic,
        HomeRowsStyle.v2 => l10n.homeRowsStyleModern,
      };

  void _reloadHomeRows() {
    if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
    GetIt.instance<HomeViewModel>().load(preserveExisting: true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rowsStyle = _prefs.get(UserPreferences.homeRowsStyle);
    final isMobileUi = PlatformDetection.useMobileUi;
    final isFullScreenRows =
        !isMobileUi &&
        _prefs.get(UserPreferences.fullScreenRows);
    final isInfoOverlayOn =
        !isMobileUi &&
        rowsStyle == HomeRowsStyle.v1 &&
        _prefs.get(UserPreferences.homeRowInfoOverlay);
    final isPaddingEnabled = !isFullScreenRows && !isInfoOverlayOn;
    final syncService = GetIt.instance<PluginSyncService>();
    final pluginAvailable = syncService.pluginAvailable;
    final seerrAvailable = syncService.seerrAvailable;
    final tmdbAvailable = syncService.tmdbAvailable;
    final showUpcomingCalendars =
        seerrAvailable &&
        !_checkingServices &&
        (_radarrInstalled || _sonarrInstalled);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.homeScreen)),
      body: ListView(
        children: [
          _SectionHeader(l10n.settingsContentsSection),
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                autofocus: true,
                leading: const Icon(Icons.list),
                title: Text(l10n.homeRows),
                subtitle: Text(l10n.homeRowsSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const HomeSectionsScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.tune),
                title: Text(l10n.rowOptions),
                subtitle: Text(l10n.rowOptionsSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const HomeRowTogglesScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.featured_play_list),
                title: Text(l10n.mediaBar),
                subtitle: Text(l10n.featuredContentAppearance),
                onTap: () =>
                    context.pushSettingsScreen(const MediaBarSettingsScreen()),
              ),
            ],
          ),

          _SectionHeader(l10n.settingsLooksSection),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<HomeRowsStyle>(
                preference: UserPreferences.homeRowsStyle,
                title: l10n.rowsType,
                description: l10n.rowsTypeDescription,
                icon: Icons.view_carousel,
                labelOf: (style) => _rowsStyleLabel(l10n, style),
                onChanged: () {
                  _pushPersonalizationSync();
                  _reloadHomeRows();
                  if (!mounted) return;
                  setState(() {});
                },
              ),
              if (rowsStyle == HomeRowsStyle.v2)
                SwitchPreferenceTile(
                  preference: UserPreferences.modernCardsOnMyMediaRow,
                  title: l10n.modernCardsOnMyMediaRow,
                  subtitle: l10n.modernCardsOnMyMediaRowDescription,
                  icon: Icons.photo_library_outlined,
                  onChanged: () {
                    _pushPersonalizationSync();
                    _reloadHomeRows();
                    if (!mounted) return;
                    setState(() {});
                  },
                ),
              if (rowsStyle == HomeRowsStyle.v2 && !isMobileUi) ...[
                EnumPreferenceTile<ModernCardTransitionSpeed>(
                  preference: UserPreferences.modernCardTransitionSpeed,
                  title: l10n.modernCardsTransitionSpeed,
                  description: l10n.modernCardsTransitionSpeedSubtitle,
                  icon: Icons.auto_awesome_motion_outlined,
                  labelOf: (v) => switch (v) {
                    ModernCardTransitionSpeed.extraSlow =>
                      l10n.animationSpeedExtraSlow,
                    ModernCardTransitionSpeed.slow => l10n.animationSpeedSlow,
                    ModernCardTransitionSpeed.medium =>
                      l10n.animationSpeedMedium,
                    ModernCardTransitionSpeed.fast => l10n.animationSpeedFast,
                    ModernCardTransitionSpeed.off => l10n.animationSpeedOff,
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.delayCardExpansionOnRapidScroll,
                  title: l10n.delayCardExpansionOnRapidScroll,
                  subtitle: l10n.delayCardExpansionOnRapidScrollSubtitle,
                  icon: Icons.hourglass_empty_rounded,
                ),
              ],
              SliderPreferenceTile(
                preference: rowsStyle == HomeRowsStyle.v2
                    ? UserPreferences.modernHomeRowsPadding
                    : UserPreferences.classicHomeRowsPadding,
                title: l10n.homeRowsPadding,
                description: l10n.homeRowsPaddingDescription,
                icon: Icons.unfold_more,
                min: rowsStyle == HomeRowsStyle.v2 ? 360 : 10,
                max: rowsStyle == HomeRowsStyle.v2 ? 560 : 130,
                divisions: rowsStyle == HomeRowsStyle.v2 ? 10 : 6,
                enabled: isPaddingEnabled,
                onChangeEnd: _pushPersonalizationSync,
              ),
              if (!PlatformDetection.useMobileUi)
                SwitchPreferenceTile(
                  preference: UserPreferences.fullScreenRows,
                  title: l10n.fullScreenRows,
                  subtitle: l10n.fullScreenRowsDescription,
                  icon: Icons.image_aspect_ratio,
                  onChanged: () {
                    _pushPersonalizationSync();
                    if (!mounted) return;
                    setState(() {});
                  },
                ),
              EnumPreferenceTile<PosterSize>(
                preference: UserPreferences.posterSize,
                title: l10n.cardSize,
                icon: Icons.photo_size_select_large,
                labelOf: (v) => switch (v) {
                  PosterSize.small => l10n.small,
                  PosterSize.medium => l10n.medium,
                  PosterSize.large => l10n.large,
                  PosterSize.extraLarge => l10n.extraLarge,
                },
                onChanged: _pushPersonalizationSync,
              ),
              if (rowsStyle == HomeRowsStyle.v1)
                _TvSettingsListTile(
                  leading: const Icon(Icons.image_outlined),
                  title: Text(l10n.imageTypePerRow),
                  subtitle: Text(l10n.configureImageTypeForEachRow),
                  onTap: () => context.pushSettingsScreen(
                    const HomeRowsImageTypeScreen(),
                  ),
                ),
              SwitchPreferenceTile(
                preference: UserPreferences.seriesThumbnailsEnabled,
                title: l10n.seriesThumbnails,
                subtitle: l10n.seriesThumbnailsDescription,
                icon: Icons.image_aspect_ratio,
                onChanged: _pushPersonalizationSync,
              ),
              if (rowsStyle == HomeRowsStyle.v1 && !isMobileUi)
                SwitchPreferenceTile(
                  preference: UserPreferences.homeRowInfoOverlay,
                  title: l10n.homeRowInfoOverlay,
                  subtitle: l10n.showTitleMetadataOnHomeRows,
                  icon: Icons.info_outline,
                  onChanged: () {
                    _pushPersonalizationSync();
                    if (!mounted) return;
                    setState(() {});
                  },
                ),
              SwitchPreferenceTile(
                preference: UserPreferences.hideHomeMediaDescription,
                title: l10n.hideHomeMediaDescription,
                subtitle: l10n.hideHomeMediaDescriptionSubtitle,
                icon: Icons.description_outlined,
                onChanged: _pushPersonalizationSync,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.episodePreviewEnabled,
                title: l10n.mediaPreview,
                subtitle: l10n.mediaPreviewDescription,
                icon: Icons.ondemand_video,
                onChanged: _pushPersonalizationSync,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.previewAudioEnabled,
                title: l10n.previewAudio,
                subtitle: l10n.enablePreviewAudio,
                icon: Icons.volume_up,
                onChanged: _pushPersonalizationSync,
              ),
            ],
          ),

          // Every source here needs the Moonbase plugin. Seerr's rows and the
          // Radarr and Sonarr calendars also need Seerr.
          if (pluginAvailable) ...[
            _SectionHeader(l10n.externalSources),
            adaptiveListSection(
              children: [
                _TvSettingsListTile(
                  leading: const Icon(Icons.movie_outlined),
                  title: const Text('IMDb Lists'),
                  subtitle: const Text(
                    'Configure IMDb Top 250, Popular, and other charts.',
                  ),
                  onTap: () =>
                      context.pushSettingsScreen(const _ImdbListsScreen()),
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
                _TvSettingsListTile(
                  leading: const Icon(Icons.celebration_outlined),
                  title: Text(l10n.seasonalRow),
                  subtitle: Text(l10n.seasonalRowDescription),
                  onTap: () =>
                      context.pushSettingsScreen(const _SeasonalRowScreen()),
                ),
                if (showUpcomingCalendars)
                  _TvSettingsListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Upcoming Calendars'),
                    subtitle: const Text(
                      'Toggle Upcoming Calendars from Radarr/Sonarr.',
                    ),
                    onTap: () => context.pushSettingsScreen(
                      const _UpcomingCalendarsScreen(),
                    ),
                  ),
                if (seerrAvailable)
                  _TvSettingsListTile(
                    leading: Image.asset(
                      'assets/icons/seerr.png',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text('Seerr Rows'),
                    subtitle: const Text('Configure Seerr Discovery Rows.'),
                    onTap: () =>
                        context.pushSettingsScreen(const _SeerrListsScreen()),
                  ),
                _TvSettingsListTile(
                  leading: const Icon(Icons.tune_outlined),
                  title: const Text('Custom Rows'),
                  subtitle: const Text(
                    'ADVANCED: Configure customized home rows from a variety of sources.',
                  ),
                  onTap: () =>
                      context.pushSettingsScreen(const _CustomListsScreen()),
                ),
                EnumPreferenceTile<MediaTypeBadgeBehavior>(
                  preference: UserPreferences.mediaTypeBadgeBehavior,
                  title: 'Media type badges',
                  description:
                      'Show MOVIE / SERIES labels on external home-row cards',
                  icon: Icons.info_outline,
                  labelOf: (behavior) =>
                      _mediaTypeBadgeBehaviorLabel(l10n, behavior),
                  onChanged: () {
                    if (!mounted) return;
                    setState(() {});
                  },
                ),
                _TvSettingsListTile(
                  leading: const Icon(Icons.refresh),
                  title: const Text('Refresh Custom Rows'),
                  subtitle: const Text(
                    'Force a full update of the custom row caches.',
                  ),
                  onTap: _refreshCustomRows,
                ),
              ],
            ),
          ],

          if (PlatformDetection.isAppleTV) ...[
            _SectionHeader(l10n.appleTvHomeScreen),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<TopShelfContent>(
                  preference: UserPreferences.topShelfContent,
                  title: l10n.topShelf,
                  description: l10n.topShelfDescription,
                  icon: Icons.tv,
                  labelOf: (v) => switch (v) {
                    TopShelfContent.latestMedia => l10n.topShelfLatestMedia,
                    TopShelfContent.appBanner => l10n.topShelfAppBanner,
                  },
                  onChanged: TopShelfService().refresh,
                ),
              ],
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
