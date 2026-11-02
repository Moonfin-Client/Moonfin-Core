import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';

void main() {
  group('seerrPublicFlag', () {
    test('believes a server that names the flag', () {
      expect(
        seerrPublicFlag({'movie4kEnabled': false}, 'movie4kEnabled', fallback: true),
        isFalse,
      );
      expect(
        seerrPublicFlag({'movie4kEnabled': true}, 'movie4kEnabled', fallback: false),
        isTrue,
      );
    });

    test('leaves the default alone when the server never mentions it', () {
      const older = {'initialized': true, 'applicationTitle': 'Jellyseerr'};
      expect(seerrPublicFlag(older, 'movie4kEnabled', fallback: true), isTrue);
      expect(seerrPublicFlag(older, 'series4kEnabled', fallback: true), isTrue);
    });

    test('reads a null value as off, since the server did name the key', () {
      expect(
        seerrPublicFlag({'movie4kEnabled': null}, 'movie4kEnabled', fallback: true),
        isFalse,
      );
    });
  });

  group('seerrStreamingRegion', () {
    test("takes the user's own region first", () {
      expect(seerrStreamingRegion('GB', 'DE'), 'GB');
    });

    test("falls back to the server's region, then the US", () {
      expect(seerrStreamingRegion(null, 'DE'), 'DE');
      expect(seerrStreamingRegion('', 'DE'), 'DE');
      expect(seerrStreamingRegion(null, ''), 'US');
      expect(seerrStreamingRegion(null, null), 'US');
    });
  });
}
