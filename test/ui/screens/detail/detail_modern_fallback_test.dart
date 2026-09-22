import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/detail_layout_metrics.dart';

void main() {
  test('a playlist is drawn by Modern whichever style is picked', () {
    expect(detailFallsBackToModern('Playlist'), isTrue);
  });

  test('every other type is left to the style that was picked', () {
    for (final type in ['Movie', 'MusicAlbum', 'Person', null]) {
      expect(detailFallsBackToModern(type), isFalse, reason: '$type');
    }
  });
}
