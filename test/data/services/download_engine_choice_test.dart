import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/download_quality.dart';
import 'package:moonfin/data/services/download_service.dart';
import 'package:server_core/server_core.dart';

/// Tests for the per-download engine choice. Android must keep transcoded
/// downloads on the in-process engines, the only ones that hold a foreground
/// notification for a chunked response the native engine cannot measure.
void main() {
  bool choose({
    required bool isAndroid,
    required DownloadQuality quality,
    bool pluginEngineSupported = true,
    bool serverNeedsLegacyTls = false,
    bool hasProxy = false,
    bool destinationOnRemovableStorage = false,
  }) {
    return downloadUsesPluginEngine(
      pluginEngineSupported: pluginEngineSupported,
      serverNeedsLegacyTls: serverNeedsLegacyTls,
      hasProxy: hasProxy,
      isAndroid: isAndroid,
      qualityTranscoded: quality.isTranscoded,
      destinationOnRemovableStorage: destinationOnRemovableStorage,
    );
  }

  test('Android runs original quality on the native engine', () {
    expect(choose(isAndroid: true, quality: DownloadQuality.original), isTrue);
  });

  test('Android keeps every transcoded quality off the native engine', () {
    for (final quality in DownloadQuality.values.where((q) => q.isTranscoded)) {
      expect(choose(isAndroid: true, quality: quality), isFalse);
    }
  });

  test('other platforms still run transcoded downloads natively', () {
    expect(
      choose(isAndroid: false, quality: DownloadQuality.high1080p),
      isTrue,
    );
  });

  test('a server that refused the native TLS handshake stays on legacy', () {
    expect(
      choose(
        isAndroid: true,
        quality: DownloadQuality.original,
        serverNeedsLegacyTls: true,
      ),
      isFalse,
    );
  });

  test('a configured proxy keeps every download on the legacy engine', () {
    for (final quality in DownloadQuality.values) {
      expect(
        choose(isAndroid: true, quality: quality, hasProxy: true),
        isFalse,
      );
      expect(
        choose(isAndroid: false, quality: quality, hasProxy: true),
        isFalse,
      );
    }
  });

  test('an unsupported platform or missing coordinator stays on legacy', () {
    expect(
      choose(
        isAndroid: true,
        quality: DownloadQuality.original,
        pluginEngineSupported: false,
      ),
      isFalse,
    );
  });

  test(
    'a removable destination stays on legacy so the finalizing move is not a '
    'cross-volume copy',
    () {
      expect(
        choose(
          isAndroid: false,
          quality: DownloadQuality.original,
          destinationOnRemovableStorage: true,
        ),
        isFalse,
      );
      expect(
        choose(
          isAndroid: true,
          quality: DownloadQuality.original,
          destinationOnRemovableStorage: true,
        ),
        isFalse,
      );
    },
  );

  group('transmux engine choice', () {
    bool chooseTransmux({
      bool isAndroid = true,
      required DownloadQuality quality,
      bool itemSupportsTranscodedDownload = true,
      bool serverNeedsLegacyTls = false,
      bool hasProxy = false,
    }) {
      return downloadUsesTransmuxEngine(
        isAndroid: isAndroid,
        qualityTranscoded: quality.isTranscoded,
        itemSupportsTranscodedDownload: itemSupportsTranscodedDownload,
        serverNeedsLegacyTls: serverNeedsLegacyTls,
        hasProxy: hasProxy,
      );
    }

    test('every transcoded quality transmuxes on Android', () {
      for (final quality in DownloadQuality.values.where(
        (q) => q.isTranscoded,
      )) {
        expect(chooseTransmux(quality: quality), isTrue);
      }
    });

    test('original quality already carries a seek index and skips it', () {
      expect(chooseTransmux(quality: DownloadQuality.original), isFalse);
    });

    test('only Android has the native transmux side', () {
      expect(
        chooseTransmux(isAndroid: false, quality: DownloadQuality.high1080p),
        isFalse,
      );
    });

    test('an item type without transcoded downloads skips it', () {
      expect(
        chooseTransmux(
          quality: DownloadQuality.high1080p,
          itemSupportsTranscodedDownload: false,
        ),
        isFalse,
      );
    });

    test('a server that refused the native TLS handshake skips it', () {
      expect(
        chooseTransmux(
          quality: DownloadQuality.high1080p,
          serverNeedsLegacyTls: true,
        ),
        isFalse,
      );
    });

    test(
      'a configured proxy skips it, since the native side cannot use it',
      () {
        expect(
          chooseTransmux(quality: DownloadQuality.high1080p, hasProxy: true),
          isFalse,
        );
      },
    );

    test('a transcoded Android download never falls to the native engine', () {
      expect(
        choose(isAndroid: true, quality: DownloadQuality.high1080p),
        isFalse,
      );
    });
  });

  group('download request headers', () {
    tearDown(resetServerNetworkOverrides);

    test('add a header saved for the download server', () {
      gServerRequestHeaders = [
        ServerRequestHeader.tryCreate(
          serverUrl: 'https://server.example',
          name: 'X-Gateway',
          value: 'token',
        )!,
      ];

      expect(
        downloadRequestHeadersFor(
          Uri.parse('https://server.example/items/1/download'),
          const {'Accept': 'application/octet-stream'},
        ),
        {'Accept': 'application/octet-stream', 'X-Gateway': 'token'},
      );
    });

    test('leave a header saved for another server alone', () {
      gServerRequestHeaders = [
        ServerRequestHeader.tryCreate(
          serverUrl: 'https://other.example',
          name: 'X-Gateway',
          value: 'token',
        )!,
      ];

      expect(
        downloadRequestHeadersFor(
          Uri.parse('https://server.example/items/1/download'),
          const {'Accept': 'application/octet-stream'},
        ),
        {'Accept': 'application/octet-stream'},
      );
    });
  });
}
