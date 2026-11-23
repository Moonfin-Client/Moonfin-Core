import 'package:drift/drift.dart';

import 'iptv_database_connection_impl_io.dart'
    if (dart.library.js_interop) 'iptv_database_connection_impl_web.dart'
    as impl;

/// Platform-aware connection for the IPTV catalog database. It reuses the
/// shared sqlite setup so per-platform library quirks stay in one place.
QueryExecutor openIptvConnection() => impl.openIptvConnection();
