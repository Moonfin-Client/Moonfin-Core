import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/playback/hdr_output_controller.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/widgets/video_mini_player.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  int pauseCalls = 0;

  @override
  Stream<Duration> get positionStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();

  @override
  Stream<bool> get playingStream => const Stream<bool>.empty();

  @override
  Stream<bool> get bufferingStream => const Stream<bool>.empty();

  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();

  @override
  Stream<Map<String, dynamic>>? get errorStream => null;

  @override
  Future<void> pause() async => pauseCalls++;
}

class _NativeWindowBackend extends Fake implements MediaKitPlayerBackend {
  @override
  final HdrOutputController hdrOutput = HdrOutputController();
}

Route<dynamic> _route(String name) => PageRouteBuilder<void>(
  settings: RouteSettings(name: name),
  pageBuilder: (_, a, b) => const SizedBox.shrink(),
);

void main() {
  final linux = TargetPlatformVariant.only(TargetPlatform.linux);
  final observer = PlayerRouteObserver.instance;
  late _TestBackend backend;
  late PlaybackManager manager;

  setUpAll(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    backend = _TestBackend();
    manager = PlaybackManager()..setBackend(backend);
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
  });

  tearDownAll(() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    GetIt.instance.reset();
  });

  setUp(() {
    backend.pauseCalls = 0;
    manager.state.setPlaying(true);
    manager.setTransportInterceptor(null);
  });

  Future<VideoMiniPlayerController> minimized(WidgetTester tester) async {
    final controller = VideoMiniPlayerController.instance;
    controller.minimize();
    await tester.pump();
    expect(controller.visible.value, isTrue);
    return controller;
  }

  Future<void> reset(WidgetTester tester) async {
    VideoMiniPlayerController.instance.clear();
    await tester.pump();
  }

  testWidgets(
    'a trailer pauses the minimized video and the bar comes back after it',
    (tester) async {
      final controller = await minimized(tester);
      final trailer = _route('/player/trailer');

      observer.didPush(trailer, null);
      await tester.pump();
      expect(backend.pauseCalls, 1);
      expect(controller.isMinimized, isTrue);
      expect(controller.visible.value, isFalse);

      observer.didPop(trailer, null);
      await tester.pump();
      expect(controller.isMinimized, isTrue);
      expect(controller.visible.value, isTrue);

      await reset(tester);
    },
    variant: linux,
  );

  testWidgets(
    'a SyncPlay group keeps playing under a photo',
    (tester) async {
      manager.setTransportInterceptor((_, {position}) async => false);
      final controller = await minimized(tester);
      final photo = _route('/player/photo/item1');

      observer.didPush(photo, null);
      await tester.pump();
      expect(backend.pauseCalls, 0);
      expect(controller.isMinimized, isTrue);

      observer.didPop(photo, null);
      await tester.pump();
      expect(controller.visible.value, isTrue);

      await reset(tester);
    },
    variant: linux,
  );

  testWidgets(
    'the video player takes the session over',
    (tester) async {
      final controller = await minimized(tester);
      final video = _route('/player/video');

      observer.didPush(video, null);
      await tester.pump();
      expect(backend.pauseCalls, 0);
      expect(controller.isMinimized, isFalse);
      expect(controller.visible.value, isFalse);

      observer.didPop(video, null);
      await tester.pump();
      expect(controller.visible.value, isFalse);
    },
    variant: linux,
  );

  testWidgets(
    'live TV started while minimized ends the minimized session',
    (tester) async {
      final controller = await minimized(tester);
      final liveTv = _route('/live-tv/player');

      observer.didPush(liveTv, null);
      await tester.pump();
      expect(controller.isMinimized, isFalse);

      observer.didPop(liveTv, null);
      await tester.pump();
      expect(controller.visible.value, isFalse);
    },
    variant: linux,
  );

  testWidgets(
    'the backdrop paints nothing while the full player has the native window',
    (tester) async {
      final nativeBackend = _NativeWindowBackend();
      GetIt.instance.registerSingleton<MediaKitPlayerBackend>(nativeBackend);
      addTearDown(GetIt.instance.unregister<MediaKitPlayerBackend>);

      await tester.pumpWidget(
        const VideoMiniPlayerHoleClip(child: SizedBox.expand()),
      );
      final clipper = tester
          .widget<ClipPath>(find.byWidgetPredicate((w) => w is ClipPath))
          .clipper!;
      bool paints() => clipper
          .getClip(const Size(800, 600))
          .contains(const Offset(400, 300));
      var reclips = 0;
      clipper.addListener(() => reclips++);

      final window = nativeBackend.hdrOutput.window;
      final miniPlayer = VideoMiniPlayerController.instance;
      final screen = Object();
      expect(paints(), isTrue);

      await window.claim(screen, Rect.zero);
      expect(paints(), isFalse);
      expect(reclips, 1);

      window.transferOwnership(from: screen, to: miniPlayer);
      expect(paints(), isTrue);
      expect(reclips, 2);

      window.transferOwnership(from: miniPlayer, to: screen);
      expect(paints(), isFalse);

      await window.release(screen);
      expect(paints(), isTrue);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
  );
}
