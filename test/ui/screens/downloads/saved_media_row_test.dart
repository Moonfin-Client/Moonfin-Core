import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/downloads/widgets/saved_media_row.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The row is the only place a remote can reach a saved download's actions, so
/// the column walk is the contract worth pinning down.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    PlatformDetection.setTvMode(true);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  /// Two rows, so up and down have somewhere to land.
  Future<List<FocusNode>> pumpRows(
    WidgetTester tester, {
    bool withPlay = true,
    VoidCallback? onActivate,
    VoidCallback? onPlay,
    VoidCallback? onMenu,
  }) async {
    final nodes = [
      FocusNode(debugLabel: 'row0'),
      FocusNode(debugLabel: 'row1'),
    ];
    addTearDown(() {
      for (final node in nodes) {
        node.dispose();
      }
    });

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Column(
            children: [
              for (var i = 0; i < nodes.length; i++)
                SavedMediaRow(
                  rowFocusNode: nodes[i],
                  title: 'Item $i',
                  subtitle: '2022 • PG • Movie',
                  sizeLabel: '1.85 GB',
                  onActivate: onActivate ?? () {},
                  onPlay: withPlay ? (onPlay ?? () {}) : null,
                  onMenu: onMenu ?? () {},
                  onNavigateUp: () =>
                      i > 0 ? nodes[i - 1].requestFocus() : null,
                  onNavigateDown: () =>
                      i + 1 < nodes.length ? nodes[i + 1].requestFocus() : null,
                ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return nodes;
  }

  /// Which column of row 0 currently holds focus, by the debug label the row
  /// gives each of its own nodes.
  String focusedLabel() =>
      FocusManager.instance.primaryFocus?.debugLabel ?? '<none>';

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pumpAndSettle();
  }

  testWidgets('right walks the row body, play and menu, then stops', (
    tester,
  ) async {
    final nodes = await pumpRows(tester);
    nodes[0].requestFocus();
    await tester.pumpAndSettle();
    expect(focusedLabel(), 'row0');

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowPlay');

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowMenu');

    // The menu is the last column, so right must not spill into the next row.
    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowMenu');
  });

  testWidgets('left walks back to the row body and is consumed there', (
    tester,
  ) async {
    final nodes = await pumpRows(tester);
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.arrowRight);
    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowMenu');

    await press(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedLabel(), 'SavedMediaRowPlay');

    await press(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedLabel(), 'row0');

    // Nothing sits left of a row inside the panel.
    await press(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedLabel(), 'row0');
  });

  testWidgets('a row with nothing to play makes the menu the second column', (
    tester,
  ) async {
    final nodes = await pumpRows(tester, withPlay: false);
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowMenu');

    await press(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedLabel(), 'row0');
  });

  testWidgets('leaving a row from a button lands on the next row body', (
    tester,
  ) async {
    final nodes = await pumpRows(tester);
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedLabel(), 'SavedMediaRowPlay');

    // Down resets the column rather than staying on play, because the next row
    // may have no play button to stay on.
    await press(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedLabel(), 'row1');
  });

  testWidgets("select plays and doesn't open the menu", (tester) async {
    var activated = 0;
    var menus = 0;
    final nodes = await pumpRows(
      tester,
      onActivate: () => activated++,
      onMenu: () => menus++,
    );
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.select);
    expect(activated, 1);
    expect(menus, 0);
  });

  testWidgets('holding select opens the menu instead of playing', (
    tester,
  ) async {
    var activated = 0;
    var menus = 0;
    final nodes = await pumpRows(
      tester,
      onActivate: () => activated++,
      onMenu: () => menus++,
    );
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.select);
    await tester.pump(const Duration(milliseconds: 600));
    await tester.sendKeyUpEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();

    expect(menus, 1);
    expect(activated, 0, reason: 'a long press must not also play');
  });

  testWidgets('the gamepad context menu key opens the menu from any column', (
    tester,
  ) async {
    var menus = 0;
    final nodes = await pumpRows(tester, onMenu: () => menus++);
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.contextMenu);
    expect(menus, 1);

    await press(tester, LogicalKeyboardKey.arrowRight);
    await press(tester, LogicalKeyboardKey.contextMenu);
    expect(menus, 2);
  });

  testWidgets('the play button plays and the menu button opens the menu', (
    tester,
  ) async {
    var plays = 0;
    var menus = 0;
    final nodes = await pumpRows(
      tester,
      onPlay: () => plays++,
      onMenu: () => menus++,
    );
    nodes[0].requestFocus();
    await tester.pumpAndSettle();

    await press(tester, LogicalKeyboardKey.arrowRight);
    await press(tester, LogicalKeyboardKey.select);
    expect(plays, 1);

    await press(tester, LogicalKeyboardKey.arrowRight);
    await press(tester, LogicalKeyboardKey.select);
    expect(menus, 1);
  });
}
