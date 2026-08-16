import 'dart:io';

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
    when(() => manager.stop(userInitiated: false)).thenAnswer((_) async {});
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

          verifyNever(() => manager.stop(userInitiated: false));

          await tester.pump(const Duration(milliseconds: 1));

          verify(() => manager.stop(userInitiated: false)).called(1);
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

      verify(() => manager.stop(userInitiated: false)).called(1);

      handler.didChangeAppLifecycleState(AppLifecycleState.paused);
      await tester.pump(const Duration(seconds: 3));

      verifyNever(() => manager.stop(userInitiated: false));
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

      verifyNever(() => manager.stop(userInitiated: false));
      verify(() => manager.resume()).called(1);
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

        verifyNever(() => manager.stop(userInitiated: false));
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
      verifyNever(() => manager.stop(userInitiated: false));

      await tester.pump(const Duration(milliseconds: 1));
      verify(() => manager.stop(userInitiated: false)).called(1);
    });
  });

  test('Media3 canonical stop invalidates only background restoration', () {
    final source = File(
      'packages/moonfin_native_video/android/src/main/kotlin/'
      'org/moonfin/nativevideo/Media3VideoView.kt',
    ).readAsStringSync();

    expect(
      source,
      contains('''
    private fun stopPlaybackAndRestoreDisplayMode() {
        // A canonical stop ends ownership of this source. Clear it before
        // touching the player because appPaused may already have released it,
        // and an immediately queued appResumed must not restore stale media.
        lastSourceArguments = null
        lastPlaybackPositionMs = 0L
        player.stop()
'''),
    );
    expect(
      source,
      contains('''
                "appPaused" -> {
                    if (currentMediaType != "audio") {
                        forceReleasePlayer()
                    }
'''),
    );
    expect(
      source,
      contains('''
    fun resumeFromBackground() {
        if (!isPlayerReleased) return
        ensurePlayerAlive()
        val args = lastSourceArguments ?: return
'''),
    );

    final forceReleaseStart = source.indexOf('    fun forceReleasePlayer() {');
    final disposeStart = source.indexOf(
      '    override fun dispose()',
      forceReleaseStart,
    );
    expect(forceReleaseStart, greaterThanOrEqualTo(0));
    expect(disposeStart, greaterThan(forceReleaseStart));
    expect(
      source.substring(forceReleaseStart, disposeStart),
      isNot(contains('lastSourceArguments = null')),
    );
  });
}
