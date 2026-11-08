import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../preference/user_preferences.dart';

/// A subtitle font. None ship with the app, picking one downloads its regular
/// and bold files from Google Fonts.
class SubtitleFont {
  final String family;
  final String regularUrl;
  final String boldUrl;

  const SubtitleFont(this.family, this.regularUrl, this.boldUrl);

  String url({required bool bold}) => bold ? boldUrl : regularUrl;
}

const _gstatic = 'https://fonts.gstatic.com/s';

/// Static instances, since libass and Android pick the bold face by file and
/// a variable font only offers its default one.
const subtitleFonts = [
  SubtitleFont(
    'Arimo',
    '$_gstatic/arimo/v36/P5sfzZCDf9_T_3cV7NCUECyoxNk37cxsBw.ttf',
    '$_gstatic/arimo/v36/P5sfzZCDf9_T_3cV7NCUECyoxNk3CstsBw.ttf',
  ),
  SubtitleFont(
    'Atkinson Hyperlegible',
    '$_gstatic/atkinsonhyperlegible/v12/9Bt23C1KxNDXMspQ1lPyU89-1h6ONRlW45GE5Q.ttf',
    '$_gstatic/atkinsonhyperlegible/v12/9Bt73C1KxNDXMspQ1lPyU89-1h6ONRlW45G8WbcNcw.ttf',
  ),
  SubtitleFont(
    'Fira Sans',
    '$_gstatic/firasans/v18/va9E4kDNxMZdWfMOD5VfkA.ttf',
    '$_gstatic/firasans/v18/va9B4kDNxMZdWfMOD5VnLK3uQQ.ttf',
  ),
  SubtitleFont(
    'Inter',
    '$_gstatic/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuLyfMZg.ttf',
    '$_gstatic/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuFuYMZg.ttf',
  ),
  SubtitleFont(
    'Lato',
    '$_gstatic/lato/v25/S6uyw4BMUTPHvxk.ttf',
    '$_gstatic/lato/v25/S6u9w4BMUTPHh6UVew8.ttf',
  ),
  SubtitleFont(
    'Noto Sans',
    '$_gstatic/notosans/v42/o-0mIpQlx3QUlC5A4PNB6Ryti20_6n1iPHjcz6L1SoM-jCpoiyD9A99d.ttf',
    '$_gstatic/notosans/v42/o-0mIpQlx3QUlC5A4PNB6Ryti20_6n1iPHjcz6L1SoM-jCpoiyAaBN9d.ttf',
  ),
  SubtitleFont(
    'Open Sans',
    '$_gstatic/opensans/v44/memSYaGs126MiZpBA-UvWbX2vVnXBbObj2OVZyOOSr4dVJWUgsjZ0C4n.ttf',
    '$_gstatic/opensans/v44/memSYaGs126MiZpBA-UvWbX2vVnXBbObj2OVZyOOSr4dVJWUgsg-1y4n.ttf',
  ),
  SubtitleFont(
    'Roboto',
    '$_gstatic/roboto/v51/KFOMCnqEu92Fr1ME7kSn66aGLdTylUAMQXC89YmC2DPNWubEbWmT.ttf',
    '$_gstatic/roboto/v51/KFOMCnqEu92Fr1ME7kSn66aGLdTylUAMQXC89YmC2DPNWuYjammT.ttf',
  ),
  SubtitleFont(
    'Source Sans 3',
    '$_gstatic/sourcesans3/v20/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8Ky461EN.ttf',
    '$_gstatic/sourcesans3/v20/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8Kxf7FEN.ttf',
  ),
  SubtitleFont(
    'Ubuntu',
    '$_gstatic/ubuntu/v21/4iCs6KVjbNBYlgo6eA.ttf',
    '$_gstatic/ubuntu/v21/4iCv6KVjbNBYlgoCxCvTtw.ttf',
  ),
];

SubtitleFont? subtitleFontNamed(String family) =>
    subtitleFonts.where((font) => font.family == family).firstOrNull;

/// Null for a font this build doesn't offer, so a choice synced from a newer
/// client leaves the one here alone.
String? knownSubtitleFont(String family) =>
    family.isEmpty || subtitleFontNamed(family) != null ? family : null;

/// The subtitle fonts this device has downloaded, and the ones Flutter can
/// draw with. Files live in app support so the OS doesn't clear them.
class SubtitleFonts {
  SubtitleFonts({Future<Directory?> Function()? directory, this._client})
    : _findDirectory = directory ?? _supportDirectory;

  static SubtitleFonts _instance = SubtitleFonts();
  static SubtitleFonts get instance => _instance;
  @visibleForTesting
  static set instance(SubtitleFonts fonts) => _instance = fonts;

  final Future<Directory?> Function() _findDirectory;
  final http.Client? _client;
  Future<Directory?>? _directory;
  final _loaded = <String>{};
  final _downloaded = <String>{};
  final _pending = <String, Future<bool>>{};
  UserPreferences? _prefs;
  String _followed = '';

  static Future<Directory?> _supportDirectory() async {
    if (kIsWeb) return null;
    final support = await getApplicationSupportDirectory();
    return Directory('${support.path}/subtitle-fonts').create(recursive: true);
  }

  /// The folder downloads go to, or null on the web, where the browser keeps
  /// them.
  Future<Directory?> get directory =>
      _directory ??= _findDirectory().then((dir) => dir, onError: (_) => null);

  bool isDownloaded(String family) => kIsWeb || _downloaded.contains(family);

  /// The name Flutter knows [family] by, or null until it has loaded.
  String? flutterFamily(String family) =>
      _loaded.contains(family) ? 'Moonfin Subtitles $family' : null;

  /// Both downloaded files for [family], or null unless both are on this
  /// device.
  Future<({String regular, String bold})?> files(String family) async {
    final regular = await _file(family, bold: false);
    final bold = await _file(family, bold: true);
    return regular == null || bold == null
        ? null
        : (regular: regular, bold: bold);
  }

  Future<String?> _file(String family, {required bool bold}) async {
    if (subtitleFontNamed(family) == null) return null;
    final dir = await directory;
    if (dir == null) return null;
    final file = File('${dir.path}/${_fileName(family, bold)}');
    return await file.exists() ? file.path : null;
  }

  /// Notes which fonts are already here, then loads the picked one and keeps
  /// loading whatever is picked later, including a choice synced from another
  /// device.
  Future<void> follow(UserPreferences prefs) async {
    _prefs?.removeListener(_onPreferences);
    _prefs = prefs..addListener(_onPreferences);
    for (final font in subtitleFonts) {
      if (await files(font.family) != null) _downloaded.add(font.family);
    }
    _onPreferences();
  }

  void _onPreferences() {
    final family = _prefs?.get(UserPreferences.subtitlesFont) ?? '';
    if (family == _followed) return;
    _followed = family;
    if (family.isNotEmpty) unawaited(load(family));
  }

  /// Downloads [family] if it isn't here yet and loads it for Flutter. False
  /// when either file couldn't be fetched.
  Future<bool> load(String family) {
    if (_loaded.contains(family)) return Future.value(true);
    return _pending[family] ??= _load(family).whenComplete(() {
      _pending.remove(family);
    });
  }

  Future<bool> _load(String family) async {
    final font = subtitleFontNamed(family);
    if (font == null) return false;
    try {
      final regular = await _fetch(font, bold: false);
      final bold = await _fetch(font, bold: true);
      _downloaded.add(family);
      await (FontLoader('Moonfin Subtitles $family')
            ..addFont(Future.value(ByteData.sublistView(regular)))
            ..addFont(Future.value(ByteData.sublistView(bold))))
          .load();
      _loaded.add(family);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Uint8List> _fetch(SubtitleFont font, {required bool bold}) async {
    final dir = await directory;
    final target = dir == null
        ? null
        : File('${dir.path}/${_fileName(font.family, bold)}');
    if (target != null && await target.exists()) return target.readAsBytes();
    final uri = Uri.parse(font.url(bold: bold));
    final response = await (_client?.get(uri) ?? http.get(uri));
    final bytes = response.bodyBytes;
    // A captive portal answers with its own page, which must never land in
    // the fonts folder where libass and Android would try to open it.
    if (response.statusCode != 200 || !_isFontData(bytes)) {
      throw HttpException('Not a font: ${response.statusCode}', uri: uri);
    }
    if (target != null) {
      final part = File('${target.path}.part');
      await part.writeAsBytes(bytes, flush: true);
      await part.rename(target.path);
    }
    return bytes;
  }

  static String _fileName(String family, bool bold) =>
      '${family.replaceAll(' ', '')}-${bold ? 'Bold' : 'Regular'}.ttf';

  static bool _isFontData(Uint8List bytes) {
    if (bytes.length < 4) return false;
    final tag = ByteData.sublistView(bytes, 0, 4).getUint32(0);
    // TrueType 1.0, 'true' and 'OTTO'.
    return tag == 0x00010000 || tag == 0x74727565 || tag == 0x4F54544F;
  }
}

/// Where a native player opens [family] from. Null leaves the player's font
/// alone, and an empty path puts its own font back, which is also what a
/// font that isn't downloaded yet gets.
Future<Map<String, String>> subtitleFontPaths(String? family) async {
  if (family == null) return const {};
  final files = await SubtitleFonts.instance.files(family);
  return {'fontPath': files?.regular ?? '', 'boldFontPath': files?.bold ?? ''};
}
