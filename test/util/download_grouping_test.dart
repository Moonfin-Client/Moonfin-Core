import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/util/download_grouping.dart';

/// Only the columns the grouping reads are filled in.
DownloadedItem _saved(
  String id, {
  String type = 'Movie',
  String name = '',
  String? seriesId,
  String? seriesName,
  int? season,
  int? episode,
  int bytes = 1,
}) => DownloadedItem(
  itemId: id,
  serverId: 's1',
  type: type,
  name: name.isEmpty ? id : name,
  metadataJson: '{}',
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: bytes,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
  seriesId: seriesId,
  seriesName: seriesName,
  indexNumber: episode,
  parentIndexNumber: season,
);

DownloadedItem _episode(
  String id, {
  required String seriesId,
  String seriesName = 'A Series',
  int? season,
  int? episode,
  int bytes = 1,
}) => _saved(
  id,
  type: 'Episode',
  seriesId: seriesId,
  seriesName: seriesName,
  season: season,
  episode: episode,
  bytes: bytes,
);

void main() {
  test('episodes of one series collapse into a single row', () {
    final groups = groupDownloads([
      _episode('e1', seriesId: 'sh1', season: 1, episode: 1),
      _episode('e2', seriesId: 'sh1', season: 1, episode: 2),
    ]);

    expect(groups, hasLength(1));
    expect(groups.single.isSeries, isTrue);
    expect(groups.single.title, 'A Series');
    expect(groups.single.items, hasLength(2));
  });

  test('a series row adds up the size of the episodes saved from it', () {
    final groups = groupDownloads([
      _episode('e1', seriesId: 'sh1', bytes: 300),
      _episode('e2', seriesId: 'sh1', bytes: 200),
    ]);

    expect(groups.single.totalBytes, 500);
    expect(groups.single.itemIds, ['e1', 'e2']);
  });

  test('two series stay apart and movies keep their own rows', () {
    final groups = groupDownloads([
      _episode('e1', seriesId: 'sh1', seriesName: 'One'),
      _episode('e2', seriesId: 'sh2', seriesName: 'Two'),
      _saved('m1', name: 'A Movie'),
    ]);

    expect(groups, hasLength(3));
    expect(groups.where((g) => g.isSeries), hasLength(2));
    expect(
      groups.firstWhere((g) => !g.isSeries).title,
      'A Movie',
    );
  });

  test('episodes run in playing order rather than by size', () {
    final groups = groupDownloads([
      _episode('b', seriesId: 'sh1', season: 2, episode: 1, bytes: 900),
      _episode('c', seriesId: 'sh1', season: 1, episode: 10, bytes: 10),
      _episode('a', seriesId: 'sh1', season: 1, episode: 2, bytes: 500),
    ]);

    expect(groups.single.itemIds, ['a', 'c', 'b']);
  });

  test('an unnumbered episode sorts after the numbered ones', () {
    final groups = groupDownloads([
      _episode('special', seriesId: 'sh1'),
      _episode('e1', seriesId: 'sh1', season: 1, episode: 1),
    ]);

    expect(groups.single.itemIds, ['e1', 'special']);
  });

  test('the biggest row comes first, counting a whole series together', () {
    final groups = groupDownloads([
      _saved('m1', name: 'A Movie', bytes: 400),
      _episode('e1', seriesId: 'sh1', bytes: 300),
      _episode('e2', seriesId: 'sh1', bytes: 300),
    ]);

    expect(groups.first.isSeries, isTrue, reason: '600 beats the 400 movie');
    expect(groups.last.title, 'A Movie');
  });

  test('an episode with no series id is left standing on its own', () {
    final groups = groupDownloads([
      _saved('e1', type: 'Episode', name: 'Orphan'),
    ]);

    expect(groups.single.isSeries, isFalse);
    expect(groups.single.title, 'Orphan');
  });

  test('a series with no name falls back to what the episode carries', () {
    final groups = groupDownloads([
      _saved('e1', type: 'Episode', name: 'Pilot', seriesId: 'sh1'),
    ]);

    expect(groups.single.title, 'Pilot');
  });

  test('the number label reads the way an episode list does', () {
    expect(
      episodeNumberLabel(_episode('e', seriesId: 's', season: 2, episode: 5)),
      'S2 E5',
    );
    expect(
      episodeNumberLabel(_episode('e', seriesId: 's', episode: 5)),
      'E5',
    );
    expect(episodeNumberLabel(_episode('e', seriesId: 's')), isNull);
  });

  test('a notification names the show and number, not the episode title', () {
    expect(
      downloadNotificationLabel(
        name: 'Pilot',
        seriesName: 'Series',
        season: 1,
        episode: 1,
      ),
      'Series S1E1',
    );
    // Without a full number there is nothing better than the title.
    expect(
      downloadNotificationLabel(name: 'Pilot', seriesName: 'Series', season: 1),
      'Pilot',
    );
    expect(
      downloadNotificationLabel(
        name: 'Pilot',
        seriesName: ' ',
        season: 1,
        episode: 1,
      ),
      'Pilot',
    );
    expect(downloadNotificationLabel(name: 'A Movie'), 'A Movie');
  });
}
