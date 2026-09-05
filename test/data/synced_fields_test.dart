import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/synced_fields.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The outgoing payload and the incoming apply pass are both built from syncedFields, so the
// two directions can't drift. What the table can't enforce on its own is that each field
// is stored per server and user, and that the set of fields hasn't quietly shrunk, so both
// are checked here.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Every server key the table is expected to carry. A field disappearing is silent at
  // runtime, it just stops syncing, so the list is pinned.
  const expectedServerKeys = <String>{
    'allGenresImageType',
    'assDirectPlay',
    'audioNightMode',
    'audioRowsSortBy',
    'audioRowsSortOrder',
    'audioSortOption',
    'autoplayNextEpisode',
    'backdropEnabled',
    'browsingBlur',
    'cardFocusExpansion',
    'cinemaModeEnabled',
    'cinemaModeEpisodesEnabled',
    'clockBehavior',
    'collectionsRowShowEpisodes',
    'collectionsRowSortBy',
    'collectionsRowSortOrder',
    'confirmExit',
    'crashReportsEnabled',
    'customThemeId',
    'defaultAudioLanguage',
    'defaultDownloadQuality',
    'defaultFavoritesFilter',
    'defaultSubtitleLanguage',
    'desktopScrollSensitivity',
    'desktopUiScale',
    'detailButtonOrderDesktop',
    'detailButtonOrderMobile',
    'detailButtonOrderTv',
    'detailExpandedTabs',
    'detailScreenStyle',
    'detailShowTechnicalDetails',
    'detailTrailersExternal',
    'detailUseSeriesThumbnails',
    'detailsScreenBlur',
    'diagnosticLoggingEnabled',
    'displayAudioAlbumArtists',
    'displayAudioAlbums',
    'displayAudioArtists',
    'displayAudioFavorites',
    'displayAudioLastPlayed',
    'displayAudioLatest',
    'displayAudioPlaylists',
    'displayAudioRows',
    'displayCollectionsRows',
    'displayFavoritesRows',
    'displayGenresRows',
    'displayStudiosRows',
    'displayPlaylistsRows',
    'displayRewatchRow',
    'displaySinceYouWatchedRows',
    'downloadStorageLimitMb',
    'downloadWifiOnly',
    'enableFolderView',
    'enableMultiServerLibraries',
    'enableRadarrCalendar',
    'enableSonarrCalendar',
    'epgMobileView',
    'episodePreviewEnabled',
    'fallbackAudioLanguage',
    'fallbackSubtitleLanguage',
    'favoritesRowSortBy',
    'favoritesRowSortOrder',
    'favoritesViewStyle',
    'focusColor',
    'fullScreenRows',
    'genresRowItemFilter',
    'genresRowSortBy',
    'genresRowSortOrder',
    'glassQuality',
    'groupItemsIntoCollections',
    'hiddenContinueWatchingItems',
    'hiddenDetailButtonsDesktop',
    'hiddenDetailButtonsMobile',
    'hiddenDetailButtonsTv',
    'hiddenNextUpSeries',
    'hiddenOsdButtonsDesktop',
    'hiddenOsdButtonsMobile',
    'hiddenOsdButtonsTv',
    'hideBackdropsInLibraries',
    'hideDetailsMediaDescription',
    'hideHomeMediaDescription',
    'homeImageTypeContinueWatching',
    'homeImageUseSeriesImage',
    'homeRowInfoOverlay',
    'homeRowsImageType',
    'homeRowsImageTypeOverride',
    'homeRowsStyle',
    'modernHomeRowsPadding',
    'classicHomeRowsPadding',
    'imdbLowestRatedMoviesEnabled',
    'imdbMostPopularMoviesEnabled',
    'imdbMostPopularTvShowsEnabled',
    'imdbTop250MoviesEnabled',
    'imdbTop250TvShowsEnabled',
    'imdbTopEnglishMoviesEnabled',
    'interfaceStyle',
    'languageOverride',
    'libraryPosterSize',
    'loadingAnimationImage',
    'loadingAnimationPosition',
    'loadingAnimationSize',
    'loadingAnimationSpeed',
    'liveTvChannelSortBy',
    'liveTvDirectPlayEnabled',
    'maxBitrate',
    'maxVideoResolution',
    'mdblistApiKey',
    'mdblistEnabled',
    'mdblistShowRatingBadges',
    'mdblistShowRatingNames',
    'mediaBarAutoAdvance',
    'mediaBarCollectionIds',
    'mediaBarExcludedGenres',
    'mediaBarIntervalMs',
    'mediaBarItemCount',
    'mediaBarLibraryIds',
    'mediaBarOpacity',
    'mediaBarOverlayColor',
    'mediaBarSourceType',
    'mediaBarTrailerAudio',
    'mediaBarTrailerCaptions',
    'mediaBarTrailerPreview',
    'mediaQueuingEnabled',
    'mediaSegmentActions',
    'mediaSegmentAutoHide',
    'mediaSegmentCountdown',
    'mediaTypeBadgeBehavior',
    'mergeContinueWatchingNextUp',
    'mergeRadarrSonarrCalendars',
    'mergeRecentRowsByType',
    'navbarAlwaysExpanded',
    'navbarColor',
    'navbarOpacity',
    'navbarPosition',
    'nextUpBehavior',
    'nextUpMaxDays',
    'nextUpTimeout',
    'oledMode',
    'osdButtonOrderDesktop',
    'osdButtonOrderMobile',
    'osdButtonOrderTv',
    'osdLockEnabled',
    'personPageGroupItems',
    'personPageSortOption',
    'personalRatingStyle',
    'musicPlaybackTimeDisplay',
    'pgsDirectPlay',
    'playbackTimeAboveCenter',
    'playbackTimeAboveLeft',
    'playbackTimeAboveRight',
    'playbackTimeBelowCenter',
    'playbackTimeBelowLeft',
    'playbackTimeBelowRight',
    'playerSwipeGestures',
    'playerZoomMode',
    'playlistPosterSize',
    'playlistsRowShowEpisodes',
    'playlistsRowSortBy',
    'playlistsRowSortOrder',
    'posterSize',
    'preferAudioDescription',
    'preferDefaultAudioTrack',
    'preferSdhSubtitles',
    'preferSystemImeKeyboard',
    'previewAudioEnabled',
    'radarrCalendarShowCinema',
    'radarrCalendarShowDate',
    'radarrCalendarShowDigital',
    'radarrCalendarShowPhysical',
    'recentlyReleasedSeriesType',
    'recommendationSystemSource',
    'recommendationsApplyParentalRatingCap',
    'replaceSkipOutroWithNextUp',
    'reportDownloadsAsActivity',
    'resumeLastQueueOnPlay',
    'resumeSubtractDuration',
    'rewatchIncludeCollections',
    'rewatchIncludeMovies',
    'rewatchIncludeShows',
    'rewatchSortBy',
    'screensaverClockMode',
    'screensaverDimming',
    'screensaverEnabled',
    'screensaverMaxAgeRating',
    'screensaverMode',
    'screensaverRequireRating',
    'screensaverTimeout',
    'seasonalSurprise',
    'seerrBlockNsfw',
    'seerrEnabled',
    'showDescriptionOnPause',
    'showFavoritesButton',
    'showGenresButton',
    'showLibrariesInToolbar',
    'showLoadingAnimationText',
    'showMediaDetailsOnLibraryPage',
    'showSeerrButton',
    'showServerMessagesButton',
    'showShuffleButton',
    'showSyncPlayButton',
    'shuffleContentType',
    'sinceYouWatched1Enabled',
    'sinceYouWatched2Enabled',
    'sinceYouWatched3Enabled',
    'sinceYouWatched4Enabled',
    'sinceYouWatched5Enabled',
    'sinceYouWatchedIncludeWatched',
    'sinceYouWatchedSource',
    'sinceYouWatchedSourceItem',
    'sinceYouWatchedSourceType',
    'skipBackLength',
    'skipForwardLength',
    'sonarrCalendarShowDate',
    'sonarrCalendarShowEpisodeInfo',
    'stillWatchingBehavior',
    'studiosRowSelectedIds',
    'studiosRowSortBy',
    'studiosRowSortOrder',
    'subtitleMode',
    'subtitleTextStrokeColor',
    'subtitlesBackgroundColor',
    'subtitlesHdrBackgroundColor',
    'subtitlesHdrOffsetPosition',
    'subtitlesHdrSeparate',
    'subtitlesHdrTextColor',
    'subtitlesHdrTextSize',
    'subtitlesHdrTextStrokeColor',
    'subtitlesHdrTextWeight',
    'subtitlesOffsetPosition',
    'subtitlesTextColor',
    'subtitlesTextSize',
    'subtitlesTextWeight',
    'subtitlesUseEmbeddedFontSizes',
    'subtitlesUseEmbeddedStyles',
    'syncPlayAdvancedCorrectionEnabled',
    'syncPlayEnableSyncCorrection',
    'syncPlayEnabled',
    'syncPlayExtraTimeOffset',
    'syncPlayMaxDelaySpeedToSync',
    'syncPlayMinDelaySkipToSync',
    'syncPlayMinDelaySpeedToSync',
    'syncPlaySpeedToSyncDuration',
    'syncPlayUseSkipToSync',
    'syncPlayUseSpeedToSync',
    'themeMusicEnabled',
    'themeMusicLoop',
    'themeMusicOnHomeRows',
    'themeMusicVolume',
    'tmdbAiringTodayTvEnabled',
    'tmdbApiKey',
    'tmdbEpisodeRatingsEnabled',
    'tmdbNowPlayingMoviesEnabled',
    'tmdbOnTheAirTvEnabled',
    'tmdbPopularMoviesEnabled',
    'tmdbPopularTvEnabled',
    'tmdbTopRatedMoviesEnabled',
    'tmdbTopRatedTvEnabled',
    'tmdbTrendingAllWeeklyEnabled',
    'tmdbTrendingMovieDailyEnabled',
    'tmdbTrendingMovieWeeklyEnabled',
    'tmdbTrendingTvDailyEnabled',
    'tmdbTrendingTvWeeklyEnabled',
    'tmdbUpcomingMoviesEnabled',
    'unpauseRewindDuration',
    'updateNotificationsEnabled',
    'use24HourClock',
    'useDetailedSubHeadings',
    'videoStartDelay',
    'visualTheme',
    'watchedIndicator',
  };

  group('synced field table', () {
    test('carries exactly the expected server keys', () {
      final actual = syncedFields.map((f) => f.serverKey).toSet();
      expect(actual.difference(expectedServerKeys), isEmpty,
          reason: 'a field was added without pinning it here');
      expect(expectedServerKeys.difference(actual), isEmpty,
          reason: 'a field stopped syncing');
    });

    test('has no duplicate server keys', () {
      final seen = <String>{};
      final duplicates = <String>[];
      for (final field in syncedFields) {
        if (!seen.add(field.serverKey)) duplicates.add(field.serverKey);
      }
      expect(duplicates, isEmpty);
    });

    test('every enum field offers values to match against', () {
      for (final field in syncedFields) {
        if (field.codec != SyncCodec.enumName) continue;
        expect(field.enumValues, isNotNull, reason: field.serverKey);
        expect(field.enumValues, isNotEmpty, reason: field.serverKey);
      }
    });

    test('only the API keys are receive-only', () {
      final receiveOnly = syncedFields
          .where((f) => f.receiveOnly)
          .map((f) => f.serverKey)
          .toSet();
      expect(receiveOnly, {'mdblistApiKey', 'tmdbApiKey'});
    });

    // A synced field that isn't scoped per server and user carries one server's value onto
    // the next one the user signs in to.
    test('every synced field is stored per server and user', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'pref_last_server_id': 'srv1',
        'pref_last_user_id': 'usr1',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      final unscoped = <String>[];
      for (final field in syncedFields) {
        final effective = prefs.getEffectivePreference(field.pref);
        if (effective.key == field.pref.key) unscoped.add(field.serverKey);
      }

      expect(unscoped, isEmpty,
          reason: 'these would leak across servers: \$unscoped');
    });
  });
}

// Moving a preference to per-server storage changes which key reads consult, so an existing
// value has to be handed to the server the user is on or the setting looks like it reset.
void scopeAdoptionTests() {
  group('adopting newly scoped preferences', () {
    test('an existing value moves to the active server scope', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'pref_last_server_id': 'srv1',
        'pref_last_user_id': 'usr1',
        'pref_rewatch_include_movies': false,
        'pref_detail_screen_style': 'classic',
      });
      final store = PreferenceStore();
      await store.init();

      UserPreferences(store);

      expect(store.getBool('pref_rewatch_include_movies_srv1_usr1'), isFalse);
      expect(store.getString('pref_detail_screen_style_srv1_usr1'), 'classic');
      // The bare key goes, so another server starts from its own defaults rather than
      // inheriting a value that was never chosen for it.
      expect(store.containsKey('pref_rewatch_include_movies'), isFalse);
      expect(store.containsKey('pref_detail_screen_style'), isFalse);
    });

    test('an existing scoped value is not overwritten', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'pref_last_server_id': 'srv1',
        'pref_last_user_id': 'usr1',
        'pref_rewatch_include_movies': false,
        'pref_rewatch_include_movies_srv1_usr1': true,
      });
      final store = PreferenceStore();
      await store.init();

      UserPreferences(store);

      expect(store.getBool('pref_rewatch_include_movies_srv1_usr1'), isTrue);
    });

    test('nothing happens before a server and user are known', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'pref_rewatch_include_movies': false,
      });
      final store = PreferenceStore();
      await store.init();

      UserPreferences(store);

      expect(store.getBool('pref_rewatch_include_movies'), isFalse);
    });
  });
}
