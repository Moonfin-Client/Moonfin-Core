import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';

void main() {
  const gb = 1000 * 1000 * 1000;

  // Sonarr's queue has one entry per episode, each with the whole pack's
  // size. A 9 episode pack at 75% read as 9 times its size.
  test('a season pack counts once, not once per episode', () {
    final items = [
      for (var i = 0; i < 9; i++)
        const SeerrDownloadingItem(
          size: 10 * gb,
          sizeLeft: 2 * gb,
          downloadId: 'S03',
        ),
      for (var i = 0; i < 10; i++)
        const SeerrDownloadingItem(
          size: 14 * gb,
          sizeLeft: 14 * gb,
          downloadId: 'S04',
        ),
    ];

    final summary = SeerrDownloadSummary.fromItems(items)!;
    expect(summary.totalBytes, 24 * gb);
    expect(summary.downloadedBytes, 8 * gb);
    expect(summary.percent, 33);
  });

  // A release held back by a delay profile is listed once per episode with
  // the whole release's size and no download id. It read as a 107 GB total
  // at 0% next to a pack that was really downloading.
  test('held back releases are left out', () {
    final summary = SeerrDownloadSummary.fromItems([
      for (var i = 0; i < 10; i++)
        const SeerrDownloadingItem(size: 23 * gb, sizeLeft: 23 * gb),
      const SeerrDownloadingItem(
        size: 19 * gb,
        sizeLeft: 5 * gb,
        downloadId: 'S06',
      ),
    ])!;
    expect(summary.totalBytes, 19 * gb);
    expect(summary.downloadedBytes, 14 * gb);
  });

  test('only held back releases draw no bar', () {
    final summary = SeerrDownloadSummary.fromItems(const [
      SeerrDownloadingItem(size: 23 * gb, sizeLeft: 23 * gb),
    ]);
    expect(summary, isNull);
  });

  group('state', () {
    SeerrDownloadSummary of(List<SeerrDownloadingItem> items) =>
        SeerrDownloadSummary.fromItems(items)!;

    // The case from the issue: a torrent with no seeders, reported as a
    // warning with nothing downloaded and no time left.
    test('a warning reads as stalled', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10 * gb,
          sizeLeft: 10 * gb,
          downloadId: 'A',
          status: 'warning',
        ),
      ]);
      expect(summary.state, SeerrDownloadState.stalled);
      expect(summary.timeLeft, isNull);
    });

    test('older Sonarr capitalises the status', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: 'Paused',
        ),
      ]);
      expect(summary.state, SeerrDownloadState.paused);
    });

    test('a finished download waits for the import', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 0,
          downloadId: 'A',
          status: 'completed',
        ),
      ]);
      expect(summary.isWaitingForImport, isTrue);
    });

    test('a completed download fills the bar even with bytes left', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 3,
          downloadId: 'A',
          status: 'completed',
        ),
      ]);
      expect(summary.isWaitingForImport, isTrue);
      expect(summary.fraction, 1.0);
    });

    test('a download with no bytes left reported is not finished', () {
      final summary = of(const [
        SeerrDownloadingItem(size: 10, downloadId: 'A', status: 'downloading'),
      ]);
      expect(summary.state, SeerrDownloadState.downloading);
      expect(summary.fraction, 0);
    });

    test('a failed download stays failed even when it finished', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 0,
          downloadId: 'A',
          status: 'failed',
        ),
      ]);
      expect(summary.state, SeerrDownloadState.failed);
    });

    test('the worst download decides', () {
      final summary = of(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 0,
          downloadId: 'A',
          status: 'completed',
        ),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'downloading',
        ),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 10,
          downloadId: 'C',
          status: 'warning',
        ),
      ]);
      expect(summary.state, SeerrDownloadState.stalled);
    });

    test('one finished episode does not hide the one still downloading', () {
      final summary = of(const [
        SeerrDownloadingItem(size: 10, sizeLeft: 0, downloadId: 'A'),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'downloading',
          timeLeft: '00:12:00',
        ),
      ]);
      expect(summary.state, SeerrDownloadState.downloading);
      expect(summary.timeLeft, const Duration(minutes: 12));
    });

    test('an unreachable client reads as stalled, a waiting one as queued', () {
      SeerrDownloadState stateFor(String status) => of([
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: status,
        ),
      ]).state;
      expect(stateFor('downloadClientUnavailable'), SeerrDownloadState.stalled);
      expect(stateFor('queued'), SeerrDownloadState.queued);
    });

    // The sized download alone is complete, so the bytes say 100%. The
    // magnet next to it is still going.
    test('a sizeless download keeps the bar short of full', () {
      final summary = of(const [
        SeerrDownloadingItem(size: 10, sizeLeft: 0, downloadId: 'A'),
        SeerrDownloadingItem(downloadId: 'B', status: 'downloading'),
      ]);
      expect(summary.state, SeerrDownloadState.downloading);
      expect(summary.percent, lessThan(100));
    });

    // A magnet with no peers never learns its size. It used to draw nothing
    // at all, which is exactly the stuck case worth showing.
    test('a sizeless download still shows its state', () {
      final summary = of(const [
        SeerrDownloadingItem(size: 0, downloadId: 'A', status: 'warning'),
      ]);
      expect(summary.state, SeerrDownloadState.stalled);
      expect(summary.hasSize, isFalse);
      expect(summary.fraction, 0);
    });
  });

  group('time left', () {
    test('the slowest active download sets it', () {
      final summary = SeerrDownloadSummary.fromItems(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: 'downloading',
          timeLeft: '00:05:00',
        ),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'downloading',
          timeLeft: '1.02:00:00',
        ),
      ])!;
      expect(summary.timeLeft, const Duration(days: 1, hours: 2));
    });

    test('unknown when one active download has no estimate', () {
      final summary = SeerrDownloadSummary.fromItems(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: 'downloading',
          timeLeft: '00:05:00',
        ),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'downloading',
        ),
      ])!;
      expect(summary.timeLeft, isNull);
    });

    // The active one would finish in five minutes, but the paused one never
    // will, so "5m left" would be a promise the request can't keep.
    test('unknown while another download is paused', () {
      final summary = SeerrDownloadSummary.fromItems(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: 'downloading',
          timeLeft: '00:05:00',
        ),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'paused',
        ),
      ])!;
      expect(summary.timeLeft, isNull);
    });

    test('a finished sibling does not count against it', () {
      final summary = SeerrDownloadSummary.fromItems(const [
        SeerrDownloadingItem(size: 10, sizeLeft: 0, downloadId: 'A'),
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'B',
          status: 'downloading',
          timeLeft: '00:05:00',
        ),
      ])!;
      expect(summary.timeLeft, const Duration(minutes: 5));
    });

    test('none for a stalled download, even with an estimate', () {
      final summary = SeerrDownloadSummary.fromItems(const [
        SeerrDownloadingItem(
          size: 10,
          sizeLeft: 5,
          downloadId: 'A',
          status: 'warning',
          timeLeft: '30.00:00:00',
        ),
      ])!;
      expect(summary.timeLeft, isNull);
    });

    test('parses the TimeSpan forms Radarr and Sonarr send', () {
      expect(
        SeerrDownloadSummary.parseTimeLeft('00:12:34'),
        const Duration(minutes: 12, seconds: 34),
      );
      expect(
        SeerrDownloadSummary.parseTimeLeft('3.04:05:06'),
        const Duration(days: 3, hours: 4, minutes: 5, seconds: 6),
      );
      expect(
        SeerrDownloadSummary.parseTimeLeft('00:00:09.5000000'),
        const Duration(seconds: 9),
      );
      expect(SeerrDownloadSummary.parseTimeLeft('soon'), isNull);
      expect(SeerrDownloadSummary.parseTimeLeft(null), isNull);
    });
  });

  test('status and time left are read from the Seerr payload', () {
    // The shape Seerr sent for a stalled torrent: no timeLeft key at all.
    final item = SeerrDownloadingItem.fromJson(const {
      'size': 1446235840,
      'sizeLeft': 1446235840,
      'status': 'warning',
      'downloadId': '3901454C6C9EFA41F7704AA775BA3E0204B3BA95',
    });
    expect(item.status, 'warning');
    expect(item.timeLeft, isNull);
    expect(
      SeerrDownloadingItem.fromJson(const {'timeLeft': '00:01:00'}).timeLeft,
      '00:01:00',
    );
  });

  test('the id is read from the Seerr payload', () {
    final item = SeerrDownloadingItem.fromJson(const {
      'size': 100,
      'sizeLeft': 40,
      'downloadId': 'SABnzbd_nzo_abc',
    });
    expect(item.downloadId, 'SABnzbd_nzo_abc');
  });
}
