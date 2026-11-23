import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import '../credentials/iptv_credential_store.dart';
import '../db/iptv_database.dart';
import '../repositories/channel_repository.dart';
import 'stream_url_builder.dart';

class HealthCheckResult {
  final int channelId;
  final String channelName;
  final bool isOnline;
  final int? httpStatus;

  const HealthCheckResult({
    required this.channelId,
    required this.channelName,
    required this.isOnline,
    this.httpStatus,
  });
}

/// Probes channel stream URLs with HEAD requests to spot dead streams.
class PlaylistHealthCheckService {
  static const _timeout = Duration(seconds: 10);

  final Dio _dio;
  final IptvDatabase _db;
  final IptvCredentialStore _credentials;

  // A dead host otherwise holds its whole batch until the OS gives up on the
  // connection, well past the probe timeout.
  PlaylistHealthCheckService(this._db, this._credentials)
    : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));

  /// Live channels for a playlist, ordered and optionally capped. Testing
  /// every stream on a huge provider would fire tens of thousands of requests
  /// and likely get the user rate limited, so callers pass a [limit].
  Future<List<Channel>> loadChannelsForCheck(int playlistId, {int? limit}) {
    final query = _db.select(_db.channels)
      ..where((c) => c.playlistId.equals(playlistId) & c.isVod.equals(false))
      ..orderBy([
        (c) => OrderingTerm.asc(c.channelNumber),
        (c) => OrderingTerm.asc(c.name),
      ]);
    if (limit != null) query.limit(limit);
    return query.get();
  }

  Future<int> countLiveChannels(int playlistId) async {
    final count = _db.channels.id.count();
    final query = _db.selectOnly(_db.channels)
      ..addColumns([count])
      ..where(
        _db.channels.playlistId.equals(playlistId) &
            _db.channels.isVod.equals(false),
      );
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  /// Tests [channels] in concurrent batches, streaming each result through
  /// [onResult] so the UI can show incremental progress. [shouldContinue]
  /// lets the user stop a long run early.
  Future<void> checkChannels(
    List<Channel> channels, {
    required void Function(HealthCheckResult) onResult,
    bool Function()? shouldContinue,
    int maxConcurrent = 8,
  }) async {
    final concurrency = maxConcurrent <= 0 ? 1 : maxConcurrent;

    for (var i = 0; i < channels.length; i += concurrency) {
      if (shouldContinue != null && !shouldContinue()) return;
      final end = (i + concurrency) > channels.length
          ? channels.length
          : (i + concurrency);
      final batch = channels.sublist(i, end);
      final batchResults = await Future.wait(batch.map(_check));
      batchResults.forEach(onResult);
    }
  }

  /// Re-tests a single channel by id for the per row retry action.
  Future<HealthCheckResult?> checkChannelById(int channelId) async {
    final channel = await ChannelRepository(_db).getChannelById(channelId);
    return channel == null ? null : _check(channel);
  }

  Future<HealthCheckResult> _check(Channel channel) async {
    try {
      final url = await resolveChannelStreamUrl(
        channel,
        _credentials.getXtreamCredentials,
      );
      if (url == null) throw StateError('No credentials');
      final response = await _dio.head<void>(
        url,
        options: Options(
          receiveTimeout: _timeout,
          sendTimeout: _timeout,
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      final isOnline =
          response.statusCode != null && response.statusCode! < 400;
      return HealthCheckResult(
        channelId: channel.id,
        channelName: channel.name,
        isOnline: isOnline,
        httpStatus: response.statusCode,
      );
    } catch (_) {
      return HealthCheckResult(
        channelId: channel.id,
        channelName: channel.name,
        isOnline: false,
      );
    }
  }
}
