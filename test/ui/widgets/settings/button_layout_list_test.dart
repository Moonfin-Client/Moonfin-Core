import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/button_layout.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/settings/button_layout_list.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Every row here shares one pair of preferences, so a row has to work from what
// is stored right now rather than a copy taken when it was built, otherwise one
// switch quietly undoes another.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final layout = ButtonLayout(
    hiddenTv: Preference(key: 'test_hidden_tv', defaultValue: ''),
    hiddenMobile: Preference(key: 'test_hidden_mobile', defaultValue: ''),
    hiddenDesktop: Preference(key: 'test_hidden_desktop', defaultValue: ''),
    orderTv: Preference(key: 'test_order_tv', defaultValue: ''),
    orderMobile: Preference(key: 'test_order_mobile', defaultValue: ''),
    orderDesktop: Preference(key: 'test_order_desktop', defaultValue: ''),
  );

  final switchesOnly = ButtonLayout(
    hiddenTv: Preference(key: 'test_only_hidden_tv', defaultValue: ''),
    hiddenMobile: Preference(key: 'test_only_hidden_mobile', defaultValue: ''),
    hiddenDesktop: Preference(
      key: 'test_only_hidden_desktop',
      defaultValue: '',
    ),
  );

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() => GetIt.instance.reset());

  ButtonLayoutList listOf(
    ButtonLayout layout,
    List<String> ids, {
    Set<String> pinned = const {},
  }) => ButtonLayoutList(
    layout: layout,
    entries: [
      for (final id in ids)
        ButtonLayoutEntry(
          id: id,
          title: id,
          icon: Icons.star,
          canHide: !pinned.contains(id),
        ),
    ],
  );

  Future<void> pumpLists(WidgetTester tester, List<ButtonLayoutList> lists) {
    return tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ListView(children: lists)),
      ),
    );
  }

  Future<void> pumpRows(
    WidgetTester tester,
    List<String> ids, {
    Set<String> pinned = const {},
  }) => pumpLists(tester, [listOf(layout, ids, pinned: pinned)]);

  UserPreferences prefs() => GetIt.instance<UserPreferences>();
  String hidden() => prefs().get(layout.hiddenPreference);
  String order() => prefs().get(layout.orderPreference);
  List<String> rowTitles(WidgetTester tester) => tester
      .widgetList<ListTile>(find.byType(ListTile))
      .map((tile) => (tile.title! as Text).data!)
      .toList();

  testWidgets('every switch turned off is kept, not just the last one', (
    tester,
  ) async {
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    await tester.tap(find.text('alpha'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('beta'));
    await tester.pumpAndSettle();

    expect(hidden().split(','), containsAll(['alpha', 'beta']));
  });

  testWidgets('a switch turned back on only drops its own entry', (
    tester,
  ) async {
    await pumpRows(tester, ['alpha', 'beta']);

    await tester.tap(find.text('alpha'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('beta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('alpha'));
    await tester.pumpAndSettle();

    expect(hidden(), 'beta');
  });

  testWidgets('a pinned button has no switch and stays on', (tester) async {
    await pumpRows(tester, ['alpha', 'beta'], pinned: {'alpha'});

    expect(find.byType(Switch), findsOneWidget);
    await tester.tap(find.text('alpha'));
    await tester.pumpAndSettle();

    expect(hidden(), isEmpty);
  });

  testWidgets('moving a row down rewrites the whole order', (tester) async {
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
    await tester.pumpAndSettle();

    expect(order(), 'beta,alpha,gamma');
    expect(rowTitles(tester), ['beta', 'alpha', 'gamma']);
  });

  testWidgets('moving a row up puts it back', (tester) async {
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.keyboard_arrow_up).at(1));
    await tester.pumpAndSettle();

    expect(rowTitles(tester), ['alpha', 'beta', 'gamma']);
  });

  testWidgets('the ends of the list cannot move past themselves', (
    tester,
  ) async {
    await pumpRows(tester, ['alpha', 'beta']);

    final up = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.keyboard_arrow_up).first,
    );
    final down = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.keyboard_arrow_down).last,
    );

    expect(up.onPressed, isNull);
    expect(down.onPressed, isNull);
  });

  testWidgets('a button the user never placed keeps its declared spot', (
    tester,
  ) async {
    await prefs().set(layout.orderPreference, 'gamma,alpha');
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    // beta was declared after alpha, so it follows alpha rather than being
    // dropped at the end.
    expect(rowTitles(tester), ['gamma', 'alpha', 'beta']);
  });

  testWidgets('a button switched off drops below the ones still on', (
    tester,
  ) async {
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    await tester.tap(find.text('alpha'));
    await tester.pumpAndSettle();

    expect(rowTitles(tester), ['beta', 'gamma', 'alpha']);
  });

  testWidgets('a shown button cannot move down past a hidden one', (
    tester,
  ) async {
    await prefs().set(layout.hiddenPreference, 'gamma');
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    final down = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.keyboard_arrow_down).at(1),
    );

    expect(down.onPressed, isNull);
  });

  testWidgets('switching a button off leaves the order alone', (tester) async {
    await pumpRows(tester, ['alpha', 'beta', 'gamma']);

    await tester.tap(find.byIcon(Icons.keyboard_arrow_down).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('gamma'));
    await tester.pumpAndSettle();

    expect(order(), 'beta,alpha,gamma');
    expect(hidden(), 'gamma');
  });

  group('a layout with no order', () {
    String hiddenIds() => prefs().get(switchesOnly.hiddenPreference);

    testWidgets('offers switches but no arrows', (tester) async {
      await pumpLists(tester, [
        listOf(switchesOnly, ['alpha', 'beta']),
      ]);

      expect(find.byType(Switch), findsNWidgets(2));
      expect(find.byIcon(Icons.keyboard_arrow_up), findsNothing);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsNothing);
    });

    testWidgets('keeps a row in place when it is switched off', (
      tester,
    ) async {
      await pumpLists(tester, [
        listOf(switchesOnly, ['alpha', 'beta', 'gamma']),
      ]);

      await tester.tap(find.text('alpha'));
      await tester.pumpAndSettle();

      expect(hiddenIds(), 'alpha');
      expect(rowTitles(tester), ['alpha', 'beta', 'gamma']);
    });

    testWidgets('lets left and right fall through on a remote', (
      tester,
    ) async {
      PlatformDetection.setTvMode(true);
      addTearDown(() => PlatformDetection.setTvMode(false));
      await pumpLists(tester, [
        listOf(switchesOnly, ['alpha', 'beta']),
      ]);

      final row = tester.widget<Focus>(
        find
            .ancestor(
              of: find.text('beta'),
              matching: find.byWidgetPredicate(
                (widget) => widget is Focus && widget.onKeyEvent != null,
              ),
            )
            .first,
      );
      final result = row.onKeyEvent!(
        row.focusNode!,
        const KeyDownEvent(
          physicalKey: PhysicalKeyboardKey.arrowLeft,
          logicalKey: LogicalKeyboardKey.arrowLeft,
          timeStamp: Duration.zero,
        ),
      );

      expect(result, KeyEventResult.ignored);
      expect(rowTitles(tester), ['alpha', 'beta']);
    });

    testWidgets('two lists over one preference keep both switches', (
      tester,
    ) async {
      await pumpLists(tester, [
        listOf(switchesOnly, ['alpha', 'beta']),
        listOf(switchesOnly, ['gamma', 'delta']),
      ]);

      await tester.tap(find.text('alpha'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('delta'));
      await tester.pumpAndSettle();

      expect(hiddenIds().split(','), unorderedEquals(['alpha', 'delta']));
    });
  });
}
