import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/aggregated_item.dart';
import '../models/home_row.dart';

/// Persists the home rows to a single JSON file so a cold start can paint
/// cached content immediately, then revalidate in the background.
///
/// Single-slot: only the last-written (server + section config) signature is
/// kept, so switching servers or changing the home layout invalidates it on the
/// next read. All operations are best-effort and never throw to the caller.
class HomeRowCacheStore {
  static const _fileName = 'home_rows_cache.json';

  static const _maxAge = Duration(days: 3);

  Future<File> _file() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_fileName');
  }

  /// Returns the cached rows for [cacheKey], or null on any miss (no file,
  /// signature mismatch, too old, corrupt, or empty).
  Future<List<HomeRow>?> read(String cacheKey) async {
    try {
      final file = await _file();
      if (!file.existsSync()) return null;
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map<String, dynamic>) return null;
      if (decoded['key'] != cacheKey) return null;
      final savedAt = decoded['savedAt'];
      if (savedAt is int) {
        final age = DateTime.now().millisecondsSinceEpoch - savedAt;
        if (age < 0 || age > _maxAge.inMilliseconds) return null;
      }
      final rawRows = decoded['rows'];
      if (rawRows is! List) return null;
      final rows = <HomeRow>[];
      for (final raw in rawRows) {
        if (raw is! Map) continue;
        final row = _rowFromJson(raw.cast<String, dynamic>());
        if (row != null) rows.add(row);
      }
      return rows.isEmpty ? null : rows;
    } catch (_) {
      return null;
    }
  }

  /// Persists the populated, non-placeholder rows under [cacheKey].
  Future<void> write(String cacheKey, List<HomeRow> rows) async {
    try {
      final serializable = rows
          .where((r) => !r.isLoading && r.items.isNotEmpty)
          .map(_rowToJson)
          .toList(growable: false);
      if (serializable.isEmpty) return;
      final payload = jsonEncode({
        'key': cacheKey,
        'savedAt': DateTime.now().millisecondsSinceEpoch,
        'rows': serializable,
      });
      final file = await _file();
      await file.writeAsString(payload, flush: true);
    } catch (_) {
    }
  }

  Map<String, dynamic> _rowToJson(HomeRow row) => {
    'id': row.id,
    'title': row.title,
    'rowType': row.rowType.name,
    'totalCount': row.totalCount,
    'items': row.items
        .map((i) => {'id': i.id, 'serverId': i.serverId, 'rawData': i.rawData})
        .toList(growable: false),
  };

  HomeRow? _rowFromJson(Map<String, dynamic> json) {
    final id = json['id'] as String?;
    final title = json['title'] as String?;
    final rowTypeName = json['rowType'] as String?;
    if (id == null || title == null || rowTypeName == null) return null;

    HomeRowType? rowType;
    for (final t in HomeRowType.values) {
      if (t.name == rowTypeName) {
        rowType = t;
        break;
      }
    }
    if (rowType == null) return null;

    final items = <AggregatedItem>[];
    final rawItems = json['items'];
    if (rawItems is List) {
      for (final raw in rawItems) {
        if (raw is! Map) continue;
        final m = raw.cast<String, dynamic>();
        final itemId = m['id'] as String?;
        final serverId = m['serverId'] as String?;
        final rawData = m['rawData'];
        if (itemId == null || serverId == null || rawData is! Map) continue;
        items.add(
          AggregatedItem(
            id: itemId,
            serverId: serverId,
            rawData: rawData.cast<String, dynamic>(),
          ),
        );
      }
    }

    return HomeRow(
      id: id,
      title: title,
      items: items,
      rowType: rowType,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? items.length,
      isLoading: false,
    );
  }
}
