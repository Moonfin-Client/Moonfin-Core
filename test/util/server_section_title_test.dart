import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/util/server_section_title.dart';
import 'package:server_core/server_core.dart';

// Every key Silo sends for a home row's title, with its arguments and the
// English Silo sends as the title. Spelled out so a key wired to the wrong
// string fails here.
const _siloTitles = <(String, Map<String, String>, String)>[
  ('home.section.becauseYouEnjoy', {'genres': 'Drama & Comedy'}, 'Because you enjoy Drama & Comedy'),
  ('home.section.becauseYouWatched', const {}, 'Because You Watched'),
  ('home.section.becauseYouWatchedTitle', {'title': 'Dune'}, 'Because You Watched Dune'),
  ('home.section.continueListening', const {}, 'Continue Listening'),
  ('home.section.continueReading', const {}, 'Continue Reading'),
  ('home.section.continueWatching', const {}, 'Continue Watching'),
  ('home.section.forYou', const {}, 'For You'),
  ('home.section.hiddenGems', const {}, 'Hidden Gems'),
  ('home.section.highlyRatedInLibrary', const {}, 'Highly Rated in Your Library'),
  ('home.section.nextInYourSeries', const {}, 'Next in Your Series'),
  ('home.section.nextUp', const {}, 'Next Up'),
  ('home.section.pickedFromYourHistory', const {}, 'Picked from your history'),
  ('home.section.popularOnServer', const {}, 'Popular on This Server'),
  ('home.section.profilesLikeYouEnjoyed', const {}, 'Profiles Like You Enjoyed'),
  ('home.section.randomPicks', const {}, 'Random Picks'),
  ('home.section.recentlyAdded', const {}, 'Recently Added'),
  ('home.section.recentlyAddedAudiobooks', const {}, 'Recently Added Audiobooks'),
  ('home.section.recentlyAddedEbooks', const {}, 'Recently Added Ebooks'),
  ('home.section.recentlyAddedIn', {'library': 'Movies'}, 'Recently Added in Movies'),
  ('home.section.recentlyAddedManga', const {}, 'Recently Added Manga'),
  ('home.section.recentlyAddedMovies', const {}, 'Recently Added Movies'),
  ('home.section.recentlyAddedTv', const {}, 'Recently Added TV'),
  ('home.section.recentlyReleased', const {}, 'Recently Released'),
  ('home.section.recentlyReleasedAudiobooks', const {}, 'Recently Released Audiobooks'),
  ('home.section.recentlyReleasedEbooks', const {}, 'Recently Released Ebooks'),
  ('home.section.recentlyReleasedEpisodes', const {}, 'Recently Released Episodes'),
  ('home.section.recentlyReleasedEpisodesIn', {'library': 'Movies'}, 'Recently Released Episodes in Movies'),
  ('home.section.recentlyReleasedIn', {'library': 'Movies'}, 'Recently Released in Movies'),
  ('home.section.recentlyReleasedManga', const {}, 'Recently Released Manga'),
  ('home.section.recentlyReleasedMovies', const {}, 'Recently Released Movies'),
  ('home.section.recommendedForYou', const {}, 'Recommended for You'),
  ('home.section.returningShows', const {}, 'Returning Shows'),
  ('home.section.seasonal.christmas.classics', const {}, 'Christmas Classics'),
  ('home.section.seasonal.christmas.comedies', const {}, 'Christmas Comedies'),
  ('home.section.seasonal.christmas.family', const {}, 'Family Christmas'),
  ('home.section.seasonal.christmas.favorites', const {}, 'Christmas Favorites'),
  ('home.section.seasonal.christmas.hallmark', const {}, 'Hallmark Christmas'),
  ('home.section.seasonal.christmas.romcoms', const {}, 'Christmas Rom-Coms'),
  ('home.section.seasonal.easter.faith', const {}, 'Easter Stories'),
  ('home.section.seasonal.easter.family', const {}, 'Easter Movies'),
  ('home.section.seasonal.familyMovieNight.favorites', const {}, 'Family Favorites'),
  ('home.section.seasonal.familyMovieNight.liveAction', const {}, 'Family Movie Night'),
  ('home.section.seasonal.familyMovieNight.new', const {}, 'Family Movie Night'),
  ('home.section.seasonal.halloween.animated', const {}, 'Animated Halloween'),
  ('home.section.seasonal.halloween.family', const {}, 'Family Halloween'),
  ('home.section.seasonal.halloween.favorites', const {}, 'Halloween Favorites'),
  ('home.section.seasonal.halloween.horror', const {}, 'Halloween Horror'),
  ('home.section.seasonal.halloween.tv', const {}, 'Halloween TV'),
  ('home.section.seasonal.newYear.favorites', const {}, 'New Year\'s Movies'),
  ('home.section.seasonal.saturdayMorning.cartoons', const {}, 'Saturday Morning Cartoons'),
  ('home.section.seasonal.saturdayMorning.modern', const {}, 'Saturday Morning Favorites'),
  ('home.section.seasonal.saturdayMorning.nineties', const {}, '90s Saturday Mornings'),
  ('home.section.seasonal.stPatricks.irishFilm', const {}, 'Irish Film'),
  ('home.section.seasonal.stPatricks.irishTv', const {}, 'Irish TV'),
  ('home.section.seasonal.summer.blockbusters', const {}, 'Summer Blockbusters'),
  ('home.section.seasonal.summer.classicSummer', const {}, 'Classic Summer Movies'),
  ('home.section.seasonal.summer.nostalgia', const {}, 'Summer Nostalgia'),
  ('home.section.seasonal.summerBlockbuster.blockbusters', const {}, 'Summer Blockbusters'),
  ('home.section.seasonal.summerBlockbuster.classicSummer', const {}, 'Classic Summer Movies'),
  ('home.section.seasonal.summerBlockbuster.nostalgia', const {}, 'Summer Nostalgia'),
  ('home.section.seasonal.thanksgiving.favorites', const {}, 'Thanksgiving Movies'),
  ('home.section.seasonal.thanksgiving.feelGood', const {}, 'Feel-Good Favorites'),
  ('home.section.seasonal.valentines.favorites', const {}, 'Valentine\'s Favorites'),
  ('home.section.seasonal.valentines.loveStories', const {}, 'Classic Love Stories'),
  ('home.section.seasonal.valentines.romanticDramas', const {}, 'Romantic Dramas'),
  ('home.section.seasonal.valentines.romcoms', const {}, 'Valentine\'s Rom-Coms'),
  ('home.section.seasonalPicks', const {}, 'Seasonal Picks'),
  ('home.section.topGenre', {'genre': 'Drama'}, 'Top Drama'),
  ('home.section.topPicksToday', const {}, 'Top Picks Today'),
  ('home.section.topRated', const {}, 'Top Rated'),
  ('home.section.topRatedMovies', const {}, 'Top Rated Movies'),
  ('home.section.topRatedTv', const {}, 'Top Rated TV'),
  ('home.section.trendingOnServer', const {}, 'Trending on Server'),
  ('home.section.trendingThisWeek', const {}, 'Trending This Week'),
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
