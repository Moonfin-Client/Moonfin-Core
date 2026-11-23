import 'package:drift/drift.dart';

import '../db/iptv_database.dart';

/// Recording status values shared by the Recordings and ScheduledRecordings
/// tables.
abstract final class IptvRecordingStatus {
  static const scheduled = 'scheduled';
  static const recording = 'recording';
  static const completed = 'completed';
  static const failed = 'failed';
  static const cancelled = 'cancelled';
}

class RecordingsRepository {
  final IptvDatabase _db;

  RecordingsRepository(this._db);

  Future<int> insertRecording(RecordingsCompanion recording) =>
      _db.into(_db.recordings).insert(recording);

  /// False when the recording row no longer exists.
  Future<bool> updateRecording(int id, RecordingsCompanion changes) async {
    final updated = await (_db.update(
      _db.recordings,
    )..where((r) => r.id.equals(id))).write(changes);
    return updated > 0;
  }

  Future<Recording?> getRecordingById(int id) {
    return (_db.select(
      _db.recordings,
    )..where((r) => r.id.equals(id))).getSingleOrNull();
  }

  Future<List<Recording>> getCompletedRecordings() {
    return (_db.select(_db.recordings)
          ..where((r) => r.status.equals(IptvRecordingStatus.completed))
          ..orderBy([(r) => OrderingTerm.desc(r.startedAt)]))
        .get();
  }

  Future<void> deleteRecording(int id) async {
    await (_db.delete(_db.recordings)..where((r) => r.id.equals(id))).go();
  }

  Future<int> insertSchedule(ScheduledRecordingsCompanion schedule) =>
      _db.into(_db.scheduledRecordings).insert(schedule);

  Future<void> updateSchedule(
    int id,
    ScheduledRecordingsCompanion changes,
  ) async {
    await (_db.update(
      _db.scheduledRecordings,
    )..where((s) => s.id.equals(id))).write(changes);
  }

  /// Pending and in-progress schedules, soonest first.
  Future<List<ScheduledRecording>> getActiveSchedules() {
    return (_db.select(_db.scheduledRecordings)
          ..where(
            (s) => s.status.isIn(const [
              IptvRecordingStatus.scheduled,
              IptvRecordingStatus.recording,
            ]),
          )
          ..orderBy([(s) => OrderingTerm.asc(s.programStart)]))
        .get();
  }

  /// An active schedule matching a channel and program start, used both to
  /// stop double booking and to map guide programs to their timer.
  Future<ScheduledRecording?> findActiveSchedule(
    int channelId,
    DateTime programStart,
  ) {
    return (_db.select(_db.scheduledRecordings)
          ..where(
            (s) =>
                s.channelId.equals(channelId) &
                s.programStart.equals(programStart) &
                s.status.isIn(const [
                  IptvRecordingStatus.scheduled,
                  IptvRecordingStatus.recording,
                ]),
          )
          ..limit(1))
        .getSingleOrNull();
  }
}
