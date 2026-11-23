import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:path_provider/path_provider.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../util/platform_detection.dart';

/// Records live IPTV streams to disk by copying the HTTP stream, which works
/// on every player backend. A periodic check starts due schedules, stops
/// finished or canceled ones, and finalizes the recording rows the live TV
/// recordings screen lists.
class IptvRecordingService {
  static const _checkInterval = Duration(seconds: 30);

  /// Recording needs a long-lived background socket and file access, which
  /// iOS, Apple TV and the browser don't allow.
  static bool get supported =>
      !PlatformDetection.isIOS &&
      !PlatformDetection.isAppleTV &&
      !PlatformDetection.isWeb;

  final IptvDatabase _db;
  final IptvCredentialStore _credentials;
  late final RecordingsRepository _recordings = RecordingsRepository(_db);
  late final ChannelRepository _channels = ChannelRepository(_db);
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      // Live streams run until canceled, so no receive timeout.
      receiveTimeout: Duration.zero,
    ),
  );

  final Map<int, _RecordingJob> _activeByScheduleId = {};
  Timer? _timer;
  Future<void>? _inFlightCheck;

  IptvRecordingService(this._db, this._credentials);

  void start() {
    if (!supported || _timer != null) return;
    _timer = Timer.periodic(_checkInterval, (_) => unawaited(_check()));
    unawaited(_finalizeOrphans().whenComplete(_check));
  }

  // A crash or kill mid-recording leaves rows marked recording that no job
  // owns, and the poller never comes back to them.
  Future<void> _finalizeOrphans() async {
    try {
      for (final schedule in await _recordings.getActiveSchedules()) {
        final recordingId = schedule.recordingId;
        if (schedule.status != IptvRecordingStatus.recording ||
            recordingId == null ||
            _activeByScheduleId.containsKey(schedule.id)) {
          continue;
        }
        final recording = await _recordings.getRecordingById(recordingId);
        if (recording == null) continue;
        final file = File(recording.filePath);
        await _finishJob(
          _RecordingJob(
            scheduleId: schedule.id,
            recordingId: recordingId,
            file: file,
            startedAt: recording.startedAt,
          ),
          IptvRecordingStatus.failed,
          // The last write is when the capture really stopped.
          endedAt: await file.exists()
              ? await file.lastModified()
              : recording.startedAt,
        );
      }
    } catch (_) {}
  }

  Future<void> dispose() async {
    _timer?.cancel();
    _timer = null;
    for (final job in _activeByScheduleId.values.toList()) {
      await _finishJob(job, IptvRecordingStatus.completed);
    }
    _dio.close();
  }

  // A slow check that overlaps the next tick could start a schedule twice.
  Future<void> _check() =>
      _inFlightCheck ??= _runCheck().whenComplete(() => _inFlightCheck = null);

  Future<void> _runCheck() async {
    try {
      await _checkSchedules();
    } catch (_) {
      // The next tick tries again, and a timer has no one to report to.
    }
  }

  Future<void> _checkSchedules() async {
    final now = DateTime.now();
    final schedules = await _recordings.getActiveSchedules();

    // Jobs whose schedule was canceled or removed stop mid-recording.
    for (final job in _activeByScheduleId.values.toList()) {
      final schedule = schedules
          .where((s) => s.id == job.scheduleId)
          .firstOrNull;
      if (schedule == null) {
        await _finishJob(job, IptvRecordingStatus.cancelled);
      } else if (now.isAfter(schedule.programEnd)) {
        await _finishJob(job, IptvRecordingStatus.completed);
      }
    }

    for (final schedule in schedules) {
      if (_activeByScheduleId.containsKey(schedule.id)) continue;
      if (schedule.status != IptvRecordingStatus.scheduled) continue;
      if (now.isBefore(schedule.programStart)) continue;
      if (now.isAfter(schedule.programEnd)) {
        await _recordings.updateSchedule(
          schedule.id,
          const ScheduledRecordingsCompanion(
            status: Value(IptvRecordingStatus.failed),
          ),
        );
        continue;
      }
      await _startJob(schedule);
    }
  }

  Future<void> _startJob(ScheduledRecording schedule) async {
    final channel = await _channels.getChannelById(schedule.channelId);
    if (channel == null) return;
    final url = await resolveChannelStreamUrl(
      channel,
      _credentials.getXtreamCredentials,
    );

    final directory = await _recordingsDirectory();
    final stamp = DateTime.now().millisecondsSinceEpoch;
    final safeTitle = schedule.title
        .replaceAll(RegExp(r'[^A-Za-z0-9 _-]'), '')
        .trim()
        .replaceAll(' ', '_');
    final file = File('${directory.path}/${stamp}_$safeTitle.ts');

    final recordingId = await _recordings.insertRecording(
      RecordingsCompanion.insert(
        playlistId: Value(schedule.playlistId),
        title: schedule.title,
        filePath: file.path,
        status: const Value(IptvRecordingStatus.recording),
      ),
    );
    await _recordings.updateSchedule(
      schedule.id,
      ScheduledRecordingsCompanion(
        status: const Value(IptvRecordingStatus.recording),
        recordingId: Value(recordingId),
      ),
    );

    final job = _RecordingJob(
      scheduleId: schedule.id,
      recordingId: recordingId,
      file: file,
      startedAt: DateTime.now(),
    );
    _activeByScheduleId[schedule.id] = job;

    try {
      if (url == null) throw StateError('No login for the channel');
      final response = await _dio.get<ResponseBody>(
        url,
        options: Options(responseType: ResponseType.stream),
        cancelToken: job.cancelToken,
      );
      final sink = file.openWrite();
      job.sink = sink;
      job.subscription = response.data!.stream.listen(
        sink.add,
        onError: (Object _) =>
            unawaited(_finishJob(job, IptvRecordingStatus.failed)),
        // The stream ending on its own is a drop, so the salvage rule decides.
        onDone: () => unawaited(_finishJob(job, IptvRecordingStatus.failed)),
        cancelOnError: true,
      );
    } catch (_) {
      await _finishJob(job, IptvRecordingStatus.failed);
    }
  }

  Future<void> _finishJob(
    _RecordingJob job,
    String status, {
    DateTime? endedAt,
  }) async {
    if (job.finished) return;
    job.finished = true;
    _activeByScheduleId.remove(job.scheduleId);

    job.cancelToken.cancel();
    await job.subscription?.cancel();
    try {
      await job.sink?.close();
    } catch (_) {
      // A write error such as a full disk lands here, and the rows below
      // still need their final status.
    }

    final fileSize = await job.file.exists() ? await job.file.length() : 0;
    final end = endedAt ?? DateTime.now();
    // A stopped or dropped stream that already produced usable data keeps the
    // capture as a completed recording.
    final salvageable = fileSize > 1024 * 1024;
    final recordingStatus =
        status == IptvRecordingStatus.completed || salvageable
        ? IptvRecordingStatus.completed
        : IptvRecordingStatus.failed;

    final kept = await _recordings.updateRecording(
      job.recordingId,
      RecordingsCompanion(
        status: Value(recordingStatus),
        durationMs: Value(end.difference(job.startedAt).inMilliseconds),
      ),
    );
    await _recordings.updateSchedule(
      job.scheduleId,
      ScheduledRecordingsCompanion(
        status: Value(
          status == IptvRecordingStatus.cancelled
              ? IptvRecordingStatus.cancelled
              : recordingStatus,
        ),
      ),
    );

    // No row left means the playlist went while this was recording.
    if (recordingStatus == IptvRecordingStatus.failed || !kept) {
      try {
        if (await job.file.exists()) await job.file.delete();
        await _recordings.deleteRecording(job.recordingId);
      } catch (_) {}
    }
  }

  Future<Directory> _recordingsDirectory() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory('${support.path}/Moonfin/Recordings');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }
}

class _RecordingJob {
  final int scheduleId;
  final int recordingId;
  final File file;
  final DateTime startedAt;
  final CancelToken cancelToken = CancelToken();
  IOSink? sink;
  StreamSubscription<List<int>>? subscription;
  bool finished = false;

  _RecordingJob({
    required this.scheduleId,
    required this.recordingId,
    required this.file,
    required this.startedAt,
  });
}
