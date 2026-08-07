import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/navigation/route_lifecycle_observer.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin/ui/widgets/quick_return_wrapper.dart';
import 'package:moonfin/util/platform_detection.dart';

/// Long enough that there is always somewhere left to scroll.
Widget _scrollingBody(ScrollController controller, {Axis axis = Axis.vertical}) {
  return ListView.builder(
    controller: controller,
    scrollDirection: axis,
    itemCount: 200,
    itemBuilder: (_, i) => axis == Axis.vertical
        ? SizedBox(height: 100, child: Text('item $i'))
        : SizedBox(width: 100, child: Text('item $i')),
  );
}

Widget _app(Widget home, {GlobalKey<NavigatorState>? navigatorKey}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    navigatorKey: navigatorKey,
    navigatorObservers: [routeLifecycleObserver],
    home: home,
  );
}

Future<ScrollController> _pumpWrapper(
  WidgetTester tester, {
  Axis axis = Axis.vertical,
  GlobalKey<NavigatorState>? navigatorKey,
}) async {
  final controller = ScrollController();
  addTearDown(controller.dispose);
  await tester.pumpWidget(
    _app(
      QuickReturnWrapper(
        scrollController: controller,
        scrollDirection: axis,
        child: _scrollingBody(controller, axis: axis),
      ),
      navigatorKey: navigatorKey,
    ),
  );
  await tester.pump();
  return controller;
}

void main() {
  tearDown(() => PlatformDetection.setTvMode(false));

  group('on TV', () {
    setUp(() => PlatformDetection.setTvMode(true));

    testWidgets('takes the back key only once the screen has scrolled', (
      tester,
    ) async {
      final controller = await _pumpWrapper(tester);

      expect(
        InlineBackInterceptor.handleBack(),
        isFalse,
        reason: 'at the top, back belongs to the router',
      );

      controller.jumpTo(500);
      await tester.pump();

      expect(InlineBackInterceptor.handleBack(), isTrue);
      await tester.pumpAndSettle();
      expect(controller.offset, 0);
    });

    testWidgets('gives the back key up while another route covers it', (
      tester,
    ) async {
      final navigator = GlobalKey<NavigatorState>();
      final controller = await _pumpWrapper(tester, navigatorKey: navigator);

      controller.jumpTo(500);
      await tester.pump();
      expect(InlineBackInterceptor.handleBack(), isTrue);
      await tester.pumpAndSettle();

      controller.jumpTo(500);
      await tester.pump();

      // Whatever is pushed over the screen owns back from then on. Without
      // that the covered screen keeps swallowing it and the new route never
      // pops.
      navigator.currentState!.push(
        MaterialPageRoute<void>(builder: (_) => const Text('pushed')),
      );
      await tester.pumpAndSettle();

      expect(InlineBackInterceptor.handleBack(), isFalse);

      navigator.currentState!.pop();
      await tester.pumpAndSettle();

      expect(
        InlineBackInterceptor.handleBack(),
        isTrue,
        reason: 'still scrolled, so it takes back again once uncovered',
      );
      await tester.pumpAndSettle();
    });

    testWidgets('leaves nothing registered after disposal', (tester) async {
      final controller = await _pumpWrapper(tester);
      controller.jumpTo(500);
      await tester.pump();

      await tester.pumpWidget(_app(const SizedBox()));

      expect(InlineBackInterceptor.handleBack(), isFalse);
    });

    testWidgets('shows no floating button', (tester) async {
      final controller = await _pumpWrapper(tester);
      controller.jumpTo(500);
      await tester.pump();

      expect(find.byIcon(Icons.arrow_upward_rounded), findsNothing);
    });
  });

  group('off TV', () {
    testWidgets('fades the button in once scrolled and returns on tap', (
      tester,
    ) async {
      final controller = await _pumpWrapper(tester);

      double opacity() =>
          tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity;
      expect(opacity(), 0.0);

      controller.jumpTo(500);
      await tester.pumpAndSettle();
      expect(opacity(), 1.0);

      await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
      await tester.pumpAndSettle();

      expect(controller.offset, 0);
      expect(opacity(), 0.0);
    });

    testWidgets('points left for a horizontal grid', (tester) async {
      final controller = await _pumpWrapper(tester, axis: Axis.horizontal);
      controller.jumpTo(500);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back_rounded), findsOneWidget);
      expect(find.byIcon(Icons.arrow_upward_rounded), findsNothing);
    });

    testWidgets('carries a label for assistive tech', (tester) async {
      final controller = await _pumpWrapper(tester);
      controller.jumpTo(500);
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel('Scroll to top'), findsAtLeastNWidgets(1));
    });

    testWidgets('registers no back handler', (tester) async {
      final controller = await _pumpWrapper(tester);
      controller.jumpTo(500);
      await tester.pump();

      expect(InlineBackInterceptor.handleBack(), isFalse);
    });
  });

  testWidgets('ignores the offset while two scroll views share a controller', (
    tester,
  ) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    // Switching a library between vertical and horizontal briefly attaches
    // both grids, and reading the offset then throws instead of picking one.
    await tester.pumpWidget(
      _app(
        QuickReturnWrapper(
          scrollController: controller,
          child: Column(
            children: [
              Expanded(child: _scrollingBody(controller)),
              Expanded(child: _scrollingBody(controller)),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
  });

  group('driven by a notifier instead of a controller', () {
    testWidgets('follows the notifier and calls back on return', (
      tester,
    ) async {
      final isAtStart = ValueNotifier<bool>(true);
      addTearDown(isAtStart.dispose);
      var returned = 0;

      await tester.pumpWidget(
        _app(
          QuickReturnWrapper(
            isAtStart: isAtStart,
            onReturn: () => returned++,
            child: const SizedBox.expand(),
          ),
        ),
      );
      await tester.pump();

      double opacity() =>
          tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity;
      expect(opacity(), 0.0);

      isAtStart.value = false;
      await tester.pumpAndSettle();
      expect(opacity(), 1.0);

      await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
      await tester.pumpAndSettle();

      // The screen owns the scrolling, so all this does is ask.
      expect(returned, 1);
    });

    testWidgets('takes the back key on TV while away from the start', (
      tester,
    ) async {
      PlatformDetection.setTvMode(true);
      final isAtStart = ValueNotifier<bool>(true);
      addTearDown(isAtStart.dispose);
      var returned = 0;

      await tester.pumpWidget(
        _app(
          QuickReturnWrapper(
            isAtStart: isAtStart,
            onReturn: () => returned++,
            child: const SizedBox.expand(),
          ),
        ),
      );
      await tester.pump();

      expect(InlineBackInterceptor.handleBack(), isFalse);

      isAtStart.value = false;
      await tester.pump();

      expect(InlineBackInterceptor.handleBack(), isTrue);
      expect(returned, 1);
    });
  });
}
