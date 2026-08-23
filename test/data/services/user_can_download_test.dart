import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/services/download_service.dart';

PrivateUser _user({required bool canDownload}) => PrivateUser(
  id: 'u1',
  name: 'Test',
  serverId: 's1',
  accessToken: 'token',
  lastUsed: DateTime(2026),
  canDownload: canDownload,
);

void main() {
  late UserRepository users;

  setUp(() {
    users = UserRepository();
    GetIt.instance.registerSingleton<UserRepository>(users);
  });

  tearDown(() => GetIt.instance.reset());

  test('a user the server allows to download may download', () {
    users.setCurrentUser(_user(canDownload: true));
    expect(userCanDownload(), isTrue);
  });

  test('a user the server forbids may not, whatever the screen offers', () {
    users.setCurrentUser(_user(canDownload: false));
    expect(
      userCanDownload(),
      isFalse,
      reason: 'the track dialog used to offer downloads regardless',
    );
  });

  test('nobody signed in may not download', () {
    users.setCurrentUser(null);
    expect(userCanDownload(), isFalse);
  });
}
