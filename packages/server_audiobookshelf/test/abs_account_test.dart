import 'package:dio/dio.dart';
import 'package:server_audiobookshelf/server_audiobookshelf.dart';
import 'package:server_audiobookshelf/src/abs_progress.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fake_server.dart';

const _user = {
  'id': 'user-1',
  'username': 'test',
  'type': 'user',
  'permissions': {'download': true},
};

void main() {
  group('bookmarks', () {
    Map<String, dynamic> me(List<Map<String, dynamic>> bookmarks) => {
      ..._user,
      'bookmarks': bookmarks,
    };

    test('a bookmark saved without a label reads back without one', () async {
      final (dio, _) = fakeDio(
        (_) => ok(
          me([
            {'libraryItemId': 'book-1', 'time': 83.5, 'title': 'Intro', 'createdAt': 0},
            {'libraryItemId': 'book-1', 'time': 3723, 'title': '1:02:03'},
            {'libraryItemId': 'book-2', 'time': 5, 'title': 'Other book'},
          ]),
        ),
      );

      final list = await AbsBookmarks(dio).list('book-1');

      expect(list, [
        {
          'positionMs': 83500,
          'label': 'Intro',
          'createdAt': DateTime.fromMillisecondsSinceEpoch(0).toIso8601String(),
        },
        {'positionMs': 3723000, 'label': ''},
      ]);
    });

    test('replacing adds, renames and removes until the server matches', () async {
      final (dio, server) = fakeDio(
        (options) => options.method == 'GET'
            ? ok(
                me([
                  {'libraryItemId': 'book-1', 'time': 10, 'title': 'Keep'},
                  {'libraryItemId': 'book-1', 'time': 20.25, 'title': 'Gone'},
                  {'libraryItemId': 'book-1', 'time': 30, 'title': 'Old name'},
                ]),
              )
            : ok(null),
      );

      final done = await AbsBookmarks(dio).replace('book-1', [
        {'positionMs': 10000, 'label': 'Keep'},
        {'positionMs': 30000, 'label': 'New name'},
        {'positionMs': 61500, 'label': ''},
      ]);

      expect(done, isTrue);
      final writes = [
        for (final request in server.requests)
          if (request.method != 'GET') [request.method, request.path, request.data],
      ];
      expect(writes, [
        ['DELETE', '/api/me/item/book-1/bookmark/20.25', null],
        ['PATCH', '/api/me/item/book-1/bookmark', {'time': 30, 'title': 'New name'}],
        ['POST', '/api/me/item/book-1/bookmark', {'time': 61.5, 'title': '1:01'}],
      ]);
    });

    test('podcast episodes keep their bookmarks on the device', () async {
      final (dio, server) = fakeDio((_) => ok(me(const [])));
      final bookmarks = AbsBookmarks(dio);
      final episode = absEpisodeId('pod-1', 'ep-1');

      expect(await bookmarks.list(episode), isNull);
      expect(await bookmarks.replace(episode, const []), isFalse);
      expect(server.requests, isEmpty);
    });
  });

  group('sign-in', () {
    test('an API key signs in as its user and stays the token', () async {
      final (dio, server) = fakeDio((_) => ok({'user': _user}));

      final result = await AbsAuthApi(dio).authenticateWithApiKey('key-1');

      expect(result['AccessToken'], 'key-1');
      expect((result['User'] as Map)['Id'], 'user-1');
      expect(server.requests.single.path, '/api/authorize');
      expect(server.requests.single.headers['Authorization'], 'Bearer key-1');
    });

    test('the OpenID button shows only when the server has OpenID on', () async {
      final (off, _) = fakeDio((_) => ok({'authMethods': ['local']}));
      final (on, _) = fakeDio(
        (_) => ok({
          'authMethods': ['local', 'openid'],
          'authFormData': {'authOpenIDButtonText': 'Sign in with Authentik'},
        }),
      );

      expect(await AbsAuthApi(off).openIdButtonText(), isNull);
      expect(await AbsAuthApi(on).openIdButtonText(), 'Sign in with Authentik');
    });

    test('OpenID hands the browser page out and trades the code with its cookies', () async {
      late String state;
      final (dio, server) = fakeDio((options) {
        if (options.path == '/auth/openid') {
          state = options.queryParameters['state'] as String;
          return reply(
            302,
            'Found',
            headers: {
              'location': ['https://idp.example/authorize?x=1'],
              'set-cookie': [
                'auth_method=openid-mobile; Path=/; HttpOnly',
                'connect.sid=s%3Aabc; Path=/; HttpOnly',
              ],
            },
          );
        }
        return ok({
          'user': {..._user, 'token': 'legacy-1'},
        });
      });
      final auth = AbsAuthApi(dio);

      final page = await auth.startOpenId('moonfin://oauth');
      final start = server.requests.single;
      final callback = Uri.parse('moonfin://oauth?code=c-1&state=$state');
      final stale = Uri.parse('moonfin://oauth?code=c-1&state=other');

      expect(page, Uri.parse('https://idp.example/authorize?x=1'));
      expect(start.queryParameters['redirect_uri'], 'moonfin://oauth');
      expect(start.queryParameters['code_challenge_method'], 'S256');
      expect(start.followRedirects, isFalse);
      expect(auth.isOpenIdCallback(stale), isFalse);
      expect(auth.isOpenIdCallback(callback), isTrue);

      final result = await auth.finishOpenId(callback);
      final trade = server.requests.last;

      expect(result['AccessToken'], 'legacy-1');
      expect(trade.path, '/auth/openid/callback');
      expect(trade.queryParameters['code'], 'c-1');
      expect(trade.queryParameters['code_verifier'], isNotEmpty);
      expect(trade.headers['Cookie'], 'auth_method=openid-mobile; connect.sid=s%3Aabc');
      expect(auth.isOpenIdCallback(callback), isFalse);
    });

    test("a redirect the server doesn't allow is named as such", () async {
      final (dio, _) = fakeDio(
        (_) => reply(400, 'Invalid redirect_uri'),
      );

      await expectLater(
        AbsAuthApi(dio).startOpenId('moonfin://oauth'),
        throwsA(
          isA<AbsOpenIdRefused>().having((e) => e.redirectRefused, 'redirect', isTrue),
        ),
      );
    });
  });

  group('socket events', () {
    AbsMediaServerClient client() => AbsMediaServerClient(
      baseUrl: 'http://abs',
      deviceInfo: const DeviceInfo(id: 'd', name: 'n', appName: 'a', appVersion: '1'),
    )..userId = 'user-1';

    test('a progress update names the book or episode it moved', () {
      final abs = client();

      expect(
        abs.applySocketEvent('user_item_progress_updated', {
          'data': {'libraryItemId': 'book-1', 'episodeId': null, 'currentTime': 5},
        }),
        {'book-1'},
      );
      expect(
        abs.applySocketEvent('user_item_progress_updated', {
          'data': {'libraryItemId': 'pod-1', 'episodeId': 'ep-1', 'currentTime': 5},
        }),
        {absEpisodeId('pod-1', 'ep-1')},
      );
      expect(abs.applySocketEvent('user_session_closed', 'sid'), isEmpty);
    });

    test('a user update names only the entries that changed', () {
      final cache = AbsProgressCache(Dio());
      Map<String, dynamic> user(List<Map<String, dynamic>> progress) => {
        ..._user,
        'mediaProgress': progress,
      };
      cache.replaceFrom(
        user([
          {'libraryItemId': 'a', 'currentTime': 1, 'lastUpdate': 1},
          {'libraryItemId': 'b', 'currentTime': 1, 'lastUpdate': 1},
          {'libraryItemId': 'c', 'currentTime': 1, 'lastUpdate': 1},
        ]),
      );

      final changed = cache.replaceFrom(
        user([
          {'libraryItemId': 'a', 'currentTime': 1, 'lastUpdate': 1},
          {'libraryItemId': 'b', 'currentTime': 9, 'lastUpdate': 2},
          {'libraryItemId': 'pod', 'episodeId': 'e', 'currentTime': 1},
        ]),
      );

      expect(changed, {'b', 'c', 'pod/e'});
    });

    test("another user's update is ignored", () {
      expect(
        client().applySocketEvent('user_updated', {'id': 'someone-else'}),
        isEmpty,
      );
    });
  });
}
