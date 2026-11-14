import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Sync extends Mock implements PluginSyncService {}

HomeRow _row(String id, {bool empty = false}) => HomeRow(
  id: id,
  title: id,
  rowType: HomeRowType.pluginDynamic,
  items: empty
      ? const []
      : const [AggregatedItem(id: '1', serverId: 'seerr', rawData: {})],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _Sync sync;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    sync = _Sync();
    when(() => sync.calendarAvailable).thenReturn(true);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
  });

  tearDown(() => GetIt.instance.reset());

  test('the Upcoming rows end with See All', () {
    for (final id in [
      'radarr_calendar',
      'sonarr_calendar',
      'merged_calendar',
    ]) {
      expect(
        HomeScreen.showsCalendarSeeAll(_row(id), prefs),
        isTrue,
        reason: id,
      );
    }
  });

  test('no other row does', () {
    expect(
      HomeScreen.showsCalendarSeeAll(_row('seerr_trending'), prefs),
      isFalse,
    );
  });

  test(
    'not an empty row, with the setting off, or without the calendar',
    () async {
      expect(
        HomeScreen.showsCalendarSeeAll(
          _row('sonarr_calendar', empty: true),
          prefs,
        ),
        isFalse,
      );

      when(() => sync.calendarAvailable).thenReturn(false);
      expect(
        HomeScreen.showsCalendarSeeAll(_row('sonarr_calendar'), prefs),
        isFalse,
      );

      when(() => sync.calendarAvailable).thenReturn(true);
      await prefs.set(UserPreferences.calendarRowSeeAll, false);
      expect(
        HomeScreen.showsCalendarSeeAll(_row('sonarr_calendar'), prefs),
        isFalse,
      );
    },
  );
}
