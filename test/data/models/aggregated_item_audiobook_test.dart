import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';

AggregatedItem _item(Map<String, dynamic> raw) =>
    AggregatedItem(id: 'i1', serverId: 's1', rawData: raw);

void main() {
  group('AggregatedItem.isAudiobook', () {
    test('a readable book in a books library stays a book', () {
      final item = _item({
        'Type': 'Book',
        'MediaType': 'Book',
        'CollectionType': 'books',
      });

      expect(item.isAudiobook, isFalse);
    });

    test('a readable book under a books parent stays a book', () {
      final item = _item({
        'Type': 'Book',
        'ParentCollectionType': 'books',
      });

      expect(item.isAudiobook, isFalse);
    });

    test('an audio file typed as a book is an audiobook', () {
      final item = _item({
        'Type': 'Book',
        'MediaType': 'Audio',
        'CollectionType': 'books',
      });

      expect(item.isAudiobook, isTrue);
    });

    test('the server type wins on its own', () {
      expect(_item({'Type': 'AudioBook'}).isAudiobook, isTrue);
    });

    test('audio in a books library is an audiobook', () {
      final item = _item({
        'Type': 'Audio',
        'MediaType': 'Audio',
        'CollectionType': 'books',
      });

      expect(item.isAudiobook, isTrue);
    });

    test('a long audio file with chapters is an audiobook', () {
      final item = _item({
        'Type': 'Audio',
        'MediaType': 'Audio',
        'Chapters': [
          {'Name': 'One'},
        ],
        'RunTimeTicks': const Duration(hours: 2).inMicroseconds * 10,
      });

      expect(item.isAudiobook, isTrue);
    });

    test('an ordinary song is not an audiobook', () {
      final item = _item({
        'Type': 'Audio',
        'MediaType': 'Audio',
        'RunTimeTicks': const Duration(minutes: 3).inMicroseconds * 10,
      });

      expect(item.isAudiobook, isFalse);
    });

    test('a comic archive is not an audiobook even in a books library', () {
      final item = _item({
        'Type': 'Book',
        'MediaType': 'Book',
        'Container': 'cbz',
        'CollectionType': 'books',
      });

      expect(item.isAudiobook, isFalse);
      expect(item.isComic, isTrue);
    });
  });

  group('AggregatedItem.isComic', () {
    test('detects Comic type from server', () {
      expect(_item({'Type': 'Comic'}).isComic, isTrue);
    });

    test('detects comic archive containers (cbz, cbr, cb7, cbt)', () {
      expect(_item({'Type': 'Book', 'Container': 'cbz'}).isComic, isTrue);
      expect(_item({'Type': 'Book', 'Container': 'cbr'}).isComic, isTrue);
      expect(_item({'Type': 'Book', 'Container': 'cb7'}).isComic, isTrue);
      expect(_item({'Type': 'Book', 'Container': 'cbt'}).isComic, isTrue);
    });

    test('detects comic file extension in path or file name', () {
      expect(_item({'Path': '/media/comics/Spider-Man.cbz'}).isComic, isTrue);
      expect(_item({'FileName': 'Batman.cbr'}).isComic, isTrue);
      expect(_item({'Name': 'X-Men.cbt'}).isComic, isTrue);
    });

    test('ordinary books and audiobooks are not comics', () {
      expect(_item({'Type': 'Book', 'Path': '/media/books/Dune.epub'}).isComic, isFalse);
      expect(_item({'Type': 'AudioBook', 'Container': 'm4b'}).isComic, isFalse);
    });
  });

  group('AggregatedItem.isFolder', () {
    test('detects folder from IsFolder flag', () {
      expect(_item({'IsFolder': true}).isFolder, isTrue);
      expect(_item({'IsFolder': false}).isFolder, isFalse);
    });

    test('detects folder when ChildCount is greater than zero', () {
      expect(_item({'ChildCount': 5}).isFolder, isTrue);
      expect(_item({'ChildCount': 0}).isFolder, isFalse);
    });

    test('defaults to false when flags are missing', () {
      expect(_item({'Type': 'AudioBook'}).isFolder, isFalse);
    });

    test('reads a child count the server sent as something else', () {
      expect(_item({'ChildCount': '5'}).isFolder, isTrue);
      expect(_item({'ChildCount': '0'}).isFolder, isFalse);
      expect(_item({'ChildCount': true}).isFolder, isFalse);
    });
  });
}
