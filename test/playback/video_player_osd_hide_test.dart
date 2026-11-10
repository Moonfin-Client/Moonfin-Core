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
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/video_player_screen.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/playback/skip_segment_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';

import '../util/media_segment_fakes.dart';

class _Images extends Fake implements ImageApi {
  @override
  String getChapterImageUrl(
    String itemId, {
    required int index,
    int? maxWidth,
    String? tag,
  }) => 'https://server/$itemId/chapter/$index?tag=$tag';
}

class _UserLibrary implements UserLibraryApi {
  final markedPlayed = <String>[];

  @override
  Future<void> markPlayed(String itemId) async => markedPlayed.add(itemId);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Client extends Fake implements MediaServerClient {
  final items = FakeItemsApi();
  final userLibrary = _UserLibrary();

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  ItemsApi get itemsApi => items;

  @override
  ImageApi get imageApi => _Images();

  @override
  UserLibraryApi get userLibraryApi => userLibrary;

  @override
  TrickplayApi? get trickplayApi => null;
}

class _Factory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String id) => null;
}

class _Cast extends Fake implements CastService {
  final calls = <String>[];
  @override
  final activeKindNotifier = ValueNotifier<CastTargetKind?>(null);
  @override
  final castItemNotifier = ValueNotifier<AggregatedItem?>(null);
  @override
  final remoteStateNotifier = ValueNotifier<String?>(null);
  @override
  final remotePositionNotifier = ValueNotifier<int>(0);
  @override
  CastTargetKind? get activeKind => activeKindNotifier.value;

  @override
  Stream<CastTarget> discoverTargetsStreamed(AggregatedItem item) =>
      Stream.value(
        const CastTarget(
          id: 'tv',
          kind: CastTargetKind.googleCast,
          title: 'Living Room',
        ),
      );

  @override
  Future<void> playToTarget(
    CastTarget target, {
    required AggregatedItem item,
    List<AggregatedItem>? queueItems,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    castItemNotifier.value = item;
    activeKindNotifier.value = target.kind;
    remotePositionNotifier.value = startPositionTicks ?? 0;
  }

  @override
  Future<void> play(CastTargetKind kind) async => calls.add('play');

  @override
  Future<void> pause(CastTargetKind kind) async => calls.add('pause');

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async =>
      calls.add('seek ${positionTicks ~/ 10000000}s');
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
  int finishedStopCalls = 0;
  int nextInQueueCalls = 0;
  PlaybackBringupState bringup = const PlaybackBringupState.idle();
  StreamResolutionResult? resolution;

  @override
  PlaybackBringupState get bringupState => bringup;

  @override
  StreamResolutionResult? get currentResolution => resolution;

  // The real calls run too, since they record the viewer's pause.
  @override
  Future<void> pause() async {
    transport.add('pause');
    await super.pause();
  }

  @override
  Future<void> resume() async {
    transport.add('resume');
    await super.resume();
  }

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    await super.seekTo(position);
  }

  @override
  Future<void> stop({bool userInitiated = true}) async {
    stopCalls++;
  }

  @override
  Future<void> stopAsFinished() async {
    finishedStopCalls++;
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

  /// Mounts the player over a home route, so leaving it goes back there.
  Future<void> mountRoutedPlayer(WidgetTester tester) async {
    // Leaving playback resets the orientations, which waits on this channel.
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (_) async => null,
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
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

  // Issue #1886: on TV, Up from the seek bar never reached the skip button
  // sitting just above it.
  testWidgets('on TV, Up from the seek bar reaches the skip button', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
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
    await mountPlayer(tester);
    manager.state.setPosition(const Duration(seconds: 5));
    await tester.pump();
    await tester.pump();
    final skip = tester
        .widget<SkipSegmentOverlay>(find.byType(SkipSegmentOverlay))
        .focusNode!;

    // Focus moves wait for a frame and retry a moment later, so this keeps
    // frames coming the way playing video does.
    Future<void> press(LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      for (var i = 0; i < 3; i++) {
        tester.binding.scheduleFrame();
        await tester.pump(const Duration(milliseconds: 60));
      }
    }

    expect(skip.hasPrimaryFocus, isTrue);
    await press(LogicalKeyboardKey.arrowDown);
    await press(LogicalKeyboardKey.arrowLeft);
    expect(skip.hasPrimaryFocus, isFalse);
    await press(LogicalKeyboardKey.arrowDown);
    await press(LogicalKeyboardKey.arrowUp);
    expect(skip.hasPrimaryFocus, isFalse, reason: 'the seek bar comes first');
    await press(LogicalKeyboardKey.arrowUp);
    expect(skip.hasPrimaryFocus, isTrue);

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

  testWidgets('an automatic credits skip leaves the last episode finished', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(UserPreferences.mediaSegmentActions, 'outro:skip');
    client.items.segments = [
      segmentJson(id: 'outro', type: 'Outro', startMs: 3000, endMs: 4000),
    ];
    final raw = <String, dynamic>{'Id': 'ep1', 'Type': 'Episode'};
    manager.queueService.setQueue([
      AggregatedItem(id: 'ep1', serverId: 'server', rawData: raw),
    ]);
    await mountRoutedPlayer(tester);
    // The credits run to the end.
    manager.state.setDuration(const Duration(seconds: 4));
    manager.state.setPosition(const Duration(milliseconds: 3500));
    await tester.pumpAndSettle();

    // Nothing follows it, so the player leaves rather than seeking past, and
    // the stop it sends says the episode was played to the end.
    expect(manager.seeks, isEmpty);
    expect(manager.finishedStopCalls, 1);
    expect(manager.stopCalls, 0);
    expect(client.userLibrary.markedPlayed, ['ep1']);
    expect((raw['UserData'] as Map)['Played'], isTrue);
    expect(find.byType(VideoPlayerScreen), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Skip on the credits of the last episode leaves it finished', (
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
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('window_manager'),
        null,
      ),
    );
    // Long enough to be offered: shorter credits play on without asking.
    client.items.segments = [
      segmentJson(id: 'outro', type: 'Outro', startMs: 3000, endMs: 7000),
    ];
    final raw = <String, dynamic>{'Id': 'ep1', 'Type': 'Episode'};
    manager.queueService.setQueue([
      AggregatedItem(id: 'ep1', serverId: 'server', rawData: raw),
    ]);
    await mountRoutedPlayer(tester);
    manager.state.setDuration(const Duration(seconds: 7));
    manager.state.setPosition(const Duration(milliseconds: 3500));
    await tester.pump();
    await tester.pump();
    expect(find.textContaining('Skip'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyS);
    await tester.pumpAndSettle();
    expect(manager.seeks, isEmpty);
    expect(manager.finishedStopCalls, 1);
    expect(manager.stopCalls, 0);
    expect(client.userLibrary.markedPlayed, ['ep1']);
    expect((raw['UserData'] as Map)['Played'], isTrue);
    expect(find.byType(VideoPlayerScreen), findsNothing);
    await tester.pumpWidget(const SizedBox());
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

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

  testWidgets('controls stay up while a dialog covers the player', (
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
    manager.state.setPlaying(true);
    await tester.pump();

    final player = tester.element(find.byType(VideoPlayerScreen));
    showDialog<void>(context: player, builder: (_) => const SizedBox());
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(Slider), findsOneWidget);

    Navigator.of(player).pop();
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(Slider), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('chapters open as a row on the one playing, and seek', (
    tester,
  ) async {
    manager.queueService.setQueue([
      const AggregatedItem(
        id: 'movie',
        serverId: 'server',
        rawData: {
          'Id': 'movie',
          'RunTimeTicks': 6000000000,
          'Chapters': [
            {'Name': 'Opening', 'StartPositionTicks': 0},
            {
              'Name': 'Heist',
              'StartPositionTicks': 1200000000,
              'ImageTag': 'abc',
            },
            {
              'Name': 'Escape through the asteroid field with the cruiser behind',
              'StartPositionTicks': 3600000000,
            },
          ],
        },
      ),
    ]);
    await mountPlayer(tester);
    manager.state.setPosition(const Duration(minutes: 3));
    await tester.tap(find.byIcon(Icons.bookmark_outline_rounded));
    await tester.pumpAndSettle();

    final row = tester.widget<ListView>(
      find.descendant(of: find.byType(Dialog), matching: find.byType(ListView)),
    );
    expect(row.scrollDirection, Axis.horizontal);
    expect(Focus.of(tester.element(find.text('Heist'))).hasFocus, isTrue);
    expect(tester.widget<MarqueeText>(find.byType(MarqueeText)).text, 'Heist');
    expect(find.text('2:00'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (w) =>
            w is Image &&
            w.image is NetworkImage &&
            (w.image as NetworkImage).url ==
                'https://server/movie/chapter/1?tag=abc',
      ),
      findsOneWidget,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump(const Duration(milliseconds: 300));
    expect(
      tester.widget<MarqueeText>(find.byType(MarqueeText)).text,
      startsWith('Escape'),
      reason: 'only the focused card scrolls its name',
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsNothing);
    expect(manager.seeks.last, const Duration(minutes: 6));

    await tester.pumpWidget(const SizedBox());
  });

  Future<void> playWithHideDelay(WidgetTester tester, int milliseconds) async {
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.controlsHideDelay,
      milliseconds,
    );
    await mountPlayer(tester);
    manager.state.setPlaying(true);
    await tester.pump();
  }

  testWidgets('the controls stay up for the delay set in settings', (
    tester,
  ) async {
    await playWithHideDelay(tester, 3000);

    await tester.pump(const Duration(milliseconds: 2500));
    expect(find.byType(Slider), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(Slider), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a short hide delay clears the controls sooner', (tester) async {
    await playWithHideDelay(tester, 1000);

    await tester.pump(const Duration(milliseconds: 1500));
    expect(find.byType(Slider), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  group('dimming the controls in HDR', () {
    Future<ColorFilter?> controlsFilter(
      WidgetTester tester, {
      required int dimming,
      String range = 'HDR10',
      StreamPlayMethod method = StreamPlayMethod.directPlay,
    }) async {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.hdrControlsDimming,
        dimming,
      );
      manager.resolution = StreamResolutionResult(
        streamUrl: 'http://server/stream',
        mediaSourceId: 'source',
        playMethod: method,
        videoRangeType: range,
      );
      await mountPlayer(tester);
      final filters = find.ancestor(
        of: find.byType(Slider),
        matching: find.byType(ColorFiltered),
      );
      final filter = filters.evaluate().isEmpty
          ? null
          : tester.widget<ColorFiltered>(filters.first).colorFilter;
      await tester.pumpWidget(const SizedBox());
      return filter;
    }

    testWidgets('HDR dims the controls by the set amount', (tester) async {
      expect(
        await controlsFilter(tester, dimming: 50),
        const ColorFilter.mode(
          Color.fromARGB(255, 128, 128, 128),
          BlendMode.modulate,
        ),
      );
    });

    testWidgets('SDR leaves the controls alone', (tester) async {
      expect(await controlsFilter(tester, dimming: 50, range: 'SDR'), isNull);
    });

    testWidgets('nothing dims with the setting off', (tester) async {
      expect(await controlsFilter(tester, dimming: 0), isNull);
    });

    testWidgets('a transcode reaches the screen as SDR, so nothing dims', (
      tester,
    ) async {
      expect(
        await controlsFilter(
          tester,
          dimming: 50,
          method: StreamPlayMethod.transcode,
        ),
        isNull,
      );
    });
  });

  testWidgets('the clock tick rebuilds the seek bar, not the whole player', (
    tester,
  ) async {
    await mountPlayer(tester);
    manager.state.setDuration(const Duration(minutes: 10));
    await tester.pump();

    final rebuilt = <Type>[];
    debugOnRebuildDirtyWidget = (element, _) {
      rebuilt.add(element.widget.runtimeType);
    };
    try {
      await tester.pump(const Duration(seconds: 3));
    } finally {
      debugOnRebuildDirtyWidget = null;
    }

    expect(rebuilt, isNot(contains(VideoPlayerScreen)));
    expect(rebuilt, contains(ValueListenableBuilder<int>));

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

  // Issue #1804: the double-tap skip held every OSD button back until its
  // timeout ran out.
  testWidgets('a mobile OSD button answers its tap at once', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.audiotrack_outlined));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.text('Audio Track'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a mobile surface tap still waits out a double-tap skip', (
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

    await tester.tapAt(const Offset(100, 300));
    await tester.pump(const Duration(milliseconds: 100));
    expect(
      find.byType(Slider),
      findsOneWidget,
      reason: 'a second tap could still make it a skip',
    );
    await tester.pump(kDoubleTapTimeout);
    expect(find.byType(Slider), findsNothing);

    await tester.tapAt(const Offset(700, 300));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tapAt(const Offset(700, 300));
    await tester.pump();
    expect(find.text('30 seconds'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(
      find.byType(Slider),
      findsNothing,
      reason: 'a double tap leaves the controls as they were',
    );

    await tester.pumpWidget(const SizedBox());
  });

  // Issue #1804: the button also waited out the debounce meant for a
  // buffering blip after a pause the viewer asked for.
  testWidgets('a pause the viewer asked for shows play at once', (
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
    // The playing stream delivers after the first frame, so the rebuild
    // lands on the second.
    Future<void> setPlaying(bool playing) async {
      manager.state.setPlaying(playing);
      await tester.pump();
      await tester.pump();
    }

    await setPlaying(true);
    expect(find.byIcon(Icons.pause_rounded), findsOneWidget);

    await setPlaying(false);
    expect(
      find.byIcon(Icons.pause_rounded),
      findsOneWidget,
      reason: 'a drop nobody asked for waits in case it is a blip',
    );
    await tester.pump(const Duration(milliseconds: 250));
    expect(find.byIcon(Icons.pause_rounded), findsNothing);

    await setPlaying(true);
    await manager.pause();
    await setPlaying(false);
    expect(find.byIcon(Icons.pause_rounded), findsNothing);
    expect(find.byIcon(Icons.play_arrow_rounded), findsWidgets);

    // An engine that reports its own intent is believed over the manager.
    await manager.resume();
    await setPlaying(true);
    manager.state.setPlayWhenReady(false);
    await setPlaying(false);
    expect(find.byIcon(Icons.pause_rounded), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  // Issue #1869: after a cast took over, the player's controls still drove
  // the paused copy on the phone.
  testWidgets('once cast, the controls drive the receiver', (tester) async {
    final cast = GetIt.instance<CastService>() as _Cast;
    manager.queueService.setQueue([
      const AggregatedItem(
        id: 'movie',
        serverId: 'server',
        rawData: {'Id': 'movie', 'Type': 'Movie'},
      ),
    ]);
    await mountPlayer(tester);
    manager.state.setDuration(const Duration(minutes: 10));
    manager.state.setPosition(const Duration(seconds: 20));
    manager.state.setPlaying(true);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.cast));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Living Room'));
    await tester.pump();
    expect(manager.transport, ['pause'], reason: 'the phone hands off');
    manager.state.setPlaying(false);
    await tester.pumpAndSettle();
    expect(find.text('Casting to Google Cast'), findsOneWidget);

    cast.remoteStateNotifier.value = 'playing';
    cast.remotePositionNotifier.value = 60 * 10000000;
    await tester.pump();
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();
    expect(cast.calls, ['pause']);

    cast.remoteStateNotifier.value = 'paused';
    await tester.pump();
    await tester.tap(find.byIcon(Icons.play_arrow_rounded).first);
    await tester.pump();
    expect(cast.calls, ['pause', 'play']);

    await tester.tapAt(const Offset(700, 300));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tapAt(const Offset(700, 300));
    await tester.pump();
    expect(cast.calls.last, 'seek 90s', reason: 'skips start from the cast');

    cast.activeKindNotifier.value = null;
    await tester.pumpAndSettle();
    expect(find.text('Casting to Google Cast'), findsNothing);
    expect(manager.hasTransportInterceptor, isFalse);

    await tester.pumpWidget(const SizedBox());
  });

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
  group('play buttons', () {
    double playButtonY(WidgetTester tester) =>
        tester.getCenter(find.byIcon(Icons.play_arrow_rounded)).dy;

    testWidgets('sit in the middle of the video by default', (tester) async {
      await mountPlayer(tester);
      final height = tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(playButtonY(tester), closeTo(height / 2, height * 0.1));
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('dock into the bottom bar when set to', (tester) async {
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.playerTransportPosition,
        PlayerTransportPosition.docked,
      );
      await mountPlayer(tester);
      final height = tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(playButtonY(tester), greaterThan(height * 0.75));
      await tester.pumpWidget(const SizedBox());
    });
  });

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

  // Issue #2111: the remote's own subtitle and audio buttons open those menus,
  // and a second press closes them.
  group('remote subtitle and audio buttons', () {
    setUp(() => PlatformDetection.setTvMode(true));
    tearDown(() => PlatformDetection.setTvMode(false));

    Future<void> mountEpisode(
      WidgetTester tester,
      List<Map<String, Object>> streams,
    ) async {
      manager.queueService.setQueue([
        AggregatedItem(
          id: 'ep1',
          serverId: 'server',
          rawData: {'Id': 'ep1', 'Type': 'Episode', 'MediaStreams': streams},
        ),
      ]);
      await mountPlayer(tester);
    }

    testWidgets('open their menus and close them again', (tester) async {
      await mountEpisode(tester, [
        {'Type': 'Audio', 'Index': 1},
        {'Type': 'Subtitle', 'Index': 2},
      ]);

      await tester.sendKeyEvent(LogicalKeyboardKey.closedCaptionToggle);
      await tester.pumpAndSettle();
      expect(find.text('Subtitle Track'), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.closedCaptionToggle);
      await tester.pumpAndSettle();
      expect(find.text('Subtitle Track'), findsNothing);

      // The test keyboard has no physical key for it, so any stands in.
      await tester.sendKeyEvent(
        LogicalKeyboardKey.mediaAudioTrack,
        physicalKey: PhysicalKeyboardKey.f12,
      );
      await tester.pumpAndSettle();
      expect(find.text('Audio Track'), findsOneWidget);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('the subtitle one does nothing with no subtitles', (
      tester,
    ) async {
      await mountEpisode(tester, [
        {'Type': 'Audio', 'Index': 1},
      ]);

      await tester.sendKeyEvent(LogicalKeyboardKey.closedCaptionToggle);
      await tester.pumpAndSettle();
      expect(find.text('Subtitle Track'), findsNothing);

      await tester.pumpWidget(const SizedBox());
    });
  });

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
