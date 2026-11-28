import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/book_parts.dart';

const _s = Duration(seconds: 1);

void main() {
  test('a book in several files names a part for each', () {
    final parts = bookPartsOf({
      'AbsTracks': [
        {
          'Url': '/api/items/b/file/1',
          'Size': 10,
          'Container': 'm4a',
          'Duration': 61.5,
        },
        {'Url': '/api/items/b/file/2'},
      ],
    });

    expect(parts, [
      (
        url: '/api/items/b/file/1',
        fileName: 'part001.m4a',
        size: 10,
        length: const Duration(milliseconds: 61500),
      ),
      (
        url: '/api/items/b/file/2',
        fileName: 'part002.mp3',
        size: 0,
        length: Duration.zero,
      ),
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

  test('the playlist gives each path its length in bytes and time', () {
    final playlist = bookPartsPlaylist([
      (path: '/a/part001.mp3', length: _s * 10),
      (
        path: '/b/Café; one,two.mp3',
        length: const Duration(milliseconds: 1500),
      ),
    ]);

    expect(
      playlist,
      '# mpv EDL v0\n'
      '# length 10000\n'
      '%14%/a/part001.mp3\n'
      '# length 1500\n'
      '%21%/b/Café; one,two.mp3\n',
    );
    expect(isBookPartsPlaylist('/x/Book.EDL'), isTrue);
    expect(isBookPartsPlaylist('/x/Book.mp3'), isFalse);
  });

  test('a playlist reads back whatever its paths hold', () {
    final parts = [
      (path: '/a/100% done/part001.mp3', length: _s * 10),
      (path: '/b/two\nlines/part002.mp3', length: _s * 20),
    ];

    expect(readBookPartsPlaylist(utf8.encode(bookPartsPlaylist(parts))), parts);
  });

  test('a playlist without lengths is not read', () {
    expect(
      readBookPartsPlaylist(utf8.encode('# mpv EDL v0\n%14%/a/part001.mp3\n')),
      isNull,
    );
    expect(
      readBookPartsPlaylist(
        utf8.encode(bookPartsPlaylist([(path: '/a', length: Duration.zero)])),
      ),
      isNull,
    );
    expect(readBookPartsPlaylist(utf8.encode('# mpv EDL v0\n')), isNull);
  });

  test('the timeline finds the part that plays a position', () {
    final timeline = BookPartsTimeline([
      (path: 'a', length: _s * 10),
      (path: 'b', length: _s * 20),
      (path: 'c', length: _s * 5),
    ]);

    expect(timeline.starts, [Duration.zero, _s * 10, _s * 30]);
    expect(timeline.length, _s * 35);
    expect(timeline.locate(_s * 3), (index: 0, offset: _s * 3));
    expect(timeline.locate(_s * 10), (index: 1, offset: Duration.zero));
    expect(timeline.locate(_s * 31), (index: 2, offset: _s));
    expect(timeline.locate(_s * 99), (index: 2, offset: _s * 5));
    expect(timeline.locate(-_s), (index: 0, offset: Duration.zero));
  });
}
