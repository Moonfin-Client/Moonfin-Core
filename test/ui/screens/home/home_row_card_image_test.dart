import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_row_card_image.dart';
import 'package:server_core/server_core.dart' show ImageApi;
import 'package:shared_preferences/shared_preferences.dart';

class _PrimaryImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'http://fake/$itemId/Primary?tag=${tag ?? ''}';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'http://fake/$itemId/Backdrop?tag=${tag ?? ''}';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// What a card asked the url lookup for.
typedef _Lookup = ({
  double height,
  ImageType imageType,
  bool useSeriesThumbs,
  bool isMyMediaRow,
});

AggregatedItem _item(String id, String type, {Map<String, Object>? extra}) =>
    AggregatedItem(
      id: id,
      serverId: 'srv',
      rawData: {
        'Id': id,
        'Type': type,
        'ImageTags': {'Primary': 'p-$id'},
        ...?extra,
      },
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<UserPreferences> createPreferences(
    HomeRowsStyle style, {
    bool modernCardsOnMyMedia = true,
  }) async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'pref_home_rows_style': style.name,
      'pref_modern_cards_my_media': modernCardsOnMyMedia,
    });
    final store = PreferenceStore();
    await store.init();
    return UserPreferences(store);
  }

  final api = _PrimaryImageApi();
  const row = HomeRow(
    id: 'plugin',
    title: 'Plugin',
    rowType: HomeRowType.pluginDynamic,
  );
  const audioRow = HomeRow(
    id: 'latestAudio',
    title: 'Latest Music',
    rowType: HomeRowType.pluginDynamic,
    isAudio: true,
  );

  final lookups = <_Lookup>[];
  String? recordingLookup(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    ImageType imageType,
    bool useSeriesThumbs,
    double requestScale, {
    bool isMyMediaRow = false,
  }) {
    lookups.add((
      height: height,
      imageType: imageType,
      useSeriesThumbs: useSeriesThumbs,
      isMyMediaRow: isMyMediaRow,
    ));
    return 'cached:${item.id}';
  }

  setUp(lookups.clear);

  HomeRowCardImage image(
    HomeRow row,
    AggregatedItem item,
    UserPreferences prefs,
  ) => homeRowCardImage(
    row,
    item,
    prefs: prefs,
    posterSize: PosterSize.medium,
    useSeriesThumbs: false,
    requestScale: 1,
    platformScale: 0.8,
    imageApi: api,
    resolveUrl: recordingLookup,
  );

  group('Classic rows', () {
    test('a movie gets a 2:3 poster at the portrait height', () async {
      final prefs = await createPreferences(HomeRowsStyle.v1);
      final card = image(row, _item('m1', 'Movie'), prefs);

      expect(card.url, 'cached:m1');
      expect(card.aspectRatio, 2 / 3);
      expect(card.width, closeTo(150 * 0.8 * 2 / 3, 0.001));
      expect(lookups.single.height, closeTo(150 * 0.8, 0.001));
      expect(lookups.single.imageType, ImageType.poster);
    });

    test('a studio is 16:9 at the landscape height', () async {
      final prefs = await createPreferences(HomeRowsStyle.v1);
      final card = image(row, _item('s1', 'Studio'), prefs);

      expect(card.aspectRatio, 16 / 9);
      expect(card.width, closeTo(110 * 0.8 * 16 / 9, 0.001));
      expect(lookups.single.height, closeTo(110 * 0.8, 0.001));
    });

    test('an audio row is square', () async {
      final prefs = await createPreferences(HomeRowsStyle.v1);
      final card = image(audioRow, _item('a1', 'MusicAlbum'), prefs);

      expect(card.aspectRatio, 1.0);
      expect(card.width, closeTo(150 * 0.8, 0.001));
    });
  });

  group('Modern rows', () {
    test('cards are 2:3 posters at the modern image height', () async {
      final prefs = await createPreferences(HomeRowsStyle.v2);
      // Classic draws a studio 16:9 at the landscape height.
      final card = image(row, _item('s1', 'Studio'), prefs);

      expect(card.aspectRatio, 2 / 3);
      expect(card.width, closeTo(150 * 0.8 * 2 / 3, 0.001));
      expect(lookups.single.height, closeTo(150 * 0.8, 0.001));
      expect(lookups.single.imageType, ImageType.poster);
      expect(lookups.single.useSeriesThumbs, isFalse);
    });

    test('an episode asks for its series poster', () async {
      final prefs = await createPreferences(HomeRowsStyle.v2);
      image(row, _item('e1', 'Episode'), prefs);

      expect(lookups.single.useSeriesThumbs, isTrue);
    });

    test('a Seerr filter row keeps its wide Classic cards', () async {
      final prefs = await createPreferences(HomeRowsStyle.v2);
      const seerrStudios = HomeRow(
        id: 'seerr_studios',
        title: 'Studios',
        rowType: HomeRowType.pluginDynamic,
      );
      final card = image(seerrStudios, _item('s1', 'Studio'), prefs);

      expect(card.aspectRatio, 16 / 9);
      expect(lookups.single.imageType, ImageType.thumb);
      expect(lookups.single.height, closeTo(110 * 0.8, 0.001));
    });

    test('My Media asks for posters as a My Media row', () async {
      final prefs = await createPreferences(HomeRowsStyle.v2);
      const myMedia = HomeRow(
        id: 'libraryTiles',
        title: 'My Media',
        rowType: HomeRowType.libraryTiles,
      );
      final card = image(myMedia, _item('l1', 'CollectionFolder'), prefs);

      expect(card.aspectRatio, 2 / 3);
      expect(lookups.single.imageType, ImageType.poster);
      expect(lookups.single.isMyMediaRow, isTrue);
    });

    test('My Media without Modern cards draws wide thumbs at the modern '
        'height', () async {
      final prefs = await createPreferences(
        HomeRowsStyle.v2,
        modernCardsOnMyMedia: false,
      );
      const myMedia = HomeRow(
        id: 'libraryTiles',
        title: 'My Media',
        rowType: HomeRowType.libraryTiles,
      );
      final card = homeRowCardImage(
        myMedia,
        _item('l1', 'CollectionFolder'),
        prefs: prefs,
        posterSize: PosterSize.medium,
        // Home ignores the series thumbs setting for these cards.
        useSeriesThumbs: true,
        requestScale: 1,
        platformScale: 0.8,
        imageApi: api,
        resolveUrl: recordingLookup,
      );

      expect(card.aspectRatio, 16 / 9);
      expect(card.width, closeTo(150 * 0.8 * 16 / 9, 0.001));
      expect(lookups.single.height, closeTo(150 * 0.8, 0.001));
      expect(lookups.single.imageType, ImageType.thumb);
      expect(lookups.single.useSeriesThumbs, isFalse);
      expect(lookups.single.isMyMediaRow, isTrue);
    });
  });

  group('Carousel rows', () {
    const myMedia = HomeRow(
      id: 'libraryTiles',
      title: 'My Media',
      rowType: HomeRowType.libraryTiles,
    );

    test('use Modern cards', () async {
      final prefs = await createPreferences(HomeRowsStyle.carousel);
      final card = image(row, _item('m1', 'Movie'), prefs);

      expect(isHomeRowModern(row, prefs), isTrue);
      expect(card.aspectRatio, 2 / 3);
      expect(lookups.single.imageType, ImageType.poster);
    });

    test('draw the panel only for media rows', () async {
      final prefs = await createPreferences(HomeRowsStyle.carousel);

      expect(isHomeRowCarousel(row, prefs), isTrue);
      expect(isHomeRowCarousel(audioRow, prefs), isFalse);
      expect(isHomeRowCarousel(myMedia, prefs), isFalse);
    });

    test('Modern and Classic rows draw no panel', () async {
      for (final style in [HomeRowsStyle.v1, HomeRowsStyle.v2]) {
        final prefs = await createPreferences(style);
        expect(isHomeRowCarousel(row, prefs), isFalse);
      }
    });

    test('the panel takes the item backdrop, else its parent, else none', () {
      final own = _item('m1', 'Movie', extra: {'BackdropImageTags': ['b1']});
      final episode = _item(
        'e1',
        'Episode',
        extra: {
          'ParentBackdropItemId': 'series1',
          'ParentBackdropImageTags': ['sb1'],
        },
      );

      expect(carouselBackdropUrl(own, api), 'http://fake/m1/Backdrop?tag=b1');
      expect(
        carouselBackdropUrl(episode, api),
        'http://fake/series1/Backdrop?tag=sb1',
      );
      expect(carouselBackdropUrl(_item('v1', 'Video'), api), isNull);
    });
  });

  test('the MDBList watching row paints the stored backdrop at 16:9', () async {
    final prefs = await createPreferences(HomeRowsStyle.v2);
    const watching = HomeRow(
      id: 'mdblist_watching_now',
      title: 'Watching Now',
      rowType: HomeRowType.pluginDynamic,
    );
    final card = image(
      watching,
      _item('w1', 'Movie', extra: {'BackdropPath': 'https://img/w1.jpg'}),
      prefs,
    );

    expect(card.url, 'https://img/w1.jpg');
    expect(card.aspectRatio, 16 / 9);
    expect(card.width, closeTo(110 * 0.8 * 16 / 9, 0.001));
    expect(lookups, isEmpty);
  });

  test(
    'without a cached lookup the url comes from resolveRowImageUrl',
    () async {
      final prefs = await createPreferences(HomeRowsStyle.v1);
      final card = homeRowCardImage(
        row,
        _item('m1', 'Movie'),
        prefs: prefs,
        posterSize: PosterSize.medium,
        useSeriesThumbs: false,
        requestScale: 1,
        platformScale: 0.8,
        imageApi: api,
      );

      expect(card.url, 'http://fake/m1/Primary?tag=p-m1');
    },
  );

  test(
    'the Modern metadata line shows artist and year, genres and runtime',
    () {
      String line(Map<String, dynamic> raw) => homeRowModernMetadataLine(
        AggregatedItem(id: 'i', serverId: 's', rawData: raw),
      );
      const minute = 600000000;

      expect(
        line({
          'Type': 'MusicAlbum',
          'AlbumArtist': ' Daft Punk ',
          'ProductionYear': 2013,
          'Genres': ['Electronic', 'Disco', 'Funk'],
        }),
        'Daft Punk (2013) • Electronic • Disco',
      );
      expect(
        line({
          'Type': 'Audio',
          'AlbumArtists': [
            {'Name': 'Air'},
          ],
        }),
        'Air',
      );
      expect(
        line({
          'Type': 'MusicAlbum',
          'Artists': ['Justice'],
          'ProductionYear': 2007,
        }),
        'Justice (2007)',
      );
      expect(line({'Type': 'MusicAlbum', 'ProductionYear': 2001}), '2001');
      expect(
        line({
          'Type': 'Movie',
          'ProductionYear': 1999,
          'Genres': ['Action'],
          'RunTimeTicks': 136 * minute,
        }),
        '1999 • Action • 2h 16m',
      );
      expect(line({'Type': 'Movie', 'RunTimeTicks': 120 * minute}), '2h');
      expect(line({'Type': 'Episode', 'RunTimeTicks': 45 * minute}), '45m');
      expect(line({'Type': 'Episode', 'RunTimeTicks': minute ~/ 2}), '');
      expect(line({'Type': 'Episode', 'RunTimeTicks': 0}), '');
    },
  );
}
