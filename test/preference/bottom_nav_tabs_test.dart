import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/bottom_nav_tabs.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<PreferenceStore> _store([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return store;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('parsePinnedBottomNavTabs', () {
    test('reads names case-insensitively and ignores whitespace', () {
      expect(
        parsePinnedBottomNavTabs(' Search , LIVETV,folders'),
        [BottomNavTab.search, BottomNavTab.liveTv, BottomNavTab.folders],
      );
    });

    test('drops unknown names and duplicates', () {
      expect(
        parsePinnedBottomNavTabs('podcasts,favorites,favorites,,genres'),
        [BottomNavTab.favorites, BottomNavTab.genres],
      );
    });

    test('keeps at most three', () {
      expect(
        parsePinnedBottomNavTabs('search,libraries,favorites,genres'),
        hasLength(kMaxPinnedBottomNavTabs),
      );
    });

    test('round-trips through serialize', () {
      const tabs = [BottomNavTab.discover, BottomNavTab.search];
      expect(
        parsePinnedBottomNavTabs(serializePinnedBottomNavTabs(tabs)),
        tabs,
      );
    });

    test('empty or all-unknown lists count as automatic', () {
      expect(isAutomaticBottomNavTabs(''), isTrue);
      expect(isAutomaticBottomNavTabs('podcasts,radio'), isTrue);
      expect(isAutomaticBottomNavTabs('search'), isFalse);
    });
  });

  group('automatic pins', () {
    test('default settings pin Search, Libraries and Favorites', () {
      expect(const BottomNavTabGates().resolvePins(''), [
        BottomNavTab.search,
        BottomNavTab.libraries,
        BottomNavTab.favorites,
      ]);
    });

    test('a turned off button is skipped for the next offered tab', () {
      const gates = BottomNavTabGates(showFavorites: false, showLiveTv: true);
      expect(gates.resolvePins(''), [
        BottomNavTab.search,
        BottomNavTab.libraries,
        BottomNavTab.liveTv,
      ]);
    });

    test('Kids Mode leaves out Libraries, Live TV and Seerr', () {
      const gates = BottomNavTabGates(
        kidsMode: true,
        showLiveTv: true,
        seerrAvailable: true,
      );
      expect(gates.resolvePins(''), [
        BottomNavTab.search,
        BottomNavTab.favorites,
        BottomNavTab.genres,
      ]);
    });

    test('Seerr only counts once the plugin reports it available', () {
      const without = BottomNavTabGates(showLibraries: false);
      const withSeerr = BottomNavTabGates(
        showLibraries: false,
        seerrAvailable: true,
      );
      expect(without.resolvePins(''), isNot(contains(BottomNavTab.discover)));
      expect(withSeerr.resolvePins(''), contains(BottomNavTab.discover));
    });
  });

  group('explicit pins', () {
    test('keep their order', () {
      expect(const BottomNavTabGates().resolvePins('favorites,search'), [
        BottomNavTab.favorites,
        BottomNavTab.search,
      ]);
    });

    test('drop a tab that is no longer offered without topping up', () {
      const gates = BottomNavTabGates(showGenres: false);
      expect(gates.resolvePins('genres,search'), [BottomNavTab.search]);
    });
  });

  group('upgrading from the old bottom navbar', () {
    const signedIn = {
      'pref_last_server_id': 'srv',
      'pref_last_user_id': 'usr',
      'pref_navbar_position_srv_usr': 'bottom',
      'pref_show_favorites_button_srv_usr': false,
    };

    test('lands on Dock with pins from the toggles and writes nothing',
        () async {
      final store = await _store(signedIn);
      final prefs = UserPreferences(store);

      expect(prefs.get(UserPreferences.navbarPosition), NavbarPosition.bottom);
      expect(prefs.get(UserPreferences.bottomNavbarStyle),
          BottomNavbarStyle.dock);

      final gates = BottomNavTabGates.fromPreferences(
        prefs,
        seerrAvailable: false,
      );
      expect(gates.resolvePins(prefs.get(UserPreferences.bottomNavbarTabs)), [
        BottomNavTab.search,
        BottomNavTab.libraries,
        BottomNavTab.genres,
      ]);

      // Other constructor steps seed their own keys, so only the navbar's
      // own keys are checked.
      expect(
        store.keys.where((k) => k.startsWith('pref_bottom_navbar')),
        isEmpty,
      );
      expect(prefs.containsPreference(UserPreferences.bottomNavbarStyle),
          isFalse);
      expect(prefs.containsPreference(UserPreferences.bottomNavbarTabs),
          isFalse);
    });

    test('both new preferences are stored per server and user', () async {
      final store = await _store(signedIn);
      final prefs = UserPreferences(store);

      await prefs.set(UserPreferences.bottomNavbarStyle,
          BottomNavbarStyle.strip);
      await prefs.set(UserPreferences.bottomNavbarTabs, 'search');

      expect(store.getString('pref_bottom_navbar_style_srv_usr'), 'strip');
      expect(store.getString('pref_bottom_navbar_tabs_srv_usr'), 'search');
    });
  });
}
