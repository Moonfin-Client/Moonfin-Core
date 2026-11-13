import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/library_header_styles.dart';
import 'package:moonfin/ui/widgets/focus/focusable_toolbar_button.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_library_grid.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

import '../../unified_ui_fakes.dart';

/// One server's own library, which answers whatever the grid asks with one
/// movie.
class _PlainItemsApi implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      return Future<Map<String, dynamic>>.value({
        'Items': [
          {'Id': 'p1', 'Name': 'Plain', 'Type': 'Movie'},
        ],
        'TotalRecordCount': 1,
      });
    }
    if (invocation.memberName == #getItem) {
      return Future<Map<String, dynamic>>.value({
        'Id': 'lib',
        'Name': 'Movies',
        'CollectionType': 'movies',
      });
    }
    return super.noSuchMethod(invocation);
  }
}

const _syncing = 'Syncing servers...';
const _changed = 'Library changed';
const _phone = Size(400, 800);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UnifiedBrowseHarness harness;
  late UnifiedCatalogService catalog;
  late FakeCatalogServer a;
  late FakeCatalogServer b;

  setUp(() async {
    a = FakeCatalogServer('a')..stubApis();
    b = FakeCatalogServer('b')..stubApis();
    for (final server in [a, b]) {
      when(() => server.client.baseUrl).thenReturn('http://${server.id}');
      when(() => server.client.userId).thenReturn('user');
      when(() => server.client.serverType).thenReturn(ServerType.jellyfin);
    }
    final plain = MockMediaServerClient();
    when(() => plain.itemsApi).thenReturn(_PlainItemsApi());
    when(() => plain.imageApi).thenReturn(MockImageApi());
    when(() => plain.baseUrl).thenReturn('http://plain');
    when(() => plain.userId).thenReturn('user');
    when(() => plain.serverType).thenReturn(ServerType.jellyfin);

    harness = await UnifiedBrowseHarness.setUp(
      sessions: () async => [a.session, b.session],
      clientFor: (id) => switch (id) {
        'a' => a.client,
        'b' => b.client,
        _ => null,
      },
      activeClient: plain,
    );
    catalog = harness.catalog;
    // Without this the layout is automatic, and the test host is laid out
    // as a phone.
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() => harness.tearDown());

  Future<void> readServers(WidgetTester tester) async {
    a.movies = [catalogMovie('a1', 'Altovar'), catalogMovie('a2', 'Hodrimel')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    await tester.runAsync(catalog.forceFullRead);
  }

  bool shows(Finder finder) => finder.evaluate().isNotEmpty;

  /// Stops [server] holding requests and keeps answering the ones it holds,
  /// frame after frame, until [until] is true.
  Future<void> letThroughUntil(
    WidgetTester tester,
    FakeCatalogServer server, {
    required bool Function() until,
  }) async {
    await pumpUntil(tester, () {
      server.letThrough();
      return until();
    }, reason: 'server ${server.id} was let through');
  }

  Finder semanticsLabel(String label) => find.byWidgetPredicate(
    (widget) => widget is Semantics && widget.properties.label == label,
  );

  final refreshButton = find.byTooltip('Refresh');
  final syncStatus = find.byKey(LibrarySyncProgress.statusKey);
  final strip = find.byType(LibraryCatalogStrip);
  final unreachable = find.byKey(const ValueKey('catalog-unreachable'));

  /// The header's Back button, which holds the focus as the screen opens.
  Finder backButton() => find.byWidgetPredicate(
    (widget) =>
        widget is FocusableToolbarButton &&
        widget.focusNode?.debugLabel == 'library_home_button',
  );

  bool refreshEnabled(WidgetTester tester) => tester
      .widget<FocusableToolbarButton>(
        find.ancestor(
          of: refreshButton,
          matching: find.byType(FocusableToolbarButton),
        ),
      )
      .enabled;

  bool inBackButtonRow(WidgetTester tester, Finder finder) {
    final back = tester.getRect(backButton());
    final other = tester.getRect(finder);
    return other.top < back.bottom && other.bottom > back.top;
  }

  testWidgets('a library still being read shows placeholder cards, not the '
      'empty message', (tester) async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    a.holdRequests = true;
    b.holdRequests = true;

    await harness.pumpLibrary(
      tester,
      until: () => shows(find.text('$_syncing 0/2')),
    );

    expect(find.byType(SkeletonLibraryGrid), findsOneWidget);
    expect(find.text('No items found'), findsNothing);
    // The progress is shown once, in words under the header, and not beside
    // the Refresh button.
    expect(syncStatus, findsOneWidget);
    expect(find.descendant(of: strip, matching: syncStatus), findsOneWidget);
    expect(semanticsLabel('0 of 2 servers up to date'), findsOneWidget);
    expect(refreshEnabled(tester), isFalse);

    await letThroughUntil(tester, a, until: () => shows(find.text('1/2')));
    expect(cardTitles(tester), ['Altovar']);
    expect(find.byType(SkeletonLibraryGrid), findsNothing);
    // Once there are cards to look at, the progress shrinks to its numbers
    // beside the Refresh button.
    expect(find.textContaining(_syncing), findsNothing);
    expect(strip, findsNothing);
    expect(semanticsLabel('1 of 2 servers up to date'), findsOneWidget);
    expect(inBackButtonRow(tester, syncStatus), isTrue);

    await letThroughUntil(tester, b, until: () => !shows(syncStatus));
    expect(cardTitles(tester), ['Altovar', 'Rusquin']);
    expect(refreshEnabled(tester), isTrue);
    expect(strip, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('an empty library shows the empty message once the read is '
      'over', (tester) async {
    await harness.pumpLibrary(tester);

    expect(find.text('No items found'), findsOneWidget);
    expect(find.byType(SkeletonLibraryGrid), findsNothing);
    expect(syncStatus, findsNothing);
    expect(strip, findsNothing);
    expect(refreshButton, findsOneWidget);
  });

  testWidgets('a search with no match keeps the empty message while a read '
      'runs', (tester) async {
    await readServers(tester);
    await harness.pumpLibrary(tester);

    await tester.enterText(find.byType(TextField), 'zzzz');
    await pumpUntil(tester, () => shows(find.text('No items found')));

    a.holdRequests = true;
    await tester.tap(refreshButton);
    await pumpUntil(
      tester,
      () => a.heldRequests.isNotEmpty && shows(syncStatus),
    );

    expect(find.text('No items found'), findsOneWidget);
    expect(find.byType(SkeletonLibraryGrid), findsNothing);
    expect(find.textContaining(_syncing), findsNothing);

    await letThroughUntil(tester, a, until: () => !shows(syncStatus));
    expect(tester.takeException(), isNull);
  });

  for (final style in LibraryStyle.values) {
    testWidgets('the ${style.name} header has Refresh in its Back button row, '
        'and Refresh reads every server in full', (tester) async {
      await harness.prefs.set(UserPreferences.libraryStyle, style);
      await readServers(tester);
      await harness.pumpLibrary(tester);
      expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
      expect(refreshButton, findsOneWidget);
      expect(inBackButtonRow(tester, refreshButton), isTrue);
      expect(refreshEnabled(tester), isTrue);
      expect(syncStatus, findsNothing);
      expect(strip, findsNothing);

      // Both servers were read in full a moment ago, so only a forced full
      // read asks them again.
      final requestsBeforeA = a.fullPageStartIndexes.length;
      final requestsBeforeB = b.fullPageStartIndexes.length;
      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
      a.holdRequests = true;
      await tester.tap(refreshButton);
      await pumpUntil(
        tester,
        () => a.heldRequests.isNotEmpty && shows(find.text('1/2')),
      );

      expect(b.fullPageStartIndexes, hasLength(requestsBeforeB + 1));
      expect(a.fullPageStartIndexes, hasLength(requestsBeforeA + 1));
      // The docked header has no room beside the button, so it shows the
      // progress under the header.
      expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
      expect(syncStatus, findsOneWidget);
      expect(semanticsLabel('1 of 2 servers up to date'), findsOneWidget);
      expect(
        find.descendant(of: strip, matching: syncStatus),
        style == LibraryStyle.docked ? findsOneWidget : findsNothing,
      );
      if (style != LibraryStyle.docked) {
        expect(inBackButtonRow(tester, syncStatus), isTrue);
      }

      expect(refreshEnabled(tester), isFalse);
      await tester.tap(refreshButton);
      await pumpTurns(tester);
      expect(a.fullPageStartIndexes, hasLength(requestsBeforeA + 1));

      await letThroughUntil(tester, a, until: () => !shows(syncStatus));
      expect(cardTitles(tester), [
        'Altovar',
        'Brindlow',
        'Hodrimel',
        'Rusquin',
      ]);
      expect(refreshEnabled(tester), isTrue);
      expect(find.text(_changed), findsNothing);
      expect(strip, findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  for (final style in LibraryStyle.values) {
    testWidgets('on a phone the ${style.name} header has Refresh too', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
      await harness.prefs.set(UserPreferences.libraryStyle, style);
      await readServers(tester);
      await harness.pumpLibrary(tester, size: _phone);

      expect(refreshButton, findsOneWidget);
      expect(inBackButtonRow(tester, refreshButton), isTrue);

      a.holdRequests = true;
      final requestsBefore = a.fullPageStartIndexes.length;
      await tester.tap(refreshButton);
      await pumpUntil(
        tester,
        () => a.heldRequests.isNotEmpty && shows(find.text('1/2')),
      );
      expect(a.fullPageStartIndexes, hasLength(requestsBefore + 1));
      expect(inBackButtonRow(tester, syncStatus), isTrue);

      await letThroughUntil(tester, a, until: () => !shows(syncStatus));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('a server that could not be read is counted as unreachable', (
    tester,
  ) async {
    b.down = true;
    await readServers(tester);

    await harness.pumpLibrary(tester);

    expect(cardTitles(tester), ['Altovar', 'Hodrimel']);
    expect(syncStatus, findsNothing);
    expect(find.text('1 server unreachable'), findsOneWidget);
    expect(find.descendant(of: strip, matching: unreachable), findsOneWidget);
  });

  testWidgets('a server still being read is not counted as unreachable', (
    tester,
  ) async {
    a.movies = [catalogMovie('a1', 'Altovar')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    b.holdRequests = true;

    await harness.pumpLibrary(tester, until: () => shows(find.text('1/2')));

    expect(cardTitles(tester), ['Altovar']);
    expect(unreachable, findsNothing);

    await letThroughUntil(tester, b, until: () => !shows(syncStatus));
    expect(unreachable, findsNothing);
    expect(strip, findsNothing);
  });

  testWidgets('changed titles are held back until the update button is '
      'pressed', (tester) async {
    await readServers(tester);
    await harness.pumpLibrary(tester);
    expect(find.text(_changed), findsNothing);
    final focusBefore = FocusManager.instance.primaryFocus;
    expect(focusBefore, isNotNull);

    a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
    await tester.runAsync(catalog.forceFullRead);
    await pumpUntil(tester, () => shows(find.text(_changed)));

    expect(
      find.descendant(of: strip, matching: find.text('Update')),
      findsOneWidget,
    );
    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
    // The update button appearing did not move the focus.
    expect(FocusManager.instance.primaryFocus, same(focusBefore));

    await tester.tap(find.text(_changed));
    await pumpUntil(tester, () => !shows(find.text(_changed)));

    expect(cardTitles(tester), ['Altovar', 'Brindlow', 'Hodrimel', 'Rusquin']);
    expect(strip, findsNothing);
    expect(tester.takeException(), isNull);
  });

  group('with a remote', () {
    String? focused() => FocusManager.instance.primaryFocus?.debugLabel;

    String? focusedCard(WidgetTester tester) {
      final focus = FocusManager.instance.primaryFocus;
      for (final card in tester.widgetList<MediaCard>(find.byType(MediaCard))) {
        if (card.focusNode != null && identical(card.focusNode, focus)) {
          return card.title;
        }
      }
      return null;
    }

    Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pump(const Duration(milliseconds: 200));
    }

    Future<void> pressUntil(
      WidgetTester tester,
      LogicalKeyboardKey key,
      String label, {
      int max = 8,
    }) async {
      for (var i = 0; i < max && focused() != label; i++) {
        await press(tester, key);
      }
      expect(focused(), label);
    }

    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.tv));

    testWidgets('Refresh is reached with Left and Right along the header', (
      tester,
    ) async {
      await readServers(tester);
      await harness.pumpLibrary(tester);
      expect(focused(), 'library_home_button');

      await pressUntil(
        tester,
        LogicalKeyboardKey.arrowRight,
        'library_catalog_refresh',
      );
      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), isNot('library_catalog_refresh'));
      await pressUntil(
        tester,
        LogicalKeyboardKey.arrowLeft,
        'library_home_button',
      );

      // With no update waiting, Down goes straight from the header to the
      // grid.
      await pressUntil(
        tester,
        LogicalKeyboardKey.arrowRight,
        'library_catalog_refresh',
      );
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedCard(tester), isNotNull);
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'library_home_button');
      expect(tester.takeException(), isNull);
    });

    for (final style in [LibraryStyle.modern, LibraryStyle.docked]) {
      testWidgets('the ${style.name} header reaches Refresh along its row', (
        tester,
      ) async {
        await harness.prefs.set(UserPreferences.libraryStyle, style);
        await readServers(tester);
        await harness.pumpLibrary(tester);
        expect(focused(), 'library_home_button');

        await pressUntil(
          tester,
          LogicalKeyboardKey.arrowRight,
          'library_catalog_refresh',
        );
        await pressUntil(
          tester,
          LogicalKeyboardKey.arrowLeft,
          'library_home_button',
        );
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('pressing Refresh keeps the focus on it while it reads', (
      tester,
    ) async {
      await readServers(tester);
      await harness.pumpLibrary(tester);
      await pressUntil(
        tester,
        LogicalKeyboardKey.arrowRight,
        'library_catalog_refresh',
      );

      a.holdRequests = true;
      final requestsBefore = a.fullPageStartIndexes.length;
      await press(tester, LogicalKeyboardKey.select);
      await pumpUntil(
        tester,
        () => a.heldRequests.isNotEmpty && shows(syncStatus),
      );

      expect(a.fullPageStartIndexes, hasLength(requestsBefore + 1));
      expect(refreshEnabled(tester), isFalse);
      expect(focused(), 'library_catalog_refresh');
      // A second press does nothing: it starts no read and moves no focus.
      await press(tester, LogicalKeyboardKey.select);
      await pumpTurns(tester);
      expect(a.fullPageStartIndexes, hasLength(requestsBefore + 1));
      expect(focused(), 'library_catalog_refresh');

      await letThroughUntil(tester, a, until: () => !shows(syncStatus));
      expect(focused(), 'library_catalog_refresh');
      expect(tester.takeException(), isNull);
    });

    testWidgets('the update button sits between the grid and the header', (
      tester,
    ) async {
      await readServers(tester);
      await harness.pumpLibrary(tester);
      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
      await tester.runAsync(catalog.forceFullRead);
      await pumpUntil(tester, () => shows(find.text(_changed)));

      expect(focused(), 'library_home_button');

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'library_catalog_update');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedCard(tester), 'Altovar');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'library_catalog_update');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'library_home_button');

      // Pressing the update button removes it, so the focus must land on a
      // control that is still on screen.
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'library_catalog_update');
      await press(tester, LogicalKeyboardKey.select);
      await pumpUntil(tester, () => !shows(find.text(_changed)));
      await pumpUntil(tester, () => cardTitles(tester).contains('Brindlow'));

      expect(cardTitles(tester), [
        'Altovar',
        'Brindlow',
        'Hodrimel',
        'Rusquin',
      ]);
      final holder = FocusManager.instance.primaryFocus;
      expect(holder?.context, isNotNull);
      expect(
        focused() == 'library_catalog_refresh' || focusedCard(tester) != null,
        isTrue,
        reason: 'focus went to ${holder?.debugLabel}',
      );

      if (focusedCard(tester) == null) {
        await press(tester, LogicalKeyboardKey.arrowDown);
      }
      expect(focusedCard(tester), isNotNull);
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'library_home_button');
      expect(tester.takeException(), isNull);
    });
  });

  group('on a phone', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.phone));

    Future<void> pullDown(WidgetTester tester, Finder finder) async {
      await tester.drag(finder, const Offset(0, 300));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
    }

    testWidgets('pulling a long grid down reads the servers again', (
      tester,
    ) async {
      a.movies = [
        for (var i = 0; i < 60; i++)
          catalogMovie('a$i', 'Movie ${i.toString().padLeft(2, '0')}'),
      ];
      await tester.runAsync(catalog.forceFullRead);
      await harness.pumpLibrary(tester, size: _phone);
      expect(find.byType(RefreshIndicator), findsOneWidget);
      final requestsBefore = a.fullPageStartIndexes.length;

      await pullDown(tester, find.byType(MediaCard).first);
      await pumpUntil(
        tester,
        () =>
            a.fullPageStartIndexes.length > requestsBefore &&
            !shows(syncStatus),
      );

      expect(tester.takeException(), isNull);
    });

    testWidgets('pulling down a grid too short to scroll reads the servers '
        'again', (tester) async {
      await readServers(tester);
      await harness.pumpLibrary(tester, size: _phone);
      expect(cardTitles(tester), hasLength(3));
      final requestsBefore = a.fullPageStartIndexes.length;

      await pullDown(tester, find.byType(MediaCard).first);
      await pumpUntil(
        tester,
        () =>
            a.fullPageStartIndexes.length > requestsBefore &&
            !shows(syncStatus),
      );

      expect(tester.takeException(), isNull);
    });

    testWidgets('pulling down an empty library reads the servers again', (
      tester,
    ) async {
      await harness.pumpLibrary(tester, size: _phone);
      expect(find.text('No items found'), findsOneWidget);
      expect(find.byType(RefreshIndicator), findsOneWidget);
      final requestsBefore = a.viewsRequests;

      a.movies = [catalogMovie('a1', 'Altovar')];
      await pullDown(tester, find.text('No items found'));
      await pumpUntil(tester, () => cardTitles(tester).contains('Altovar'));

      expect(a.viewsRequests, greaterThan(requestsBefore));
      expect(tester.takeException(), isNull);
    });

    testWidgets('one server\'s own library has no Refresh, no sync status and '
        'no pull to refresh', (tester) async {
      await readServers(tester);
      a.movies = [...a.movies, catalogMovie('a3', 'Brindlow')];
      await tester.runAsync(catalog.forceFullRead);

      await harness.pumpLibrary(tester, unified: false, size: _phone);

      expect(cardTitles(tester), ['Plain']);
      expect(refreshButton, findsNothing);
      expect(syncStatus, findsNothing);
      expect(strip, findsNothing);
      expect(find.byType(RefreshIndicator), findsNothing);
      // One server's own grid keeps its default scroll physics.
      expect(
        tester.widget<CustomScrollView>(find.byType(CustomScrollView)).physics,
        isNull,
      );
    });
  });
}
