/// User-visible names the IPTV backend writes into items. The app passes
/// localized ones, and the English defaults cover tests.
class IptvLabels {
  final String liveTv;
  final String movies;
  final String shows;
  final String Function(int number) season;
  final String Function(int number) episode;
  final String profileName;
  final String uncategorized;

  const IptvLabels({
    this.liveTv = 'Live TV',
    this.movies = 'Movies',
    this.shows = 'Shows',
    this.season = _season,
    this.episode = _episode,
    this.profileName = 'IPTV Profile',
    this.uncategorized = 'Uncategorized',
  });

  static String _season(int number) => 'Season $number';
  static String _episode(int number) => 'Episode $number';
}
