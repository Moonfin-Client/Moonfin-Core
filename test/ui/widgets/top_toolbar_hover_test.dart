import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
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

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

Widget _host(Widget chrome) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: chrome),
  );
}

final _homeButton = find.byKey(const ValueKey('toolbar_home'));

/// An unexpanded button holds only an icon, so finding a Text means the label
/// animated in.
final _homeLabel = find.descendant(
  of: _homeButton,
  matching: find.byType(Text),
);

FocusNode _homeFocusNode(WidgetTester tester) => tester
    .widget<Focus>(
      find.descendant(of: _homeButton, matching: find.byType(Focus)).first,
    )
    .focusNode!;

Future<TestGesture> _mouseOver(WidgetTester tester, Finder target) async {
  final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
  addTearDown(mouse.removePointer);
  await mouse.addPointer(location: Offset.zero);
  await mouse.moveTo(tester.getCenter(target));
  return mouse;
}

void main() {
  setUp(() async {
    // Hover only exists off TV, and the toolbar sizes itself from the form
    // factor.
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
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
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  Future<void> pumpToolbar(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(_host(const TopToolbar()));
  }

  testWidgets('a nav item expands on the frame the pointer arrives', (
    tester,
  ) async {
    await pumpToolbar(tester);
    expect(_homeLabel, findsNothing);

    await _mouseOver(tester, _homeButton);
    // No elapsed duration. A dwell timer would still be pending here.
    await tester.pump();

    expect(_homeLabel, findsOneWidget);
  });

  testWidgets('a nav item stays expanded while the pointer rests on it', (
    tester,
  ) async {
    await pumpToolbar(tester);

    final focusNode = _homeFocusNode(tester);
    focusNode.requestFocus();
    await tester.pump();

    await _mouseOver(tester, _homeButton);
    await tester.pump();
    expect(_homeLabel, findsOneWidget);

    // Losing focus must not take the hover with it, or the button goes dark
    // under a pointer that never moved.
    focusNode.unfocus();
    await tester.pump();

    expect(_homeLabel, findsOneWidget);
  });

  testWidgets('a nav item collapses once the pointer leaves', (tester) async {
    await pumpToolbar(tester);

    final mouse = await _mouseOver(tester, _homeButton);
    await tester.pump();
    expect(_homeLabel, findsOneWidget);

    await mouse.moveTo(const Offset(2000, 2000));
    await tester.pump();

    expect(_homeLabel, findsNothing);
  });
}
