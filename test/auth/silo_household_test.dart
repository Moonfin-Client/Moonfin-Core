import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/services/silo_household.dart';
import 'package:moonfin/auth/services/silo_token_storage.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

PrivateUser _profile(String id, int day, {bool pin = false}) => PrivateUser(
  id: id,
  name: id,
  serverId: 's1',
  accessToken: 'access-1',
  lastUsed: DateTime.utc(2026, 10, day),
  siloAccountId: '9',
  siloHasPin: pin,
);

/// Which profile another Silo server's rows are read as.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthenticationStore store;
  late SiloTokenStorage storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = AuthenticationStore();
    await store.init();
    storage = SiloTokenStorage(store);
    await store.putSiloTokens('s1', '9', {
      'access_token': 'access-1',
      'refresh_token': 'refresh-1',
      'expires_at': '2026-10-19T13:00:00.000Z',
      'lifetime_seconds': 3600,
    });
  });

  test('the most recently used profile, not the first stored', () {
    final users = [_profile('brady', 1), _profile('kid', 18)];

    expect(SiloHousehold.profileForOtherServer(users, storage)?.id, 'kid');
  });

  test('a locked profile without its PIN proof is skipped', () {
    final users = [_profile('brady', 1), _profile('teen', 18, pin: true)];

    expect(SiloHousehold.profileForOtherServer(users, storage)?.id, 'brady');
  });

  test('a locked profile with a live proof counts', () async {
    final teen = _profile('teen', 18, pin: true);
    await storage.saveProfileToken(teen, 'pvt_1');

    expect(
      SiloHousehold.profileForOtherServer([
        _profile('brady', 1),
        teen,
      ], storage)?.id,
      'teen',
    );
  });

  test('none when every profile is locked', () {
    expect(
      SiloHousehold.profileForOtherServer([
        _profile('teen', 18, pin: true),
      ], storage),
      isNull,
    );
  });
}
