import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/modern/widgets/details_tab_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<FocusNode> focusNodes;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    focusNodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode()];
  });

  tearDown(() async {
    for (final node in focusNodes) {
      node.dispose();
    }
    await GetIt.instance.reset();
  });

  testWidgets('pill tab bar width hugs segment contents with symmetric 3px padding', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 800,
              child: DetailsTabBar(
                pill: true,
                labels: const ['Cast', 'Seerr'],
                selectedIndex: 1,
                onSelect: (_) {},
                focusNodeFor: (i) => focusNodes[i],
              ),
            ),
          ),
        ),
      ),
    );

    // Allow post-frame callback and setState to rebuild
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pumpAndSettle();

    // Find the SizedBox with width finite and width != 800 (the inner pill width constraint)
    final pillBoxFinder = find.byWidgetPredicate(
      (w) => w is SizedBox && w.width != null && w.width! < 800 && w.height == null,
    );
    expect(pillBoxFinder, findsOneWidget);
    final pillBox = tester.widget<SizedBox>(pillBoxFinder);

    final rowFinder = find.byType(Row);
    final rowBox = tester.renderObject(rowFinder.first) as RenderBox;
    final expectedWidth = rowBox.size.width + 6.0;

    // The outer pill width must equal sum of segment widths plus 6.0 (3px start + 3px end padding),
    // eliminating any asymmetrical overhang on the trailing end.
    expect(pillBox.width, closeTo(expectedWidth, 0.01));
  });

  testWidgets('pill caps at available width when tabs overflow constraints', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              child: DetailsTabBar(
                pill: true,
                labels: const ['Cast', 'Crew', 'Studios', 'Chapters', 'Details', 'Seerr'],
                selectedIndex: 5,
                onSelect: (_) {},
                focusNodeFor: (i) => focusNodes[i],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pumpAndSettle();

    final pillBoxFinder = find.descendant(
      of: find.byType(DetailsTabBar),
      matching: find.byWidgetPredicate(
        (w) => w is SizedBox && w.width == 200 && w.height == null,
      ),
    );
    expect(pillBoxFinder, findsOneWidget);
  });
}
