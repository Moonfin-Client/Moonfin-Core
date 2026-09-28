import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/bottom_nav_tabs.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_nav_model.dart';

void main() {
  test(
    'old plugin hides Books; supported plugin offers route in pins or hub',
    () {
      const old = BottomNavTabGates();
      const updated = BottomNavTabGates(booksSupported: true);
      expect(old.offers(BottomNavTab.books), isFalse);
      expect(old.resolvePins(''), isNot(contains(BottomNavTab.books)));
      expect(updated.resolvePins(''), [
        BottomNavTab.search,
        BottomNavTab.libraries,
        BottomNavTab.books,
      ]);
      expect(updated.resolvePins('favorites,search'), [
        BottomNavTab.favorites,
        BottomNavTab.search,
      ]);
      final hub = resolveHubTiles(
        gates: updated,
        barItems: resolveBarItems(updated, 'favorites,search'),
        isAvailable: (_) => true,
        savedAvailable: false,
        shuffle: false,
        syncPlay: false,
      );
      expect(hub, contains(const BottomNavHubTile.tab(BottomNavTab.books)));
      expect(
        bottomNavTabMatchesRoute(
          BottomNavTab.books,
          Destinations.booksRequests,
        ),
        isTrue,
      );
      expect(
        bottomNavTabMatchesRoute(
          BottomNavTab.libraries,
          Destinations.booksRequests,
        ),
        isFalse,
      );
      expect(
        bottomNavTabMatchesRoute(BottomNavTab.libraries, '/books/library-id'),
        isTrue,
      );
    },
  );
}
