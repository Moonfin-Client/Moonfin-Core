import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';

const _white = 'https://image.tmdb.org/t/p/w500_filter(duotone,ffffff,bababa)/fox.png';
const _plain = 'https://image.tmdb.org/t/p/w500/hbo.png';

AggregatedItem _studio(String name) => AggregatedItem(
  id: name,
  serverId: 'srv',
  rawData: {'Id': name, 'Name': name, 'Type': 'Studio'},
);

void main() {
  group('parseStudioLogoUrls', () {
    test('keeps each logo image, keyed by lowercased name', () {
      final urls = parseStudioLogoUrls({
        'success': true,
        'companies': [
          {'id': 25, 'name': '20th Century Fox', 'hasLogo': true, 'logoUrl': _white},
          {'id': -49, 'name': ' HBO ', 'hasLogo': true, 'logoUrl': _plain},
          {'id': 7, 'name': 'No Logo Films', 'hasLogo': false},
          {'id': 8, 'name': '  ', 'hasLogo': true, 'logoUrl': _plain},
          'junk',
        ],
      });

      expect(urls, {'20th century fox': _white, 'hbo': _plain});
    });

    test('an answer with no companies gives an empty map', () {
      expect(parseStudioLogoUrls({'success': true}), isEmpty);
    });
  });

  group('attachStudioLogoUrls', () {
    test('gives a studio the logo whose name matches, whatever its case or spacing', () {
      final fox = _studio('20th Century FOX ');
      final indie = _studio('Tiny Indie');

      attachStudioLogoUrls([fox, indie], {'20th century fox': _white});

      expect(fox.rawData[studioLogoUrlKey], _white);
      expect(indie.rawData.containsKey(studioLogoUrlKey), isFalse);
    });
  });
}
