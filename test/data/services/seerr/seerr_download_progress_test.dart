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

  test('entries without a download id still all count', () {
    final summary = SeerrDownloadSummary.fromItems(const [
      SeerrDownloadingItem(size: 4 * gb, sizeLeft: 1 * gb),
      SeerrDownloadingItem(size: 4 * gb, sizeLeft: 1 * gb),
    ])!;
    expect(summary.totalBytes, 8 * gb);
    expect(summary.downloadedBytes, 6 * gb);
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
