import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';

AggregatedItem _studio(String name) => AggregatedItem(
  id: name,
  serverId: 'srv',
  rawData: {'Id': name, 'Name': name, 'Type': 'Studio'},
);

void main() {
  group('parseStudioLogoIds', () {
    test('keeps only entries with a logo, keyed by lowercased name', () {
      final ids = parseStudioLogoIds({
        'success': true,
        'companies': [
          {'id': 25, 'name': '20th Century Fox', 'hasLogo': true},
          {'id': -49, 'name': ' HBO ', 'hasLogo': true},
          {'id': 7, 'name': 'No Logo Films', 'hasLogo': false},
          {'id': 8, 'name': '  ', 'hasLogo': true},
          {'name': 'No Id', 'hasLogo': true},
          'junk',
        ],
      });

      expect(ids, {'20th century fox': 25, 'hbo': -49});
    });

    test('an answer with no companies gives an empty map', () {
      expect(parseStudioLogoIds({'success': true}), isEmpty);
    });
  });

  group('attachStudioLogoIds', () {
    test('tags a studio whose name matches, whatever its case or spacing', () {
      final fox = _studio('20th Century FOX ');
      final indie = _studio('Tiny Indie');

      attachStudioLogoIds([fox, indie], {'20th century fox': 25});

      expect(fox.rawData[studioLogoIdKey], 25);
      expect(indie.rawData.containsKey(studioLogoIdKey), isFalse);
    });
  });
}
