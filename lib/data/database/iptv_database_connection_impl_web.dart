import 'package:drift/drift.dart';

import 'database_connection_impl_web.dart' as offline_impl;

QueryExecutor openIptvConnection() =>
    offline_impl.openWasmDatabaseNamed('moonfin_iptv');
