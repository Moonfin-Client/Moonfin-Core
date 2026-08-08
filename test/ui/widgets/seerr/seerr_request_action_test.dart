import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_request_action.dart';

final _l10n = AppLocalizationsEn();

SeerrRequest _request({
  required int status,
  bool is4k = false,
  int? requestedById,
}) => SeerrRequest(
  id: 1,
  status: status,
  type: 'tv',
  is4k: is4k,
  requestedBy: requestedById == null ? null : SeerrUser(id: requestedById),
);

SeerrQualityStatus _track({
  required int status,
  bool is4k = false,
  List<SeerrRequest> requests = const [],
  bool canManageRequests = false,
  int? currentUserId,
}) => SeerrQualityStatus.of(
  is4k: is4k,
  mediaInfo: SeerrMediaInfo(
    status: is4k ? 1 : status,
    status4k: is4k ? status : 1,
    requests: requests,
  ),
  canManageRequests: canManageRequests,
  currentUserId: currentUserId,
);

void main() {
  group('seerrRequestActionFor', () {
    test('a partially available track with an open request still offers more', () {
      final q = _track(
        status: 4,
        requests: [
          _request(status: SeerrRequest.statusPending, requestedById: 7),
        ],
        currentUserId: 7,
      );
      final action = seerrRequestActionFor(q, _l10n, allowed: true);
      expect(action.kind, SeerrRequestActionKind.request);
      expect(action.label, _l10n.requestMore);
      // The same state offers the cancel beside it, which is the whole point
      // of keeping the two controls apart.
      expect(seerrCancelLabelFor(q, _l10n), _l10n.cancelRequest);
    });

    test('an open request on a track with nothing more to ask reads requested', () {
      final q = _track(
        status: 2,
        requests: [_request(status: SeerrRequest.statusPending)],
      );
      final action = seerrRequestActionFor(q, _l10n, allowed: true);
      expect(action.kind, SeerrRequestActionKind.requested);
      expect(action.label, _l10n.seerrRequestedStatus);
    });

    test('a declined request does not block asking again', () {
      final q = _track(
        status: 1,
        requests: [_request(status: SeerrRequest.statusDeclined)],
      );
      final action = seerrRequestActionFor(q, _l10n, allowed: true);
      expect(action.kind, SeerrRequestActionKind.request);
      expect(action.label, _l10n.request);
      expect(seerrCancelLabelFor(q, _l10n), isNull);
    });

    test('without permission there is nothing to offer', () {
      final q = _track(status: 1);
      final action = seerrRequestActionFor(q, _l10n, allowed: false);
      expect(action.kind, SeerrRequestActionKind.none);
    });

    test('the 4K track speaks in 4K labels', () {
      final q = _track(status: 4, is4k: true);
      final action = seerrRequestActionFor(q, _l10n, allowed: true);
      expect(action.label, _l10n.requestMore4k);
    });

    test('a fully available continuing TV series still offers request more', () {
      final q = _track(status: 5);
      final action = seerrRequestActionFor(
        q,
        _l10n,
        allowed: true,
        isTv: true,
        isContinuing: true,
      );
      expect(action.kind, SeerrRequestActionKind.request);
      expect(action.label, _l10n.requestMore);
    });

    test('a fully available ended series has nothing left to offer', () {
      final q = _track(status: 5);
      final action = seerrRequestActionFor(
        q,
        _l10n,
        allowed: true,
        isTv: true,
        isContinuing: false,
      );
      expect(action.kind, SeerrRequestActionKind.none);
    });

    test('a continuing series still processing reads requested', () {
      final q = _track(
        status: 3,
        requests: [_request(status: SeerrRequest.statusApproved)],
      );
      final action = seerrRequestActionFor(
        q,
        _l10n,
        allowed: true,
        isTv: true,
        isContinuing: true,
      );
      expect(action.kind, SeerrRequestActionKind.requested);
    });
  });

  group('seerrCancelLabelFor', () {
    test('offers a viewer their own pending request back', () {
      final q = _track(
        status: 2,
        requests: [
          _request(status: SeerrRequest.statusPending, requestedById: 7),
        ],
        currentUserId: 7,
      );
      expect(seerrCancelLabelFor(q, _l10n), _l10n.cancelRequest);
    });

    test('does not offer someone elses request without manage rights', () {
      final q = _track(
        status: 2,
        requests: [
          _request(status: SeerrRequest.statusApproved, requestedById: 9),
        ],
        currentUserId: 7,
      );
      expect(seerrCancelLabelFor(q, _l10n), isNull);
    });

    test('a manager may take back any open request', () {
      final q = _track(
        status: 2,
        requests: [
          _request(status: SeerrRequest.statusApproved, requestedById: 9),
        ],
        canManageRequests: true,
        currentUserId: 7,
      );
      expect(seerrCancelLabelFor(q, _l10n), _l10n.cancelRequest);
    });

    test('still offered when the request permission is gone', () {
      final q = _track(
        status: 4,
        requests: [
          _request(status: SeerrRequest.statusPending, requestedById: 7),
        ],
        currentUserId: 7,
      );
      final action = seerrRequestActionFor(q, _l10n, allowed: false);
      expect(action.kind, SeerrRequestActionKind.requested);
      expect(seerrCancelLabelFor(q, _l10n), _l10n.cancelRequest);
    });

    test('the 4K track cancels in 4K words', () {
      final q = _track(
        status: 2,
        is4k: true,
        requests: [
          _request(
            status: SeerrRequest.statusPending,
            is4k: true,
            requestedById: 7,
          ),
        ],
        currentUserId: 7,
      );
      expect(seerrCancelLabelFor(q, _l10n), _l10n.cancelRequest4k);
    });
  });
}
