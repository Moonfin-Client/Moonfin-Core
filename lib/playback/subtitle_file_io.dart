import 'dart:convert';
import 'dart:io';

/// A downloaded subtitle file's text, or null when it can't be read. Older
/// files aren't always UTF-8, so a stray byte doesn't lose the whole file.
Future<String?> readSubtitleFile(String path) async {
  try {
    return utf8.decode(await File(path).readAsBytes(), allowMalformed: true);
  } catch (_) {
    return null;
  }
}
