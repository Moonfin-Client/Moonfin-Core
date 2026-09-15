import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_http_client.dart';

void main() {
  group('encodeSeerrQueryComponent', () {
    test('encodes spaces as %20, not plus', () {
      expect(encodeSeerrQueryComponent('star wars'), 'star%20wars');
    });

    test('encodes apostrophes and other search punctuation', () {
      expect(
        encodeSeerrQueryComponent("Ocean's Eleven!"),
        'Ocean%27s%20Eleven%21',
      );
    });
  });

  group('seerrEncodedQueryString', () {
    test('builds a TMDB search slider query without plus-encoded spaces', () {
      expect(
        seerrEncodedQueryString({'query': 'star wars', 'page': '1'}),
        'query=star%20wars&page=1',
      );
    });
  });
}
