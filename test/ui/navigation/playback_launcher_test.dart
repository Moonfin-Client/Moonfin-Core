import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/navigation/playback_launcher.dart';
import 'package:playback_core/playback_core.dart';

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
