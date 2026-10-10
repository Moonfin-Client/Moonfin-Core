import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

FeatureDetector _for(ServerType type) =>
    FeatureDetector(serverType: type, serverVersion: '');

void main() {
  test('Jellyfin and Emby keep their existing flags', () {
    final jellyfin = _for(ServerType.jellyfin);
    expect(jellyfin.supportsSyncPlay, isTrue);
    expect(jellyfin.supportsTrickplay, isTrue);
    expect(jellyfin.supportsMediaSegments, isTrue);
    expect(jellyfin.supportsQuickConnect, isTrue);
    expect(jellyfin.supportsBifTrickplay, isFalse);

    final emby = _for(ServerType.emby);
    expect(emby.supportsSyncPlay, isFalse);
    expect(emby.supportsTrickplay, isFalse);
    expect(emby.supportsSkipSegments, isTrue);
    expect(emby.supportsBifTrickplay, isTrue);

    for (final type in [ServerType.jellyfin, ServerType.emby]) {
      final f = _for(type);
      expect(f.supportsLiveTv, isTrue, reason: '$type');
      expect(f.supportsMusic, isTrue, reason: '$type');
      expect(f.supportsPlaylists, isTrue, reason: '$type');
      expect(f.supportsMoonfinPlugin, isTrue, reason: '$type');
      expect(f.supportsProfiles, isFalse, reason: '$type');
    }
  });

  test('Silo enables what it serves and hides what it never will', () {
    final silo = _for(ServerType.silo);
    expect(silo.supportsTrickplay, isTrue);
    expect(silo.supportsMediaSegments, isTrue);
    expect(silo.supportsSkipSegments, isTrue);
    expect(silo.supportsProfiles, isTrue);
    // Comes on with Silo sign-in.
    expect(silo.supportsQuickConnect, isFalse);

    expect(silo.supportsSyncPlay, isFalse);
    expect(silo.supportsBifTrickplay, isFalse);
    expect(silo.supportsLyrics, isFalse);
    expect(silo.supportsLiveTv, isFalse);
    expect(silo.supportsMusic, isFalse);
    expect(silo.supportsPlaylists, isFalse);
    expect(silo.supportsInstantMix, isFalse);
    expect(silo.supportsAdmin, isFalse);
    expect(silo.supportsMoonfinPlugin, isFalse);
  });
}
