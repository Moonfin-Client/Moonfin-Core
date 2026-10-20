import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/route_lifecycle_observer.dart';
import 'package:moonfin/ui/widgets/left_sidebar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
import 'package:moonfin/util/focus/input_mode_tracker.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;

  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  @override
  bool get seerrAvailable => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

Widget _host(Widget chrome) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: chrome),
  );
}

/// Hosts the sidebar the way a browser does, where the arrow keys scroll
/// instead of moving focus.
Widget _webLikeHost() {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    shortcuts: <ShortcutActivator, Intent>{
      ...WidgetsApp.defaultShortcuts,
      const SingleActivator(LogicalKeyboardKey.arrowUp): const ScrollIntent(
        direction: AxisDirection.up,
      ),
      const SingleActivator(LogicalKeyboardKey.arrowDown): const ScrollIntent(
        direction: AxisDirection.down,
      ),
    },
    home: const InputModeTracker(child: Scaffold(body: LeftSidebar())),
  );
}

/// Opens the desktop rail with the Home item focused.
Future<void> _openDesktopSidebar(WidgetTester tester) async {
  await tester.pumpWidget(_webLikeHost());
  // The rail ignores focus for a moment after it mounts.
  await tester.pump(const Duration(milliseconds: 700));
  NavigationLayout.focusNavbarNotifier.value!();
  // Let the rail start widening before the labels arrive, as it does on a
  // real frame clock.
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 50));
  await tester.pumpAndSettle();
}

String? _focusedLabel() => FocusManager.instance.primaryFocus?.debugLabel;

Color? _backgroundOf(WidgetTester tester, Finder within) {
  final container = tester.widget<AnimatedContainer>(
    find.descendant(of: within, matching: find.byType(AnimatedContainer)),
  );
  return (container.decoration as BoxDecoration?)?.color;
}

Finder _focusLabelled(String label) => find.byWidgetPredicate(
  (widget) => widget is Focus && widget.focusNode?.debugLabel == label,
);

bool _railHasFocus() =>
    NavigationLayout.chromeFocusRoots.any((root) => root.hasFocus);

/// Home screen with the rail, plus a Search screen it can push.
class _RailHost {
  _RailHost._(this.router, this.content);

  final GoRouter router;
  final FocusNode content;

  /// Mounts the host with the rail open on Home.
  static Future<_RailHost> pump(
    WidgetTester tester, {
    bool searchHasRail = false,
    bool instantFocusedSearch = false,
  }) async {
    final content = FocusNode(debugLabel: 'Content');
    addTearDown(content.dispose);
    final router = GoRouter(
      initialLocation: '/home',
      observers: [routeLifecycleObserver],
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, _) => Scaffold(
            body: Row(
              children: [
                SizedBox(
                  width: 280,
                  child: LeftSidebar(
                    activeRoute: '/home',
                    contentFocusNode: content,
                  ),
                ),
                Expanded(
                  child: Focus(focusNode: content, child: const SizedBox()),
                ),
              ],
            ),
          ),
        ),
        GoRoute(
          path: '/search',
          // go_router uses builder when pageBuilder is null.
          pageBuilder: instantFocusedSearch
              ? (_, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  transitionsBuilder: (_, _, _, child) => child,
                  child: const Scaffold(
                    body: Focus(autofocus: true, child: SizedBox()),
                  ),
                )
              : null,
          builder: (_, _) => Scaffold(
            body: searchHasRail
                ? const SizedBox(
                    width: 280,
                    child: LeftSidebar(activeRoute: '/search'),
                  )
                : null,
          ),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    // The rail ignores focus for a moment after it mounts.
    await tester.pump(const Duration(milliseconds: 700));
    NavigationLayout.focusNavbarNotifier.value!();
    await tester.pumpAndSettle();
    return _RailHost._(router, content);
  }

  /// Opens Search from the rail.
  Future<void> openSearchFromRail(WidgetTester tester) async {
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect(router.state.uri.path, '/search');
  }
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final getIt = GetIt.instance;
    getIt.registerSingleton<PreferenceStore>(store);
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<UserRepository>(_FakeUserRepository());
    getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
    getIt.registerSingleton<PluginSyncService>(_FakePluginSyncService());
    getIt.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, _FakeSessionRepository()),
    );
    getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  });

  tearDown(() async {
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  testWidgets('sidebar registers its focus root only while mounted',
      (tester) async {
    await tester.pumpWidget(_host(const LeftSidebar()));
    expect(NavigationLayout.chromeFocusRoots, hasLength(1));

    await tester.pumpWidget(_host(const SizedBox.shrink()));
    expect(NavigationLayout.chromeFocusRoots, isEmpty);
  });

  testWidgets('toolbar registers its focus root only while mounted',
      (tester) async {
    await tester.pumpWidget(_host(const TopToolbar()));
    expect(NavigationLayout.chromeFocusRoots, hasLength(1));

    await tester.pumpWidget(_host(const SizedBox.shrink()));
    expect(NavigationLayout.chromeFocusRoots, isEmpty);
  });

  final linux = TargetPlatformVariant.only(TargetPlatform.linux);

  group('desktop sidebar keyboard navigation', () {
    setUp(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop),
    );
    tearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );

    testWidgets('Up and Down move focus between the menu items', (
      tester,
    ) async {
      await _openDesktopSidebar(tester);
      expect(_focusedLabel(), 'LeftSidebarHome');

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), isNot('LeftSidebarHome'));

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarHome');
    }, variant: linux);

    testWidgets('holding Down keeps moving focus', (tester) async {
      await _openDesktopSidebar(tester);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      final afterPress = FocusManager.instance.primaryFocus;
      expect(afterPress?.debugLabel, isNot('LeftSidebarHome'));

      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowDown);
      expect(FocusManager.instance.primaryFocus, isNot(afterPress));
    }, variant: linux);

    testWidgets('Up and Down stop at the ends without leaving the menu', (
      tester,
    ) async {
      await _openDesktopSidebar(tester);
      final sidebar = NavigationLayout.chromeFocusRoots.single;

      for (var i = 0; i < 12; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();
      }
      expect(sidebar.hasFocus, isTrue);
      expect(_focusedLabel(), 'LeftSidebarSettings');

      for (var i = 0; i < 12; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pumpAndSettle();
      }
      expect(_focusedLabel(), 'LeftSidebarProfile');
    }, variant: linux);

    testWidgets('the focused menu item is highlighted', (tester) async {
      await _openDesktopSidebar(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();

      expect(_focusedLabel(), 'LeftSidebarHome');
      expect(
        _backgroundOf(tester, _focusLabelled('LeftSidebarHome')),
        isNot(Colors.transparent),
      );
    }, variant: linux);

    testWidgets('Up from Home reaches the profile button and highlights it', (
      tester,
    ) async {
      await _openDesktopSidebar(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarProfile');
      expect(
        _backgroundOf(tester, _focusLabelled('LeftSidebarProfile')),
        isNot(Colors.transparent),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarHome');
    }, variant: linux);

    testWidgets('a mouse user gets no focus highlight', (tester) async {
      await _openDesktopSidebar(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarProfile');

      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      await mouse.moveTo(const Offset(600, 400));
      await tester.pumpAndSettle();

      expect(_focusedLabel(), 'LeftSidebarProfile');
      expect(
        _backgroundOf(tester, _focusLabelled('LeftSidebarProfile')),
        Colors.transparent,
      );
      await mouse.removePointer();
    }, variant: linux);

    testWidgets('the first Left press opens the rail after backing out of a '
        'pushed screen that left focus on the content', (tester) async {
      final rail = await _RailHost.pump(tester);
      await rail.openSearchFromRail(tester);

      // Back restores focus to the content, not the rail.
      rail.content.requestFocus();
      rail.router.pop();
      await tester.pumpAndSettle();
      expect(rail.content.hasFocus, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_railHasFocus(), isTrue);
    }, variant: linux);

    testWidgets('Left right after Back opens the rail', (tester) async {
      final rail = await _RailHost.pump(tester);
      await rail.openSearchFromRail(tester);

      rail.content.requestFocus();
      rail.router.pop();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_railHasFocus(), isTrue);
      expect(find.text('Search'), findsOneWidget);
    }, variant: linux);

    testWidgets('Back onto the rail item hands focus to the content instead '
        'of opening the rail', (tester) async {
      final rail = await _RailHost.pump(tester);
      await rail.openSearchFromRail(tester);

      rail.router.pop();
      await tester.pumpAndSettle();
      expect(rail.content.hasFocus, isTrue);
      expect(find.text('Search'), findsNothing);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_railHasFocus(), isTrue);
    }, variant: linux);

    testWidgets('the navbar handoff opens the rail after Back', (
      tester,
    ) async {
      final rail = await _RailHost.pump(tester);
      await rail.openSearchFromRail(tester);

      rail.content.requestFocus();
      rail.router.pop();
      await tester.pumpAndSettle();

      NavigationLayout.focusNavbarNotifier.value!();
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarHome');
      expect(_railHasFocus(), isTrue);
    }, variant: linux);

    testWidgets('Back from a screen the rail did not open still opens the '
        'rail when focus returns to it', (tester) async {
      final rail = await _RailHost.pump(tester);
      rail.router.push('/search');
      await tester.pumpAndSettle();

      rail.router.pop();
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarHome');
      expect(find.text('Search'), findsOneWidget);
    }, variant: linux);

    testWidgets('Home in a pushed screen\'s rail lands on the content with '
        'the home rail closed', (tester) async {
      final rail = await _RailHost.pump(tester, searchHasRail: true);
      await rail.openSearchFromRail(tester);

      NavigationLayout.focusNavbarNotifier.value!();
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'LeftSidebarHome');
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(rail.router.state.uri.path, '/home');
      expect(rail.content.hasFocus, isTrue);
      expect(find.text('Search'), findsNothing);
    }, variant: linux);

    testWidgets('Back with no transition skips the closed screen\'s focus', (
      tester,
    ) async {
      final rail = await _RailHost.pump(tester, instantFocusedSearch: true);
      await rail.openSearchFromRail(tester);

      rail.router.pop();
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(rail.content.hasFocus, isTrue);
    }, variant: linux);
  });
}
