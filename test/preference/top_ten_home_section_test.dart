import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

AggregatedItem _item(String id, String type, int rating) => AggregatedItem(
  id: id,
  serverId: 'server',
  rawData: {
    'Name': id,
    'Type': type,
    'DateCreated': '2026-07-01T00:00:00.000Z',
    'CommunityRating': rating,
    'ProductionYear': 2026,
  },
);

void main() {
  test('Top 10 sections keep stable persisted identifiers', () {
    expect(
      HomeSectionType.fromSerialized('toptenmovies'),
      HomeSectionType.topTenMovies,
    );
    expect(
      HomeSectionType.fromSerialized('toptentvshows'),
      HomeSectionType.topTenTvShows,
    );
  });

  test('new profiles enable separate movie and TV Top 10 sections', () {
    final defaults = HomeSectionConfig.defaults();
    expect(
      defaults
          .where((c) => c.type == HomeSectionType.topTenMovies)
          .single
          .enabled,
      isTrue,
    );
    expect(
      defaults
          .where((c) => c.type == HomeSectionType.topTenTvShows)
          .single
          .enabled,
      isTrue,
    );
  });

  test('existing saved layouts enable and place Top 10 sections once',
      () async {
    final prefs = await _prefs();
    await prefs.setHomeSectionsConfig(const [
      HomeSectionConfig(type: HomeSectionType.resume, enabled: true, order: 0),
      HomeSectionConfig(
        type: HomeSectionType.topTenMovies,
        enabled: false,
        order: 201,
      ),
      HomeSectionConfig(
        type: HomeSectionType.topTenTvShows,
        enabled: false,
        order: 202,
      ),
      // A duplicate must not survive migration.
      HomeSectionConfig(
        type: HomeSectionType.topTenMovies,
        enabled: false,
        order: 203,
      ),
    ]);

    expect(await prefs.migrateTopTenHomeSections(), isTrue);
    final migrated = prefs.homeSectionsConfig;
    final movies = migrated
        .where((c) => c.type == HomeSectionType.topTenMovies)
        .single;
    final tvShows = migrated
        .where((c) => c.type == HomeSectionType.topTenTvShows)
        .single;
    expect(movies.enabled, isTrue);
    expect(movies.order, 4);
    expect(tvShows.enabled, isTrue);
    expect(tvShows.order, 5);
    expect(await prefs.migrateTopTenHomeSections(), isFalse);
  });

  test('Top 10 fallback ranks accessible movies and excludes episodes', () {
    final candidates = [
      for (var index = 0; index < 12; index++)
        _item('movie-$index', 'Movie', index),
      _item('episode', 'Episode', 10),
      _item('series', 'Series', 10),
    ];

    final ranked = RowDataSource.rankTopTenItems(
      candidates,
      movies: true,
      now: DateTime.utc(2026, 7, 18),
    );

    expect(ranked.take(10), hasLength(10));
    expect(ranked.every((item) => item.type == 'Movie'), isTrue);
    expect(ranked.first.id, 'movie-11');
  });
}
