import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/profile_picture_service.dart';
import 'package:moonfin/util/image_mime.dart';
import 'package:server_core/server_core.dart';

const _silo = UserImageUpload(
  contentTypes: {'image/jpeg', 'image/png', 'image/webp'},
  maxBytes: 10 * 1024 * 1024,
);

Future<Uint8List> _png(int width, int height) async {
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(
    ui.Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
    ui.Paint()..color = const ui.Color(0xFF3366CC),
  );
  final image = await recorder.endRecording().toImage(width, height);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return data!.buffer.asUint8List();
}

/// A 2×2 24-bit BMP, which Silo doesn't take.
Uint8List _bmp() {
  final data = ByteData(54 + 16);
  data
    ..setUint8(0, 0x42)
    ..setUint8(1, 0x4D)
    ..setUint32(2, 70, Endian.little)
    ..setUint32(10, 54, Endian.little)
    ..setUint32(14, 40, Endian.little)
    ..setInt32(18, 2, Endian.little)
    ..setInt32(22, 2, Endian.little)
    ..setUint16(26, 1, Endian.little)
    ..setUint16(28, 24, Endian.little)
    ..setUint32(34, 16, Endian.little);
  return data.buffer.asUint8List();
}

Future<(int, int)> _size(Uint8List bytes) async {
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  final size = (frame.image.width, frame.image.height);
  frame.image.dispose();
  codec.dispose();
  return size;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('imageContentTypeForBytes', () {
    test('reads the type from the file header, not the name', () async {
      expect(imageContentTypeForBytes(await _png(1, 1)), 'image/png');
      expect(imageContentTypeForBytes(_bmp()), 'image/bmp');
      expect(imageContentTypeForBytes([0xFF, 0xD8, 0xFF, 0xE0]), 'image/jpeg');
      expect(imageContentTypeForBytes('GIF89a'.codeUnits), 'image/gif');
      expect(
        imageContentTypeForBytes([
          ...'RIFF'.codeUnits,
          0,
          0,
          0,
          0,
          ...'WEBP'.codeUnits,
        ]),
        'image/webp',
      );
      // An iPhone photo: an ISO media file of brand heic.
      expect(
        imageContentTypeForBytes([0, 0, 0, 24, ...'ftypheic'.codeUnits]),
        isNull,
      );
    });
  });

  group('prepareProfilePicture', () {
    test('a file the server takes goes as it is', () async {
      final png = await _png(64, 64);
      final prepared = await prepareProfilePicture(png, _silo);
      expect(prepared?.contentType, 'image/png');
      expect(identical(prepared?.bytes, png), isTrue);
    });

    test('a type the server does not take is converted to PNG', () async {
      final prepared = await prepareProfilePicture(_bmp(), _silo);
      expect(prepared?.contentType, 'image/png');
      expect(imageContentTypeForBytes(prepared!.bytes), 'image/png');
      expect(await _size(prepared.bytes), (2, 2));
    });

    test('a file over the size limit is scaled down', () async {
      final png = await _png(2048, 512);
      final rules = UserImageUpload(
        contentTypes: const {'image/png'},
        maxBytes: png.length - 1,
      );
      final prepared = await prepareProfilePicture(png, rules);
      expect(prepared?.contentType, 'image/png');
      expect(await _size(prepared!.bytes), (1024, 256));
    });

    test('a file the device cannot read either is turned down', () async {
      expect(
        await prepareProfilePicture(
          Uint8List.fromList([0, 0, 0, 24, ...'ftypheic'.codeUnits, 1, 2]),
          _silo,
        ),
        isNull,
      );
    });
  });
}
