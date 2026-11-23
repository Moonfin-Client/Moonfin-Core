import 'package:drift/drift.dart';

import 'database_connection_impl_io.dart' as offline_impl;
import 'offline_database_location.dart';

QueryExecutor openIptvConnection() {
  return LazyDatabase(
    () async => offline_impl.openNativeDatabaseForFile(
      await offlineDatabaseFile('iptv.db'),
    ),
  );
}
