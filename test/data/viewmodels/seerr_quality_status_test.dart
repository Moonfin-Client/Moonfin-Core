import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';

SeerrRequest _request({
  required int id,
  required int status,
  bool is4k = false,
  List<int> seasons = const [],
  int? requestedById,
}) =>
    SeerrRequest(
      id: id,
      status: status,
      type: 'movie',
      is4k: is4k,
      requestedBy: requestedById == null ? null : SeerrUser(id: requestedById),
      seasons: seasons.isEmpty
          ? null
          : [
              for (final n in seasons)
                SeerrSeasonRequest(id: n, seasonNumber: n, status: 1),
            ],
    );

void main() {
  group('SeerrQualityStatus', () {
    test('routes status and status4k to their own tracks', () {
      const info = SeerrMediaInfo(status: 5, status4k: 1);
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.isFullyAvailable, isTrue);
      expect(hd.hasAnyState, isTrue);
      expect(uhd.isFullyAvailable, isFalse);
      expect(uhd.hasAnyState, isFalse);
    });

    test('partitions requests by is4k so each track has its own slot', () {
      final info = SeerrMediaInfo(
        status: 2,
        status4k: 2,
        requests: [
          _request(id: 1, status: SeerrRequest.statusApproved),
          _request(id: 2, status: SeerrRequest.statusPending, is4k: true),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: true,
        currentUserId: null,
      );
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: info,
        canManageRequests: true,
        currentUserId: null,
      );

      expect(hd.activeRequests.map((r) => r.id), [1]);
      expect(uhd.activeRequests.map((r) => r.id), [2]);
      expect(hd.hasExistingRequest, isTrue);
      expect(uhd.hasExistingRequest, isTrue);
      expect(hd.cancelableRequests.map((r) => r.id), [1]);
      expect(uhd.cancelableRequests.map((r) => r.id), [2]);
    });

    test('requestedSeasons only counts the track\'s own flavor', () {
      final info = SeerrMediaInfo(
        requests: [
          _request(id: 1, status: SeerrRequest.statusApproved, seasons: [1, 2]),
          _request(
            id: 2,
            status: SeerrRequest.statusPending,
            is4k: true,
            seasons: [1],
          ),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.requestedSeasons, {1, 2});
      expect(uhd.requestedSeasons, {1});
    });

    test('unavailableOrRequestedSeasons includes seasons available in library',
        () {
      final info = SeerrMediaInfo(
        seasons: const [
          SeerrSeasonAvailability(seasonNumber: 3, status: 5),
        ],
        requests: [
          _request(id: 1, status: SeerrRequest.statusApproved, seasons: [2]),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.requestedSeasons, {2});
      expect(hd.availableSeasons, {3});
      expect(hd.unavailableOrRequestedSeasons, {2, 3});
    });

    test('declined and failed requests are not active and free their seasons',
        () {
      final info = SeerrMediaInfo(
        requests: [
          _request(id: 1, status: SeerrRequest.statusDeclined, seasons: [1]),
          _request(id: 2, status: SeerrRequest.statusFailed, seasons: [2]),
          _request(id: 3, status: SeerrRequest.statusCompleted, seasons: [3]),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: true,
        currentUserId: null,
      );

      expect(hd.activeRequests, isEmpty);
      expect(hd.hasExistingRequest, isFalse);
      // Completed requests still hold their seasons, declined/failed do not.
      expect(hd.requestedSeasons, {3});
    });

    test('a user may cancel their own request only while it is pending', () {
      final info = SeerrMediaInfo(
        requests: [
          _request(
            id: 1,
            status: SeerrRequest.statusPending,
            requestedById: 7,
          ),
          _request(
            id: 2,
            status: SeerrRequest.statusApproved,
            requestedById: 7,
          ),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: 7,
      );

      expect(hd.activeRequests, hasLength(2));
      expect(hd.cancelableRequests.map((r) => r.id), [1]);
    });

    test('a user may not cancel someone else\'s pending request', () {
      final info = SeerrMediaInfo(
        requests: [
          _request(
            id: 1,
            status: SeerrRequest.statusPending,
            requestedById: 3,
          ),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: 7,
      );

      expect(hd.activeRequests, hasLength(1));
      expect(hd.cancelableRequests, isEmpty);
    });

    test('a request manager may cancel pending and approved requests', () {
      final info = SeerrMediaInfo(
        requests: [
          _request(
            id: 1,
            status: SeerrRequest.statusPending,
            requestedById: 3,
          ),
          _request(
            id: 2,
            status: SeerrRequest.statusApproved,
            requestedById: 4,
          ),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: true,
        currentUserId: 7,
      );

      expect(hd.cancelableRequests.map((r) => r.id), [1, 2]);
    });

    test('an unknown current user gets no cancel outside managing', () {
      final info = SeerrMediaInfo(
        requests: [_request(id: 1, status: SeerrRequest.statusPending)],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.cancelableRequests, isEmpty);
    });

    test('null mediaInfo yields an inert track', () {
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: null,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(uhd.status, 0);
      expect(uhd.hasAnyState, isFalse);
      expect(uhd.hasExistingRequest, isFalse);
      expect(uhd.requestedSeasons, isEmpty);
      expect(uhd.download, isNull);
    });

    test('download routes the flavor\'s own status and queue items', () {
      const item = SeerrDownloadingItem(size: 100, sizeLeft: 50);
      const info = SeerrMediaInfo(
        status: 5,
        status4k: 3,
        downloadStatus4k: [item],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.download, isNull);
      expect(uhd.download, isA<SeerrDownloadSummary>());
    });

    test('seasonStatus prefers what the server reports per season', () {
      const info = SeerrMediaInfo(
        status: 4,
        seasons: [
          SeerrSeasonAvailability(seasonNumber: 1, status: 5),
          SeerrSeasonAvailability(seasonNumber: 2, status: 3),
          // Unknown seasons carry no meaning, so they never reach the UI.
          SeerrSeasonAvailability(seasonNumber: 3, status: 1),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.seasonStatus, {1: 5, 2: 3});
    });

    test('seasonStatus falls back to requests when the server reports none', () {
      final info = SeerrMediaInfo(
        status: 2,
        requests: [
          _request(id: 1, status: SeerrRequest.statusApproved, seasons: [1]),
          _request(id: 2, status: SeerrRequest.statusPending, seasons: [2]),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      // Approved means it is being fetched, pending means nobody has said yes.
      expect(hd.seasonStatus, {1: 3, 2: 2});
    });

    test('seasonStatus lets the server override a request-derived season', () {
      final info = SeerrMediaInfo(
        status: 4,
        seasons: const [SeerrSeasonAvailability(seasonNumber: 1, status: 5)],
        requests: [
          _request(id: 1, status: SeerrRequest.statusApproved, seasons: [1, 2]),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.seasonStatus, {1: 5, 2: 3});
    });

    test('seasonStatus keeps the two quality tracks apart', () {
      final info = SeerrMediaInfo(
        status: 5,
        status4k: 3,
        seasons: const [
          SeerrSeasonAvailability(seasonNumber: 1, status: 5, status4k: 3),
        ],
        requests: [
          _request(
            id: 1,
            status: SeerrRequest.statusPending,
            is4k: true,
            seasons: [2],
          ),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );
      final uhd = SeerrQualityStatus.of(
        is4k: true,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.seasonStatus, {1: 5});
      expect(uhd.seasonStatus, {1: 3, 2: 2});
    });

    test('seasonStatus ignores declined and failed requests', () {
      final info = SeerrMediaInfo(
        status: 1,
        requests: [
          _request(id: 1, status: SeerrRequest.statusDeclined, seasons: [1]),
          _request(id: 2, status: SeerrRequest.statusFailed, seasons: [2]),
          _request(id: 3, status: SeerrRequest.statusCompleted, seasons: [3]),
        ],
      );
      final hd = SeerrQualityStatus.of(
        is4k: false,
        mediaInfo: info,
        canManageRequests: false,
        currentUserId: null,
      );

      expect(hd.seasonStatus, {3: 5});
    });
  });

  group('SeerrMediaDetailState', () {
    test('a title with no 4K backend keeps the 4K track inert', () {
      final info = SeerrMediaInfo(
        status: 4,
        status4k: 1,
        requests: [_request(id: 1, status: SeerrRequest.statusApproved)],
      );
      final state = SeerrMediaDetailState(
        movie: SeerrMovieDetails(id: 1, title: 't', mediaInfo: info),
      );

      expect(state.hd.isPartiallyAvailable, isTrue);
      expect(state.hd.hasExistingRequest, isTrue);
      expect(state.uhd.hasExistingRequest, isFalse);
      expect(state.uhd.hasAnyState, isFalse);
      expect(state.allActiveRequests, hasLength(1));
      expect(state.isAvailableAnyQuality, isTrue);
    });

    test('isAvailableAnyQuality covers a title available only in 4K', () {
      const state = SeerrMediaDetailState();
      expect(state.isAvailableAnyQuality, isFalse);

      const info = SeerrMediaInfo(status: 1, status4k: 5);
      final state4k = SeerrMediaDetailState(
        movie: SeerrMovieDetails(id: 1, title: 't', mediaInfo: info),
      );
      expect(state4k.hd.isAvailable, isFalse);
      expect(state4k.isAvailableAnyQuality, isTrue);
    });
  });
}
