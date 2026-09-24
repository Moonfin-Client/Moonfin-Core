import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:file/file.dart' as f;
import 'package:file/local.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';

/// Writes a solid PNG of the given size and returns the file, so image tests
/// decode a real codec without a network or bundled asset.
///
/// Must run inside `tester.runAsync` or a plain `test`, because encoding goes
/// through the engine.
Future<File> writeTestPng(
  Directory directory, {
  int width = 400,
  int height = 600,
  String name = 'fixture.png',
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  canvas.drawRect(
    ui.Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
    ui.Paint()..color = const ui.Color(0xFF3366CC),
  );
  final image = await recorder.endRecording().toImage(width, height);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  final file = File('${directory.path}/$name');
  await file.writeAsBytes(bytes!.buffer.asUint8List(), flush: true);
  return file;
}

/// Serves every URL from one local file, the way a disk hit would, so a test
/// can exercise the decode path of a network image widget offline.
class FakeArtworkCacheManager extends Fake implements BaseCacheManager {
  FakeArtworkCacheManager(File file)
    : file = const LocalFileSystem().file(file.path);

  final f.File file;

  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) {
    return Stream<FileResponse>.value(
      FileInfo(
        file,
        FileSource.Cache,
        DateTime.now().add(const Duration(days: 1)),
        url,
      ),
    );
  }
}

/// The decoded size the cache holds for [provider], or null when absent.
Future<ui.Image?> decodedImageFor(ImageProvider provider) async {
  final key = await provider.obtainKey(ImageConfiguration.empty);
  if (!PaintingBinding.instance.imageCache.containsKey(key)) return null;
  final stream = provider.resolve(ImageConfiguration.empty);
  final done = Completer<ui.Image?>();
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (info, _) {
      if (!done.isCompleted) done.complete(info.image);
      stream.removeListener(listener);
    },
    onError: (error, _) {
      if (!done.isCompleted) done.complete(null);
      stream.removeListener(listener);
    },
  );
  stream.addListener(listener);
  return done.future;
}
