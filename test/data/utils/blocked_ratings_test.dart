import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/parental_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

AggregatedItem _item(String id, {String? rating}) => AggregatedItem(
  id: id,
  serverId: 'srv1',
  rawData: {
    'Id': id,
    'Name': id,
    'Type': 'Movie',
    if (rating != null) 'OfficialRating': rating,
  },
);

Future<UserPreferences> _register() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  GetIt.instance.registerSingleton<UserPreferences>(prefs);
  return prefs;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
  });

  tearDown(() async {
    await GetIt.instance.reset();
    resetParentalFilterCache();
  });

  test('with no preferences registered nothing is blocked', () {
    // A test or a boot ordering this knows nothing about. Blanking the app
    // would be far worse than the gap.
    expect(activeParentalFilter, ParentalFilter.none);
    expect(isRatingBlocked('R'), isFalse);
  });

  test('the default blocks nothing', () async {
    await _register();
    expect(activeParentalFilter.isActive, isFalse);
  });

  test('a write is picked up on the next read', () async {
    final prefs = await _register();
    expect(isRatingBlocked('R'), isFalse);

    await prefs.set(UserPreferences.blockedParentalRatings, 'R');

    expect(isRatingBlocked('R'), isTrue);
    expect(isRatingBlocked('PG'), isFalse);
  });

  test('the same stored value is not reparsed', () async {
    await _register();
    expect(identical(activeParentalFilter, activeParentalFilter), isTrue);
  });

  test('blocked items are dropped and the order is kept', () async {
    final prefs = await _register();
    await prefs.set(UserPreferences.blockedParentalRatings, 'R');

    final kept = withoutBlockedItems([
      _item('a', rating: 'PG'),
      _item('b', rating: 'R'),
      _item('c', rating: 'G'),
    ]);

    expect(kept.map((i) => i.id), ['a', 'c']);
  });

  test('an episode with no rating is judged by its series', () async {
    // The usual shape. Without this, blocking a rating hides the series and
    // leaves its episodes listed underneath.
    final prefs = await _register();
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');

    final kept = withoutBlockedItems(
      [_item('ep')],
      fallbackRating: 'TV-MA',
    );

    expect(kept, isEmpty);
  });

  test('an episode with its own milder rating is judged on that', () async {
    final prefs = await _register();
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');

    final kept = withoutBlockedItems(
      [_item('ep', rating: 'TV-G')],
      fallbackRating: 'TV-MA',
    );

    expect(kept.map((i) => i.id), ['ep']);
  });
}
