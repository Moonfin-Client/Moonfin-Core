import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/log_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/navigation/playback_launcher.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

Future<LogService> _logService() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  return LogService(
    UserPreferences(store),
    _FakeClientFactory(),
    const DeviceInfo(
      id: 'dev-1',
      name: 'Test Device',
      appName: 'Moonfin',
      appVersion: '0.0.0',
    ),
  );
}

void main() {
  testWidgets('video route paints before playback preparation runs', (
    tester,
  ) async {
    final manager = PlaybackManager();
    final startGate = Completer<bool>();
    var videoBuilt = false;
    var startedAfterVideoBuilt = false;
    Future<bool>? launchFuture;

    final router = _router(
      onLaunch: (context) {
        launchFuture = launchPlayerWhilePreparing(
          context,
          manager: manager,
          destination: Destinations.videoPlayer,
          startPlayback: (_) async {
            startedAfterVideoBuilt = videoBuilt;
            return startGate.future;
          },
        );
      },
      videoBuilder: () {
        videoBuilt = true;
        return const _RouteBody('video');
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    expect(manager.bringupState.phase, PlaybackBringupPhase.preparing);
    expect(startedAfterVideoBuilt, isFalse);

    await tester.pumpAndSettle();
    expect(find.text('video'), findsOneWidget);
    expect(startedAfterVideoBuilt, isTrue);

    startGate.complete(false);
    await tester.pumpAndSettle();
    expect(await launchFuture, isFalse);
    expect(find.text('home'), findsOneWidget);
    expect(manager.bringupState.phase, PlaybackBringupPhase.idle);

    manager.dispose();
    router.dispose();
  });

  testWidgets('back during preparation prevents a stale playback start', (
    tester,
  ) async {
    final manager = PlaybackManager();
    final preparationGate = Completer<void>();
    var playbackStarted = false;
    Future<bool>? launchFuture;

    final router = _router(
      onLaunch: (context) {
        launchFuture = launchPlayerWhilePreparing(
          context,
          manager: manager,
          destination: Destinations.videoPlayer,
          startPlayback: (session) async {
            await preparationGate.future;
            await runPlaybackStart(session, () async {
              playbackStarted = true;
            });
            return true;
          },
        );
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();
    expect(find.text('video'), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
    preparationGate.complete();
    await tester.pump();

    expect(await launchFuture, isFalse);
    expect(playbackStarted, isFalse);
    expect(find.text('home'), findsOneWidget);
    expect(manager.bringupState.phase, PlaybackBringupPhase.idle);

    manager.dispose();
    router.dispose();
  });

  testWidgets('a preparation outlives the widget that started it', (
    tester,
  ) async {
    final manager = PlaybackManager();
    final startGate = Completer<bool>();
    PlaybackLaunchSession? captured;
    Future<bool>? launchFuture;

    final router = _router(
      onLaunch: (context) {
        launchFuture = launchPlayerWhilePreparing(
          context,
          manager: manager,
          destination: Destinations.videoPlayer,
          startPlayback: (session) {
            captured = session;
            return startGate.future;
          },
        );
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();

    expect(captured, isNotNull);
    // A live launch keeps preparing whatever happened to the tapped widget.
    expect(() => ensureLaunchStillWanted(captured), returnsNormally);
    expect(() => ensureLaunchStillWanted(null), returnsNormally);

    router.pop();
    await tester.pumpAndSettle();

    // Backing out is what ends a start, so now the preparation must abort.
    expect(
      () => ensureLaunchStillWanted(captured),
      throwsA(isA<PlaybackStartupRecoveryAbortedException>()),
    );

    startGate.complete(false);
    await tester.pumpAndSettle();
    expect(await launchFuture, isFalse);

    manager.dispose();
    router.dispose();
  });

  testWidgets('a start that claims success without playing closes the player', (
    tester,
  ) async {
    GetIt.instance.registerSingleton<LogService>(await _logService());
    addTearDown(GetIt.instance.reset);
    final manager = PlaybackManager();
    Future<bool>? launchFuture;

    final router = _router(
      onLaunch: (context) {
        launchFuture = launchPlayerWhilePreparing(
          context,
          manager: manager,
          destination: Destinations.videoPlayer,
          // Reports success but never asks the manager to play anything, the
          // way a silently aborted preparation does.
          startPlayback: (_) async => true,
        );
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();

    expect(await launchFuture, isFalse);
    expect(
      find.text('home'),
      findsOneWidget,
      reason: 'the player used to stay open on a bringup stuck at preparing',
    );
    expect(manager.bringupState.phase, PlaybackBringupPhase.idle);

    manager.dispose();
    router.dispose();
  });

  testWidgets('backing out of a start that never settles frees the slot', (
    tester,
  ) async {
    final manager = PlaybackManager();
    // Completed by nothing, the way a start wedged on an await with no
    // timeout behaves.
    final hungStart = Completer<bool>();
    var attempts = 0;
    var secondStartRan = false;
    Future<bool>? secondLaunch;

    final router = _router(
      onLaunch: (context) {
        attempts++;
        if (attempts == 1) {
          unawaited(
            launchPlayerWhilePreparing(
              context,
              manager: manager,
              destination: Destinations.videoPlayer,
              startPlayback: (_) => hungStart.future,
            ),
          );
        } else {
          secondLaunch = launchPlayerWhilePreparing(
            context,
            manager: manager,
            destination: Destinations.videoPlayer,
            startPlayback: (_) async {
              secondStartRan = true;
              return false;
            },
          );
        }
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();
    expect(find.text('video'), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();

    expect(
      secondStartRan,
      isTrue,
      reason: 'a hung first start used to hold the slot and swallow the tap',
    );
    expect(await secondLaunch, isFalse);
    expect(find.text('home'), findsOneWidget);

    manager.dispose();
    router.dispose();
  });

  testWidgets(
    'a second video launch is ignored while the first owns the route',
    (tester) async {
      final manager = PlaybackManager();
      final startGate = Completer<bool>();
      late BuildContext sourceContext;
      Future<bool>? firstLaunch;

      final router = _router(
        onLaunch: (context) {
          sourceContext = context;
          firstLaunch = launchPlayerWhilePreparing(
            context,
            manager: manager,
            destination: Destinations.videoPlayer,
            startPlayback: (_) => startGate.future,
          );
        },
      );
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));

      await tester.tap(find.byKey(const ValueKey('launch')));
      await tester.pump();

      final secondLaunch = await launchPlayerWhilePreparing(
        sourceContext,
        manager: manager,
        destination: Destinations.videoPlayer,
        startPlayback: (_) async => true,
      );
      expect(secondLaunch, isFalse);

      startGate.complete(false);
      await tester.pumpAndSettle();
      expect(await firstLaunch, isFalse);

      manager.dispose();
      router.dispose();
    },
  );

  testWidgets('a launch whose route was replaced releases the slot', (
    tester,
  ) async {
    // go() drops a pushed route without completing its push future, so the
    // launch that pushed it waits forever and used to hold the slot for the
    // rest of the process, swallowing every later play press.
    final manager = PlaybackManager();
    final starts = <int>[];
    var launches = 0;

    final router = _router(
      onLaunch: (context) {
        launches++;
        final launch = launches;
        unawaited(
          launchPlayerWhilePreparing(
            context,
            manager: manager,
            destination: Destinations.videoPlayer,
            startPlayback: (session) async {
              starts.add(launch);
              if (launch > 1) return false;
              await runPlaybackStart(
                session,
                () => manager.playItems(const [
                  <String, dynamic>{'Id': '1'},
                ]),
              );
              return true;
            },
          ),
        );
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();
    expect(find.text('video'), findsOneWidget);
    expect(starts, [1]);

    router.go('/');
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();

    // Reaching the starter at all is the proof: a held slot returns before it.
    expect(starts, [1, 2]);

    manager.dispose();
    router.dispose();
  });

  testWidgets('external playback replaces the temporary internal route once', (
    tester,
  ) async {
    final manager = PlaybackManager()..setExternalPlaybackDecider((_) => true);
    var videoBuilds = 0;
    var externalBuilds = 0;
    Future<bool>? launchFuture;

    final router = _router(
      onLaunch: (context) {
        launchFuture = launchPlayerWhilePreparing(
          context,
          manager: manager,
          destination: Destinations.videoPlayer,
          startPlayback: (session) async {
            await runPlaybackStart(
              session,
              () => manager.playItems(const [
                <String, dynamic>{'Id': '1'},
              ]),
            );
            return true;
          },
        );
      },
      videoBuilder: () {
        videoBuilds++;
        return const _RouteBody('video');
      },
      externalBuilder: () {
        externalBuilds++;
        return const _RouteBody('external');
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();

    expect(find.text('external'), findsOneWidget);
    expect(videoBuilds, 1);
    expect(externalBuilds, 1);

    router.pop();
    await tester.pumpAndSettle();
    expect(await launchFuture, isTrue);

    manager.dispose();
    router.dispose();
  });

  testWidgets('a throw before the route opens releases the launch slot', (
    tester,
  ) async {
    // Disposing a manager closes its bring-up stream, so the first thing the
    // launcher does throws. The slot has to come back or every later launch
    // returns false without saying why.
    final dead = PlaybackManager()..dispose();
    final live = PlaybackManager();
    var secondRan = false;
    Object? firstError;

    final router = _router(
      onLaunch: (context) {
        launchPlayerWhilePreparing(
          context,
          manager: dead,
          destination: Destinations.videoPlayer,
          startPlayback: (_) async => true,
        ).catchError((Object error) {
          firstError = error;
          return false;
        });
      },
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byKey(const ValueKey('launch')));
    await tester.pumpAndSettle();
    expect(firstError, isA<StateError>());

    final context = tester.element(find.text('home'));
    final second = launchPlayerWhilePreparing(
      context,
      manager: live,
      destination: Destinations.videoPlayer,
      startPlayback: (_) async {
        secondRan = true;
        return false;
      },
    );
    await tester.pumpAndSettle();
    await second;

    expect(
      secondRan,
      isTrue,
      reason: 'the slot was still claimed, so this launch never ran',
    );

    live.dispose();
    router.dispose();
  });

  test('bring-up phases identify preparation and playback work', () {
    expect(PlaybackBringupPhase.preparing.isInProgress, isTrue);
    expect(PlaybackBringupPhase.resolving.isInProgress, isTrue);
    expect(PlaybackBringupPhase.ready.isInProgress, isFalse);
    expect(PlaybackBringupPhase.failed.isInProgress, isFalse);
  });
}

GoRouter _router({
  required void Function(BuildContext context) onLaunch,
  Widget Function()? videoBuilder,
  Widget Function()? externalBuilder,
}) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, _) => Scaffold(
          body: Column(
            children: [
              const Text('home'),
              FilledButton(
                key: const ValueKey('launch'),
                onPressed: () => onLaunch(context),
                child: const Text('launch'),
              ),
            ],
          ),
        ),
      ),
      GoRoute(
        path: Destinations.videoPlayer,
        builder: (_, _) => videoBuilder?.call() ?? const _RouteBody('video'),
      ),
      GoRoute(
        path: Destinations.externalPlayer,
        builder: (_, _) =>
            externalBuilder?.call() ?? const _RouteBody('external'),
      ),
    ],
  );
}

class _RouteBody extends StatelessWidget {
  const _RouteBody(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(label)));
  }
}
