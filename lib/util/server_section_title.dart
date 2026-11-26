import 'package:server_core/server_core.dart';

import '../l10n/app_localizations.dart';

/// A row the server curates itself (Silo's home sections) in the app's
/// language. The server sends a key only while the title is its own, so a row
/// the user renamed, a key Moonfin has no string for, or one missing a value
/// for its placeholder keeps the title as the server sent it.
String localizeServerSectionTitle(
  ServerHomeSection section,
  AppLocalizations l10n,
) {
  final args = section.titleArgs;
  return switch (section.titleKey) {
    'home.section.becauseYouEnjoy' when args['genres'] != null =>
      l10n.siloSectionBecauseYouEnjoy(args['genres']!),
    'home.section.becauseYouWatched' => l10n.siloSectionBecauseYouWatched,
    'home.section.becauseYouWatchedTitle' when args['title'] != null =>
      l10n.siloSectionBecauseYouWatchedTitle(args['title']!),
    'home.section.continueListening' => l10n.continueListening,
    'home.section.continueReading' => l10n.continueReading,
    'home.section.continueWatching' => l10n.continueWatching,
    'home.section.forYou' => l10n.siloSectionForYou,
    'home.section.hiddenGems' => l10n.siloSectionHiddenGems,
    'home.section.highlyRatedInLibrary' => l10n.siloSectionHighlyRatedInLibrary,
    'home.section.nextInYourSeries' => l10n.siloSectionNextInYourSeries,
    'home.section.nextUp' => l10n.nextUp,
    'home.section.pickedFromYourHistory' => l10n.siloSectionPickedFromYourHistory,
    'home.section.popularOnServer' => l10n.siloSectionPopularOnServer,
    'home.section.profilesLikeYouEnjoyed' => l10n.siloSectionProfilesLikeYouEnjoyed,
    'home.section.randomPicks' => l10n.siloSectionRandomPicks,
    'home.section.recentlyAdded' => l10n.recentlyAdded,
    'home.section.recentlyAddedAudiobooks' => l10n.siloSectionRecentlyAddedAudiobooks,
    'home.section.recentlyAddedEbooks' => l10n.siloSectionRecentlyAddedEbooks,
    'home.section.recentlyAddedIn' when args['library'] != null =>
      l10n.siloSectionRecentlyAddedIn(args['library']!),
    'home.section.recentlyAddedManga' => l10n.siloSectionRecentlyAddedManga,
    'home.section.recentlyAddedMovies' => l10n.siloSectionRecentlyAddedMovies,
    'home.section.recentlyAddedTv' => l10n.siloSectionRecentlyAddedTv,
    'home.section.recentlyReleased' => l10n.recentlyReleased,
    'home.section.recentlyReleasedAudiobooks' => l10n.siloSectionRecentlyReleasedAudiobooks,
    'home.section.recentlyReleasedEbooks' => l10n.siloSectionRecentlyReleasedEbooks,
    'home.section.recentlyReleasedEpisodes' => l10n.recentlyReleasedEpisodes,
    'home.section.recentlyReleasedEpisodesIn' when args['library'] != null =>
      l10n.siloSectionRecentlyReleasedEpisodesIn(args['library']!),
    'home.section.recentlyReleasedIn' when args['library'] != null =>
      l10n.siloSectionRecentlyReleasedIn(args['library']!),
    'home.section.recentlyReleasedManga' => l10n.siloSectionRecentlyReleasedManga,
    'home.section.recentlyReleasedMovies' => l10n.siloSectionRecentlyReleasedMovies,
    'home.section.recommendedForYou' => l10n.siloSectionRecommendedForYou,
    'home.section.returningShows' => l10n.siloSectionReturningShows,
    'home.section.seasonal.christmas.classics' => l10n.siloSectionSeasonalChristmasClassics,
    'home.section.seasonal.christmas.comedies' => l10n.siloSectionSeasonalChristmasComedies,
    'home.section.seasonal.christmas.family' => l10n.siloSectionSeasonalChristmasFamily,
    'home.section.seasonal.christmas.favorites' => l10n.siloSectionSeasonalChristmasFavorites,
    'home.section.seasonal.christmas.hallmark' => l10n.siloSectionSeasonalChristmasHallmark,
    'home.section.seasonal.christmas.romcoms' => l10n.siloSectionSeasonalChristmasRomcoms,
    'home.section.seasonal.easter.faith' => l10n.siloSectionSeasonalEasterFaith,
    'home.section.seasonal.easter.family' => l10n.siloSectionSeasonalEasterFamily,
    'home.section.seasonal.familyMovieNight.favorites' => l10n.siloSectionSeasonalFamilyMovieNightFavorites,
    'home.section.seasonal.familyMovieNight.liveAction' ||
    'home.section.seasonal.familyMovieNight.new' => l10n.siloSectionSeasonalFamilyMovieNight,
    'home.section.seasonal.halloween.animated' => l10n.siloSectionSeasonalHalloweenAnimated,
    'home.section.seasonal.halloween.family' => l10n.siloSectionSeasonalHalloweenFamily,
    'home.section.seasonal.halloween.favorites' => l10n.siloSectionSeasonalHalloweenFavorites,
    'home.section.seasonal.halloween.horror' => l10n.siloSectionSeasonalHalloweenHorror,
    'home.section.seasonal.halloween.tv' => l10n.siloSectionSeasonalHalloweenTv,
    'home.section.seasonal.newYear.favorites' => l10n.siloSectionSeasonalNewYearFavorites,
    'home.section.seasonal.saturdayMorning.cartoons' => l10n.siloSectionSeasonalSaturdayMorningCartoons,
    'home.section.seasonal.saturdayMorning.modern' => l10n.siloSectionSeasonalSaturdayMorningModern,
    'home.section.seasonal.saturdayMorning.nineties' => l10n.siloSectionSeasonalSaturdayMorningNineties,
    'home.section.seasonal.stPatricks.irishFilm' => l10n.siloSectionSeasonalStPatricksIrishFilm,
    'home.section.seasonal.stPatricks.irishTv' => l10n.siloSectionSeasonalStPatricksIrishTv,
    'home.section.seasonal.summer.blockbusters' ||
    'home.section.seasonal.summerBlockbuster.blockbusters' => l10n.siloSectionSeasonalSummerBlockbusters,
    'home.section.seasonal.summer.classicSummer' ||
    'home.section.seasonal.summerBlockbuster.classicSummer' => l10n.siloSectionSeasonalSummerClassicSummer,
    'home.section.seasonal.summer.nostalgia' ||
    'home.section.seasonal.summerBlockbuster.nostalgia' => l10n.siloSectionSeasonalSummerNostalgia,
    'home.section.seasonal.thanksgiving.favorites' => l10n.siloSectionSeasonalThanksgivingFavorites,
    'home.section.seasonal.thanksgiving.feelGood' => l10n.siloSectionSeasonalThanksgivingFeelGood,
    'home.section.seasonal.valentines.favorites' => l10n.siloSectionSeasonalValentinesFavorites,
    'home.section.seasonal.valentines.loveStories' => l10n.siloSectionSeasonalValentinesLoveStories,
    'home.section.seasonal.valentines.romanticDramas' => l10n.siloSectionSeasonalValentinesRomanticDramas,
    'home.section.seasonal.valentines.romcoms' => l10n.siloSectionSeasonalValentinesRomcoms,
    'home.section.seasonalPicks' => l10n.siloSectionSeasonalPicks,
    'home.section.topGenre' when args['genre'] != null =>
      l10n.siloSectionTopGenre(args['genre']!),
    'home.section.topPicksToday' => l10n.siloSectionTopPicksToday,
    'home.section.topRated' => l10n.siloSectionTopRated,
    'home.section.topRatedMovies' => l10n.siloSectionTopRatedMovies,
    'home.section.topRatedTv' => l10n.siloSectionTopRatedTv,
    'home.section.trendingOnServer' => l10n.siloSectionTrendingOnServer,
    'home.section.trendingThisWeek' => l10n.siloSectionTrendingThisWeek,
    _ => section.title,
  };
}
