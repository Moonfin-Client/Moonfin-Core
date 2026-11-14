import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/local_search_field.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

import '../../unified_ui_fakes.dart';

/// One server's own library, which answers whatever the grid asks with the
/// same three movies.
class _PlainItemsApi implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      return Future<Map<String, dynamic>>.value({
        'Items': [
          {'Id': 'p1', 'Name': 'Altovar', 'Type': 'Movie'},
          {'Id': 'p2', 'Name': 'Hodrimel', 'Type': 'Movie'},
          {'Id': 'p3', 'Name': 'Rusquin', 'Type': 'Movie'},
        ],
        'TotalRecordCount': 3,
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

/// Only the tvOS runner answers this, and the text field only calls it in a
/// build made with the define the tvOS app is built with.
const _appleTvSystemChannel = MethodChannel('moonfin/appletv_system');

/// Searching a library with the Apple TV keyboard, which shows over the app
/// and hands the text back in one piece once Done is pressed.
///
/// These need the tvOS define, and are skipped without it:
///
///     flutter test --dart-define=MOONFIN_TVOS=true \
///         test/ui/screens/browse/library_browse_tv_search_test.dart
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const isTvosBuild = bool.fromEnvironment('MOONFIN_TVOS');

  late UnifiedBrowseHarness harness;
  late UnifiedCatalogService catalog;
  late FakeCatalogServer a;
  late FakeCatalogServer b;

  /// Completes when the test presses Done, with what was typed. Created when
  /// the keyboard is shown, so it belongs to the test that opened it.
  late Completer<String?> keyboard;
  late List<String> keyboardCalls;

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
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await harness.prefs.set(
      UserPreferences.keyboardStyle,
      KeyboardStyle.native,
    );

    keyboardCalls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_appleTvSystemChannel, (call) async {
          keyboardCalls.add(call.method);
          if (call.method != 'showTextInput') return null;
          keyboard = Completer<String?>();
          return keyboard.future;
        });
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_appleTvSystemChannel, null);
    await harness.tearDown();
  });

  Future<void> readServers(WidgetTester tester) async {
    a.movies = [catalogMovie('a1', 'Altovar'), catalogMovie('a2', 'Hodrimel')];
    b.movies = [catalogMovie('b1', 'Rusquin')];
    await tester.runAsync(catalog.forceFullRead);
  }

  LocalSearchField searchField(WidgetTester tester) =>
      tester.widget<LocalSearchField>(find.byType(LocalSearchField));

  /// Moves the focus to the search box and presses Select on it.
  Future<void> openKeyboard(WidgetTester tester) async {
    searchField(tester).focusNode.requestFocus();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump(const Duration(milliseconds: 100));
    expect(keyboardCalls, ['showTextInput']);
  }

  Future<void> pressDone(WidgetTester tester, String typed) async {
    keyboard.complete(typed);
    await pumpUntil(
      tester,
      () => searchField(tester).controller.text == typed,
      reason: 'the search box never took the typed text',
    );
    await pumpTurns(tester);
  }

  for (final style in LibraryStyle.values) {
    testWidgets('the ${style.name} merged library lists only the matches once '
        'Done is pressed', (tester) async {
      await harness.prefs.set(UserPreferences.libraryStyle, style);
      await readServers(tester);
      await harness.pumpLibrary(tester);
      expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);

      await openKeyboard(tester);
      await pressDone(tester, 'alto');

      expect(cardTitles(tester), ['Altovar']);
      expect(tester.takeException(), isNull);
    }, skip: !isTvosBuild);
  }

  testWidgets('a catalog that changes while the keyboard is up does not lose '
      'the search', (tester) async {
    await readServers(tester);
    await harness.pumpLibrary(tester);
    await openKeyboard(tester);

    // The servers are read again while the user is typing.
    a.movies = [...a.movies, catalogMovie('a3', 'Altomire')];
    await tester.runAsync(catalog.forceFullRead);
    await pumpUntil(
      tester,
      () => find.text('Library changed').evaluate().isNotEmpty,
      reason: 'the read never found the new movie',
    );

    await pressDone(tester, 'alto');
    expect(cardTitles(tester), ['Altovar']);

    await tester.tap(find.text('Library changed'));
    await pumpUntil(tester, () => cardTitles(tester).length == 2);
    expect(cardTitles(tester), ['Altomire', 'Altovar']);
    expect(searchField(tester).controller.text, 'alto');
    expect(tester.takeException(), isNull);
  }, skip: !isTvosBuild);

  testWidgets('one server\'s own library lists only the matches once Done is '
      'pressed', (tester) async {
    await harness.pumpLibrary(tester, unified: false);
    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);

    await openKeyboard(tester);
    await pressDone(tester, 'hod');

    expect(cardTitles(tester), ['Hodrimel']);
    expect(tester.takeException(), isNull);
  }, skip: !isTvosBuild);

  testWidgets('closing the keyboard without Done leaves the library as it '
      'was', (tester) async {
    await readServers(tester);
    await harness.pumpLibrary(tester);
    await openKeyboard(tester);

    // Menu on the remote ends the session with nothing to hand back.
    keyboard.complete(null);
    await pumpTurns(tester);

    expect(searchField(tester).controller.text, isEmpty);
    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(tester.takeException(), isNull);
  }, skip: !isTvosBuild);
}
