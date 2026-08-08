import 'dart:async';
import 'package:flutter/material.dart';

import '../../../data/services/retro_artwork/retro_artwork_activity_gate.dart';
import '../../../data/services/retro_artwork/retro_artwork_transport.dart';

/// Protocol-2 artwork rendered from transport-owned compressed bytes.
///
/// This deliberately bypasses CachedNetworkImage and flutter_cache_manager:
/// [RetroArtworkTransport] owns authenticated I/O, source replacement, and
/// compressed-byte residency. Flutter's image cache only receives the bounded
/// decoded image created below.
class RetroArtworkImage extends StatefulWidget {
  const RetroArtworkImage({
    super.key,
    required this.source,
    required this.transport,
    required this.activityGate,
    required this.maxDecodeWidth,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.settleDelay = defaultSettleDelay,
    this.onLoadFinished,
    this.errorBuilder,
  });

  /// How long a card must stay on screen before it asks for its bytes.
  ///
  /// A fling, or flipping quickly through the alphabet, builds and destroys
  /// rows in far less than this, and a card that is disposed first never issues
  /// its request at all. Short enough to read as immediate when the grid comes
  /// to rest, including for artwork already in the cache.
  static const Duration defaultSettleDelay = Duration(milliseconds: 100);

  final RetroArtworkSource source;
  final RetroArtworkTransport transport;
  final RetroArtworkActivityGate activityGate;
  final int maxDecodeWidth;
  final Duration settleDelay;
  final BoxFit fit;
  final Alignment alignment;
  final VoidCallback? onLoadFinished;
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  @override
  State<RetroArtworkImage> createState() => _RetroArtworkImageState();
}

class _RetroArtworkImageState extends State<RetroArtworkImage> {
  Timer? _settleTimer;
  RetroArtworkActivityPermit? _providerPermit;
  RetroArtworkActivityPermit? _decodePermit;
  ImageProvider? _decodedProvider;
  Object? _error;
  int _epoch = 0;
  bool _rebuildQueued = false;

  @override
  void initState() {
    super.initState();
    widget.activityGate.addListener(_onGateChanged);
    // Registering the source is immediate: it makes this revision
    // authoritative and evicts a superseded one. Only the transfer waits.
    widget.transport.adoptSource(widget.source);
    _scheduleStart();
  }

  /// Defers the transfer by [RetroArtworkImage.settleDelay].
  ///
  /// The timer is unconditional -- it is cancelled only by dispose or by a
  /// replacement that reschedules it -- so a card that stays on screen always
  /// ends up loading.
  void _scheduleStart() {
    _settleTimer?.cancel();
    _settleTimer = null;
    if (widget.settleDelay <= Duration.zero) {
      _start();
      return;
    }
    _settleTimer = Timer(widget.settleDelay, () {
      _settleTimer = null;
      if (mounted) _start();
    });
  }

  @override
  void didUpdateWidget(covariant RetroArtworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activityGate != widget.activityGate) {
      oldWidget.activityGate.removeListener(_onGateChanged);
      widget.activityGate.addListener(_onGateChanged);
    }
    if (oldWidget.source != widget.source ||
        oldWidget.transport != widget.transport ||
        oldWidget.maxDecodeWidth != widget.maxDecodeWidth ||
        oldWidget.activityGate != widget.activityGate) {
      // Flutter rebuilds this State immediately after didUpdateWidget. Calling
      // setState here is redundant and is illegal when the parent is building.
      _cancelAndEvict('Artwork widget was replaced', notify: false);
      widget.transport.adoptSource(widget.source);
      _scheduleStart();
    }
  }

  void _start() {
    if (!widget.activityGate.isOpen ||
        _providerPermit != null ||
        _decodedProvider != null) {
      return;
    }
    _error = null;
    final epoch = ++_epoch;
    final permit = widget.activityGate.tryAcquire(
      RetroArtworkActivityKind.provider,
    );
    if (permit == null) return;
    _providerPermit = permit;
    permit.signal.addListener(_onCancelled);
    unawaited(_load(epoch, permit));
  }

  Future<void> _load(
    int epoch,
    RetroArtworkActivityPermit providerPermit,
  ) async {
    final result = await widget.transport.load(widget.source);
    final current =
        _isCurrent(epoch, providerPermit) && !providerPermit.signal.isCancelled;
    if (!current || result.bytes == null) {
      final failed =
          current && result.outcome == RetroArtworkLoadOutcome.failed;
      _releaseProvider();
      if (failed) {
        _fail(result.error ?? StateError('Artwork transfer failed'));
      }
      return;
    }

    final decodePermit = widget.activityGate.tryAcquire(
      RetroArtworkActivityKind.decode,
    );
    if (decodePermit == null || !_isCurrent(epoch, providerPermit)) {
      decodePermit?.dispose();
      _releaseProvider();
      return;
    }
    _decodePermit = decodePermit;
    decodePermit.signal.addListener(_onCancelled);

    // This is the Image.memory provider path written out so cancellation can
    // evict the exact decoded key, including the bounded ResizeImage wrapper.
    final provider = ResizeImage.resizeIfNeeded(
      widget.maxDecodeWidth,
      null,
      MemoryImage(result.bytes!),
    );
    if (!_isCurrent(epoch, providerPermit) || decodePermit.signal.isCancelled) {
      PaintingBinding.instance.imageCache.evict(provider);
      _releaseProvider();
      return;
    }
    if (!mounted) {
      _releaseProvider();
      return;
    }
    _releaseProvider();
    setState(() {
      _decodedProvider = provider;
    });
  }

  bool _isCurrent(int epoch, RetroArtworkActivityPermit permit) =>
      mounted &&
      epoch == _epoch &&
      identical(_providerPermit, permit) &&
      !permit.signal.isCancelled;

  void _onCancelled() {
    _cancelAndEvict('Artwork activity was cancelled');
  }

  void _onGateChanged() {
    if (!mounted) return;
    if (!widget.activityGate.isOpen) {
      _cancelAndEvict('Artwork activity was blocked');
      return;
    }
    _start();
  }

  void _cancelAndEvict(Object reason, {bool notify = true}) {
    ++_epoch;
    _releaseProvider(reason: reason);
    final decodePermit = _decodePermit;
    _decodePermit = null;
    decodePermit?.signal.removeListener(_onCancelled);
    decodePermit?.cancel(reason);
    decodePermit?.dispose();
    final provider = _decodedProvider;
    _decodedProvider = null;
    _error = null;
    if (provider != null) {
      PaintingBinding.instance.imageCache.evict(provider);
    }
    if (notify) _scheduleRebuild();
  }

  /// Cancellation can be signalled while an ancestor is building. Defer the
  /// repaint so it never marks this descendant dirty during that build pass.
  void _scheduleRebuild() {
    if (!mounted || _rebuildQueued) return;
    _rebuildQueued = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _rebuildQueued = false;
      if (mounted) setState(() {});
    });
  }

  void _releaseDecode() {
    final permit = _decodePermit;
    _decodePermit = null;
    permit?.signal.removeListener(_onCancelled);
    permit?.dispose();
  }

  void _releaseProvider({Object? reason}) {
    final permit = _providerPermit;
    _providerPermit = null;
    permit?.signal.removeListener(_onCancelled);
    if (reason != null) permit?.cancel(reason);
    permit?.dispose();
  }

  void _fail(Object error) {
    _releaseDecode();
    if (!mounted) return;
    setState(() => _error = error);
  }

  @override
  void dispose() {
    _settleTimer?.cancel();
    widget.activityGate.removeListener(_onGateChanged);
    _cancelAndEvict('Artwork widget was disposed', notify: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final error = _error;
    if (error != null) {
      return widget.errorBuilder?.call(context, error) ??
          const SizedBox.shrink();
    }
    final provider = _decodedProvider;
    if (provider == null) return const SizedBox.shrink();
    return Image(
      image: provider,
      fit: widget.fit,
      alignment: widget.alignment,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null || wasSynchronouslyLoaded) {
          _releaseDecode();
          widget.onLoadFinished?.call();
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        _releaseDecode();
        return widget.errorBuilder?.call(context, error) ??
            const SizedBox.shrink();
      },
    );
  }
}
