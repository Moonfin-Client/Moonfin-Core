import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class HomeRowsImageTypeScreen extends StatefulWidget {
  const HomeRowsImageTypeScreen({super.key});

  @override
  State<HomeRowsImageTypeScreen> createState() =>
      _HomeRowsImageTypeScreenState();
}

class _HomeRowsImageTypeScreenState extends State<HomeRowsImageTypeScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _syncService = GetIt.instance<PluginSyncService>();
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    super.dispose();
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _pushSync() async {
    if (!_syncService.pluginAvailable) return;
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;
    final client = GetIt.instance<MediaServerClient>();
    await _syncService.pushSettings(client);
  }

  String _sectionLabel(HomeSectionType type, AppLocalizations l10n) =>
      switch (type) {
        HomeSectionType.mediaBar => l10n.mediaBar,
        HomeSectionType.latestMedia => l10n.latestMedia,
        HomeSectionType.recentlyReleased => l10n.recentlyReleased,
        HomeSectionType.libraryTilesSmall => l10n.myMedia,
        HomeSectionType.libraryButtons => l10n.myMediaSmall,
        HomeSectionType.resume => l10n.continueWatching,
        HomeSectionType.resumeAudio => l10n.resumeAudio,
        HomeSectionType.resumeBook => l10n.resumeBooks,
        HomeSectionType.activeRecordings => l10n.activeRecordings,
        HomeSectionType.nextUp => l10n.nextUp,
        HomeSectionType.playlists => l10n.playlists,
        HomeSectionType.audioArtists => l10n.artists,
        HomeSectionType.audioAlbums => l10n.albums,
        HomeSectionType.audioPlaylists => l10n.playlists,
        HomeSectionType.favoriteMovies =>
          'Favorite ${FavoriteTypeFilter.movie.displayName}',
        HomeSectionType.favoriteSeries =>
          'Favorite ${FavoriteTypeFilter.series.displayName}',
        HomeSectionType.favoriteEpisodes =>
          'Favorite ${FavoriteTypeFilter.episode.displayName}',
        HomeSectionType.favoritePeople =>
          'Favorite ${FavoriteTypeFilter.person.displayName}',
        HomeSectionType.favoriteArtists =>
          'Favorite ${FavoriteTypeFilter.musicArtist.displayName}',
        HomeSectionType.favoriteMusicVideos =>
          'Favorite ${FavoriteTypeFilter.musicVideo.displayName}',
        HomeSectionType.favoriteAlbums =>
          'Favorite ${FavoriteTypeFilter.musicAlbum.displayName}',
        HomeSectionType.favoriteSongs =>
          'Favorite ${FavoriteTypeFilter.audio.displayName}',
        HomeSectionType.collections => l10n.collections,
        HomeSectionType.genres => l10n.genres,
        HomeSectionType.liveTv => l10n.liveTV,
        HomeSectionType.seerrRecentRequests => l10n.recentRequests,
        HomeSectionType.seerrRecentlyAdded => l10n.recentlyAdded,
        HomeSectionType.seerrPopularMovies => l10n.popularMovies,
        HomeSectionType.seerrUpcomingMovies => l10n.upcomingMovies,
        HomeSectionType.seerrPopularSeries => l10n.popularSeries,
        HomeSectionType.seerrUpcomingSeries => l10n.upcomingSeries,
        HomeSectionType.seerrTrending => l10n.trending,
        HomeSectionType.seerrMovieGenres => l10n.movieGenres,
        HomeSectionType.seerrStudios => l10n.studios,
        HomeSectionType.seerrSeriesGenres => l10n.seriesGenres,
        HomeSectionType.seerrNetworks => l10n.networks,
        HomeSectionType.radarrCalendar => 'Upcoming Movies (Radarr)',
        HomeSectionType.sonarrCalendar => 'Upcoming TV Shows (Sonarr)',
        HomeSectionType.imdbTop250Movies => l10n.imdbTop250Movies,
        HomeSectionType.imdbTop250TvShows => l10n.imdbTop250TvShows,
        HomeSectionType.imdbMostPopularMovies => l10n.imdbMostPopularMovies,
        HomeSectionType.imdbMostPopularTvShows => l10n.imdbMostPopularTvShows,
        HomeSectionType.imdbLowestRatedMovies => l10n.imdbLowestRatedMovies,
        HomeSectionType.imdbTopEnglishMovies => l10n.imdbTopEnglishMovies,
        HomeSectionType.tmdbPopularMovies => 'Popular Movies',
        HomeSectionType.tmdbTopRatedMovies => 'Top Rated Movies',
        HomeSectionType.tmdbNowPlayingMovies => 'Now Playing Movies',
        HomeSectionType.tmdbUpcomingMovies => 'Upcoming Movies',
        HomeSectionType.tmdbPopularTv => 'Popular TV',
        HomeSectionType.tmdbTopRatedTv => 'Top Rated TV',
        HomeSectionType.tmdbAiringTodayTv => 'Airing Today TV',
        HomeSectionType.tmdbOnTheAirTv => 'On The Air TV',
        HomeSectionType.tmdbTrendingMovieDaily => 'Trending Movies (Daily)',
        HomeSectionType.tmdbTrendingMovieWeekly => 'Trending Movies (Weekly)',
        HomeSectionType.tmdbTrendingTvDaily => 'Trending TV (Daily)',
        HomeSectionType.tmdbTrendingTvWeekly => 'Trending TV (Weekly)',
        HomeSectionType.tmdbTrendingAllWeekly => 'Trending All (Weekly)',
        HomeSectionType.none => l10n.none,
      };

  String _imageTypeLabel(ImageType type, AppLocalizations l10n) =>
      switch (type) {
        ImageType.poster => l10n.posterLabel,
        ImageType.thumb => l10n.thumbnailLabel,
        ImageType.banner => l10n.bannerLabel,
      };

  Future<void> _setPerRowImageType(
    HomeSectionType type,
    ImageType value,
  ) async {
    await _prefs.set(UserPreferences.homeRowImageType(type), value);
    await _pushSync();
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enabledSections =
        _prefs.homeSectionsConfig
            .where(
              (c) =>
                  c.enabled &&
                  c.type != HomeSectionType.none &&
                  c.type != HomeSectionType.mediaBar &&
                  c.type != HomeSectionType.resumeAudio &&
                  c.type != HomeSectionType.libraryButtons,
            )
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.perRowImageType)),
        body: ListView(
          children: [
            adaptiveListSection(
              children: [
                TvFocusHighlight(
                  builder: (_, _) => ListTile(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    leading: const Icon(Icons.view_stream),
                    title: Text(l10n.perRowSettings),
                  ),
                ),
                for (final section in enabledSections)
                  TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      leading: const Icon(Icons.image_outlined),
                      title: Text(_sectionLabel(section.type, l10n)),
                      subtitle: Text(
                        _imageTypeLabel(
                          _prefs.get(
                            UserPreferences.homeRowImageType(section.type),
                          ),
                          l10n,
                        ),
                      ),
                      onTap: () => _showImageTypePicker(
                        context,
                        current: _prefs.get(
                          UserPreferences.homeRowImageType(section.type),
                        ),
                        onSelected: (value) =>
                            _setPerRowImageType(section.type, value),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImageTypePicker(
    BuildContext context, {
    required ImageType current,
    required Future<void> Function(ImageType value) onSelected,
  }) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final values = ImageType.values.toList();
    final selectedIndex = values.indexOf(current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    try {
      final result = await showFocusRestoringDialog<ImageType>(
        context: context,
        useRootNavigator: false,
        builder: (ctx) {
          final closeOnce = createDialogBackCloseHandler(ctx);
          var picked = false;
          return Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onKeyEvent: (_, event) {
              if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
              if (event is KeyDownEvent || event is KeyUpEvent) {
                closeOnce();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: FocusScope(
              autofocus: true,
              child: SimpleDialog(
                title: Text(l10n.imageType),
                children: values.asMap().entries.map((entry) {
                  final i = entry.key;
                  final v = entry.value;
                  final selected = v == current;
                  return TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      autofocus: i == autofocusIndex,
                      title: Text(_imageTypeLabel(v, l10n)),
                      trailing: selected ? const Icon(Icons.check) : null,
                      onTap: () {
                        if (picked) return;
                        picked = true;
                        Navigator.pop(ctx, v);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
      if (result != null && result != current) {
        await onSelected(result);
      }
    } finally {
      _pickerOpen = false;
    }
  }
}
