import 'package:shared_preferences/shared_preferences.dart';

import '../models/reader_settings.dart';

class ReaderSettingsStore {
  ReaderSettingsStore._();

  static const String _prefKey = 'book_reader_settings_v1';

  static Future<ReaderSettings> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefKey);
    if (raw == null || raw.isEmpty) {
      return ReaderSettings.defaults;
    }
    return ReaderSettings.decode(raw);
  }

  static Future<void> save(ReaderSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, settings.encode());
  }
}
