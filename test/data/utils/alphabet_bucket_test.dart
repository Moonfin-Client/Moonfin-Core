import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/alphabet_bucket.dart';

AggregatedItem _item(String name, {String? sortName}) => AggregatedItem(
  id: name,
  serverId: 'server',
  rawData: <String, dynamic>{'Name': name, 'SortName': ?sortName},
);

void main() {
  group('matchesAlphabetBucket', () {
    test('files a plain name under its own letter', () {
      expect(matchesAlphabetBucket(_item('Alien'), 'A'), isTrue);
      expect(matchesAlphabetBucket(_item('Alien'), 'B'), isFalse);
    });

    // An accent does not make it a different word, and the viewer looking for
    // it reaches for A rather than the bucket the symbols sit in.
    test('files an accented name under the letter under the accent', () {
      expect(matchesAlphabetBucket(_item('Ángel'), 'A'), isTrue);
      expect(matchesAlphabetBucket(_item('Ángel'), '#'), isFalse);
    });

    test('folds the letters that carry no mark of their own', () {
      expect(matchesAlphabetBucket(_item('Øster'), 'O'), isTrue);
      expect(matchesAlphabetBucket(_item('Łódź'), 'L'), isTrue);
    });

    test('the number bucket keeps what really starts with no letter', () {
      expect(matchesAlphabetBucket(_item('2001'), '#'), isTrue);
      expect(matchesAlphabetBucket(_item('Ω Project'), '#'), isTrue);
      expect(matchesAlphabetBucket(_item('東京'), '#'), isTrue);
    });

    test('reads the sort name ahead of the display name', () {
      final item = _item('The Matrix', sortName: 'Matrix, The');

      expect(matchesAlphabetBucket(item, 'M'), isTrue);
      expect(matchesAlphabetBucket(item, 'T'), isFalse);
    });

    test('an item with no name at all matches nothing', () {
      expect(matchesAlphabetBucket(_item(''), 'A'), isFalse);
      expect(matchesAlphabetBucket(_item(''), '#'), isFalse);
    });
  });
}
