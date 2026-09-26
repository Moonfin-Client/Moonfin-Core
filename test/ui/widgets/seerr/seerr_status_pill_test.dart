import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_status_pill.dart';

SeerrQualityStatus _track({
  required bool is4k,
  required int status,
  List<SeerrRequest> requests = const [],
}) =>
    SeerrQualityStatus.of(
      is4k: is4k,
      mediaInfo: SeerrMediaInfo(
        status: is4k ? 1 : status,
        status4k: is4k ? status : 1,
        requests: requests,
      ),
      canManageRequests: false,
      currentUserId: null,
    );

void main() {
  group('seerrStatusIsNoteworthy', () {
    test('stays quiet about an HD copy you already have', () {
      expect(seerrStatusIsNoteworthy(_track(is4k: false, status: 5)), isFalse);
    });

    test('stays quiet when Seerr knows nothing about the title', () {
      expect(seerrStatusIsNoteworthy(_track(is4k: false, status: 1)), isFalse);
    });

    test('speaks up for anything still on its way', () {
      for (final status in [2, 3, 4]) {
        expect(
          seerrStatusIsNoteworthy(_track(is4k: false, status: status)),
          isTrue,
          reason: 'status $status should be noteworthy',
        );
      }
    });

    test('speaks up when a request went wrong', () {
      expect(seerrStatusIsNoteworthy(_track(is4k: false, status: 6)), isTrue);
      expect(seerrStatusIsNoteworthy(_track(is4k: false, status: 7)), isTrue);
    });

    test('speaks up about an available 4K copy, which the library may not be',
        () {
      expect(seerrStatusIsNoteworthy(_track(is4k: true, status: 5)), isTrue);
    });

    test('stays quiet about a 4K track the server does not offer', () {
      expect(seerrStatusIsNoteworthy(_track(is4k: true, status: 1)), isFalse);
    });

    test('speaks up for an open request even with no media status yet', () {
      final track = _track(
        is4k: false,
        status: 1,
        requests: [
          const SeerrRequest(
            id: 1,
            status: SeerrRequest.statusPending,
            type: 'movie',
          ),
        ],
      );
      expect(track.hasExistingRequest, isTrue);
      expect(seerrStatusIsNoteworthy(track), isTrue);
    });
  });

  group('seerrStatusTracks', () {
    final l10n = AppLocalizationsEn();
    SeerrMediaDetailState state(int permissions) => SeerrMediaDetailState(
      movie: const SeerrMovieDetails(
        id: 1,
        title: 't',
        mediaInfo: SeerrMediaInfo(status: 4, status4k: 3),
      ),
      currentUser: SeerrUser(id: 1, permissions: permissions),
    );

    test('shows HD alone to a viewer who can only request HD', () {
      final tracks = seerrStatusTracks(state(SeerrPermission.request), l10n);
      expect(tracks.map((t) => t.$2), [null]);
    });

    test('adds the 4K track for a viewer who can request 4K', () {
      final tracks = seerrStatusTracks(
        state(SeerrPermission.request4kMovie),
        l10n,
      );
      expect(tracks.map((t) => t.$2), ['HD', '4K']);
    });
  });
}
