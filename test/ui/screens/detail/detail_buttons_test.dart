import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Seeds the arrangement through the layout itself, so the test follows
/// whichever per-device preference this platform reads.
Future<UserPreferences> _prefs({String? order, String? hidden}) async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  if (order != null) {
    await prefs.set(detailButtonLayout.orderPreference, order);
  }
  if (hidden != null) {
    await prefs.set(detailButtonLayout.hiddenPreference, hidden);
  }
  return prefs;
}

List<String> _arrangedIds(UserPreferences prefs) => detailButtonLayout
    .ordered(DetailButton.values, (b) => b.id, prefs)
    .map((b) => b.id)
    .toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DetailButton', () {
    test('every id is distinct, since the id is what gets stored', () {
      final ids = DetailButton.values.map((b) => b.id).toList();
      expect(ids.toSet(), hasLength(ids.length));
    });

    test('the request buttons lead the row when nothing is arranged', () async {
      final prefs = await _prefs();
      expect(_arrangedIds(prefs).take(2), ['seerrRequest', 'seerrRequest4k']);
    });

    test('the request buttons still lead a row arranged before they existed',
        () async {
      // What an existing viewer has stored, with no idea the Seerr buttons are
      // coming. Anything declared before the first placed button keeps rank -1,
      // so the new ones land at the head rather than the end.
      final prefs = await _prefs(order: 'favorite,watched,shuffle');
      final ids = _arrangedIds(prefs);

      expect(ids.take(2), ['seerrRequest', 'seerrRequest4k']);
      expect(
        ids.where((id) => ['favorite', 'watched', 'shuffle'].contains(id)),
        ['favorite', 'watched', 'shuffle'],
      );
    });

    test('the trailing Seerr buttons follow the one they were declared after',
        () async {
      final prefs = await _prefs(order: 'goToSeries,admin');
      final ids = _arrangedIds(prefs);

      // Declared between goToSeries and admin, so they inherit goToSeries'
      // place rather than jumping to either end.
      expect(ids.sublist(ids.indexOf('goToSeries')), [
        'goToSeries',
        'seerrWatchlist',
        'seerrReportIssue',
        'seerrManage',
        'admin',
      ]);
    });

    test('hiding a Seerr button is honoured like any other', () async {
      final prefs = await _prefs(hidden: 'seerrWatchlist');
      expect(
        detailButtonLayout.hidden(prefs),
        contains(DetailButton.seerrWatchlist.id),
      );
    });
  });
}
