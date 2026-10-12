import 'seerr_api_models.dart';

/// Use Seerr's season numbers. Only assume 1 through N when no list is available,
/// since providers may number seasons differently.
List<int> seerrSeasonNumbersOf(List<SeerrSeason> seasons, int fallbackCount) {
  final reported = seasons
      .where((s) => s.seasonNumber > 0)
      .map((s) => s.seasonNumber)
      .toList();
  if (reported.isNotEmpty) return reported;
  return List.generate(fallbackCount, (i) => i + 1);
}

/// Each requested TV season counts toward the request quota.
int seerrTvQuotaNeeded({
  required bool allSeasons,
  required Iterable<int> requestableSeasons,
  required Iterable<int> selectedSeasons,
}) => allSeasons
    ? requestableSeasons.toSet().length
    : selectedSeasons.toSet().length;

/// If the quota cannot be loaded, let Seerr decide whether the request is allowed.
bool seerrQuotaBlocked(SeerrQuotaDetail? quota, int needed) {
  if (quota == null || quota.isUnlimited) return false;
  return quota.restricted ||
      (quota.remaining != null && needed > quota.remaining!);
}

/// Treat seasons in active requests as already requested. Completed, failed, and declined
/// requests no longer block a new request.
Set<int> seerrRequestedSeasons(Iterable<SeerrRequest> requests) => {
  for (final request in requests)
    if (request.status != SeerrRequest.statusDeclined &&
        request.status != SeerrRequest.statusFailed &&
        request.status != SeerrRequest.statusCompleted)
      for (final season in request.seasons ?? const <SeerrSeasonRequest>[])
        season.seasonNumber,
};

/// Library coverage is quality-specific: HD availability does not cover 4K.
Set<int> seerrAvailableSeasons(
  Iterable<SeerrSeasonAvailability> seasons, {
  required bool is4k,
}) => {
  for (final season in seasons)
    if (SeerrMediaStatus.isAvailable(is4k ? season.status4k : season.status))
      season.seasonNumber,
};

Set<int> seerrUnavailableOrRequestedSeasons(
  SeerrMediaInfo? info, {
  required bool is4k,
}) => {
  ...seerrRequestedSeasons(
    (info?.requests ?? const <SeerrRequest>[]).where((r) => r.is4k == is4k),
  ),
  ...seerrAvailableSeasons(
    info?.seasons ?? const <SeerrSeasonAvailability>[],
    is4k: is4k,
  ),
};
