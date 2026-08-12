import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../data/offline/connectivity_aware_media_server_client.dart';
import '../data/services/media_server_client_factory.dart';

/// Measures what the link to the active server can carry, so an Auto bitrate
/// setting means a measured ceiling instead of none at all. Left uncapped the
/// server is asked for the highest quality it can encode, which makes every
/// remote transcode the heaviest job the machine can produce.
///
/// Jellyfin and Emby both serve a throwaway body from BitrateTest, and the
/// time it takes to arrive gives bits per second.
class AutoBitrateService {
  AutoBitrateService(this._clientFactory);

  final MediaServerClientFactory _clientFactory;

  static const _testBytes = 2500000;
  static const _requestTimeout = Duration(seconds: 8);
  static const _cacheLifetime = Duration(minutes: 15);

  /// Leaves room under what the link actually managed, since a stream has to
  /// share it with everything else the device is doing.
  static const _safetyFactor = 0.8;

  final _cache = <String, ({int bps, DateTime measuredAt})>{};
  final _inFlight = <String, Future<int?>>{};

  /// Bits per second the active server can deliver, or null when nothing
  /// could be measured, which leaves the request uncapped as before.
  Future<int?> measuredBpsForActiveServer() {
    if (_clientFactory.clients.isEmpty) return Future.value(null);
    // Offline playback would otherwise wait out the probe's timeout before
    // the local file starts.
    if (shouldUseOfflineCatalog()) return Future.value(null);
    final client = _clientFactory.getActiveClient();

    final key = client.baseUrl;
    final cached = _cache[key];
    if (cached != null &&
        DateTime.now().difference(cached.measuredAt) < _cacheLifetime) {
      return Future.value(cached.bps);
    }

    // One measurement per server at a time, so a burst of plays does not
    // spend the link on its own tests.
    return _inFlight[key] ??= _measure(client).whenComplete(() {
      _inFlight.remove(key);
    });
  }

  Future<int?> _measure(MediaServerClient client) async {
    final base = client.baseUrl.endsWith('/')
        ? client.baseUrl.substring(0, client.baseUrl.length - 1)
        : client.baseUrl;

    final dio = Dio(
      BaseOptions(
        responseType: ResponseType.bytes,
        receiveTimeout: _requestTimeout,
        connectTimeout: _requestTimeout,
        // Both server types accept this one, so the measurement does not need
        // to know which it is talking to.
        headers: {'X-Emby-Token': client.accessToken ?? ''},
      ),
    );

    try {
      final stopwatch = Stopwatch()..start();
      final response = await dio.get<List<int>>(
        '$base/Playback/BitrateTest?size=$_testBytes',
      );
      stopwatch.stop();

      final bytes = response.data?.length ?? 0;
      final seconds = stopwatch.elapsedMicroseconds / 1000000;
      // A body that arrived short measures the server giving up, not the link.
      if (bytes < _testBytes ~/ 4 || seconds <= 0) return null;

      final bps = (bytes * 8 / seconds * _safetyFactor).round();
      _cache[client.baseUrl] = (bps: bps, measuredAt: DateTime.now());
      return bps;
    } catch (_) {
      return null;
    } finally {
      dio.close();
    }
  }
}
