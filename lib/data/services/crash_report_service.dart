import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../preference/user_preferences.dart';
import 'log_service.dart';
import 'media_server_client_factory.dart';

/// Holds crash reports captured by the global error handlers until a server
/// that accepts them is available, then uploads and removes them.
///
/// Reports go to SharedPreferences rather than a file so the same code runs
/// on web, and they are written at capture time so a later hard kill loses
/// nothing. Capture is always local. Whether anything leaves the device is
/// gated on [UserPreferences.crashReportsEnabled].
class CrashReportService {
  CrashReportService(this._prefs, this._clientFactory) {
    _lastSeenUploadEnabled = _uploadEnabled;
    _prefs.addListener(_onPrefsChanged);
  }

  static const String storageKey = 'pending_crash_reports';
  static const int _maxStoredReports = 3;
  static const int _maxReportChars = 64 * 1024;
  static const int _maxSignaturesPerRun = 5;
  static const Duration _maxReportAge = Duration(days: 14);

  final UserPreferences _prefs;
  final MediaServerClientFactory _clientFactory;

  final Set<String> _capturedThisRun = <String>{};
  bool _lastSeenUploadEnabled = true;
  bool _flushing = false;

  bool get _uploadEnabled => _prefs.get(UserPreferences.crashReportsEnabled);

  void _onPrefsChanged() {
    final enabled = _uploadEnabled;
    if (enabled == _lastSeenUploadEnabled) return;
    _lastSeenUploadEnabled = enabled;
    if (!enabled) {
      // Consent was withdrawn, so what is already captured should not go
      // either.
      clearPending();
    }
  }

  /// Whether a crash with this [signature] is worth capturing this run. A
  /// persistent build error fires the framework handler every frame, so the
  /// first sighting wins and the rest are dropped before any work happens.
  bool shouldCapture(String signature) {
    if (_capturedThisRun.contains(signature)) return false;
    if (_capturedThisRun.length >= _maxSignaturesPerRun) return false;
    _capturedThisRun.add(signature);
    return true;
  }

  /// Persists [reportText] for [signature], replacing any pending report with
  /// the same signature so a crash that happens every launch keeps one report
  /// rather than filling every slot with copies.
  Future<void> record(String signature, String reportText) async {
    final text = reportText.length > _maxReportChars
        ? reportText.substring(0, _maxReportChars)
        : reportText;
    final reports = await _load();
    reports.removeWhere((r) => r.signature == signature);
    reports.add(
      _PendingReport(signature: signature, time: DateTime.now(), text: text),
    );
    while (reports.length > _maxStoredReports) {
      reports.removeAt(0);
    }
    await _save(reports);
  }

  /// Uploads every pending report to the active server, removing each one
  /// only after its upload succeeds. Quietly does nothing when uploads are
  /// disabled, no server is signed in, or the server has no client log
  /// endpoint, which is the Emby case.
  Future<void> flushPending() async {
    if (!_uploadEnabled || _flushing) return;
    _flushing = true;
    try {
      final reports = await _load();
      if (reports.isEmpty) return;

      final ClientLogApi? api;
      try {
        api = _clientFactory.getActiveClient().clientLogApi;
      } on StateError {
        return;
      }
      if (api == null || !_serverAcceptsReports()) return;

      while (reports.isNotEmpty) {
        try {
          await api.uploadDocument(reports.first.text);
        } catch (_) {
          // Leave the rest for the next launch.
          break;
        }
        reports.removeAt(0);
        await _save(reports);
      }
    } finally {
      _flushing = false;
    }
  }

  /// An Emby server without the Moonfin plugin has nothing to post to, so the
  /// reports wait for a server that does rather than spending a 404 per launch.
  bool _serverAcceptsReports() {
    if (!GetIt.instance.isRegistered<LogService>()) return true;
    return GetIt.instance<LogService>().canUploadToServer;
  }

  Future<void> clearPending() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(storageKey);
  }

  Future<List<_PendingReport>> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(storageKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      final cutoff = DateTime.now().subtract(_maxReportAge);
      final reports = <_PendingReport>[];
      for (final item in decoded.whereType<Map>()) {
        final report = _PendingReport.fromJson(item.cast<String, dynamic>());
        if (report != null && report.time.isAfter(cutoff)) {
          reports.add(report);
        }
      }
      return reports;
    } catch (_) {
      return [];
    }
  }

  Future<void> _save(List<_PendingReport> reports) async {
    final prefs = await SharedPreferences.getInstance();
    if (reports.isEmpty) {
      await prefs.remove(storageKey);
      return;
    }
    await prefs.setString(
      storageKey,
      jsonEncode([for (final r in reports) r.toJson()]),
    );
  }

  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
  }
}

class _PendingReport {
  final String signature;
  final DateTime time;
  final String text;

  const _PendingReport({
    required this.signature,
    required this.time,
    required this.text,
  });

  static _PendingReport? fromJson(Map<String, dynamic> json) {
    final signature = json['signature'];
    final time = DateTime.tryParse(json['time'] as String? ?? '');
    final text = json['text'];
    if (signature is! String || time == null || text is! String) return null;
    return _PendingReport(signature: signature, time: time, text: text);
  }

  Map<String, dynamic> toJson() => {
    'signature': signature,
    'time': time.toIso8601String(),
    'text': text,
  };
}
