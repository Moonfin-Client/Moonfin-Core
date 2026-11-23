import '../db/iptv_database.dart';
import '../repositories/vod_repository.dart';
import 'tmdb_service.dart';
import 'vod_title.dart';

/// Upgrades a VOD row with TMDB artwork and metadata the first time its
/// detail is opened. Results persist on the row, and failed lookups are
/// remembered for the session so reopening an unmatched item stays fast.
class TmdbEnricher {
  final TmdbService _tmdb;
  final VodRepository _vod;
  final Set<int> _attempted = {};

  TmdbEnricher({required TmdbService tmdb, required VodRepository vod})
    : _tmdb = tmdb,
      _vod = vod;

  Future<VodItem> enrich(VodItem item) async {
    if (!_tmdb.isConfigured) return item;
    // Providers fill the plot, backdrop and TMDB id as well, so only the logo
    // and tagline, which come from TMDB alone, show a row was enriched.
    final alreadyEnriched = item.logoUrl != null || item.tagline != null;
    if (alreadyEnriched || _attempted.contains(item.id)) return item;
    _attempted.add(item.id);

    try {
      var id = item.tmdbId;
      TmdbResult? result;
      if (id == null || id == 0) {
        // The import moved the year out of the name. Putting it back as the
        // suffix keeps a year that's part of the title, like "Blade Runner
        // 2049", from being read as the release year.
        final cleaned = cleanVodTitle(
          item.year == null ? item.name : '${item.name} - ${item.year}',
        );
        final searchYear = cleaned.year;
        result = item.isSeries
            ? await _tmdb.searchTv(cleaned.title, year: searchYear)
            : await _tmdb.searchMovie(cleaned.title, year: searchYear);
        id = result?.id;
      }
      if (id != null && id != 0) {
        final detail = item.isSeries
            ? await _tmdb.getTvDetails(id)
            : await _tmdb.getMovieDetails(id);
        result = detail ?? result;
      }
      if (result == null) return item;

      await _vod.updateVodEnrichment(
        item.id,
        streamIcon: result.posterUrl,
        backdropUrl: result.backdropUrl,
        logoUrl: result.logoUrl,
        tagline: result.tagline,
        plot: result.overview,
        genre: result.genres.isNotEmpty ? result.genres.join(', ') : null,
        year: result.year,
        rating: result.voteAverage,
        durationSeconds: result.runtime != null ? result.runtime! * 60 : null,
        tmdbId: result.id != 0 ? result.id : null,
      );
      return await _vod.getVodById(item.id) ?? item;
    } catch (_) {
      return item;
    }
  }
}
