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

  group('newerServerPageIndex', () {
    AggregatedItem progress(int ticks, [String? lastPlayed]) => _book({
      'UserData': {
        'PlaybackPositionTicks': ticks,
        'LastPlayedDate': ?lastPlayed,
      },
    });
    final localSave = DateTime.utc(2026, 10, 17, 12);

    test('reads the page index on the jellyfin-web scale', () {
      expect(BookReaderService.newerServerPageIndex(progress(30000)), 3);
    });

    test('a book with no server position has no server page', () {
      expect(BookReaderService.newerServerPageIndex(progress(0)), isNull);
    });

    test('a later save on another device wins, even going backwards', () {
      final item = progress(20000, '2026-10-17T12:05:00.0000000Z');

      expect(
        BookReaderService.newerServerPageIndex(item, localSavedAt: localSave),
        2,
      );
    });

    test("this device's later save wins over an older server position", () {
      final item = progress(90000, '2026-10-17T11:55:00.0000000Z');

      expect(
        BookReaderService.newerServerPageIndex(item, localSavedAt: localSave),
        isNull,
      );
    });

    test('an undated server position loses to a dated local save', () {
      expect(
        BookReaderService.newerServerPageIndex(
          progress(90000),
          localSavedAt: localSave,
        ),
        isNull,
      );
    });
  });

  test('falls back to the item name when there is no path', () {
    final item = _book({'Path': '  ', 'Name': 'Dune'});

    expect(BookReaderService.fileName(item), 'Dune');
    expect(BookReaderService.detectExtension(item), isNull);
  });
}
