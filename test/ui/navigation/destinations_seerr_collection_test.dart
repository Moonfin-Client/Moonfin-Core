// A movie with no server box set gets its TMDB collection from Seerr. That
// collection's card is a Seerr item like any other, so every detail style
// routes it through Destinations.seerrMedia, which must send it to the
// collection screen rather than the movie/series detail route.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/ui/navigation/destinations.dart';

void main() {
  test('a collection media type routes to the Seerr collection screen', () {
    expect(
      Destinations.seerrMedia('10', mediaType: 'collection', title: 'Saga'),
      Destinations.seerrCollection('10'),
    );
  });

  test('movies still route to the Seerr media screen', () {
    expect(
      Destinations.seerrMedia('603', mediaType: 'movie'),
      '/seerr/media/603?mediaType=movie',
    );
  });

  test('a collection backed by a Seerr item is synthetic', () {
    AggregatedItem boxSet(String serverId) => AggregatedItem(
      id: '10',
      serverId: serverId,
      rawData: const {'Id': '10', 'Name': 'Saga', 'Type': 'BoxSet'},
    );
    ParentCollection collection(String serverId) => ParentCollection(
      id: '10',
      name: 'Saga',
      boxSetItem: boxSet(serverId),
      items: const [],
    );
    expect(collection('seerr').isSynthetic, isTrue);
    expect(collection('server-1').isSynthetic, isFalse);
  });
}
