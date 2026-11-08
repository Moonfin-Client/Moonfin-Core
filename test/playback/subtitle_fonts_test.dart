import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:moonfin/playback/subtitle_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final roboto = File('assets/fonts/Roboto-Regular.ttf').readAsBytesSync();
  final fira = subtitleFontNamed('Fira Sans')!;
  late Directory dir;

  setUp(() => dir = Directory.systemTemp.createTempSync('subtitle-fonts'));
  tearDown(() => dir.deleteSync(recursive: true));

  test('a picked font is saved with its bold and loaded for Flutter', () async {
    final fetched = <String>[];
    final fonts = SubtitleFonts(
      directory: () async => dir,
      client: MockClient((request) async {
        fetched.add(request.url.toString());
        return http.Response.bytes(roboto, 200);
      }),
    );

    expect(await fonts.load('Fira Sans'), isTrue);
    expect(fetched, [fira.regularUrl, fira.boldUrl]);
    final files = await fonts.files('Fira Sans');
    expect(files?.regular, '${dir.path}/FiraSans-Regular.ttf');
    expect(files?.bold, '${dir.path}/FiraSans-Bold.ttf');
    expect(fonts.isDownloaded('Fira Sans'), isTrue);
    expect(fonts.flutterFamily('Fira Sans'), 'Moonfin Subtitles Fira Sans');
  });

  test('a captive portal page never lands in the fonts folder', () async {
    final fonts = SubtitleFonts(
      directory: () async => dir,
      client: MockClient(
        (_) async => http.Response('<html>Sign in to the Wi-Fi</html>', 200),
      ),
    );

    expect(await fonts.load('Fira Sans'), isFalse);
    expect(dir.listSync(), isEmpty);
    expect(fonts.isDownloaded('Fira Sans'), isFalse);
    expect(fonts.flutterFamily('Fira Sans'), isNull);
  });

  test("a font already on the device isn't fetched again", () async {
    File('${dir.path}/FiraSans-Regular.ttf').writeAsBytesSync(roboto);
    File('${dir.path}/FiraSans-Bold.ttf').writeAsBytesSync(roboto);
    final fonts = SubtitleFonts(
      directory: () async => dir,
      client: MockClient((_) async => fail('fetched a font it already had')),
    );

    expect(await fonts.load('Fira Sans'), isTrue);
  });

  test("a synced font this build doesn't offer is skipped", () {
    expect(knownSubtitleFont('Fira Sans'), 'Fira Sans');
    expect(knownSubtitleFont(''), '');
    expect(knownSubtitleFont('Comic Sans'), isNull);
  });

  test('only fonts from the list are ever fetched', () async {
    final fonts = SubtitleFonts(
      directory: () async => dir,
      client: MockClient((_) async => fail('fetched an unlisted font')),
    );

    expect(await fonts.load('../../etc/passwd'), isFalse);
    expect(await fonts.files('../../etc/passwd'), isNull);
  });

  test("a folder that can't be found leaves the player its own font", () async {
    final fonts = SubtitleFonts(
      directory: () async => throw const FileSystemException(),
    );

    expect(await fonts.files('Fira Sans'), isNull);
  });
}
