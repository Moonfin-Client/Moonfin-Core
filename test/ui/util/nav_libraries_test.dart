import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/ui/util/nav_libraries.dart';

void main() {
  const movies = AggregatedLibrary(
    id: 'a-movies',
    name: 'Movies (Server a)',
    collectionType: 'movies',
    serverId: 'a',
  );
  const shows = AggregatedLibrary(
    id: 'a-shows',
    name: 'Shows',
    collectionType: 'tvshows',
    serverId: 'a',
  );

  test('lists with the same libraries in the same order are the same', () {
    expect(sameNavLibraries(const [], const []), isTrue);
    expect(sameNavLibraries([movies, shows], [movies, shows]), isTrue);
  });

  test('a library added, removed or moved makes a different list', () {
    expect(sameNavLibraries([movies], [movies, shows]), isFalse);
    expect(sameNavLibraries([movies, shows], [movies]), isFalse);
    expect(sameNavLibraries([movies, shows], [shows, movies]), isFalse);
  });

  test('a library renamed, retyped or on another server under the same id '
      'makes a different list', () {
    AggregatedLibrary like(
      AggregatedLibrary library, {
      String? name,
      String? collectionType,
      String? serverId,
    }) => AggregatedLibrary(
      id: library.id,
      name: name ?? library.name,
      collectionType: collectionType ?? library.collectionType,
      serverId: serverId ?? library.serverId,
    );

    expect(sameNavLibraries([movies], [like(movies)]), isTrue);
    expect(
      sameNavLibraries([movies], [like(movies, name: 'Films (Server a)')]),
      isFalse,
    );
    expect(
      sameNavLibraries([movies], [like(movies, collectionType: 'homevideos')]),
      isFalse,
    );
    // Two servers can hand out the same library id.
    expect(sameNavLibraries([movies], [like(movies, serverId: 'b')]), isFalse);
  });

  test('a merged library differs from the library whose id it keeps', () {
    final merged = AggregatedLibrary.merged(
      name: 'Movies',
      unifiedKindName: 'movies',
      libraries: const [movies],
    );
    expect(merged.id, movies.id);

    expect(sameNavLibraries([movies], [merged]), isFalse);
    expect(sameNavLibraries([merged], [merged]), isTrue);
  });
}
