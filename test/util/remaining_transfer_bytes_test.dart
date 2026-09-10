import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/download_utils.dart';

void main() {
  test('the rest of a partly transferred file is what still needs space', () {
    expect(
      remainingTransferBytes(expectedFileSize: 1000, progress: 0.25),
      750,
    );
    expect(remainingTransferBytes(expectedFileSize: 1000, progress: 0), 1000);
    expect(remainingTransferBytes(expectedFileSize: 1000, progress: 1), 0);
  });

  test('an unknown size cannot be judged', () {
    expect(remainingTransferBytes(expectedFileSize: -1, progress: 0.5), isNull);
    expect(remainingTransferBytes(expectedFileSize: 0, progress: 0.5), isNull);
  });
}
