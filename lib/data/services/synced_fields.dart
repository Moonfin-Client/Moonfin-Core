import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../preference/preference_constants.dart' as prefs;
import '../../preference/user_preferences.dart';
import '../../ui/widgets/navigation_layout.dart';
import '../../util/idiom/app_ui_idiom.dart';

/// How a value is carried on the wire relative to how it is stored locally.
enum SyncCodec {
  /// bool on both sides.
  boolean,

  /// int on both sides.
  integer,

  /// String on both sides.
  text,

  /// A local enum, carried as its name.
  enumName,

  /// A local int, carried as a decimal string.
  intAsText,

  /// A local String holding a number, carried as an int.
  textAsInt,

  /// double on both sides.
  decimal,

  /// A local packed ARGB int, carried as a #AARRGGBB string.
  ///
  /// The clients disagree about how a colour is stored, so the wire form is one they can
  /// all read rather than any one side's internal representation.
  colorAsText,

  /// A local comma separated String, carried as a JSON array.
  csvList,
}

/// One synced setting.
///
/// The outgoing payload and the incoming apply pass are both driven from this list, so a
/// field can no longer be wired in one direction and forgotten in the other, which is what
/// happened while those two lived in separate hand-written blocks. A test also checks every
/// entry against the per-server scoped key list, because a synced field that isn't scoped
/// leaks one server's value onto another.
class SyncedField {
  const SyncedField(
    this.serverKey,
    this.pref,
    this.codec, {
    this.enumValues,
    this.receiveOnly = false,
    this.fallbackInt,
  });

  /// Key used in the profile JSON. It often differs from the local preference name.
  final String serverKey;

  final Preference<dynamic> pref;

  final SyncCodec codec;

  /// Candidate values for [SyncCodec.enumName]. Some fields deliberately offer a filtered
  /// subset rather than every value of the enum.
  final List<Enum>? enumValues;

  /// Pulled from the server but never sent back. The API keys are administered server side,
  /// and a blank value from an older client must not wipe a stored key.
  final bool receiveOnly;

  /// Used by [SyncCodec.textAsInt] when the stored string won't parse.
  final int? fallbackInt;
}

/// Every field carried through the generic sync path.
///
/// A few settings are deliberately absent because they can't be described here and stay as
/// bespoke code in PluginSyncService: mediaBarMode (falls back to a legacy bool and writes
/// two preferences), mediaBarContentType (values outside the known set have to be rejected),
/// sinceYouWatchedNumRows (an int on the wire against an enum locally), mdblistRatingSources
/// (rating names are translated in both directions), and homeSections and seerrRows (nested
/// structures).
final List<SyncedField> syncedFields = <SyncedField>[
  SyncedField('hiddenContinueWatchingItems', UserPreferences.hiddenContinueWatchingItems, SyncCodec.text),
  SyncedField('hiddenNextUpSeries', UserPreferences.hiddenNextUpSeries, SyncCodec.text),
  SyncedField('visualTheme', UserPreferences.visualTheme, SyncCodec.enumName, enumValues: prefs.VisualThemeId.values),
  SyncedField('customThemeId', UserPreferences.customThemeId, SyncCodec.text),
  SyncedField('navbarPosition', UserPreferences.navbarPosition, SyncCodec.enumName, enumValues: NavigationLayout.availableNavbarPositions),
  SyncedField('focusColor', UserPreferences.focusColor, SyncCodec.enumName, enumValues: prefs.AppTheme.values),
  SyncedField('watchedIndicator', UserPreferences.watchedIndicatorBehavior, SyncCodec.enumName, enumValues: prefs.WatchedIndicatorBehavior.values),
  SyncedField('cardFocusExpansion', UserPreferences.cardFocusExpansion, SyncCodec.boolean),
  SyncedField('homeRowsStyle', UserPreferences.homeRowsStyle, SyncCodec.enumName, enumValues: prefs.HomeRowsStyle.values),
  SyncedField('modernHomeRowsPadding', UserPreferences.modernHomeRowsPadding, SyncCodec.integer),
  SyncedField('classicHomeRowsPadding', UserPreferences.classicHomeRowsPadding, SyncCodec.integer),
  SyncedField('recommendationSystemSource', UserPreferences.recommendationSystemSource, SyncCodec.enumName, enumValues: prefs.RecommendationSystemSource.values),
  SyncedField('detailScreenStyle', UserPreferences.detailScreenStyle, SyncCodec.enumName, enumValues: prefs.DetailScreenStyle.values),
  SyncedField('detailExpandedTabs', UserPreferences.detailExpandedTabs, SyncCodec.boolean),
  SyncedField('detailShowTechnicalDetails', UserPreferences.detailShowTechnicalDetails, SyncCodec.boolean),
  SyncedField('fullScreenRows', UserPreferences.fullScreenRows, SyncCodec.boolean),
  SyncedField('homeImageTypeContinueWatching', UserPreferences.homeRowImageType(prefs.HomeSectionType.resume), SyncCodec.enumName, enumValues: prefs.ImageType.values),
  SyncedField('posterSize', UserPreferences.posterSize, SyncCodec.enumName, enumValues: prefs.PosterSize.values),
  SyncedField('displayFavoritesRows', UserPreferences.displayFavoritesRows, SyncCodec.boolean),
  SyncedField('displayCollectionsRows', UserPreferences.displayCollectionsRows, SyncCodec.boolean),
  SyncedField('displayGenresRows', UserPreferences.displayGenresRows, SyncCodec.boolean),
  SyncedField('displayAudioRows', UserPreferences.displayAudioRows, SyncCodec.boolean),
  SyncedField('displaySinceYouWatchedRows', UserPreferences.displaySinceYouWatchedRows, SyncCodec.boolean),
  SyncedField('sinceYouWatchedSource', UserPreferences.sinceYouWatchedSource, SyncCodec.enumName, enumValues: prefs.SinceYouWatchedSource.values),
  SyncedField('sinceYouWatchedSourceType', UserPreferences.sinceYouWatchedSourceType, SyncCodec.enumName, enumValues: prefs.SinceYouWatchedSourceType.values),
  SyncedField('sinceYouWatchedSourceItem', UserPreferences.sinceYouWatchedSourceItem, SyncCodec.enumName, enumValues: prefs.SinceYouWatchedSourceItem.values),
  SyncedField('sinceYouWatchedIncludeWatched', UserPreferences.sinceYouWatchedIncludeWatched, SyncCodec.boolean),
  SyncedField('displayPlaylistsRows', UserPreferences.displayPlaylistsRows, SyncCodec.boolean),
  SyncedField('displayRewatchRow', UserPreferences.displayRewatchRow, SyncCodec.boolean),
  SyncedField('rewatchSortBy', UserPreferences.rewatchSortBy, SyncCodec.enumName, enumValues: prefs.RewatchSortBy.values),
  SyncedField('rewatchIncludeMovies', UserPreferences.rewatchIncludeMovies, SyncCodec.boolean),
  SyncedField('rewatchIncludeShows', UserPreferences.rewatchIncludeShows, SyncCodec.boolean),
  SyncedField('rewatchIncludeCollections', UserPreferences.rewatchIncludeCollections, SyncCodec.boolean),
  SyncedField('useDetailedSubHeadings', UserPreferences.useDetailedSubHeadings, SyncCodec.boolean),
  SyncedField('favoritesRowSortBy', UserPreferences.favoritesRowSortBy, SyncCodec.enumName, enumValues: prefs.LibrarySortBy.values),
  SyncedField('collectionsRowSortBy', UserPreferences.collectionsRowSortBy, SyncCodec.enumName, enumValues: prefs.LibrarySortBy.values),
  SyncedField('genresRowSortBy', UserPreferences.genresRowSortBy, SyncCodec.enumName, enumValues: prefs.LibrarySortBy.values),
  SyncedField('genresRowItemFilter', UserPreferences.genresRowItemFilter, SyncCodec.enumName, enumValues: prefs.GenresRowItemFilter.values),
  SyncedField('showShuffleButton', UserPreferences.showShuffleButton, SyncCodec.boolean),
  SyncedField('showGenresButton', UserPreferences.showGenresButton, SyncCodec.boolean),
  SyncedField('showFavoritesButton', UserPreferences.showFavoritesButton, SyncCodec.boolean),
  SyncedField('showSyncPlayButton', UserPreferences.showSyncPlayButton, SyncCodec.boolean),
  SyncedField('showLibrariesInToolbar', UserPreferences.showLibrariesInToolbar, SyncCodec.boolean),
  SyncedField('shuffleContentType', UserPreferences.shuffleContentType, SyncCodec.text),
  SyncedField('mergeContinueWatchingNextUp', UserPreferences.mergeContinueWatchingNextUp, SyncCodec.boolean),
  SyncedField('enableMultiServerLibraries', UserPreferences.enableMultiServerLibraries, SyncCodec.boolean),
  SyncedField('enableFolderView', UserPreferences.enableFolderView, SyncCodec.boolean),
  SyncedField('seasonalSurprise', UserPreferences.seasonalSurprise, SyncCodec.text),
  SyncedField('mediaBarItemCount', UserPreferences.mediaBarItemCount, SyncCodec.textAsInt, fallbackInt: 10),
  SyncedField('mediaBarOpacity', UserPreferences.mediaBarOverlayOpacity, SyncCodec.integer),
  SyncedField('mediaBarOverlayColor', UserPreferences.mediaBarOverlayColor, SyncCodec.text),
  SyncedField('navbarOpacity', UserPreferences.navbarOpacity, SyncCodec.integer),
  SyncedField('navbarColor', UserPreferences.navbarColor, SyncCodec.text),
  SyncedField('navbarAlwaysExpanded', UserPreferences.navbarAlwaysExpanded, SyncCodec.boolean),
  SyncedField('mediaBarAutoAdvance', UserPreferences.mediaBarAutoAdvance, SyncCodec.boolean),
  SyncedField('mediaBarIntervalMs', UserPreferences.mediaBarIntervalMs, SyncCodec.integer),
  SyncedField('mediaBarTrailerPreview', UserPreferences.mediaBarTrailerPreview, SyncCodec.boolean),
  SyncedField('mediaBarTrailerAudio', UserPreferences.mediaBarTrailerAudio, SyncCodec.boolean),
  SyncedField('episodePreviewEnabled', UserPreferences.episodePreviewEnabled, SyncCodec.boolean),
  SyncedField('previewAudioEnabled', UserPreferences.previewAudioEnabled, SyncCodec.boolean),
  SyncedField('mediaBarLibraryIds', UserPreferences.mediaBarLibraryIds, SyncCodec.csvList),
  SyncedField('mediaBarCollectionIds', UserPreferences.mediaBarCollectionIds, SyncCodec.csvList),
  SyncedField('mediaBarExcludedGenres', UserPreferences.mediaBarExcludedGenres, SyncCodec.csvList),
  SyncedField('mediaBarExternalListIds', UserPreferences.mediaBarExternalListIds, SyncCodec.csvList),
  SyncedField('themeMusicEnabled', UserPreferences.themeMusicEnabled, SyncCodec.boolean),
  SyncedField('themeMusicVolume', UserPreferences.themeMusicVolume, SyncCodec.integer),
  SyncedField('themeMusicOnHomeRows', UserPreferences.themeMusicOnHomeRows, SyncCodec.boolean),
  SyncedField('themeMusicLoop', UserPreferences.themeMusicLoop, SyncCodec.boolean),
  SyncedField('homeRowsImageTypeOverride', UserPreferences.homeRowsUniversalOverride, SyncCodec.boolean),
  SyncedField('homeRowsImageType', UserPreferences.homeRowsUniversalImageType, SyncCodec.enumName, enumValues: prefs.ImageType.values),
  SyncedField('homeImageUseSeriesImage', UserPreferences.seriesThumbnailsEnabled, SyncCodec.boolean),
  SyncedField('backdropEnabled', UserPreferences.backdropEnabled, SyncCodec.boolean),
  SyncedField('detailsScreenBlur', UserPreferences.detailsBackgroundBlurAmount, SyncCodec.intAsText),
  SyncedField('browsingBlur', UserPreferences.browsingBackgroundBlurAmount, SyncCodec.intAsText),
  SyncedField('mdblistEnabled', UserPreferences.enableAdditionalRatings, SyncCodec.boolean),
  SyncedField('mdblistApiKey', UserPreferences.mdblistApiKey, SyncCodec.text, receiveOnly: true),
  SyncedField('mdblistShowRatingNames', UserPreferences.showRatingLabels, SyncCodec.boolean),
  SyncedField('mdblistShowRatingBadges', UserPreferences.showRatingBadges, SyncCodec.boolean),
  SyncedField('tmdbEpisodeRatingsEnabled', UserPreferences.enableEpisodeRatings, SyncCodec.boolean),
  SyncedField('tmdbApiKey', UserPreferences.tmdbApiKey, SyncCodec.text, receiveOnly: true),
  SyncedField('seerrEnabled', UserPreferences.seerrEnabled, SyncCodec.boolean),
  SyncedField('seerrBlockNsfw', UserPreferences.seerrBlockNsfw, SyncCodec.boolean),

  // Settings that previously stayed on the device. Grouped roughly by the screen they
  // appear on rather than by codec, so a missing one is easier to spot.
  SyncedField('allGenresImageType', UserPreferences.allGenresImageType, SyncCodec.enumName, enumValues: prefs.ImageType.values),
  SyncedField('assDirectPlay', UserPreferences.assDirectPlay, SyncCodec.boolean),
  SyncedField('audioNightMode', UserPreferences.audioNightMode, SyncCodec.boolean),
  SyncedField('audioRowsSortBy', UserPreferences.audioRowsSortBy, SyncCodec.enumName, enumValues: prefs.LibrarySortBy.values),
  SyncedField('audioSortOption', UserPreferences.audioSortOption, SyncCodec.text),
  SyncedField('autoplayNextEpisode', UserPreferences.autoplayNextEpisode, SyncCodec.boolean),
  SyncedField('cinemaModeEnabled', UserPreferences.cinemaModeEnabled, SyncCodec.boolean),
  SyncedField('clockBehavior', UserPreferences.clockBehavior, SyncCodec.enumName, enumValues: prefs.ClockBehavior.values),
  SyncedField('confirmExit', UserPreferences.confirmExit, SyncCodec.boolean),
  SyncedField('defaultAudioLanguage', UserPreferences.defaultAudioLanguage, SyncCodec.text),
  SyncedField('defaultDownloadQuality', UserPreferences.defaultDownloadQuality, SyncCodec.text),
  SyncedField('defaultFavoritesFilter', UserPreferences.defaultFavoritesFilter, SyncCodec.text),
  SyncedField('defaultSubtitleLanguage', UserPreferences.defaultSubtitleLanguage, SyncCodec.text),
  SyncedField('desktopUiScale', UserPreferences.desktopUiScale, SyncCodec.enumName, enumValues: prefs.DesktopUiScale.values),
  SyncedField('diagnosticLoggingEnabled', UserPreferences.diagnosticLoggingEnabled, SyncCodec.boolean),
  SyncedField('displayAudioAlbumArtists', UserPreferences.displayAudioAlbumArtists, SyncCodec.boolean),
  SyncedField('displayAudioAlbums', UserPreferences.displayAudioAlbums, SyncCodec.boolean),
  SyncedField('displayAudioArtists', UserPreferences.displayAudioArtists, SyncCodec.boolean),
  SyncedField('displayAudioFavorites', UserPreferences.displayAudioFavorites, SyncCodec.boolean),
  SyncedField('displayAudioLastPlayed', UserPreferences.displayAudioLastPlayed, SyncCodec.boolean),
  SyncedField('displayAudioLatest', UserPreferences.displayAudioLatest, SyncCodec.boolean),
  SyncedField('displayAudioPlaylists', UserPreferences.displayAudioPlaylists, SyncCodec.boolean),
  SyncedField('downloadStorageLimitMb', UserPreferences.downloadStorageLimitMb, SyncCodec.integer),
  SyncedField('downloadWifiOnly', UserPreferences.downloadWifiOnly, SyncCodec.boolean),
  SyncedField('enableRadarrCalendar', UserPreferences.enableRadarrCalendar, SyncCodec.boolean),
  SyncedField('enableSonarrCalendar', UserPreferences.enableSonarrCalendar, SyncCodec.boolean),
  SyncedField('epgMobileView', UserPreferences.epgMobileView, SyncCodec.enumName, enumValues: prefs.EpgMobileView.values),
  SyncedField('fallbackAudioLanguage', UserPreferences.fallbackAudioLanguage, SyncCodec.text),
  SyncedField('fallbackSubtitleLanguage', UserPreferences.fallbackSubtitleLanguage, SyncCodec.text),
  SyncedField('favoritesViewStyle', UserPreferences.favoritesViewStyle, SyncCodec.enumName, enumValues: prefs.FavoritesViewStyle.values),
  SyncedField('glassQuality', UserPreferences.glassQuality, SyncCodec.enumName, enumValues: prefs.GlassQualityMode.values),
  SyncedField('groupItemsIntoCollections', UserPreferences.groupItemsIntoCollections, SyncCodec.boolean),
  SyncedField('hideBackdropsInLibraries', UserPreferences.hideBackdropsInLibraries, SyncCodec.boolean),
  SyncedField('homeRowInfoOverlay', UserPreferences.homeRowInfoOverlay, SyncCodec.boolean),
  SyncedField('imdbLowestRatedMoviesEnabled', UserPreferences.imdbLowestRatedMoviesEnabled, SyncCodec.boolean),
  SyncedField('imdbMostPopularMoviesEnabled', UserPreferences.imdbMostPopularMoviesEnabled, SyncCodec.boolean),
  SyncedField('imdbMostPopularTvShowsEnabled', UserPreferences.imdbMostPopularTvShowsEnabled, SyncCodec.boolean),
  SyncedField('imdbTop250MoviesEnabled', UserPreferences.imdbTop250MoviesEnabled, SyncCodec.boolean),
  SyncedField('imdbTop250TvShowsEnabled', UserPreferences.imdbTop250TvShowsEnabled, SyncCodec.boolean),
  SyncedField('imdbTopEnglishMoviesEnabled', UserPreferences.imdbTopEnglishMoviesEnabled, SyncCodec.boolean),
  SyncedField('interfaceStyle', UserPreferences.interfaceStyle, SyncCodec.enumName, enumValues: InterfaceStyle.values),
  SyncedField('languageOverride', UserPreferences.languageOverride, SyncCodec.text),
  SyncedField('libraryPosterSize', UserPreferences.libraryPosterSize, SyncCodec.enumName, enumValues: prefs.PosterSize.values),
  SyncedField('liveTvChannelSortBy', UserPreferences.liveTvChannelSortBy, SyncCodec.enumName, enumValues: prefs.ChannelSortBy.values),
  SyncedField('liveTvDirectPlayEnabled', UserPreferences.liveTvDirectPlayEnabled, SyncCodec.boolean),
  SyncedField('maxBitrate', UserPreferences.maxBitrate, SyncCodec.text),
  SyncedField('maxVideoResolution', UserPreferences.maxVideoResolution, SyncCodec.enumName, enumValues: prefs.MaxVideoResolution.values),
  SyncedField('mediaQueuingEnabled', UserPreferences.mediaQueuingEnabled, SyncCodec.boolean),
  SyncedField('mediaSegmentCountdown', UserPreferences.mediaSegmentCountdown, SyncCodec.enumName, enumValues: prefs.MediaSegmentCountdown.values),
  SyncedField('mergeRadarrSonarrCalendars', UserPreferences.mergeRadarrSonarrCalendars, SyncCodec.boolean),
  SyncedField('nextUpBehavior', UserPreferences.nextUpBehavior, SyncCodec.enumName, enumValues: prefs.NextUpBehavior.values),
  SyncedField('nextUpTimeout', UserPreferences.nextUpTimeout, SyncCodec.integer),
  SyncedField('osdLockEnabled', UserPreferences.osdLockEnabled, SyncCodec.boolean),
  SyncedField('personPageGroupItems', UserPreferences.personPageGroupItems, SyncCodec.boolean),
  SyncedField('personPageSortOption', UserPreferences.personPageSortOption, SyncCodec.text),
  SyncedField('pgsDirectPlay', UserPreferences.pgsDirectPlay, SyncCodec.boolean),
  SyncedField('playerZoomMode', UserPreferences.playerZoomMode, SyncCodec.enumName, enumValues: prefs.ZoomMode.values),
  SyncedField('playlistPosterSize', UserPreferences.playlistPosterSize, SyncCodec.enumName, enumValues: prefs.PosterSize.values),
  SyncedField('playlistsRowSortBy', UserPreferences.playlistsRowSortBy, SyncCodec.enumName, enumValues: prefs.LibrarySortBy.values),
  SyncedField('preferAudioDescription', UserPreferences.preferAudioDescription, SyncCodec.boolean),
  SyncedField('preferDefaultAudioTrack', UserPreferences.preferDefaultAudioTrack, SyncCodec.boolean),
  SyncedField('preferSdhSubtitles', UserPreferences.preferSdhSubtitles, SyncCodec.boolean),
  SyncedField('preferSystemImeKeyboard', UserPreferences.preferSystemImeKeyboard, SyncCodec.boolean),
  SyncedField('radarrCalendarShowCinema', UserPreferences.radarrCalendarShowCinema, SyncCodec.boolean),
  SyncedField('radarrCalendarShowDate', UserPreferences.radarrCalendarShowDate, SyncCodec.boolean),
  SyncedField('radarrCalendarShowDigital', UserPreferences.radarrCalendarShowDigital, SyncCodec.boolean),
  SyncedField('radarrCalendarShowPhysical', UserPreferences.radarrCalendarShowPhysical, SyncCodec.boolean),
  SyncedField('recommendationsApplyParentalRatingCap', UserPreferences.recommendationsApplyParentalRatingCap, SyncCodec.boolean),
  SyncedField('replaceSkipOutroWithNextUp', UserPreferences.replaceSkipOutroWithNextUp, SyncCodec.boolean),
  SyncedField('reportDownloadsAsActivity', UserPreferences.reportDownloadsAsActivity, SyncCodec.boolean),
  SyncedField('resumeLastQueueOnPlay', UserPreferences.resumeLastQueueOnPlay, SyncCodec.boolean),
  SyncedField('resumeSubtractDuration', UserPreferences.resumeSubtractDuration, SyncCodec.text),
  SyncedField('screensaverClockMode', UserPreferences.screensaverClockMode, SyncCodec.enumName, enumValues: prefs.ScreensaverClockMode.values),
  SyncedField('screensaverDimming', UserPreferences.screensaverDimming, SyncCodec.integer),
  SyncedField('screensaverEnabled', UserPreferences.screensaverEnabled, SyncCodec.boolean),
  SyncedField('screensaverMaxAgeRating', UserPreferences.screensaverMaxAgeRating, SyncCodec.text),
  SyncedField('screensaverMode', UserPreferences.screensaverMode, SyncCodec.enumName, enumValues: prefs.ScreensaverMode.values),
  SyncedField('screensaverRequireRating', UserPreferences.screensaverRequireRating, SyncCodec.boolean),
  SyncedField('screensaverTimeout', UserPreferences.screensaverTimeout, SyncCodec.enumName, enumValues: prefs.ScreensaverTimeout.values),
  SyncedField('showDescriptionOnPause', UserPreferences.showDescriptionOnPause, SyncCodec.boolean),
  SyncedField('showMediaDetailsOnLibraryPage', UserPreferences.showMediaDetailsOnLibraryPage, SyncCodec.boolean),
  SyncedField('showSeerrButton', UserPreferences.showSeerrButton, SyncCodec.boolean),
  SyncedField('sinceYouWatched1Enabled', UserPreferences.sinceYouWatched1Enabled, SyncCodec.boolean),
  SyncedField('sinceYouWatched2Enabled', UserPreferences.sinceYouWatched2Enabled, SyncCodec.boolean),
  SyncedField('sinceYouWatched3Enabled', UserPreferences.sinceYouWatched3Enabled, SyncCodec.boolean),
  SyncedField('sinceYouWatched4Enabled', UserPreferences.sinceYouWatched4Enabled, SyncCodec.boolean),
  SyncedField('sinceYouWatched5Enabled', UserPreferences.sinceYouWatched5Enabled, SyncCodec.boolean),
  SyncedField('skipBackLength', UserPreferences.skipBackLength, SyncCodec.integer),
  SyncedField('skipForwardLength', UserPreferences.skipForwardLength, SyncCodec.integer),
  SyncedField('sonarrCalendarShowDate', UserPreferences.sonarrCalendarShowDate, SyncCodec.boolean),
  SyncedField('sonarrCalendarShowEpisodeInfo', UserPreferences.sonarrCalendarShowEpisodeInfo, SyncCodec.boolean),
  SyncedField('stillWatchingBehavior', UserPreferences.stillWatchingBehavior, SyncCodec.enumName, enumValues: prefs.StillWatchingBehavior.values),
  SyncedField('subtitleMode', UserPreferences.subtitleMode, SyncCodec.enumName, enumValues: prefs.SubtitleMode.values),
  SyncedField('subtitleTextStrokeColor', UserPreferences.subtitleTextStrokeColor, SyncCodec.colorAsText),
  SyncedField('subtitlesBackgroundColor', UserPreferences.subtitlesBackgroundColor, SyncCodec.colorAsText),
  SyncedField('subtitlesOffsetPosition', UserPreferences.subtitlesOffsetPosition, SyncCodec.decimal),
  SyncedField('subtitlesTextColor', UserPreferences.subtitlesTextColor, SyncCodec.colorAsText),
  SyncedField('subtitlesTextSize', UserPreferences.subtitlesTextSize, SyncCodec.decimal),
  SyncedField('subtitlesTextWeight', UserPreferences.subtitlesTextWeight, SyncCodec.integer),
  SyncedField('subtitlesUseEmbeddedFontSizes', UserPreferences.subtitlesUseEmbeddedFontSizes, SyncCodec.boolean),
  SyncedField('subtitlesUseEmbeddedStyles', UserPreferences.subtitlesUseEmbeddedStyles, SyncCodec.boolean),
  SyncedField('syncPlayAdvancedCorrectionEnabled', UserPreferences.syncPlayAdvancedCorrectionEnabled, SyncCodec.boolean),
  SyncedField('syncPlayEnableSyncCorrection', UserPreferences.syncPlayEnableSyncCorrection, SyncCodec.boolean),
  SyncedField('syncPlayEnabled', UserPreferences.syncPlayEnabled, SyncCodec.boolean),
  SyncedField('syncPlayExtraTimeOffset', UserPreferences.syncPlayExtraTimeOffset, SyncCodec.decimal),
  SyncedField('syncPlayMaxDelaySpeedToSync', UserPreferences.syncPlayMaxDelaySpeedToSync, SyncCodec.decimal),
  SyncedField('syncPlayMinDelaySkipToSync', UserPreferences.syncPlayMinDelaySkipToSync, SyncCodec.decimal),
  SyncedField('syncPlayMinDelaySpeedToSync', UserPreferences.syncPlayMinDelaySpeedToSync, SyncCodec.decimal),
  SyncedField('syncPlaySpeedToSyncDuration', UserPreferences.syncPlaySpeedToSyncDuration, SyncCodec.decimal),
  SyncedField('syncPlayUseSkipToSync', UserPreferences.syncPlayUseSkipToSync, SyncCodec.boolean),
  SyncedField('syncPlayUseSpeedToSync', UserPreferences.syncPlayUseSpeedToSync, SyncCodec.boolean),
  SyncedField('tmdbAiringTodayTvEnabled', UserPreferences.tmdbAiringTodayTvEnabled, SyncCodec.boolean),
  SyncedField('tmdbNowPlayingMoviesEnabled', UserPreferences.tmdbNowPlayingMoviesEnabled, SyncCodec.boolean),
  SyncedField('tmdbOnTheAirTvEnabled', UserPreferences.tmdbOnTheAirTvEnabled, SyncCodec.boolean),
  SyncedField('tmdbPopularMoviesEnabled', UserPreferences.tmdbPopularMoviesEnabled, SyncCodec.boolean),
  SyncedField('tmdbPopularTvEnabled', UserPreferences.tmdbPopularTvEnabled, SyncCodec.boolean),
  SyncedField('tmdbTopRatedMoviesEnabled', UserPreferences.tmdbTopRatedMoviesEnabled, SyncCodec.boolean),
  SyncedField('tmdbTopRatedTvEnabled', UserPreferences.tmdbTopRatedTvEnabled, SyncCodec.boolean),
  SyncedField('tmdbTrendingAllWeeklyEnabled', UserPreferences.tmdbTrendingAllWeeklyEnabled, SyncCodec.boolean),
  SyncedField('tmdbTrendingMovieDailyEnabled', UserPreferences.tmdbTrendingMovieDailyEnabled, SyncCodec.boolean),
  SyncedField('tmdbTrendingMovieWeeklyEnabled', UserPreferences.tmdbTrendingMovieWeeklyEnabled, SyncCodec.boolean),
  SyncedField('tmdbTrendingTvDailyEnabled', UserPreferences.tmdbTrendingTvDailyEnabled, SyncCodec.boolean),
  SyncedField('tmdbTrendingTvWeeklyEnabled', UserPreferences.tmdbTrendingTvWeeklyEnabled, SyncCodec.boolean),
  SyncedField('tmdbUpcomingMoviesEnabled', UserPreferences.tmdbUpcomingMoviesEnabled, SyncCodec.boolean),
  SyncedField('unpauseRewindDuration', UserPreferences.unpauseRewindDuration, SyncCodec.integer),
  SyncedField('updateNotificationsEnabled', UserPreferences.updateNotificationsEnabled, SyncCodec.boolean),
  SyncedField('use24HourClock', UserPreferences.use24HourClock, SyncCodec.boolean),
  SyncedField('videoStartDelay', UserPreferences.videoStartDelay, SyncCodec.integer),
];
