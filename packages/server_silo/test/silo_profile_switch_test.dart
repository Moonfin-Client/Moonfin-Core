import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

/// Switching household profiles on one client.
void main() {
  FixtureServer server() => FixtureServer({
    '/api/v2/user/libraries': siloJson({
      'items': [
        {'id': '1', 'name': 'Movies', 'type': 'movies', 'sort_order': 1},
      ],
    }),
    '/api/v2/settings/values/effective': siloEffectiveSettings({}),
  });

  int libraryReads(FixtureServer s) =>
      s.requests.where((r) => r.uri.path == '/api/v2/user/libraries').length;

  test('another profile reads its own libraries, as itself', () async {
    final s = server();
    final client = siloTestClient(s);

    await client.userViewsApi.getUserViews();
    await client.userViewsApi.getUserViews();
    expect(libraryReads(s), 1, reason: 'cached for the same profile');

    client.profileId = 'p2';
    await client.userViewsApi.getUserViews();

    expect(libraryReads(s), 2);
    expect(s.requests.last.headers['X-Profile-Id'], 'p2');
  });

  test('the same login stays: no sign-in, no refresh', () async {
    final s = server();
    final client = siloTestClient(s);
    final tokens = client.session.tokens;

    client
      ..profileId = 'p2'
      ..profileToken = 'pvt_2';
    await client.userViewsApi.getUserViews();

    expect(client.session.tokens, same(tokens));
    expect(
      s.requests.map((r) => r.uri.path),
      isNot(
        anyOf(contains('/api/v2/auth/login'), contains('/api/v2/auth/refresh')),
      ),
    );
    expect(s.requests.last.headers['X-Profile-Token'], 'pvt_2');
  });

  test('picking a first profile forgets nothing', () async {
    final s = server();
    final client = siloTestClient(s)..profileId = null;
    await client.userViewsApi.getUserViews();

    client.profileId = 'p1';
    await client.userViewsApi.getUserViews();

    expect(libraryReads(s), 1);
  });

  test("another login doesn't read the previous one's libraries", () async {
    final s = server();
    final client = siloTestClient(s);
    await client.userViewsApi.getUserViews();

    client.session.setTokens(
      SiloTokens(
        accessToken: 'other_access',
        refreshToken: 'other_refresh',
        expiresAt: DateTime.utc(2100),
        lifetime: const Duration(hours: 1),
      ),
    );
    client.profileId = 'p1';
    await client.userViewsApi.getUserViews();

    expect(libraryReads(s), 2);
  });
}
