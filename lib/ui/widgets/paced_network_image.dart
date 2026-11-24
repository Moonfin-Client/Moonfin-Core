import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

/// A network image whose animation costs one app frame per image frame.
///
/// Flutter's own completer asks for a frame as soon as it has decoded the
/// next image frame and waits out the delay inside that frame, so every image
/// frame redraws the whole window twice. This one waits out the delay first,
/// then asks for the frame that shows it, so the animation plays at the same
/// speed for half the redraws.
@immutable
class PacedNetworkImage extends ImageProvider<PacedNetworkImage> {
  const PacedNetworkImage(this.url, {this.headers});

  final String url;
  final Map<String, String>? headers;

  @override
  Future<PacedNetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<PacedNetworkImage>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    PacedNetworkImage key,
    ImageDecoderCallback decode,
  ) {
    return PacedFrameCompleter(_loadCodec(key, decode), debugLabel: key.url);
  }

  /// How images are downloaded; tests swap in a fake.
  @visibleForTesting
  static Future<http.Response> Function(
    Uri url, {
    Map<String, String>? headers,
  })
  httpGet = http.get;

  /// Downloads in flight, by URL. One avatar is often drawn at several sizes
  /// at once (the account switcher's big one, its row, the navigation bar),
  /// each its own cache entry, and they share the download instead of asking
  /// the server for the same picture several times at the same moment. Emby
  /// answers one of several identical requests for a just-changed picture
  /// with a 404.
  static final _inFlight = <String, Future<Uint8List>>{};

  static Future<Uint8List> _download(PacedNetworkImage key) {
    final pending = _inFlight[key.url];
    if (pending != null) return pending;
    final download = _fetch(key);
    _inFlight[key.url] = download;
    // Dropped once it settles (never sooner: the callback runs later), so a
    // later load asks again.
    download.whenComplete(() => _inFlight.remove(key.url)).ignore();
    return download;
  }

  static Future<Uint8List> _fetch(PacedNetworkImage key) async {
    final uri = Uri.parse(key.url);
    final response = await httpGet(uri, headers: key.headers);
    if (response.statusCode != 200) {
      throw NetworkImageLoadException(
        statusCode: response.statusCode,
        uri: uri,
      );
    }
    if (response.bodyBytes.isEmpty) {
      throw Exception('Empty image at $uri');
    }
    return response.bodyBytes;
  }

  static Future<ui.Codec> _loadCodec(
    PacedNetworkImage key,
    ImageDecoderCallback decode,
  ) async {
    try {
      final bytes = await _download(key);
      return await decode(await ui.ImmutableBuffer.fromUint8List(bytes));
    } catch (_) {
      // ResizeImage drops a failed load from the cache itself, but used on
      // its own a failure would stay cached and never retry.
      scheduleMicrotask(() => PaintingBinding.instance.imageCache.evict(key));
      rethrow;
    }
  }

  @override
  bool operator ==(Object other) =>
      other is PacedNetworkImage && other.url == url;

  @override
  int get hashCode => url.hashCode;
}

/// Plays [codec] for [PacedNetworkImage], asking for a frame only once the
/// shown frame's delay is up.
class PacedFrameCompleter extends ImageStreamCompleter {
  PacedFrameCompleter(Future<ui.Codec> codec, {String? debugLabel}) {
    this.debugLabel = debugLabel;
    codec.then<void>(
      _handleCodecReady,
      onError: (Object error, StackTrace stack) {
        reportError(
          context: ErrorDescription('resolving an image codec'),
          exception: error,
          stack: stack,
          silent: true,
        );
      },
    );
  }

  ui.Codec? _codec;
  ui.FrameInfo? _nextFrame;
  Timer? _timer;
  bool _decoding = false;
  bool _frameCallbackScheduled = false;
  bool _disposed = false;
  int _framesShown = 0;
  Duration _shownFor = Duration.zero;
  final Stopwatch _shownAt = Stopwatch();

  void _handleCodecReady(ui.Codec codec) {
    if (_disposed) {
      codec.dispose();
      return;
    }
    _codec = codec;
    if (hasListeners) unawaited(_decodeNextFrame());
  }

  Future<void> _decodeNextFrame() async {
    final codec = _codec;
    if (codec == null || _decoding) return;
    _decoding = true;
    final ui.FrameInfo frame;
    try {
      frame = await codec.getNextFrame();
    } catch (error, stack) {
      reportError(
        context: ErrorDescription('resolving an image frame'),
        exception: error,
        stack: stack,
        silent: true,
      );
      return;
    } finally {
      _decoding = false;
    }
    if (_codec == null) {
      frame.image.dispose();
      return;
    }
    _nextFrame = frame;

    if (codec.frameCount == 1) {
      if (hasListeners) _showNextFrame();
      return;
    }
    if (_framesShown == 0) {
      _scheduleAppFrame();
      return;
    }
    final remaining = _shownFor * timeDilation - _shownAt.elapsed;
    _timer = Timer(
      remaining.isNegative ? Duration.zero : remaining,
      _scheduleAppFrame,
    );
  }

  void _scheduleAppFrame() {
    _timer = null;
    if (_frameCallbackScheduled) return;
    _frameCallbackScheduled = true;
    SchedulerBinding.instance.scheduleFrameCallback((_) {
      _frameCallbackScheduled = false;
      if (hasListeners) _showNextFrame();
    });
  }

  void _showNextFrame() {
    final frame = _nextFrame;
    final codec = _codec;
    if (frame == null || codec == null) return;
    _nextFrame = null;
    setImage(ImageInfo(image: frame.image.clone(), debugLabel: debugLabel));
    frame.image.dispose();
    _framesShown++;
    _shownFor = frame.duration;
    _shownAt
      ..reset()
      ..start();

    final completedCycles = _framesShown ~/ codec.frameCount;
    if (codec.frameCount > 1 &&
        (codec.repetitionCount == -1 ||
            completedCycles <= codec.repetitionCount)) {
      unawaited(_decodeNextFrame());
      return;
    }
    codec.dispose();
    _codec = null;
  }

  @override
  void addListener(ImageStreamListener listener) {
    final resuming = !hasListeners && _codec != null;
    super.addListener(listener);
    if (!resuming) return;
    if (_nextFrame != null) {
      _scheduleAppFrame();
    } else {
      unawaited(_decodeNextFrame());
    }
  }

  @override
  void removeListener(ImageStreamListener listener) {
    super.removeListener(listener);
    if (!hasListeners) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void onDisposed() {
    _disposed = true;
    _timer?.cancel();
    _timer = null;
    _nextFrame?.image.dispose();
    _nextFrame = null;
    _codec?.dispose();
    _codec = null;
    super.onDisposed();
  }
}
