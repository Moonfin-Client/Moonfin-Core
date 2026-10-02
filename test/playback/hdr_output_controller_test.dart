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

  @override
  void transferOwnership({required Object from, required Object to}) =>
      log.add('transfer');
}

void main() {
  // The channel groups below mock the binary messenger, which needs a binding.
  TestWidgetsFlutterBinding.ensureInitialized();

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
      bool preferenceEnabled = true,
      bool isHdrContent = true,
      bool displayInHdrMode = true,
      bool mpvAccepts = true,
    }) {
      // The tests below exercise the gates past the presenter one; without a
      // presenting screen nothing is ever decided, covered by its own test.
      controller.presenter = Object();
      return controller.maybeEngage(
        preferenceEnabled: preferenceEnabled,
        isHdrContent: () async {
          asked.add('content');
          return isHdrContent;
        },
        displayInHdrMode: () async {
          asked.add('display');
          return displayInHdrMode;
        },
        engageMpv: (handle) async {
          asked.add('engage $handle');
          return mpvAccepts;
        },
      );
    }

    test('starts out reporting SDR content', () {
      expect(
        HdrOutputController(window: window).status.value,
        HdrOutputStatus.contentIsSdr,
      );
    });

    test('no presenter, no decision - Live TV must never engage', () async {
      final controller = HdrOutputController(window: window);
      final result = await controller.maybeEngage(
        preferenceEnabled: true,
        isHdrContent: () async {
          asked.add('content');
          return true;
        },
        displayInHdrMode: () async {
          asked.add('display');
          return true;
        },
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
      'the preference is the first gate, and nothing else is asked',
      () async {
        final controller = HdrOutputController(window: window);
        expect(await decide(controller, preferenceEnabled: false), isNull);

        expect(controller.status.value, HdrOutputStatus.disabledByPreference);
        // Both remaining checks are expensive - waiting on mpv's video-params,
        // and enumerating every display path - so neither may run once the
        // answer is already no.
        expect(asked, isEmpty);
        expect(window.createCalls, 0);
      },
    );

    test('SDR content stops before the display is queried', () async {
      final controller = HdrOutputController(window: window);
      expect(await decide(controller, isHdrContent: false), isNull);

      expect(controller.status.value, HdrOutputStatus.contentIsSdr);
      expect(asked, ['content']);
      expect(window.createCalls, 0);
    });

    test(
      'an SDR verdict is not sticky: the next decision starts over',
      () async {
        final controller = HdrOutputController(window: window);
        // mpv had not reported video-params yet when this was asked - a 4K
        // remux over the network can take longer than the bounded wait - so
        // the content read as SDR.
        await decide(controller, isHdrContent: false);
        expect(controller.status.value.isRevisitable, isTrue);
        asked.clear();

        // Once the params arrive the backend asks again, and this time every
        // gate must be re-run rather than the old answer returned.
        expect(await decide(controller), 4242);
        expect(controller.status.value, HdrOutputStatus.active);
        expect(asked, ['content', 'display', 'engage 4242']);
      },
    );

    test('only the expensive gates are revisitable', () {
      expect(HdrOutputStatus.contentIsSdr.isRevisitable, isTrue);
      expect(HdrOutputStatus.displayNotInHdrMode.isRevisitable, isTrue);
      // The preference is the user's choice, and a failure is deliberately
      // sticky so a broken setup is not retried on every video-params event.
      expect(HdrOutputStatus.disabledByPreference.isRevisitable, isFalse);
      expect(HdrOutputStatus.failed.isRevisitable, isFalse);
      expect(HdrOutputStatus.active.isRevisitable, isFalse);
    });

    test('an SDR display stops before the window is created', () async {
      final controller = HdrOutputController(window: window);
      expect(await decide(controller, displayInHdrMode: false), isNull);

      expect(controller.status.value, HdrOutputStatus.displayNotInHdrMode);
      expect(asked, ['content', 'display']);
      expect(window.createCalls, 0);
    });

    test('every gate open engages and hands mpv the handle', () async {
      final controller = HdrOutputController(window: window);
      expect(await decide(controller), 4242);

      expect(controller.status.value, HdrOutputStatus.active);
      expect(controller.isEngaged, isTrue);
      expect(asked, ['content', 'display', 'engage 4242']);
      expect(window.createCalls, 1);
      expect(window.destroyCalls, 0);
    });

    test('engagement is sticky: the second item decides nothing', () async {
      final controller = HdrOutputController(window: window);
      await decide(controller);
      asked.clear();

      expect(await decide(controller), 4242);
      // Player and VideoController are built once as a startup singleton, so
      // the path cannot be swapped per item - and re-deciding would pay for
      // both expensive checks again on every title.
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
      expect(asked, ['content', 'display']);
    });

    test('failure is sticky, so a broken setup is not retried', () async {
      final controller = HdrOutputController(window: window);
      await decide(controller, mpvAccepts: false);
      asked.clear();

      expect(await decide(controller), isNull);
      expect(asked, isEmpty);
      expect(window.createCalls, 1);
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
