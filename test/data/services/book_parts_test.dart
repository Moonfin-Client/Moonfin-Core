import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/book_parts.dart';

void main() {
  test('a book in several files names a part for each', () {
    final parts = bookPartsOf({
      'AbsTracks': [
        {'Url': '/api/items/b/file/1', 'Size': 10, 'Container': 'm4a'},
        {'Url': '/api/items/b/file/2'},
      ],
    });

    expect(parts, [
      (url: '/api/items/b/file/1', fileName: 'part001.m4a', size: 10),
      (url: '/api/items/b/file/2', fileName: 'part002.mp3', size: 0),
    ]);
  });

  test('a book in one file has no parts', () {
    expect(bookPartsOf({'Id': 'b'}), isNull);
    expect(
      bookPartsOf({
        'AbsTracks': [
          {'Url': '/one'},
        ],
      }),
      isNull,
    );
  });

  test('the playlist gives each path its length in bytes', () {
    final playlist = bookPartsPlaylist(['/a/part001.mp3', '/b/Café; one,two.mp3']);

    expect(
      playlist,
      '# mpv EDL v0\n'
      '%14%/a/part001.mp3\n'
      '%21%/b/Café; one,two.mp3\n',
    );
    expect(isBookPartsPlaylist('/x/Book.EDL'), isTrue);
    expect(isBookPartsPlaylist('/x/Book.mp3'), isFalse);
  });
}
