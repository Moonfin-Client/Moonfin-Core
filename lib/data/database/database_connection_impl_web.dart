import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor openConnection() => openWasmDatabaseNamed('moonfin_offline');

/// The browser drift setup shared by every on-device database.
QueryExecutor openWasmDatabaseNamed(String databaseName) {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: databaseName,
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );
    return result.resolvedExecutor;
  });
}
