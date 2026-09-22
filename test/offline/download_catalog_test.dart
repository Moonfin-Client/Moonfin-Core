import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/providers/offline_providers.dart';

DownloadedItem _row(
  String id, {
  required String type,
  int bytes = 0,
  String? posterPath,
  String? localFilePath,
}) => DownloadedItem(
  itemId: id,
  serverId: 's1',
  type: type,
  name: id,
  localFilePath: localFilePath,
  metadataJson: '{}',
  posterPath: posterPath,
  downloadStatus: 2,
  downloadProgress: 1.0,
  fileSizeBytes: bytes,
  playbackPositionTicks: 0,
  progressSynced: true,
  qualityPreset: 'original',
  downloadSource: 'manual',
);

void main() {
  test('container rows are kept out of the list but keep their artwork', () {
    // Saving one episode writes the Series and Season rows alongside it.
    final catalog = partitionDownloadCatalog([
      _row('e1', type: 'Episode', bytes: 1000, localFilePath: '/tmp/e1.mkv'),
      _row('bb', type: 'Series', posterPath: '/img/bb/poster.jpg'),
      _row('bb-s1', type: 'Season', posterPath: '/img/bb-s1/poster.jpg'),
    ]);

    expect(catalog.items.map((item) => item.itemId), ['e1']);
    expect(catalog.containerArtwork['bb'], '/img/bb/poster.jpg');
    expect(catalog.containerArtwork['bb-s1'], '/img/bb-s1/poster.jpg');
  });

  test('a completed row with no bytes on disk is not listed', () {
    final catalog = partitionDownloadCatalog([
      _row('m1', type: 'Movie', bytes: 0),
      _row('m2', type: 'Movie', bytes: 42, localFilePath: '/tmp/m2.mkv'),
    ]);

    expect(catalog.items.map((item) => item.itemId), ['m2']);
  });

  test('every downloadable type survives the filter', () {
    final rows = [
      for (final type in downloadableItemTypes)
        _row(type, type: type, bytes: 1, localFilePath: '/tmp/$type'),
    ];

    final catalog = partitionDownloadCatalog(rows);

    expect(catalog.items.length, downloadableItemTypes.length);
  });

  test('a container row with no artwork contributes nothing', () {
    final catalog = partitionDownloadCatalog([
      _row('bb', type: 'Series'),
    ]);

    expect(catalog.items, isEmpty);
    expect(catalog.containerArtwork, isEmpty);
  });
}
