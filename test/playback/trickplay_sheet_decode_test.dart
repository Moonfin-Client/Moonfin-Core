import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/playback/trickplay_tile_image.dart';

void main() {
  const tvCache = 96 << 20;
  const reducedCache = 32 << 20;

  test('320 wide sheets keep their full size on the standard tier', () {
    expect(trickplaySheetDecodeSize(3200, 1600, tvCache), isNull);
    expect(trickplaySheetDecodeSize(3200, 1800, tvCache), isNull);
  });

  test('wider sheets decode at the largest eighth within a third', () {
    expect(trickplaySheetDecodeSize(6400, 3200, tvCache), (
      width: 4000,
      height: 2000,
    ));
    expect(trickplaySheetDecodeSize(6400, 3600, tvCache), (
      width: 3200,
      height: 1800,
    ));
    expect(trickplaySheetDecodeSize(9800, 4900, tvCache), (
      width: 3675,
      height: 1838,
    ));
    expect(trickplaySheetDecodeSize(6400, 3200, 256 << 20), isNull);
  });

  test('the reduced tier shrinks even 320 wide sheets', () {
    expect(trickplaySheetDecodeSize(3200, 1600, reducedCache), (
      width: 2000,
      height: 1000,
    ));
  });

  test('a single frame is never shrunk and an eighth is the floor', () {
    expect(trickplaySheetDecodeSize(320, 180, reducedCache), isNull);
    expect(trickplaySheetDecodeSize(6400, 3200, 0), (width: 800, height: 400));
  });
}
