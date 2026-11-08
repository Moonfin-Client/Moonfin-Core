import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Views extends Fake implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getAllViewsIncludingHidden() async => const [
    AggregatedLibrary(
      id: 'movies',
      name: 'Movies',
      collectionType: 'movies',
      serverId: 'server',
    ),
    AggregatedLibrary(
      id: 'music',
      name: 'Music',
      collectionType: 'music',
      serverId: 'server',
    ),
  ];
}

HomeRow _row(String id, {bool empty = false}) => HomeRow(
  id: id,
  title: id,
  rowType: HomeRowType.latestMedia,
  items: empty
      ? const []
      : const [AggregatedItem(id: '1', serverId: 'server', rawData: {})],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a Latest row leads to its library', () {
    final target = homeRowSeeAllTarget(_row('latest_lib-1'));
    expect(target?.id, 'lib-1');
    expect(target?.isCollection, isFalse);
  });

  test('a pinned collection row leads to the collection', () {
    final target = homeRowSeeAllTarget(
      _row('pluginDynamic:collections:server:home:box-7'),
    );
    expect(target?.id, 'box-7');
    expect(target?.isCollection, isTrue);
  });

  test('rows from several places or no single source lead nowhere', () {
    for (final id in [
      'mergedtype_latest_movies',
      'pluginDynamic:genres:server:home:genre-3',
      'pluginDynamic:collections:server:home:',
      'collections_lib-1',
      'resume',
      'sonarr_calendar',
    ]) {
      expect(homeRowSeeAllTarget(_row(id)), isNull, reason: id);
    }
  });

  test('only rows with a source and something in them get the card', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

    expect(HomeScreen.showsSeeAll(_row('latest_lib-1'), prefs), isTrue);
    expect(
      HomeScreen.showsSeeAll(
        _row('pluginDynamic:collections:server:home:box-7'),
        prefs,
      ),
      isTrue,
    );
    expect(
      HomeScreen.showsSeeAll(_row('latest_lib-1', empty: true), prefs),
      isFalse,
    );
    expect(HomeScreen.showsSeeAll(_row('resume'), prefs), isFalse);
  });

  group('See All opens', () {
    setUp(
      () => GetIt.instance.registerSingleton<UserViewsRepository>(_Views()),
    );
    tearDown(GetIt.instance.reset);

    test('the library a Latest row comes from, by its type', () async {
      expect(
        await HomeScreen.seeAllRoute(_row('latest_movies')),
        Destinations.library('movies', serverId: 'server'),
      );
      expect(
        await HomeScreen.seeAllRoute(_row('latest_music')),
        Destinations.musicLibrary('music'),
      );
    });

    test('a library missing from the views still opens by id', () async {
      expect(
        await HomeScreen.seeAllRoute(_row('latest_gone')),
        Destinations.library('gone', serverId: 'server'),
      );
    });

    test('a pinned collection opens its page', () async {
      expect(
        await HomeScreen.seeAllRoute(
          _row('pluginDynamic:collections:server:home:box-7'),
        ),
        Destinations.item('box-7', serverId: 'server'),
      );
    });

    test('an Upcoming row opens the calendar', () async {
      expect(
        await HomeScreen.seeAllRoute(_row('radarr_calendar')),
        Destinations.calendarMonth,
      );
    });
  });
}
