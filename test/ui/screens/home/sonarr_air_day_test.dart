import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

void main() {
  group('a Sonarr episode shows the local day it airs', () {
    test('a late evening airing is that evening, not the next UTC day', () {
      final airDateUtc = DateTime(2026, 10, 24, 21).toUtc();

      expect(HomeViewModel.sonarrAirDay(airDateUtc), 'Oct. 24th');
    });

    test('an airing just after local midnight is the next day', () {
      final airDateUtc = DateTime(2026, 10, 25, 0, 30).toUtc();

      expect(HomeViewModel.sonarrAirDay(airDateUtc), 'Oct. 25th');
    });
  });
}
