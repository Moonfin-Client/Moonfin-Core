import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/disk_free_space.dart';

void main() {
  test('reports positive free space for a real directory', () async {
    final free = await availableDiskSpaceBytes(Directory.systemTemp.path);
    expect(free, isNotNull);
    expect(free, greaterThan(0));
  });

  test('returns null for a path that does not exist', () async {
    final free = await availableDiskSpaceBytes(
      '/nonexistent/moonfin/free/space/probe',
    );
    expect(free, isNull);
  });
}
