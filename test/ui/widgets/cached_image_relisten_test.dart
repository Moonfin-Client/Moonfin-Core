import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

class _CountingCodec implements ui.Codec {
  _CountingCodec(this._image);

  final ui.Image _image;
  int decodes = 0;

  @override
  int get frameCount => 1;

  @override
  int get repetitionCount => 0;

  @override
  Future<ui.FrameInfo> getNextFrame() async {
    decodes++;
    return _Frame(_image.clone());
  }

  @override
  void dispose() {}
}

class _Frame implements ui.FrameInfo {
  _Frame(this.image);

  @override
  final ui.Image image;

  @override
  Duration get duration => Duration.zero;
}

Future<ImageStreamListener> _listenUntilShown(
  MultiImageStreamCompleter completer,
  List<ImageInfo> shown,
) async {
  final first = Completer<void>();
  final listener = ImageStreamListener((info, _) {
    shown.add(info);
    if (!first.isCompleted) first.complete();
  });
  completer.addListener(listener);
  await first.future;
  return listener;
}

void main() {
  // A row scrolled away and back drops its last listener and then returns to
  // the same completer. Decoding the image again on that return painted blank
  // on Firefox web.
  testWidgets('a returning listener gets the shown image without a decode', (
    tester,
  ) async {
    await tester.runAsync(() async {
      final image = await createTestImage(width: 4, height: 4);
      final codec = _CountingCodec(image);
      final completer = MultiImageStreamCompleter(
        codec: Stream<ui.Codec>.value(codec),
        scale: 1,
      );
      final shown = <ImageInfo>[];
      final first = await _listenUntilShown(completer, shown);

      // Stands in for the image cache keeping the finished completer alive.
      final handle = completer.keepAlive();
      completer.removeListener(first);

      var synchronous = false;
      final returning = ImageStreamListener((info, sync) {
        shown.add(info);
        synchronous = sync;
      });
      completer.addListener(returning);
      await Future<void>.delayed(Duration.zero);

      expect(codec.decodes, 1);
      expect(shown, hasLength(2));
      expect(synchronous, isTrue);

      completer.removeListener(returning);
      handle.dispose();
      for (final info in shown) {
        info.dispose();
      }
      image.dispose();
    });
  });

  testWidgets('a codec that arrived while nobody listened still decodes', (
    tester,
  ) async {
    await tester.runAsync(() async {
      final image = await createTestImage(width: 4, height: 4);
      final stale = _CountingCodec(image);
      final fresh = _CountingCodec(image);
      final codecs = StreamController<ui.Codec>()..add(stale);
      final completer = MultiImageStreamCompleter(
        codec: codecs.stream,
        scale: 1,
      );
      final shown = <ImageInfo>[];
      final first = await _listenUntilShown(completer, shown);

      final handle = completer.keepAlive();
      completer.removeListener(first);
      codecs.add(fresh);
      await Future<void>.delayed(Duration.zero);
      expect(fresh.decodes, 0);

      final returning = ImageStreamListener((info, _) => shown.add(info));
      completer.addListener(returning);
      await Future<void>.delayed(Duration.zero);

      expect(stale.decodes, 1);
      expect(fresh.decodes, 1);

      completer.removeListener(returning);
      handle.dispose();
      await codecs.close();
      for (final info in shown) {
        info.dispose();
      }
      image.dispose();
    });
  });
}
