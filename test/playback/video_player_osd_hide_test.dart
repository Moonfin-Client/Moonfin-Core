import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/cast_service.dart';
import 'package:moonfin/data/services/cast/cast_target.dart';
import 'package:moonfin/data/services/cast/native_airplay_channel.dart';
import 'package:moonfin/data/services/cast/native_cast_channel.dart';
import 'package:moonfin/data/services/cast/native_dlna_channel.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/theme_music_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/platform/pip_service.dart';
import 'package:moonfin/playback/playback_lifecycle_handler.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/video_player_screen.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/playback/skip_segment_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';

import '../util/media_segment_fakes.dart';

class _Client extends Fake implements MediaServerClient {
  final items = FakeItemsApi();

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  ItemsApi get itemsApi => items;

  @override
  TrickplayApi? get trickplayApi => null;
}

class _Factory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String id) => null;
}

class _Cast extends Fake implements CastService {
  @override
  final activeKindNotifier = ValueNotifier<CastTargetKind?>(null);
  @override
  CastTargetKind? get activeKind => null;
}

class _ThemeMusic extends Fake implements ThemeMusicService {
  @override
  void setExternalAudioActive(bool active) {}
}

class _Screensaver extends Fake implements ScreensaverController {
  @override
  void setPlaybackActive(bool active) {}
}

class _Lifecycle extends Fake implements PlaybackLifecycleHandler {}

class _Users extends Fake implements UserRepository {
  @override
  User? get currentUser => null;
}

class _Manager extends PlaybackManager {
  final transport = <String>[];
  final seeks = <Duration>[];
  int stopCalls = 0;
  int nextInQueueCalls = 0;
  PlaybackBringupState bringup = const PlaybackBringupState.idle();

  @override
  PlaybackBringupState get bringupState => bringup;

  @override
  Future<void> pause() async => transport.add('pause');

  @override
  Future<void> resume() async => transport.add('resume');

  @override
  Future<void> seekTo(Duration position) async => seeks.add(position);

  @override
  Future<void> stop({bool userInitiated = true}) async {
    stopCalls++;
  }

  @override
  Future<void> nextInQueue() async {
    nextInQueueCalls++;
    queueService.next();
  }
}

void main() {
  late _Manager manager;
  late _Client client;
  late PipService pip;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    manager = _Manager();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    client = _Client();
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<MediaServerClientFactory>(_Factory());
    GetIt.instance.registerSingleton<CastService>(_Cast());
    GetIt.instance.registerSingleton<NativeCastChannel>(NativeCastChannel());
    GetIt.instance.registerSingleton<NativeDlnaChannel>(NativeDlnaChannel());
    GetIt.instance.registerSingleton<NativeAirPlayChannel>(
      NativeAirPlayChannel(),
    );
    pip = PipService();
    GetIt.instance.registerSingleton<PipService>(pip);
    GetIt.instance.registerSingleton<PlaybackLifecycleHandler>(_Lifecycle());
    GetIt.instance.registerSingleton<ThemeMusicService>(_ThemeMusic());
    GetIt.instance.registerSingleton<ScreensaverController>(_Screensaver());
    GetIt.instance.registerSingleton<UserRepository>(_Users());
  });

  tearDown(() async {
    manager.dispose();
    pip.dispose();
    await GetIt.instance.reset();
  });

  Future<void> mountPlayer(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('desktop Escape and Cinema Skip dismiss keys', (tester) async {
    var fullscreen = true;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('window_manager'),
      (call) async {
        if (call.method == 'isFullScreen') return fullscreen;
        if (call.method == 'setFullScreen') {
          fullscreen = (call.arguments as Map)['isFullScreen'] as bool;
        }
        if (call.method == 'isVisible') return true;
        return call.method.startsWith('is') ? false : null;
      },
    );
    addTearDown(() => tester.binding.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'), null));
    await GetIt.instance<UserPreferences>()
        .set(UserPreferences.cinemaModeSkipEnabled, true);
    manager.queueService.setQueue([
      {'Id': 'trailer', '__moonfinIsPreroll': true, 'RunTimeTicks': 900000000},
    ]);
    await mountPlayer(tester);
    final skip = find.byType(SkipSegmentOverlay);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(fullscreen, isFalse);
    expect(skip, findsOneWidget);

    for (final key in [
      LogicalKeyboardKey.backspace,
      LogicalKeyboardKey.delete,
    ]) {
      await tester.sendKeyEvent(key);
      await tester.pump();
      expect(skip, findsNothing);
      await tester.sendKeyEvent(key);
      await tester.pump();
      expect(manager.stopCalls, 0);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      expect(skip, findsOneWidget);
    }
    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  testWidgets('moving the mouse after the X keeps Cinema Skip hidden', (
    tester,
  ) async {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('window_manager'),
      (call) async {
        if (call.method == 'isVisible') return true;
        return call.method.startsWith('is') ? false : null;
      },
    );
    addTearDown(() => tester.binding.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'), null));
    await GetIt.instance<UserPreferences>()
        .set(UserPreferences.cinemaModeSkipEnabled, true);
    manager.queueService.setQueue([
      {'Id': 'trailer', '__moonfinIsPreroll': true, 'RunTimeTicks': 900000000},
    ]);
    await mountPlayer(tester);
    final skip = find.byType(SkipSegmentOverlay);

    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pump();
    expect(skip, findsNothing);

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: const Offset(100, 300));
    await tester.pump(const Duration(seconds: 2));
    await mouse.moveTo(const Offset(300, 300));
    await tester.pump();
    expect(skip, findsNothing);
    await mouse.removePointer();
    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  testWidgets('with Cinema Skip off, Escape in a pre-roll still exits', (
    tester,
  ) async {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('window_manager'),
      (call) async {
        if (call.method == 'isFullScreen' || call.method == 'isVisible') {
          return true;
        }
        return call.method.startsWith('is') ? false : null;
      },
    );
    addTearDown(() => tester.binding.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'), null));
    // Leaving playback resets the orientations, which waits on this channel.
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (_) async => null,
    );
    addTearDown(() => tester.binding.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null));
    manager.queueService.setQueue([
      {'Id': 'trailer', '__moonfinIsPreroll': true, 'RunTimeTicks': 900000000},
    ]);
    final router = GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(path: '/home', builder: (_, _) => const SizedBox()),
        GoRoute(path: '/play', builder: (_, _) => const VideoPlayerScreen()),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
      ),
    );
    router.push('/play');
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(manager.stopCalls, 1);
    expect(find.byType(VideoPlayerScreen), findsNothing);
    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  testWidgets('Back hides, Right reveals, Select and Fast Forward advance', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.cinemaModeSkipEnabled,
      true,
    );
    manager.queueService.setQueue([
      {'Id': 'first', '__moonfinIsPreroll': true, 'RunTimeTicks': 900000000},
      {'Id': 'second', '__moonfinIsPreroll': true, 'RunTimeTicks': 450000000},
      {'Id': 'short', '__moonfinIsPreroll': true, 'RunTimeTicks': 50000000},
    ]);
    await mountPlayer(tester);
    final button = find.byType(SkipSegmentOverlay);
    expect(
      tester.widget<SkipSegmentOverlay>(button).focusNode!.hasPrimaryFocus,
      isTrue,
    );
    await tester.sendKeyEvent(
      LogicalKeyboardKey.goBack,
      physicalKey: PhysicalKeyboardKey.escape,
    );
    await tester.pumpAndSettle();
    expect(button, findsNothing);
    expect(manager.queueService.currentIndex, 0);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(button, findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(manager.queueService.currentIndex, 1);
    expect(tester.widget<SkipSegmentOverlay>(button).segment.itemId, 'second');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
    await tester.pump();
    expect(manager.queueService.currentIndex, 2);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('short Cinema pre-roll blocks ordinary intro/outro actions', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(UserPreferences.cinemaModeSkipEnabled, true);
    await prefs.set(UserPreferences.mediaSegmentActions, 'intro:skip,outro:skip');
    (GetIt.instance<MediaServerClient>() as _Client).items.segments = [
      segmentJson(id: 'intro', type: 'Intro', startMs: 1000, endMs: 2000),
      segmentJson(id: 'outro', type: 'Outro', startMs: 3000, endMs: 4000),
    ];
    manager.queueService.setQueue([
      const AggregatedItem(
        id: 'short',
        serverId: 'server',
        rawData: {
          'Id': 'short',
          '__moonfinIsPreroll': true,
          'RunTimeTicks': 50000000,
          'Chapters': [{'StartPositionTicks': 0}],
        },
      ),
    ]);
    await mountPlayer(tester);
    expect(find.byType(SkipSegmentOverlay), findsNothing);
    manager.state.setPosition(const Duration(milliseconds: 1500));
    await tester.pump();
    manager.state.setPosition(const Duration(milliseconds: 3500));
    await tester.pump();
    expect(manager.seeks, isEmpty);
    expect(manager.stopCalls, 0);
    await prefs.set(UserPreferences.cinemaModeSkipEnabled, false);
    manager.state.setPosition(const Duration(milliseconds: 1500));
    await tester.pump();
    expect(manager.seeks, [const Duration(seconds: 2)]);
    await tester.pumpWidget(const SizedBox());
  });

  // Issue #1688: a resume that takes longer than the hide delay to start
  // playing left the controls up until a key was pressed.
  testWidgets('controls hide after a start slower than the hide delay', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    await tester.pump();
    expect(find.byType(Slider), findsOneWidget);

    await tester.pump(const Duration(seconds: 10));
    expect(
      find.byType(Slider),
      findsOneWidget,
      reason: 'nothing is playing yet, so the controls stay',
    );

    manager.state.setPlaying(true);
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(Slider), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  // Issue #1751: the unlock prompt sits at the end of the top bar, where the
  // lock button was, instead of over the middle of the picture.
  for (final direction in TextDirection.values) {
    testWidgets('locking puts the unlock prompt at the top end in $direction', (
      tester,
    ) async {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.osdLockEnabled,
        true,
      );
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          builder: (context, child) =>
              Directionality(textDirection: direction, child: child!),
          home: const VideoPlayerScreen(),
        ),
      );
      await tester.pump();

      // The player holds a single tap until its double-tap timeout runs out.
      await tester.tap(find.byIcon(Icons.lock_outline));
      await tester.pump(const Duration(milliseconds: 500));

      final prompt = tester.getRect(find.text('Long press to unlock'));
      final screen = tester.getRect(find.byType(VideoPlayerScreen));
      expect(prompt.top, lessThan(screen.height / 4));
      if (direction == TextDirection.ltr) {
        expect(prompt.left, greaterThan(screen.width / 2));
      } else {
        expect(prompt.right, lessThan(screen.width / 2));
      }

      await tester.pumpWidget(const SizedBox());
    });
  }

  // Issue #985: a click plays or pauses at once and a double-click toggles
  // fullscreen, putting back what its first click did to playback.
  testWidgets('desktop click pauses and double-click toggles fullscreen', (
    tester,
  ) async {
    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('window_manager'),
      (call) async {
        calls.add(call);
        if (call.method == 'isVisible') return true;
        return call.method.startsWith('is') ? false : null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('window_manager'),
        null,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    manager.state.setPlaying(true);
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(Slider), findsNothing);

    await tester.tapAt(const Offset(100, 300));
    await tester.pump();
    expect(manager.transport, ['pause']);
    expect(find.byType(Slider), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(calls.where((c) => c.method == 'setFullScreen'), isEmpty);

    manager.transport.clear();
    await tester.tapAt(const Offset(100, 300));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tapAt(const Offset(100, 300));
    await tester.pumpAndSettle();
    expect(manager.transport, ['pause', 'resume']);
    expect(
      calls.where((c) => c.method == 'setFullScreen').map((c) => c.arguments),
      [
        {'isFullScreen': true},
      ],
    );

    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  // Issue #1305: off TV the transport sits where the paused description card
  // goes, so the card waits for the controls, which still hide while paused.
  group('paused description card', () {
    Future<void> pumpPlayer(WidgetTester tester) async {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.showDescriptionOnPause,
        true,
      );
      manager.queueService.setQueue([
        {'Name': 'Movie', 'Overview': 'A quiet story.'},
      ]);
      manager.bringup = const PlaybackBringupState(
        phase: PlaybackBringupPhase.ready,
      );
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          home: const VideoPlayerScreen(),
        ),
      );
      await tester.pump();
    }

    double cardOpacity(WidgetTester tester) => tester
        .widget<AnimatedOpacity>(
          find
              .ancestor(
                of: find.text('A quiet story.'),
                matching: find.byType(AnimatedOpacity),
              )
              .first,
        )
        .opacity;

    testWidgets('waits for the controls to hide', (tester) async {
      await pumpPlayer(tester);
      expect(find.byType(Slider), findsOneWidget);
      expect(cardOpacity(tester), 0);

      await tester.pump(const Duration(seconds: 10));
      expect(find.byType(Slider), findsNothing);
      expect(cardOpacity(tester), 1);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('shows a couple of seconds after a pause', (tester) async {
      await pumpPlayer(tester);
      manager.state.setPlaying(true);
      await tester.pump();
      await tester.pump();
      manager.state.setPlaying(false);
      await tester.pump();
      await tester.pump();
      expect(find.byType(Slider), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 2100));
      expect(find.byType(Slider), findsNothing);
      expect(cardOpacity(tester), 1);

      await tester.pumpWidget(const SizedBox());
    });
  });

  // Issue #1305: with the controls hidden, a keyboard seek only shows how far
  // it went.
  testWidgets('arrow keys seek without bringing the controls up', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    manager.state.setPlaying(true);
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(Slider), findsNothing);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(find.byType(Slider), findsNothing);
    expect(find.text('30 seconds'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    expect(find.text('30 seconds'), findsNothing);

    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  // Issue #1335: S, or Enter while the skip button shows, skips the intro.
  for (final key in [LogicalKeyboardKey.keyS, LogicalKeyboardKey.enter]) {
    testWidgets('${key.keyLabel} skips the intro on offer', (tester) async {
      client.items.segments = [
        segmentJson(id: 'intro', type: 'Intro', startMs: 0, endMs: 90000),
      ];
      manager.queueService.setQueue([
        AggregatedItem(
          id: 'ep1',
          serverId: 'server',
          rawData: const {'Id': 'ep1', 'Type': 'Episode'},
        ),
      ]);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          home: const VideoPlayerScreen(),
        ),
      );
      manager.state.setPlaying(true);
      await tester.pump();
      await tester.pump(const Duration(seconds: 10));
      expect(find.byType(Slider), findsNothing);

      manager.state.setPosition(const Duration(seconds: 5));
      await tester.pump();
      await tester.pump();
      expect(find.textContaining('Skip'), findsOneWidget);

      await tester.sendKeyEvent(key);
      await tester.pump();
      expect(manager.seeks, [const Duration(seconds: 90)]);
      expect(manager.transport, isEmpty);

      await tester.pumpWidget(const SizedBox());
    }, variant: TargetPlatformVariant.only(TargetPlatform.windows));
  }
}
