import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_gate.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_previews.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeClient implements MediaServerClient {
  @override
  String get baseUrl => 'http://server';

  @override
  String? get userId => 'user';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  _FakeClientFactory(this.client);

  final MediaServerClient client;

  @override
  MediaServerClient getActiveClient() => client;

  @override
  Map<String, MediaServerClient> get clients => {'server': client};
}

/// Items with no artwork, so the previews lay out for real without touching
/// the network.
List<MediaBarSlideItem> _fakeItems() => [
  for (var i = 0; i < 4; i++)
    MediaBarSlideItem(
      itemId: 'item$i',
      serverId: 'server',
      title: 'Sample Title $i',
      overview: 'A short overview.',
      year: 2020 + i,
    ),
];

String? _focusLabel() => FocusManager.instance.primaryFocus?.debugLabel;

/// Option rows drawn as focused, which fill with the text color.
int _litRows(WidgetTester tester) => tester
    .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
    .where(
      (box) =>
          box.constraints == const BoxConstraints.tightFor(height: 30) &&
          (box.decoration as BoxDecoration?)?.color == AppColorScheme.onSurface,
    )
    .length;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'http://server',
      'pref_last_user_id': 'user',
    });
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<SetupWizardGate>(SetupWizardGate(prefs))
      ..registerSingleton<MediaServerClientFactory>(
        _FakeClientFactory(_FakeClient()),
      );
    SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
  });

  tearDown(() async {
    SetupPreviewData.debugOverride = null;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  // The previews animate, so the clock is stepped rather than settled.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> pumpWizard(WidgetTester tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SetupWizardScreen(),
        ),
        GoRoute(
          path: Destinations.home,
          builder: (context, state) => const Text('home'),
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    await settle(tester);
  }

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await settle(tester);
  }

  // TV runs first: the media bar's default is read once per test run, and on
  // a TV it's Moonfin, the first row.
  group('on a TV', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.tv));

    testWidgets('the preview follows focus and the list ends lead out', (
      tester,
    ) async {
      await pumpWizard(tester);

      expect(find.text('Step 1 of 5'), findsOneWidget);
      // The chip and the last step of the settings path.
      expect(find.text('Navigation Style'), findsNWidgets(2));
      expect(find.text('Navigation Bar'), findsOneWidget);
      expect(_focusLabel(), 'setupOption navbar 0');
      expect(find.text('Tabs across the top of the screen.'), findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(_focusLabel(), 'setupOption navbar 1');
      expect(
        find.text('A slim rail of icons down the left side.'),
        findsOneWidget,
      );
      // Looking at an option isn't choosing it.
      expect(find.text('Current'), findsOneWidget);
      expect(
        find.descendant(
          of: find.ancestor(
            of: find.text('Top Bar'),
            matching: find.byType(Row),
          ),
          matching: find.text('Current'),
        ),
        findsOneWidget,
      );

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(_focusLabel(), 'setupWizardNext');

      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Step 2 of 5'), findsOneWidget);
      expect(find.text('Media Bar Style'), findsNWidgets(2));
      expect(_focusLabel(), 'setupOption mediaBar 0');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(_focusLabel(), 'setupWizardSkip');
    });

    testWidgets('the stage scales up to fill a screen larger than it', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await pumpWizard(tester);
      // Laid out at 960x540, so drawn at twice that size its right edge is
      // near the screen's, not stranded in the middle.
      expect(tester.getTopRight(find.text('Skip setup')).dx, greaterThan(1700));
    });

    testWidgets('a step opens with only its chosen row lit', (tester) async {
      await pumpWizard(tester);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(_focusLabel(), 'setupOption navbar 1');
      expect(_litRows(tester), 1);

      // A pointer press leaves focus on the row it came from.
      await tester.tap(find.text('Next'));
      await settle(tester);
      expect(find.text('Step 2 of 5'), findsOneWidget);
      expect(_focusLabel(), 'setupOption mediaBar 0');
      expect(_litRows(tester), 1);
    });

    testWidgets('OK chooses without moving on, and Done writes only answers', (
      tester,
    ) async {
      await pumpWizard(tester);
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(_focusLabel(), 'setupWizardNext');
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Step 2 of 5'), findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(_focusLabel(), 'setupOption mediaBar 1');
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Step 2 of 5'), findsOneWidget);
      expect(
        find.descendant(
          of: find.ancestor(of: find.text('MakD'), matching: find.byType(Row)),
          matching: find.text('Current'),
        ),
        findsWidgets,
      );

      for (var step = 2; step < 5; step++) {
        await press(tester, LogicalKeyboardKey.arrowRight);
        await press(tester, LogicalKeyboardKey.enter);
      }
      expect(find.text('Step 5 of 5'), findsOneWidget);
      expect(find.text('App Theme'), findsNWidgets(2));
      expect(find.text('Done'), findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('home'), findsOneWidget);
      expect(
        prefs.get(UserPreferences.mediaBarMode),
        UserPreferences.mediaBarModeMakd,
      );
      // A question nobody answered stays unanswered for the next device.
      expect(prefs.containsPreference(UserPreferences.homeRowsStyle), isFalse);
    });

    testWidgets('BACK moves to Skip first and leaves on the second press', (
      tester,
    ) async {
      await pumpWizard(tester);

      await press(tester, LogicalKeyboardKey.escape);
      expect(_focusLabel(), 'setupWizardSkip');
      expect(find.text('home'), findsNothing);

      await press(tester, LogicalKeyboardKey.escape);
      expect(find.text('home'), findsOneWidget);
      expect(prefs.containsPreference(UserPreferences.mediaBarMode), isFalse);
    });
  });

  group('on a phone', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.phone));

    testWidgets('chips and swipes pick, and Next moves on', (tester) async {
      tester.view.physicalSize = const Size(390 * 3, 844 * 3);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await pumpWizard(tester);
      expect(find.text('Step 1 of 5'), findsOneWidget);
      expect(find.text('Navigation Style'), findsNWidgets(2));

      await tester.ensureVisible(find.text('Bottom Bar'));
      await tester.tap(find.text('Bottom Bar'));
      await settle(tester);
      // Bottom brings its style question along.
      expect(find.text('Step 1 of 6'), findsOneWidget);
      expect(
        find.text('Tabs along the bottom edge, in easy reach of your thumb.'),
        findsOneWidget,
      );

      await tester.fling(
        find.byType(SetupPreview).last,
        const Offset(300, 0),
        1500,
        warnIfMissed: false,
      );
      await settle(tester);
      expect(find.text('Step 1 of 5'), findsOneWidget);
      expect(
        find.text('A slim rail of icons down the left side.'),
        findsOneWidget,
      );

      await tester.tap(find.text('Next'));
      await settle(tester);
      expect(find.text('Step 2 of 5'), findsOneWidget);
      expect(find.text('Media Bar Style'), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });
  });
}
