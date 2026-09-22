import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_episode_images.dart';
import 'package:moonfin/ui/screens/detail/minimalist/widgets/minimalist_episodes_section.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ImageApi extends Mock implements ImageApi {}

class _ViewModel extends Mock implements ItemDetailViewModel {}

AggregatedItem _episode(Map<String, dynamic> extra) => AggregatedItem(
  id: 'ep-1',
  serverId: 'srv1',
  rawData: {
    'Id': 'ep-1',
    'Name': 'An episode',
    'Type': 'Episode',
    ...extra,
  },
);

void main() {
  late _ImageApi imageApi;

  setUp(() {
    imageApi = _ImageApi();
    when(
      () => imageApi.getThumbImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenAnswer((i) => 'thumb:${i.positionalArguments.first}');
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenAnswer((i) => 'primary:${i.positionalArguments.first}');
  });

  test('a special with no still of its own falls back to the series thumb', () {
    // The real case: episodes outside a numbered season often carry no
    // PrimaryImageTag at all, so without this the card comes up blank.
    final special = _episode({
      'SeriesId': 'series-1',
      'SeriesThumbImageTag': 'abc',
    });

    expect(
      resolveSeriesLandscapeThumbnailUrl(special, imageApi, maxWidth: 400),
      'thumb:series-1',
    );
  });

  test('the parent thumb wins over the series one when both are there', () {
    final episode = _episode({
      'ParentThumbItemId': 'season-1',
      'ParentThumbImageTag': 'def',
      'SeriesId': 'series-1',
      'SeriesThumbImageTag': 'abc',
    });

    expect(
      resolveSeriesLandscapeThumbnailUrl(episode, imageApi, maxWidth: 400),
      'thumb:season-1',
    );
  });

  test('with no thumb anywhere it tries the series poster', () {
    final episode = _episode({
      'SeriesId': 'series-1',
      'SeriesPrimaryImageTag': 'ghi',
    });

    expect(
      resolveSeriesLandscapeThumbnailUrl(episode, imageApi, maxWidth: 400),
      'primary:series-1',
    );
  });

  test('an episode naming nothing resolves to nothing', () {
    expect(
      resolveSeriesLandscapeThumbnailUrl(_episode({}), imageApi, maxWidth: 400),
      isNull,
    );
  });

  test('the width asked for follows the height the card reserves', () {
    expect(landscapeWidthFor(90), 160);
    expect(landscapeWidthFor(150), 267);
  });

  group('the width the card asks the server for', () {
    late UserPreferences prefs;
    late _ViewModel vm;

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      vm = _ViewModel();
      when(() => vm.imageApi).thenReturn(imageApi);
    });

    tearDown(() => GetIt.instance.reset());

    int requestedWidth(double cardWidth, double devicePixelRatio) {
      final episode = _episode({
        'ImageTags': {'Primary': 'own-tag'},
      });
      minimalistEpisodeImageUrl(
        episode,
        vm,
        prefs: prefs,
        cardWidth: cardWidth,
        devicePixelRatio: devicePixelRatio,
      );
      final call = verify(
        () => imageApi.getPrimaryImageUrl(
          any(),
          maxWidth: captureAny(named: 'maxWidth'),
          tag: any(named: 'tag'),
        ),
      ).captured;
      return call.last as int;
    }

    test('is the same for card widths a few points apart', () {
      // The URL is the disk cache key and the server encodes a file per
      // width it's asked for, so a card width that moves with the screen
      // would otherwise mint a fresh encode, download and cache file for
      // every window size the rail is drawn at.
      expect(requestedWidth(260, 2.0), requestedWidth(266, 2.0));

      // The whole realistic range collapses onto a handful of files rather
      // than one per width.
      final widths = {
        for (var card = 170.0; card <= 340.0; card += 1)
          requestedWidth(card, 2.0),
      };
      expect(widths.length, lessThanOrEqualTo(3));
    });

    test("still climbs for a card that's genuinely bigger", () {
      expect(requestedWidth(340, 2.0), greaterThan(requestedWidth(170, 2.0)));
    });

    test('covers the card at the density it paints', () {
      expect(requestedWidth(266, 2.0), greaterThanOrEqualTo(532));
    });

    test('stops scaling past the density the decoder stops at', () {
      // A panel reporting three asks for the same file a 2x one does.
      expect(requestedWidth(266, 3.0), requestedWidth(266, 2.0));
    });
  });
}
