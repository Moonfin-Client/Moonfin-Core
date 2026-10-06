import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/settings/library_order_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockUsersApi extends Mock implements UsersApi {}

class _MockViewsApi extends Mock implements UserViewsApi {}

const _names = ['Movies', 'Shows', 'Books'];

/// Longer than the screen waits before it writes a run of moves.
const _pastSaveDelay = Duration(milliseconds: 700);

void main() {
  late _MockUsersApi users;
  late _MockViewsApi views;

  setUpAll(() => registerFallbackValue(const UserConfiguration()));

  setUp(() {
    users = _MockUsersApi();
    views = _MockViewsApi();
    final client = _MockClient();
    when(() => client.usersApi).thenReturn(users);
    when(() => client.userViewsApi).thenReturn(views);
    GetIt.instance.registerSingleton<UserViewsRepository>(
      UserViewsRepository(client),
    );

    when(() => views.getUserViews(includeHidden: true)).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'movies', 'Name': 'Movies', 'CollectionType': 'movies'},
          {'Id': 'shows', 'Name': 'Shows', 'CollectionType': 'tvshows'},
          {'Id': 'books', 'Name': 'Books', 'CollectionType': 'books'},
        ],
      },
    );
    when(() => users.getUserConfiguration()).thenAnswer(
      (_) async => UserConfiguration.fromJson({
        'OrderedViews': ['movies', 'shows', 'books'],
        'MyMediaExcludes': ['books'],
      }),
    );
    when(() => users.updateUserConfiguration(any())).thenAnswer((_) async {});
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LibraryOrderScreen(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder tileOf(String name) =>
      find.ancestor(of: find.text(name), matching: find.byType(ListTile));

  List<String> shownOrder(WidgetTester tester) => [..._names]
    ..sort(
      (a, b) => tester
          .getTopLeft(find.text(a))
          .dy
          .compareTo(tester.getTopLeft(find.text(b)).dy),
    );

  /// Drags [name] by its handle to just past the row below it, holding first
  /// when [hold] is set, the way a finger has to on a phone.
  Future<void> dragDownOneRow(
    WidgetTester tester,
    String name, {
    required bool hold,
    PointerDeviceKind kind = PointerDeviceKind.touch,
  }) async {
    final handle = find.descendant(
      of: tileOf(name),
      matching: find.byIcon(Icons.drag_handle),
    );
    final distance = tester.getSize(tileOf(name)).height + 12;
    final gesture = await tester.startGesture(
      tester.getCenter(handle),
      kind: kind,
    );
    if (hold) await tester.pump(kLongPressTimeout + kPressTimeout);
    for (var step = 0; step < 10; step++) {
      await gesture.moveBy(Offset(0, distance / 10));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await tester.pumpAndSettle();
  }

  List<List<String>> savedOrders() => [
    for (final config in verify(
      () => users.updateUserConfiguration(captureAny()),
    ).captured.cast<UserConfiguration>())
      config.orderedViews,
  ];

  testWidgets('libraries show in server order and hidden ones say so', (
    tester,
  ) async {
    await pump(tester);

    expect(shownOrder(tester), ['Movies', 'Shows', 'Books']);
    expect(
      find.descendant(of: tileOf('Books'), matching: find.text('Hidden')),
      findsOneWidget,
    );
    expect(find.text('Hidden'), findsOneWidget);
  });

  testWidgets('on a phone a held handle drags a library and saves it', (
    tester,
  ) async {
    await pump(tester);

    await dragDownOneRow(tester, 'Movies', hold: true);
    expect(shownOrder(tester), ['Shows', 'Movies', 'Books']);

    await tester.pump(_pastSaveDelay);
    await tester.pumpAndSettle();
    expect(savedOrders(), [
      ['shows', 'movies', 'books'],
    ]);
    // Once to load and once more to start the write from what the server has.
    verify(() => users.getUserConfiguration()).called(2);
  });

  testWidgets('on a phone a quick swipe over the handle moves nothing', (
    tester,
  ) async {
    await pump(tester);

    await dragDownOneRow(tester, 'Movies', hold: false);
    await tester.pump(_pastSaveDelay);

    expect(shownOrder(tester), ['Movies', 'Shows', 'Books']);
    verifyNever(() => users.updateUserConfiguration(any()));
  });

  testWidgets('a mouse drags a library by its handle straight away', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pump(tester);

    await dragDownOneRow(
      tester,
      'Shows',
      hold: false,
      kind: PointerDeviceKind.mouse,
    );
    expect(shownOrder(tester), ['Movies', 'Books', 'Shows']);

    await tester.pump(_pastSaveDelay);
    await tester.pumpAndSettle();
    expect(savedOrders(), [
      ['movies', 'books', 'shows'],
    ]);
  });

  group('on a remote', () {
    setUp(() => PlatformDetection.setTvMode(true));

    bool hasFocus(String id) =>
        FocusManager.instance.primaryFocus?.debugLabel == 'library_order $id';

    testWidgets('right and left move the highlighted library', (tester) async {
      await pump(tester);
      expect(hasFocus('movies'), isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(shownOrder(tester), ['Shows', 'Movies', 'Books']);
      expect(hasFocus('movies'), isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(shownOrder(tester), ['Shows', 'Books', 'Movies']);
      expect(hasFocus('movies'), isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(shownOrder(tester), ['Shows', 'Movies', 'Books']);
    });

    testWidgets('a run of presses goes out as one write', (tester) async {
      await pump(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      verifyNever(() => users.updateUserConfiguration(any()));

      await tester.pump(_pastSaveDelay);
      await tester.pumpAndSettle();
      expect(savedOrders(), [
        ['shows', 'books', 'movies'],
      ]);
    });

    testWidgets('up and down still walk the list', (tester) async {
      await pump(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(hasFocus('shows'), isTrue);
      expect(shownOrder(tester), ['Movies', 'Shows', 'Books']);
    });

    testWidgets('a move made just before leaving is still saved', (
      tester,
    ) async {
      await pump(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();

      expect(savedOrders(), [
        ['shows', 'movies', 'books'],
      ]);
    });

    testWidgets('a write the server refuses puts the old order back', (
      tester,
    ) async {
      when(() => users.updateUserConfiguration(any()))
          .thenThrow(Exception('403'));
      await pump(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(shownOrder(tester), ['Shows', 'Movies', 'Books']);

      await tester.pump(_pastSaveDelay);
      await tester.pumpAndSettle();

      expect(shownOrder(tester), ['Movies', 'Shows', 'Books']);
      expect(find.text("Couldn't save the library order"), findsOneWidget);
    });
  });
}
