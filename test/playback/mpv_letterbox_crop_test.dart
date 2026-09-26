import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/letterbox_croppers.dart';
import 'package:moonfin/playback/media3_letterbox_crop.dart';
import 'package:moonfin/playback/mpv_frame_sample.dart';
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

  /// Holds the first step of an apply open, so a test can land between steps.
  Completer<void>? subPositionGate;

  @override
  Future<String?> getProperty(String key) async {
    if (key == 'width') return '1920';
    if (key == 'height') return '1080';
    if (key == 'hwdec-current' || key == 'hwdec') return hwdecCurrent;
    if (key == 'video-params/hw-pixelformat') {
      return hwdecCurrent == null ? null : 'nv12';
    }
    if (key == 'sub-pos') {
      await subPositionGate?.future;
      return subtitlePosition;
    }
    for (final entry in lavfi.entries) {
      if (key == MpvLetterboxCrop.metadataProperty(entry.key)) {
        return entry.value;
      }
    }
    return null;
  }
}

/// Software frame shots, one queued rect per sample.
class _MpvShotHost extends _MpvDetectHost implements MpvFrameSampleHost {
  _MpvShotHost(this.shots);

  final List<LetterboxCropRect?> shots;
  int shotCalls = 0;

  @override
  Future<MpvFrameSample?> sampleFrame(int width, int height) async {
    final rect = shots[shotCalls.clamp(0, shots.length - 1)];
    shotCalls++;
    return MpvFrameSample(rect: rect, elapsed: Duration.zero);
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

    test('classify keeps a centred windowbox at a known ratio', () {
      final sample = LetterboxCrop.classify(
        width: 1600,
        height: 900,
        x: 160,
        y: 90,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(sample.kind, LetterboxSampleKind.crop);
      expect(
        sample.rect,
        const LetterboxCropRect(w: 1600, h: 900, x: 160, y: 90),
      );
    });

    test('classify keeps the 2.5:1 production-copy windowbox', () {
      // 1920x1080 screengrab from PR #1524, bars on all four sides.
      expect(
        LetterboxCrop.classify(
          width: 1780,
          height: 712,
          x: 70,
          y: 184,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ).kind,
        LetterboxSampleKind.crop,
      );
    });

    test('classify ignores a centred square blob', () {
      expect(
        LetterboxCrop.classify(
          width: 1000,
          height: 1000,
          x: 460,
          y: 40,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ).kind,
        LetterboxSampleKind.ignore,
      );
    });

    test('classify ignores an off-centre windowbox', () {
      expect(
        LetterboxCrop.classify(
          width: 1600,
          height: 900,
          x: 40,
          y: 90,
          sourceWidth: 1920,
          sourceHeight: 1080,
        ).kind,
        LetterboxSampleKind.ignore,
      );
    });

    test('stabilizer needs three hits for a windowbox', () {
      final stabilizer = LetterboxCropStabilizer();
      LetterboxCropDecision observe() => stabilizer.observe(
        width: 1600,
        height: 900,
        x: 160,
        y: 90,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(observe().changed, isFalse);
      expect(observe().changed, isFalse);
      expect(observe().changed, isTrue);
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

  group('LetterboxCrop.isKnownRatio', () {
    bool known(int w, int h) => LetterboxCrop.isKnownRatio(
      width: w,
      height: h,
      sourceWidth: 1920,
      sourceHeight: 1080,
    );

    test('reads the crop shape, not the source width', () {
      expect(known(1920, 804), isTrue);
      expect(known(1440, 1080), isTrue);
      // About 2.02:1. Full width used to match 16:9 through the source.
      expect(known(1920, 950), isFalse);
    });

    test('the stabilizer waits three hits for an unlisted ratio', () {
      final stabilizer = LetterboxCropStabilizer();
      LetterboxCropDecision observe() => stabilizer.observe(
        width: 1920,
        height: 950,
        x: 0,
        y: 64,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(observe().changed, isFalse);
      expect(observe().changed, isFalse);
      expect(observe().changed, isTrue);
    });
  });

  group('LetterboxCrop.seeked', () {
    bool seeked(int beforeMs, int afterMs, {double speed = 1}) =>
        LetterboxCrop.seeked(
          before: Duration(milliseconds: beforeMs),
          after: Duration(milliseconds: afterMs),
          elapsed: const Duration(seconds: 5),
          speed: speed,
        );

    test('faster playback is not a seek', () {
      expect(seeked(0, 7500, speed: 1.5), isFalse);
      expect(seeked(0, 7500), isTrue);
    });

    test('a pause is not a seek', () {
      expect(seeked(10000, 10000), isFalse);
    });

    test('a jump either way is a seek', () {
      expect(seeked(0, 60000, speed: 1.5), isTrue);
      expect(seeked(60000, 50000), isTrue);
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

    test('one-shot shots keep going while a crop still needs hits', () {
      fakeAsync((async) {
        // Dark frame first, then an unlisted 2:1 ratio that needs three hits.
        const wide = LetterboxCropRect(w: 1920, h: 950, x: 0, y: 64);
        final host = _MpvShotHost([
          const LetterboxCropRect(w: 400, h: 200, x: 760, y: 440),
          wide,
          wide,
          wide,
        ]);
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
        );
        cropper.setEnabled(true);
        async.elapse(const Duration(seconds: 3));
        expect(host.shotCalls, 4);
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1920x950+0+64')),
          isTrue,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('one-shot confirms a windowbox before cropping it', () {
      fakeAsync((async) {
        final host = _MpvDetectHost()
          ..lavfi = {'w': '1780', 'h': '712', 'x': '70', 'y': '184'};
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1780x712+70+184')),
          isFalse,
        );
        async.elapse(const Duration(seconds: 3));
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1780x712+70+184')),
          isTrue,
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('one-shot drops a windowbox that goes away', () {
      fakeAsync((async) {
        final host = _MpvDetectHost()
          ..lavfi = {'w': '1780', 'h': '712', 'x': '70', 'y': '184'};
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        // The title card fades into a full-frame shot.
        host.lavfi = {'w': '1920', 'h': '1080', 'x': '0', 'y': '0'};
        async.elapse(const Duration(seconds: 3));
        expect(
          host.commands.any((args) => _isVideoCrop(args, '1780x712+70+184')),
          isFalse,
        );
        expect(cropper.isApplied, isFalse);
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('a disable during an apply still ends uncropped', () {
      fakeAsync((async) {
        final host = _MpvDetectHost()..subPositionGate = Completer<void>();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        // The apply is parked on its sub-pos read.
        cropper.setEnabled(false);
        async.flushMicrotasks();
        host.subPositionGate!.complete();
        async.flushMicrotasks();
        final crops = host.commands
            .where(
              (args) =>
                  args.length >= 3 &&
                  args[0] == 'set' &&
                  args[1] == 'file-local-options/video-crop',
            )
            .toList();
        expect(crops.last[2], '');
        expect(cropper.isApplied, isFalse);
        expect(host.subtitlePosition, '100');
        cropper.cancel();
      });
    });

    test('panscan is rewritten after the video view reset it', () {
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
        expect(host.setProperties['panscan'], '1');
        expect(cropper.fillsFrame, isTrue);

        host.setProperties['panscan'] = '0.0';
        host.lavfi = {'w': '1920', 'h': '800', 'x': '0', 'y': '140'};
        cropper.recrop();
        async.flushMicrotasks();
        expect(host.setProperties['panscan'], '1');
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('leaves panscan alone when the video view owns it', () {
      fakeAsync((async) {
        final host = _MpvDetectHost();
        final cropper = MpvLetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
          detectDuration: Duration.zero,
          managePanscan: false,
        );
        cropper.setEnabled(true);
        async.flushMicrotasks();
        expect(cropper.isApplied, isTrue);
        expect(cropper.fillsFrame, isTrue);
        expect(host.setProperties.containsKey('panscan'), isFalse);
        cropper.cancel();
        async.flushMicrotasks();
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

    test('every-second mode survives a long pause', () {
      fakeAsync((async) {
        final host = _Media3RecordingHost()..isPlaying = false;
        final cropper = Media3LetterboxCropper(
          host,
          supported: true,
          autoDelay: Duration.zero,
        );
        cropper.setRecropInterval(const Duration(seconds: 1));
        cropper.setEnabled(true);
        async.elapse(const Duration(minutes: 2));
        expect(host.detectCalls, 0);

        host.isPlaying = true;
        host.playing.add(true);
        async.elapse(const Duration(seconds: 3));
        expect(host.detectCalls, greaterThanOrEqualTo(2));
        expect(
          host.applied.last,
          const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138),
        );
        cropper.cancel();
        async.flushMicrotasks();
      });
    });

    test('a scan where every capture failed can run again', () async {
      final host = _Media3RecordingHost()..detectResult = null;
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

      host.detectResult = {
        'w': 1920,
        'h': 804,
        'x': 0,
        'y': 138,
        'sourceWidth': 1920,
        'sourceHeight': 1080,
      };
      await cropper.onSourceOpened('file://movie.mkv');
      await Future<void>.delayed(Duration.zero);
      expect(host.detectCalls, 2);
      expect(
        host.applied.last,
        const LetterboxCropRect(w: 1920, h: 804, x: 0, y: 138),
      );
    });

    test('one-shot confirms a windowbox before cropping it', () async {
      final host = _Media3RecordingHost()
        ..detectResult = {
          'w': 1780,
          'h': 712,
          'x': 70,
          'y': 184,
          'sourceWidth': 1920,
          'sourceHeight': 1080,
        };
      final cropper = Media3LetterboxCropper(
        host,
        supported: true,
        autoDelay: Duration.zero,
        sampleCount: 1,
        sampleGap: Duration.zero,
        windowboxGap: Duration.zero,
      );
      await cropper.setEnabled(true);
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(host.detectCalls, 1 + LetterboxCrop.windowboxConfirmations);
      expect(
        host.applied.last,
        const LetterboxCropRect(w: 1780, h: 712, x: 70, y: 184),
      );
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
  double playbackSpeed = 1.0;

  final playing = StreamController<bool>.broadcast();

  @override
  Stream<bool> get playingStream => playing.stream;

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
