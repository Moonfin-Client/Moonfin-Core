import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/baked_blur_image.dart';

// 40x20, black on the left half and white on the right.
Future<MemoryImage> _splitImage() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawRect(
    const Rect.fromLTWH(0, 0, 40, 20),
    Paint()..color = const Color(0xFF000000),
  );
  canvas.drawRect(
    const Rect.fromLTWH(20, 0, 20, 20),
    Paint()..color = const Color(0xFFFFFFFF),
  );
  final image = await recorder.endRecording().toImage(40, 20);
  final png = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return MemoryImage(png!.buffer.asUint8List());
}

Future<int> _redAt(WidgetTester tester, int x) async {
  final baked = tester.widget<RawImage>(find.byType(RawImage)).image!;
  final bytes = await tester.runAsync(
    () => baked.toByteData(format: ui.ImageByteFormat.rawRgba),
  );
  return bytes!.getUint8((baked.height ~/ 2 * baked.width + x) * 4);
}

Future<void> _pumpBaked(
  WidgetTester tester,
  MemoryImage image,
  double boxWidth,
) async {
  await tester.pumpWidget(
    Center(
      child: SizedBox(
        width: boxWidth,
        height: boxWidth / 2,
        child: BakedBlurImage(image: image, sigma: 10),
      ),
    ),
  );
  await tester.runAsync(
    () => Future<void>.delayed(const Duration(milliseconds: 200)),
  );
  await tester.pump();
}

void main() {
  testWidgets('bakes with the sigma scaled to the box, shrunk to 2px blur', (
    tester,
  ) async {
    final image = (await tester.runAsync(_splitImage))!;

    // Painted 10x larger, so sigma 10 is 1 pixel of the source.
    await _pumpBaked(tester, image, 400);
    final baked = tester.widget<RawImage>(find.byType(RawImage)).image!;
    expect((baked.width, baked.height), (40, 20));
    expect(await _redAt(tester, 19), inExclusiveRange(0, 255));
    expect(await _redAt(tester, 14), lessThan(10));

    // Painted at the source size, sigma 10 is 10 pixels of the source, so
    // the bake shrinks to a fifth and the blur still reaches further.
    await _pumpBaked(tester, image, 40);
    final shrunk = tester.widget<RawImage>(find.byType(RawImage)).image!;
    expect((shrunk.width, shrunk.height), (8, 4));
    expect(await _redAt(tester, 2), greaterThan(30));
  });
}
