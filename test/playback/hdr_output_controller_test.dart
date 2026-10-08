import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/hdr_output_controller.dart';
import 'package:moonfin/playback/hdr_overlay_channel.dart';
import 'package:moonfin/playback/hdr_video_window.dart';

/// Stands in for the runner's window so the decision can be exercised without
/// a platform channel.
class _FakeWindow implements HdrVideoWindow {
  _FakeWindow({this.createReturns = 4242});

  final int? createReturns;
  int createCalls = 0;
  int destroyCalls = 0;
  final List<String> log = [];

  @override
  int? handle;

  @override
  void Function()? onMonitorChanged;

  @override
  Future<int?> create() async {
    createCalls++;
    log.add('create');
    return handle = createReturns;
  }

  @override
  Future<void> destroy() async {
    destroyCalls++;
    handle = null;
    log.add('destroy');
  }

  @override
  Future<void> setGeometry(Rect rect) async => log.add('geometry $rect');

  @override
  Future<void> setVisible(bool visible) async => log.add('visible $visible');

  @override
  Future<void> claim(Object presenter, Rect rect) async => log.add('claim');

  @override
  Future<void> release(Object presenter) async => log.add('release');
}

void main() {
  // The channel groups below mock the binary messenger, which needs a binding.
  TestWidgetsFlutterBinding.ensureInitialized();

  group('isHdrRangeType', () {
    test('HDR range types, Dolby Vision included', () {
      for (final range in [
        'HDR10',
        'HDR10Plus',
        'HLG',
        'DOVI',
        'DOVIWithHDR10',
        'DOVIWithSDR',
      ]) {
        expect(isHdrRangeType(range), isTrue, reason: range);
      }
    });

    test('SDR, Unknown and missing are SDR', () {
      expect(isHdrRangeType('SDR'), isFalse);
      expect(isHdrRangeType('Unknown'), isFalse);
      expect(isHdrRangeType(''), isFalse);
      expect(isHdrRangeType(null), isFalse);
    });
  });

  group('isHdrVideoParams', () {
    test('PQ and HLG transfers are HDR', () {
      expect(isHdrVideoParams(gamma: 'pq', primaries: 'bt.2020'), isTrue);
      expect(isHdrVideoParams(gamma: 'st2084', primaries: 'bt.2020'), isTrue);
      expect(isHdrVideoParams(gamma: 'hlg', primaries: 'bt.2020'), isTrue);
    });

    test('plain SDR is not', () {
      expect(isHdrVideoParams(gamma: 'bt.1886', primaries: 'bt.709'), isFalse);
      expect(isHdrVideoParams(gamma: 'srgb', primaries: 'bt.709'), isFalse);
      expect(isHdrVideoParams(gamma: null, primaries: null), isFalse);
    });

    test('BT.2020 primaries alone count, which is the Profile 5 case', () {
      // A Dolby Vision Profile 5 stream has no HDR10 base layer and often no
      // VUI transfer characteristic, so mpv reports it as SDR until libplacebo
      // applies the RPU - which only happens once the native window is
      // engaged, which is the decision this feeds.
      expect(isHdrVideoParams(gamma: 'bt.1886', primaries: 'bt.2020'), isTrue);
      expect(isHdrVideoParams(gamma: null, primaries: 'bt.2020'), isTrue);
    });

    test('case variants of the transfer are accepted', () {
      expect(isHdrVideoParams(gamma: 'PQ', primaries: 'BT.709'), isTrue);
      expect(isHdrVideoParams(gamma: 'HLG', primaries: 'BT.709'), isTrue);
    });
  });

  group('HdrOutputStatus', () {
    test('only active counts as engaged', () {
      expect(HdrOutputStatus.active.isActive, isTrue);
      for (final status in HdrOutputStatus.values.where(
        (s) => s != HdrOutputStatus.active,
      )) {
        expect(status.isActive, isFalse);
      }
    });
  });

  group('HdrOutputController.maybeEngage', () {
    late _FakeWindow window;
    late List<String> asked;

    setUp(() {
      window = _FakeWindow();
      asked = [];
    });

    Future<int?> decide(
      HdrOutputController controller, {
      bool sdrUsesTexturePath = false,
      bool isHdrContent = false,
      bool mpvAccepts = true,
    }) {
      // The tests below exercise the gates past the presenter one; without a
      // presenting screen nothing is ever decided, covered by its own test.
      controller.presenter = Object();
      return controller.maybeEngage(
        sdrUsesTexturePath: sdrUsesTexturePath,
        isHdrContent: isHdrContent,
        engageMpv: (handle) async {
          asked.add('engage $handle');
          return mpvAccepts;
        },
      );
    }

    test('starts out undecided, which the next decision may reopen', () {
      final status = HdrOutputController(window: window).status.value;
      expect(status, HdrOutputStatus.contentIsSdr);
      expect(status.isRevisitable, isTrue);
    });

    test('no presenter, no decision - Live TV must never engage', () async {
      final controller = HdrOutputController(window: window);
      final result = await controller.maybeEngage(
        sdrUsesTexturePath: false,
        isHdrContent: true,
        engageMpv: (_) async {
          asked.add('engage');
          return true;
        },
      );

      // The backend is a shared singleton; only the video player screen can
      // present the native window. Without it, engaging would swap mpv onto a
      // window nothing shows and black out whoever is actually rendering.
      expect(result, isNull);
      expect(asked, isEmpty);
      expect(window.createCalls, 0);
      expect(controller.isEngaged, isFalse);
    });

    test(
      'compatibility mode keeps SDR on the texture, and may reopen',
      () async {
        final controller = HdrOutputController(window: window);
        expect(await decide(controller, sdrUsesTexturePath: true), isNull);

        expect(controller.status.value, HdrOutputStatus.contentIsSdr);
        expect(controller.status.value.isRevisitable, isTrue);
        expect(asked, isEmpty);
        expect(window.createCalls, 0);

        // A later HDR title in the same session still takes the native window.
        expect(
          await decide(
            controller,
            sdrUsesTexturePath: true,
            isHdrContent: true,
          ),
          4242,
        );
        expect(controller.status.value, HdrOutputStatus.active);
        expect(asked, ['engage 4242']);
      },
    );

    test('only the undecided state is revisitable', () {
      expect(HdrOutputStatus.contentIsSdr.isRevisitable, isTrue);
      // A failure is deliberately sticky so a broken setup is not retried on
      // every video-params event.
      expect(HdrOutputStatus.failed.isRevisitable, isFalse);
      expect(HdrOutputStatus.active.isRevisitable, isFalse);
    });

    test('engages and hands mpv the handle, whatever the content', () async {
      final controller = HdrOutputController(window: window);
      expect(await decide(controller), 4242);

      // SDR takes the native window too: mpv paces it against the display,
      // which the texture path cannot.
      expect(controller.status.value, HdrOutputStatus.active);
      expect(controller.isEngaged, isTrue);
      expect(asked, ['engage 4242']);
      expect(window.createCalls, 1);
      expect(window.destroyCalls, 0);
    });

    test('engagement is sticky: the second item decides nothing', () async {
      final controller = HdrOutputController(window: window);
      await decide(controller);
      asked.clear();

      expect(await decide(controller), 4242);
      // Player and VideoController are built once as a startup singleton, so
      // the path cannot be swapped per item - and re-deciding would recreate
      // the window on every title.
      expect(asked, isEmpty);
      expect(window.createCalls, 1);
    });

    test('mpv refusing the handle fails and tears the window down', () async {
      final controller = HdrOutputController(window: window);
      expect(await decide(controller, mpvAccepts: false), isNull);

      expect(controller.status.value, HdrOutputStatus.failed);
      expect(controller.hasFailed, isTrue);
      expect(controller.isEngaged, isFalse);
      // Leaving it up would float a black window over the player.
      expect(window.destroyCalls, 1);
    });

    test('a window that cannot be created fails without asking mpv', () async {
      final broken = _FakeWindow(createReturns: null);
      final controller = HdrOutputController(window: broken);
      expect(await decide(controller), isNull);

      expect(controller.status.value, HdrOutputStatus.failed);
      expect(asked, isEmpty);
    });

    test('failure is sticky, so a broken setup is not retried', () async {
      final controller = HdrOutputController(window: window);
      await decide(controller, mpvAccepts: false);
      asked.clear();

      expect(await decide(controller), isNull);
      expect(asked, isEmpty);
      expect(window.createCalls, 1);
    });

    test('settled waits out a handover still in flight', () async {
      // A release that ran mid-handover would see nothing engaged and skip
      // the texture restore, then the handover would land on a destroyed
      // window. Waiting on settled lets the release see the real outcome.
      final controller = HdrOutputController(window: window)
        ..presenter = Object();
      final mpv = Completer<bool>();
      final engaging = controller.maybeEngage(
        sdrUsesTexturePath: false,
        isHdrContent: false,
        engageMpv: (_) => mpv.future,
      );

      var settled = false;
      unawaited(controller.settled.then((_) => settled = true));
      await pumpEventQueue();
      expect(settled, isFalse);
      expect(controller.isEngaged, isFalse);

      // The presenter leaves mid-handover: no second decision may start.
      controller.presenter = null;
      expect(
        await controller.maybeEngage(
          sdrUsesTexturePath: false,
          isHdrContent: false,
          engageMpv: (_) async => true,
        ),
        isNull,
      );

      mpv.complete(true);
      await engaging;
      await pumpEventQueue();
      expect(settled, isTrue);
      expect(controller.isEngaged, isTrue);
      expect(window.createCalls, 1);
    });

    test('a main video engages before its screen has mounted', () async {
      // play() runs before the player screen mounts. Waiting for it put the
      // first frames on the texture and flashed when mpv moved over.
      final controller = HdrOutputController(window: window);
      final result = await controller.maybeEngage(
        sdrUsesTexturePath: false,
        isHdrContent: false,
        beforePresenter: true,
        engageMpv: (handle) async {
          asked.add('engage $handle');
          return true;
        },
      );

      expect(result, 4242);
      expect(controller.isEngaged, isTrue);
      expect(asked, ['engage 4242']);
    });

    test('engaging ahead still keeps SDR on the texture in compatibility '
        'mode', () async {
      final controller = HdrOutputController(window: window);
      final result = await controller.maybeEngage(
        sdrUsesTexturePath: true,
        isHdrContent: false,
        beforePresenter: true,
        engageMpv: (_) async => true,
      );

      expect(result, isNull);
      expect(controller.status.value, HdrOutputStatus.contentIsSdr);
      expect(window.createCalls, 0);
    });

    test('settled is immediate with nothing in flight', () async {
      await HdrOutputController(window: window).settled;
    });

    test('a status change notifies, so the player can swap surfaces', () async {
      final controller = HdrOutputController(window: window);
      var notified = 0;
      controller.status.addListener(() => notified++);

      await decide(controller);

      // Engagement lands after the player screen's last build; without this
      // the surface swap would wait for an unrelated setState.
      expect(notified, greaterThanOrEqualTo(1));
      expect(controller.status.value, HdrOutputStatus.active);
    });
  });

  group('HdrVideoWindow over the platform channel', () {
    const channel = MethodChannel('moonfin/hdr_video');
    late List<MethodCall> calls;

    setUp(() {
      calls = [];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            calls.add(call);
            return call.method == 'create' ? 99 : null;
          });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('create is asked once and the handle is kept', () async {
      final window = HdrVideoWindow();
      expect(await window.create(), 99);
      expect(await window.create(), 99);
      expect(calls.where((c) => c.method == 'create'), hasLength(1));
      expect(window.handle, 99);
    });

    test('geometry and visibility drop duplicates', () async {
      final window = HdrVideoWindow();
      await window.create();
      calls.clear();

      const rect = Rect.fromLTWH(0, 0, 1920, 1080);
      await window.setGeometry(rect);
      await window.setGeometry(rect);
      await window.setVisible(true);
      await window.setVisible(true);

      expect(calls.map((c) => c.method), ['setGeometry', 'setVisible']);
    });

    test('release only listens to the presenter that claimed it', () async {
      final window = HdrVideoWindow();
      await window.create();
      final claimant = Object();
      await window.claim(claimant, const Rect.fromLTWH(0, 0, 100, 100));
      calls.clear();

      // The outgoing player screen disposing after its successor has already
      // taken over must not hide the window out from under it.
      await window.release(Object());
      expect(calls, isEmpty);

      await window.release(claimant);
      expect(calls.single.method, 'setVisible');
      expect((calls.single.arguments as Map)['visible'], isFalse);
    });
  });

  group('HdrOverlayChannel', () {
    const channel = MethodChannel('moonfin/hdr_overlay');
    late List<MethodCall> calls;

    setUp(() {
      calls = [];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            calls.add(call);
            return null;
          });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('push sends rounded geometry alongside the pixels', () async {
      await HdrOverlayChannel().push(
        x: 10.6,
        y: 20.2,
        pixels: Uint8List(16),
        width: 2,
        height: 2,
      );

      final args = calls.single.arguments as Map;
      expect(calls.single.method, 'push');
      expect(args['x'], 11);
      expect(args['y'], 20);
      expect(args['width'], 2);
      expect(args['height'], 2);
      expect((args['bytes'] as Uint8List), hasLength(16));
    });

    test(
      'a missing plugin latches off, so a non-Windows build goes quiet',
      () async {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, (call) async {
              calls.add(call);
              throw MissingPluginException();
            });

        final overlay = HdrOverlayChannel();
        await overlay.push(
          x: 0,
          y: 0,
          pixels: Uint8List(4),
          width: 1,
          height: 1,
        );
        await overlay.hide();
        await overlay.push(
          x: 0,
          y: 0,
          pixels: Uint8List(4),
          width: 1,
          height: 1,
        );

        // The first call discovers there is no runner half; nothing after it
        // should keep paying to find that out again, on a path that otherwise
        // runs many times a second.
        expect(calls, hasLength(1));
      },
    );
  });
}
