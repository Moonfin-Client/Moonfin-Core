import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'retro_artwork_activity_gate.dart';
import 'retro_artwork_cache.dart';

enum RetroArtworkReadyState { originalReady, thumbnailReady }

class RetroArtworkLogicalKey {
  const RetroArtworkLogicalKey({
    required this.serverIdentity,
    required this.libraryId,
    required this.gameId,
    required this.role,
  });

  final String serverIdentity;
  final String libraryId;
  final String gameId;
  final String role;

  @override
  bool operator ==(Object other) =>
      other is RetroArtworkLogicalKey &&
      other.serverIdentity == serverIdentity &&
      other.libraryId == libraryId &&
      other.gameId == gameId &&
      other.role == role;

  @override
  int get hashCode => Object.hash(serverIdentity, libraryId, gameId, role);
}

/// Pending and missing descriptors deliberately have no representation here;
/// the manifest adapter must not create a source or provider for them.
class RetroArtworkSource {
  RetroArtworkSource({
    required this.serverIdentity,
    required this.libraryId,
    required this.gameId,
    required this.role,
    required this.revision,
    required this.state,
    required this.uri,
  });

  static const Set<String> _credentialQueryKeys = <String>{
    'apikey',
    'api_key',
    'token',
    'access_token',
  };

  final String serverIdentity;
  final String libraryId;
  final String gameId;
  final String role;
  final String revision;
  final RetroArtworkReadyState state;
  final Uri uri;

  static RetroArtworkSource? fromDescriptor({
    required String serverIdentity,
    required String libraryId,
    required String gameId,
    required String role,
    required GameArtworkDescriptor descriptor,
  }) {
    final revision = descriptor.revision;
    final url = descriptor.url;
    if (!descriptor.isRenderable ||
        revision == null ||
        revision.isEmpty ||
        url == null ||
        url.isEmpty) {
      return null;
    }
    final state = switch (descriptor.state) {
      'originalReady' => RetroArtworkReadyState.originalReady,
      'thumbnailReady' => RetroArtworkReadyState.thumbnailReady,
      _ => null,
    };
    if (state == null) return null;
    return RetroArtworkSource(
      serverIdentity: serverIdentity,
      libraryId: libraryId,
      gameId: gameId,
      role: role,
      revision: revision,
      state: state,
      uri: Uri.parse(url),
    );
  }

  /// Authentication query values are transport details, not source identity.
  String get identityUrl {
    final keys =
        uri.queryParametersAll.keys
            .where((key) => !_credentialQueryKeys.contains(key.toLowerCase()))
            .toList(growable: false)
          ..sort();
    final query = <String, List<String>>{
      for (final key in keys) key: uri.queryParametersAll[key]!,
    };
    return '${uri.replace(query: '')}|${Uri(queryParameters: query).query}';
  }

  RetroArtworkLogicalKey get logicalKey => RetroArtworkLogicalKey(
    serverIdentity: serverIdentity,
    libraryId: libraryId,
    gameId: gameId,
    role: role,
  );

  RetroArtworkCacheKey get cacheKey => RetroArtworkCacheKey(
    serverIdentity: serverIdentity,
    libraryId: libraryId,
    gameId: gameId,
    role: role,
    revision: revision,
  );

  @override
  bool operator ==(Object other) =>
      other is RetroArtworkSource &&
      other.logicalKey == logicalKey &&
      other.revision == revision &&
      other.state == state &&
      other.identityUrl == identityUrl;

  @override
  int get hashCode => Object.hash(logicalKey, revision, state, identityUrl);
}

abstract interface class RetroArtworkHttpClient {
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  });

  void close();
}

/// Cancellable, same-server HTTP transport for authenticated artwork assets.
class DioRetroArtworkHttpClient implements RetroArtworkHttpClient {
  /// Authenticated artwork requests must not carry credentials across an HTTP
  /// redirect. The transport accepts only an exact same-origin initial URL.
  static const bool followsRedirects = false;

  DioRetroArtworkHttpClient._(this._dio, this._serverBaseUri);

  factory DioRetroArtworkHttpClient.forServer(MediaServerClient client) {
    final baseUri = Uri.parse(client.baseUrl);
    final dio = Dio(
      BaseOptions(
        baseUrl: client.baseUrl,
        followRedirects: followsRedirects,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    configureServerDio(dio);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = buildServerAuthorizationHeader(
            scheme: client.serverType == ServerType.emby
                ? 'Emby'
                : 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: client.accessToken,
          );
          handler.next(options);
        },
      ),
    );
    return DioRetroArtworkHttpClient._(dio, baseUri);
  }

  final Dio _dio;
  final Uri _serverBaseUri;

  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) async {
    cancellation.throwIfCancelled();
    final resolved = _serverBaseUri.resolveUri(uri);
    if (!_sameOrigin(_serverBaseUri, resolved)) {
      throw ArgumentError.value(
        uri,
        'uri',
        'Retro artwork must be served by the authenticated server',
      );
    }

    final cancelToken = CancelToken();
    void cancelRequest() {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel(cancellation.reason);
      }
    }

    cancellation.addListener(cancelRequest);
    try {
      final response = await _dio.get<List<int>>(
        resolved.toString(),
        cancelToken: cancelToken,
        options: Options(responseType: ResponseType.bytes),
      );
      cancellation.throwIfCancelled();
      return Uint8List.fromList(response.data ?? const <int>[]);
    } on DioException catch (error) {
      if (CancelToken.isCancel(error) || cancellation.isCancelled) {
        throw RetroArtworkCancelledException(cancellation.reason);
      }
      rethrow;
    } finally {
      cancellation.removeListener(cancelRequest);
    }
  }

  @override
  void close() {
    _dio.close(force: true);
  }

  static bool _sameOrigin(Uri left, Uri right) =>
      left.scheme.toLowerCase() == right.scheme.toLowerCase() &&
      left.host.toLowerCase() == right.host.toLowerCase() &&
      left.port == right.port;
}

enum RetroArtworkLoadOutcome {
  cacheHit,
  downloaded,
  suppressed,
  staleSource,
  cancelled,
  failed,
}

class RetroArtworkLoadResult {
  const RetroArtworkLoadResult._(this.outcome, {this.bytes, this.error});

  const RetroArtworkLoadResult.cacheHit(Uint8List bytes)
    : this._(RetroArtworkLoadOutcome.cacheHit, bytes: bytes);
  const RetroArtworkLoadResult.downloaded(Uint8List bytes)
    : this._(RetroArtworkLoadOutcome.downloaded, bytes: bytes);
  const RetroArtworkLoadResult.suppressed()
    : this._(RetroArtworkLoadOutcome.suppressed);
  const RetroArtworkLoadResult.staleSource()
    : this._(RetroArtworkLoadOutcome.staleSource);
  const RetroArtworkLoadResult.cancelled()
    : this._(RetroArtworkLoadOutcome.cancelled);
  const RetroArtworkLoadResult.failed(Object error)
    : this._(RetroArtworkLoadOutcome.failed, error: error);

  final RetroArtworkLoadOutcome outcome;
  final Uint8List? bytes;
  final Object? error;
}

/// Bounded transfer queue and source registry for retro artwork.
class RetroArtworkTransport {
  static const int minConcurrentTransfers = 3;
  static const int maximumConcurrentTransfers = 16;
  // Server-side thumbnails are ~50KB, so the transfers are short and the cap is
  // about not opening a connection storm rather than about pacing bandwidth.
  static const int defaultMaxConcurrentTransfers = 10;

  RetroArtworkTransport({
    required RetroArtworkHttpClient httpClient,
    required RetroArtworkByteCache cache,
    required RetroArtworkActivityGate activityGate,
    this.maxConcurrentTransfers = defaultMaxConcurrentTransfers,
  }) : _httpClient = httpClient,
       _cache = cache,
       _activityGate = activityGate {
    if (maxConcurrentTransfers < minConcurrentTransfers ||
        maxConcurrentTransfers > maximumConcurrentTransfers) {
      throw ArgumentError.value(
        maxConcurrentTransfers,
        'maxConcurrentTransfers',
        'Must be between $minConcurrentTransfers and '
            '$maximumConcurrentTransfers',
      );
    }
  }

  factory RetroArtworkTransport.forServer({
    required MediaServerClient client,
    required RetroArtworkByteCache cache,
    required RetroArtworkActivityGate activityGate,
    int maxConcurrentTransfers = defaultMaxConcurrentTransfers,
  }) {
    return RetroArtworkTransport(
      httpClient: DioRetroArtworkHttpClient.forServer(client),
      cache: cache,
      activityGate: activityGate,
      maxConcurrentTransfers: maxConcurrentTransfers,
    );
  }

  final RetroArtworkHttpClient _httpClient;
  final RetroArtworkByteCache _cache;
  final RetroArtworkActivityGate _activityGate;
  final int maxConcurrentTransfers;
  final Queue<_PendingTransfer> _queue = Queue<_PendingTransfer>();
  final Map<RetroArtworkSource, _PendingTransfer> _transfers =
      <RetroArtworkSource, _PendingTransfer>{};
  final Map<RetroArtworkLogicalKey, RetroArtworkSource> _sources =
      <RetroArtworkLogicalKey, RetroArtworkSource>{};
  final Map<RetroArtworkLogicalKey, Future<void>> _sourceReplacements =
      <RetroArtworkLogicalKey, Future<void>>{};

  int _activeTransfers = 0;
  bool _disposed = false;

  int get activeTransfers => _activeTransfers;
  int get queuedTransfers => _queue.length;

  /// Makes [source] authoritative for its game/role and evicts/cancels the
  /// previous revision or readiness state before the replacement can load.
  void adoptSource(RetroArtworkSource source) {
    if (_disposed) return;
    final previous = _sources[source.logicalKey];
    if (previous == source) return;

    _sources[source.logicalKey] = source;
    if (previous != null) {
      _cancelSource(previous, 'Artwork descriptor was replaced');
      final replacement = Future<void>.sync(() async {
        await _cache.remove(previous.cacheKey);
      });
      _sourceReplacements[source.logicalKey] = replacement;
      unawaited(
        replacement.then<void>((_) {
          if (identical(_sourceReplacements[source.logicalKey], replacement)) {
            _sourceReplacements.remove(source.logicalKey);
          }
        }, onError: (Object _, StackTrace _) {}),
      );
    }
  }

  Future<RetroArtworkLoadResult> load(RetroArtworkSource source) async {
    if (_disposed || !_activityGate.isOpen) {
      return const RetroArtworkLoadResult.suppressed();
    }

    final currentSource = _sources[source.logicalKey];
    // A null currentSource is the ordinary first load for this logical key -- the system grid
    // reaches here without a prior adoptSource() -- and auto-adopting is correct: there is no
    // previous revision whose transfer needs cancelling or whose cache entry needs evicting.
    // The case that genuinely needs that bookkeeping is a DIFFERENT source already registered
    // for the key, and the else-if below is what handles it.
    if (currentSource == null) {
      adoptSource(source);
    } else if (currentSource != source) {
      return const RetroArtworkLoadResult.staleSource();
    }
    if (_sources[source.logicalKey] != source) {
      return const RetroArtworkLoadResult.staleSource();
    }
    final replacement = _sourceReplacements[source.logicalKey];
    if (replacement != null) {
      try {
        await replacement;
      } catch (error) {
        return RetroArtworkLoadResult.failed(error);
      }
    }
    if (!_activityGate.isOpen) {
      return const RetroArtworkLoadResult.suppressed();
    }

    Uint8List? cached;
    try {
      cached = await _cache.get(source.cacheKey);
    } catch (error) {
      return RetroArtworkLoadResult.failed(error);
    }
    if (_sources[source.logicalKey] != source) {
      return const RetroArtworkLoadResult.staleSource();
    }
    if (!_activityGate.isOpen) {
      return const RetroArtworkLoadResult.suppressed();
    }
    if (cached != null) {
      return RetroArtworkLoadResult.cacheHit(cached);
    }

    final existing = _transfers[source];
    if (existing != null) return existing.completer.future;

    final permit = _activityGate.tryAcquire(RetroArtworkActivityKind.transfer);
    if (permit == null) {
      return const RetroArtworkLoadResult.suppressed();
    }

    final transfer = _PendingTransfer(source, permit);
    void onCancelled() {
      if (!transfer.started) {
        _complete(transfer, const RetroArtworkLoadResult.cancelled());
      }
    }

    transfer.onCancelled = onCancelled;
    permit.signal.addListener(onCancelled);
    _transfers[source] = transfer;
    _queue.addLast(transfer);
    _drain();
    return transfer.completer.future;
  }

  void cancelAll() {
    for (final transfer in _transfers.values.toList(growable: false)) {
      transfer.permit.cancel('All artwork requests were cancelled');
    }
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    cancelAll();
    _sources.clear();
    _sourceReplacements.clear();
    _httpClient.close();
  }

  void _cancelSource(RetroArtworkSource source, Object reason) {
    final transfer = _transfers[source];
    transfer?.permit.cancel(reason);
  }

  void _drain() {
    if (_disposed) return;
    while (_activeTransfers < maxConcurrentTransfers && _queue.isNotEmpty) {
      // Newest first. A request is enqueued when a card is built and cancelled
      // when it is disposed, so the newest waiting transfer is the one most
      // likely to still be on screen; after a fling the stale entries ahead of
      // it would otherwise be served first. They are dropped by the
      // cancellation check below rather than fetched, so this only reorders
      // work -- nothing in flight is ever discarded to make room.
      final transfer = _queue.removeLast();
      if (transfer.completer.isCompleted) continue;
      if (transfer.permit.signal.isCancelled || !_activityGate.isOpen) {
        _complete(transfer, const RetroArtworkLoadResult.cancelled());
        continue;
      }
      unawaited(_run(transfer));
    }
  }

  Future<void> _run(_PendingTransfer transfer) async {
    transfer.started = true;
    _activeTransfers++;
    RetroArtworkLoadResult result;
    try {
      final bytes = await _httpClient.getBytes(
        transfer.source.uri,
        cancellation: transfer.permit.signal,
      );
      if (transfer.permit.signal.isCancelled ||
          !_activityGate.isOpen ||
          _sources[transfer.source.logicalKey] != transfer.source) {
        result = const RetroArtworkLoadResult.cancelled();
      } else {
        await _cache.put(transfer.source.cacheKey, bytes);
        result = RetroArtworkLoadResult.downloaded(bytes);
      }
    } on RetroArtworkCancelledException {
      result = const RetroArtworkLoadResult.cancelled();
    } catch (error) {
      result = transfer.permit.signal.isCancelled
          ? const RetroArtworkLoadResult.cancelled()
          : RetroArtworkLoadResult.failed(error);
    } finally {
      _activeTransfers--;
    }
    _complete(transfer, result);
    _drain();
  }

  void _complete(_PendingTransfer transfer, RetroArtworkLoadResult result) {
    if (transfer.completer.isCompleted) return;
    _queue.remove(transfer);
    _transfers.remove(transfer.source);
    final onCancelled = transfer.onCancelled;
    if (onCancelled != null) {
      transfer.permit.signal.removeListener(onCancelled);
    }
    transfer.permit.dispose();
    transfer.completer.complete(result);
  }
}

class _PendingTransfer {
  _PendingTransfer(this.source, this.permit);

  final RetroArtworkSource source;
  final RetroArtworkActivityPermit permit;
  final Completer<RetroArtworkLoadResult> completer =
      Completer<RetroArtworkLoadResult>();
  bool started = false;
  void Function()? onCancelled;
}
