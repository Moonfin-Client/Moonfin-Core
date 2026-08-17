import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('UserItemData', () {
    test('parses decimal personal rating and likes', () {
      final item = ServerItem.fromJson({
        'Id': 'movie-1',
        'UserData': {'Rating': 8.5, 'Likes': true},
      });

      expect(item.userData?.rating, 8.5);
      expect(item.userData?.likes, isTrue);
    });

    test('parses integer personal rating as double', () {
      final item = ServerItem.fromJson({
        'Id': 'movie-1',
        'UserData': {'Rating': 8},
      });

      expect(item.userData?.rating, 8.0);
      expect(item.userData?.likes, isNull);
    });

    test('keeps absent personal rating and likes null', () {
      final item = ServerItem.fromJson({
        'Id': 'movie-1',
        'UserData': <String, dynamic>{},
      });

      expect(item.userData?.rating, isNull);
      expect(item.userData?.likes, isNull);
    });

    test('keeps user data null when it is absent', () {
      final item = ServerItem.fromJson({'Id': 'movie-1'});

      expect(item.userData, isNull);
    });
  });

  group('UserPolicy remote subtitles', () {
    test('an Emby account granted only downloading may still fetch', () {
      final policy = UserPolicy.fromJson({
        'EnableSubtitleManagement': false,
        'EnableSubtitleDownloading': true,
      });

      expect(policy.canFetchRemoteSubtitles, isTrue);
    });

    test('a Jellyfin account granted only management may fetch', () {
      final policy = UserPolicy.fromJson({'EnableSubtitleManagement': true});

      expect(policy.canFetchRemoteSubtitles, isTrue);
    });

    test('an account granted neither may not', () {
      final policy = UserPolicy.fromJson({
        'EnableSubtitleManagement': false,
        'EnableSubtitleDownloading': false,
      });

      expect(policy.canFetchRemoteSubtitles, isFalse);
    });
  });
}
