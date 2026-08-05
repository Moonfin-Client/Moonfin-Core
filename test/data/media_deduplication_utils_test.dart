import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/media_deduplication_utils.dart';

void main() {
  group('MediaDeduplicationUtils', () {
    test('getDeduplicationKey returns provider ID when present', () {
      final itemImdb = AggregatedItem(
        id: '1',
        serverId: 's1',
        rawData: {
          'Name': 'Avatar',
          'Type': 'Movie',
          'ProductionYear': 2009,
          'ProviderIds': {'Imdb': 'tt0499549', 'Tmdb': '19995'},
        },
      );

      final itemTmdb = AggregatedItem(
        id: '2',
        serverId: 's1',
        rawData: {
          'Name': 'Avatar',
          'Type': 'Movie',
          'ProductionYear': 2009,
          'ProviderIds': {'Tmdb': '19995'},
        },
      );

      final itemFallback = AggregatedItem(
        id: '3',
        serverId: 's1',
        rawData: {
          'Name': 'Avatar',
          'Type': 'Movie',
          'ProductionYear': 2009,
        },
      );

      expect(MediaDeduplicationUtils.getDeduplicationKey(itemImdb), equals('imdb:tt0499549'));
      expect(MediaDeduplicationUtils.getDeduplicationKey(itemTmdb), equals('tmdb:19995'));
      expect(MediaDeduplicationUtils.getDeduplicationKey(itemFallback), equals('movie|avatar|2009'));
    });

    test('deduplicateMediaItems merges duplicate items and picks highest resume state', () {
      final item1 = AggregatedItem(
        id: '1',
        serverId: 's1',
        rawData: {
          'Name': 'Avatar',
          'Type': 'Movie',
          'ProductionYear': 2009,
          'ProviderIds': {'Imdb': 'tt0499549'},
          'UserData': {'PlaybackPositionTicks': 1000},
        },
      );

      final item2 = AggregatedItem(
        id: '2',
        serverId: 's2',
        rawData: {
          'Name': 'Avatar',
          'Type': 'Movie',
          'ProductionYear': 2009,
          'ProviderIds': {'Imdb': 'tt0499549'},
          'UserData': {'PlaybackPositionTicks': 5000000},
        },
      );

      final itemOther = AggregatedItem(
        id: '3',
        serverId: 's1',
        rawData: {
          'Name': 'Titanic',
          'Type': 'Movie',
          'ProductionYear': 1997,
          'ProviderIds': {'Imdb': 'tt0120338'},
        },
      );

      final list = [item1, item2, itemOther];
      final deduplicated = MediaDeduplicationUtils.deduplicateMediaItems(list);

      expect(deduplicated.length, equals(2));
      expect(deduplicated.first.id, equals('2')); // picked item2 due to higher playback ticks
      expect(deduplicated.last.id, equals('3'));
    });

    test('formatVersionLabel formats conditionally based on hasMultipleLibrariesForType', () {
      // Multiple libraries -> includes library name prefix
      final multiLib = MediaDeduplicationUtils.formatVersionLabel(
        libraryName: '4K HDR',
        versionLabel: 'Main',
        hasMultipleLibrariesForType: true,
      );
      expect(multiLib, equals('4K HDR'));

      final multiLibCustomVersion = MediaDeduplicationUtils.formatVersionLabel(
        libraryName: '4K HDR',
        versionLabel: "Director's Cut",
        hasMultipleLibrariesForType: true,
      );
      expect(multiLibCustomVersion, equals("4K HDR - Director's Cut"));

      // Single library -> omits library name prefix
      final singleLib = MediaDeduplicationUtils.formatVersionLabel(
        libraryName: 'Movies',
        versionLabel: "Director's Cut",
        hasMultipleLibrariesForType: false,
      );
      expect(singleLib, equals("Director's Cut"));
    });
  });
}
