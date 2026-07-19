import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  // These run on the Dart VM, so isWebPlatform is false and the web exclusion
  // branch can't be exercised here.
  group('MediaStreamResolver.isRemoteDirectPlayEligible', () {
    bool eligible({
      bool enableDirectPlay = true,
      bool isRemote = true,
      bool isManagedLiveStream = false,
      bool supportsDirectPlay = true,
      String? protocol = 'Http',
      String? path = 'https://cdn.example.com/movie.mkv',
      String serverBaseUrl = 'https://jellyfin.example.com',
    }) {
      return MediaStreamResolver.isRemoteDirectPlayEligible(
        enableDirectPlay: enableDirectPlay,
        isRemote: isRemote,
        isManagedLiveStream: isManagedLiveStream,
        supportsDirectPlay: supportsDirectPlay,
        protocol: protocol,
        path: path,
        serverBaseUrl: serverBaseUrl,
      );
    }

    test('a public host stays direct', () {
      expect(eligible(), isTrue);
      expect(eligible(protocol: 'http'), isTrue);
      expect(eligible(path: 'http://cdn.example.com:8080/a.ts'), isTrue);
    });

    test('a LAN url is refused when the server is reached remotely', () {
      // The reported case: a .strm holding a LAN address, played from outside.
      expect(eligible(path: 'http://192.168.1.20:8096/media/a.mkv'), isFalse);
      expect(eligible(path: 'http://10.0.0.5/a.mkv'), isFalse);
      expect(eligible(path: 'http://172.20.4.1/a.mkv'), isFalse);
      expect(eligible(path: 'http://169.254.3.9/a.mkv'), isFalse);
      expect(eligible(path: 'http://nas.local/a.mkv'), isFalse);
      expect(eligible(path: 'http://nas/a.mkv'), isFalse);
      expect(eligible(path: 'http://[fd00::1]/a.mkv'), isFalse);
    });

    test('a LAN url stays direct when the server is on that network too', () {
      expect(
        eligible(
          path: 'http://192.168.1.20:8096/media/a.mkv',
          serverBaseUrl: 'http://192.168.1.5:8096',
        ),
        isTrue,
      );
      expect(
        eligible(
          path: 'http://nas.local/a.mkv',
          serverBaseUrl: 'http://tower.local:8096',
        ),
        isTrue,
      );
    });

    test('172.x outside the private range is public', () {
      expect(eligible(path: 'http://172.15.0.1/a.mkv'), isTrue);
      expect(eligible(path: 'http://172.32.0.1/a.mkv'), isTrue);
    });

    test('loopback is never direct', () {
      expect(eligible(path: 'http://localhost:8096/a.mkv'), isFalse);
      expect(eligible(path: 'http://127.0.0.1:8096/a.mkv'), isFalse);
      // Not even when we reached the server over loopback ourselves.
      expect(
        eligible(
          path: 'http://127.0.0.1:8096/a.mkv',
          serverBaseUrl: 'http://127.0.0.1:8096',
        ),
        isFalse,
      );
    });

    test('refused when the source is not a plain http source', () {
      expect(eligible(protocol: 'File'), isFalse);
      expect(eligible(protocol: null), isFalse);
      expect(eligible(path: 'rtsp://cdn.example.com/a'), isFalse);
      expect(eligible(path: null), isFalse);
      expect(eligible(supportsDirectPlay: false), isFalse);
      expect(eligible(isRemote: false), isFalse);
    });

    test('a link-local IPv6 upstream needs a private server too', () {
      expect(eligible(path: 'http://[fe80::1]/a.mkv'), isFalse);
      expect(eligible(path: 'http://[2606:4700::1]/a.mkv'), isTrue);
    });

    test('live streams and forced transcodes go through the server', () {
      expect(eligible(isManagedLiveStream: true), isFalse);
      expect(eligible(enableDirectPlay: false), isFalse);
    });
  });
}
