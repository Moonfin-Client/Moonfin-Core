import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/arr_queue.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';

void main() {
  const gb = 1000 * 1000 * 1000;

  // Shapes Moonbase returned on the local Radarr/Sonarr stack.
  Map<String, dynamic> radarrAnswer({
    List<Map<String, dynamic>> items = const [],
    bool? hasFile = false,
    bool? isAvailable = true,
    bool monitored = true,
    bool canRemove = false,
  }) => {
    'service': 'radarr',
    'inArr': true,
    'canRemove': canRemove,
    'monitored': monitored,
    'hasFile': hasFile,
    'isAvailable': isAvailable,
    'items': items,
  };

  const stalledItem = {
    'id': 1113619046,
    'title': 'Big.Buck.Bunny.2008.1080p.WEB-DL.x264-MOONFIN',
    'status': 'warning',
    'trackedDownloadState': 'downloading',
    'trackedDownloadStatus': 'ok',
    'size': 0,
    'sizeleft': 0,
    'downloadId': 'CCCC',
    'errorMessage': 'qBittorrent cannot resolve magnet link with DHT disabled',
    'statusMessages': <Object>[],
  };

  group('parsing', () {
    test('reads the answer and its items', () {
      final queue = ArrQueue.fromJson(
        radarrAnswer(items: [stalledItem], canRemove: true),
      );
      expect(queue.isRadarr, isTrue);
      expect(queue.serviceName, 'Radarr');
      expect(queue.canRemove, isTrue);
      final item = queue.items.single;
      expect(item.id, 1113619046);
      expect(item.sizeLeft, 0);
      expect(item.downloadId, 'CCCC');
    });

    test('Sonarr leaves out hasFile, isAvailable and timeleft', () {
      final queue = ArrQueue.fromJson(const {
        'service': 'sonarr',
        'inArr': true,
        'canRemove': false,
        'monitored': true,
        'items': [
          {'id': 1, 'seasonNumber': 1, 'episodeNumber': 2, 'downloadId': 'D'},
        ],
      });
      expect(queue.isRadarr, isFalse);
      expect(queue.serviceName, 'Sonarr');
      expect(queue.hasFile, isNull);
      expect(queue.items.single.seasonNumber, 1);
      expect(queue.items.single.timeLeft, isNull);
    });
  });

  group('reason', () {
    ArrQueueItem item(Map<String, dynamic> json) =>
        ArrQueueItem.fromJson({'id': 1, ...json});

    test('the error message comes first', () {
      expect(item(stalledItem).reason, stalledItem['errorMessage']);
    });

    test('then the first import message, then a message title', () {
      expect(
        item(const {
          'statusMessages': [
            {'title': 'Big.Buck.Bunny.mkv', 'messages': <String>[]},
            {
              'title': 'Big.Buck.Bunny.mkv',
              'messages': ['  ', 'No audio tracks detected'],
            },
          ],
        }).reason,
        'No audio tracks detected',
      );
      expect(
        item(const {
          'statusMessages': [
            {'title': 'Sample', 'messages': <String>[]},
          ],
        }).reason,
        'Sample',
      );
      expect(item(const {'errorMessage': ' '}).reason, isNull);
    });
  });

  group('what the arr waits on', () {
    ArrWait? wait(Map<String, dynamic> json) => ArrQueue.fromJson(json).wait;
    // Dates relative to now, so the tests don't age.
    final soon = DateTime.now().toUtc().add(const Duration(days: 7));
    final gone = DateTime.now().toUtc().subtract(const Duration(days: 7));

    test('a released, monitored movie with no file and an empty queue is not '
        'found yet, with when Radarr last searched', () {
      expect(wait(radarrAnswer()), isA<ArrNotFoundYet>());
      final found = wait({
        ...radarrAnswer(),
        'lastSearchTime': '2026-11-12T08:00:00Z',
      });
      expect(
        (found as ArrNotFoundYet).lastSearch?.toUtc(),
        DateTime.utc(2026, 11, 12, 8),
      );
    });

    test('nothing while something is in the queue, even mid-search', () {
      expect(wait(radarrAnswer(items: [stalledItem])), isNull);
      expect(
        wait({
          ...radarrAnswer(items: [stalledItem]),
          'searching': true,
        }),
        isNull,
      );
    });

    test('a search running now comes before the rest', () {
      expect(
        wait({...radarrAnswer(isAvailable: false), 'searching': true}),
        isA<ArrSearching>(),
      );
      expect(
        wait({...radarrAnswer(), 'searching': false}),
        isA<ArrNotFoundYet>(),
      );
    });

    test('an unreleased movie is not out yet, with its release date when '
        'Moonbase sends one', () {
      final bare = wait(radarrAnswer(isAvailable: false));
      expect(bare, isA<ArrNotReleased>());
      expect((bare as ArrNotReleased).date, isNull);
      expect(bare.nextEpisode, isFalse);
      final dated = wait({
        ...radarrAnswer(isAvailable: false),
        'releaseDate': soon.toIso8601String(),
      });
      expect((dated as ArrNotReleased).date?.toUtc(), soon);
    });

    test('a release date already gone is kept, for the label to leave out', () {
      final held = wait({
        ...radarrAnswer(isAvailable: false),
        'releaseDate': gone.toIso8601String(),
      });
      expect((held as ArrNotReleased).date?.toUtc(), gone);
    });

    test('nothing for an unmonitored or downloaded movie, or when Radarr '
        "couldn't say", () {
      expect(wait(radarrAnswer(monitored: false)), isNull);
      expect(wait(radarrAnswer(hasFile: true)), isNull);
      expect(wait(radarrAnswer(isAvailable: null)), isNull);
    });

    Map<String, dynamic> sonarrAnswer(List<Map<String, dynamic>> seasons) => {
      'service': 'sonarr',
      'inArr': true,
      'monitored': true,
      'items': const <Object>[],
      'seasons': seasons,
    };

    const done = {
      'seasonNumber': 1,
      'monitored': true,
      'episodeCount': 10,
      'episodeFileCount': 10,
    };
    final airing = {
      'seasonNumber': 2,
      'monitored': true,
      'episodeCount': 3,
      'episodeFileCount': 3,
      'nextAiring': soon.toIso8601String(),
    };
    const missing = {
      'seasonNumber': 3,
      'monitored': true,
      'episodeCount': 4,
      'episodeFileCount': 1,
    };

    test('a season with aired episodes missing is not found yet', () {
      expect(
        wait(sonarrAnswer([done, airing, missing])),
        isA<ArrNotFoundYet>(),
      );
    });

    test('a season with every aired episode waits on its next airing', () {
      final next = wait(sonarrAnswer([done, airing]));
      expect((next as ArrNotReleased).date?.toUtc(), soon);
      expect(next.nextEpisode, isTrue);
    });

    test('a request only waits on the seasons it asked for', () {
      final queue = ArrQueue.fromJson(sonarrAnswer([done, airing, missing]));
      expect(queue.forSeasons([2]).wait, isA<ArrNotReleased>());
      expect(queue.forSeasons([1]).wait, isNull);
    });

    test('specials and unmonitored seasons are left out unless asked for', () {
      const specials = {
        'seasonNumber': 0,
        'monitored': true,
        'episodeCount': 5,
        'episodeFileCount': 0,
      };
      final unwatched = {...missing, 'monitored': false};
      final queue = ArrQueue.fromJson(
        sonarrAnswer([done, specials, unwatched]),
      );
      expect(queue.wait, isNull);
      expect(queue.forSeasons([0]).wait, isA<ArrNotFoundYet>());
    });

    test('nothing for Sonarr from a Moonbase that sends no seasons', () {
      expect(
        const ArrQueue(service: 'sonarr', inArr: true, monitored: true).wait,
        isNull,
      );
    });
  });

  test('a season request keeps only its seasons', () {
    const queue = ArrQueue(
      service: 'sonarr',
      inArr: true,
      items: [
        ArrQueueItem(id: 1, seasonNumber: 1, downloadId: 'S1'),
        ArrQueueItem(id: 2, seasonNumber: 2, downloadId: 'S2'),
      ],
    );
    expect(queue.forSeasons([2]).items.map((i) => i.id), [2]);
    expect(queue.forSeasons(const []).items, hasLength(2));
  });

  group('summary from the arr queue', () {
    test('a stalled torrent says why, and can be swapped', () {
      final summary = SeerrDownloadSummary.fromArrItems(
        ArrQueue.fromJson(radarrAnswer(items: [stalledItem])).items,
      )!;
      expect(summary.state, SeerrDownloadState.stalled);
      expect(summary.reason, stalledItem['errorMessage']);
      expect(summary.isStuck, isTrue);
      expect(summary.stuckItemId, 1113619046);
      expect(summary.stuckRelease, stalledItem['title']);
    });

    test('a blocked import outranks the client calling it completed', () {
      final summary = SeerrDownloadSummary.fromArrItems(const [
        ArrQueueItem(
          id: 7,
          status: 'completed',
          trackedDownloadState: 'importBlocked',
          trackedDownloadStatus: 'warning',
          size: 2 * gb,
          sizeLeft: 0,
          downloadId: 'X',
          statusMessages: [
            ArrStatusMessage(
              title: 'Movie.mkv',
              messages: ['Found executable file with extension .exe'],
            ),
          ],
        ),
      ])!;
      expect(summary.state, SeerrDownloadState.importBlocked);
      expect(summary.fraction, 1.0);
      expect(summary.reason, 'Found executable file with extension .exe');
      expect(summary.stuckItemId, 7);
    });

    // What Radarr 6 reported for a release holding an .exe: still pending,
    // with a warning, and it never imports by itself.
    test('a flagged pending import is blocked, a clean one is waiting', () {
      ArrQueueItem pending(String trackedStatus) => ArrQueueItem(
        id: 3,
        status: 'completed',
        trackedDownloadState: 'importPending',
        trackedDownloadStatus: trackedStatus,
        size: 5056,
        sizeLeft: 0,
        downloadId: 'B9AD',
        statusMessages: const [
          ArrStatusMessage(
            title: 'Tears.of.Steel.2012.1080p.WEB-DL.x264-MOONFIN',
            messages: ['Caution: Found executable file'],
          ),
        ],
      );
      final blocked = SeerrDownloadSummary.fromArrItems([pending('warning')])!;
      expect(blocked.state, SeerrDownloadState.importBlocked);
      expect(blocked.reason, 'Caution: Found executable file');
      expect(blocked.stuckItemId, 3);

      final waiting = SeerrDownloadSummary.fromArrItems([pending('ok')])!;
      expect(waiting.state, SeerrDownloadState.waitingForImport);
      expect(waiting.stuckItemId, isNull);
    });

    test('import states and failures map to the bar states', () {
      SeerrDownloadState stateOf(String tracked) =>
          SeerrDownloadSummary.fromArrItems([
            ArrQueueItem(
              id: 1,
              status: 'downloading',
              trackedDownloadState: tracked,
              size: gb,
              sizeLeft: gb ~/ 2,
              downloadId: 'A',
            ),
          ])!.state;
      expect(stateOf('importPending'), SeerrDownloadState.waitingForImport);
      expect(stateOf('importing'), SeerrDownloadState.waitingForImport);
      expect(stateOf('failedPending'), SeerrDownloadState.failed);
      expect(stateOf('downloading'), SeerrDownloadState.downloading);
    });

    test('a healthy download has no reason and nothing to swap', () {
      final summary = SeerrDownloadSummary.fromArrItems(const [
        ArrQueueItem(
          id: 1,
          status: 'downloading',
          trackedDownloadState: 'downloading',
          trackedDownloadStatus: 'ok',
          errorMessage: 'ignored while healthy',
          size: gb,
          sizeLeft: gb ~/ 4,
          timeLeft: '00:10:00',
          downloadId: 'A',
        ),
      ])!;
      expect(summary.state, SeerrDownloadState.downloading);
      expect(summary.reason, isNull);
      expect(summary.stuckItemId, isNull);
      expect(summary.timeLeft, const Duration(minutes: 10));
    });

    test('an ignored download is left out', () {
      expect(
        SeerrDownloadSummary.fromArrItems(const [
          ArrQueueItem(id: 1, trackedDownloadState: 'ignored', downloadId: 'A'),
        ]),
        isNull,
      );
    });

    test('a season pack counts once, and the stuck one decides', () {
      final summary = SeerrDownloadSummary.fromArrItems([
        for (var e = 1; e <= 10; e++)
          ArrQueueItem(
            id: 100 + e,
            status: 'warning',
            trackedDownloadState: 'downloading',
            errorMessage: 'stalled',
            size: 30 * gb,
            sizeLeft: 30 * gb,
            downloadId: 'PACK',
            seasonNumber: 1,
          ),
        const ArrQueueItem(
          id: 9,
          status: 'downloading',
          size: 10 * gb,
          sizeLeft: 5 * gb,
          downloadId: 'OTHER',
        ),
      ])!;
      expect(summary.totalBytes, 40 * gb);
      expect(summary.state, SeerrDownloadState.stalled);
      expect(summary.stuckItemId, 101);
    });

    const stalledQueue = ArrQueue(
      service: 'radarr',
      inArr: true,
      items: [ArrQueueItem(id: 1, status: 'warning', downloadId: 'A')],
    );

    test('the media status gate still applies', () {
      expect(
        SeerrDownloadSummary.forMedia(
          status: 5,
          items: null,
          arrQueue: stalledQueue,
        ),
        isNull,
      );
      expect(
        SeerrDownloadSummary.forMedia(
          status: 3,
          items: null,
          arrQueue: stalledQueue,
        )?.state,
        SeerrDownloadState.stalled,
      );
    });

    test('a 4K request ignores the arr and keeps Seerr\'s status', () {
      const request = SeerrRequest(
        id: 1,
        status: SeerrRequest.statusApproved,
        type: 'movie',
        is4k: true,
        media: SeerrMedia(
          id: 1,
          status4k: 3,
          downloadStatus4k: [
            SeerrDownloadingItem(
              size: 100,
              sizeLeft: 50,
              status: 'downloading',
              downloadId: 'UHD',
            ),
          ],
        ),
      );
      final summary = SeerrDownloadSummary.forRequest(
        request,
        arrQueue: stalledQueue,
      )!;
      expect(summary.state, SeerrDownloadState.downloading);
      expect(summary.percent, 50);
    });

    test('a title the default arr does not have keeps Seerr\'s status', () {
      final summary = SeerrDownloadSummary.forMedia(
        status: 3,
        items: const [
          SeerrDownloadingItem(size: 100, sizeLeft: 25, downloadId: 'OTHER'),
        ],
        arrQueue: const ArrQueue(service: 'radarr', inArr: false),
      )!;
      expect(summary.percent, 75);
      expect(summary.reason, isNull);
    });

    test('a stuck entry with no download id still shows', () {
      final summary = SeerrDownloadSummary.fromArrItems(const [
        ArrQueueItem(
          id: 7,
          status: 'downloadClientUnavailable',
          title: 'Show.S01.1080p',
        ),
      ])!;
      expect(summary.state, SeerrDownloadState.stalled);
      expect(summary.stuckItemId, 7);
    });

    test('a release held back by a delay profile is left out', () {
      expect(
        SeerrDownloadSummary.fromArrItems(const [
          ArrQueueItem(id: 8, status: 'delay', title: 'Show.S01.720p'),
          ArrQueueItem(id: 9, status: 'fallback', title: 'Show.S01.2160p'),
        ]),
        isNull,
      );
    });

    test('a queue entry with no id has nothing to remove', () {
      final summary = SeerrDownloadSummary.fromArrItems(const [
        ArrQueueItem(status: 'warning', downloadId: 'A'),
      ])!;
      expect(summary.isStuck, isTrue);
      expect(summary.stuckItemId, isNull);
    });
  });
}
