import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/book_reader_service.dart';

AggregatedItem _book(Map<String, dynamic> raw) =>
    AggregatedItem(id: 'b1', serverId: 's1', rawData: {'Type': 'Book', ...raw});

void main() {
  test('a # in a file path is part of the name, not a URI fragment', () {
    final item = _book({'Path': '/comics/Batman #12.cbz'});

    expect(BookReaderService.detectExtension(item), 'cbz');
    expect(BookReaderService.fileName(item), 'Batman #12.cbz');
  });

  test('the file name comes from a Windows path too', () {
    final item = _book({'Path': r'D:\Books\Dune.epub'});

    expect(BookReaderService.fileName(item), 'Dune.epub');
    expect(BookReaderService.detectExtension(item), 'epub');
  });

  test('falls back to the item name when there is no path', () {
    final item = _book({'Path': '  ', 'Name': 'Dune'});

    expect(BookReaderService.fileName(item), 'Dune');
    expect(BookReaderService.detectExtension(item), isNull);
  });
}
