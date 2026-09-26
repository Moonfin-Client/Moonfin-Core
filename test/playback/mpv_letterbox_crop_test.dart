import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/letterbox_croppers.dart';
import 'package:moonfin/playback/media3_letterbox_crop.dart';
import 'package:moonfin/playback/mpv_letterbox_crop.dart';
import 'package:playback_core/playback_core.dart';

bool _isVideoCrop(List<String> args, String spec) =>
    args.length >= 3 &&
    args[0] == 'set' &&
    args[1] == 'file-local-options/video-crop' &&
    args[2] == spec;

class _MpvDetectHost extends _RecordingHost {
  Map<String, String> lavfi = const {
    'w': '1920',
    'h': '804',
    'x': '0',
    'y': '138',
  };
  String? hwdecCurrent;

  @override
  Future<String?> getProperty(String key) async {
    if (key == 'width') return '1920';
    if (key == 'height') return '1080';
    if (key == 'hwdec-current' || key == 'hwdec') return hwdecCurrent;
    if (key == 'video-params/hw-pixelformat') {
      return hwdecCurrent == null ? null : 'nv12';
    }
    if (key == 'sub-pos') return subtitlePosition;
    for (final entry in lavfi.entries) {
      if (key == MpvLetterboxCrop.metadataProperty(entry.key)) {
        return entry.value;
      }
    }
    return null;
  }
}

class _RecordingHost implements MpvLetterboxHost {
  final commands = <List<String>>[];
  final setProperties = <String, String>{};
  String subtitlePosition = '100';

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
  Future<void> setProperty(String key, String value) async {
    setProperties[key] = value;
    if (key == 'sub-pos') subtitlePosition = value;
  }

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

    test('classify ignores a dark inner blob', () {
      expect(
        LetterboxCrop.classify(
          width: 1000,
          height: 400,
          x: 400,
          y: 300,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ).kind,
        LetterboxSampleKind.ignore,
      );
    });

    test('classify treats a full-frame as uncrop', () {
      expect(
        LetterboxCrop.classify(
          width: 1920,
          height: 1080,
          x: 0,
          y: 0,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ).kind,
        LetterboxSampleKind.fullFrame,
      );
    });
  });

  group('LetterboxCropStabilizer', () {
    const letterbox = LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138);
    const imax = LetterboxCropRect(w: 1920, h: 1080, x: 0, y: 0);

    LetterboxCropDecision observe(
      LetterboxCropStabilizer stabilizer,
      LetterboxCropRect rect,
    ) {
      return stabilizer.observe(
        width: rect.w,
        height: rect.h,
        x: rect.x,
        y: rect.y,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
    }

    test('one letterbox sample does not apply', () {
      final stabilizer = LetterboxCropStabilizer();
      expect(observe(stabilizer, letterbox).changed, isFalse);
    });

    test('two matching letterbox samples apply', () {
      final stabilizer = LetterboxCropStabilizer();
      expect(observe(stabilizer, letterbox).changed, isFalse);
      final decision = observe(stabilizer, letterbox);
      expect(decision.changed, isTrue);
      expect(decision.rect, letterbox);
    });

    test('a dark frame after one sample resets the streak', () {
      final stabilizer = LetterboxCropStabilizer();
      observe(stabilizer, letterbox);
      expect(
        stabilizer
            .observe(
              width: 400,
              height: 200,
              x: 760,
              y: 440,
              sourceWidth: 1920,
              sourceHeight: 1080,
            )
            .changed,
        isFalse,
      );
      expect(observe(stabilizer, letterbox).changed, isFalse);
    });

    test('already-applied crop does not re-apply', () {
      final stabilizer = LetterboxCropStabilizer();
      observe(stabilizer, letterbox);
      observe(stabilizer, letterbox);
      expect(observe(stabilizer, letterbox).changed, isFalse);
    });

    test('uncrop needs two full-frame samples after a crop', () {
      final stabilizer = LetterboxCropStabilizer();
      observe(stabilizer, letterbox);
      observe(stabilizer, letterbox);
      expect(observe(stabilizer, imax).changed, isFalse);
      final decision = observe(stabilizer, imax);
      expect(decision.changed, isTrue);
      expect(decision.rect, isNull);
    });

    test('a trusted crop returns after one sample', () {
      final stabilizer = LetterboxCropStabilizer();
      observe(stabilizer, letterbox);
      observe(stabilizer, letterbox);
      observe(stabilizer, imax);
      observe(stabilizer, imax);
      final decision = observe(stabilizer, letterbox);
      expect(decision.changed, isTrue);
      expect(decision.rect, letterbox);
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

  group('MpvLetterboxCrop.filterSpec', () {
    test('one-shot cropdetect accumulates', () {
      expect(MpvLetterboxCrop.filterSpec(), contains('reset=0'));
    });

    test('continuous cropdetect resets each frame', () {
      expect(
        MpvLetterboxCrop.filterSpec(resetEachFrame: true),
        contains('reset=1'),
      );
    });

    test('8-bit hardware frames download as nv12', () {
      expect(MpvLetterboxCrop.downloadFormatFor('nv12'), 'nv12');
      expect(
        MpvLetterboxCrop.filterSpec(downloadFormat: 'nv12'),
        contains('hwdownload,format=nv12,cropdetect='),
      );
    });

    test('16:9 window zooms a wider crop; a wider window does not', () {
      expect(
        MpvLetterboxCrop.fillScale(
          cropWidth: 3840,
          cropHeight: 1920,
          windowWidth: 3840,
          windowHeight: 2160,
        ),
        closeTo(3840 / 1920 / (3840 / 2160), 0.0001),
      );
      expect(
        MpvLetterboxCrop.fillScale(
          cropWidth: 3840,
          cropHeight: 1920,
          windowWidth: 3440,
          windowHeight: 1440,
        ),
        1,
      );
    });

    test('10-bit hardware frames download as p010le only', () {
      expect(MpvLetterboxCrop.downloadFormatFor('p010'), 'p010le');
      expect(
        MpvLetterboxCrop.filterSpec(downloadFormat: 'p010le'),
        contains('hwdownload,format=p010le,cropdetect='),
      );
      expect(
        MpvLetterboxCrop.filterSpec(downloadFormat: 'p010le'),
        isNot(contains('nv12')),
      );
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

    test('hwdecForCropdetect stays on the same accelerator', () {
      expect(MpvLetterboxCrop.hwdecForCropdetect('nvdec'), 'nvdec-copy');
      expect(MpvLetterboxCrop.hwdecForCropdetect('vaapi'), 'vaapi-copy');
      expect(MpvLetterboxCrop.hwdecForCropdetect('auto'), 'auto-copy');
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
        await cropper.setRecropInterval(const Duration(seconds: 1));
        await cropper.onSourceOpened('file://x');
        await cropper.recrop();
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

    test('supported mpv cropper applies one-shot detect', () {
      fakeAsync((async) {
        final host = _MpvDetectHost();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1920x804+0+138')),
          isTrue,
        );
        final applies = host.commands
            .where((args) => _isVideoCrop(args, '1920x804+0+138'))
            .length;
        async.elapse(const Duration(seconds: 5));
        async.flushMicrotasks();
        expect(
          host.commands
              .where((args) => _isVideoCrop(args, '1920x804+0+138'))
              .length,
          applies,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('nvdec keeps the decoder and downloads frames for cropdetect', () {
      fakeAsync((async) {
        final host = _MpvDetectHost()..hwdecCurrent = 'nvdec';
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.elapse(MpvLetterboxCrop.downloadWindow);
        async.flushMicrotasks();
        expect(
          host.commands.any(
            (args) =>
                args.length >= 3 &&
                args[0] == 'vf' &&
                args[1] == 'pre' &&
                args[2].contains('hwdownload,format=nv12,cropdetect='),
          ),
          isTrue,
        );
        expect(host.setProperties['hwdec'], isNull);
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1920x804+0+138')),
          isTrue,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('recrop runs detect again after one-shot', () {
      fakeAsync((async) {
        final host = _MpvDetectHost();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        host.commands.clear();
        host.lavfi = {'w': '1920', 'h': '800', 'x': '0', 'y': '140'};
        cropper.recrop();
        async.flushMicrotasks();
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1920x800+0+140')),
          isTrue,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('moves native subtitles inside the crop and restores them', () {
      fakeAsync((async) {
        final host = _MpvDetectHost();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        expect(host.subtitlePosition, '87.222');

        cropper.setEnabled(false);
        async.flushMicrotasks();
        expect(host.subtitlePosition, '100');
        cropper.cancel();
      });
    });

    test('every-second mode applies after two samples', () {
      fakeAsync((async) {
        final host = _MpvDetectHost();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
        );
        cropper.setRecropInterval(const Duration(seconds: 1));
        cropper.setEnabled(true);
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 2));
        async.flushMicrotasks();
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1920x804+0+138')),
          isTrue,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
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

    test('recrop samples again after one-shot', () async {
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
      host.detectCalls = 0;
      host.detectResult = {
        'w': 1920,
        'h': 800,
        'x': 0,
        'y': 140,
        'sourceWidth': 1920,
        'sourceHeight': 1080,
      };
      await cropper.recrop();
      await Future<void>.delayed(Duration.zero);
      expect(host.detectCalls, 1);
      expect(
        host.applied.last,
        const LetterboxCropRect(w: 1920, h: 800, x: 0, y: 140),
      );
    });

    test('every-second mode applies after two samples', () {
      fakeAsync((async) {
        final host = _Media3RecordingHost();
        final cropper = Media3LetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
        );
        cropper.setRecropInterval(const Duration(seconds: 1));
        cropper.setEnabled(true);
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 2));
        async.flushMicrotasks();
        expect(host.detectCalls, 2);
        expect(
          host.applied.last,
          const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138),
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('a dark frame does not apply a crop', () {
      fakeAsync((async) {
        final host = _Media3RecordingHost()
          ..detectResult = {
            'w': 400,
            'h': 200,
            'x': 760,
            'y': 440,
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
        cropper.setEnabled(true);
        async.flushMicrotasks();
        expect(host.applied, everyElement(isNull));
        cropper.cancel();
        async.flushMicrotasks();
      });
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
