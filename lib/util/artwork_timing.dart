import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

/// The phases one artwork fetch goes through, from the moment the cache
/// manager hands it to the file service until the last byte lands.
///
/// Only allocated while diagnostic logging is on, see [ArtworkTimings.begin],
/// so a normal session pays one static null check per fetch and nothing else.
class ArtworkTiming {
  ArtworkTiming._(this.url, this.enqueuedAt);

  /// Path and size only. The host and, on Emby, the api_key never reach the
  /// log, the same rule the network log applies.
  final String url;
  final DateTime enqueuedAt;

  /// Which batch the scheduler filed this under, and how many were already
  /// waiting when it arrived.
  int batch = 0;
  int queueDepth = 0;

  DateTime? admittedAt;
  DateTime? headersAt;
  DateTime? doneAt;
  int bytes = 0;
  Object? error;

  developer.TimelineTask? _task;
  bool _finished = false;

  void admitted({int batch = 0, int queueDepth = 0}) {
    admittedAt = DateTime.now();
    this.batch = batch;
    this.queueDepth = queueDepth;
  }

  void headers() => headersAt = DateTime.now();

  void chunk(int length) => bytes += length;

  void done() {
    doneAt ??= DateTime.now();
  }

  void failed(Object e) {
    error = e;
    doneAt ??= DateTime.now();
  }

  Duration? get queueWait => admittedAt?.difference(enqueuedAt);
  Duration? get headerWait => headersAt?.difference(admittedAt ?? enqueuedAt);
  Duration? get transfer {
    final headers = headersAt;
    return headers == null ? null : doneAt?.difference(headers);
  }
}

/// Where every artwork fetch reports, and where the aggregate line is built.
///
/// A disk hit never reaches the file service, so the cache index counts those
/// through [indexHit] instead.
class ArtworkTimings {
  ArtworkTimings._();

  static bool get enabled => ServerLog.sink != null;

  /// Long enough that a screenful of posters lands in one line, short enough
  /// that a single scroll shows up as its own line in the export.
  static const aggregateWindow = Duration(seconds: 5);

  static final List<ArtworkTiming> _window = <ArtworkTiming>[];
  static int _windowHits = 0;
  static Timer? _windowTimer;

  /// Fetches begun and not yet finished. A request held in the scheduler
  /// queue or hung mid transfer never reaches the window, so without this a
  /// report with no fetch line reads the same as a report where nothing was
  /// asked for.
  static int _inFlight = 0;

  /// How the index came up at launch. It opens before the log sink exists,
  /// since LogService is registered after the cache is configured, so the
  /// live line is lost and this copy is replayed into every report.
  static (ServerLogLevel, String)? _indexOpenSummary;

  /// Null whenever diagnostic logging is off, so callers keep a nullable and
  /// never build a record nobody will read.
  static ArtworkTiming? begin(String url) {
    if (!enabled) return null;
    _inFlight++;
    final timing = ArtworkTiming._(loggableArtworkUrl(url), DateTime.now());
    if (!kReleaseMode) {
      timing._task = developer.TimelineTask()
        ..start('artwork', arguments: <String, Object?>{'url': timing.url});
    }
    return timing;
  }

  static void finish(ArtworkTiming? timing) {
    if (timing == null || timing._finished) return;
    timing._finished = true;
    _inFlight--;
    timing.done();
    timing._task?.finish(
      arguments: <String, Object?>{
        'bytes': timing.bytes,
        if (timing.error != null) 'error': timing.error.toString(),
      },
    );
    _window.add(timing);
    _windowTimer ??= Timer(aggregateWindow, _flushWindow);
  }

  /// A lookup the cache index answered from memory, so no fetch happened.
  static void indexHit() {
    if (!enabled) return;
    _windowHits++;
    _windowTimer ??= Timer(aggregateWindow, _flushWindow);
  }

  static void indexOpened({
    required int entries,
    required Duration took,
    String? migratedFrom,
    int migratedCount = 0,
  }) {
    final migrated = migratedFrom == null
        ? ''
        : ' migrated $migratedCount from $migratedFrom';
    _emitIndex(
      ServerLogLevel.info,
      'opened n=$entries in ${took.inMilliseconds}ms$migrated',
    );
  }

  /// The open gave up and the index started empty. This is the line that
  /// tells a cold cache from a stalled one when a report shows artwork
  /// missing.
  static void indexOpenFellBack({
    required String reason,
    required Duration took,
    Object? error,
  }) {
    final detail = error == null ? reason : '$reason (${error.runtimeType})';
    _emitIndex(
      ServerLogLevel.warning,
      'open fell back: $detail after ${took.inMilliseconds}ms',
      error: error,
    );
  }

  static void _emitIndex(
    ServerLogLevel level,
    String summary, {
    Object? error,
  }) {
    _indexOpenSummary = (level, summary);
    if (!enabled) return;
    ServerLog.emit('artwork', level, 'art index $summary', error: error);
  }

  /// A screensaver slide that gave up. Its error widget is a black frame, so
  /// without this a failed fetch and a plain black backdrop read the same.
  static void screensaverSlideFailed(String url, Object error) {
    if (!enabled) return;
    ServerLog.emit(
      'artwork',
      ServerLogLevel.warning,
      'art screensaver slide failed ${loggableArtworkUrl(url)}: $error',
    );
  }

  /// What a report needs before it goes out: the window that hasn't closed
  /// yet, how many fetches are still waiting, and how the index came up.
  static void prepareReport() {
    flushNow();
    if (!enabled) return;
    ServerLog.emit('artwork', ServerLogLevel.info, 'art in flight: $_inFlight');
    final summary = _indexOpenSummary;
    if (summary == null) return;
    ServerLog.emit('artwork', summary.$1, 'art index at launch: ${summary.$2}');
  }

  static void indexFlushed({required int entries, required Duration took}) {
    if (!enabled) return;
    ServerLog.emit(
      'artwork',
      ServerLogLevel.debug,
      'art index flushed n=$entries in ${took.inMilliseconds}ms',
    );
  }

  /// Emits whatever the window holds now. Public so a test, or a log export,
  /// need not wait out the window.
  static void flushNow() {
    _windowTimer?.cancel();
    _flushWindow();
  }

  static void _flushWindow() {
    _windowTimer = null;
    if (_window.isEmpty && _windowHits == 0) return;
    final timings = List<ArtworkTiming>.of(_window);
    final hits = _windowHits;
    _window.clear();
    _windowHits = 0;
    if (!enabled) return;

    final queue = _sortedMs(timings.map((t) => t.queueWait));
    final header = _sortedMs(timings.map((t) => t.headerWait));
    final transfer = _sortedMs(timings.map((t) => t.transfer));
    final kb = timings.map((t) => t.bytes ~/ 1024).toList()..sort();
    final batches = timings.map((t) => t.batch).toSet().length;
    final maxDepth = timings.fold<int>(
      0,
      (max, t) => t.queueDepth > max ? t.queueDepth : max,
    );
    final failed = timings.where((t) => t.error != null).length;

    ServerLog.emit(
      'artwork',
      ServerLogLevel.info,
      'art ${aggregateWindow.inSeconds}s n=${timings.length} '
          'q p50/p95=${_p(queue, 50)}/${_p(queue, 95)}ms '
          'hdr=${_p(header, 50)}/${_p(header, 95)}ms '
          'xfer=${_p(transfer, 50)}/${_p(transfer, 95)}ms '
          'KB=${_p(kb, 50)}/${_p(kb, 95)} '
          'batches=$batches maxDepth=$maxDepth fail=$failed hits=$hits '
          'inflight=$_inFlight',
    );
  }

  static List<int> _sortedMs(Iterable<Duration?> values) =>
      values.whereType<Duration>().map((d) => d.inMilliseconds).toList()
        ..sort();

  static String _p(List<int> sorted, int percentile) {
    if (sorted.isEmpty) return '-';
    final index = ((sorted.length - 1) * percentile / 100).round();
    return sorted[index].toString();
  }
}

/// Strips an artwork URL down to what identifies the image and the size that
/// was asked for. The host is the user's server and the query can carry an
/// Emby api_key, neither belongs in a log that gets exported and attached to
/// bug reports.
String loggableArtworkUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return '';
  if (!uri.hasScheme) {
    // A local file path from the offline catalog. Keep the file name only.
    final slash = url.lastIndexOf('/');
    return slash == -1 ? url : url.substring(slash + 1);
  }
  final kept = <String>[
    for (final entry in uri.queryParameters.entries)
      if (entry.key == 'maxWidth' || entry.key == 'maxHeight')
        '${entry.key}=${entry.value}',
  ];
  return kept.isEmpty ? uri.path : '${uri.path}?${kept.join('&')}';
}
