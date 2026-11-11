import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/seerr/arr_queue.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';
import 'package:moonfin/data/services/seerr/seerr_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/data/viewmodels/seerr_requests_view_model.dart';
import 'package:moonfin/preference/seerr_preferences.dart';

class _FakeSync extends Fake implements PluginSyncService {
  bool available = true;

  @override
  bool get arrQueueAvailable => available;
}

class _FakePrefs extends Fake implements SeerrPreferences {}

const _stalled = ArrQueueItem(
  id: 41,
  title: 'Big.Buck.Bunny.2008.1080p.WEB-DL.x264-MOONFIN',
  status: 'warning',
  trackedDownloadState: 'downloading',
  errorMessage: 'qBittorrent cannot resolve magnet link with DHT disabled',
  downloadId: 'CCCC',
);

/// A Seerr server with one approved movie on its way, and a Moonbase whose
/// queue answer can be changed or held.
class _FakeSeerr extends Fake implements SeerrRepository {
  ArrQueue? queue = const ArrQueue(
    service: 'radarr',
    inArr: true,
    canRemove: true,
    items: [_stalled],
  );
  final queueCalls = <String>[];
  final removed = <int>[];
  Object? removeError;
  Completer<void>? holdQueue;
  List<SeerrRequest> requests = const [];

  static const _media = SeerrMediaInfo(
    status: 3,
    requests: [
      SeerrRequest(id: 1, status: SeerrRequest.statusApproved, type: 'movie'),
    ],
  );

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<Map<String, dynamic>> getPublicSettings() async => const {};

  @override
  Future<SeerrUser> getCurrentUser() async => SeerrUser(id: 1);

  @override
  Future<(SeerrMovieDetails, bool)> getMovieDetailsWithWatchlist(
    int tmdbId,
  ) async => (getMovieDetailsSync(tmdbId), false);

  SeerrMovieDetails getMovieDetailsSync(int tmdbId) =>
      SeerrMovieDetails(id: tmdbId, title: 'Big Buck Bunny', mediaInfo: _media);

  @override
  Future<SeerrMovieDetails> getMovieDetails(int tmdbId) async =>
      getMovieDetailsSync(tmdbId);

  @override
  Future<ArrQueue?> getArrQueue({int? tmdbId, int? tvdbId}) async {
    queueCalls.add(tmdbId != null ? 'movie:$tmdbId' : 'tv:$tvdbId');
    final answer = queue;
    await holdQueue?.future;
    return answer;
  }

  @override
  Future<void> removeArrQueueItem({
    required bool radarr,
    required int queueId,
  }) async {
    if (removeError != null) throw removeError!;
    removed.add(queueId);
    queue = const ArrQueue(service: 'radarr', inArr: true, canRemove: true);
  }

  @override
  Future<SeerrRequestListResponse> getRequests({
    String? filter,
    String? sort,
    int? requestedBy,
    int limit = 50,
    int offset = 0,
  }) async =>
      SeerrRequestListResponse(results: offset == 0 ? requests : const []);

  @override
  Future<SeerrMediaSummary?> getMediaSummary(
    int tmdbId,
    String mediaType,
  ) async => null;
}

SeerrRequest _request(
  int id, {
  String type = 'movie',
  int tmdbId = 10378,
  int? tvdbId,
  List<int> seasons = const [],
  bool is4k = false,
}) => SeerrRequest(
  id: id,
  status: SeerrRequest.statusApproved,
  type: type,
  is4k: is4k,
  media: SeerrMedia(id: id, tmdbId: tmdbId, tvdbId: tvdbId, status: 3),
  seasons: [
    for (final n in seasons)
      SeerrSeasonRequest(id: n, seasonNumber: n, status: 2),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeSync sync;
  setUp(() {
    sync = _FakeSync();
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
  });
  tearDown(() => GetIt.instance.reset());

  group('detail page', () {
    test(
      'a stuck download offers its release to an admin and removes it',
      () async {
        final seerr = _FakeSeerr();
        final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
        await vm.load('10378', 'movie');

        final stuck = vm.state.hd.replaceableDownload;
        expect(stuck?.stuckItemId, 41);
        expect(vm.state.hd.download?.reason, _stalled.errorMessage);

        expect(await vm.getDifferentRelease(queueId: 41), isTrue);
        expect(seerr.removed, [41]);
        expect(vm.state.hd.replaceableDownload, isNull);
        // Radarr has the released movie and nothing queued now.
        expect(vm.state.isRequesting, isFalse);
        vm.dispose();
      },
    );

    test('a non-admin sees the reason but nothing to remove', () async {
      final seerr = _FakeSeerr()
        ..queue = const ArrQueue(
          service: 'radarr',
          inArr: true,
          items: [_stalled],
        );
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      await vm.load('10378', 'movie');
      expect(vm.state.hd.download?.reason, _stalled.errorMessage);
      expect(vm.state.hd.replaceableDownload, isNull);
      expect(await vm.getDifferentRelease(queueId: 41), isFalse);
      expect(seerr.removed, isEmpty);
      vm.dispose();
    });

    test('a failed removal says so and keeps the download', () async {
      final seerr = _FakeSeerr()..removeError = Exception('HTTP 502');
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      await vm.load('10378', 'movie');
      expect(await vm.getDifferentRelease(queueId: 41), isFalse);
      expect(vm.state.isRequesting, isFalse);
      expect(vm.state.hd.replaceableDownload?.stuckItemId, 41);
      vm.dispose();
    });

    test('a poll that lands after a removal is thrown away', () {
      fakeAsync((async) {
        final seerr = _FakeSeerr();
        final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
        vm.load('10378', 'movie');
        async.flushMicrotasks();
        expect(vm.state.hd.replaceableDownload, isNotNull);

        // The 15 s poll reads the queue while the download is still in it,
        // and its answer is held until after the removal.
        final hold = Completer<void>();
        seerr.holdQueue = hold;
        async.elapse(const Duration(seconds: 15));
        seerr.holdQueue = null;

        bool? done;
        vm.getDifferentRelease(queueId: 41).then((v) => done = v);
        async.flushMicrotasks();
        expect(done, isTrue);

        hold.complete();
        async.flushMicrotasks();
        expect(vm.state.hd.replaceableDownload, isNull);
        vm.dispose();
      });
    });

    test('a removal for a download the page no longer shows does nothing', () async {
      final seerr = _FakeSeerr();
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      await vm.load('10378', 'movie');
      // The dialog named queue entry 40, then a poll swapped in entry 41.
      expect(await vm.getDifferentRelease(queueId: 40), isFalse);
      expect(seerr.removed, isEmpty);
      vm.dispose();
    });

    test('a queue reply for the previous title is thrown away', () async {
      final hold = Completer<void>();
      final seerr = _FakeSeerr()..holdQueue = hold;
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      // The first title's queue read is still on its way.
      unawaited(vm.load('10378', 'movie'));
      await pumpEventQueue();
      expect(seerr.queueCalls, ['movie:10378']);

      seerr
        ..holdQueue = null
        ..queue = null;
      await vm.load('20526', 'movie');
      expect(vm.state.tmdbId, 20526);

      hold.complete();
      await pumpEventQueue();
      expect(vm.state.arrQueue, isNull);
      expect(vm.state.hd.replaceableDownload, isNull);
      vm.dispose();
    });

    test('Moonbase not seeing the title keeps what Seerr reports', () async {
      final seerr = _FakeSeerr()..queue = null;
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      await vm.load('10378', 'movie');
      expect(vm.state.arrQueue, isNull);
      expect(vm.state.hd.isNotFoundYet, isFalse);
      vm.dispose();
    });
  });

  group('requests screen', () {
    test(
      'one plugin call per title, narrowed to each request\'s seasons',
      () async {
        final seerr = _FakeSeerr()
          ..queue = const ArrQueue(
            service: 'sonarr',
            inArr: true,
            items: [
              ArrQueueItem(
                id: 1,
                seasonNumber: 1,
                status: 'warning',
                downloadId: 'S1',
              ),
              ArrQueueItem(
                id: 2,
                seasonNumber: 2,
                status: 'paused',
                downloadId: 'S2',
              ),
            ],
          )
          ..requests = [
            _request(
              1,
              type: 'tv',
              tmdbId: 63639,
              tvdbId: 280619,
              seasons: [1],
            ),
            _request(
              2,
              type: 'tv',
              tmdbId: 63639,
              tvdbId: 280619,
              seasons: [2],
            ),
            _request(3, type: 'tv', tmdbId: 63639, tvdbId: 280619, is4k: true),
          ];
        final vm = SeerrRequestsViewModel(seerr);
        await vm.load();
        await pumpEventQueue();

        expect(seerr.queueCalls, ['tv:280619']);
        final s = vm.state;
        expect(s.downloadFor(s.requests[0])?.state, SeerrDownloadState.stalled);
        expect(s.downloadFor(s.requests[1])?.state, SeerrDownloadState.paused);
        // 4K keeps what Seerr reports, which here is nothing.
        expect(s.downloadFor(s.requests[2]), isNull);
        vm.dispose();
      },
    );

    test('a title Moonbase stops seeing falls back to Seerr', () async {
      final seerr = _FakeSeerr()..requests = [_request(1)];
      final vm = SeerrRequestsViewModel(seerr);
      await vm.load();
      await pumpEventQueue();
      expect(vm.state.arrQueues, contains('movie:10378'));

      seerr.queue = null;
      await vm.refresh();
      await pumpEventQueue();
      expect(vm.state.arrQueues, isEmpty);
      expect(vm.state.downloadFor(vm.state.requests.single), isNull);
      vm.dispose();
    });

    test('a released movie with nothing queued is not found yet', () async {
      final seerr = _FakeSeerr()
        ..queue = const ArrQueue(
          service: 'radarr',
          inArr: true,
          monitored: true,
          hasFile: false,
          isAvailable: true,
        )
        ..requests = [_request(1)];
      final vm = SeerrRequestsViewModel(seerr);
      await vm.load();
      await pumpEventQueue();
      expect(vm.state.isNotFoundYet(vm.state.requests.single), isTrue);
      vm.dispose();
    });

    test('a not found yet card keeps checking until the arr grabs one', () {
      fakeAsync((async) {
        final seerr = _FakeSeerr()
          ..queue = const ArrQueue(
            service: 'radarr',
            inArr: true,
            monitored: true,
            hasFile: false,
            isAvailable: true,
          )
          ..requests = [_request(1)];
        final vm = SeerrRequestsViewModel(seerr);
        vm.load();
        async.flushMicrotasks();
        expect(vm.state.isNotFoundYet(vm.state.requests.single), isTrue);

        seerr.queue = const ArrQueue(
          service: 'radarr',
          inArr: true,
          canRemove: true,
          items: [_stalled],
        );
        async.elapse(const Duration(seconds: 15));
        expect(
          vm.state.downloadFor(vm.state.requests.single)?.state,
          SeerrDownloadState.stalled,
        );
        vm.dispose();
      });
    });

    test('queues are dropped once Moonbase stops offering them', () async {
      final seerr = _FakeSeerr()..requests = [_request(1)];
      final vm = SeerrRequestsViewModel(seerr);
      await vm.load();
      await pumpEventQueue();
      expect(vm.state.arrQueues, isNotEmpty);

      sync.available = false;
      await vm.refresh();
      await pumpEventQueue();
      expect(vm.state.arrQueues, isEmpty);
      vm.dispose();
    });

    test('an older queue reply can\'t replace a newer one', () async {
      final hold = Completer<void>();
      final seerr = _FakeSeerr()
        ..requests = [_request(1)]
        ..holdQueue = hold;
      final vm = SeerrRequestsViewModel(seerr);
      // The load's read answers with the stuck download, but slowly.
      await vm.load();
      await pumpEventQueue();

      // The refresh's read answers first: the arr has nothing queued.
      const empty = ArrQueue(service: 'radarr', inArr: true);
      seerr
        ..holdQueue = null
        ..queue = empty;
      await vm.refresh();
      await pumpEventQueue();
      expect(vm.state.arrQueues['movie:10378']?.items, isEmpty);

      hold.complete();
      await pumpEventQueue();
      expect(vm.state.arrQueues['movie:10378']?.items, isEmpty);
      vm.dispose();
    });

    test('closing the screen mid-fetch starts nothing', () async {
      final hold = Completer<void>();
      final seerr = _FakeSeerr()
        ..requests = [_request(1)]
        ..holdQueue = hold;
      final vm = SeerrRequestsViewModel(seerr);
      await vm.load();
      vm.dispose();
      hold.complete();
      // Would throw on notifyListeners after dispose, or leave a timer
      // running, which the test binding reports.
      await pumpEventQueue();
    });
  });
}
