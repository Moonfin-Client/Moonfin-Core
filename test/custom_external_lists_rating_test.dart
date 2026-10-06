import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';

/// The chart rows carry the rating Moonbase looked up, and the row cache
/// has to keep it or a cached row would read as unrated and vanish for anyone
/// with a blocked rating.
void main() {
  test('the rating survives the cache round trip', () {
    final item = ImdbExternalListItem(
      imdbId: 'tt0111161',
      title: 'The Shawshank Redemption',
      type: 'Movie',
      officialRating: 'R',
    );

    final restored = ImdbExternalListItem.fromJson(item.toJson());

    expect(restored.officialRating, 'R');
  });

  test('a missing rating is written as a key holding null, so old caches can be told apart', () {
    final json = ImdbExternalListItem(imdbId: 'tt1', title: 'x', type: 'Movie').toJson();

    expect(json.containsKey('officialRating'), isTrue);
    expect(json['officialRating'], isNull);
    expect(ImdbExternalListItem.fromJson(json).officialRating, isNull);
  });
}
