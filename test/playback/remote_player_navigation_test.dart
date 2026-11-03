import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
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
import 'package:moonfin/ui/widgets/playback/next_up_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';

class _AuthStore extends Fake implements AuthenticationStore {}

class _AuthPrefs extends Fake implements AuthenticationPreferences {}

class _Credentials extends Fake implements CredentialStore {}

class _Socket extends Fake implements SocketHandler {}

class _Servers extends Fake implements ServerRepository {}

class _PluginSync extends Fake implements PluginSyncService {}

class _Manager extends PlaybackManager {
  int pauses = 0;
  int advances = 0;
  final seeks = <Duration>[];
  @override
  Future<void> pause() async => pauses++;
  @override
  Future<void> seekTo(Duration position) async => seeks.add(position);
  @override
  Future<void> nextInQueue() async => advances++;
  @override
  Future<void> stop({bool userInitiated = true}) async {}
}

class _Images extends Fake implements ImageApi {
  @override
  String getTrickplayTileImageUrl(
    String itemId, {
    required int width,
    required int index,
    String? mediaSourceId,
  }) => 'http://localhost/Videos/$itemId/Trickplay/$width/$index.jpg';
}

class _Client extends Fake implements MediaServerClient {
  @override
  ServerType get serverType => ServerType.emby;
  @override
  TrickplayApi? get trickplayApi => null;
  @override
  final imageApi = _Images();
  @override
  DeviceInfo get deviceInfo => const DeviceInfo(
    id: 'device',
    name: 'Device',
    appName: 'Moonfin',
    appVersion: '1',
  );
  @override
  String? accessToken;
}

class _Factory extends Fake implements MediaServerClientFactory {
  @override
  MediaServerClient? getClientIfExists(String id) => null;
}

class _Cast extends Fake implements CastService {
  @override
  final activeKindNotifier = ValueNotifier<CastTargetKind?>(null);
  @override
  final remoteStateNotifier = ValueNotifier<String?>(null);
  @override
  final remotePositionNotifier = ValueNotifier<int>(0);
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

void main() {
  late _Manager manager;
  late PipService pip;
  late SessionRepository repository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    manager = _Manager();
    manager.state.setPlaying(true);
    manager.state.setDuration(const Duration(minutes: 30));
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    GetIt.instance.registerSingleton<MediaServerClient>(_Client());
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
    repository = SessionRepository(
      _AuthStore(),
      _AuthPrefs(),
      _Credentials(),
      _Factory(),
      _Socket(),
      _Servers(),
      GetIt.instance<UserRepository>(),
      _PluginSync(),
    );
  });

  tearDown(() async {
    repository.dispose();
    manager.dispose();
    pip.dispose();
    await GetIt.instance.reset();
  });

  Future<void> open(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const VideoPlayerScreen(),
      ),
    );
    await tester.pump();
  }

  Future<void> tap(WidgetTester tester, String command) async {
    await repository.handleRemoteCommandForTest(
      GeneralCommandMessage(name: command),
    );
    await tester.pump();
    await tester.pump();
  }

  Future<void> showNextUp(WidgetTester tester) async {
    manager.queueService.setQueue([
      const AggregatedItem(
        id: 'one',
        serverId: 'server',
        rawData: {'Type': 'Episode', 'Name': 'One'},
      ),
      const AggregatedItem(
        id: 'two',
        serverId: 'server',
        rawData: {'Type': 'Episode', 'Name': 'Two'},
      ),
    ]);
    await tester.pump();
    manager.state.setPosition(
      const Duration(minutes: 29, seconds: 59, milliseconds: 800),
    );
    await tester.pump();
    await tester.pump();
  }

  testWidgets(
    'normal player remote reveals mounted controls and Select runs once',
    (tester) async {
      await open(tester);
      await tester.pump(const Duration(seconds: 10));
      await tap(tester, 'MoveDown');
      final primary = FocusManager.instance.primaryFocus;
      expect(primary?.context, isNotNull);
      expect(
        tester
            .widgetList<IconButton>(find.byType(IconButton))
            .where((button) => button.focusNode == primary),
        hasLength(1),
      );
      for (var i = 0; i < 2; i++) {
        await tap(tester, 'MoveRight');
        expect(FocusManager.instance.primaryFocus, isNot(primary));
        await tap(tester, 'MoveLeft');
        expect(FocusManager.instance.primaryFocus, primary);
      }
      expect(
        manager.seeks,
        isEmpty,
        reason: 'remote arrows navigate rather than seek',
      );
      await tap(tester, 'Select');
      expect(manager.pauses, 1);
      await tester.pumpWidget(const SizedBox());
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
      TargetPlatform.windows,
    }),
  );

  testWidgets(
    'Next Up owns remote focus ahead of normal playback controls',
    (tester) async {
      await open(tester);
      await tap(tester, 'MoveDown');
      await showNextUp(tester);
      expect(find.byType(NextUpOverlay), findsOneWidget);
      final nextUp = tester.widget<NextUpOverlay>(find.byType(NextUpOverlay));
      expect(nextUp.focusNode?.hasFocus, isTrue);
      await tap(tester, 'MoveRight');
      await tester.pump(const Duration(milliseconds: 100));
      expect(nextUp.dismissFocusNode?.hasFocus, isTrue);
      await tap(tester, 'MoveLeft');
      expect(nextUp.focusNode?.hasFocus, isTrue);
      await tap(tester, 'Select');
      expect(manager.advances, 1);
      expect(manager.pauses, 0);
      await tester.pumpWidget(const SizedBox());
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
      TargetPlatform.windows,
    }),
  );

  // A held Right with the controls hidden, as on a TV remote: the first press
  // seeks directly and shows the controls, the repeats then scrub. [playing]
  // is what the player reports, [playWhenReady] what it was told to do.
  Future<void> holdRightWithControlsHidden(
    WidgetTester tester, {
    required bool playing,
    required bool playWhenReady,
  }) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
    manager.queueService.setQueue([
      const AggregatedItem(
        id: 'one',
        serverId: 'server',
        rawData: {
          'Type': 'Episode',
          'Name': 'One',
          'Trickplay': {
            'one': {
              '320': {
                'Width': 320,
                'Height': 180,
                'TileWidth': 10,
                'TileHeight': 10,
                'Interval': 10000,
              },
            },
          },
        },
      ),
    ]);
    await open(tester);
    await tester.pump(const Duration(seconds: 10));
    manager.state.setPlaying(playing);
    manager.state.setPlayWhenReady(playWhenReady);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    expect(manager.seeks, hasLength(1), reason: 'the direct seek');
    expect(manager.pauses, 0);
    // Focus moves to the seek bar after a frame and retries a moment later.
    for (var i = 0; i < 3; i++) {
      tester.binding.scheduleFrame();
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
  }

  testWidgets(
    'a TV scrub that begins while the player buffers still pauses it',
    (tester) async {
      await holdRightWithControlsHidden(
        tester,
        playing: false,
        playWhenReady: true,
      );
      expect(manager.pauses, 1);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('a TV scrub does not pause a player the viewer paused', (
    tester,
  ) async {
    await holdRightWithControlsHidden(
      tester,
      playing: false,
      playWhenReady: false,
    );
    expect(manager.pauses, 0);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'Next Up close button dismisses the card and keeps the episode playing',
    (tester) async {
      await open(tester);
      await showNextUp(tester);
      expect(find.byType(NextUpOverlay), findsOneWidget);
      expect(manager.suppressAutoNext, isTrue);

      await tester.tap(
        find.descendant(
          of: find.byType(NextUpOverlay),
          matching: find.byIcon(Icons.close_rounded),
        ),
      );
      // On touch layouts the tap only lands once the double tap window ends.
      await tester.pump(kDoubleTapTimeout);
      await tester.pump();

      expect(find.byType(NextUpOverlay), findsNothing);
      expect(
        manager.suppressAutoNext,
        isFalse,
        reason: 'the episode ends on its own once the card is dismissed',
      );
      await tester.pumpWidget(const SizedBox());
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
      TargetPlatform.windows,
    }),
  );
}
