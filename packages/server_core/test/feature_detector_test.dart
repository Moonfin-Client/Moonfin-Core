import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

FeatureDetector _detector(ServerType type, String version) =>
    FeatureDetector(serverType: type, serverVersion: version);

void main() {
  group('supportsQuickConnectWebLink', () {
    test('is on from Jellyfin 10.9', () {
      expect(_detector(ServerType.jellyfin, '10.9.0').supportsQuickConnectWebLink, isTrue);
      expect(_detector(ServerType.jellyfin, '10.11.0').supportsQuickConnectWebLink, isTrue);
      expect(_detector(ServerType.jellyfin, '11.0.0').supportsQuickConnectWebLink, isTrue);
    });

    test('is off before 10.9, where the page has no prefill', () {
      expect(_detector(ServerType.jellyfin, '10.8.13').supportsQuickConnectWebLink, isFalse);
      expect(_detector(ServerType.jellyfin, '9.9.9').supportsQuickConnectWebLink, isFalse);
    });

    test('counts a version that does not parse as recent enough', () {
      expect(_detector(ServerType.jellyfin, '').supportsQuickConnectWebLink, isTrue);
      expect(_detector(ServerType.jellyfin, 'unknown').supportsQuickConnectWebLink, isTrue);
    });

    test('is off for Emby, which has no Quick Connect', () {
      expect(_detector(ServerType.emby, '4.8.0.0').supportsQuickConnectWebLink, isFalse);
    });
  });
}
