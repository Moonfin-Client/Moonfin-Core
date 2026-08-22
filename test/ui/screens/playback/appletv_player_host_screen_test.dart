import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/ui/screens/playback/appletv_player_host_screen.dart';
import 'package:moonfin/ui/widgets/playback/player_loading_overlay.dart';
import 'package:playback_core/playback_core.dart';

class _MockPlaybackManager extends Mock implements PlaybackManager {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockPlaybackManager manager;
  late QueueService queue;
  late PlayerState playerState;
  late StreamController<PlaybackBringupState> bringupController;

  setUp(() {
    manager = _MockPlaybackManager();
    queue = QueueService();
    playerState = PlayerState();
    bringupController = StreamController<PlaybackBringupState>.broadcast();

    when(() => manager.bringupState).thenReturn(
      const PlaybackBringupState(phase: PlaybackBringupPhase.preparing),
    );
    when(
      () => manager.bringupStateStream,
    ).thenAnswer((_) => bringupController.stream);
    when(() => manager.queueService).thenReturn(queue);
    when(
      () => manager.sessionEndedStream,
    ).thenAnswer((_) => const Stream<void>.empty());
    when(() => manager.state).thenReturn(playerState);
    when(
      () => manager.stop(userInitiated: any(named: 'userInitiated')),
    ).thenAnswer((_) async {});

    GetIt.instance.registerSingleton<PlaybackManager>(manager);
  });

  tearDown(() async {
    await GetIt.instance.reset();
    await bringupController.close();
    queue.dispose();
    playerState.dispose();
  });

  testWidgets('uses a white native spinner throughout tvOS bring-up', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AppleTvPlayerHostScreen()));

    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    expect(find.byType(PlayerLoadingOverlay), findsNothing);
    final spinner = tester.widget<CupertinoActivityIndicator>(
      find.byType(CupertinoActivityIndicator),
    );
    expect(spinner.radius, 20);
    expect(spinner.color, Colors.white);

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.resolving),
    );
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.ready),
    );
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsNothing);
  });

  testWidgets('removes tvOS launch feedback after startup failure', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AppleTvPlayerHostScreen()));

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.failed),
    );
    await tester.pump();

    expect(find.byType(CupertinoActivityIndicator), findsNothing);
  });
}
