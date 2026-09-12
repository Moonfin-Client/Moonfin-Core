import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/home_row_cache_store.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.supportPath);

  final String supportPath;

  @override
  Future<String?> getApplicationSupportPath() async => supportPath;
}

HomeRow _row(String id, HomeRowType type) => HomeRow(
  id: id,
  title: id,
  rowType: type,
  items: [
    AggregatedItem(
      id: '$id-item',
      serverId: 'server',
      rawData: {'Name': id, 'Type': 'Program'},
    ),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory support;
  late HomeRowCacheStore store;

  setUp(() {
    support = Directory.systemTemp.createTempSync('moonfin_home_rows');
    PathProviderPlatform.instance = _FakePathProvider(support.path);
    store = HomeRowCacheStore();
  });

  tearDown(() {
    if (support.existsSync()) support.deleteSync(recursive: true);
  });

  test('does not persist the time-bound On Now row', () async {
    await store.write('key', [
      _row('liveTvOnNow', HomeRowType.liveTvOnNow),
      _row('resume', HomeRowType.resume),
    ]);

    final rows = await store.read('key');

    expect(rows?.map((r) => r.rowType), [HomeRowType.resume]);
  });
}
