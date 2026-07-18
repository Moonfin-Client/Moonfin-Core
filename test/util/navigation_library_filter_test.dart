import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/util/navigation_library_filter.dart';

AggregatedLibrary library(String id, String type) => AggregatedLibrary(
  id: id,
  name: id,
  collectionType: type,
  serverId: 'server',
);

void main() {
  final libraries = <AggregatedLibrary>[
    library('Movies', 'movies'),
    library('TV Shows', 'tvshows'),
    library('Music', 'music'),
    library('Music Videos', 'musicvideos'),
    library('Live TV', 'livetv'),
    library('Books', 'books'),
    library('Photos', 'photos'),
  ];

  test('movie/TV profile keeps only permitted video library types', () {
    expect(
      filterNavigationLibraries(libraries, movieTvOnly: true)
          .map((library) => library.id),
      ['Movies', 'TV Shows'],
    );
  });

  test('rollback setting restores all user-visible library types', () {
    expect(
      filterNavigationLibraries(libraries, movieTvOnly: false).length,
      libraries.length,
    );
  });

  test('never adds a library that is not in the user-visible views', () {
    final permittedLibraries = <AggregatedLibrary>[
      library('Movies', 'movies'),
      library('TV Shows', 'tvshows'),
    ];

    expect(
      filterNavigationLibraries(permittedLibraries, movieTvOnly: true)
          .map((library) => library.id),
      ['Movies', 'TV Shows'],
    );
  });
}
