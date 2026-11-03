import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/home_sections_screen.dart';
import 'package:moonfin/ui/widgets/settings/settings_panel.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockSyncService extends Mock implements PluginSyncService {}

class _MockSeerrPreferences extends Mock implements SeerrPreferences {}

const _collections = ['Marvel', 'Pixar', 'Star Wars'];

String _idOf(String collection) =>
    'pluginDynamic:collections:http://server:collection:$collection';

// Issue #1233: the editor lists the enabled rows on their own, where they
// reorder by drag, and puts the disabled ones in groups by kind that open and
// close.
void main() {
  late UserPreferences prefs;
  late _MockSyncService sync;

  setUpAll(() => registerFallbackValue(HomeSectionType.none));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.displayCollectionsRows, true);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final items = _MockItemsApi();
    when(
      () => items.getItems(
        includeItemTypes: const ['BoxSet'],
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        startIndex: 0,
        limit: 250,
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          for (final name in _collections) {'Id': name, 'Name': name},
        ],
        'TotalRecordCount': _collections.length,
      },
    );
    final client = _MockClient();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.itemsApi).thenReturn(items);
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    sync = _MockSyncService();
    when(() => sync.pluginAvailable).thenReturn(false);
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(
    WidgetTester tester,
    InterfaceLayout layout, {
    Widget home = const HomeSectionsScreen(),
  }) async {
    PlatformDetection.setInterfaceLayout(layout);
    tester.view.physicalSize = const Size(1200, 6000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: home,
      ),
    );
    await tester.pumpAndSettle();
  }

  bool enabledInPrefs(String collection) => prefs.homeSectionsConfig
      .firstWhere((c) => c.stableId == _idOf(collection))
      .enabled;

  double top(WidgetTester tester, String text) =>
      tester.getTopLeft(find.text(text)).dy;

  List<String> enabledOrder() => [
    for (final c
        in prefs.homeSectionsConfig.where((c) => c.enabled).toList()
          ..sort((a, b) => a.order.compareTo(b.order)))
      c.stableId,
  ];

  Future<void> dragDown(
    WidgetTester tester,
    Finder from,
    double distance, {
    required Duration hold,
  }) async {
    final gesture = await tester.startGesture(tester.getCenter(from));
    await tester.pump(hold);
    const steps = 30;
    for (var i = 0; i < steps; i++) {
      await gesture.moveBy(Offset(0, distance / steps));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await tester.pumpAndSettle();
  }

  const longPress = Duration(milliseconds: 600);

  testWidgets('disabled rows wait in a closed group until it opens', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);

    expect(find.text('Enabled'), findsOneWidget);
    expect(find.text('Disabled'), findsOneWidget);
    expect(find.text('Marvel'), findsNothing);

    await tester.tap(find.text('Collections').first);
    await tester.pumpAndSettle();

    for (final name in _collections) {
      expect(find.text(name), findsOneWidget);
      expect(top(tester, name), greaterThan(top(tester, 'Disabled')));
    }
  });

  for (final layout in [InterfaceLayout.phone, InterfaceLayout.tv]) {
    testWidgets('entering the editor on ${layout.name} opens no group', (
      tester,
    ) async {
      // Opened the way Settings opens it, which focuses the first thing it
      // finds before the rows have loaded.
      await pump(
        tester,
        layout,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () =>
                context.pushSettingsScreen(const HomeSectionsScreen()),
            child: const Text('Rows'),
          ),
        ),
      );
      await tester.tap(find.text('Rows'));
      await tester.pumpAndSettle();

      expect(find.text('General'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      // General's rows and the collections stay folded away.
      expect(find.text('Live TV'), findsNothing);
      expect(find.text('Marvel'), findsNothing);
      // A remote lands on the first row rather than the reset button above.
      if (layout == InterfaceLayout.tv) {
        expect(
          FocusManager.instance.primaryFocus?.debugLabel,
          'section_${enabledOrder().first}',
        );
      }
    });
  }

  testWidgets('rows switched off where they live stay out of the editor', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);

    expect(find.text('Seerr'), findsNothing);
    expect(find.text('Genres and Studios'), findsNothing);
  });

  testWidgets('rows switched on where they live sit in their groups', (
    tester,
  ) async {
    await prefs.set(UserPreferences.displayStudiosRows, true);
    await prefs.set(UserPreferences.enableRadarrCalendar, true);
    await prefs.set(UserPreferences.enableSonarrCalendar, true);
    when(() => sync.seerrAvailable).thenReturn(true);
    final seerrPrefs = _MockSeerrPreferences();
    when(() => seerrPrefs.isSeerrHomeRowEnabled(any())).thenAnswer(
      (call) =>
          call.positionalArguments.first == HomeSectionType.seerrShortcuts,
    );
    when(() => seerrPrefs.brand(any())).thenAnswer(
      (i) => i.positionalArguments.first as String,
    );
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);
    await pump(tester, InterfaceLayout.phone);

    await tester.tap(find.text('Seerr'));
    await tester.tap(find.text('Genres and Studios'));
    await tester.pumpAndSettle();

    for (final label in [
      'Seerr Browse',
      'Upcoming Movies (Radarr)',
      'Upcoming TV Shows (Sonarr)',
    ]) {
      expect(top(tester, label), greaterThan(top(tester, 'Seerr')));
    }
    expect(find.text('Studios'), findsOneWidget);
  });

  testWidgets('ticking a grouped row moves it to Enabled and back', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);
    await tester.tap(find.text('Collections').first);
    await tester.pumpAndSettle();
    final handles = find.byIcon(Icons.drag_handle).evaluate().length;

    await tester.tap(find.text('Pixar'));
    await tester.pumpAndSettle();

    expect(enabledInPrefs('Pixar'), isTrue);
    expect(top(tester, 'Pixar'), lessThan(top(tester, 'Disabled')));
    expect(find.byIcon(Icons.drag_handle), findsNWidgets(handles + 1));

    await tester.tap(find.text('Pixar'));
    await tester.pumpAndSettle();

    expect(enabledInPrefs('Pixar'), isFalse);
    expect(top(tester, 'Pixar'), greaterThan(top(tester, 'Disabled')));
    expect(find.byIcon(Icons.drag_handle), findsNWidgets(handles));
  });

  testWidgets('on a phone a long press drags an enabled row to a new place', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);
    final before = enabledOrder();

    await dragDown(tester, find.text('My Media'), 600, hold: longPress);

    expect(enabledOrder(), [...before.skip(1), before.first]);
  });

  testWidgets('a row dropped below the merged tile keeps the pair together', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);
    final before = enabledOrder();
    final mergedTileHeight =
        top(tester, 'Recently Added Media') - top(tester, 'Continue Watching');

    await dragDown(
      tester,
      find.text('My Media'),
      mergedTileHeight,
      hold: longPress,
    );

    expect(enabledOrder(), [before[1], before[2], before[0], before[3]]);
  });

  testWidgets('a row ticked after a drag still lands at the bottom', (
    tester,
  ) async {
    await pump(tester, InterfaceLayout.phone);
    await dragDown(tester, find.text('My Media'), 600, hold: longPress);

    await tester.tap(find.text('General'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Live TV'));
    await tester.pumpAndSettle();

    expect(enabledOrder().last, 'builtin:livetv');
  });

  testWidgets('with a mouse the handle drags straight away', (tester) async {
    await pump(tester, InterfaceLayout.desktop);
    final before = enabledOrder();

    await dragDown(
      tester,
      find.byIcon(Icons.drag_handle).first,
      600,
      hold: Duration.zero,
    );

    expect(enabledOrder(), [...before.skip(1), before.first]);
  });

  testWidgets('on TV a grouped row has no move arrows and Select ticks down '
      'the group', (tester) async {
    await pump(tester, InterfaceLayout.tv);
    await tester.tap(find.text('Collections').first);
    await tester.pumpAndSettle();

    final marvelTile = find.ancestor(
      of: find.text('Marvel'),
      matching: find.byType(ListTile),
    );
    expect(
      find.descendant(of: marvelTile, matching: find.byIcon(Icons.arrow_right)),
      findsNothing,
    );

    Focus.of(tester.element(find.text('Marvel'))).requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();

    expect(enabledInPrefs('Marvel'), isTrue);
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'section_${_idOf('Pixar')}',
    );
  });
}
