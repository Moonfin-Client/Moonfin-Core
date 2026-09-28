import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/route_lifecycle_observer.dart';
import 'package:moonfin/ui/widgets/bottom_nav/split_bar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';

import 'bottom_nav_fakes.dart';

Widget _page({ScrollController? controller, bool withRow = false}) =>
    ListView(
      controller: controller,
      children: [
        if (withRow)
          SizedBox(
            key: const Key('row'),
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < 30; i++)
                  SizedBox(width: 100, child: Text('card $i')),
              ],
            ),
          ),
        for (var i = 0; i < 80; i++)
          SizedBox(height: 60, child: Text('row $i')),
      ],
    );

bool _minimized(WidgetTester tester) =>
    tester.widget<SplitBarView>(find.byType(SplitBarView)).minimized;

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = (await setUpBottomNav(style: BottomNavbarStyle.split)).prefs;
  });

  tearDown(tearDownBottomNav);

  testWidgets('scrolling down shrinks the bar and scrolling up restores it',
      (tester) async {
    usePhoneView(tester);
    await tester.pumpWidget(bottomNavApp(child: _page()));
    await tester.pump();
    expect(_minimized(tester), isFalse);

    await tester.drag(find.text('row 5'), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(_minimized(tester), isTrue);

    await tester.drag(find.text('row 8'), const Offset(0, 100));
    await tester.pumpAndSettle();
    expect(_minimized(tester), isFalse);
  });

  testWidgets('reaching the top restores the bar', (tester) async {
    usePhoneView(tester);
    final controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(bottomNavApp(child: _page(controller: controller)));
    await tester.pump();

    await tester.drag(find.text('row 5'), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(_minimized(tester), isTrue);

    controller.jumpTo(0);
    await tester.pumpAndSettle();
    expect(_minimized(tester), isFalse);
  });

  testWidgets('a row of cards scrolling sideways leaves the bar alone',
      (tester) async {
    usePhoneView(tester);
    await tester.pumpWidget(bottomNavApp(child: _page(withRow: true)));
    await tester.pump();

    await tester.drag(find.text('card 1'), const Offset(-400, 0));
    await tester.pumpAndSettle();
    expect(_minimized(tester), isFalse);
  });

  testWidgets('a scroll nobody dragged doesn\'t shrink the bar',
      (tester) async {
    usePhoneView(tester);
    final controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(bottomNavApp(child: _page(controller: controller)));
    await tester.pump();

    controller.jumpTo(1200);
    await tester.pumpAndSettle();
    expect(_minimized(tester), isFalse);
  });

  testWidgets('Dock never reacts to scrolling', (tester) async {
    usePhoneView(tester);
    await prefs.set(UserPreferences.bottomNavbarStyle, BottomNavbarStyle.dock);
    await tester.pumpWidget(bottomNavApp(child: _page()));
    await tester.pump();

    await tester.drag(find.text('row 5'), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(find.byType(SplitBarView), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('coming back to a page brings the bar back whole',
      (tester) async {
    usePhoneView(tester);
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [routeLifecycleObserver],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NavigationLayout(activeRoute: '/home', child: _page()),
        ),
      ),
    );
    await tester.pump();

    await tester.drag(find.text('row 5'), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(_minimized(tester), isTrue);

    navigatorKey.currentState!.push(
      MaterialPageRoute<void>(builder: (_) => const Scaffold()),
    );
    await tester.pumpAndSettle();
    navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();
    expect(_minimized(tester), isFalse);
  });
}
