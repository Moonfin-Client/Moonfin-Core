// The Spotlight section modal must hold d-pad focus inside itself, close on
// the back key (marking DialogBackSuppressor so Android's follow-up popRoute
// is swallowed), and hand focus back to the summary card that opened it.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/spotlight/widgets/spotlight_modal_grids.dart';
import 'package:moonfin/ui/screens/detail/spotlight/widgets/spotlight_section_modal.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_status_dot.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ImageApi extends Mock implements ImageApi {}

void main() {
  tearDown(() {
    PlatformDetection.setTvMode(false);
    // Leave no suppressor count behind for other tests.
    while (DialogBackSuppressor.consume()) {}
  });

  Widget cell(String label, {FocusNode? focusNode}) => Focus(
    focusNode: focusNode,
    child: Builder(
      builder: (context) => Container(
        width: 40,
        height: 40,
        color: Focus.of(context).hasFocus ? Colors.white : Colors.grey,
        child: Center(child: Text(label)),
      ),
    ),
  );

  List<SpotlightModalSection> sections() => [
    SpotlightModalSection(
      title: 'Cast',
      count: 2,
      builder: (context, firstFocusNode) => Row(
        children: [
          cell('cast-0', focusNode: firstFocusNode),
          cell('cast-1'),
        ],
      ),
    ),
    SpotlightModalSection(
      title: 'Crew',
      builder: (context, firstFocusNode) => Row(children: [cell('crew-0')]),
    ),
    SpotlightModalSection(
      title: 'Studios',
      builder: (context, firstFocusNode) =>
          Row(children: [cell('studio-0')]),
    ),
  ];

  Future<FocusNode> pumpAndOpen(WidgetTester tester) async {
    final returnFocus = FocusNode(debugLabel: 'SummaryCard');
    addTearDown(returnFocus.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Focus(
              focusNode: returnFocus,
              child: ElevatedButton(
                autofocus: true,
                onPressed: () => SpotlightSectionModal.show(
                  context,
                  title: 'Cast, Crew, and Studios',
                  icon: Icons.people_outline,
                  sections: sections(),
                  returnFocus: returnFocus,
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    return returnFocus;
  }

  testWidgets('renders the header and every section title in order', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    await pumpAndOpen(tester);

    expect(find.text('Cast, Crew, and Studios'), findsOneWidget);
    expect(find.byIcon(Icons.people_outline), findsOneWidget);
    // The cast section's count pill.
    expect(find.text('2'), findsOneWidget);
    final castY = tester.getTopLeft(find.text('Cast')).dy;
    final crewY = tester.getTopLeft(find.text('Crew')).dy;
    final studiosY = tester.getTopLeft(find.text('Studios')).dy;
    expect(castY, lessThan(crewY));
    expect(crewY, lessThan(studiosY));
  });

  testWidgets('on TV the first cell takes focus and d-pad cannot escape', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    await pumpAndOpen(tester);

    bool focusIsInsideModal() {
      final focused = FocusManager.instance.primaryFocus;
      if (focused == null) return false;
      final labels = ['cast-0', 'cast-1', 'crew-0', 'studio-0'];
      return labels.any((label) {
        final finder = find.text(label);
        if (finder.evaluate().isEmpty) return false;
        return Focus.of(tester.element(finder)).hasFocus;
      });
    }

    expect(focusIsInsideModal(), isTrue);

    for (final key in [
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowRight,
      LogicalKeyboardKey.arrowRight,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowRight,
    ]) {
      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();
      expect(
        focusIsInsideModal(),
        isTrue,
        reason: 'focus escaped the modal after $key',
      );
    }
  });

  testWidgets('back closes the modal and restores the card focus', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    final returnFocus = await pumpAndOpen(tester);
    expect(find.text('Cast'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();

    expect(find.text('Cast'), findsNothing);
    expect(returnFocus.hasFocus, isTrue);
    // The key-driven close marks the suppressor exactly once, so Android's
    // follow-up popRoute can't pop the screen underneath.
    expect(DialogBackSuppressor.consume(), isTrue);
    expect(DialogBackSuppressor.consume(), isFalse);
  });

  testWidgets('sections that arrive while the modal is open are shown', (
    tester,
  ) async {
    // Seerr is fetched without being awaited so a slow server never holds up
    // library content, so its rows routinely land after a card is opened.
    PlatformDetection.setTvMode(false);
    final notifier = ChangeNotifier();
    addTearDown(notifier.dispose);
    var seerrArrived = false;

    List<SpotlightModalSection> current() => [
      SpotlightModalSection(
        title: 'Similar',
        count: 2,
        builder: (context, firstFocusNode) =>
            Row(children: [cell('similar-0', focusNode: firstFocusNode)]),
      ),
      if (seerrArrived)
        SpotlightModalSection(
          title: 'Recommendations',
          count: 3,
          builder: (context, firstFocusNode) =>
              Row(children: [cell('rec-0')]),
        ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => SpotlightSectionModal.show(
                context,
                title: 'Similar and Recommendations',
                sections: current(),
                refreshOn: notifier,
                refresh: () => (
                  title: seerrArrived
                      ? 'Similar and Seerr Recommendations'
                      : 'Similar and Recommendations',
                  icon: null,
                  sections: current(),
                ),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Similar'), findsOneWidget);
    expect(find.text('Recommendations'), findsNothing);

    seerrArrived = true;
    notifier.notifyListeners();
    await tester.pumpAndSettle();

    expect(find.text('Recommendations'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('Similar and Seerr Recommendations'), findsOneWidget);
  });

  testWidgets('touch: the close button dismisses without the suppressor', (
    tester,
  ) async {
    PlatformDetection.setTvMode(false);
    final returnFocus = await pumpAndOpen(tester);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    expect(find.text('Cast'), findsNothing);
    expect(returnFocus.hasFocus, isTrue);
    expect(DialogBackSuppressor.consume(), isFalse);
  });

  testWidgets('tapping a MediaCard in SpotlightMediaGridSection pops with action', (
    tester,
  ) async {
    PlatformDetection.setTvMode(false);
    VoidCallback? returnedAction;
    var actionExecuted = false;

    final item = AggregatedItem(
      id: 'item-1',
      serverId: 'server-1',
      rawData: {
        'Id': 'item-1',
        'Name': 'Critters',
        'Type': 'Movie',
      },
    );

    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    final imageApi = _ImageApi();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                final action = await SpotlightSectionModal.show<VoidCallback>(
                  context,
                  title: 'Movies & Shows',
                  sections: [
                    SpotlightModalSection(
                      title: 'Critters Collection',
                      builder: (modalContext, firstFocusNode) => SpotlightMediaGridSection(
                        items: [item],
                        imageApi: imageApi,
                        prefs: prefs,
                        firstFocusNode: firstFocusNode,
                        onItemTap: (tappedItem) {
                          Navigator.of(context, rootNavigator: true).pop(() {
                            actionExecuted = true;
                          });
                        },
                      ),
                    ),
                  ],
                );
                returnedAction = action;
                action?.call();
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );


    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Movies & Shows'), findsOneWidget);
    expect(find.text('Critters'), findsOneWidget);

    await tester.tap(find.text('Critters'));
    await tester.pumpAndSettle();

    expect(find.text('Movies & Shows'), findsNothing);
    expect(returnedAction, isNotNull);
    expect(actionExecuted, isTrue);
  });

  testWidgets(
    'SpotlightMediaGridSection displays SeerrStatusDot on season cards when showSeerrAvailabilityBadges is true',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.showSeerrAvailabilityBadges, true);

      final season = AggregatedItem(
        id: 's1',
        serverId: 'server-1',
        rawData: const {
          'Id': 's1',
          'Type': 'Season',
          'Name': 'Season 1',
          'IndexNumber': 1,
        },
      );
      final imageApi = _ImageApi();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SpotlightMediaGridSection(
              items: [season],
              imageApi: imageApi,
              prefs: prefs,
              seerrSeasonStatus: const {1: SeerrMediaStatus.available},
              onItemTap: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(SeerrStatusDot), findsOneWidget);
    },
  );

  testWidgets(
    'SpotlightMediaGridSection hides SeerrStatusDot on season cards when showSeerrAvailabilityBadges is false',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.showSeerrAvailabilityBadges, false);

      final season = AggregatedItem(
        id: 's1',
        serverId: 'server-1',
        rawData: const {
          'Id': 's1',
          'Type': 'Season',
          'Name': 'Season 1',
          'IndexNumber': 1,
        },
      );
      final imageApi = _ImageApi();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SpotlightMediaGridSection(
              items: [season],
              imageApi: imageApi,
              prefs: prefs,
              seerrSeasonStatus: const {1: SeerrMediaStatus.available},
              onItemTap: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(SeerrStatusDot), findsNothing);
    },
  );
}


