import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/letterbox_croppers.dart';
import 'package:moonfin/playback/media3_letterbox_crop.dart';
import 'package:moonfin/playback/mpv_letterbox_crop.dart';
import 'package:playback_core/playback_core.dart';

class _RecordingHost implements MpvLetterboxHost {
  final commands = <List<String>>[];

  @override
  bool hasNativePlayer = true;

  @override
  bool isDisposed = false;

  @override
  bool isPlaying = true;

  @override
  Duration position = Duration.zero;

  @override
  Duration duration = const Duration(minutes: 10);

  @override
  String? currentUrl = 'file://movie.mkv';

  @override
  Stream<bool> get playingStream => const Stream.empty();

  @override
  Future<String?> getProperty(String key) async => null;

  @override
  Future<void> setProperty(String key, String value) async {}

  @override
  Future<bool> command(List<String> args) async {
    commands.add(args);
    return true;
  }
}

void main() {
  group('MpvLetterboxCrop.parseVfMetadata', () {
    test('reads JSON lavfi keys', () {
      const raw =
          '{"lavfi.cropdetect.w":"1920","lavfi.cropdetect.h":"804","lavfi.cropdetect.x":"0","lavfi.cropdetect.y":"138"}';
      expect(MpvLetterboxCrop.parseVfMetadata(raw), {
        'w': '1920',
        'h': '804',
        'x': '0',
        'y': '138',
      });
    });

    test('reads key=value lavfi dump', () {
      const raw =
          'lavfi.cropdetect.w=1920 lavfi.cropdetect.h=804 lavfi.cropdetect.x=0 lavfi.cropdetect.y=138';
      expect(MpvLetterboxCrop.parseVfMetadata(raw)['h'], '804');
    });

    test('empty input is empty map', () {
      expect(MpvLetterboxCrop.parseVfMetadata(null), isEmpty);
      expect(MpvLetterboxCrop.parseVfMetadata('null'), isEmpty);
    });
  });

  group('LetterboxCrop.decide', () {
    test('crops letterbox bars', () {
      final rect = LetterboxCrop.decide(
        width: 1920,
        height: 804,
        x: 0,
        y: 138,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(rect, const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138));
      expect(rect!.videoCrop, '1920x804+0+138');
    });

    test('skips a full-frame detect', () {
      expect(
        LetterboxCrop.decide(
          width: 1920,
          height: 1080,
          x: 0,
          y: 0,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ),
        isNull,
      );
    });

    test('skips an over-crop', () {
      expect(
        LetterboxCrop.decide(
          width: 100,
          height: 100,
          x: 0,
          y: 0,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ),
        isNull,
      );
    });
  });

  group('MpvLetterboxCrop.decide', () {
    test('crops letterbox bars from lavfi', () {
      final rect = MpvLetterboxCrop.decide(
        lavfi: {'w': '1920', 'h': '804', 'x': '0', 'y': '138'},
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(rect, const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138));
    });
  });

  group('MpvLetterboxCrop.mustDisableHwdec', () {
    test('keeps copy and software decoders', () {
      expect(MpvLetterboxCrop.mustDisableHwdec('no'), isFalse);
      expect(MpvLetterboxCrop.mustDisableHwdec('auto-copy'), isFalse);
      expect(MpvLetterboxCrop.mustDisableHwdec('vaapi-copy'), isFalse);
    });

    test('disables zero-copy hwdec', () {
      expect(MpvLetterboxCrop.mustDisableHwdec('vaapi'), isTrue);
      expect(MpvLetterboxCrop.mustDisableHwdec('auto'), isTrue);
      expect(MpvLetterboxCrop.mustDisableHwdec('nvdec'), isTrue);
    });

    test('hwdecForCropdetect prefers auto-copy over software', () {
      expect(MpvLetterboxCrop.hwdecForCropdetect('nvdec'), 'auto-copy');
      expect(MpvLetterboxCrop.hwdecForCropdetect('vaapi-copy'), isNull);
      expect(MpvLetterboxCrop.hwdecForCropdetect('no'), isNull);
    });
  });

  group('LetterboxCropper stubs', () {
    test('Aether/HTML are unsupported no-ops', () async {
      const croppers = <LetterboxCropper>[
        AetherLetterboxCropper(),
        AppleTvLetterboxCropper(),
        HtmlLetterboxCropper(),
      ];
      for (final cropper in croppers) {
        expect(cropper.isSupported, isFalse);
        expect(cropper.unimplementedReason, isNotNull);
        await cropper.setEnabled(true);
        await cropper.onSourceOpened('file://x');
        await cropper.reset();
      }
    });

    test('unsupported mpv cropper never talks to libmpv', () async {
      final host = _RecordingHost();
      final cropper = MpvLetterboxCropper(host, supported: false);
      expect(cropper.isSupported, isFalse);
      await cropper.setEnabled(true);
      await cropper.onSourceOpened('file://movie.mkv');
      expect(host.commands, isEmpty);
    });
  });

  group('Media3LetterboxCrop.decide', () {
    test('crops letterbox bars from a PixelCopy detect', () {
      final rect = Media3LetterboxCrop.decide({
        'w': 1920,
        'h': 804,
        'x': 0,
        'y': 138,
        'sourceWidth': 1920,
        'sourceHeight': 1080,
      });
      expect(rect, const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138));
    });

    test('skips a full-frame detect', () {
      expect(
        Media3LetterboxCrop.decide({
          'w': 1920,
          'h': 1080,
          'x': 0,
          'y': 0,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        }),
        isNull,
      );
    });
  });

  group('Media3LetterboxCrop.widest', () {
    test('a dark frame does not win over a lit one', () {
      final merged = Media3LetterboxCrop.widest([
        {
          'w': 1920,
          'h': 804,
          'x': 0,
          'y': 138,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        },
        {
          'w': 1000,
          'h': 400,
          'x': 400,
          'y': 300,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        },
      ]);
      expect(merged, {
        'w': 1920,
        'h': 804,
        'x': 0,
        'y': 138,
        'sourceWidth': 1920,
        'sourceHeight': 1080,
      });
    });

    test('grows to cover every sample', () {
      final merged = Media3LetterboxCrop.widest([
        {
          'w': 800,
          'h': 400,
          'x': 100,
          'y': 200,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        },
        {
          'w': 800,
          'h': 400,
          'x': 300,
          'y': 100,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        },
      ]);
      expect(merged?['x'], 100);
      expect(merged?['y'], 100);
      expect(merged?['w'], 1000);
      expect(merged?['h'], 500);
    });

    test('nothing usable is null', () {
      expect(Media3LetterboxCrop.widest(const []), isNull);
      expect(
        Media3LetterboxCrop.widest([
          {'sourceWidth': 1920, 'sourceHeight': 1080},
        ]),
        isNull,
      );
    });
  });

  group('Media3LetterboxCropper', () {
    test('unsupported never talks to native', () async {
      final host = _Media3RecordingHost();
      final cropper = Media3LetterboxCropper(host, supported: false);
      expect(cropper.isSupported, isFalse);
      await cropper.setEnabled(true);
      await cropper.onSourceOpened('file://movie.mkv');
      expect(host.detectCalls, 0);
      expect(host.applied, isEmpty);
    });

    test('supported detect applies crop', () async {
      final host = _Media3RecordingHost();
      final cropper = Media3LetterboxCropper(
        host,
        supported: true,
        autoDelay: Duration.zero,
        sampleCount: 1,
        sampleGap: Duration.zero,
      );
      await cropper.setEnabled(true);
      await Future<void>.delayed(Duration.zero);
      expect(host.detectCalls, 1);
      expect(
        host.applied.last,
        const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138),
      );
    });

    test('samples more than one frame before deciding', () async {
      final host = _Media3RecordingHost();
      final cropper = Media3LetterboxCropper(
        host,
        supported: true,
        autoDelay: Duration.zero,
        sampleGap: Duration.zero,
      );
      await cropper.setEnabled(true);
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(host.detectCalls, Media3LetterboxCrop.sampleCount);
      expect(
        host.applied.last,
        const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138),
      );
    });

    test('full-frame detect does not apply a crop', () async {
      final host = _Media3RecordingHost()
        ..detectResult = {
          'w': 1920,
          'h': 1080,
          'x': 0,
          'y': 0,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        };
      final cropper = Media3LetterboxCropper(
        host,
        supported: true,
        autoDelay: Duration.zero,
        sampleCount: 1,
        sampleGap: Duration.zero,
      );
      await cropper.setEnabled(true);
      await Future<void>.delayed(Duration.zero);
      expect(host.detectCalls, 1);
      expect(host.applied, everyElement(isNull));
    });
  });
}

class _Media3RecordingHost implements Media3LetterboxHost {
  Map<String, int>? detectResult = const {
    'w': 1920,
    'h': 804,
    'x': 0,
    'y': 138,
    'sourceWidth': 1920,
    'sourceHeight': 1080,
  };
  final applied = <LetterboxCropRect?>[];
  int detectCalls = 0;

  @override
  bool isDisposed = false;

  @override
  bool isPlaying = true;

  @override
  Duration position = Duration.zero;

  @override
  Duration duration = const Duration(minutes: 10);

  @override
  String? currentUrl = 'file://movie.mkv';

  @override
  Stream<bool> get playingStream => const Stream.empty();

  @override
  Future<Map<String, int>?> detectLetterbox() async {
    detectCalls++;
    return detectResult;
  }

  @override
  Future<void> setLetterboxCrop(LetterboxCropRect? rect) async {
    applied.add(rect);
  }
}
