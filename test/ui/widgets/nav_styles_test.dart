import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/widgets/nav_styles/atlas_panel.dart';
import 'package:moonfin/ui/widgets/nav_styles/nav_entry.dart';
import 'package:moonfin/ui/widgets/nav_styles/reel_nav.dart';

void main() {
  group('reelSlots', () {
    test('shows three entries each side and wraps around the list', () {
      final slots = reelSlots(0, 13);
      expect(slots.map((s) => s.distance), [-3, -2, -1, 0, 1, 2, 3]);
      expect(slots.map((s) => s.entry), [10, 11, 12, 0, 1, 2, 3]);
      final window = slots.firstWhere((s) => s.distance == 0);
      expect(window.scale, 1);
      expect(window.opacity, 1);
      expect(window.dy, 0);
      expect(slots.first.dy, lessThan(0));
      expect(slots.last.dy, greaterThan(0));
    });

    test('keys entries by their place on the endless wheel', () {
      final before = reelSlots(5, 13);
      final after = reelSlots(6, 13);
      final movedUp = after.firstWhere((s) => s.absolute == 6);
      expect(before.firstWhere((s) => s.absolute == 6).distance, 1);
      expect(movedUp.distance, 0);
      expect(reelSlots(-1, 13).firstWhere((s) => s.distance == 0).entry, 12);
    });

    test('a short list never shows an entry twice', () {
      for (var count = 1; count <= 7; count++) {
        final entries = reelSlots(4, count).map((s) => s.entry).toList();
        expect(entries.toSet().length, entries.length, reason: '$count');
      }
      expect(reelSlots(0, 0), isEmpty);
    });

    test('phones show four entries each side', () {
      expect(reelSlots(0, 13, phone: true).length, 9);
    });
  });

  test('currentNavEntryIndex picks the page on screen, then Home', () {
    NavEntry entry(String id, {bool current = false, bool home = false}) =>
        NavEntry(
          id: id,
          label: id,
          onSelect: () {},
          current: current,
          kind: home ? NavEntryKind.home : NavEntryKind.other,
        );
    expect(currentNavEntryIndex([]), 0);
    expect(currentNavEntryIndex([entry('a'), entry('b')]), 0);
    expect(currentNavEntryIndex([entry('a'), entry('h', home: true)]), 1);
    expect(
      currentNavEntryIndex([
        entry('h', home: true),
        entry('a'),
        entry('b', current: true),
      ]),
      2,
    );
  });

  group('atlasLibraryLinks', () {
    final l10n = AppLocalizationsEn();
    AggregatedLibrary lib(String type, {String name = 'Lib'}) =>
        AggregatedLibrary(
          id: 'abc',
          name: name,
          collectionType: type,
          serverId: 's1',
        );

    test('movies link to their genres and favorites', () {
      final links = atlasLibraryLinks(l10n, lib('movies'));
      expect(links.map((l) => l.label), [
        l10n.browseAll,
        l10n.genres,
        l10n.favorites,
      ]);
      expect(links.first.route, Destinations.library('abc', serverId: 's1'));
      expect(links[1].route, Destinations.libraryGenresOf('abc'));
    });

    test('music links to its category screens', () {
      final links = atlasLibraryLinks(l10n, lib('music'));
      expect(links.first.route, Destinations.musicLibrary('abc'));
      expect(links.skip(1).map((l) => l.route), [
        for (final c in ['albums', 'artists', 'playlists', 'genres', 'songs'])
          Destinations.musicCategory('abc', c),
      ]);
    });

    test('books only offer their main page', () {
      expect(atlasLibraryLinks(l10n, lib('books')).length, 1);
    });
  });
}
