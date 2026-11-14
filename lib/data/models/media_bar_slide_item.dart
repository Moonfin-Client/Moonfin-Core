/// Why a slide gets a banner: what aired lately, a movie that's new, or what
/// the Sonarr and Radarr calendars expect soon.
enum MediaBarNewRelease {
  newSeries,
  newSeason,
  newEpisodes,
  newMovie,
  upcomingEpisode,
  upcomingSeason,
  upcomingSeries,
  upcomingMovie;

  /// Not out yet, so the detail line is the day it comes.
  bool get isUpcoming => index >= upcomingEpisode.index;
}

/// What a slide's banner says, and the detail line under it.
class MediaBarNewReleaseInfo {
  final MediaBarNewRelease kind;

  /// The season the new episodes belong to. 0 for a movie.
  final int season;

  /// The latest new episode, when the season comes out episode by episode.
  final int? episode;

  /// For what's upcoming, the day it comes. For a new movie, when it came
  /// out or reached the server, which decides it's new but isn't shown.
  final DateTime? date;

  /// A new movie's tagline, in the server's metadata language only.
  final String? tagline;

  const MediaBarNewReleaseInfo({
    required this.kind,
    this.season = 0,
    this.episode,
    this.date,
    this.tagline,
  });
}

class MediaBarSlideItem {
  final String itemId;
  final String serverId;
  final String title;
  final String? overview;
  final String? backdropUrl;

  /// The wide banner art, which usually has the title painted into it.
  final String? bannerUrl;
  final String? logoUrl;
  final String? posterUrl;
  final String? officialRating;
  final int? year;
  final List<String> genres;
  final Duration? runtime;
  final double? communityRating;
  final int? criticRating;
  final String? tmdbId;
  final String? imdbId;
  final String itemType;
  final List<Map<String, dynamic>> remoteTrailers;

  /// Set on a series whose episodes aired within the chosen window.
  final MediaBarNewReleaseInfo? newRelease;

  /// A series with every episode watched, so there's nothing to play until
  /// the next one comes.
  final bool fullyWatched;

  /// The id outside titles carry in place of a server, as on Home.
  static const externalServerId = 'seerr';

  const MediaBarSlideItem({
    required this.itemId,
    required this.serverId,
    required this.title,
    this.overview,
    this.backdropUrl,
    this.bannerUrl,
    this.logoUrl,
    this.posterUrl,
    this.officialRating,
    this.year,
    this.genres = const [],
    this.runtime,
    this.communityRating,
    this.criticRating,
    this.tmdbId,
    this.imdbId,
    this.itemType = 'Movie',
    this.remoteTrailers = const [],
    this.newRelease,
    this.fullyWatched = false,
  });

  /// Whether this title came from an outside list rather than the server, so it
  /// opens in Seerr and has nothing to play.
  bool get isExternal => serverId == externalServerId;

  /// The same title with [release] as its banner.
  MediaBarSlideItem withNewRelease(MediaBarNewReleaseInfo? release) =>
      MediaBarSlideItem(
        itemId: itemId,
        serverId: serverId,
        title: title,
        backdropUrl: backdropUrl,
        bannerUrl: bannerUrl,
        logoUrl: logoUrl,
        posterUrl: posterUrl,
        officialRating: officialRating,
        year: year,
        genres: genres,
        runtime: runtime,
        communityRating: communityRating,
        criticRating: criticRating,
        tmdbId: tmdbId,
        imdbId: imdbId,
        itemType: itemType,
        remoteTrailers: remoteTrailers,
        overview: overview,
        newRelease: release,
        fullyWatched: fullyWatched,
      );

  /// The same title with its description dropped, for previews of the
  /// settings that hide it.
  MediaBarSlideItem withoutOverview() => MediaBarSlideItem(
    itemId: itemId,
    serverId: serverId,
    title: title,
    backdropUrl: backdropUrl,
    bannerUrl: bannerUrl,
    logoUrl: logoUrl,
    posterUrl: posterUrl,
    officialRating: officialRating,
    year: year,
    genres: genres,
    runtime: runtime,
    communityRating: communityRating,
    criticRating: criticRating,
    tmdbId: tmdbId,
    imdbId: imdbId,
    itemType: itemType,
    remoteTrailers: remoteTrailers,
    newRelease: newRelease,
    fullyWatched: fullyWatched,
  );
}
