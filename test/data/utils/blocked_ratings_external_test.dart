import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

AggregatedItem _item(String id, {String? rating}) => AggregatedItem(
  id: id,
  serverId: 'seerr',
  rawData: {
    'Name': id,
    'Type': 'Movie',
    'OfficialRating': ?rating,
  },
);

/// Titles from outside lists only carry a rating when Moonbase looked one up,
/// so once a viewer blocks anything, a title with no rating has to stay out.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  });

  tearDown(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
  });

  final items = [
    _item('pg', rating: 'PG'),
    _item('r', rating: 'R'),
    _item('unrated'),
    _item('blank', rating: ' '),
  ];

  test('with nothing blocked every title stays, unrated included', () {
    expect(withoutUnratedOrBlockedItems(items), same(items));
  });

  test('a blocked rating drops its titles and every unrated one', () async {
    await prefs.set(UserPreferences.blockedParentalRatings, 'R');

    expect(
      withoutUnratedOrBlockedItems(items).map((i) => i.id),
      ['pg'],
    );
  });

  test('the library rule still lets unrated titles through', () async {
    await prefs.set(UserPreferences.blockedParentalRatings, 'R');

    expect(
      withoutBlockedItems(items).map((i) => i.id),
      ['pg', 'unrated', 'blank'],
    );
  });
}
