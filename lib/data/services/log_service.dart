import 'dart:async';
import 'dart:collection';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import 'media_server_client_factory.dart';

enum LogLevel { debug, info, warning, error }

enum LogCategory {
  general,
  media,
  seerr,
  network,
  auth,
  playback,
  sync,
}

extension LogLevelLabel on LogLevel {
  String get label => switch (this) {
    LogLevel.debug => 'DEBUG',
    LogLevel.info => 'INFO',
    LogLevel.warning => 'WARN',
    LogLevel.error => 'ERROR',
  };
}

extension LogCategoryLabel on LogCategory {
  String get label => switch (this) {
    LogCategory.general => 'general',
    LogCategory.media => 'media',
    LogCategory.seerr => 'seerr',
    LogCategory.network => 'network',
    LogCategory.auth => 'auth',
    LogCategory.playback => 'playback',
    LogCategory.sync => 'sync',
  };
}

@immutable
class LogEntry {
  final DateTime time;
  final LogLevel level;
  final LogCategory category;
  final String message;
  final String? error;

  const LogEntry({
    required this.time,
    required this.level,
    required this.category,
    required this.message,
    this.error,
  });

  String format() {
    final ts = time.toIso8601String();
    final base = '$ts ${level.label.padRight(5)} [${category.label}] $message';
    return error == null ? base : '$base\n    └─ $error';
  }
}

class LogService extends ChangeNotifier {
  LogService(this._prefs, this._clientFactory, this._deviceInfo) {
    _prefs.addListener(_onPrefsChanged);
    _syncFromPreferences();
  }

  static const int _maxEntries = 2000;

  // Stops at the path so the endpoint stays readable. Only the host is
  // private, and a report of bare hosts cannot say which call misbehaved.
  static final _redactRegex = RegExp(
    r'''((?:https?|wss?)://)[^\s/<>"',;()\]}]+''',
    caseSensitive: false,
  );

  static final _hostLookupRegex = RegExp(
    r'''((?:Failed host lookup|Unable to resolve host):? ['"])[^'"]+''',
    caseSensitive: false,
  );

  static final _genericErrorRedactRegex = RegExp(
    r'''\b(host(?:name)?|address|ip|server|url|uri|domain|origin)'''
    r'''(\s*"?\s*[:=]\s*"?\s*)([^\s,;()<>"{}\[\]']*[.0-9][^\s,;()<>"{}\[\]']*)("?)''',
    caseSensitive: false,
  );

  // The host redaction above stops at the path, so a URL keeps the credential
  // in its query, and these reports get pasted into public issues. The name is
  // kept and only the value goes, since knowing auth was present still reads.
  // A hyphenated name like X-Emby-Token is covered by the bare token branch.
  static final _credentialRegex = RegExp(
    r"""\b(api[_-]?key|access[_-]?token|auth[_-]?token|authorization|token)"""
    r"""(\s*[:=]\s*"?)"""
    r"""((?:(?:Bearer|Basic|MediaBrowser)\s+)?[^\s&"',;<>{}\[\]]+)""",
    caseSensitive: false,
  );

  static final _ipv4Regex = RegExp(
    r'\b(?:\d{1,3}\.){3}\d{1,3}\b',
  );

  static final _ipv6Regex = RegExp(
    r'(?<![:.\w])(?:'
    r'(?:[A-Fa-f0-9]{1,4}:){7}[A-Fa-f0-9]{1,4}'
    r'|[A-Fa-f0-9:]*::[A-Fa-f0-9:]*'
    r')(?![:.\w])',
  );

  final UserPreferences _prefs;
  final MediaServerClientFactory _clientFactory;
  final DeviceInfo _deviceInfo;

  final Queue<LogEntry> _entries = Queue<LogEntry>();

  bool _enabled = false;

  bool get isEnabled => _enabled;

  List<LogEntry> get entries => List.unmodifiable(_entries);

  int get entryCount => _entries.length;

  void _onPrefsChanged() => _syncFromPreferences();

  void _syncFromPreferences() {
    final enabled = _prefs.get(UserPreferences.diagnosticLoggingEnabled);
    if (enabled == _enabled) return;
    _enabled = enabled;
    if (enabled) {
      ServerLog.sink = _onServerLog;
      log(
        LogCategory.general,
        'Diagnostic logging enabled (${_deviceInfo.appName} '
        '${_deviceInfo.appVersion})',
        level: LogLevel.info,
      );
    } else {
      ServerLog.sink = null;
    }
    notifyListeners();
  }

  void _onServerLog(
    String category,
    ServerLogLevel level,
    String message, {
    Object? error,
  }) {
    log(
      _categoryFromName(category),
      message,
      level: _levelFromServer(level),
      error: error,
    );
  }

  /// Records a log entry. No-op when logging is disabled.
  void log(
    LogCategory category,
    String message, {
    LogLevel level = LogLevel.debug,
    Object? error,
  }) {
    assert(() {
      developer.log(
        message,
        name: 'moonfin.${category.label}',
        level: _devLevel(level),
        error: error,
      );
      return true;
    }());

    if (!_enabled) return;

    _append(
      LogEntry(
        time: DateTime.now(),
        level: level,
        category: category,
        message: _redact(message),
        error: error != null ? _redact(error.toString()) : null,
      ),
    );
  }

  void _append(LogEntry entry) {
    _entries.addLast(entry);
    while (_entries.length > _maxEntries) {
      _entries.removeFirst();
    }
    notifyListeners();
  }

  /// Records an uncaught error. Unlike [log] this ignores the diagnostic
  /// logging toggle, which is off by default and too late to turn on once
  /// the crash it would have explained has already happened.
  void logCrash(String message, Object error) {
    _append(
      LogEntry(
        time: DateTime.now(),
        level: LogLevel.error,
        category: LogCategory.general,
        message: _redact(message),
        error: _redact(error.toString()),
      ),
    );
  }

  void media(String message, {LogLevel level = LogLevel.debug, Object? error}) =>
      log(LogCategory.media, message, level: level, error: error);

  void seerr(String message, {LogLevel level = LogLevel.debug, Object? error}) =>
      log(LogCategory.seerr, message, level: level, error: error);

  void network(String message,
          {LogLevel level = LogLevel.debug, Object? error}) =>
      log(LogCategory.network, message, level: level, error: error);

  void auth(String message, {LogLevel level = LogLevel.debug, Object? error}) =>
      log(LogCategory.auth, message, level: level, error: error);

  void playback(String message,
          {LogLevel level = LogLevel.debug, Object? error}) =>
      log(LogCategory.playback, message, level: level, error: error);

  void clear() {
    _entries.clear();
    notifyListeners();
  }

  /// [maxEntries] bounds the report to that many of the newest entries.
  String exportText({int? maxEntries}) {
    var start = 0;
    if (maxEntries != null && _entries.length > maxEntries) {
      start = _entries.length - maxEntries;
    }
    final buffer = StringBuffer()
      ..writeln('Moonfin diagnostic report')
      ..writeln('Generated: ${DateTime.now().toIso8601String()}')
      ..writeln('App: ${_deviceInfo.appName} ${_deviceInfo.appVersion}')
      ..writeln('Device: ${_deviceInfo.name} (${_deviceInfo.id})')
      ..writeln('Entries: ${_entries.length - start}')
      ..writeln('Platform: ${defaultTargetPlatform.name}')
      ..writeln('=' * 60);
    for (final entry in _entries.skip(start)) {
      buffer.writeln(entry.format());
    }
    return buffer.toString();
  }

  /// Uploads the current report to the active server.
  ///
  /// Returns the server-assigned file name on success. Throws [StateError] if
  /// no server is active or the server does not support client log upload.
  Future<String?> uploadToServer() async {
    final MediaServerClient client;
    try {
      client = _clientFactory.getActiveClient();
    } on StateError {
      throw StateError('No active server to send the report to.');
    }
    final api = client.clientLogApi;
    if (api == null) {
      throw StateError(
        'This server does not support diagnostic report uploads.',
      );
    }
    log(
      LogCategory.general,
      'Uploading diagnostic report (${_entries.length} entries) to '
      '${client.baseUrl}',
      level: LogLevel.info,
    );
    final fileName = await api.uploadDocument(exportText());
    log(
      LogCategory.general,
      'Diagnostic report uploaded: ${fileName ?? '(unnamed)'}',
      level: LogLevel.info,
    );
    return fileName;
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    if (identical(ServerLog.sink, _onServerLog)) {
      ServerLog.sink = null;
    }
    super.dispose();
  }

  static LogCategory _categoryFromName(String name) {
    for (final c in LogCategory.values) {
      if (c.label == name) return c;
    }
    return LogCategory.general;
  }

  static LogLevel _levelFromServer(ServerLogLevel level) => switch (level) {
    ServerLogLevel.debug => LogLevel.debug,
    ServerLogLevel.info => LogLevel.info,
    ServerLogLevel.warning => LogLevel.warning,
    ServerLogLevel.error => LogLevel.error,
  };

  static int _devLevel(LogLevel level) => switch (level) {
    LogLevel.debug => 500,
    LogLevel.info => 800,
    LogLevel.warning => 900,
    LogLevel.error => 1000,
  };

  String _redact(String text) {
    var result = text;

    final lower = result.toLowerCase();
    if (lower.contains('host') ||
        lower.contains('address') ||
        lower.contains('ip') ||
        lower.contains('server') ||
        lower.contains('url') ||
        lower.contains('uri') ||
        lower.contains('domain') ||
        lower.contains('origin')) {
      result = result.replaceAllMapped(_genericErrorRedactRegex, (match) {
        return '${match.group(1)}${match.group(2)}[REDACTED]${match.group(4)}';
      });

      if (lower.contains('host')) {
        result = result.replaceAllMapped(_hostLookupRegex, (match) {
          return "${match.group(1)}[REDACTED]";
        });
      }
    }

    if (lower.contains('://')) {
      result = result.replaceAllMapped(_redactRegex, (match) {
        return '${match.group(1)}[REDACTED]';
      });
    }

    if (lower.contains('key') ||
        lower.contains('token') ||
        lower.contains('auth')) {
      result = result.replaceAllMapped(_credentialRegex, (match) {
        return '${match.group(1)}${match.group(2)}[REDACTED]';
      });
    }
    
    // catch any ipv4's
    if (result.contains('.')) {
      result = result.replaceAll(_ipv4Regex, '[REDACTED]');
    }
    // catch any ipv6's
    if (result.contains(':')) {
      result = result.replaceAll(_ipv6Regex, '[REDACTED]');
    }

    return result;
  }
}
