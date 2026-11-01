import 'package:flutter/widgets.dart';

enum MobileCinemaMode {
  appleTv('Apple TV'),
  netflix('Netflix');

  const MobileCinemaMode(this.label);
  final String label;

  static MobileCinemaMode fromPreference(String value) =>
      value == 'netflix' ? netflix : appleTv;
}

enum MobileMediaKind { movie, series, other }

@immutable
class MobileMedia {
  const MobileMedia({
    required this.id,
    required this.title,
    this.subtitle = '',
    this.overview = '',
    this.metadata = '',
    this.posterUrl,
    this.backdropUrl,
    this.logoUrl,
    this.titleArt,
    this.titleArtSubtitle,
    this.kind = MobileMediaKind.other,
    this.progress = 0,
    this.saved = false,
    this.canPlay = true,
    this.canSave = true,
  });

  /// Includes the source server's identity, so merged libraries stay distinct.
  final String id;
  final String title;
  final String subtitle;
  final String overview;
  final String metadata;
  final String? posterUrl;
  final String? backdropUrl;
  final String? logoUrl, titleArt, titleArtSubtitle;
  final MobileMediaKind kind;
  final double progress;
  final bool saved;
  final bool canPlay;
  final bool canSave;
}

@immutable
class MobileMediaRail {
  const MobileMediaRail({
    required this.id,
    required this.title,
    required this.items,
    this.continueWatching = false,
    this.loading = false,
    this.hasMore = false,
    this.ranked = false,
  });

  final String id;
  final String title;
  final List<MobileMedia> items;
  final bool continueWatching;
  final bool loading;
  final bool hasMore;
  final bool ranked;
}

/// The host supplies its cached, authenticated, offline-aware image widget.
typedef MobileArtworkBuilder =
    Widget Function(BuildContext context, String url, BoxFit fit);

/// Localizable interface text. Mode and brand names are proper nouns.
@immutable
class MobileHomeLabels {
  const MobileHomeLabels({
    this.forYou = 'For you',
    this.movies = 'Movies',
    this.series = 'Series',
    this.saved = 'Favorites',
    this.search = 'Search',
    this.profile = 'Your profile',
    this.play = 'Play now',
    this.resume = 'Resume',
    this.details = 'Details',
    this.save = 'Add to favorites',
    this.remove = 'Remove from favorites',
    this.library = 'YOUR PERSONAL CINEMA',
    this.spotlight = 'IN THE SPOTLIGHT',
    this.empty = 'Your next great watch is waiting.',
    this.emptyHint = 'Try another category or refresh your library.',
    this.retry = 'Refresh library',
    this.loading = 'Finding your next great watch…',
    this.loadMore = 'Show more',
    this.saveError = 'Could not update favorites. Please try again.',
  });

  final String forYou, movies, series, saved, search, profile;
  final String play, resume, details, save, remove, library, spotlight;
  final String empty, emptyHint, retry, loading, loadMore, saveError;
}
