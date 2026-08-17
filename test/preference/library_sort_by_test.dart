import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  test('the my rating sort never reaches plain items api consumers', () {
    expect(
      LibrarySortBy.itemsApiValues,
      isNot(contains(LibrarySortBy.myRating)),
    );
    expect(LibrarySortBy.myRating.usesDedicatedEndpoint, isTrue);
    // The fallback for consumers without the dedicated path has to be a
    // value the items api accepts.
    expect(LibrarySortBy.myRating.apiValue, 'SortName');
  });

  test('every sort settles ties on the same key', () {
    for (final option in LibrarySortBy.values) {
      if (option == LibrarySortBy.random) continue;
      expect(
        option.apiValue.split(',').last,
        'SortName',
        reason: '${option.name} leaves equally ranked items unordered',
      );
    }
  });

  test('music sorts stay out of libraries that hold no music', () {
    final movies = LibrarySortBy.optionsFor(isMovieOrSeriesLibrary: true);
    expect(movies, isNot(contains(LibrarySortBy.albumArtist)));
    expect(movies, isNot(contains(LibrarySortBy.album)));
    expect(movies, isNot(contains(LibrarySortBy.trackNumber)));
    // Group By covers parental rating for these, so the sort would duplicate it.
    expect(movies, isNot(contains(LibrarySortBy.rating)));
    expect(movies, contains(LibrarySortBy.datePlayed));
    expect(movies, contains(LibrarySortBy.playCount));
  });

  test('songs get the album and track ordering', () {
    final songs = LibrarySortBy.optionsFor(isSongsBrowse: true);
    expect(songs, contains(LibrarySortBy.artist));
    expect(songs, contains(LibrarySortBy.album));
    expect(songs, contains(LibrarySortBy.trackNumber));
    expect(songs, isNot(contains(LibrarySortBy.communityRating)));
  });

  test('only series offer the episode added date', () {
    expect(
      LibrarySortBy.optionsFor(isSeriesLibrary: true),
      contains(LibrarySortBy.dateEpisodeAdded),
    );
    expect(
      LibrarySortBy.optionsFor(),
      isNot(contains(LibrarySortBy.dateEpisodeAdded)),
    );
  });

  test('folders first is offered where folders actually show', () {
    expect(
      LibrarySortBy.optionsFor(isFolderyLibrary: true),
      contains(LibrarySortBy.foldersFirst),
    );
    expect(
      LibrarySortBy.optionsFor(),
      isNot(contains(LibrarySortBy.foldersFirst)),
    );
  });

  test('the my rating sort only appears when the plugin can serve it', () {
    expect(
      LibrarySortBy.optionsFor(supportsMyRating: true).first,
      LibrarySortBy.myRating,
    );
    expect(LibrarySortBy.optionsFor(), isNot(contains(LibrarySortBy.myRating)));
  });
}
