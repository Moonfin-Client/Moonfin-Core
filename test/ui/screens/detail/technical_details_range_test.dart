import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

const _dolbyVision = {
  'Type': 'Video',
  'Codec': 'hevc',
  'VideoRangeType': 'DOVIWithHDR10',
  'DvProfile': 8,
};

const _noRange = {'Type': 'Video', 'Codec': 'hevc'};

AggregatedItem _twoVersions() => AggregatedItem(
  id: 'movie',
  serverId: 'server',
  rawData: {
    'Id': 'movie',
    'Type': 'Movie',
    'MediaStreams': [_dolbyVision],
    'MediaSources': [
      {
        'Id': 'first',
        'MediaStreams': [_noRange],
      },
      {
        'Id': 'second',
        'MediaStreams': [_noRange],
      },
    ],
  },
);

void main() {
  test('another version without a range shows no range badge', () {
    final item = _twoVersions();

    final badges = technicalDetailsFor(item, item.mediaSources[1]).badges;

    expect(badges, isNot(contains('DV P8')));
    expect(badges, isNot(contains('HDR10')));
  });

  test('the first version still falls back to the item streams', () {
    final item = _twoVersions();

    final badges = technicalDetailsFor(item, item.mediaSources.first).badges;

    expect(badges, containsAll(['DV P8', 'HDR10']));
  });
}
