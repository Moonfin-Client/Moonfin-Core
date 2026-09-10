import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/download_quality.dart';
import 'package:moonfin/data/services/download_service.dart';

/// Tests for the per-download engine choice. Android TV must keep transcoded
/// downloads on the in-process legacy engine: Jellyfin transcodes are chunked
/// responses with no content length, which the native engine cancels after
/// its nine-minute WorkManager limit. Original quality downloads are finite
/// responses, so every platform — TV included — runs them natively.
void main() {
  bool choose({
    required bool isAndroidTv,
    required DownloadQuality quality,
    bool pluginEngineSupported = true,
    bool serverNeedsLegacyTls = false,
    bool destinationOnRemovableStorage = false,
  }) {
    return downloadUsesPluginEngine(
      pluginEngineSupported: pluginEngineSupported,
      serverNeedsLegacyTls: serverNeedsLegacyTls,
      isAndroidTv: isAndroidTv,
      qualityTranscoded: quality.isTranscoded,
      destinationOnRemovableStorage: destinationOnRemovableStorage,
    );
  }

  test('Android TV runs original quality on the native engine', () {
    expect(
      choose(isAndroidTv: true, quality: DownloadQuality.original),
      isTrue,
    );
  });

  test('Android TV keeps every transcoded quality on the legacy engine', () {
    for (final quality in DownloadQuality.values.where((q) => q.isTranscoded)) {
      expect(choose(isAndroidTv: true, quality: quality), isFalse);
    }
  });

  test('non-TV platforms run transcoded downloads natively as before', () {
    expect(
      choose(isAndroidTv: false, quality: DownloadQuality.high1080p),
      isTrue,
    );
  });

  test('a server that refused the native TLS handshake stays on legacy', () {
    expect(
      choose(
        isAndroidTv: false,
        quality: DownloadQuality.original,
        serverNeedsLegacyTls: true,
      ),
      isFalse,
    );
  });

  test('an unsupported platform or missing coordinator stays on legacy', () {
    expect(
      choose(
        isAndroidTv: false,
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
          isAndroidTv: false,
          quality: DownloadQuality.original,
          destinationOnRemovableStorage: true,
        ),
        isFalse,
      );
      expect(
        choose(
          isAndroidTv: true,
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
    }) {
      return downloadUsesTransmuxEngine(
        isAndroid: isAndroid,
        qualityTranscoded: quality.isTranscoded,
        itemSupportsTranscodedDownload: itemSupportsTranscodedDownload,
        serverNeedsLegacyTls: serverNeedsLegacyTls,
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

    test('the plugin engine choice is unaffected', () {
      expect(
        choose(isAndroidTv: false, quality: DownloadQuality.high1080p),
        isTrue,
      );
      expect(choose(isAndroidTv: true, quality: DownloadQuality.high1080p),
          isFalse);
    });
  });
}
