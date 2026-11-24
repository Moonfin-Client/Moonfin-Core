import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:moonfin/ui/widgets/paced_network_image.dart';

class _Codec implements ui.Codec {
  _Codec(this._image, {required this.frameCount});

  final ui.Image _image;

  @override
  final int frameCount;

  @override
  int get repetitionCount => -1;

  @override
  Future<ui.FrameInfo> getNextFrame() =>
      Future.value(_Frame(_image.clone()));

  @override
  void dispose() {}
}

class _Frame implements ui.FrameInfo {
  _Frame(this.image);

  @override
  final ui.Image image;

  @override
  Duration get duration => const Duration(milliseconds: 70);
}

// Issue #1681: Flutter's own completer asked for a redraw as soon as it had
// the next GIF frame, so an animated avatar redrew the window twice per frame.
void main() {
  late ui.Image image;
  var shown = 0;
  final listener = ImageStreamListener((info, _) {
    shown++;
    info.dispose();
  });

  setUp(() => shown = 0);

  testWidgets('an animation asks for a frame only once the shown one is due', (
    tester,
  ) async {
    image = (await tester.runAsync(() => createTestImage(width: 4, height: 4)))!;
    final completer = PacedFrameCompleter(
      Future<ui.Codec>.value(_Codec(image, frameCount: 2)),
    )..addListener(listener);

    await tester.pump();
    await tester.pump();
    expect(shown, 1);
    expect(tester.binding.hasScheduledFrame, isFalse);

    await tester.pump(const Duration(milliseconds: 50));
    expect(shown, 1);
    expect(tester.binding.hasScheduledFrame, isFalse);

    await tester.pump(const Duration(milliseconds: 30));
    expect(shown, 2);

    completer.removeListener(listener);
    image.dispose();
  });

  testWidgets('a still image shows once and asks for nothing more', (
    tester,
  ) async {
    image = (await tester.runAsync(() => createTestImage(width: 4, height: 4)))!;
    final completer = PacedFrameCompleter(
      Future<ui.Codec>.value(_Codec(image, frameCount: 1)),
    )..addListener(listener);

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(shown, 1);
    expect(tester.binding.hasScheduledFrame, isFalse);

    completer.removeListener(listener);
    image.dispose();
  });

  testWidgets('one picture drawn at two sizes at once is downloaded once', (
    tester,
  ) async {
    image = (await tester.runAsync(
      () => createTestImage(width: 4, height: 4),
    ))!;
    final requests = <Uri>[];
    final answer = Completer<http.Response>();
    PacedNetworkImage.httpGet = (url, {headers}) {
      requests.add(url);
      return answer.future;
    };
    addTearDown(() => PacedNetworkImage.httpGet = http.get);
    var decoded = 0;
    Future<ui.Codec> decode(
      ui.ImmutableBuffer buffer, {
      ui.TargetImageSizeCallback? getTargetSize,
    }) async {
      decoded++;
      buffer.dispose();
      return _Codec(image, frameCount: 1);
    }

    const avatar = PacedNetworkImage(
      'https://emby.example/Users/u1/Images/Primary?tag=a',
    );
    final big = avatar.loadImage(avatar, decode)..addListener(listener);
    final small = avatar.loadImage(avatar, decode)..addListener(listener);
    await tester.runAsync(() async {
      answer.complete(http.Response.bytes([1, 2, 3], 200));
      await Future<void>.delayed(const Duration(milliseconds: 10));
    });
    await tester.pump();

    expect(requests, hasLength(1));
    expect(decoded, 2);
    expect(shown, 2);

    // Once it is done, a later load asks again.
    final later = avatar.loadImage(avatar, decode)..addListener(listener);
    expect(requests, hasLength(2));

    for (final c in [big, small, later]) {
      c.removeListener(listener);
    }
    image.dispose();
  });
}
