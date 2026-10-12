import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/playback/cinema_mode_controller.dart';

void main() {
  test('Cinema can request only seasons not already available or pending', () {
    const details = SeerrTvDetails(
      id: 42,
      numberOfSeasons: 3,
      mediaInfo: SeerrMediaInfo(
        status: SeerrMediaStatus.partiallyAvailable,
        seasons: [
          SeerrSeasonAvailability(seasonNumber: 1, status: SeerrMediaStatus.available),
        ],
        requests: [
          SeerrRequest(
            id: 1,
            status: SeerrRequest.statusApproved,
            type: 'tv',
            seasons: [
              SeerrSeasonRequest(id: 1, seasonNumber: 2, status: 2),
            ],
          ),
        ],
      ),
    );
    expect(cinemaRequestableSeasons(details), {3});
    expect(cinemaTvSeerrState(details), CinemaSeerrState.request);
    expect(
      cinemaTvSeerrState(details, excludedSeasons: {3}),
      CinemaSeerrState.requested,
    );
  });

  test('All Seasons works but invalid or over-quota choices are rejected', () {
    final all = cinemaTvRequestSelection(
      {'allSeasons': true, 'seasons': <int>[]},
      {2, 5},
      const SeerrQuotaDetail(limit: 4, remaining: 2),
    );
    expect(all?.allSeasons, isTrue);
    expect(all?.seasons, isNull);

    for (final invalid in [
      {'seasons': [2]},
      {'allSeasons': false, 'seasons': [2.0]},
      {'allSeasons': false, 'seasons': [99]},
      {'allSeasons': false, 'seasons': <int>[]},
      {'allSeasons': true, 'seasons': [2]},
    ]) {
      expect(cinemaTvRequestSelection(invalid, {2, 5}, null), isNull);
    }
    expect(
      cinemaTvRequestSelection(
        {'allSeasons': true, 'seasons': <int>[]},
        <int>{},
        null,
      ),
      isNull,
    );
    expect(
      cinemaTvRequestSelection(
        {'allSeasons': true, 'seasons': <int>[]},
        {2, 5},
        const SeerrQuotaDetail(limit: 2, remaining: 1),
      ),
      isNull,
    );
  });
}
