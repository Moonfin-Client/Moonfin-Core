import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../data/services/crash_report_service.dart';
import '../data/services/log_service.dart';

/// Logs how the previous run ended and keeps Android's note of what this one
/// is doing current. A crash in native code takes the process down before Dart
/// can log anything, so this is the only trace it leaves in a report.
class ProcessExitReporter {
  ProcessExitReporter(this._logs, this._crashes);

  static const _channel = MethodChannel('org.moonfin.androidtv/platform');

  final LogService _logs;
  final CrashReportService _crashes;
  String? _sentState;

  /// Records every exit Android kept since the last launch as a crash, so it
  /// lands in the diagnostic log and goes out with the crash reports.
  Future<void> reportPreviousExits() async {
    final List<Object?>? exits;
    try {
      exits = await _channel.invokeListMethod<Object?>('previousExits');
    } catch (_) {
      return;
    }
    for (final raw in exits ?? const <Object?>[]) {
      if (raw is! Map) continue;
      final exit = describeProcessExit(raw.cast<String, Object?>());
      _logs.logCrash(exit.message, exit.details);
      await _crashes.record(exit.signature, _logs.exportText(maxEntries: 50));
    }
  }

  /// Keeps the route and screensaver part of the state summary current.
  void watch({
    required Listenable routeChanges,
    required String Function() currentRoute,
    ValueListenable<bool>? screensaverVisible,
  }) {
    void send() {
      final state = appStateSummary(
        route: currentRoute(),
        screensaver: screensaverVisible?.value ?? false,
      );
      if (state == _sentState) return;
      _sentState = state;
      unawaited(
        _channel
            .invokeMethod<void>('setProcessState', {'state': state})
            .catchError((_) {}),
      );
    }

    routeChanges.addListener(send);
    screensaverVisible?.addListener(send);
    send();
  }
}

final _idSegment = RegExp(
  r'^([0-9a-f]{32}|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})$',
  caseSensitive: false,
);

/// The route with its query dropped and item ids folded to `:id`, which keeps
/// it short enough for the summary and says nothing about the library.
@visibleForTesting
String normalizedRoute(String path) {
  final withoutQuery = path.split('?').first;
  return withoutQuery
      .split('/')
      .map((segment) => _idSegment.hasMatch(segment) ? ':id' : segment)
      .join('/');
}

@visibleForTesting
String appStateSummary({required String route, required bool screensaver}) {
  final state = 'route=${normalizedRoute(route)}';
  return screensaver ? '$state screensaver' : state;
}

/// What a report says about one exit Android recorded.
@visibleForTesting
({String message, String details, String signature}) describeProcessExit(
  Map<String, Object?> exit,
) {
  final reason = exit['reason'] as String? ?? 'unknown';
  final importance = exit['importance'] as String? ?? 'unknown';
  final signal = exit['signal'] as int?;
  final state = exit['state'] as String?;
  final pssKb = exit['pssKb'] as int? ?? 0;
  final rssKb = exit['rssKb'] as int? ?? 0;
  final description = exit['description'] as String?;
  final mainThread = exit['mainThread'] as String?;
  final abortMessage = exit['abortMessage'] as String?;
  final crashThread = exit['crashThread'] as String?;
  final frames = (exit['frames'] as List?)?.cast<String>() ?? const [];
  final crashLogs = (exit['crashLogs'] as List?)?.cast<String>() ?? const [];
  final timestampMs = exit['timestampMs'] as int?;

  final what = signal == null ? reason : '$reason (signal $signal)';
  final details = StringBuffer()
    ..writeln(
      'At: ${timestampMs == null ? 'unknown' : DateTime.fromMillisecondsSinceEpoch(timestampMs).toIso8601String()}',
    )
    ..writeln('State: ${state ?? 'not recorded'}');
  if (pssKb > 0 || rssKb > 0) {
    details.writeln('Memory: PSS ${pssKb ~/ 1024} MB, RSS ${rssKb ~/ 1024} MB');
  }
  if (description != null && description.isNotEmpty) {
    details.writeln('Description: $description');
  }
  if (mainThread != null) {
    details
      ..writeln('Main thread:')
      ..writeln(mainThread);
  }
  if (abortMessage != null) details.writeln('Abort: $abortMessage');
  if (crashThread != null) details.writeln('Thread: $crashThread');
  if (frames.isNotEmpty) {
    details
      ..writeln('Frames:')
      ..writeAll(frames, '\n')
      ..writeln();
  }
  if (crashLogs.isNotEmpty) {
    details
      ..writeln('Logs:')
      ..writeAll(crashLogs, '\n')
      ..writeln();
  }
  return (
    message: 'Previous run ended: $what while $importance',
    details: details.toString().trimRight(),
    signature: 'exit:$what:${crashThread ?? ''}:${state ?? ''}',
  );
}
