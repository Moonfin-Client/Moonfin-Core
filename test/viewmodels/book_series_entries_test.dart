import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/book_browse_view_model.dart';

AggregatedItem folder(String id, String parent, {String? imageTag}) =>
    AggregatedItem(
      id: id,
      serverId: 's',
      rawData: {
        'Id': id,
        'Name': id,
        'Type': 'Folder',
        'ParentId': parent,
        if (imageTag != null) 'ImageTags': {'Primary': imageTag},
      },
    );

AggregatedItem book(
  String id,
  String parent, {
  String extension = 'cbz',
  String type = 'Book',
  String? series,
  String? imageTag,
}) => AggregatedItem(
  id: id,
  serverId: 's',
  rawData: {
    'Id': id,
    'Name': id,
    'Type': type,
    'ParentId': parent,
    'Path': '/media/$parent/$id.$extension',
    'SeriesName': ?series,
    if (imageTag != null) 'ImageTags': {'Primary': imageTag},
  },
);

void main() {
  // One library path, as Jellyfin lists it: the path's own folder sits under
  // a parent the library query never returns.
  final folders = [
    folder('root', 'hidden'),
    folder('One Piece', 'root'),
    folder('Berserk', 'root', imageTag: 'berserk-cover'),
    folder('Agatha Christie', 'root'),
    folder('Isaac Asimov', 'root'),
    folder('Green Lantern (1990)', 'root'),
    folder('Green Lantern (2005)', 'root'),
  ];

  test('a folder of comic volumes is one series that opens the folder', () {
    final entries = bookSeriesEntries(
      books: [
        book('op1', 'One Piece', imageTag: 'op1-cover'),
        book('op2', 'One Piece'),
        book('op3', 'One Piece'),
        book('b1', 'Berserk'),
        book('b2', 'Berserk'),
        book('Standalone', 'root'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries.map((e) => e.name), ['Berserk', 'One Piece']);
    final onePiece = entries.last;
    expect(onePiece.id, 'One Piece');
    expect(onePiece.type, 'BookSeries');
    expect(onePiece.rawData['IsFolder'], isTrue);
    expect(onePiece.childCount, 3);
    expect(onePiece.primaryImageItemId, 'op1');
    expect(entries.first.primaryImageTag, 'berserk-cover');
  });

  test('an author folder of ebooks is not a series', () {
    final entries = bookSeriesEntries(
      books: [
        book('Crooked House', 'Agatha Christie', extension: 'epub'),
        book('Endless Night', 'Agatha Christie', extension: 'epub'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries, isEmpty);
  });

  test('books loose in a library root are never a series', () {
    final entries = bookSeriesEntries(
      books: [book('a', 'Comics'), book('b', 'Comics'), book('c', 'Comics')],
      folders: [folder('Comics', 'hidden'), folder('Books', 'hidden')],
      libraryId: "lib-1",
    );

    expect(entries, isEmpty);
  });

  test('an audiobook split into chapter files is not a series', () {
    final entries = bookSeriesEntries(
      books: [
        book('ch1', 'One Piece', extension: 'mp3', type: 'AudioBook'),
        book('ch2', 'One Piece', extension: 'mp3', type: 'AudioBook'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries, isEmpty);
  });

  test('a named ebook series in an author folder groups by name', () {
    final entries = bookSeriesEntries(
      books: [
        book(
          'Foundation',
          'Isaac Asimov',
          extension: 'epub',
          series: 'Foundation',
        ),
        book(
          'Foundation and Empire',
          'Isaac Asimov',
          extension: 'epub',
          series: 'Foundation',
        ),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries.single.id, 'bookSeries:Foundation');
    expect(entries.single.rawData['IsFolder'], isNull);
    expect(entries.single.childCount, 2);
  });

  test('a named series inside its own folder shows once, as the folder', () {
    final entries = bookSeriesEntries(
      books: [
        book('op1', 'One Piece', series: 'One Piece'),
        book('op2', 'One Piece', series: 'One Piece'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries.single.id, 'One Piece');
    expect(entries.single.rawData['IsFolder'], isTrue);
  });

  test('a named series split over volume folders shows only the folders', () {
    final entries = bookSeriesEntries(
      books: [
        book('gl1', 'Green Lantern (1990)', series: 'Green Lantern'),
        book('gl2', 'Green Lantern (1990)', series: 'Green Lantern'),
        book('gl3', 'Green Lantern (2005)', series: 'Green Lantern'),
        book('gl4', 'Green Lantern (2005)', series: 'Green Lantern'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries.map((e) => e.id), [
      'Green Lantern (1990)',
      'Green Lantern (2005)',
    ]);
  });

  test('a series stacks at most three member covers', () {
    final entries = bookSeriesEntries(
      books: [
        for (var i = 1; i <= 5; i++)
          book('vol$i', 'One Piece', imageTag: i == 2 ? null : 'tag$i'),
      ],
      folders: folders,
      libraryId: "lib-1",
    );

    expect(entries.single.rawData['StackCovers'], [
      {'Id': 'vol1', 'Tag': 'tag1'},
      {'Id': 'vol3', 'Tag': 'tag3'},
      {'Id': 'vol4', 'Tag': 'tag4'},
    ]);
  });
}
