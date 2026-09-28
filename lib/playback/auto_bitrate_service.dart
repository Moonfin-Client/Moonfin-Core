import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../data/offline/connectivity_aware_media_server_client.dart';
import '../data/services/log_service.dart';
import '../data/services/media_server_client_factory.dart';

/// Measures what the link to the active server can carry, so an Auto bitrate
/// setting means a measured ceiling. A request is never left without one,
/// since Jellyfin encodes a transcode asked for with no ceiling at the
/// smallest size it knows.
///
/// Jellyfin and Emby both serve a throwaway body from BitrateTest, and the
/// time it takes to arrive gives bits per second.
class AutoBitrateService {
  AutoBitrateService(this._clientFactory);

  final MediaServerClientFactory _clientFactory;

  /// Each probe after the first runs only when the one before beat its entry
  /// in [_nextProbeAboveBps], so a slow link answers on a small body and a
  /// fast one gets a body big enough to time.
  static const _probeBytes = [500000, 1000000, 3000000];
  static const _nextProbeAboveBps = [500000, 20000000];

  static const _requestTimeout = Duration(seconds: 8);
  static const _probeBudget = Duration(seconds: 5);
  static const _cacheLifetime = Duration(minutes: 15);

  /// The ceiling the bitrate setting starts on, used when nothing could be
  /// measured.
  static const _fallbackBps = 120000000;

  /// Jellyfin reads the ceiling into a 32 bit int, and a server on the same
  /// machine measures faster than that holds.
  static const _maxBps = 2147483647;

  /// Leaves room under what the link actually managed, since a stream has to
  /// share it with everything else the device is doing.
  static const _safetyFactor = 0.8;

  final _cache = <String, ({int bps, DateTime measuredAt})>{};
  final _inFlight = <String, Future<int?>>{};

  /// Bits per second to cap the active server's streams at, or null offline
  /// or with no server, where there's nothing to cap.
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

  /// Runs [sample] over the probe sizes and returns the last rate it got, or
  /// null when the first probe failed.
  @visibleForTesting
  static Future<int?> stepThroughProbes(
    Future<int?> Function(int bytes) sample,
  ) async {
    int? bps;
    for (var i = 0; i < _probeBytes.length; i++) {
      final measured = await sample(_probeBytes[i]);
      if (measured == null) break;
      bps = measured;
      if (i < _nextProbeAboveBps.length && measured < _nextProbeAboveBps[i]) {
        break;
      }
    }
    return bps;
  }

  Future<int> _measure(MediaServerClient client) async {
    // The probe runs on its own client, so without these lines it is
    // invisible in the network log and a start waiting on it looks hung.
    final log = GetIt.instance<LogService>();
    log.log(LogCategory.playback, 'Auto bitrate: measuring');
    final base = client.baseUrl.endsWith('/')
        ? client.baseUrl.substring(0, client.baseUrl.length - 1)
        : client.baseUrl;

    final dio = Dio(
      BaseOptions(
        responseType: ResponseType.stream,
        receiveTimeout: _requestTimeout,
        connectTimeout: _requestTimeout,
        // Newer Jellyfin rejects a bare X-Emby-Token, so send the same
        // Authorization header the server clients use.
        headers: {
          'Authorization': buildServerAuthorizationHeader(
            scheme: client.serverType == ServerType.emby
                ? 'Emby'
                : 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: client.accessToken,
          ),
        },
      ),
    );

    try {
      final measured = await stepThroughProbes(
        (bytes) => _sample(dio, base, bytes, log),
      );
      if (measured == null) {
        log.log(
          LogCategory.playback,
          'Auto bitrate: nothing measured, using ${_fallbackBps}bps',
        );
        return _fallbackBps;
      }
      final bps = min((measured * _safetyFactor).round(), _maxBps);
      _cache[client.baseUrl] = (bps: bps, measuredAt: DateTime.now());
      log.log(LogCategory.playback, 'Auto bitrate: measured ${bps}bps');
      return bps;
    } finally {
      dio.close();
    }
  }

  /// Times one body from the moment its headers arrive, so the connection
  /// setup and the server's own turnaround don't count against the link.
  /// Past [_probeBudget] it stops reading and times what came.
  Future<int?> _sample(Dio dio, String base, int bytes, LogService log) async {
    try {
      final response = await dio.get<ResponseBody>(
        '$base/Playback/BitrateTest?size=$bytes',
      );
      final body = response.data;
      if (body == null) return null;

      final stopwatch = Stopwatch()..start();
      var received = 0;
      var outOfTime = false;
      await for (final chunk in body.stream.timeout(_requestTimeout)) {
        received += chunk.length;
        if (stopwatch.elapsed >= _probeBudget) {
          outOfTime = true;
          break;
        }
      }
      final seconds = stopwatch.elapsedMicroseconds / 1000000;
      // A body that ended short on its own measures the server giving up,
      // not the link.
      if (!outOfTime && received < bytes ~/ 4) return null;
      if (received == 0 || seconds <= 0) return null;
      return (received * 8 / seconds).round();
    } catch (e) {
      log.log(
        LogCategory.playback,
        'Auto bitrate: $bytes byte probe failed ($e)',
      );
      return null;
    }
  }
}
