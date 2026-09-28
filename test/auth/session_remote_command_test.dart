import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/download_notification_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/data/services/remote_search_session.dart';
import 'package:moonfin/playback/appletv_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/util/focus/input_mode_tracker.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';

/// The command handlers never reach the collaborators the repository is built
/// from, so these stay empty on purpose.
class _FakeAuthStore extends Fake implements AuthenticationStore {}

class _FakeAuthPrefs extends Fake implements AuthenticationPreferences {}

class _FakeCredentialStore extends Fake implements CredentialStore {}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeSocketHandler extends Fake implements SocketHandler {}

class _FakeServerRepository extends Fake implements ServerRepository {}

class _FakeUserRepository extends Fake implements UserRepository {}

class _FakePluginSyncService extends Fake implements PluginSyncService {}

class _VolumeBackend extends Fake implements PlayerBackend {
  final volumes = <double>[];
  bool fail = false;
  Completer<void>? barrier;
  @override
  Future<void> setVolume(double volume) async {
    if (fail) throw StateError('Volume unavailable');
    volumes.add(volume);
    await barrier?.future;
  }
}

class _AppleTvBackend extends Fake implements AppleTvBackend {
  bool dismissed = false;
  final navigation = <String>[];
  @override
  Future<void> sendRemoteNavigation(String command) async =>
      navigation.add(command);
  @override
  bool get isPlayerPresented => !dismissed;
  @override
  Future<void> dismissPlayer() async => dismissed = true;
}

class _FakeNotifications extends Fake implements DownloadNotificationService {
  final List<String> messages = [];

  @override
  Future<bool> showRemoteMessage({required String text, String? header}) async {
    messages.add(text);
    return true;
  }
}

/// Records what the remote command asked playback to do.
class _RecordingManager extends Fake implements PlaybackManager {
  final List<String> calls = [];
  final List<Duration> seeks = [];

  double trackedVolume = 100;
  bool trackedMuted = false;
  final reportedVolumes = <double>[];
  Completer<void>? stopBarrier;

  @override
  final PlayerState state = PlayerState();

  @override
  PlayerBackend? backend;

  @override
  double get volume => trackedVolume;

  @override
  void reportVolumeState({
    required double volume,
    required bool isMuted,
    bool reportImmediately = false,
  }) {
    trackedVolume = volume.clamp(0, 100).toDouble();
    trackedMuted = isMuted;
    if (reportImmediately) reportedVolumes.add(trackedVolume);
  }

  @override
  Future<void> pause() async => calls.add('pause');

  @override
  Future<void> resume() async => calls.add('resume');

  @override
  Future<void> next() async => calls.add('next');

  @override
  Future<void> previous() async => calls.add('previous');

  @override
  Future<void> stop({bool userInitiated = true}) async {
    calls.add('stop');
    await stopBarrier?.future;
  }

  @override
  Future<void> seekTo(Duration position) async {
    calls.add('seek');
    seeks.add(position);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingManager manager;
  late _FakeNotifications notifications;
  late SessionRepository repository;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    manager = _RecordingManager();
    notifications = _FakeNotifications();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<DownloadNotificationService>(
      notifications,
    );

    repository = SessionRepository(
      _FakeAuthStore(),
      _FakeAuthPrefs(),
      _FakeCredentialStore(),
      _FakeClientFactory(),
      _FakeSocketHandler(),
      _FakeServerRepository(),
      _FakeUserRepository(),
      _FakePluginSyncService(),
    );
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<void> send(String command, {int? seekTicks}) =>
      repository.handleRemoteCommandForTest(
        PlaystateMessage(command: command, seekPositionTicks: seekTicks),
      );

  Future<void> sendGeneral(
    String name, {
    Map<String, String> args = const {},
  }) => repository.handleRemoteCommandForTest(
    GeneralCommandMessage(name: name, arguments: args),
  );

  testWidgets('remote Select wakes screensaver before activating a button', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    final screensaver = ScreensaverController(
      GetIt.instance<UserPreferences>(),
      manager,
    );
    GetIt.instance.registerSingleton<ScreensaverController>(screensaver);
    final handler = screensaver.handleKeyEvent;
    HardwareKeyboard.instance.addHandler(handler);
    addTearDown(() {
      HardwareKeyboard.instance.removeHandler(handler);
      screensaver.dispose();
    });
    var selected = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: TextButton(
          autofocus: true,
          onPressed: () => selected++,
          child: const Text('Covered item'),
        ),
      ),
    );
    await tester.pump();
    screensaver.visible.value = true;
    await sendGeneral('Select');
    await tester.pump();
    final remainedVisible = screensaver.visible.value;
    final remotelySelected = selected;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
    final physicalKeyDismissed = !screensaver.visible.value;
    screensaver.activityPaused = true;
    await tester.pumpWidget(const SizedBox());
    // The first remote press should wake, as the physical remote does.
    expect(physicalKeyDismissed, isTrue);
    expect(
      {
        'screensaverVisible': remainedVisible,
        'underlyingSelections': remotelySelected,
      },
      {'screensaverVisible': false, 'underlyingSelections': 0},
    );
  });

  for (final command in ['GoHome', 'GoToSearch']) {
    testWidgets('$command wakes the screensaver and closes an overlay sheet', (
      tester,
    ) async {
      PlatformDetection.setTvMode(true);
      final screensaver = ScreensaverController(
        GetIt.instance<UserPreferences>(),
        manager,
      );
      GetIt.instance.registerSingleton<ScreensaverController>(screensaver);
      addTearDown(screensaver.dispose);
      appRouter.go(Destinations.startup);
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () => OverlaySheetController.show<void>(
                context,
                builder: (_) => const Material(child: Text('Options overlay')),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Options overlay'), findsOneWidget);
      screensaver.visible.value = true;
      final navigating = sendGeneral(command);
      await tester.pumpAndSettle();
      await navigating;
      expect(find.text('Options overlay'), findsNothing);
      expect(screensaver.visible.value, isFalse);
      expect(
        appRouter.routeInformationProvider.value.uri.path,
        command == 'GoHome' ? Destinations.home : Destinations.search,
      );
      screensaver.activityPaused = true;
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets(
    'TV commands reach custom focus handlers without held hardware keys',
    (tester) async {
      PlatformDetection.setTvMode(true);
      final keys = <LogicalKeyboardKey>[];
      final releases = <LogicalKeyboardKey>[];
      final hardwareKeys = {...HardwareKeyboard.instance.logicalKeysPressed};
      await tester.pumpWidget(
        MaterialApp(
          home: Focus(
            autofocus: true,
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent) keys.add(event.logicalKey);
              if (event is KeyUpEvent) releases.add(event.logicalKey);
              return KeyEventResult.handled;
            },
            child: const SizedBox(),
          ),
        ),
      );
      await tester.pump();
      for (final name in [
        'MoveUp',
        'MoveDown',
        'MoveLeft',
        'MoveRight',
        'Select',
        'Back',
      ]) {
        await sendGeneral(name);
      }
      expect(keys, [
        LogicalKeyboardKey.arrowUp,
        LogicalKeyboardKey.arrowDown,
        LogicalKeyboardKey.arrowLeft,
        LogicalKeyboardKey.arrowRight,
        LogicalKeyboardKey.select,
        LogicalKeyboardKey.escape,
      ]);
      expect(releases, keys);
      expect(HardwareKeyboard.instance.logicalKeysPressed, hardwareKeys);
    },
  );

  for (final platform in TargetPlatform.values) {
    testWidgets(
      '$platform navigation traverses and activates in the normal layout',
      (tester) async {
        debugDefaultTargetPlatformOverride = platform;
        addTearDown(() => debugDefaultTargetPlatformOverride = null);
        PlatformDetection.setTvMode(false);
        final first = FocusNode();
        final second = FocusNode();
        addTearDown(first.dispose);
        addTearDown(second.dispose);
        var selected = 0;
        await tester.pumpWidget(
          MaterialApp(
            home: Row(
              children: [
                TextButton(
                  focusNode: first,
                  autofocus: true,
                  onPressed: () {},
                  child: const Text('First'),
                ),
                TextButton(
                  focusNode: second,
                  onPressed: () => selected++,
                  child: const Text('Second'),
                ),
              ],
            ),
          ),
        );
        await tester.pump();
        await sendGeneral('MoveRight');
        await tester.pump();
        expect(second.hasFocus, isTrue);
        await sendGeneral('Select');
        await tester.pump();
        debugDefaultTargetPlatformOverride = null;
        expect(selected, 1);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }

  testWidgets('remote navigation shows focus and touch can take over again', (
    tester,
  ) async {
    late BuildContext trackedContext;
    await tester.pumpWidget(
      MaterialApp(
        home: InputModeTracker(
          child: Builder(
            builder: (context) {
              trackedContext = context;
              return TextButton(
                autofocus: true,
                onPressed: () {},
                child: const Text('Item'),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();
    await sendGeneral('MoveRight');
    await tester.pump();
    expect(InputModeTracker.of(trackedContext), InputMode.keyboard);
    await tester.tap(find.text('Item'));
    await tester.pump();
    expect(InputModeTracker.of(trackedContext), InputMode.pointer);
  });

  testWidgets('native playback cannot activate hidden Flutter controls', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    final backend = _AppleTvBackend();
    manager.backend = backend;
    var selected = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: TextButton(
          autofocus: true,
          onPressed: () => selected++,
          child: const Text('Hidden'),
        ),
      ),
    );
    await tester.pump();
    await sendGeneral('MoveDown');
    await sendGeneral('Select');
    expect(selected, 0);
    await sendGeneral('Back');
    expect(backend.navigation, ['movedown', 'select', 'back']);
    expect(manager.calls, isEmpty);
    expect(backend.dismissed, isFalse);
  });

  test('Home stops playback and dismisses its native presentation', () async {
    final backend = _AppleTvBackend();
    manager.backend = backend;
    appRouter.go(Destinations.search);
    manager.stopBarrier = Completer<void>();
    final home = sendGeneral('GoHome');
    expect(backend.dismissed, isFalse);
    manager.stopBarrier!.complete();
    await home;
    expect(manager.calls, ['stop']);
    expect(backend.dismissed, isTrue);
    expect(
      appRouter.routeInformationProvider.value.uri.path,
      Destinations.home,
    );
  });

  test(
    'an older Home cannot replace a newer Search after playback stops',
    () async {
      appRouter.go(Destinations.startup);
      manager.stopBarrier = Completer<void>();
      final home = sendGeneral('GoHome');
      final search = sendGeneral('GoToSearch');
      manager.stopBarrier!.complete();
      await Future.wait([home, search]);
      expect(
        appRouter.routeInformationProvider.value.uri.path,
        Destinations.search,
      );
    },
  );

  testWidgets('Back closes the top dialog before navigating the TV page', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: appRouter.routerDelegate.navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (_) => const AlertDialog(content: Text('Options')),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Options'), findsOneWidget);
    await sendGeneral('Back');
    await tester.pumpAndSettle();
    expect(find.text('Options'), findsNothing);
    expect(find.text('Open'), findsOneWidget);
  });

  group('remote search navigation', () {
    setUp(() => appRouter.go(Destinations.startup));

    String currentPath() => appRouter.routeInformationProvider.value.uri.path;
    RouteInformationState currentRoute() =>
        appRouter.routeInformationProvider.value.state as RouteInformationState;

    test('buffers text while stopping playback and dismisses the native Apple TV player', () async {
      final backend = _AppleTvBackend();
      manager.backend = backend;
      manager.stopBarrier = Completer<void>();
      final opening = sendGeneral(
        'GoToSearch',
        args: {'MoonfinInputId': 'phone'},
      );
      await sendGeneral(
        'SendString',
        args: {
          'String': 'alien',
          'MoonfinInputId': 'phone',
          'MoonfinRevision': '1',
        },
      );
      expect(backend.dismissed, isFalse);
      manager.stopBarrier!.complete();
      await opening;
      expect(backend.dismissed, isTrue);
      expect(manager.calls, ['stop']);
      expect(
        appRouter.routeInformationProvider.value.uri.path,
        Destinations.search,
      );
      final route =
          appRouter.routeInformationProvider.value.state
              as RouteInformationState;
      final search = route.extra as RemoteSearchSession;
      final values = <String>[];
      search.attach(values.add);
      expect(values, ['alien']);
      search.close();
    });

    test('back cancels a search still waiting for playback to stop', () async {
      manager.stopBarrier = Completer<void>();
      final opening = sendGeneral('GoToSearch');
      await sendGeneral('Back');
      manager.stopBarrier!.complete();
      await opening;
      expect(
        appRouter.routeInformationProvider.value.uri.path,
        Destinations.startup,
      );
    });

    test('a second search supersedes the first and its delayed text', () async {
      manager.stopBarrier = Completer<void>();
      final first = sendGeneral('GoToSearch', args: {'MoonfinInputId': 'old'});
      final second = sendGeneral('GoToSearch', args: {'MoonfinInputId': 'new'});
      await sendGeneral(
        'SendString',
        args: {
          'String': 'stale',
          'MoonfinInputId': 'old',
          'MoonfinRevision': '9',
        },
      );
      await sendGeneral(
        'SendString',
        args: {
          'String': 'latest',
          'MoonfinInputId': 'new',
          'MoonfinRevision': '1',
        },
      );
      manager.stopBarrier!.complete();
      await Future.wait([first, second]);
      final route =
          appRouter.routeInformationProvider.value.state
              as RouteInformationState;
      final search = route.extra as RemoteSearchSession;
      expect(search.inputId, 'new');
      expect(search.text, 'latest');
      search.close();
    });

    test(
      'a search opened away from a player is pushed so Back returns',
      () async {
        await sendGeneral('GoToSearch', args: {'MoonfinInputId': 'phone'});
        expect(currentPath(), Destinations.search);
        expect(currentRoute().type, NavigatingType.push);
        (currentRoute().extra as RemoteSearchSession).close();
      },
    );

    test('a search opened over a player replaces the stopped player', () async {
      appRouter.go(Destinations.videoPlayer);
      await sendGeneral('GoToSearch', args: {'MoonfinInputId': 'phone'});
      expect(currentPath(), Destinations.search);
      expect(currentRoute().type, NavigatingType.pushReplacement);
      (currentRoute().extra as RemoteSearchSession).close();
    });

    test('plain text from another controller opens Search with it', () async {
      await sendGeneral('SendString', args: {'String': 'alien'});
      expect(manager.calls, ['stop']);
      expect(currentPath(), Destinations.search);
      final search = currentRoute().extra as RemoteSearchSession;
      final values = <String>[];
      search.attach(values.add);
      expect(values, ['alien']);
      search.close();
    });

    test(
      'a phone edit after its search ended does not reopen Search',
      () async {
        await sendGeneral(
          'SendString',
          args: {
            'String': 'late',
            'MoonfinInputId': 'phone',
            'MoonfinRevision': '3',
          },
        );
        expect(manager.calls, isEmpty);
        expect(currentPath(), Destinations.startup);
      },
    );

    test('a phone edit while Search is showing reaches it', () async {
      await sendGeneral('GoToSearch', args: {'MoonfinInputId': 'phone'});
      final search = currentRoute().extra as RemoteSearchSession;
      final values = <String>[];
      search.attach(values.add);
      await sendGeneral(
        'SendString',
        args: {
          'String': 'alien',
          'MoonfinInputId': 'phone',
          'MoonfinRevision': '1',
        },
      );
      expect(values, ['', 'alien']);
      search.close();
    });

    test('a phone edit after the viewer left Search ends it there', () async {
      await sendGeneral('GoToSearch', args: {'MoonfinInputId': 'phone'});
      final search = currentRoute().extra as RemoteSearchSession;
      search.attach((_) {});
      appRouter.go(Destinations.home);
      await sendGeneral(
        'SendString',
        args: {
          'String': 'late',
          'MoonfinInputId': 'phone',
          'MoonfinRevision': '1',
        },
      );
      expect(search.active, isFalse);
      expect(currentPath(), Destinations.home);
    });
  });

  for (final startingPage in [
    Destinations.home,
    Destinations.videoPlayer,
    Destinations.search,
  ]) {
    testWidgets('mounted remote Search accepts live text from $startingPage', (
      tester,
    ) async {
      PlatformDetection.setTvMode(true);
      final controller = TextEditingController();
      var fieldKey = GlobalKey<CustomTVTextFieldState>();
      late RemoteSearchSession session;
      final router = GoRouter(
        initialLocation: startingPage,
        routes: [
          GoRoute(
            path: Destinations.home,
            builder: (_, _) => const SizedBox(),
          ),
          GoRoute(
            path: Destinations.videoPlayer,
            builder: (_, _) => const SizedBox(),
          ),
          GoRoute(
            path: Destinations.search,
            builder: (_, state) {
              if (state.extra == null) return const SizedBox();
              session = state.extra as RemoteSearchSession;
              return Scaffold(
                body: CustomTVTextField(
                  key: fieldKey,
                  controller: controller,
                  popParentOnKeyboardClose: false,
                ),
              );
            },
          ),
        ],
      );
      final receiver = SessionRepository(
        _FakeAuthStore(),
        _FakeAuthPrefs(),
        _FakeCredentialStore(),
        _FakeClientFactory(),
        _FakeSocketHandler(),
        _FakeServerRepository(),
        _FakeUserRepository(),
        _FakePluginSyncService(),
        router: router,
      );
      Future<void> command(
        String name, [
        Map<String, String> args = const {},
      ]) => receiver.handleRemoteCommandForTest(
        GeneralCommandMessage(name: name, arguments: args),
      );
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();
      await command('GoToSearch', {'MoonfinInputId': 'phone'});
      await tester.pumpAndSettle();
      session.attach((value) => controller.text = value);
      // The settled visible route, not the pending route request, owns typing.
      expect(router.state.uri.path, Destinations.search);
      await command('SendString', {
        'String': 'alien',
        'MoonfinInputId': 'phone',
        'MoonfinRevision': '1',
      });
      expect(controller.text, 'alien');
      await command('SendString', {
        'String': '',
        'MoonfinInputId': 'phone',
        'MoonfinRevision': '2',
      });
      expect(controller.text, '');
      await command('SendString', {
        'String': 'stale',
        'MoonfinInputId': 'old',
        'MoonfinRevision': '9',
      });
      expect(controller.text, '');
      // A receiver keyboard can take Back without leaving Search.
      bool keyboardBack(KeyEvent event) =>
          event is KeyDownEvent &&
          event.logicalKey == LogicalKeyboardKey.escape &&
          CustomTVTextField.closeTopKeyboard();
      HardwareKeyboard.instance.addHandler(keyboardBack);
      fieldKey.currentState!.openKeyboard();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      await command('Back');
      HardwareKeyboard.instance.removeHandler(keyboardBack);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(session.active, true);
      await command('SendString', {
        'String': 'aliens',
        'MoonfinInputId': 'phone',
        'MoonfinRevision': '3',
      });
      expect(controller.text, 'aliens');
      // A fresh Search replaces this one, so old text can't take ownership.
      fieldKey = GlobalKey<CustomTVTextFieldState>();
      await command('GoToSearch', {'MoonfinInputId': 'new'});
      await tester.pumpAndSettle();
      session.attach((value) => controller.text = value);
      expect(
        router.routerDelegate.currentConfiguration.matches.length,
        startingPage == Destinations.home ? 2 : 1,
      );
      await command('SendString', {
        'String': 'old',
        'MoonfinInputId': 'phone',
        'MoonfinRevision': '4',
      });
      expect(controller.text, '');
      await command('SendString', {
        'String': 'new',
        'MoonfinInputId': 'new',
        'MoonfinRevision': '1',
      });
      expect(controller.text, 'new');
      router.go(Destinations.home);
      await tester.pumpAndSettle();
      await command('SendString', {
        'String': 'late',
        'MoonfinInputId': 'new',
        'MoonfinRevision': '2',
      });
      expect(session.active, false);
      await tester.pumpWidget(const SizedBox());
      receiver.dispose();
      router.dispose();
      controller.dispose();
    });
  }

  group('play and pause', () {
    test('PlayPause pauses what is playing', () async {
      manager.state.setPlaying(true);
      await send('PlayPause');
      expect(manager.calls, ['pause']);
    });

    test('PlayPause resumes what is paused', () async {
      manager.state.setPlaying(false);
      await send('PlayPause');
      expect(manager.calls, ['resume']);
    });

    test('the discrete Pause and Unpause still work', () async {
      await send('Pause');
      await send('Unpause');
      expect(manager.calls, ['pause', 'resume']);
    });
  });

  group('relative skips', () {
    test('Rewind goes back the configured skip length', () async {
      manager.state.setPosition(const Duration(seconds: 60));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('Rewind');

      // The shipped default for skipBackLength is 10 seconds.
      expect(manager.seeks, [const Duration(seconds: 50)]);
    });

    test('FastForward goes on the configured skip length', () async {
      manager.state.setPosition(const Duration(seconds: 60));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('FastForward');

      // The shipped default for skipForwardLength is 30 seconds.
      expect(manager.seeks, [const Duration(seconds: 90)]);
    });

    test('a rewind past the start lands on the start', () async {
      manager.state.setPosition(const Duration(seconds: 3));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('Rewind');

      expect(manager.seeks, [Duration.zero]);
    });

    test('a skip past the end lands on the end', () async {
      manager.state.setPosition(const Duration(seconds: 50));
      manager.state.setDuration(const Duration(seconds: 60));

      await send('FastForward');

      expect(manager.seeks, [const Duration(seconds: 60)]);
    });

    test(
      "an unknown duration doesn't drag the skip back to the start",
      () async {
        manager.state.setPosition(const Duration(seconds: 50));
        manager.state.setDuration(Duration.zero);

        await send('FastForward');

        expect(manager.seeks, [const Duration(seconds: 80)]);
      },
    );
  });

  test('the command name is matched whatever its casing', () async {
    await send('playpause');
    await send('PLAYPAUSE');
    expect(manager.calls, ['resume', 'resume']);
  });

  group('stepped volume', () {
    late _VolumeBackend backend;
    setUp(() {
      PlatformDetection.setTvMode(true);
      backend = _VolumeBackend();
      manager.backend = backend;
    });

    test(
      'overlapping steps wait for the previous volume to be applied',
      () async {
        manager.trackedVolume = 40;
        backend.barrier = Completer<void>();
        final first = sendGeneral('VolumeUp');
        final second = sendGeneral('VolumeUp');
        await Future<void>.delayed(Duration.zero);
        expect(backend.volumes, [50]);
        expect(manager.trackedVolume, 40);
        expect(manager.reportedVolumes, isEmpty);
        backend.barrier!.complete();
        await Future.wait([first, second]);
        expect(backend.volumes, [50, 60]);
        expect(manager.trackedVolume, 60);
        expect(manager.reportedVolumes, [50, 60]);
      },
    );

    test('disposal cancels unsent receiver volume commands', () async {
      backend.barrier = Completer<void>();
      final first = sendGeneral('SetVolume', args: {'Volume': '25'});
      final second = sendGeneral('SetVolume', args: {'Volume': '75'});
      await Future<void>.delayed(Duration.zero);
      repository.dispose();
      backend.barrier!.complete();
      await Future.wait([first, second]);
      expect(backend.volumes, [25]);
    });

    for (final (raw, expected) in [
      ('0', 0.0),
      ('1', 1.0),
      ('2', 2.0),
      ('25', 25.0),
      ('100', 100.0),
      ('-1', 0.0),
      ('101', 100.0),
      ('0.5', 50.0),
    ]) {
      test('SetVolume $raw applies $expected percent', () async {
        await sendGeneral('SetVolume', args: {'Volume': raw});
        expect(backend.volumes, [expected]);
        expect(manager.trackedVolume, expected);
        expect(manager.reportedVolumes, [expected]);
      });
    }
    for (final raw in [
      '',
      'oops',
      '25garbage',
      'NaN',
      'Infinity',
      '-Infinity',
    ]) {
      test('SetVolume ignores invalid $raw', () async {
        await sendGeneral('SetVolume', args: {'Volume': raw});
        expect(backend.volumes, isEmpty);
        expect(manager.trackedVolume, 100);
        expect(manager.reportedVolumes, isEmpty);
      });
    }
    test(
      'mute restores the local level and repeated mute/unmute is idempotent',
      () async {
        manager.trackedVolume = 40;
        await sendGeneral('Mute');
        await sendGeneral('Mute');
        await sendGeneral('Unmute');
        await sendGeneral('Unmute');
        manager.trackedVolume = 25;
        await sendGeneral('ToggleMute');
        await sendGeneral('ToggleMute');
        expect(backend.volumes, [0, 40, 0, 25]);
        expect(manager.trackedVolume, 25);
      },
    );
    test('unmute after a local change preserves the local volume', () async {
      manager.trackedVolume = 40;
      await sendGeneral('Mute');
      manager.trackedVolume = 60;
      await sendGeneral('Unmute');
      expect(backend.volumes, [0]);
      expect(manager.trackedVolume, 60);
    });
    test(
      'failed or unavailable backends do not report a changed volume',
      () async {
        manager.trackedVolume = 40;
        backend.fail = true;
        await expectLater(
          sendGeneral('SetVolume', args: {'Volume': '25'}),
          throwsStateError,
        );
        expect(manager.trackedVolume, 40);
        manager.backend = null;
        await sendGeneral('SetVolume', args: {'Volume': '25'});
        expect(manager.trackedVolume, 40);
        expect(manager.reportedVolumes, isEmpty);
      },
    );
    test('VolumeUp steps up from what the device last reported', () async {
      manager.reportVolumeState(volume: 40, isMuted: false);

      await sendGeneral('VolumeUp');

      expect(manager.trackedVolume, 50);
    });

    test('VolumeDown steps down from what the device last reported', () async {
      manager.reportVolumeState(volume: 40, isMuted: false);

      await sendGeneral('VolumeDown');

      expect(manager.trackedVolume, 30);
    });

    test('a step up stops at full', () async {
      manager.reportVolumeState(volume: 95, isMuted: false);

      await sendGeneral('VolumeUp');

      expect(manager.trackedVolume, 100);
    });

    test('a step down stops at silence and reads as muted', () async {
      manager.reportVolumeState(volume: 5, isMuted: false);

      await sendGeneral('VolumeDown');

      expect(manager.trackedVolume, 0);
      expect(manager.trackedMuted, isTrue);
    });

    test('SetVolume takes the level it was given', () async {
      await sendGeneral('SetVolume', args: {'Volume': '25'});

      expect(manager.trackedVolume, 25);
    });
  });

  test('a mobile receiver adjusts and reports system volume without changing player gain', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    const channel = MethodChannel('com.kurenai7968.volume_controller.method');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    var systemVolume = 0.4;
    final levels = <double>[];
    messenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'setVolume') {
        systemVolume = (call.arguments as Map)['volume'] as double;
        levels.add(systemVolume);
        return null;
      }
      return systemVolume;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
    final backend = _VolumeBackend();
    manager.backend = backend;
    await sendGeneral('Mute');
    await sendGeneral('Unmute');
    await sendGeneral('VolumeUp');
    await sendGeneral('SetVolume', args: {'Volume': '1'});
    expect(levels, [0, 0.4, 0.5, 0.01]);
    expect(backend.volumes, isEmpty);
    expect(manager.trackedVolume, 1);
    expect(manager.reportedVolumes, [0, 40, 50, 1]);
  });

  test('a message from another client is shown', () async {
    await sendGeneral('DisplayMessage', args: {'Text': 'dinner is ready'});

    expect(notifications.messages, ['dinner is ready']);
  });

  test("an empty message isn't shown at all", () async {
    await sendGeneral('DisplayMessage', args: {'Text': '   '});

    expect(notifications.messages, isEmpty);
  });

  // The control surfaces sent names the receiver had no case for, so every
  // button but Stop did nothing. Every name either surface sends has to reach
  // playback.
  group('every playstate command the control UIs send is handled', () {
    const sentByControlSurfaces = [
      'PreviousTrack',
      'Rewind',
      'PlayPause',
      'FastForward',
      'NextTrack',
      'Stop',
      'Seek',
    ];

    for (final command in sentByControlSurfaces) {
      test(command, () async {
        await send(command, seekTicks: 300000000);
        expect(
          manager.calls,
          isNotEmpty,
          reason: '$command reached no playback call',
        );
      });
    }
  });
}
