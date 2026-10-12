import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/playback/cinema_mode_controller.dart';

class _Repo extends Fake implements SeerrRepository {
  int permissions = SeerrPermission.requestTv;
  int submissions = 0;
  int lookups = 0;
  Completer<Map<String, dynamic>>? settingsResponse;
  final submittedSeasons = <List<int>?>[];
  final submitted4k = <bool>[];
  final post = Completer<SeerrRequest>();
  SeerrTvDetails refreshed = const SeerrTvDetails(id: 42);

  @override
  bool get isAvailable => true;

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<SeerrUser> getCurrentUser() async =>
      SeerrUser(id: 5, permissions: permissions);

  @override
  Future<Map<String, dynamic>> getPublicSettings() =>
      settingsResponse?.future ?? Future.value({'series4kEnabled': true});

  @override
  Future<SeerrRequest> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) {
    expect(mediaId, 42);
    expect(mediaType, 'tv');
    submissions++;
    submittedSeasons.add(seasons);
    submitted4k.add(is4k);
    return post.future;
  }

  @override
  Future<SeerrTvDetails> getTvDetails(int id) async {
    expect(id, 42);
    lookups++;
    return refreshed;
  }
}

const _original = SeerrTvDetails(
  id: 42,
  numberOfSeasons: 3,
  mediaInfo: SeerrMediaInfo(
    status: SeerrMediaStatus.partiallyAvailable,
    seasons: [
      SeerrSeasonAvailability(seasonNumber: 1, status: SeerrMediaStatus.available),
    ],
  ),
);

Map<String, dynamic> _item() => {
  'Type': 'Series',
  'RunTimeTicks': 900000000,
  'ProviderIds': {'Tmdb': '42'},
};

SeerrTvDetails _requestedSeasons(List<int> seasons) => SeerrTvDetails(
  id: 42,
  mediaInfo: SeerrMediaInfo(
    status: SeerrMediaStatus.processing,
    requests: [
      SeerrRequest(
        id: 8,
        status: SeerrRequest.statusApproved,
        type: 'tv',
        seasons: [
          for (final number in seasons)
            SeerrSeasonRequest(id: number, seasonNumber: number, status: 2),
        ],
      ),
    ],
  ),
);

void main() {
  test('4K TV requests use their own seasons and recheck late settings', () async {
    final repo = _Repo()
      ..permissions = SeerrPermission.request4kTv
      ..refreshed = _original;
    var disable4kWhileOpen = false;
    repo.post.complete(const SeerrRequest(
      id: 8,
      type: 'tv',
      status: SeerrRequest.statusApproved,
      is4k: true,
    ));
    final controller = CinemaModeController(
      seerr: () async => repo,
      accountKey: () => 'server/user',
      onSkip: () async {},
      onRequestSeries: (_, _, _, options, isCurrent, submit) async {
        expect(options.standard, isFalse);
        expect(options.fourK, isTrue);
        if (disable4kWhileOpen) {
          repo.settingsResponse!.complete({'series4kEnabled': false});
          await Future<void>.delayed(Duration.zero);
        }
        // Season 1 exists in HD but is still requestable in 4K.
        return submit({
          'is4k': true,
          'allSeasons': false,
          'seasons': <int>[1],
        }, null, isCurrent);
      },
    );
    try {
      controller.enter(item: _item(), resolveMedia: () async => null);
      await Future<void>.delayed(Duration.zero);
      expect(controller.only4kRequestable, isTrue);
      await controller.request();
      expect(repo.submitted4k, [true]);
      expect(repo.submittedSeasons, [[1]]);

      // The same user cannot submit through the standard track.
      final denied = await submitCinemaTvRequest(
        repository: repo,
        details: _original,
        selection: {'is4k': false, 'allSeasons': false, 'seasons': <int>[2]},
        quota: null,
        isAllowed: () => true,
        allowStandard: false,
        allow4k: true,
      );
      expect(denied, isNull);
      expect(repo.submissions, 1);

      // Keep the picker open until the delayed settings response disables 4K.
      disable4kWhileOpen = true;
      repo.settingsResponse = Completer<Map<String, dynamic>>();
      controller.enter(item: _item(), resolveMedia: () async => null);
      await Future<void>.delayed(Duration.zero);
      expect(controller.canRequest, isTrue);
      await controller.request();
      expect(controller.only4kRequestable, isFalse);
      expect(repo.submissions, 1);
    } finally {
      controller.dispose();
    }
  });

  test('accepted seasons do not block Request More for other seasons', () async {
    final repo = _Repo()..refreshed = _original;
    repo.post.complete(const SeerrRequest(
      id: 8,
      type: 'tv',
      status: SeerrRequest.statusApproved,
    ));
    final excluded = <Set<int>>[];
    final controller = CinemaModeController(
      seerr: () async => repo,
      accountKey: () => 'server/user',
      onSkip: () async {},
      onRequestSeries: (_, _, _, options, isCurrent, submit) {
        excluded.add({...options.excludedStandard});
        return submit({
          'allSeasons': false,
          'seasons': <int>[excluded.length + 1],
        }, null, isCurrent);
      },
    );
    try {
      controller.enter(item: _item(), resolveMedia: () async => null);
      await Future<void>.delayed(Duration.zero);
      await controller.request();
      expect(controller.canRequest, isTrue);
      await controller.request();
      expect(excluded, [<int>{}, <int>{2}]);
      expect(repo.submittedSeasons, [[2], [3]]);
      expect(controller.canRequest, isFalse);
    } finally {
      controller.dispose();
    }
  });

  test('a timed-out All Seasons request confirms the exact missing seasons', () {
    fakeAsync((clock) {
      final repo = _Repo();
      SeerrTvDetails? confirmed;
      submitCinemaTvRequest(
        repository: repo,
        details: _original,
        selection: {'allSeasons': true, 'seasons': <int>[]},
        quota: null,
        isAllowed: () => true,
      ).then((value) => confirmed = value?.confirmed);
      clock.flushMicrotasks();
      repo.refreshed = _requestedSeasons([2, 3]);
      clock.elapse(const Duration(seconds: 20));
      clock.flushMicrotasks();
      expect(repo.submissions, 1);
      expect(confirmed, same(repo.refreshed));
    });
  });

  test('a standard request cannot confirm a timed-out 4K request', () {
    fakeAsync((clock) {
      final repo = _Repo();
      Object? failure;
      submitCinemaTvRequest(
        repository: repo,
        details: _original,
        selection: {'is4k': true, 'allSeasons': false, 'seasons': <int>[2]},
        quota: null,
        isAllowed: () => true,
        allowStandard: false,
        allow4k: true,
      ).then<void>(
        (_) {},
        onError: (Object e) => failure = e,
      );
      clock.flushMicrotasks();
      repo.refreshed = _requestedSeasons([2]); // Standard, not 4K.
      clock.elapse(const Duration(seconds: 20));
      clock.flushMicrotasks();
      expect(repo.submitted4k, [true]);
      expect(repo.submissions, 1);
      expect(failure, isA<TimeoutException>());
    });
  });

  test('closing a picker skips timeout reconciliation', () {
    fakeAsync((clock) {
      final repo = _Repo();
      var allowed = true;
      Object? result;
      submitCinemaTvRequest(
        repository: repo,
        details: _original,
        selection: {'allSeasons': false, 'seasons': <int>[2]},
        quota: null,
        isAllowed: () => allowed,
      ).then((value) => result = value);
      clock.flushMicrotasks();
      allowed = false;
      clock.elapse(const Duration(seconds: 20));
      clock.flushMicrotasks();
      expect(repo.submissions, 1);
      expect(repo.lookups, 0);
      expect(result, isNull);
    });
  });
}
