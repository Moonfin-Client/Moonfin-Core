import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

void main() {
  test('kept on the device: nothing is sent to Silo', () async {
    final server = FixtureServer({});
    final api = siloTestClient(server).displayPreferencesApi;

    final empty = await api.getDisplayPreferences('lib-1', client: 'moonfin');
    expect(empty.id, 'lib-1');
    expect(empty.customPrefs, isEmpty);

    await api.saveDisplayPreferences(
      'lib-1',
      const DisplayPreferences(
        id: 'lib-1',
        sortBy: 'SortName',
        customPrefs: {'imageType': 'thumb'},
      ),
      client: 'moonfin',
    );
    final saved = await api.getDisplayPreferences('lib-1', client: 'moonfin');
    expect(saved.customPrefs['imageType'], 'thumb');
    expect(saved.sortBy, 'SortName');

    // Per id and per client name, as on Jellyfin.
    expect(
      (await api.getDisplayPreferences('lib-2', client: 'moonfin')).customPrefs,
      isEmpty,
    );
    expect(
      (await api.getDisplayPreferences('lib-1', client: 'web')).customPrefs,
      isEmpty,
    );
    expect(server.requests, isEmpty);
  });
}
