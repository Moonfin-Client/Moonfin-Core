import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/di/injection.dart' show migrateIosPath;

void main() {
  group('iOS Path Migration', () {
    test('migrateIosPath returns null if input is null', () {
      expect(migrateIosPath(null, '/new/path/Documents'), isNull);
    });

    test('migrateIosPath returns original path if /Documents/ is not found', () {
      const path = '/some/other/path/file.mp4';
      expect(migrateIosPath(path, '/new/path/Documents'), path);
    });

    test('migrateIosPath translates path if /Documents/ is found', () {
      const oldPath = '/var/mobile/Containers/Data/Application/OLD-UUID-1234/Documents/Moonfin/Movies/video.mp4';
      const currentDocsPath = '/var/mobile/Containers/Data/Application/NEW-UUID-5678/Documents';
      const expected = '/var/mobile/Containers/Data/Application/NEW-UUID-5678/Documents/Moonfin/Movies/video.mp4';

      expect(migrateIosPath(oldPath, currentDocsPath), expected);
    });

    test('migrateIosPath handles nested folder paths correctly', () {
      const oldPath = '/var/mobile/Containers/Data/Application/OLD-UUID-1234/Documents/Moonfin/images/poster.png';
      const currentDocsPath = '/var/mobile/Containers/Data/Application/NEW-UUID-5678/Documents';
      const expected = '/var/mobile/Containers/Data/Application/NEW-UUID-5678/Documents/Moonfin/images/poster.png';

      expect(migrateIosPath(oldPath, currentDocsPath), expected);
    });
  });
}
