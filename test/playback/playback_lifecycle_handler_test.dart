import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/playback/playback_lifecycle_handler.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';

class _MockPlaybackManager extends Mock implements PlaybackManager {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    registerFallbackValue(Duration.zero);
  });

  late _MockPlaybackManager manager;
  late QueueService queue;
  late PlayerState playerState;
  late PlaybackLifecycleHandler handler;
  Map<String, dynamic>? offlineMetadata;

  AggregatedItem item(String type) => AggregatedItem(
    id: type,
    serverId: 'server',
    rawData: <String, dynamic>{'Type': type},
  );

  Future<void> asAndroidTv(Future<void> Function() body) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setTvMode(true);
    try {
      await body();
    } finally {
      debugDefaultTargetPlatformOverride = null;
      PlatformDetection.setTvMode(false);
    }
  }

  setUp(() {
    manager = _MockPlaybackManager();
    queue = QueueService();
    playerState = PlayerState();
    when(() => manager.queueService).thenReturn(queue);
    when(() => manager.state).thenReturn(playerState);
    when(() => manager.backend).thenReturn(null);
    when(
      () => manager.currentOfflineMetadata,
    ).thenAnswer((_) => offlineMetadata);
    when(() => manager.stopForBackground(any())).thenAnswer((_) async => true);
    when(
      () => manager.startQueuedPlayback(
        startPosition: any(named: 'startPosition'),
        freshResolution: any(named: 'freshResolution'),
      ),
    ).thenAnswer((_) async {});
    when(() => manager.resume()).thenAnswer((_) async {});
    handler = PlaybackLifecycleHandler(manager);
  });

  tearDown(() {
    WidgetsBinding.instance.removeObserver(handler);
    queue.dispose();
    playerState.dispose();
  });

  for (final type in <String>['TvChannel', 'Movie', 'Episode']) {
    for (final state in <AppLifecycleState>[
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
    ]) {
      testWidgets('$state delays the Android TV $type stop for three seconds', (
        tester,
      ) async {
        await asAndroidTv(() async {
          queue.setQueue(<dynamic>[item(type)]);

          handler.didChangeAppLifecycleState(state);
          await tester.pump(const Duration(milliseconds: 2999));

          verifyNever(() => manager.stopForBackground(any()));

          await tester.pump(const Duration(milliseconds: 1));

          verify(() => manager.stopForBackground(any())).called(1);
        });
      });
    }
  }

  testWidgets('duplicate background events schedule and report one stop', (
    tester,
  ) async {
    await asAndroidTv(() async {
      queue.setQueue(<dynamic>[item('LiveTvChannel')]);

      handler.didChangeAppLifecycleState(AppLifecycleState.hidden);
      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));

      verify(() => manager.stopForBackground(any())).called(1);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));

      verifyNever(() => manager.stopForBackground(any()));
    });
  });

  testWidgets('resume cancels the stop and retains resume restoration', (
    tester,
  ) async {
    await asAndroidTv(() async {
      queue.setQueue(<dynamic>[item('TvChannel')]);
      playerState.setPlaying(true);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 2));
      playerState.setPlaying(false);
      handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));

      verifyNever(() => manager.stopForBackground(any()));
      verify(() => manager.resume()).called(1);
    });
  });

  for (final type in <String>['Movie', 'Episode']) {
    testWidgets('$type timeout resumes through a fresh session at position', (
      tester,
    ) async {
      await asAndroidTv(() async {
        final current = item(type);
        queue.setQueue(<dynamic>[current]);
        playerState.setPosition(const Duration(seconds: 90));
        playerState.setPlaying(true);

        handler.didChangeAppLifecycleState(AppLifecycleState.paused);
        await tester.pump(const Duration(seconds: 3));
        handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
        await tester.pump();

        verify(() => manager.stopForBackground(current)).called(1);
        verify(
          () => manager.startQueuedPlayback(
            startPosition: const Duration(seconds: 90),
            freshResolution: true,
          ),
        ).called(1);
      });
    });
  }

  testWidgets('live TV timeout resumes fresh at the live edge', (tester) async {
    await asAndroidTv(() async {
      final current = item('LiveTvChannel');
      queue.setQueue(<dynamic>[current]);
      playerState.setPosition(const Duration(minutes: 12));
      playerState.setPlaying(true);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));
      handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await tester.pump();

      verify(() => manager.stopForBackground(current)).called(1);
      verify(
        () => manager.startQueuedPlayback(
          startPosition: Duration.zero,
          freshResolution: true,
        ),
      ).called(1);
    });
  });

  testWidgets('resume racing timeout waits for its claimed cleanup once', (
    tester,
  ) async {
    await asAndroidTv(() async {
      final cleanup = Completer<bool>();
      when(
        () => manager.stopForBackground(any()),
      ).thenAnswer((_) => cleanup.future);
      final current = item('Movie');
      queue.setQueue(<dynamic>[current]);
      playerState.setPosition(const Duration(seconds: 45));
      playerState.setPlaying(true);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));
      handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
      handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await tester.pump();

      verifyNever(
        () => manager.startQueuedPlayback(
          startPosition: any(named: 'startPosition'),
          freshResolution: any(named: 'freshResolution'),
        ),
      );

      cleanup.complete(true);
      await tester.pump();

      verify(
        () => manager.startQueuedPlayback(
          startPosition: const Duration(seconds: 45),
          freshResolution: true,
        ),
      ).called(1);
    });
  });

  testWidgets('replacement ownership cannot restart the timed-out item', (
    tester,
  ) async {
    await asAndroidTv(() async {
      final cleanup = Completer<bool>();
      when(
        () => manager.stopForBackground(any()),
      ).thenAnswer((_) => cleanup.future);
      final oldItem = item('Movie');
      queue.setQueue(<dynamic>[oldItem]);
      playerState.setPlaying(true);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));
      queue.setQueue(<dynamic>[item('Episode')]);
      handler.didChangeAppLifecycleState(AppLifecycleState.resumed);
      cleanup.complete(true);
      await tester.pump();

      verifyNever(
        () => manager.startQueuedPlayback(
          startPosition: any(named: 'startPosition'),
          freshResolution: any(named: 'freshResolution'),
        ),
      );
    });
  });

  testWidgets(
    'audio, offline items, and non-TV platforms do not schedule a stop',
    (tester) async {
      await asAndroidTv(() async {
        for (final type in <String>['Audio', 'AudioBook']) {
          queue.setQueue(<dynamic>[item(type)]);
          handler.didChangeAppLifecycleState(AppLifecycleState.paused);
        }

        offlineMetadata = <String, dynamic>{'Type': 'Movie'};
        queue.setQueue(<dynamic>['offline-file']);
        handler.didChangeAppLifecycleState(AppLifecycleState.paused);

        queue.setQueue(<dynamic>[item('TvChannel')]);
        PlatformDetection.setTvMode(false);
        handler.didChangeAppLifecycleState(AppLifecycleState.paused);

        debugDefaultTargetPlatformOverride = TargetPlatform.linux;
        PlatformDetection.setTvMode(true);
        handler.didChangeAppLifecycleState(AppLifecycleState.paused);

        await tester.pump(const Duration(seconds: 4));

        verifyNever(() => manager.stopForBackground(any()));
      });
    },
  );

  testWidgets('a replacement item receives its own three-second timer', (
    tester,
  ) async {
    await asAndroidTv(() async {
      queue.setQueue(<dynamic>[item('Movie')]);
      handler.didChangeAppLifecycleState(AppLifecycleState.hidden);

      await tester.pump(const Duration(seconds: 2));
      queue.setQueue(<dynamic>[item('Episode')]);
      handler.didChangeAppLifecycleState(AppLifecycleState.paused);

      await tester.pump(const Duration(milliseconds: 2999));
      verifyNever(() => manager.stopForBackground(any()));

      await tester.pump(const Duration(milliseconds: 1));
      verify(() => manager.stopForBackground(any())).called(1);
    });
  });
}
