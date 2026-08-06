import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/core_download_service.dart';

/// Builds a zip in memory from a name to contents map.
List<int> _zip(Map<String, String> entries) {
  final archive = Archive();
  entries.forEach((name, contents) {
    final bytes = contents.codeUnits;
    archive.add(ArchiveFile.bytes(name, bytes));
  });
  return ZipEncoder().encode(archive);
}

void main() {
  late Directory root;
  late Directory work;

  setUp(() {
    root = Directory.systemTemp.createTempSync('core_support');
    work = Directory('${root.path}/system')..createSync();
  });
  tearDown(() => root.deleteSync(recursive: true));

  test('unpacks the payload folder into the destination', () {
    final bytes = _zip({
      'PPSSPP/compat.ini': 'compat',
      'PPSSPP/flash0/font/ltn0.pgf': 'font',
    });

    unpackSupportArchive(bytes, 'PPSSPP', work);

    expect(File('${work.path}/compat.ini').readAsStringSync(), 'compat');
    expect(
      File('${work.path}/flash0/font/ltn0.pgf').readAsStringSync(),
      'font',
    );
  });

  test('skips entries outside the payload folder', () {
    final bytes = _zip({
      'PPSSPP/compat.ini': 'compat',
      'README.txt': 'readme',
      'other/thing.dat': 'nope',
    });

    unpackSupportArchive(bytes, 'PPSSPP', work);

    expect(File('${work.path}/compat.ini').existsSync(), isTrue);
    expect(File('${work.path}/README.txt').existsSync(), isFalse);
    expect(File('${work.path}/thing.dat').existsSync(), isFalse);
  });

  test('skips paths that climb out of the destination', () {
    final bytes = _zip({
      'PPSSPP/compat.ini': 'compat',
      'PPSSPP/../escaped.txt': 'escaped',
      'PPSSPP/sub/../../escaped2.txt': 'escaped',
    });

    unpackSupportArchive(bytes, 'PPSSPP', work);

    expect(File('${work.path}/compat.ini').existsSync(), isTrue);
    expect(File('${root.path}/escaped.txt').existsSync(), isFalse);
    expect(File('${root.path}/escaped2.txt').existsSync(), isFalse);
  });
}
