import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/download_service.dart';

void main() {
  late Directory staging;
  final now = DateTime.now();

  File stagingFile(String name, {Duration age = Duration.zero}) {
    final file = File('${staging.path}/$name')..writeAsStringSync('x');
    if (age > Duration.zero) {
      file.setLastModifiedSync(now.subtract(age));
    }
    return file;
  }

  setUp(() {
    staging = Directory.systemTemp.createTempSync('moonfin_staging');
  });

  tearDown(() {
    staging.deleteSync(recursive: true);
  });

  group('isSweepableStagingFile', () {
    test('keeps a fresh staging file while downloads are active', () {
      final file = stagingFile('com.bbflight.background_downloader123');
      expect(
        isSweepableStagingFile(file, now: now, downloadsIdle: false),
        isFalse,
      );
    });

    test('deletes a stale staging file even while downloads are active', () {
      final file = stagingFile(
        'com.bbflight.background_downloader123',
        age: const Duration(days: 8),
      );
      expect(
        isSweepableStagingFile(file, now: now, downloadsIdle: false),
        isTrue,
      );
    });

    test('keeps a file just under the age cutoff', () {
      final file = stagingFile(
        'com.bbflight.background_downloader123',
        age: const Duration(days: 6),
      );
      expect(
        isSweepableStagingFile(file, now: now, downloadsIdle: false),
        isFalse,
      );
    });

    test('deletes any staging file once nothing is downloading', () {
      final file = stagingFile('com.bbflight.background_downloader123');
      expect(
        isSweepableStagingFile(file, now: now, downloadsIdle: true),
        isTrue,
      );
    });

    test('never touches files without the engine prefix', () {
      final file = stagingFile('movie.mkv', age: const Duration(days: 30));
      expect(
        isSweepableStagingFile(file, now: now, downloadsIdle: true),
        isFalse,
      );
    });

    test('never touches directories', () {
      final dir = Directory(
        '${staging.path}/com.bbflight.background_downloader999',
      )..createSync();
      expect(
        isSweepableStagingFile(dir, now: now, downloadsIdle: true),
        isFalse,
      );
    });
  });
}
