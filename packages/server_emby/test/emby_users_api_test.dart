import 'package:server_core/server_core.dart';
import 'package:server_emby/src/api/emby_users_api.dart';
import 'package:test/test.dart';

import 'admin_fake.dart';

void main() {
  group('profile picture', () {
    EmbyUsersApi api(AdminFake fake) => EmbyUsersApi(fake.dio, () => 'u1');

    test('a user with preference access may change it', () async {
      final fake = AdminFake({
        '/Users/u1': {
          'Policy': {'IsAdministrator': false},
        },
      });
      expect(
        await api(fake).userImageUpload('u1'),
        same(UserImageUpload.jellyfinAndEmby),
      );
    });

    test('a user without preference access may not', () async {
      final fake = AdminFake({
        '/Users/u1': {
          'Policy': {
            'IsAdministrator': false,
            'EnableUserPreferenceAccess': false,
          },
        },
      });
      expect(await api(fake).userImageUpload('u1'), isNull);
    });

    test('an upload posts base64 to the user image', () async {
      final fake = AdminFake();
      await api(
        fake,
      ).uploadUserImage('u1', bytes: [1, 2, 3], contentType: 'image/png');

      expect(fake.last.method, 'POST');
      expect(fake.last.path, '/Users/u1/Images/Primary');
      expect(fake.last.data, 'AQID');
      expect(fake.last.contentType, 'image/png');
    });

    test('remove deletes the user image', () async {
      final fake = AdminFake();
      await api(fake).deleteUserImage('u1');

      expect(fake.last.method, 'DELETE');
      expect(fake.last.path, '/Users/u1/Images/Primary');
    });
  });
}
