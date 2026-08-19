/// Genre artwork the way Seerr builds it: TMDB recolours the backdrop through its
/// duotone filter, so a genre keeps its own colour even when two genres end up on
/// the same film. The colours and the genre they belong to come from Overseerr
/// (MIT).
library;

const _black = ('1F2937', 'D1D5DB');
const _red = ('991B1B', 'FCA5A5');
const _darkred = ('1F2937', 'F87171');
const _blue = ('032541', '01b4e4');
const _lightblue = ('1F2937', '60A5FA');
const _darkblue = ('1F2937', '2864d2');
const _orange = ('92400E', 'FCD34D');
const _darkorange = ('552c01', 'd47c1d');
const _lightgreen = ('065F46', '6EE7B7');
const _purple = ('5B21B6', 'C4B5FD');
const _darkpurple = ('480c8b', 'a96bef');
const _yellow = ('777e0d', 'e4ed55');
const _pink = ('9D174D', 'F9A8D4');

const _genreTones = <int, (String, String)>{
  28: _red, // Action
  12: _darkpurple, // Adventure
  16: _blue, // Animation
  35: _orange, // Comedy
  80: _darkblue, // Crime
  99: _lightgreen, // Documentary
  18: _pink, // Drama
  10751: _yellow, // Family
  14: _lightblue, // Fantasy
  36: _orange, // History
  27: _black, // Horror
  10402: _blue, // Music
  9648: _purple, // Mystery
  10749: _pink, // Romance
  878: _lightblue, // Science Fiction
  10770: _red, // TV Movie
  53: _black, // Thriller
  10752: _darkred, // War
  37: _orange, // Western
  10759: _darkpurple, // Action & Adventure
  10762: _blue, // Kids
  10763: _black, // News
  10764: _darkorange, // Reality
  10765: _lightblue, // Sci-Fi & Fantasy
  10766: _pink, // Soap
  10767: _lightgreen, // Talk
  10768: _darkred, // War & Politics
};

/// The duotone backdrop for a genre row card, or null when the genre came back
/// without artwork.
String? seerrGenreBackdropUrl(int genreId, List<String> backdrops) {
  if (backdrops.isEmpty) return null;
  final (dark, light) = _genreTones[genreId] ?? _black;
  // Seerr skips the front of the list: those are the most popular films, and a
  // popular film sits in several genres, so it is what shows up twice.
  final path = backdrops.length > 4 ? backdrops[4] : backdrops.last;
  return 'https://image.tmdb.org/t/p/w1280_filter(duotone,$dark,$light)$path';
}
