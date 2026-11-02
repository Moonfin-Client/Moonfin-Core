import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> _tokens(String access) => {
  'access_token': access,
  'refresh_token': 'refresh-$access',
  'expires_at': '2026-10-13T13:00:00.000Z',
  'lifetime_seconds': 3600,
};

PrivateUser _user(String id, {String? account, String server = 's1'}) =>
    PrivateUser(
      id: id,
      name: id,
      serverId: server,
      accessToken: 'tok-$id',
      lastUsed: DateTime.utc(2026, 10, 13),
      siloAccountId: account,
    );

Server _server(String name, String address) => Server(
  id: 's1',
  name: name,
  address: address,
  version: 'abc',
  serverType: ServerType.silo,
  dateAdded: DateTime.utc(2026, 10, 13),
);

Future<AuthenticationStore> _store() async {
  final store = AuthenticationStore();
  await store.init();
  return store;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('stores and reads a token pair per (server, account)', () async {
    final store = await _store();

    await store.putSiloTokens('s1', '9', _tokens('a'));
    await store.putSiloTokens('s1', '10', _tokens('b'));
    await store.putSiloTokens('s2', '9', _tokens('c'));

    expect(store.getSiloTokens('s1', '9')?['access_token'], 'a');
    expect(store.getSiloTokens('s1', '10')?['access_token'], 'b');
    expect(store.getSiloTokens('s2', '9')?['access_token'], 'c');
    expect(store.getSiloTokens('s1', 'nobody'), isNull);
    expect(store.getSiloAccountIds('s1'), unorderedEquals(['9', '10']));
  });

  test('a refresh replaces the pair', () async {
    final store = await _store();

    await store.putSiloTokens('s1', '9', _tokens('a'));
    await store.putSiloTokens('s1', '9', _tokens('a2'));

    expect(store.getSiloTokens('s1', '9')?['refresh_token'], 'refresh-a2');
  });

  test('survives an app restart', () async {
    await (await _store()).putSiloTokens('s1', '9', _tokens('a'));

    final reopened = await _store();

    expect(reopened.getSiloTokens('s1', '9')?['access_token'], 'a');
  });

  test('editing the server keeps its Silo accounts and users', () async {
    final store = await _store();
    await store.putServer(_server('Silo', 'https://a'));
    await store.putUser(_user('p1', account: '9'));
    await store.putSiloTokens('s1', '9', _tokens('a'));

    await store.putServer(_server('Renamed', 'https://b'));

    expect(store.getSiloTokens('s1', '9')?['access_token'], 'a');
    expect(store.getUsers('s1').single.id, 'p1');
  });

  test('removing the account\'s last user removes its tokens', () async {
    final store = await _store();
    await store.putUser(_user('p1', account: '9'));
    await store.putSiloTokens('s1', '9', _tokens('a'));

    await store.removeUser('s1', 'p1');

    expect(store.getSiloTokens('s1', '9'), isNull);
    expect(store.getSiloAccountIds('s1'), isEmpty);
  });

  test('tokens stay while another user of the account remains', () async {
    final store = await _store();
    await store.putUser(_user('p1', account: '9'));
    await store.putUser(_user('p2', account: '9'));
    await store.putUser(_user('other', account: '10'));
    await store.putSiloTokens('s1', '9', _tokens('a'));
    await store.putSiloTokens('s1', '10', _tokens('b'));

    await store.removeUser('s1', 'p1');
    expect(store.getSiloTokens('s1', '9'), isNotNull);

    await store.removeUser('s1', 'p2');
    expect(store.getSiloTokens('s1', '9'), isNull);
    expect(store.getSiloTokens('s1', '10'), isNotNull);
  });

  test('removing a Jellyfin or Emby user touches no Silo account', () async {
    final store = await _store();
    await store.putUser(_user('jf'));
    await store.putSiloTokens('s1', '9', _tokens('a'));

    await store.removeUser('s1', 'jf');

    expect(store.getSiloTokens('s1', '9'), isNotNull);
  });

  test('removeSiloAccount forgets only the tokens', () async {
    final store = await _store();
    await store.putUser(_user('p1', account: '9'));
    await store.putSiloTokens('s1', '9', _tokens('a'));

    await store.removeSiloAccount('s1', '9');
    await store.removeSiloAccount('s1', 'unknown');
    await store.removeSiloAccount('nowhere', '9');

    expect(store.getSiloTokens('s1', '9'), isNull);
    expect(store.getUsers('s1').single.siloAccountId, '9');
  });

  group('profile PIN proofs', () {
    const proof = {'token': 'pvt_1', 'expiresAt': '2026-10-13T14:00:00.000Z'};

    test('stored per profile under the account', () async {
      final store = await _store();
      await store.putSiloTokens('s1', '9', _tokens('a'));

      await store.putSiloProfileToken('s1', '9', 'teen', proof);

      expect(store.getSiloProfileToken('s1', '9', 'teen'), proof);
      expect(store.getSiloProfileToken('s1', '9', 'kid'), isNull);
      expect(store.getSiloProfileToken('s1', '10', 'teen'), isNull);
    });

    test('a refresh keeps them; a new login drops them', () async {
      final store = await _store();
      await store.putSiloTokens('s1', '9', _tokens('a'));
      await store.putSiloProfileToken('s1', '9', 'teen', proof);

      await store.putSiloTokens('s1', '9', _tokens('b'));
      expect(store.getSiloProfileToken('s1', '9', 'teen'), proof);
      expect(store.getSiloTokens('s1', '9')?['access_token'], 'b');

      await store.putSiloTokens('s1', '9', _tokens('c'), newLogin: true);
      expect(store.getSiloProfileToken('s1', '9', 'teen'), isNull);
    });

    test('null forgets one; nothing is stored without a login', () async {
      final store = await _store();
      await store.putSiloTokens('s1', '9', _tokens('a'));
      await store.putSiloProfileToken('s1', '9', 'teen', proof);
      await store.putSiloProfileToken('s1', '9', 'kid', proof);

      await store.putSiloProfileToken('s1', '9', 'teen', null);
      await store.putSiloProfileToken('s1', '10', 'x', proof);

      expect(store.getSiloProfileToken('s1', '9', 'teen'), isNull);
      expect(store.getSiloProfileToken('s1', '9', 'kid'), proof);
      expect(store.getSiloProfileToken('s1', '10', 'x'), isNull);
      expect(store.getSiloAccountIds('s1'), ['9']);
    });

    test('they go with the account', () async {
      final store = await _store();
      await store.putUser(_user('teen', account: '9'));
      await store.putSiloTokens('s1', '9', _tokens('a'));
      await store.putSiloProfileToken('s1', '9', 'teen', proof);

      await store.removeUser('s1', 'teen');
      await store.putSiloTokens('s1', '9', _tokens('b'));

      expect(store.getSiloProfileToken('s1', '9', 'teen'), isNull);
    });
  });
}
