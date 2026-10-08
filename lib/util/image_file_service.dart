import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

import 'artwork_request_scheduler.dart';
import 'artwork_timing.dart';
import 'image_fetch_priority.dart';

/// How long one artwork request may take to produce headers.
///
/// Covers the connect and the wait for the first byte, not the transfer, so a
/// slow link still finishes a large backdrop.
const _headerTimeout = Duration(seconds: 20);

/// How long a transfer already under way may go without delivering anything.
const _stallTimeout = Duration(seconds: 20);

/// Fetches artwork in a way that always gives its slot back.
///
/// The stock service bounds neither the request nor the transfer, so artwork
/// that never arrives holds its slot for the life of the process and every
/// later image queues behind it. Both are bounded here.
///
/// With a [scheduler], the cache manager's own first come first served queue
/// is opened wide and the scheduler decides the order instead: by lane, then
/// newest batch first. A slot is taken at admission and given back however
/// the fetch ends, a body abandoned partway or never read included, so
/// dart:io never holds more than the scheduler admits.
///
/// dart:io hands a connection back to its pool only once the body has been
/// read, and the cache manager never reads the body of a status it rejects,
/// so those bodies are read here. So is an answer that lands after the header
/// timeout gave up on it. Left unread, each one would hold a connection for
/// good.
class BoundedImageFileService extends FileService {
  BoundedImageFileService(
    this._client, {
    int? concurrentFetches,
    this.headerTimeout = _headerTimeout,
    this.stallTimeout = _stallTimeout,
    this.scheduler,
  }) {
    if (concurrentFetches != null) this.concurrentFetches = concurrentFetches;
  }

  final http.Client _client;
  final Duration headerTimeout;
  final Duration stallTimeout;
  final ArtworkRequestScheduler? scheduler;

  @override
  Future<FileServiceResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final sent = headers == null ? null : Map<String, String>.of(headers);
    final priority = takeImageFetchPriority(sent);
    final timing = ArtworkTimings.begin(url);
    final gate = scheduler;
    if (gate != null) {
      final admission = await gate.acquire(url, priority: priority);
      timing?.admitted(
        batch: admission.batch,
        queueDepth: admission.queueDepth,
      );
    } else {
      timing?.admitted();
    }
    var released = false;
    void release() {
      if (released) return;
      released = true;
      gate?.release();
    }

    try {
      return await _send(url, sent, timing, release);
    } on TimeoutException catch (e) {
      // Already waited the full budget once, so asking again only doubles it.
      timing?.failed(e);
      ArtworkTimings.finish(timing);
      release();
      rethrow;
    } catch (_) {
      // A pooled connection the peer let go of fails here, and the failure
      // takes it out of the pool, so this one opens a fresh connection.
      // Artwork is only ever read, so asking twice changes nothing.
      try {
        return await _send(url, sent, timing, release);
      } catch (e) {
        timing?.failed(e);
        ArtworkTimings.finish(timing);
        release();
        rethrow;
      }
    }
  }

  Future<FileServiceResponse> _send(
    String url,
    Map<String, String>? headers,
    ArtworkTiming? timing,
    void Function() release,
  ) async {
    final request = http.Request('GET', Uri.parse(url));
    if (headers != null) request.headers.addAll(headers);
    // The timeout abandons only this await. The request stays with dart:io
    // and whatever it answers with later has to be read, or it holds its
    // connection for good.
    final pending = _client.send(request);
    final http.StreamedResponse response;
    try {
      response = await pending.timeout(headerTimeout);
    } on TimeoutException {
      unawaited(pending.then(_discard, onError: (Object _) {}));
      rethrow;
    }
    timing?.headers(response.statusCode);
    if (response.statusCode != 200 && response.statusCode != 202) {
      // The cache manager reads the status and the headers of these and
      // never the body, so the body is read here and a twin with an empty
      // one goes back. The record closes and the slot returns once the
      // connection is free again.
      await _discard(response);
      ArtworkTimings.finish(timing);
      release();
      return HttpGetResponse(
        http.StreamedResponse(
          const Stream<List<int>>.empty(),
          response.statusCode,
          contentLength: 0,
          headers: response.headers,
        ),
      );
    }
    return _StallBoundedResponse(
      HttpGetResponse(response),
      stallTimeout,
      timing,
      release,
    );
  }

  /// Reads a body to its end without keeping any of it. Past [stallTimeout]
  /// the read is cancelled instead, which drops the connection and frees the
  /// line the same way. Never throws.
  Future<void> _discard(http.StreamedResponse response) {
    final done = Completer<void>();
    Timer? ceiling;
    void finish() {
      if (done.isCompleted) return;
      ceiling?.cancel();
      done.complete();
    }

    final StreamSubscription<List<int>> subscription;
    try {
      subscription = response.stream.listen(
        null,
        onError: (Object _) => finish(),
        onDone: finish,
        cancelOnError: true,
      );
    } catch (_) {
      finish();
      return done.future;
    }
    ceiling = Timer(stallTimeout, () {
      unawaited(subscription.cancel().catchError((Object _) {}));
      finish();
    });
    return done.future;
  }
}

/// Reports a transfer that has stopped delivering as an error rather than
/// leaving the read waiting on bytes that are not coming, and gives the
/// scheduler slot back however the transfer ends.
class _StallBoundedResponse implements FileServiceResponse {
  _StallBoundedResponse(
    this._inner,
    this._stall, [
    this._timing,
    this._onFinished,
  ]) {
    // A body nobody ever reads would hold its slot for the life of the
    // process. The cache manager drops a response without reading it when it
    // throws on the headers, and the stall budget is already the longest a
    // live transfer may go quiet, so past that the slot is better back.
    if (_onFinished != null) _unread = Timer(_stall, _finish);
  }

  final FileServiceResponse _inner;
  final Duration _stall;
  final ArtworkTiming? _timing;
  final void Function()? _onFinished;

  Timer? _unread;
  Stream<List<int>>? _content;
  bool _finished = false;

  void _finish([Object? error]) {
    if (_finished) return;
    _finished = true;
    _unread?.cancel();
    _unread = null;
    if (error != null) _timing?.failed(error);
    ArtworkTimings.finish(_timing);
    _onFinished?.call();
  }

  @override
  Stream<List<int>> get content => _content ??= _boundedContent();

  Stream<List<int>> _boundedContent() {
    final source = _inner.content.timeout(_stall);
    final controller = StreamController<List<int>>();
    StreamSubscription<List<int>>? subscription;
    controller
      ..onListen = () {
        // The body is being read, so the unread watchdog has nothing to do.
        _unread?.cancel();
        _unread = null;
        subscription = source.listen(
          (chunk) {
            _timing?.chunk(chunk.length);
            controller.add(chunk);
          },
          onError: (Object error, StackTrace stack) {
            _finish(error);
            controller.addError(error, stack);
          },
          onDone: () {
            _finish();
            controller.close();
          },
        );
      }
      ..onPause = () {
        subscription?.pause();
      }
      ..onResume = () {
        subscription?.resume();
      }
      ..onCancel = () {
        // The download was abandoned partway, which is what a disposed image
        // widget, an eviction or a server switch does to whatever is still in
        // flight. Without this the slot never comes back and, once every slot
        // has gone that way, no image loads again.
        _finish();
        return subscription?.cancel();
      };
    return controller.stream;
  }

  @override
  int? get contentLength => _inner.contentLength;

  @override
  int get statusCode => _inner.statusCode;

  @override
  DateTime get validTill => _inner.validTill;

  @override
  String? get eTag => _inner.eTag;

  @override
  String get fileExtension => _inner.fileExtension;
}
