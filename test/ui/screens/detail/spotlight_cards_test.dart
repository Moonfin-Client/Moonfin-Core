// The Spotlight summary cards are a pure mapping from view-model state:
// which cards an item type gets, which sections each card's modal holds, and
// the counts on the card subtitles. Cards whose every section would be empty
// are omitted.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/spotlight/spotlight_cards.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Vm extends Mock implements ItemDetailViewModel {}

class _SeerrVm extends Mock implements SeerrMediaDetailViewModel {}

class _ImageApi extends Mock implements ImageApi {}

final _l10n = AppLocalizationsEn();

AggregatedItem _item(String type, [Map<String, dynamic> extra = const {}]) =>
    AggregatedItem(
      id: 'item-1',
      serverId: 'server-1',
      rawData: {'Id': 'item-1', 'Type': type, 'Name': 'Thing', ...extra},
    );

AggregatedItem _child(String id, String type) => AggregatedItem(
  id: id,
  serverId: 'server-1',
  rawData: {'Id': id, 'Type': type, 'Name': id},
);

SpotlightCardActions _actions() => SpotlightCardActions(
  openItem: (_) {},
  openSeerrItem: (_) {},
  openPerson: (_) {},
  openStudio: (_) {},
  playFromChapter: (_) {},
  playExtra: (_) {},
  playTrack: (_) {},
  playPlaylistTrack: (_) {},
  trackFocusNode: (_) => FocusNode(),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Vm vm;
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final imageApi = _ImageApi();
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://img/primary');
    when(
      () => imageApi.getChapterImageUrl(
        any(),
        index: any(named: 'index'),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://img/chapter');

    vm = _Vm();
    when(() => vm.imageApi).thenReturn(imageApi);
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.actors).thenReturn(const []);
    when(() => vm.directors).thenReturn(const []);
    when(() => vm.writers).thenReturn(const []);
    when(() => vm.features).thenReturn(const []);
    when(() => vm.similar).thenReturn(const []);
    when(() => vm.seasons).thenReturn(const []);
    when(() => vm.episodes).thenReturn(const []);
    when(() => vm.seriesEpisodes).thenReturn(const []);
    when(() => vm.nextUp).thenReturn(null);
    when(() => vm.tracks).thenReturn(const []);
    when(() => vm.albums).thenReturn(const []);
    when(() => vm.filmography).thenReturn(const []);
    when(() => vm.filmographyMovies).thenReturn(const []);
    when(() => vm.filmographySeries).thenReturn(const []);
    when(() => vm.collectionItems).thenReturn(const []);
    when(() => vm.missingCollectionItems).thenReturn(const []);
    when(() => vm.playlistItems).thenReturn(const []);
    when(() => vm.parentCollections).thenReturn(const []);
    when(() => vm.canManagePlaylistTracks).thenReturn(false);
    when(() => vm.seerr).thenReturn(null);
  });

  List<SpotlightCardSpec> cardsFor(AggregatedItem item) => spotlightCardsFor(
    vm: vm,
    item: item,
    prefs: prefs,
    l10n: _l10n,
    tmdbStudios: const [],
    actions: _actions(),
  );

  test('an item with no loaded content gets no cards', () {
    expect(cardsFor(_item('Movie')), isEmpty);
  });

  test('a movie maps to people, chapters/extras and similar cards', () {
    when(() => vm.actors).thenReturn([
      {'Id': 'p1', 'Name': 'Actor One', 'PrimaryImageTag': 't1'},
      {'Id': 'p2', 'Name': 'Actor Two'},
    ]);
    when(() => vm.directors).thenReturn([
      {'Id': 'p3', 'Name': 'Director'},
    ]);
    when(() => vm.features).thenReturn([_child('e1', 'Video')]);
    when(() => vm.similar).thenReturn([
      _child('s1', 'Movie'),
      _child('s2', 'Movie'),
    ]);
    final item = _item('Movie', {
      'Studios': [
        {'Name': 'A24'},
      ],
      'Chapters': [
        {'Name': 'Opening', 'StartPositionTicks': 0},
      ],
    });

    final cards = cardsFor(item);

    expect(cards.map((c) => c.id), ['people', 'chapters_extras', 'similar']);

    final people = cards[0];
    expect(people.title, 'Cast, Crew, and Studios');
    expect(people.subtitle, '3 people · 1 studio');
    expect(people.sections.map((s) => s.title), [
      _l10n.castMembers,
      _l10n.crewSection,
      _l10n.studios,
    ]);
    expect(people.sections.map((s) => s.count), [2, 1, 1]);

    final chapters = cards[1];
    expect(chapters.subtitle, '1 chapter · 1 extra');
    expect(chapters.sections.first.title, _l10n.chapters);

    expect(cards[2].subtitle, '2 titles');
  });

  test('a person in both cast and crew is counted once', () {
    when(() => vm.actors).thenReturn([
      {'Id': 'p1', 'Name': 'Both'},
    ]);
    when(() => vm.writers).thenReturn([
      {'Id': 'p1', 'Name': 'Both'},
    ]);

    final cards = cardsFor(_item('Movie'));
    expect(cards.single.subtitle, '1 person');
  });

  test('a series leads with the seasons card', () {
    when(() => vm.seasons).thenReturn([
      _child('season-1', 'Season'),
      _child('season-2', 'Season'),
    ]);
    final cards = cardsFor(_item('Series', {'RecursiveItemCount': 20}));

    final seasons = cards.first;
    expect(seasons.id, 'seasons');
    expect(seasons.title, 'Seasons and Episodes');
    expect(seasons.subtitle, '2 seasons · 20 episodes');
    expect(seasons.sections.single.title, _l10n.seasons);
  });

  test('an episode offers the rest of its season', () {
    when(() => vm.episodes).thenReturn([
      _child('ep-1', 'Episode'),
      _child('ep-2', 'Episode'),
      _child('ep-3', 'Episode'),
    ]);
    final cards = cardsFor(_item('Episode'));

    expect(cards.single.id, 'episodes');
    expect(cards.single.title, 'More Episodes');
    expect(cards.single.subtitle, '3 episodes');
  });

  test('a music album gets the track list card', () {
    when(() => vm.tracks).thenReturn([
      AggregatedItem(
        id: 'track-1',
        serverId: 'server-1',
        rawData: const {
          'Id': 'track-1',
          'Type': 'Audio',
          'Name': 'Track',
          // 30 minutes in ticks.
          'RunTimeTicks': 18000000000,
        },
      ),
    ]);
    final cards = cardsFor(_item('MusicAlbum'));

    expect(cards.single.id, 'tracks');
    expect(cards.single.subtitle, '1 track · 30m');
  });

  test('a person maps to the filmography card', () {
    when(() => vm.filmographyMovies).thenReturn([_child('m1', 'Movie')]);
    when(
      () => vm.filmographySeries,
    ).thenReturn([_child('s1', 'Series'), _child('s2', 'Series')]);
    final cards = cardsFor(_item('Person'));

    final filmography = cards.single;
    expect(filmography.id, 'filmography');
    expect(filmography.subtitle, '1 movie · 2 shows');
    expect(filmography.sections.map((s) => s.title), [
      _l10n.movies,
      _l10n.series,
    ]);
  });

  test('seerr recommendations join the similar card with a seerr title', () {
    final seerrVm = _SeerrVm();
    when(() => seerrVm.state).thenReturn(
      SeerrMediaDetailState(
        movie: const SeerrMovieDetails(id: 42, title: 'The Movie'),
        recommendations: const [
          SeerrDiscoverItem(id: 1, title: 'Rec', posterPath: '/rec.jpg'),
        ],
        similar: const [
          SeerrDiscoverItem(id: 2, title: 'Sim', posterPath: '/sim.jpg'),
        ],
      ),
    );
    when(() => vm.seerr).thenReturn(seerrVm);
    when(() => vm.similar).thenReturn([_child('s1', 'Movie')]);

    final cards = cardsFor(_item('Movie'));

    final similarCard = cards.singleWhere((c) => c.id == 'similar');
    expect(similarCard.title, _l10n.recommendations);
    expect(similarCard.sections.map((s) => s.title), [
      _l10n.recommendationSystemMoonfin,
      _l10n.spotlightRecommendationsSeerr,
      'Similar (Seerr)',
    ]);
  });

  test('collections card prepends the collection itself as the first item with artwork', () {
    when(() => vm.parentCollections).thenReturn([
      ParentCollection(
        id: 'box-1',
        name: 'Alien Anthology',
        primaryImageTag: 'tag-box-1',
        items: [_child('m1', 'Movie'), _child('m2', 'Movie')],
      ),
    ]);
    final cards = cardsFor(_item('Movie'));

    final collectionsCard = cards.singleWhere((c) => c.id == 'collections');
    expect(collectionsCard.title, _l10n.spotlightCollectionsCard);
    expect(collectionsCard.subtitle, '1 collection');
    expect(collectionsCard.sections.single.title, 'Alien Anthology');
    expect(collectionsCard.sections.single.count, 3);
  });

  test('boxset items card combines library items and missing seerr items', () {
    when(() => vm.collectionItems).thenReturn([
      _child('m1', 'Movie'),
      _child('m2', 'Movie'),
    ]);
    when(() => vm.missingCollectionItems).thenReturn([
      AggregatedItem(
        id: 'tmdb:movie:999',
        serverId: 'seerr',
        rawData: const {
          'Id': 'tmdb:movie:999',
          'Name': 'Missing Sequel',
          'Type': 'Movie',
        },
      ),
    ]);
    final cards = cardsFor(_item('BoxSet'));
    final boxSetCard = cards.singleWhere((c) => c.id == 'boxset_items');
    expect(boxSetCard.title, _l10n.spotlightMoviesAndShows);
    expect(boxSetCard.sections.first.count, 3);
  });

  test('a person keeps their seerr credits sections', () {
    final cards = spotlightCardsFor(
      vm: vm,
      item: _item('Person'),
      prefs: prefs,
      l10n: _l10n,
      tmdbStudios: const [],
      actions: _actions(),
      seerrAppearances: const [
        SeerrDiscoverItem(id: 1, title: 'Cast In', posterPath: '/a.jpg'),
      ],
      seerrCrewCredits: const [
        SeerrDiscoverItem(id: 2, title: 'Wrote', posterPath: '/b.jpg'),
      ],
    );

    final filmography = cards.single;
    expect(filmography.id, 'filmography');
    expect(filmography.sections.map((s) => s.title), [
      _l10n.appearancesSeerr,
      _l10n.crewContributionsSeerr,
    ]);
  });

  test('a seerr-only title only offers what seerr can fill', () {
    when(() => vm.isSeerrOnly).thenReturn(true);
    when(() => vm.actors).thenReturn([
      {'Id': 'p1', 'Name': 'Actor', 'ProfilePath': '/x.jpg'},
    ]);
    when(() => vm.similar).thenReturn([_child('s1', 'Movie')]);
    // Chapters and features never apply to an unlibraried title.
    final cards = cardsFor(_item('Movie'));

    expect(cards.map((c) => c.id), ['people', 'similar']);
  });

  test('empty sections are dropped from a card', () {
    when(() => vm.actors).thenReturn([
      {'Id': 'p1', 'Name': 'Actor'},
    ]);
    final cards = cardsFor(_item('Movie'));

    // No crew and no studios: the people card holds only the cast section.
    expect(cards.single.sections.map((s) => s.title), [_l10n.castMembers]);
  });
}
