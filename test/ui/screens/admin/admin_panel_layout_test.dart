import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/di/providers.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/admin/admin_shell_screen.dart';
import 'package:moonfin/ui/screens/admin/libraries/admin_library_add_screen.dart';
import 'package:moonfin/ui/screens/admin/plugins/admin_plugin_detail_screen.dart';
import 'package:moonfin/ui/screens/admin/providers/admin_user_providers.dart';
import 'package:moonfin/ui/screens/admin/widgets/admin_form_styles.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<MediaServerClient>(
      _MockMediaServerClient(),
    );
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  void setWindow(WidgetTester tester, Size size) {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
  }

  Widget app(Widget home, {List<Override> overrides = const []}) =>
      ProviderScope(
        overrides: overrides,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: home),
        ),
      );

  Future<GoRouter> pumpShell(WidgetTester tester, List<String> pages) async {
    final router = GoRouter(
      initialLocation: '/admin/${pages.first}',
      routes: [
        ShellRoute(
          navigatorKey: AdminShellScreen.navigatorKey,
          builder: (context, state, child) => AdminShellScreen(child: child),
          routes: [
            for (final page in pages)
              GoRoute(path: '/admin/$page', builder: (_, _) => Text(page)),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [socketHandlerProvider.overrideWithValue(SocketHandler())],
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
    return router;
  }

  testWidgets('library type buttons stay button sized on a wide panel', (
    tester,
  ) async {
    setWindow(tester, const Size(1600, 1000));
    await tester.pumpWidget(app(const AdminLibraryAddScreen()));
    await tester.pumpAndSettle();
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    final tile = find.ancestor(
      of: find.text(l10n.movies),
      matching: find.byType(InkWell),
    );

    expect(tester.getSize(tile).height, 64);
  });

  testWidgets('a glass group row highlights inside the rounded corners', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => adminGlassGroup(
              context,
              children: [ListTile(title: const Text('Movies'), onTap: () {})],
            ),
          ),
        ),
      ),
    );

    // The row's ink lands on the nearest Material, which has to be one that
    // clips to the group's corners.
    final inkLayer = tester.widget<Material>(
      find
          .ancestor(of: find.byType(ListTile), matching: find.byType(Material))
          .first,
    );

    expect(inkLayer.clipBehavior, Clip.antiAlias);
    expect(
      inkLayer.shape,
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    );
  });

  testWidgets('a plugin page leaves going back to the admin bar', (
    tester,
  ) async {
    setWindow(tester, const Size(390, 844));
    const plugin = PluginInfo(name: 'AudioDB', id: 'audiodb', version: '1.0');
    await tester.pumpWidget(
      app(
        const AdminPluginDetailScreen(pluginId: 'audiodb'),
        overrides: [
          adminInstalledPluginsProvider.overrideWith((ref) async => [plugin]),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('AudioDB'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });

  testWidgets('the page being left is covered while the next one fades in', (
    tester,
  ) async {
    setWindow(tester, const Size(1400, 900));
    final router = await pumpShell(tester, ['one', 'two']);

    router.go('/admin/two');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Both pages are still up part way through, and the incoming one paints
    // a solid backing between its content and the page it replaces.
    expect(find.text('one'), findsOneWidget);
    final nearestBacking = tester.widget(
      find
          .ancestor(
            of: find.text('two'),
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is DecoratedBox &&
                  widget.decoration is BoxDecoration &&
                  (widget.decoration as BoxDecoration).gradient != null,
            ),
          )
          .first,
    );
    expect(
      find.ancestor(
        of: find.text('one'),
        matching: find.byWidget(nearestBacking),
      ),
      findsNothing,
    );

    await tester.pumpAndSettle();
    expect(find.text('one'), findsNothing);
  });

  testWidgets('a page takes the new backing when the window changes layout', (
    tester,
  ) async {
    setWindow(tester, const Size(1400, 900));
    await pumpShell(tester, ['one']);

    // The panel color sits between the backdrop and the page only in the
    // wide layout.
    final surface = ThemeData().colorScheme.surface;
    final panelBacking = find.ancestor(
      of: find.text('one'),
      matching: find.byWidgetPredicate(
        (widget) => widget is ColoredBox && widget.color == surface,
      ),
    );
    expect(panelBacking, findsOneWidget);

    tester.view.physicalSize = const Size(500, 900);
    await tester.pumpAndSettle();

    expect(panelBacking, findsNothing);
  });
}
