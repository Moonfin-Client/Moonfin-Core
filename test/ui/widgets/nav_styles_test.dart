import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/widgets/nav_styles/atlas_panel.dart';
import 'package:moonfin/ui/widgets/nav_styles/nav_art.dart';
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

  test('library covers size to the screen\'s real density', () {
    // A Mosaic tile on a 2.75x phone, past the 2x cap other artwork stops at.
    final phone = navLibraryCoverSize(const Size(154, 81), 2.75);
    expect(phone.decode, 440);
    expect(phone.request, 480);

    // A box taller than 16:9 is covered by the height, so the width follows it.
    final tall = navLibraryCoverSize(const Size(100, 100), 2);
    expect(tall.decode, 360);
    expect(tall.request, 480);
  });

  group('AtlasPanel', () {
    Future<void> open(WidgetTester tester, AtlasPanelSpec spec) async {
      final scope = FocusScopeNode();
      final first = FocusNode();
      addTearDown(scope.dispose);
      addTearDown(first.dispose);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: AtlasPanel(
              spec: spec,
              scopeNode: scope,
              firstFocus: first,
              onExit: () {},
              onOpen: (_, {required topLevel}) {},
            ),
          ),
        ),
      );
      await tester.pump();
    }

    Future<void> close(WidgetTester tester) =>
        tester.pumpWidget(const SizedBox());

    AtlasPanelSpec spec(String key, Future<AtlasPanelData> Function() load) =>
        AtlasPanelSpec(
          key: key,
          title: 'Movies',
          links: const [AtlasLink('Browse All', '/library')],
          cardsTitle: 'Continue',
          load: load,
        );

    const data = AtlasPanelData(
      cards: [AtlasTile(title: 'Loaded Card', route: '/item')],
    );

    testWidgets('a failed load tries again on the next open', (tester) async {
      var calls = 0;
      final failing = spec('test:retry', () async {
        calls++;
        if (calls == 1) throw Exception('offline');
        return data;
      });
      await open(tester, failing);
      expect(find.text('Loaded Card'), findsNothing);
      await close(tester);
      await open(tester, failing);
      expect(calls, 2);
      expect(find.text('Loaded Card'), findsOneWidget);
    });

    testWidgets('a load that worked is kept for the next open', (tester) async {
      var calls = 0;
      final working = spec('test:kept', () async {
        calls++;
        return data;
      });
      await open(tester, working);
      await close(tester);
      await open(tester, working);
      expect(calls, 1);
      expect(find.text('Loaded Card'), findsOneWidget);
    });
  });
}
