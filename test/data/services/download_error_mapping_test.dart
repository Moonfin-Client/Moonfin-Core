import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/download_service.dart';

void main() {
  const diskFull =
      'The download disk is full. '
      'Free up space in the download location and retry.';

  group('friendlyDownloadFailure', () {
    test('null falls back to the generic message', () {
      expect(friendlyDownloadFailure(null), 'Download failed');
    });

    test('maps the Linux quota error the engines surface', () {
      expect(
        friendlyDownloadFailure(
          "FileSystemException: writeFrom failed, path = '/tmp/x' "
          '(OS Error: Disk quota exceeded, errno = 122)',
        ),
        diskFull,
      );
    });

    test('maps ENOSPC by errno', () {
      expect(
        friendlyDownloadFailure('IOException ... errno = 28'),
        diskFull,
      );
    });

    test('maps macOS EDQUOT by errno', () {
      expect(
        friendlyDownloadFailure('OS Error: quota, errno = 69'),
        diskFull,
      );
    });

    test('maps the spelled-out messages', () {
      expect(
        friendlyDownloadFailure('java.io.IOException: No space left on device'),
        diskFull,
      );
      expect(friendlyDownloadFailure('Disk quota exceeded'), diskFull);
    });

    test('maps the Windows disk-full code', () {
      expect(
        friendlyDownloadFailure(
          'FileSystemException: writeFrom failed '
          '(OS Error: There is not enough space on the disk., errno = 112)',
        ),
        diskFull,
      );
    });

    test('does not fire on unrelated errno values', () {
      const enoent = 'OS Error: No such file or directory, errno = 2';
      expect(friendlyDownloadFailure(enoent), enoent);
      const eperm = 'OS Error: Operation not permitted, errno = 1';
      expect(friendlyDownloadFailure(eperm), eperm);
    });

    test('passes other failures through unchanged', () {
      const other = 'Connection reset by peer';
      expect(friendlyDownloadFailure(other), other);
    });
  });
}
