import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/route_lifecycle_observer.dart';
import 'package:moonfin/ui/screens/browse/library_header_styles.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_navbar.dart';
import 'package:moonfin/ui/widgets/quick_return_wrapper.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Calls {
  int sort = 0;
  int group = 0;
  int show = 0;
  int display = 0;
  int toggleAlphabet = 0;
  int exitRight = 0;
  int refresh = 0;
}

LibraryHeaderModel _model(
  _Calls calls, {
  bool alphabetOn = true,
  bool alphabetApplies = true,
  LibraryHeaderRefresh? refresh,
}) {
  final nodes = [for (var i = 0; i < 4; i++) FocusNode()];
  final controller = TextEditingController();
  addTearDown(() {
    for (final node in nodes) {
      node.dispose();
    }
    controller.dispose();
  });
  return LibraryHeaderModel(
    title: 'Movies',
    itemCount: 412,
    homeFocusNode: nodes[0],
    sortFocusNode: nodes[1],
    searchFocusNode: nodes[2],
    allLetterFocusNode: nodes[3],
    searchController: controller,
    onSearchChanged: (_) {},
    onTvSearchKey: (_, _) => KeyEventResult.ignored,
    onHome: () {},
    sortLabel: 'Name',
    sortAscending: true,
    onSort: () => calls.sort++,
    groupLabel: 'None',
    onGroupBy: () => calls.group++,
    showLabel: 'All',
    onShow: () => calls.show++,
    displayLabel: 'Poster',
    onDisplay: () => calls.display++,
    alphabetApplies: alphabetApplies,
    alphabetOn: alphabetOn,
    onToggleAlphabet: () => calls.toggleAlphabet++,
    onLetter: (_) {},
    refresh: refresh,
  );
}

/// With [busy], part way through a read of two servers.
LibraryHeaderRefresh _refresh(_Calls calls, {bool busy = false}) {
  final node = FocusNode(debugLabel: 'refresh');
  addTearDown(node.dispose);
  return LibraryHeaderRefresh(
    focusNode: node,
    onRefresh: () => calls.refresh++,
    busy: busy,
    showProgress: busy,
    progressText: '1/2',
    progressSemanticsLabel: '1 of 2 servers up to date',
  );
}

final _refreshButton = find.byTooltip('Refresh');

Future<void> _pump(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [routeLifecycleObserver],
      home: Scaffold(body: child),
    ),
  );
  await tester.pump();
}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  group('on desktop', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop));
    tearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );

    testWidgets('Modern labels every pill with its current value', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1600, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final calls = _Calls();
      final model = _model(calls);
      await _pump(
        tester,
        Column(children: [ModernLibraryHeader(model: model, compact: false)]),
      );

      expect(find.text('Movies'), findsOneWidget);
      expect(find.text('412 items'), findsOneWidget);
      for (final text in [
        'Sort By',
        'Name',
        'Group By',
        'None',
        'Show',
        'All',
      ]) {
        expect(find.text(text), findsOneWidget, reason: text);
      }
      expect(model.homeFocusNode.context, isNotNull);
      expect(model.allLetterFocusNode.context, isNotNull);

      await tester.tap(find.text('Show'));
      await tester.tap(find.text('Group By'));
      expect(calls.show, 1);
      expect(calls.group, 1);

      model.homeFocusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(
        model.allLetterFocusNode.hasFocus,
        isTrue,
        reason: 'Down from the bar lands on # rather than any letter',
      );
    });

    testWidgets('Docked keeps the letters in the panel and leaves on Right', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1280, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final calls = _Calls();
      final model = _model(calls);
      final scope = FocusScopeNode();
      addTearDown(scope.dispose);
      await _pump(
        tester,
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DockedLibraryPanel(
              model: model,
              scopeNode: scope,
              onExitRight: () => calls.exitRight++,
            ),
          ],
        ),
      );

      for (final text in [
        'Sort By',
        'Name',
        'Group By',
        'None',
        'Show',
        'All',
        'Display',
        'Poster',
        'Jump to letter',
      ]) {
        expect(find.text(text), findsOneWidget, reason: text);
      }
      expect(model.homeFocusNode.context, isNotNull);
      expect(model.allLetterFocusNode.context, isNotNull);

      model.allLetterFocusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(calls.exitRight, 0, reason: 'Right walks along the letter row');
      expect(model.allLetterFocusNode.hasFocus, isFalse);

      model.sortFocusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(calls.exitRight, 1, reason: 'nothing to the right of a row');
    });
  });

  group('the Refresh button of a merged library', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop));
    tearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );

    Map<String, Widget Function(LibraryHeaderModel)> headers(
      FocusScopeNode scope,
    ) => {
      'Modern': (model) =>
          Column(children: [ModernLibraryHeader(model: model, compact: false)]),
      'Modern on a phone': (model) =>
          Column(children: [ModernLibraryHeader(model: model, compact: true)]),
      'Docked on a phone': (model) => Column(
        children: [CompactLibraryHeader(model: model, showControls: false)],
      ),
      'Docked': (model) => Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DockedLibraryPanel(
            model: model,
            scopeNode: scope,
            onExitRight: () {},
          ),
        ],
      ),
    };

    Future<void> pumpHeader(
      WidgetTester tester,
      String name,
      LibraryHeaderModel model,
    ) async {
      tester.view.physicalSize = name.endsWith('phone')
          ? const Size(400, 800)
          : const Size(1600, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final scope = FocusScopeNode();
      addTearDown(scope.dispose);
      await _pump(tester, headers(scope)[name]!(model));
    }

    for (final name in [
      'Modern',
      'Modern on a phone',
      'Docked on a phone',
      'Docked',
    ]) {
      testWidgets('$name has none for one server\'s library', (tester) async {
        await pumpHeader(tester, name, _model(_Calls()));

        expect(_refreshButton, findsNothing);
        expect(find.byType(LibraryRefreshAction), findsNothing);
      });

      testWidgets('$name draws it in the row of its Back button', (
        tester,
      ) async {
        final calls = _Calls();
        final model = _model(calls, refresh: _refresh(calls));
        await pumpHeader(tester, name, model);

        expect(_refreshButton, findsOneWidget);
        expect(find.byKey(LibrarySyncProgress.statusKey), findsNothing);
        final back = tester.getRect(
          find.byWidgetPredicate(
            (widget) => widget is Focus && widget.focusNode == model.homeFocusNode,
          ),
        );
        final refresh = tester.getRect(_refreshButton);
        expect(refresh.top < back.bottom && refresh.bottom > back.top, isTrue);

        await tester.tap(_refreshButton);
        expect(calls.refresh, 1);

        // With the focus on it, Enter presses it as a tap does.
        model.refresh!.focusNode.requestFocus();
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        expect(calls.refresh, 2);
        expect(tester.takeException(), isNull);
      });

      testWidgets('$name switches it off while a read runs', (tester) async {
        final calls = _Calls();
        final model = _model(calls, refresh: _refresh(calls, busy: true));
        await pumpHeader(tester, name, model);

        await tester.tap(_refreshButton, warnIfMissed: false);
        model.refresh!.focusNode.requestFocus();
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);

        expect(calls.refresh, 0);
        expect(model.refresh!.focusNode.hasFocus, isTrue);
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Semantics &&
                widget.properties.button == true &&
                widget.properties.enabled == false,
          ),
          findsOneWidget,
        );
        // The docked header is too narrow for the progress, so the page
        // shows it instead.
        expect(
          find.text('1/2'),
          name == 'Docked' ? findsNothing : findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('keeps its focus as a read starts and ends', (tester) async {
      final calls = _Calls();
      final node = FocusNode();
      addTearDown(node.dispose);
      LibraryHeaderRefresh refresh({required bool busy}) =>
          LibraryHeaderRefresh(
            focusNode: node,
            onRefresh: () => calls.refresh++,
            busy: busy,
            showProgress: busy,
            progressText: '1/2',
            progressSemanticsLabel: '1 of 2 servers up to date',
          );
      Widget action(bool busy) => Center(
        child: LibraryRefreshAction(
          refresh: refresh(busy: busy),
          size: 44,
          iconSize: 22,
        ),
      );

      await _pump(tester, action(false));
      node.requestFocus();
      await tester.pump();
      expect(node.hasFocus, isTrue);

      await _pump(tester, action(true));
      expect(node.hasFocus, isTrue);
      expect(find.text('1/2'), findsOneWidget);

      await _pump(tester, action(false));
      expect(node.hasFocus, isTrue);
      expect(find.text('1/2'), findsNothing);
    });
  });

  group('on a phone', () {
    testWidgets('Modern shows labeled chips and no letter row', (tester) async {
      final calls = _Calls();
      final model = _model(calls);
      await _pump(
        tester,
        Column(children: [ModernLibraryHeader(model: model, compact: true)]),
      );

      for (final text in [
        'Sort By',
        'Name',
        'Group By',
        'None',
        'Show',
        'All',
      ]) {
        expect(find.text(text), findsOneWidget, reason: text);
      }
      expect(model.homeFocusNode.context, isNotNull);
      expect(
        model.allLetterFocusNode.context,
        isNull,
        reason: 'phones get the scrub rail instead',
      );
      await tester.tap(find.text('Sort By'));
      expect(calls.sort, 1);
    });

    testWidgets('the Docked bar offers A to Z while the sort can use it', (
      tester,
    ) async {
      final calls = _Calls();
      await _pump(
        tester,
        DockedLibraryBar(model: _model(calls, alphabetOn: false)),
      );
      await tester.tap(find.text('A to Z'));
      await tester.tap(find.text('Display'));
      expect(calls.toggleAlphabet, 1);
      expect(calls.display, 1);

      await _pump(
        tester,
        DockedLibraryBar(model: _model(calls, alphabetApplies: false)),
      );
      expect(find.text('A to Z'), findsNothing);
    });

    testWidgets('the Docked bar raises the return-to-top button above it', (
      tester,
    ) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      final model = _model(_Calls());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          navigatorObservers: [routeLifecycleObserver],
          home: BottomNavInsetScope(
            height: kDockedBarHeight + kDockedBarMargin,
            child: QuickReturnWrapper(
              scrollController: controller,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: controller,
                    itemCount: 200,
                    itemBuilder: (_, i) =>
                        SizedBox(height: 100, child: Text('item $i')),
                  ),
                  Positioned(
                    left: kDockedBarMargin,
                    right: kDockedBarMargin,
                    bottom: kDockedBarMargin,
                    child: DockedLibraryBar(model: model),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      controller.jumpTo(2000);
      await tester.pumpAndSettle();

      final button = tester.getRect(find.byIcon(Icons.arrow_upward_rounded));
      final bar = tester.getRect(find.byType(DockedLibraryBar));
      expect(button.bottom, lessThanOrEqualTo(bar.top));
    });
  });
}
