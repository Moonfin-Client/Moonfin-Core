import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/util/server_section_title.dart';
import 'package:server_core/server_core.dart';

// Every key Silo sends for a home row's title, with its arguments and the
// English Silo sends as the title. Spelled out so a key wired to the wrong
// string fails here.
const _siloTitles = <(String, Map<String, String>, String)>[
  ('home.section.becauseYouEnjoy', {'genres': 'Drama & Comedy'}, 'Because you enjoy Drama & Comedy'),
  ('home.section.becauseYouWatched', {}, 'Because You Watched'),
  ('home.section.becauseYouWatchedTitle', {'title': 'Dune'}, 'Because You Watched Dune'),
  ('home.section.continueListening', {}, 'Continue Listening'),
  ('home.section.continueReading', {}, 'Continue Reading'),
  ('home.section.continueWatching', {}, 'Continue Watching'),
  ('home.section.forYou', {}, 'For You'),
  ('home.section.hiddenGems', {}, 'Hidden Gems'),
  ('home.section.highlyRatedInLibrary', {}, 'Highly Rated in Your Library'),
  ('home.section.nextInYourSeries', {}, 'Next in Your Series'),
  ('home.section.nextUp', {}, 'Next Up'),
  ('home.section.pickedFromYourHistory', {}, 'Picked from your history'),
  ('home.section.popularOnServer', {}, 'Popular on This Server'),
  ('home.section.profilesLikeYouEnjoyed', {}, 'Profiles Like You Enjoyed'),
  ('home.section.randomPicks', {}, 'Random Picks'),
  ('home.section.recentlyAdded', {}, 'Recently Added'),
  ('home.section.recentlyAddedAudiobooks', {}, 'Recently Added Audiobooks'),
  ('home.section.recentlyAddedEbooks', {}, 'Recently Added Ebooks'),
  ('home.section.recentlyAddedIn', {'library': 'Movies'}, 'Recently Added in Movies'),
  ('home.section.recentlyAddedManga', {}, 'Recently Added Manga'),
  ('home.section.recentlyAddedMovies', {}, 'Recently Added Movies'),
  ('home.section.recentlyAddedTv', {}, 'Recently Added TV'),
  ('home.section.recentlyReleased', {}, 'Recently Released'),
  ('home.section.recentlyReleasedAudiobooks', {}, 'Recently Released Audiobooks'),
  ('home.section.recentlyReleasedEbooks', {}, 'Recently Released Ebooks'),
  ('home.section.recentlyReleasedEpisodes', {}, 'Recently Released Episodes'),
  ('home.section.recentlyReleasedEpisodesIn', {'library': 'Movies'}, 'Recently Released Episodes in Movies'),
  ('home.section.recentlyReleasedIn', {'library': 'Movies'}, 'Recently Released in Movies'),
  ('home.section.recentlyReleasedManga', {}, 'Recently Released Manga'),
  ('home.section.recentlyReleasedMovies', {}, 'Recently Released Movies'),
  ('home.section.recommendedForYou', {}, 'Recommended for You'),
  ('home.section.returningShows', {}, 'Returning Shows'),
  ('home.section.seasonal.christmas.classics', {}, 'Christmas Classics'),
  ('home.section.seasonal.christmas.comedies', {}, 'Christmas Comedies'),
  ('home.section.seasonal.christmas.family', {}, 'Family Christmas'),
  ('home.section.seasonal.christmas.favorites', {}, 'Christmas Favorites'),
  ('home.section.seasonal.christmas.hallmark', {}, 'Hallmark Christmas'),
  ('home.section.seasonal.christmas.romcoms', {}, 'Christmas Rom-Coms'),
  ('home.section.seasonal.easter.faith', {}, 'Easter Stories'),
  ('home.section.seasonal.easter.family', {}, 'Easter Movies'),
  ('home.section.seasonal.familyMovieNight.favorites', {}, 'Family Favorites'),
  ('home.section.seasonal.familyMovieNight.liveAction', {}, 'Family Movie Night'),
  ('home.section.seasonal.familyMovieNight.new', {}, 'Family Movie Night'),
  ('home.section.seasonal.halloween.animated', {}, 'Animated Halloween'),
  ('home.section.seasonal.halloween.family', {}, 'Family Halloween'),
  ('home.section.seasonal.halloween.favorites', {}, 'Halloween Favorites'),
  ('home.section.seasonal.halloween.horror', {}, 'Halloween Horror'),
  ('home.section.seasonal.halloween.tv', {}, 'Halloween TV'),
  ('home.section.seasonal.newYear.favorites', {}, 'New Year\'s Movies'),
  ('home.section.seasonal.saturdayMorning.cartoons', {}, 'Saturday Morning Cartoons'),
  ('home.section.seasonal.saturdayMorning.modern', {}, 'Saturday Morning Favorites'),
  ('home.section.seasonal.saturdayMorning.nineties', {}, '90s Saturday Mornings'),
  ('home.section.seasonal.stPatricks.irishFilm', {}, 'Irish Film'),
  ('home.section.seasonal.stPatricks.irishTv', {}, 'Irish TV'),
  ('home.section.seasonal.summer.blockbusters', {}, 'Summer Blockbusters'),
  ('home.section.seasonal.summer.classicSummer', {}, 'Classic Summer Movies'),
  ('home.section.seasonal.summer.nostalgia', {}, 'Summer Nostalgia'),
  ('home.section.seasonal.summerBlockbuster.blockbusters', {}, 'Summer Blockbusters'),
  ('home.section.seasonal.summerBlockbuster.classicSummer', {}, 'Classic Summer Movies'),
  ('home.section.seasonal.summerBlockbuster.nostalgia', {}, 'Summer Nostalgia'),
  ('home.section.seasonal.thanksgiving.favorites', {}, 'Thanksgiving Movies'),
  ('home.section.seasonal.thanksgiving.feelGood', {}, 'Feel-Good Favorites'),
  ('home.section.seasonal.valentines.favorites', {}, 'Valentine\'s Favorites'),
  ('home.section.seasonal.valentines.loveStories', {}, 'Classic Love Stories'),
  ('home.section.seasonal.valentines.romanticDramas', {}, 'Romantic Dramas'),
  ('home.section.seasonal.valentines.romcoms', {}, 'Valentine\'s Rom-Coms'),
  ('home.section.seasonalPicks', {}, 'Seasonal Picks'),
  ('home.section.topGenre', {'genre': 'Drama'}, 'Top Drama'),
  ('home.section.topPicksToday', {}, 'Top Picks Today'),
  ('home.section.topRated', {}, 'Top Rated'),
  ('home.section.topRatedMovies', {}, 'Top Rated Movies'),
  ('home.section.topRatedTv', {}, 'Top Rated TV'),
  ('home.section.trendingOnServer', {}, 'Trending on Server'),
  ('home.section.trendingThisWeek', {}, 'Trending This Week'),
];

class _French extends AppLocalizationsEn {
  @override
  String get siloSectionHiddenGems => 'Pépites cachées';

  @override
  String siloSectionRecentlyAddedIn(String library) =>
      'Ajouts récents dans $library';
}

ServerHomeSection _section(
  String title, {
  String? key,
  Map<String, String> args = const {},
}) => ServerHomeSection(
  id: '1',
  title: title,
  kind: 'hidden_gems',
  titleKey: key,
  titleArgs: args,
);

void main() {
  test('every Silo title key reads in English as Silo sends it', () {
    final l10n = AppLocalizationsEn();
    for (final (key, args, english) in _siloTitles) {
      expect(
        localizeServerSectionTitle(
          _section('server title', key: key, args: args),
          l10n,
        ),
        english,
        reason: key,
      );
    }
  });

  test('a keyed title shows in the app\'s language', () {
    expect(
      localizeServerSectionTitle(
        _section('Hidden Gems', key: 'home.section.hiddenGems'),
        _French(),
      ),
      'Pépites cachées',
    );
    expect(
      localizeServerSectionTitle(
        _section(
          'Recently Added in Films',
          key: 'home.section.recentlyAddedIn',
          args: {'library': 'Films'},
        ),
        _French(),
      ),
      'Ajouts récents dans Films',
    );
  });

  test('the server\'s title stays when there is nothing to translate by', () {
    // Renamed by the user: Silo sends no key.
    expect(
      localizeServerSectionTitle(_section('Sunday Picks'), _French()),
      'Sunday Picks',
    );
    // A key newer than this app.
    expect(
      localizeServerSectionTitle(
        _section('Brand New Row', key: 'home.section.brandNewRow'),
        _French(),
      ),
      'Brand New Row',
    );
    // The library name the message needs is missing.
    expect(
      localizeServerSectionTitle(
        _section('Recently Added in Films', key: 'home.section.recentlyAddedIn'),
        _French(),
      ),
      'Recently Added in Films',
    );
  });
}
