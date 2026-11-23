import 'package:drift/drift.dart';

import '../db/iptv_database.dart';

/// Stores scheduled program reminders so they survive restarts and can be
/// re-armed after the OS drops pending notifications.
class RemindersRepository {
  final IptvDatabase _db;

  RemindersRepository(this._db);

  Future<List<Reminder>> getUpcoming(DateTime after) {
    return (_db.select(_db.reminders)
          ..where((r) => r.programStart.isBiggerThanValue(after))
          ..orderBy([(r) => OrderingTerm.asc(r.programStart)]))
        .get();
  }

  Future<bool> exists(int notificationId) async {
    final row =
        await (_db.select(_db.reminders)
              ..where((r) => r.notificationId.equals(notificationId))
              ..limit(1))
            .getSingleOrNull();
    return row != null;
  }

  /// Setting the same reminder again updates it, keyed by notification id.
  Future<void> add(RemindersCompanion companion) {
    return _db
        .into(_db.reminders)
        .insert(
          companion,
          onConflict: DoUpdate(
            (_) => companion,
            target: [_db.reminders.notificationId],
          ),
        );
  }

  Future<void> removeByNotificationId(int notificationId) {
    return (_db.delete(
      _db.reminders,
    )..where((r) => r.notificationId.equals(notificationId))).go();
  }

  Future<void> removePast(DateTime before) {
    return (_db.delete(
      _db.reminders,
    )..where((r) => r.programStart.isSmallerThanValue(before))).go();
  }
}
