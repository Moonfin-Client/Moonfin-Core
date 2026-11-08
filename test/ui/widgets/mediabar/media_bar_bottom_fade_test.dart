import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/media_bar.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Backdrops extends Mock implements BackgroundService {}

class _ViewModel extends ChangeNotifier implements MediaBarViewModel {
  static const item = MediaBarSlideItem(
    itemId: 'film',
    serverId: 'server',
    title: 'The Film',
    year: 2020,
    backdropUrl: 'http://server/backdrop',
  );

  @override
  List<MediaBarSlideItem> get items => [item];

  @override
  MediaBarState get state => MediaBarReady([item]);

  @override
  Map<String, double> ratingsFor(String itemId) => const {};

  @override
  Future<void> ensureRatings(String itemId) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.mediaBarAutoAdvance, false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    final manager = PlaybackManager();
    GetIt.instance
      ..registerSingleton<BackgroundService>(_Backdrops())
      ..registerSingleton<PlaybackManager>(manager)
      ..registerSingleton<PlaybackArbiter>(PlaybackArbiter())
      ..registerSingleton<ScreensaverController>(
        ScreensaverController(prefs, manager),
      );
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    GetIt.instance<ScreensaverController>().dispose();
    GetIt.instance<PlaybackManager>().dispose();
    await GetIt.instance.reset();
  });

  Future<bool> fades(WidgetTester tester, {required double rowPeek}) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: MediaBar(
            viewModel: _ViewModel(),
            prefs: prefs,
            height: 600,
            rowPeek: rowPeek,
          ),
        ),
      ),
    );
    final found = find.byType(ShaderMask).evaluate().isNotEmpty;
    await tester.pumpWidget(const SizedBox());
    return found;
  }

  testWidgets('a peeking row gets a faded backdrop on desktop', (tester) async {
    expect(await fades(tester, rowPeek: 120), isTrue);
  });

  testWidgets('so does the MakD layout', (tester) async {
    await prefs.set(
      UserPreferences.mediaBarMode,
      UserPreferences.mediaBarModeMakd,
    );
    expect(await fades(tester, rowPeek: 120), isTrue);
  });

  testWidgets('the backdrop still fades with no row peeking', (tester) async {
    expect(await fades(tester, rowPeek: 0), isTrue);
  });

  testWidgets('a TV keeps the hard edge', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    expect(await fades(tester, rowPeek: 120), isFalse);
    expect(await fades(tester, rowPeek: 0), isFalse);
  });
}
