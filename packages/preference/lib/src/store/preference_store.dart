import 'package:shared_preferences/shared_preferences.dart';

import '../preference_base.dart';
import '../preference_enum.dart';
import '../migration/migration_context.dart';

class PreferenceStore {
  SharedPreferences? _prefs;
  final Set<Future<void>> _pendingWrites = <Future<void>>{};

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get _requirePrefs {
    if (_prefs == null) {
      throw StateError('PreferenceStore not initialized. Call init() first.');
    }
    return _prefs!;
  }

  T get<T>(Preference<T> preference) {
    try {
      final key = preference.key;
      final defaultValue = preference.defaultValue;

      if (preference is EnumPreference) {
        return _getEnumDynamic(preference as EnumPreference) as T;
      }

      switch (defaultValue) {
        case int _:
          final val = _requirePrefs.get(key);
          if (val is num) {
            return val.toInt() as T;
          }
          if (val is String) {
            final clean = val.replaceAll('#', '').trim();
            if (clean.length == 6) {
              final parsed = int.tryParse(clean, radix: 16);
              if (parsed != null) return (0xFF000000 | parsed) as T;
            } else if (clean.length == 8) {
              final parsed = int.tryParse(clean, radix: 16);
              if (parsed != null) return parsed as T;
            }
            return (int.tryParse(val) ?? defaultValue) as T;
          }
          return (val ?? defaultValue) as T;
        case double _:
          final val = _requirePrefs.get(key);
          if (val is num) {
            return val.toDouble() as T;
          }
          if (val is String) {
            return (double.tryParse(val) ?? defaultValue) as T;
          }
          return (val ?? defaultValue) as T;
        case bool _:
          final val = _requirePrefs.get(key);
          if (val is bool) {
            return val as T;
          }
          if (val is String) {
            if (val.toLowerCase() == 'true') return true as T;
            if (val.toLowerCase() == 'false') return false as T;
          }
          return (val ?? defaultValue) as T;
        case String _:
          return (_requirePrefs.getString(key) ?? defaultValue) as T;
        case List<String> _:
          return (_requirePrefs.getStringList(key) ?? defaultValue) as T;
        default:
          throw ArgumentError('Unsupported preference type: ${defaultValue.runtimeType}');
      }
    } catch (_) {
      return preference.defaultValue;
    }
  }

  Future<void> set<T>(Preference<T> preference, T value) async {
    final write = (() async {
      final key = preference.key;

      if (preference is EnumPreference) {
        await _requirePrefs.setString(key, (value as Enum).name);
        return;
      }

      switch (value) {
        case int v:
          await _requirePrefs.setInt(key, v);
        case double v:
          await _requirePrefs.setDouble(key, v);
        case bool v:
          await _requirePrefs.setBool(key, v);
        case String v:
          await _requirePrefs.setString(key, v);
        case List<String> v:
          await _requirePrefs.setStringList(key, v);
        default:
          throw ArgumentError('Unsupported preference type: ${value.runtimeType}');
      }
    })();

    await _trackWrite(write);
  }

  Future<void> flushPendingWrites() async {
    while (_pendingWrites.isNotEmpty) {
      await Future.wait(_pendingWrites.toList(growable: false));
    }
  }

  Future<T> _trackWrite<T>(Future<T> write) {
    final marker = write.then<void>((_) {}, onError: (_) {});
    _pendingWrites.add(marker);
    marker.whenComplete(() => _pendingWrites.remove(marker));
    return write;
  }

  Future<T> _trackSharedPrefsWrite<T>(Future<T> Function() action) {
    final write = action();
    return _trackWrite(write);
  }

  Future<void> delete<T>(Preference<T> preference) async {
    await _trackSharedPrefsWrite(() => _requirePrefs.remove(preference.key));
  }

  Future<void> reset<T>(Preference<T> preference) => set(preference, preference.defaultValue);

  dynamic _getEnumDynamic(EnumPreference<dynamic> preference) {
    try {
      var stored = _requirePrefs.getString(preference.key);
      if (stored == null || stored.isEmpty) return preference.defaultValue;
      if (preference.key == 'pref_auto_login_behavior' && stored == 'specificUser') {
        stored = 'currentUser';
        _requirePrefs.setString(preference.key, 'currentUser');
      }
      for (final v in preference.values) {
        if ((v as Enum).name == stored) return v;
      }
    } catch (_) {}
    return preference.defaultValue;
  }

  String? getString(String key) => _requirePrefs.getString(key);
  Future<bool> setString(String key, String value) =>
      _trackSharedPrefsWrite(() => _requirePrefs.setString(key, value));

  int? getInt(String key) => _requirePrefs.getInt(key);
  Future<bool> setInt(String key, int value) =>
      _trackSharedPrefsWrite(() => _requirePrefs.setInt(key, value));

  bool? getBool(String key) => _requirePrefs.getBool(key);
  Future<bool> setBool(String key, bool value) =>
      _trackSharedPrefsWrite(() => _requirePrefs.setBool(key, value));

  double? getDouble(String key) => _requirePrefs.getDouble(key);
  Future<bool> setDouble(String key, double value) =>
      _trackSharedPrefsWrite(() => _requirePrefs.setDouble(key, value));

  List<String>? getStringList(String key) => _requirePrefs.getStringList(key);
  Future<bool> setStringList(String key, List<String> value) =>
      _trackSharedPrefsWrite(() => _requirePrefs.setStringList(key, value));

  bool containsKey(String key) => _requirePrefs.containsKey(key);

  Future<bool> remove(String key) =>
      _trackSharedPrefsWrite(() => _requirePrefs.remove(key));
  Future<bool> clear() => _trackSharedPrefsWrite(() => _requirePrefs.clear());

  Set<String> get keys => _requirePrefs.getKeys();

  static final _versionKey = 'store_version';

  Future<void> runMigrations(
    void Function(MigrationContext context) body,
  ) async {
    final context = MigrationContext();
    body(context);
    final currentVersion = _requirePrefs.getInt(_versionKey) ?? -1;
    final newVersion = await context.applyMigrations(currentVersion, this);
    await _trackSharedPrefsWrite(() => _requirePrefs.setInt(_versionKey, newVersion));
  }
}
